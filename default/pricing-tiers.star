pricing_v1 = proto.package("pricing.v1")

# define each pricing tier, note that the plan pricing is relative to the individual plan
# all plans include base features and may include additional features
individualTier = pricing_v1.PricingTier(
    description = "Individual",
    pricing = 9.99,
    num_accounts = 1,
    features = [
        "Ad-free music listening",
        "Play anywhere - even offline",
        "On-demand playback",
    ],
    plan_url = "premium",
)

duoTier = pricing_v1.PricingTier(
    description = "Duo",
    pricing = individualTier.pricing + 3,  # the duo plan is $3 more than individual
    num_accounts = 2,
    features = [
        "2 Premium accounts for a couple under one roof",
        "Ad-free music listening, play offline, on-demand playback",
    ],
    plan_url = "duo",
)

familyTier = pricing_v1.PricingTier(
    description = "Family",
    pricing = individualTier.pricing + 6,  # the family plan is $6 more than individual
    num_accounts = 6,
    features = [
        "6 Premium accounts for family members living under one roof",
        "Block explicit music",
        "Ad-free music listening, play offline, on-demand playback",
        "Spotify Kids: a separate app made just for kids",
    ],
    copy = "For families residing at the same address.",
    plan_url = "premium-family",
)

studentTier = pricing_v1.PricingTier(
    description = "Student",
    pricing = individualTier.pricing - 5,  # the student plan is $5 less than individual
    num_accounts = 1,
    features = [
        "Hulu (With Ads) plan",
        "Ad-free music listening",
        "Play anywhere - even offline",
        "On-demand playback",
    ],
    copy = "Offer currently includes access to Hulu (With Ads) plan, subject to eligibility. Available only to students at an accredited higher education institution.",
    plan_url = "student/verify",
)

defaultTiers = [
    individualTier,
    duoTier,
    familyTier,
    studentTier,
]

# applyDiscount populates the discount_pricing field. discountPercent should be between (0,1)
def applyDiscount(tiers, discountPercent):
    assert.true(discountPercent > 0)
    assert.true(discountPercent < 1)
    discountedTiers = []
    for tier in tiers:
        discountedTier = pricing_v1.PricingTier(
            description = tier.description,
            pricing = tier.pricing,
            num_accounts = tier.num_accounts,
            features = tier.features,
        )
        discountedTier.discount_pricing = math.floor(tier.pricing * (1 - discountPercent) * 100) / 100  # round to two decimal places
        discountedTiers += [discountedTier]
    return discountedTiers

# validate pricing and num_accounts greater than 0
def validate(pricing_tiers):
    assert.true(len(pricing_tiers.tiers) > 0, "atleast 1 pricing tier is included")
    for pricing_tier in pricing_tiers.tiers:
        assert.true(pricing_tier.pricing >= 0, "pricing is less than 0")
        assert.true(pricing_tier.num_accounts >= 0, "account is less than 0")

# tests the black_friday coupon
def test_black_friday(v):
    # check discount pricing is calculated correctly
    assert.true(v.tiers[0].discount_pricing == 6.99)

result = feature(
    description = "spotify pricing tiers",
    default = pricing_v1.PricingTiers(tiers = defaultTiers),
    rules = [("coupon_code == \"BLACKFRIDAY50\"", pricing_v1.PricingTiers(tiers = applyDiscount(defaultTiers, .30)))],
    validator = validate,
    tests = [
        ({}, pricing_v1.PricingTiers(tiers = defaultTiers)),
        ({"coupon_code": "BLACKFRIDAY50"}, test_black_friday),
    ],
)

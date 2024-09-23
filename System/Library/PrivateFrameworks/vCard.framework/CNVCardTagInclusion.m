@implementation CNVCardTagInclusion

+ (id)policyWithTags:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  if (a3)
  {
    sub_1D3C29B1C();
    v3 = objc_allocWithZone((Class)type metadata accessor for CNVCardTagInclusionRestrictedPolicy());
    v4 = swift_bridgeObjectRetain();
    v5 = sub_1D3C28504(v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CNVCardTagInclusionPermissivePolicy()), sel_init);
  }
  return v5;
}

- (_TtC5vCard19CNVCardTagInclusion)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNVCardTagInclusion();
  return -[CNVCardTagInclusion init](&v3, sel_init);
}

@end

@implementation WFTableTemplateContentItemFilterParameter

- (NSDictionary)linkValueTypes
{
  void *v2;

  sub_1C17946F8();
  sub_1C15B882C(0, (unint64_t *)&unk_1EF6FA890);
  v2 = (void *)sub_1C1B0F14C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setLinkValueTypes:(id)a3
{
  uint64_t v4;
  WFTableTemplateContentItemFilterParameter *v5;

  sub_1C15B882C(0, (unint64_t *)&unk_1EF6FA890);
  v4 = sub_1C1B0F164();
  v5 = self;
  sub_1C17947A8(v4);

}

- (WFTableTemplateContentItemFilterParameter)initWithDefinition:(id)a3
{
  return (WFTableTemplateContentItemFilterParameter *)WFTableTemplateContentItemFilterParameter.init(definition:)(a3);
}

- (Class)singleStateClass
{
  sub_1C1794B90();
  return (Class)swift_getObjCClassFromMetadata();
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  WFTableTemplateContentItemFilterParameter *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1C1794C44();
  v4 = v3;

  return (WFPropertyListObject *)v4;
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

@implementation SiriAnalyticsTaggingXPCHandler

- (SiriAnalyticsTaggingXPCHandler)initWithMetastore:(id)a3
{
  return (SiriAnalyticsTaggingXPCHandler *)TaggingXPCHandler.init(metastore:)((uint64_t)a3);
}

- (id)all
{
  SiriAnalyticsTaggingXPCHandler *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1A02CCA38();

  if (v3)
  {
    sub_1A0307334();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FC58);
    sub_1A02CCD60();
    v4 = (void *)sub_1A0307748();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (SiriAnalyticsTaggingXPCHandler)init
{
  TaggingXPCHandler.init()();
}

- (void).cxx_destruct
{

}

@end

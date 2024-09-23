@implementation APPCDenylistReasonCharacteristic

- (NSArray)globalCategories
{
  return (NSArray *)sub_1B1239A44();
}

- (void)setGlobalCategories:(id)a3
{
  sub_1B1239B04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCDenylistReasonCharacteristic_globalCategories);
}

- (NSArray)globalKeywords
{
  return (NSArray *)sub_1B1239A44();
}

- (void)setGlobalKeywords:(id)a3
{
  sub_1B1239B04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCDenylistReasonCharacteristic_globalKeywords);
}

- (NSArray)campaignCategories
{
  return (NSArray *)sub_1B1239A44();
}

- (void)setCampaignCategories:(id)a3
{
  sub_1B1239B04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCDenylistReasonCharacteristic_campaignCategories);
}

- (NSArray)campaignKeywords
{
  return (NSArray *)sub_1B1239A44();
}

- (void)setCampaignKeywords:(id)a3
{
  sub_1B1239B04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCDenylistReasonCharacteristic_campaignKeywords);
}

- (APPCDenylistReasonCharacteristic)initWithGlobalCategories:(id)a3 globalKeywords:(id)a4 campaignCategories:(id)a5 campaignKeywords:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_1B1289944();
  v7 = sub_1B1289944();
  v8 = sub_1B1289944();
  v9 = sub_1B1289944();
  return (APPCDenylistReasonCharacteristic *)DenylistReasonCharacteristic.init(globalCategories:globalKeywords:campaignCategories:campaignKeywords:)(v6, v7, v8, v9);
}

- (APPCDenylistReasonCharacteristic)init
{
  APPCDenylistReasonCharacteristic *result;

  result = (APPCDenylistReasonCharacteristic *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

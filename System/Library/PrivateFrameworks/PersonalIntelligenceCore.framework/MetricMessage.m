@implementation MetricMessage

- (unsigned)dataVersion
{
  return 1;
}

- (NSString)description
{
  _TtC24PersonalIntelligenceCore13MetricMessage *v2;
  void *v3;

  v2 = self;
  sub_1C3B56790();

  v3 = (void *)sub_1C3B62C30();
  OUTLINED_FUNCTION_4_0();
  return (NSString *)OUTLINED_FUNCTION_9(v3);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  v6 = sub_1C3B62AB0();
  v8 = v7;

  swift_getObjCClassMetadata();
  v9 = (void *)sub_1C3B56A10(v6, v8, a4);
  sub_1C3B579D8(v6, v8);
  return v9;
}

- (id)serialize
{
  return sub_1C3B57174(self, (uint64_t)a2, (void (*)(void))sub_1C3B56FF4);
}

- (id)json
{
  return sub_1C3B57174(self, (uint64_t)a2, (void (*)(void))sub_1C3B57058);
}

- (_TtC24PersonalIntelligenceCore13MetricMessage)init
{
  sub_1C3B571D8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_0();
}

@end

@implementation RawUnifiedStreamMessage

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v5 = a3;
  v6 = sub_1A030728C();
  v8 = v7;

  swift_getObjCClassMetadata();
  v9 = static RawUnifiedStreamMessage.event(with:dataVersion:)(v6, v8, a4);
  sub_1A02653E8(v6, v8);
  return v9;
}

- (id)serialize
{
  _TtC13SiriAnalytics23RawUnifiedStreamMessage *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = RawUnifiedStreamMessage.serialize()();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1A0307280();
    sub_1A026CF1C(v3, v5);
  }
  return v6;
}

- (_TtC13SiriAnalytics23RawUnifiedStreamMessage)init
{
  RawUnifiedStreamMessage.init()();
}

- (void).cxx_destruct
{

}

@end

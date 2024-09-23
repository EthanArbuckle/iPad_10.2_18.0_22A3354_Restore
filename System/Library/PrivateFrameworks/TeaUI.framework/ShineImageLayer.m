@implementation ShineImageLayer

- (void)layoutSublayers
{
  _TtC5TeaUI15ShineImageLayer *v2;

  v2 = self;
  sub_1B13B200C();

}

- (_TtC5TeaUI15ShineImageLayer)init
{
  return (_TtC5TeaUI15ShineImageLayer *)sub_1B13E8F60();
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = sub_1B16B9860();
  v5 = v4;
  swift_getObjCClassMetadata();
  v6 = sub_1B13FD8B8(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_TtC5TeaUI15ShineImageLayer)initWithLayer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_1B16BA3AC();
  swift_unknownObjectRelease();
  return (_TtC5TeaUI15ShineImageLayer *)sub_1B14F96E8(v4);
}

- (_TtC5TeaUI15ShineImageLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B14F9890();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

}

@end

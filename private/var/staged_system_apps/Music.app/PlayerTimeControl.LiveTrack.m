@implementation PlayerTimeControl.LiveTrack

+ (Class)layerClass
{
  sub_10004A07C(0, &qword_1011AAD80, CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack *)sub_1002DC860(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack_erasedPercentage) = (Class)0x3FD0000000000000;
  v5 = OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack__backgroundColor;
  v6 = (void *)objc_opt_self(UIColor);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "systemFillColor");

  result = (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/PlayerTimeControl.swift", 29, 2, 452, 0);
  __break(1u);
  return result;
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack__backgroundColor));
}

- (void)setBackgroundColor:(id)a3
{
  _TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1002DD9A8(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack__backgroundColor));
}

@end

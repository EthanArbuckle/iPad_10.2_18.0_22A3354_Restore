@implementation PlayerTimeControl.LiveTrack

+ (Class)layerClass
{
  sub_4E684(0, &qword_14D84F8, CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack *)sub_665A68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack_erasedPercentage) = (Class)0x3FD0000000000000;
  v5 = OBJC_IVAR____TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack__backgroundColor;
  v6 = (void *)objc_opt_self(UIColor);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "systemFillColor");

  result = (_TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/PlayerTimeControl.swift", 40, 2, 452, 0);
  __break(1u);
  return result;
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack__backgroundColor));
}

- (void)setBackgroundColor:(id)a3
{
  _TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_666BC8(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F39LiveTrack__backgroundColor));
}

@end

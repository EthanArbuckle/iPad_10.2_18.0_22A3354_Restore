@implementation FMAccessoryPairingWithYouIndicator

- (_TtC6FindMy34FMAccessoryPairingWithYouIndicator)init
{
  return (_TtC6FindMy34FMAccessoryPairingWithYouIndicator *)sub_1001FB6D0();
}

- (_TtC6FindMy34FMAccessoryPairingWithYouIndicator)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001FC2F4();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMAccessoryPairingWithYouIndicator();
  v4 = a3;
  v5 = v8.receiver;
  -[FMAccessoryPairingWithYouIndicator layoutSublayersOfLayer:](&v8, "layoutSublayersOfLayer:", v4);
  sub_100006C5C(0, (unint64_t *)&qword_1005D7A60, NSObject_ptr);
  v6 = objc_msgSend(v5, "layer", v8.receiver, v8.super_class);
  v7 = static NSObject.== infix(_:_:)(v4, v6);

  if ((v7 & 1) != 0)
    sub_1001FBF00();

}

- (_TtC6FindMy34FMAccessoryPairingWithYouIndicator)initWithFrame:(CGRect)a3
{
  _TtC6FindMy34FMAccessoryPairingWithYouIndicator *result;

  result = (_TtC6FindMy34FMAccessoryPairingWithYouIndicator *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryPairingWithYouIndicator", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryPairingWithYouIndicator_foregroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryPairingWithYouIndicator_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryPairingWithYouIndicator_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryPairingWithYouIndicator_animationGroup));
}

@end

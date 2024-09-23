@implementation NavigationBarBackgroundView

- (_TtC5Music27NavigationBarBackgroundView)initWithCoder:(id)a3
{
  id v4;
  _TtC5Music27NavigationBarBackgroundView *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Music27NavigationBarBackgroundView_shouldUseTraitCollectionGroupName) = 1;
  v4 = a3;

  result = (_TtC5Music27NavigationBarBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/NavigationController.swift", 32, 2, 718, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSString v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v8.receiver;
  -[NavigationBarBackgroundView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  if (*((_BYTE *)v5 + OBJC_IVAR____TtC5Music27NavigationBarBackgroundView_shouldUseTraitCollectionGroupName) == 1)
  {
    v6 = objc_msgSend(v5, "traitCollection", v8.receiver, v8.super_class);
    UITraitCollection.navigationBarBackdropGroupName.getter();

    v7 = String._bridgeToObjectiveC()();
    objc_msgSend(v5, "_setGroupName:", v7, swift_bridgeObjectRelease().n128_f64[0]);

    v4 = v5;
    v5 = v7;
  }

}

- (void)_setFrame:(CGRect)a3 forceUpdateBackgroundImage:(BOOL)a4
{
  -[NavigationBarBackgroundView setFrame:](self, "setFrame:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music27NavigationBarBackgroundView)initWithEffect:(id)a3
{
  id v3;
  _TtC5Music27NavigationBarBackgroundView *result;

  v3 = a3;
  result = (_TtC5Music27NavigationBarBackgroundView *)_swift_stdlib_reportUnimplementedInitializer("Music.NavigationBarBackgroundView", 33, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

@end

@implementation NavigationBarBackgroundView

- (_TtC16MusicApplication27NavigationBarBackgroundView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication27NavigationBarBackgroundView *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication27NavigationBarBackgroundView_shouldUseTraitCollectionGroupName) = 1;
  v4 = a3;

  result = (_TtC16MusicApplication27NavigationBarBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/NavigationController.swift", 43, 2, 718, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v10.receiver;
  -[NavigationBarBackgroundView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  if (*((_BYTE *)v5 + OBJC_IVAR____TtC16MusicApplication27NavigationBarBackgroundView_shouldUseTraitCollectionGroupName) == 1)
  {
    v6 = objc_msgSend(v5, "traitCollection", v10.receiver, v10.super_class);
    UITraitCollection.navigationBarBackdropGroupName.getter();
    v8 = v7;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);

    objc_msgSend(v5, "_setGroupName:", v9);
    v4 = v5;
    v5 = v9;
  }

}

- (void)_setFrame:(CGRect)a3 forceUpdateBackgroundImage:(BOOL)a4
{
  -[NavigationBarBackgroundView setFrame:](self, "setFrame:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication27NavigationBarBackgroundView)initWithEffect:(id)a3
{
  id v3;
  _TtC16MusicApplication27NavigationBarBackgroundView *result;

  v3 = a3;
  result = (_TtC16MusicApplication27NavigationBarBackgroundView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.NavigationBarBackgroundView", 44, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

@end

@implementation NavigationBarBackgroundView

- (_TtC12NowPlayingUI27NavigationBarBackgroundView)initWithCoder:(id)a3
{
  id v4;
  _TtC12NowPlayingUI27NavigationBarBackgroundView *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI27NavigationBarBackgroundView_shouldUseTraitCollectionGroupName) = 1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI27NavigationBarBackgroundView_appearanceStorage) = 0;
  v4 = a3;

  result = (_TtC12NowPlayingUI27NavigationBarBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000183FF0, "NowPlayingUI/NavigationController.swift", 39, 2, 30, 0);
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
  v10.super_class = (Class)swift_getObjectType(self);
  v4 = a3;
  v5 = v10.receiver;
  -[NavigationBarBackgroundView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  if (*((_BYTE *)v5 + OBJC_IVAR____TtC12NowPlayingUI27NavigationBarBackgroundView_shouldUseTraitCollectionGroupName) == 1)
  {
    v6 = objc_msgSend(v5, "traitCollection", v10.receiver, v10.super_class);
    UITraitCollection.navigationBarBackdropGroupName.getter();
    v8 = v7;

    v9 = String._bridgeToObjectiveC()();
    objc_msgSend(v5, "_setGroupName:", v9, swift_bridgeObjectRelease(v8).n128_f64[0]);

    v4 = v5;
    v5 = v9;
  }

}

- (void)_setFrame:(CGRect)a3 forceUpdateBackgroundImage:(BOOL)a4
{
  -[NavigationBarBackgroundView setFrame:](self, "setFrame:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI27NavigationBarBackgroundView)initWithEffect:(id)a3
{
  id v3;
  _TtC12NowPlayingUI27NavigationBarBackgroundView *result;

  v3 = a3;
  result = (_TtC12NowPlayingUI27NavigationBarBackgroundView *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.NavigationBarBackgroundView", 40, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC12NowPlayingUI27NavigationBarBackgroundView_appearanceStorage));
}

@end

@implementation NowPlayingContentView

- (_TtC5Music21NowPlayingContentView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music21NowPlayingContentView *)sub_10067772C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  v5 = a3;
  -[NowPlayingContentView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  if (!v5 || v7 != objc_msgSend(v5, "userInterfaceStyle"))
    objc_msgSend(v4, "setNeedsLayout");

}

- (_TtC5Music21NowPlayingContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10067C128();
}

- (void)layoutSubviews
{
  _TtC5Music21NowPlayingContentView *v2;

  v2 = self;
  sub_100677FF4();

}

- (void)didMoveToWindow
{
  _TtC5Music21NowPlayingContentView *v2;

  v2 = self;
  sub_1006791E4();

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  objc_class *ObjectType;
  void *v6;
  _TtC5Music21NowPlayingContentView *v7;
  NSString v8;
  _TtC5Music21NowPlayingContentView *v9;
  unsigned int v10;
  BOOL result;
  Swift::Bool v12;
  Swift::String v13;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v6;
    v7 = self;
    v8 = String._bridgeToObjectiveC()();
  }
  else
  {
    v9 = self;
    v8 = 0;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v10 = -[NowPlayingContentView _shouldAnimatePropertyWithKey:](&v14, "_shouldAnimatePropertyWithKey:", v8);

  if (v10)
  {

    swift_bridgeObjectRelease(a3);
    return 1;
  }
  if (a3)
  {
    v13._countAndFlagsBits = 0x776F64616873;
    v13._object = (void *)0xE600000000000000;
    v12 = String.hasPrefix(_:)(v13);

    swift_bridgeObjectRelease(a3);
    return v12;
  }
  __break(1u);
  return result;
}

- (AVPlayerLayer)accessibilityPlayerVideoLayer
{
  _TtC5Music21NowPlayingContentView *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1006797A0();
  v4 = v3;

  return (AVPlayerLayer *)v4;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music21NowPlayingContentView_artworkDidChangeHandler), *(_QWORD *)&self->mode[OBJC_IVAR____TtC5Music21NowPlayingContentView_artworkDidChangeHandler]);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView__internalCatalog));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView_squareMotionSnapshot));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView_squareMotionKeyframeView));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21NowPlayingContentView_squareMotionContainer, &qword_1011C19A0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView_squareMotionContainerView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView_motionBackgroundSnapshot));

}

@end

@implementation NowPlayingContentView

- (_TtC12NowPlayingUI21NowPlayingContentView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI21NowPlayingContentView *)sub_F62D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI21NowPlayingContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_F8820();
}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI21NowPlayingContentView *v2;

  v2 = self;
  sub_F6BFC();

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  objc_class *ObjectType;
  void *v6;
  _TtC12NowPlayingUI21NowPlayingContentView *v7;
  NSString v8;
  _TtC12NowPlayingUI21NowPlayingContentView *v9;
  unsigned int v10;
  BOOL result;
  Swift::Bool v12;
  Swift::String v13;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self);
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
  _TtC12NowPlayingUI21NowPlayingContentView *v2;
  id v3;

  v2 = self;
  v3 = sub_F8520();

  return (AVPlayerLayer *)v3;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_videoOutput));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_videoViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_videoBinding));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_artworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_radiosityView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_borderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_placeholderImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_playerPath));
}

@end

@implementation ArtworkComponentVideoView

- (_TtC16MusicMessagesApp25ArtworkComponentVideoView)init
{
  return -[ArtworkComponentVideoView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

+ (Class)layerClass
{
  sub_10000598C(0, &qword_1004B8030, AVPlayerLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC16MusicMessagesApp25ArtworkComponentVideoView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  _QWORD *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_statusHandler);
  *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_waitingToPlayHandler);
  *v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_cropStyle) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ArtworkComponentVideoView();
  return -[ArtworkComponentVideoView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicMessagesApp25ArtworkComponentVideoView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_statusHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_waitingToPlayHandler);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_cropStyle) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ArtworkComponentVideoView();
  return -[ArtworkComponentVideoView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_statusHandler), *(_QWORD *)&self->statusHandler[OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_statusHandler]);
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_waitingToPlayHandler), *(_QWORD *)&self->statusHandler[OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_waitingToPlayHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_cropStyle));
}

@end

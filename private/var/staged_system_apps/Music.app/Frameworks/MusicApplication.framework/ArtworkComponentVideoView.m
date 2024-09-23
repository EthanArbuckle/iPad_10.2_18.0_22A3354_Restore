@implementation ArtworkComponentVideoView

- (_TtC16MusicApplication25ArtworkComponentVideoView)init
{
  return -[ArtworkComponentVideoView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

+ (Class)layerClass
{
  sub_4E684(0, &qword_14B4EA0, AVPlayerLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC16MusicApplication25ArtworkComponentVideoView)initWithFrame:(CGRect)a3
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
               + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_statusHandler);
  *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_waitingToPlayHandler);
  *v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_cropStyle) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ArtworkComponentVideoView();
  return -[ArtworkComponentVideoView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication25ArtworkComponentVideoView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC16MusicApplication25ArtworkComponentVideoView *v7;
  objc_super v9;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_statusHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_waitingToPlayHandler);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_cropStyle) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ArtworkComponentVideoView();
  v6 = a3;
  v7 = -[ArtworkComponentVideoView initWithCoder:](&v9, "initWithCoder:", v6);

  return v7;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_statusHandler), *(_QWORD *)&self->statusHandler[OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_statusHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_waitingToPlayHandler), *(_QWORD *)&self->statusHandler[OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_waitingToPlayHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_cropStyle));
}

@end

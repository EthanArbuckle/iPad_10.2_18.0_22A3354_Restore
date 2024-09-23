@implementation NowPlayingQueueRemainingSongsCell

- (_TtC16MusicApplication33NowPlayingQueueRemainingSongsCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication33NowPlayingQueueRemainingSongsCell *)sub_274A60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication33NowPlayingQueueRemainingSongsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2754D8();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtC16MusicApplication33NowPlayingQueueRemainingSongsCell_text]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33NowPlayingQueueRemainingSongsCell_label));
}

@end

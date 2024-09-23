@implementation NowPlayingQueueRemainingSongsCell

- (_TtC5Music33NowPlayingQueueRemainingSongsCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Music33NowPlayingQueueRemainingSongsCell *)sub_10023DD98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music33NowPlayingQueueRemainingSongsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10023E7E4();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtC5Music33NowPlayingQueueRemainingSongsCell_text]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music33NowPlayingQueueRemainingSongsCell_label));
}

@end

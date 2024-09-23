@implementation NowPlayingQueueRepeatCell

- (_TtC5Music25NowPlayingQueueRepeatCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Music25NowPlayingQueueRepeatCell *)sub_10023EB48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music25NowPlayingQueueRepeatCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10023F22C();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtC5Music25NowPlayingQueueRepeatCell_text]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueRepeatCell_label));
}

@end

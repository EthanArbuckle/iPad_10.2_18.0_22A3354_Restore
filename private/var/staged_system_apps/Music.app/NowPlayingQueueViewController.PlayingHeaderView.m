@implementation NowPlayingQueueViewController.PlayingHeaderView

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  char *v5;
  void (*v6)(id, __n128);
  uint64_t v7;
  __n128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_s17PlayingHeaderViewCMa();
  v4 = a3;
  v5 = (char *)v9.receiver;
  -[NowPlayingQueueViewController.PlayingHeaderView applyLayoutAttributes:](&v9, "applyLayoutAttributes:", v4);
  v6 = *(void (**)(id, __n128))&v5[OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_didUpdateAttributes];
  if (v6)
  {
    v7 = *(_QWORD *)&v5[OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_didUpdateAttributes
                      + 8];
    v8 = swift_retain();
    v6(v4, v8);
    sub_10004BA30((uint64_t)v6, v7);
  }

}

- (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView *)sub_1003FACC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_didUpdateAttributes);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/NowPlayingQueueViewController+Extras.swift", 48, 2, 43, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_didUpdateAttributes), *(_QWORD *)&self->didUpdateAttributes[OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_didUpdateAttributes]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_footer));
}

@end

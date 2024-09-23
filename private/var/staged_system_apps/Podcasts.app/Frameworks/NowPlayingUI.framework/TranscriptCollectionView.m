@implementation TranscriptCollectionView

- (_TtC12NowPlayingUI24TranscriptCollectionView)initWithCoder:(id)a3
{
  id v4;
  _TtC12NowPlayingUI24TranscriptCollectionView *result;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI24TranscriptCollectionView_mode) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24TranscriptCollectionView_subscriptions) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24TranscriptCollectionView____lazy_storage____verticalScrollIndicator) = (Class)(&dword_0 + 1);
  v4 = a3;

  result = (_TtC12NowPlayingUI24TranscriptCollectionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000183FF0, "NowPlayingUI/TranscriptCollectionView.swift", 43, 2, 31, 0);
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC12NowPlayingUI24TranscriptCollectionView *v9;
  char *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_15D830((uint64_t)a4, x, y);

  return v10;
}

- (_TtC12NowPlayingUI24TranscriptCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  _TtC12NowPlayingUI24TranscriptCollectionView *result;

  v4 = a4;
  result = (_TtC12NowPlayingUI24TranscriptCollectionView *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.TranscriptCollectionView", 37, "init(frame:collectionViewLayout:)", 33, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24TranscriptCollectionView_subscriptions));
  sub_4375C(*(id *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI24TranscriptCollectionView____lazy_storage____verticalScrollIndicator));
}

- (id)_customScrollAnimation
{
  return sub_15E144();
}

@end

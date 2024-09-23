@implementation SyncedLyricsLineView.Line.LineView

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView)initWithCoder:(id)a3
{
  id v4;
  _TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_backgroundColorLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_gradientView) = 0;
  v4 = a3;

  result = (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "MusicCoreUI/Line.swift", 22, 2, 285, 0);
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  _TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView *v2;

  v2 = self;
  sub_100BE6C2C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView *v6;

  v5 = a3;
  v6 = self;
  sub_100BE6D64((uint64_t)a3);

}

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView)initWithFrame:(CGRect)a3
{
  _TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView *result;

  result = (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.LineView", 20, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[544];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_backgroundColorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_gradientView));
  memcpy(v3, (char *)self + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_specs, 0x219uLL);
  sub_10024E458((uint64_t)v3);
}

@end

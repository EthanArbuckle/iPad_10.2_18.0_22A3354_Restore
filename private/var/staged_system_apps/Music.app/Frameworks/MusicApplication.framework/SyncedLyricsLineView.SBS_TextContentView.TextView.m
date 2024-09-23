@implementation SyncedLyricsLineView.SBS_TextContentView.TextView

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_DF4E10();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double width;
  _TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = 0.0;
  v4 = 0.0;
  if (a3.height != 0.0)
  {
    width = a3.width;
    v6 = self;
    v7 = sub_DF3084(width);
    v9 = v8;
    v3 = v7;
    v4 = v10;

  }
  v11 = v3;
  v12 = v4;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView *v2;

  v2 = self;
  sub_DF2F20();

}

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView)initWithFrame:(CGRect)a3
{
  _TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView *result;

  result = (_TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.TextView", 20, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[544];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v3, (char *)self + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView_specs, 0x219uLL);
  sub_532E70((uint64_t)v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView_framesetter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView_basicView));
}

@end

@implementation SyncedLyricsLineView

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncedLyricsLineView();
  return -[SyncedLyricsLineView isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC11MusicCoreUI20SyncedLyricsLineView *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for SyncedLyricsLineView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[SyncedLyricsLineView isHighlighted](&v9, "isHighlighted");
  v8.receiver = v6;
  v8.super_class = v5;
  -[SyncedLyricsLineView setHighlighted:](&v8, "setHighlighted:", v3);
  sub_10027C188(v7);

}

- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10027E430();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC11MusicCoreUI20SyncedLyricsLineView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10027C468(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setSelected:(BOOL)a3 animator:(id)a4
{
  id v7;
  _TtC11MusicCoreUI20SyncedLyricsLineView *v8;

  v7 = a4;
  v8 = self;
  sub_10027C668(a3, a4);

}

- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithFrame:(CGRect)a3
{
  _TtC11MusicCoreUI20SyncedLyricsLineView *result;

  result = (_TtC11MusicCoreUI20SyncedLyricsLineView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.SyncedLyricsLineView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[544];

  memcpy(v3, (char *)self + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_specs, 0x219uLL);
  sub_10026ED0C((uint64_t)v3);
  sub_10000682C((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_line));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_blurFilter));
}

@end

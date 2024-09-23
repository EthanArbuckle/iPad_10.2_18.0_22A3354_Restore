@implementation NowPlayingHistoryHeaderView

- (_TtC5Music27NowPlayingHistoryHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music27NowPlayingHistoryHeaderView *)sub_100570754(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music27NowPlayingHistoryHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _TtC5Music27NowPlayingHistoryHeaderView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_sizeCategoryObserver) = 0;
  v5 = OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_gradientView;
  v6 = objc_allocWithZone((Class)type metadata accessor for BackdropView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_10044CE0C();
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_clearButtonAction);
  *v8 = 0;
  v8[1] = 0;

  result = (_TtC5Music27NowPlayingHistoryHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/NowPlayingHistoryHeaderView.swift", 39, 2, 91, 0);
  __break(1u);
  return result;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingHistoryHeaderView();
  v4 = a3;
  v5 = v6.receiver;
  -[NowPlayingHistoryHeaderView applyLayoutAttributes:](&v6, "applyLayoutAttributes:", v4);
  objc_msgSend(v5, "setClipsToBounds:", sub_100574A18() & 1, v6.receiver, v6.super_class);

}

- (void)layoutSubviews
{
  _TtC5Music27NowPlayingHistoryHeaderView *v2;

  v2 = self;
  sub_10057159C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingHistoryHeaderView();
  v4 = a3;
  v5 = v6.receiver;
  -[NowPlayingHistoryHeaderView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_10057170C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_clearButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_gradientView));
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_clearButtonAction), *(_QWORD *)&self->clearButton[OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_clearButtonAction]);
}

@end

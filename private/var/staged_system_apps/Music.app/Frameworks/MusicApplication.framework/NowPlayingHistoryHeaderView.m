@implementation NowPlayingHistoryHeaderView

- (_TtC16MusicApplication27NowPlayingHistoryHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication27NowPlayingHistoryHeaderView *)sub_2A4B28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication27NowPlayingHistoryHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _TtC16MusicApplication27NowPlayingHistoryHeaderView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27NowPlayingHistoryHeaderView_sizeCategoryObserver) = 0;
  v5 = OBJC_IVAR____TtC16MusicApplication27NowPlayingHistoryHeaderView_gradientView;
  v6 = objc_allocWithZone((Class)type metadata accessor for BackdropView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_8E983C();
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication27NowPlayingHistoryHeaderView_clearButtonAction);
  *v8 = 0;
  v8[1] = 0;

  result = (_TtC16MusicApplication27NowPlayingHistoryHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/NowPlayingHistoryHeaderView.swift", 50, 2, 91, 0);
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
  objc_msgSend(v5, "setClipsToBounds:", sub_18DE58() & 1, v6.receiver, v6.super_class);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication27NowPlayingHistoryHeaderView *v2;

  v2 = self;
  sub_2A5984();

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
  sub_2A5AF4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27NowPlayingHistoryHeaderView_clearButton));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27NowPlayingHistoryHeaderView_sizeCategoryObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27NowPlayingHistoryHeaderView_gradientView));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27NowPlayingHistoryHeaderView_clearButtonAction), *(_QWORD *)&self->clearButton[OBJC_IVAR____TtC16MusicApplication27NowPlayingHistoryHeaderView_clearButtonAction]);
}

@end

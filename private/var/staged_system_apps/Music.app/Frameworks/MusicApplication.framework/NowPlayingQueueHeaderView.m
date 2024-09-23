@implementation NowPlayingQueueHeaderView

- (_TtC16MusicApplication25NowPlayingQueueHeaderView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication25NowPlayingQueueHeaderView *result;

  sub_54DB20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicApplication25NowPlayingQueueHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_54FFE4();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingQueueHeaderView(0);
  v4 = a3;
  v5 = v6.receiver;
  -[NowPlayingQueueHeaderView applyLayoutAttributes:](&v6, "applyLayoutAttributes:", v4);
  objc_msgSend(v5, "setClipsToBounds:", sub_18DE58() & 1, v6.receiver, v6.super_class);

}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  double MaxY;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingQueueHeaderView(0);
  v2 = (char *)v5.receiver;
  -[NowPlayingQueueHeaderView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(id *)&v2[OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_gradientView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  MaxY = CGRectGetMaxY(v6);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:", 0.0, MaxY, CGRectGetWidth(v7), 5.0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication25NowPlayingQueueHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_54F234((uint64_t)a3);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication25NowPlayingQueueHeaderView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_54F86C(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_subtitleButton));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_subtitleButtonConfiguration;
  v4 = type metadata accessor for UIButton.Configuration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_subtitleButtonConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_buttonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_autoPlayButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_clearButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->backdropView[OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_title]);
  sub_17BDC4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_playSource), *(_QWORD *)&self->backdropView[OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_playSource], *(_QWORD *)&self->gradientView[OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_playSource], *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_playSource], self->subtitleButton[OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_playSource]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_autoPlayButtonAction), *(_QWORD *)&self->backdropView[OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_autoPlayButtonAction]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_clearButtonAction), *(_QWORD *)&self->backdropView[OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_clearButtonAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_titleLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_titleLabelBottomAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingQueueHeaderView_subtitleButtonBottomAnchorConstraint));
}

@end

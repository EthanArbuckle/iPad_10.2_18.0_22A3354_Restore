@implementation NowPlayingQueueHeaderView

- (_TtC5Music25NowPlayingQueueHeaderView)initWithFrame:(CGRect)a3
{
  _TtC5Music25NowPlayingQueueHeaderView *result;

  sub_1005794B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Music25NowPlayingQueueHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10057BA24();
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
  objc_msgSend(v5, "setClipsToBounds:", sub_100574A18() & 1, v6.receiver, v6.super_class);

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
  v3 = *(id *)&v2[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_gradientView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  MaxY = CGRectGetMaxY(v6);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:", 0.0, MaxY, CGRectGetWidth(v7), 5.0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Music25NowPlayingQueueHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_10057ABB4((uint64_t)a3);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  _TtC5Music25NowPlayingQueueHeaderView *v5;
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
  sub_10057B1F4(width, height);
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
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_subtitleButton));
  v3 = (char *)self + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_subtitleButtonConfiguration;
  v4 = type metadata accessor for UIButton.Configuration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_buttonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_autoPlayButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_clearButton));
  swift_bridgeObjectRelease();
  sub_1002A4D20(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource), *(_QWORD *)&self->backdropView[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource], *(_QWORD *)&self->gradientView[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource], *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource], self->subtitleButton[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_autoPlayButtonAction), *(_QWORD *)&self->backdropView[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_autoPlayButtonAction]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_clearButtonAction), *(_QWORD *)&self->backdropView[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_clearButtonAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_titleLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_titleLabelBottomAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_subtitleButtonBottomAnchorConstraint));
}

@end

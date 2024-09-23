@implementation EpisodeUpsellBannerView

- (void)cellTapped
{
  sub_1DA52ED1C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_tapBannerBlock);
}

- (void)closeButtonTapped
{
  sub_1DA52ED1C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_tapCloseButtonBlock);
}

- (_TtC10PodcastsUI23EpisodeUpsellBannerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s10PodcastsUI23EpisodeUpsellBannerViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EpisodeUpsellBannerView();
  v2 = (char *)v9.receiver;
  -[EpisodeUpsellBannerView layoutSubviews](&v9, sel_layoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_artworkContainerView], sel_layer);
  sub_1DA52F3E8(v6);
  v4 = v7;
  v5 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v4, v5);
  objc_msgSend(v3, sel_setCornerRadius_);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC10PodcastsUI23EpisodeUpsellBannerView *v6;

  v5 = a3;
  v6 = self;
  sub_1DA5313EC(a3);

}

- (void)didHover:(id)a3
{
  id v4;
  _TtC10PodcastsUI23EpisodeUpsellBannerView *v5;

  v4 = a3;
  v5 = self;
  sub_1DA531804(v4);

}

- (id)accessibilitySubtitleLabel
{
  _TtC10PodcastsUI23EpisodeUpsellBannerView *v2;
  id v3;

  v2 = self;
  v3 = sub_1DA52E7C8();

  return v3;
}

- (_TtC10PodcastsUI23EpisodeUpsellBannerView)initWithFrame:(CGRect)a3
{
  sub_1DA531D04();
}

- (void).cxx_destruct
{
  sub_1DA4EFFCC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_tapBannerBlock));
  sub_1DA4EFFCC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_tapCloseButtonBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_artworkContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___tapBannerGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___textLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___titleLabelCenterYConstraint));
  sub_1DA532940(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___subtitleTopAnchorConstraint));
  sub_1DA532940(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___subtitleBottomConstraint));
  sub_1DA532940(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___titleTopConstraint));
  sub_1DA532960((uint64_t)self + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___config);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_hoverRecognizer));
  swift_release();
}

@end

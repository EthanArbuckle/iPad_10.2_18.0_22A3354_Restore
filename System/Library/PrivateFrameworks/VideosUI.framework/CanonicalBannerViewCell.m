@implementation CanonicalBannerViewCell

- (_TtC8VideosUI23CanonicalBannerViewCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI23CanonicalBannerViewCell *result;

  sub_1D9DD1FB4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)dealloc
{
  _TtC8VideosUI23CanonicalBannerViewCell *v2;

  v2 = self;
  sub_1D9DD233C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_titleImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_contentTitleView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_contentSubtitleView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_episodeInfoTextView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_promoTextView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_coverArtImageView);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_availabilityTextView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_availabilityImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_disclaimerTextView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_descriptionTextView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_rolesSummaryView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_tagsView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_infoTagsView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_uberBackgroundView);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_descComputationLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_tagsComputationLabel);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell____lazy_storage___pillSeparatorView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_attributionView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_transitionBackgroundView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell____lazy_storage___separatorView));
}

- (_TtC8VideosUI23CanonicalBannerViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9DD2538();
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI23CanonicalBannerViewCell *v2;

  v2 = self;
  sub_1D9DD2708();
  OUTLINED_FUNCTION_5_8(v2);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  sub_1D9DD27C4((uint64_t)self);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)vui_cellWillBeDisplayed
{
  _TtC8VideosUI23CanonicalBannerViewCell *v2;

  v2 = self;
  sub_1D9DD4DAC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (VUIImageView)accessibilityTitleImageView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9DD4F58();
  OUTLINED_FUNCTION_214();
  return (VUIImageView *)OUTLINED_FUNCTION_111(v2);
}

- (VUILabel)accessibilityContentTitleView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9DD4F9C();
  OUTLINED_FUNCTION_214();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (UIView)accessibilityContentSubtitleView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9DD4FE0();
  OUTLINED_FUNCTION_214();
  return (UIView *)OUTLINED_FUNCTION_111(v2);
}

- (VUILabel)accessibilityEpisodeInfoTextView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9DD5024();
  OUTLINED_FUNCTION_214();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (VUILabel)accessibilityPromoTextView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9C58B00();
  OUTLINED_FUNCTION_214();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (NSArray)accessibilityButtonViews
{
  uint64_t v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;
  uint64_t v4;
  void *v5;

  v3 = self;
  sub_1D9B12C60();
  OUTLINED_FUNCTION_214();
  if (!v2)
    return (NSArray *)OUTLINED_FUNCTION_111(0);
  OUTLINED_FUNCTION_236(v4, (unint64_t *)&qword_1EDA922E0);
  v5 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_79();
  return (NSArray *)OUTLINED_FUNCTION_111(v5);
}

- (VUILabel)accessibilityAvailabilityTextView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9DD50EC();
  OUTLINED_FUNCTION_214();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (VUIImageView)accessibilityAvailabilityImageView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9DD5130();
  OUTLINED_FUNCTION_214();
  return (VUIImageView *)OUTLINED_FUNCTION_111(v2);
}

- (VUILabel)accessibilityDisclaimerTextView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9B7F084();
  OUTLINED_FUNCTION_214();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (UIView)accessibilityDescriptionTextView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9DD519C();
  OUTLINED_FUNCTION_214();
  return (UIView *)OUTLINED_FUNCTION_111(v2);
}

- (_TtC8VideosUI16RolesSummaryView)accessibilityRolesSummaryView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9DD51E0();
  OUTLINED_FUNCTION_214();
  return (_TtC8VideosUI16RolesSummaryView *)OUTLINED_FUNCTION_111(v2);
}

- (VUIMediaTagsView)accessibilityTagsView
{
  void *v2;
  _TtC8VideosUI23CanonicalBannerViewCell *v3;

  v3 = self;
  sub_1D9DD5224();
  OUTLINED_FUNCTION_214();
  return (VUIMediaTagsView *)OUTLINED_FUNCTION_111(v2);
}

- (void)rentalExpirationLabelNeedsRelayout:(id)a3
{
  id v4;
  _TtC8VideosUI23CanonicalBannerViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1D9DD5240();

}

- (void)onSystemTraitCollectionDidChange:(id)a3
{
  sub_1D9DD72C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D9DD529C);
}

- (void)handleSyndicationInfoUpdatedNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8VideosUI23CanonicalBannerViewCell *v8;
  uint64_t v9;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F080();
  v8 = self;
  sub_1D9DD6CA0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_28_0();
}

- (void)handleGroupWatchActivityStateUpdatedNotification:(id)a3
{
  sub_1D9DD72C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D9DD6E8C);
}

@end

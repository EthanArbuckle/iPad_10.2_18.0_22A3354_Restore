@implementation UnifiedOverlayView

- (int64_t)styleForScorecardView:(id)a3
{
  id v3;
  int64_t result;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v3 = OUTLINED_FUNCTION_4_11();
  sub_1D9CDFB90();
  OUTLINED_FUNCTION_20_1();

  OUTLINED_FUNCTION_9();
  return result;
}

- (int64_t)numberOfRowsInScorecardView:(id)a3
{
  id v3;
  int64_t result;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v3 = OUTLINED_FUNCTION_4_11();
  sub_1D9CDFC48();
  OUTLINED_FUNCTION_20_1();

  OUTLINED_FUNCTION_9();
  return result;
}

- (int64_t)numberOfScoreValuesForScorecardView:(id)a3 inRow:(int64_t)a4
{
  id v6;
  _TtC8VideosUI18UnifiedOverlayView *v7;
  int64_t result;

  v6 = a3;
  v7 = self;
  sub_1D9CDFCC8((uint64_t)v7, a4);
  OUTLINED_FUNCTION_20_1();

  OUTLINED_FUNCTION_9();
  return result;
}

- (id)scoreValue:(id)a3 inRow:(int64_t)a4 atIndex:(int64_t)a5
{
  id v6;
  _TtC8VideosUI18UnifiedOverlayView *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  sub_1D9CDFD94();

  v8 = (void *)sub_1DA143E50();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_15_14(v8);
}

- (double)maximumWidthForScorecardView:(id)a3
{
  void *v3;
  id v4;
  id v5;
  double v6;

  v4 = OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v5 = v3;
  v6 = sub_1D9B12B6C();

  return v6;
}

- (UIEdgeInsets)marginsForRow:(int64_t)a3 atIndex:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = sub_1D9CDFEB0(a3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)backgroundImageForScorecardViewMaterial:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  sub_1D9CDFF48();
  OUTLINED_FUNCTION_20_1();

  return OUTLINED_FUNCTION_15_14(v3);
}

- (int)backgroundBlendModeForScoreValueInRow:(int64_t)a3 atIndex:(int64_t)a4
{
  _TtC8VideosUI18UnifiedOverlayView *v4;
  int v5;

  v4 = self;
  v5 = sub_1D9CDFF98();

  return v5;
}

- (VUILabel)textLabel
{
  id v2;

  sub_1D9EB59D0();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (void)setTextLabel:(id)a3
{
  void *v3;
  id v4;
  id v5;

  OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1D9EB5A30();

}

- (_TtC8VideosUI18UnifiedOverlayView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI18UnifiedOverlayView *result;

  sub_1D9EB73F4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI18UnifiedOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9EB7664();
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  void *v5;
  id v6;
  id v7;
  char v8;
  char v9;
  void *v10;

  v6 = OUTLINED_FUNCTION_54_73((uint64_t)self, (uint64_t)a2, a3, a4, a5);
  v7 = v5;
  v8 = OUTLINED_FUNCTION_65_61();
  sub_1D9EB7864(v8, v9);

  OUTLINED_FUNCTION_3_5(v10);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  void *v5;
  id v6;
  id v7;
  char v8;
  char v9;
  uint64_t v10;
  void *v11;

  v6 = OUTLINED_FUNCTION_54_73((uint64_t)self, (uint64_t)a2, a3, a4, a5);
  v7 = v5;
  v8 = OUTLINED_FUNCTION_65_61();
  sub_1D9EB78EC(v8, v9, v10);

  OUTLINED_FUNCTION_3_5(v11);
}

- (void)vui_willMoveToWindow:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v5 = v3;
  v6 = OUTLINED_FUNCTION_36_5();
  sub_1D9EB797C(v6);

  OUTLINED_FUNCTION_12_4(v7);
}

- (void)dealloc
{
  _TtC8VideosUI18UnifiedOverlayView *v2;

  v2 = self;
  sub_1D9EB7A2C();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_progressView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_appImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_logoImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_textLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_subtitleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_badgeView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_selectionGradientView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_selectionView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_textBadge);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_protectionView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_unfocusedProtectionView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_scorecardView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_legacyScorecardView);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_backgroundImageForMaterial);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_scoreboardViewModel);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_scorecardViewBackgroundImage);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_pendingOperation);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_isOperationCancelledObserver);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_isOperationFinishedObserver);
  OUTLINED_FUNCTION_10_3();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI18UnifiedOverlayView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v5 = self;
  v6 = OUTLINED_FUNCTION_21_4();
  sub_1D9EB7BD4(a4, v6, v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC8VideosUI21StyledProgressBarView)accessibilityProgressView
{
  void *v2;
  _TtC8VideosUI18UnifiedOverlayView *v3;

  v3 = self;
  sub_1D9EB8B78();
  OUTLINED_FUNCTION_214();
  return (_TtC8VideosUI21StyledProgressBarView *)OUTLINED_FUNCTION_111(v2);
}

- (VUIImageView)accessibilityAppImageView
{
  void *v2;
  _TtC8VideosUI18UnifiedOverlayView *v3;

  v3 = self;
  sub_1D9EB8BBC();
  OUTLINED_FUNCTION_214();
  return (VUIImageView *)OUTLINED_FUNCTION_111(v2);
}

- (VUIImageView)accessibilityLogoImageView
{
  void *v2;
  _TtC8VideosUI18UnifiedOverlayView *v3;

  v3 = self;
  sub_1D9EB8C00();
  OUTLINED_FUNCTION_214();
  return (VUIImageView *)OUTLINED_FUNCTION_111(v2);
}

- (VUILabel)accessibilityTextLabel
{
  void *v2;
  _TtC8VideosUI18UnifiedOverlayView *v3;

  v3 = self;
  sub_1D9EB8C44();
  OUTLINED_FUNCTION_214();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (VUILabel)accessibilitySubtitleLabel
{
  void *v2;
  _TtC8VideosUI18UnifiedOverlayView *v3;

  v3 = self;
  sub_1D9EB8C88();
  OUTLINED_FUNCTION_214();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (UIView)accessibilityBadgeView
{
  void *v2;
  _TtC8VideosUI18UnifiedOverlayView *v3;

  v3 = self;
  sub_1D9EB8CCC();
  OUTLINED_FUNCTION_214();
  return (UIView *)OUTLINED_FUNCTION_111(v2);
}

- (VUITextBadgeView)accessibilityTextBadge
{
  void *v2;
  _TtC8VideosUI18UnifiedOverlayView *v3;

  v3 = self;
  sub_1D9EB8D10();
  OUTLINED_FUNCTION_214();
  return (VUITextBadgeView *)OUTLINED_FUNCTION_111(v2);
}

- (void)textBadgeViewContentsUpdated:(id)a3
{
  id v4;
  _TtC8VideosUI18UnifiedOverlayView *v5;

  v4 = a3;
  v5 = self;
  sub_1D9DD5240();

  OUTLINED_FUNCTION_12_4(v5);
}

- (void)sampleWithImage:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v5 = v3;
  v6 = (void *)OUTLINED_FUNCTION_36_5();
  sub_1D9EB93AC(v6);

  OUTLINED_FUNCTION_12_4(v7);
}

@end

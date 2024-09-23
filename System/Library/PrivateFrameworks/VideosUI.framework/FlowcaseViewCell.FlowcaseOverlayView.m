@implementation FlowcaseViewCell.FlowcaseOverlayView

- (int64_t)styleForScorecardView:(id)a3
{
  id v3;
  int64_t result;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v3 = OUTLINED_FUNCTION_4_11();
  sub_1D9B128B4((uint64_t)v3);
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
  sub_1D9B12940();
  OUTLINED_FUNCTION_20_1();

  OUTLINED_FUNCTION_9();
  return result;
}

- (int64_t)numberOfScoreValuesForScorecardView:(id)a3 inRow:(int64_t)a4
{
  id v6;
  _TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView *v7;
  int64_t result;

  v6 = a3;
  v7 = self;
  sub_1D9B129C0((uint64_t)v7, a4);
  OUTLINED_FUNCTION_20_1();

  OUTLINED_FUNCTION_9();
  return result;
}

- (id)scoreValue:(id)a3 inRow:(int64_t)a4 atIndex:(int64_t)a5
{
  id v6;
  _TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  sub_1D9B12A88((uint64_t)v7);

  v8 = (void *)sub_1DA143E50();
  OUTLINED_FUNCTION_23();
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

  v4 = sub_1D9B12BC8(a3);
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
  sub_1D9B12C60();
  OUTLINED_FUNCTION_20_1();

  return OUTLINED_FUNCTION_15_14(v3);
}

- (int)backgroundBlendModeForScoreValueInRow:(int64_t)a3 atIndex:(int64_t)a4
{
  _TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView *v5;
  int v6;
  int v7;

  v5 = self;
  sub_1D9B12CB0(a3);
  v7 = v6;

  return v7;
}

- (_TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView)initWithFrame:(CGRect)a3
{
  _TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView *result;

  sub_1D9C594FC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C599F8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  sub_1D9C59BC8(a4, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_gradientColor);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_titleView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_badgeView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_legacyScorecardView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_scorecardView);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_scoreboardViewModel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_backgroundImageForMaterial);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_scorecardViewBackgroundImage);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_pendingOperation);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_isOperationCancelledObserver);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_isOperationFinishedObserver);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_verticalStackView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_logoImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_channelLogoView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_alphaImageView);
  sub_1D9B47F8C(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___logoGradientView));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___visualEffectContainerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___visualEffectView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_nonPlaybackGradientView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___playbackGradientView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___opacityMaskLayer));
}

- (void)sampleWithImage:(id)a3
{
  id v5;
  _TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView *v6;

  v5 = a3;
  v6 = self;
  sub_1D9C5C7E4(a3);

  OUTLINED_FUNCTION_4_3(v6);
}

@end

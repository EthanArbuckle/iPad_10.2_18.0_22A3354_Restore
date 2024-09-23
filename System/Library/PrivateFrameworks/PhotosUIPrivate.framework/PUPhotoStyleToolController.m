@implementation PUPhotoStyleToolController

- (_TtC15PhotosUIPrivate26PUPhotoStyleToolController)init
{
  return (_TtC15PhotosUIPrivate26PUPhotoStyleToolController *)sub_1AAC4A484();
}

- (_TtC15PhotosUIPrivate26PUPhotoStyleToolController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC4A804();
}

- (void)loadView
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC4AB98();

}

- (void)viewDidLoad
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC4AC78();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v4;

  v4 = self;
  sub_1AAC4B3E8(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1AAC4B474(a4, width, height);

  swift_unknownObjectRelease();
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v7;

  swift_unknownObjectRetain();
  v7 = self;
  sub_1AAC4B5F8((void *)a3, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)updateViewConstraints
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC4B708();

}

- (void)handlePadValueChangedWithSlider:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC4F030();

}

- (void)handleCastIntensitySliderValueChangedTo:(double)a3
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v3;

  v3 = self;
  sub_1AAC4F3A0();

}

- (void)castIntensityInteractionDidBegin
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC4F69C((uint64_t)v2);

}

- (void)castIntensityInteractionDidEnd
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC4F6F8();

}

- (void)handlePadDismissalWithGestureRecognizer:(id)a3
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1AAC508F0();

}

- (void)handleToggleOriginalWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC5097C(v4);

}

- (_TtC15PhotosUIPrivate26PUPhotoStyleToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB08D498();
  v5 = a4;
  sub_1AAC514D8();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_thumbnailsBaseCompositionController);
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_toolTitleLabel);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_styleLabel);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_scrubberView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_controlView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_dPad);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_expandedPadPulsingTimer);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_overlayPadPulsingTimer);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_impactGenerator);
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_castIntensitySlider);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_labelsView);
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_styleLabelWidthConstraint);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_styleLabelHeightConstraint);
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_padDismissalMediaViewGestureRecognizer);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_padDismissalToolViewGestureRecognizer);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_toggleOriginalCustomGesture);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_padRevealAnimator);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_padDismissAnimator);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_labelValueFormatter));
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  id v11;
  id v12;
  id v13;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v14;

  swift_unknownObjectRetain();
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_1AAC516E0((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease();

}

- (NSString)localizedName
{
  return (NSString *)sub_1AAC519C8(self);
}

- (UIView)centerToolbarView
{
  id v2;

  sub_1AAC51838();
  return (UIView *)v2;
}

- (NSString)toolbarIconGlyphName
{
  return (NSString *)sub_1AAC518F0(self, (uint64_t)a2, (void (*)(void))sub_1AAC5186C);
}

- (NSString)selectedToolbarIconGlyphName
{
  return (NSString *)sub_1AAC518F0(self, (uint64_t)a2, (void (*)(void))sub_1AAC51934);
}

- (NSString)toolbarIconAccessibilityLabel
{
  return (NSString *)sub_1AAC519C8(self);
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (BOOL)wantsShadowViews
{
  return 1;
}

- (BOOL)wantsFullscreen
{
  return 1;
}

- (BOOL)wantsScrubberKeyControl
{
  return 1;
}

- (void)increaseScrubberValue:(BOOL)a3
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v3;

  v3 = self;
  sub_1AAC51A88(0);

}

- (void)decreaseScrubberValue:(BOOL)a3
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v3;

  v3 = self;
  sub_1AAC51B58(0);

}

- (void)willBecomeActiveTool
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC51C08();

}

- (void)didResignActiveTool
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC51D10();

}

- (void)willBecomeEnabled
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC51D88();

}

- (BOOL)supportsGesturesOfType:(unint64_t)a3
{
  return sub_1AAC51E10(a3) & 1;
}

- (BOOL)wantsTapToToggleOriginalEnabled
{
  return sub_1AAC51E94();
}

- (int64_t)toolControllerTag
{
  return 1006;
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v4;

  if (a3)
    sub_1AB08D6FC();
  v4 = self;
  sub_1AAC51EA8();

  swift_bridgeObjectRelease();
}

- (id)disabledToolAlertTitle
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;
  void *v3;

  v2 = self;
  sub_1AAC521FC();

  v3 = (void *)sub_1AB08D468();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)shouldSlideMainToolbarOutOfScreenWhenFocusingForInteractionIfApplicable
{
  return sub_1AAC5234C();
}

- (BOOL)shouldObserveGenericFocusingViewForInteractionDelay
{
  return sub_1AAC5234C();
}

- (void)previewingOriginalDidStart
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC5237C();

}

- (void)previewingOriginalDidStop
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC523E8();

}

- (void)wheelScrubberView:(id)a3 updateCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1AAC52450();

}

- (void)wheelScrubberViewDidChangeSelectedIndex:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC52D70();

}

- (void)wheelScrubberView:(id)a3 didTapOnSelectedCellWithFrame:(CGRect)a4
{
  id v5;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC530D0();

}

- (void)wheelScrubberViewWillBeginScrolling:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC531D4((uint64_t)v5);

}

- (void)wheelScrubberViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC532A4();

}

- (void)wheelScrubberViewDidEndScrolling:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC53314();

}

- (void)wheelScrubberViewDidEndDragging:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC533D0();

}

- (int64_t)wheelScrubberViewNumberOfSections:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v5;
  int64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  sub_1AAC5343C();
  v7 = v6;

  return v7;
}

- (int64_t)wheelScrubberView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_1AAC534A8((uint64_t)v7, a4);
  v9 = v8;

  return v9;
}

- (void)reactivate
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v2;

  v2 = self;
  sub_1AAC535F8((uint64_t)v2);

}

- (void)ppt_selectWithStyle:(id)a3
{
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v4;

  sub_1AB08D498();
  v4 = self;
  sub_1AAC53690();

  swift_bridgeObjectRelease();
}

@end

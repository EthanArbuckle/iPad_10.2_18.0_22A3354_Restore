@implementation _UISliderFluidVisualElement

- (UISlider)slider
{
  return (UISlider *)(id)MEMORY[0x186DCA138]((char *)self + OBJC_IVAR____UISliderFluidVisualElement_slider, a2);
}

- (void)setSlider:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _UISliderFluidVisualElement *v8;
  id v9;

  v5 = swift_unknownObjectWeakAssign();
  v6 = MEMORY[0x186DCA138](v5);
  if (v6)
  {
    v9 = (id)v6;
    v7 = a3;
    v8 = self;
    sub_1855C9BAC(v9);

  }
}

- (UISliderDataModel)data
{
  return (UISliderDataModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____UISliderFluidVisualElement_data));
}

- (void)setData:(id)a3
{
  void *v4;
  _UISliderFluidVisualElement *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_data);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_data) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_1855CB8B0();
  sub_1855CC6A4();

}

- (BOOL)changeWithVolumeButtons
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_changeWithVolumeButtons);
}

- (void)setChangeWithVolumeButtons:(BOOL)a3
{
  uint64_t v4;
  _UISliderFluidVisualElement *v5;
  id v6;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_changeWithVolumeButtons) = a3;
  v4 = MEMORY[0x186DCA138]((char *)self + OBJC_IVAR____UISliderFluidVisualElement_slider, a2);
  if (v4)
  {
    v6 = (id)v4;
    v5 = self;
    sub_1855C9BAC(v6);
    sub_1855CB320(0);

  }
}

- (unint64_t)fluidUpdateSource
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____UISliderFluidVisualElement_fluidUpdateSource);
}

- (void)setFluidUpdateSource:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_fluidUpdateSource) = (Class)a3;
}

- (_UISliderFluidVisualElement)initWithFrame:(CGRect)a3
{
  return (_UISliderFluidVisualElement *)sub_1855C92BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UISliderFluidVisualElement)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1855CE628();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 20.0;
  result.height = v3;
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1855C9AC8(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_1855C9B10(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setFrame_);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1855C9AC8(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_1855C9B10(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setBounds_);
}

- (void)handleExpansionGesture:(id)a3
{
  id v4;
  _UISliderFluidVisualElement *v5;

  v4 = a3;
  v5 = self;
  sub_1855CA7B8(v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _UISliderFluidVisualElement *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1855CC790((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____UISliderFluidVisualElement_minimumTrackEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____UISliderFluidVisualElement_maximumTrackEffectView));

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v5;
  id v6;
  _UISliderFluidVisualElement *v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;

  v5 = MEMORY[0x186DCA138]((char *)self + OBJC_IVAR____UISliderFluidVisualElement_slider, a2);
  v6 = a3;
  v7 = self;
  objc_msgSend(v6, sel_locationInView_, v5);
  v9 = v8;
  v11 = v10;

  LOBYTE(v5) = sub_1855CC9FC(v9, v11);
  return v5 & 1;
}

- (BOOL)driver:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y;
  CGFloat x;
  _UISliderFluidVisualElement *v7;
  BOOL v8;

  y = a4.y;
  x = a4.x;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1855CC9FC(x, y);
  swift_unknownObjectRelease();

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)driver:(id)a3 shouldAdjustValueForProposedValue:(double)a4 adjustedValue:(double *)a5 startValue:(double *)a6 endValue:(double *)a7
{
  _UISliderFluidVisualElement *v12;

  swift_unknownObjectRetain();
  v12 = self;
  LOBYTE(a7) = sub_1855CE7F8(a5, a6, a7, a4);
  swift_unknownObjectRelease();

  return a7 & 1;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _UISliderFluidVisualElement *v6;

  v6 = self;
  sub_1855CCD6C(a4, a3);

}

- (void)didSetValues
{
  _UISliderFluidVisualElement *v2;

  v2 = self;
  sub_1855CCE90();

}

- (BOOL)isAnimatingValueChange
{
  return 0;
}

- (void)didPerformLayout
{
  _UISliderFluidVisualElement *v2;

  v2 = self;
  sub_1855CB320(0);

}

- (void)didUpdateTraitCollection
{
  _UISliderFluidVisualElement *v2;

  v2 = self;
  sub_1855CB8B0();

}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UISliderFluidVisualElement *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1855CD0E0(x, y, width, height);
  v10 = v9;
  v12 = v11;

  v13 = 7.0;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)didUpdateConfiguration
{
  _UISliderFluidVisualElement *v2;

  v2 = self;
  sub_1855CD354();

}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1855CD9F0(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_1855CD748);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1855CD9F0(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_1855CD89C);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)didSetMaximumValueImage
{
  _UISliderFluidVisualElement *v2;

  v2 = self;
  sub_1855CC1E4();

}

- (id)minValueImageView
{
  return sub_1855CDAB8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____UISliderFluidVisualElement_minimumView);
}

- (id)maxValueImageView
{
  return sub_1855CDAB8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____UISliderFluidVisualElement_maximumView);
}

- (void)didChangeMinimumTrackVisibleWithDuration:(double)a3
{
  _UISliderFluidVisualElement *v4;

  v4 = self;
  sub_1855CDB0C(a3);

}

- (id)minTrackView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____UISliderFluidVisualElement_minimumTrackView));
}

- (id)maxTrackView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____UISliderFluidVisualElement_maximumTrackView));
}

- (void)didSetEnabled
{
  _UISliderFluidVisualElement *v2;

  v2 = self;
  sub_1855CC6A4();

}

- (void)didSetFluidTrackHidden
{
  _UISliderFluidVisualElement *v2;

  v2 = self;
  sub_1855CDEB8();

}

- (void)didSetSpeedMultiplier
{
  _UISliderFluidVisualElement *v2;

  v2 = self;
  sub_1855CDF64();

}

- (CGRect)valueTextRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)currentMinimumTrackImage
{
  return 0;
}

- (id)currentMaximumTrackImage
{
  return 0;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (UIEdgeInsets)thumbHitEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)currentThumbImage
{
  return 0;
}

- (id)createThumbView
{
  return 0;
}

- (id)thumbView
{
  return 0;
}

- (id)thumbViewNeue
{
  return 0;
}

- (BOOL)overriddenTrackingState
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_isInteractivelyChanging);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)cancelMouseTracking
{
  return 0;
}

- (BOOL)cancelTouchTracking
{
  return 0;
}

@end

@implementation _UIActionSlider

- (_UIActionSlider)initWithFrame:(CGRect)a3 vibrantSettings:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _UIActionSlider *v11;
  _UIActionSlider *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIView *v30;
  UIView *contentView;
  UIView *v32;
  UIView *trackBackgroundView;
  void *v34;
  _UIActionSliderTrackComponentView *v35;
  UIView *trackDodgeView;
  UIView *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *trackText;
  uint64_t v42;
  UIFont *trackFont;
  _UIActionSliderKnob *v44;
  _UIActionSliderKnob *knobView;
  UIImageView *v46;
  UIImageView *knobImageView;
  UIPanGestureRecognizer *v48;
  UIPanGestureRecognizer *slideGestureRecognizer;
  void *v50;
  objc_super v52;
  CGRect v53;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v52.receiver = self;
  v52.super_class = (Class)_UIActionSlider;
  v11 = -[UIControl initWithFrame:](&v52, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[UIView setOpaque:](v11, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActionSlider setBackgroundColor:](v12, "setBackgroundColor:", v13);

    v12->_trackWidthProportion = 1.0;
    v12->_trackSize.width = 266.0;
    v12->_knobInsets.left = 3.5;
    v12->_knobInsets.right = 3.5;
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (v15
      || (+[UIScreen mainScreen](UIScreen, "mainScreen"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "_referenceBounds"),
          v17 = CGRectGetHeight(v53),
          v16,
          v17 > 480.0))
    {
      v18 = 5.0;
      v19 = 0x403F800000000000;
      v20 = 0x4052C00000000000;
      v21 = 0x4050400000000000;
    }
    else
    {
      v18 = 3.5;
      v19 = 0x403A800000000000;
      v20 = 0x4050400000000000;
      v21 = 0x404D000000000000;
    }
    *(_QWORD *)&v12->_knobWidth = v21;
    v12->_knobInsets.top = v18;
    v12->_knobInsets.bottom = v18;
    *(_QWORD *)&v12->_trackSize.height = v20;
    *(_QWORD *)&v12->_trackTextBaselineFromBottom = v19;
    objc_storeStrong((id *)&v12->_vibrantSettings, a4);
    -[UIView bounds](v12, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v22, v24, v26, v28);
    contentView = v12->_contentView;
    v12->_contentView = v30;

    -[UIView addSubview:](v12, "addSubview:", v12->_contentView);
    v32 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v23, v25, v27, v29);
    trackBackgroundView = v12->_trackBackgroundView;
    v12->_trackBackgroundView = v32;

    -[UIView layer](v12->_trackBackgroundView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAllowsGroupBlending:", 0);

    -[UIView addSubview:](v12->_contentView, "addSubview:", v12->_trackBackgroundView);
    v35 = objc_alloc_init(_UIActionSliderTrackComponentView);
    trackDodgeView = v12->_trackDodgeView;
    v12->_trackDodgeView = &v35->super;

    v37 = v12->_trackDodgeView;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.65, 1.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v37, "setBackgroundColor:", v38);

    -[UIView layer](v12->_trackDodgeView, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setCompositingFilter:", *MEMORY[0x1E0CD2BD0]);

    -[UIView addSubview:](v12->_trackBackgroundView, "addSubview:", v12->_trackDodgeView);
    v40 = objc_msgSend(&stru_1E16EDF20, "copy");
    trackText = v12->_trackText;
    v12->_trackText = (NSString *)v40;

    objc_msgSend(off_1E167A828, "systemFontOfSize:", 20.0);
    v42 = objc_claimAutoreleasedReturnValue();
    trackFont = v12->_trackFont;
    v12->_trackFont = (UIFont *)v42;

    v12->_showingTrackLabel = 1;
    v44 = objc_alloc_init(_UIActionSliderKnob);
    knobView = v12->_knobView;
    v12->_knobView = v44;

    -[UIView addSubview:](v12->_contentView, "addSubview:", v12->_knobView);
    v46 = objc_alloc_init(UIImageView);
    knobImageView = v12->_knobImageView;
    v12->_knobImageView = v46;

    -[UIView addSubview:](v12->_knobView, "addSubview:", v12->_knobImageView);
    v48 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", v12, sel__knobPanGesture_);
    slideGestureRecognizer = v12->_slideGestureRecognizer;
    v12->_slideGestureRecognizer = v48;

    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v12->_slideGestureRecognizer, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v12->_slideGestureRecognizer, "setMinimumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer _setCanPanHorizontally:](v12->_slideGestureRecognizer, "_setCanPanHorizontally:", 1);
    -[UIPanGestureRecognizer _setCanPanVertically:](v12->_slideGestureRecognizer, "_setCanPanVertically:", 0);
    -[UIPanGestureRecognizer _setHysteresis:](v12->_slideGestureRecognizer, "_setHysteresis:", 2.0);
    -[UIPanGestureRecognizer setDelegate:](v12->_slideGestureRecognizer, "setDelegate:", v12);
    -[UIView addGestureRecognizer:](v12, "addGestureRecognizer:", v12->_slideGestureRecognizer);
    -[UIView layer](v12, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setHitTestsAsOpaque:", 1);

  }
  return v12;
}

- (_UIActionSlider)initWithFrame:(CGRect)a3
{
  return -[_UIActionSlider initWithFrame:vibrantSettings:](self, "initWithFrame:vibrantSettings:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIActionSlider)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIActionSlider;
  return -[UIControl initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)setStyle:(int64_t)a3
{
  UIView **p_trackBackgroundView;
  _UIBackdropView *trackSolidView;
  _UIActionSliderTrackComponentView *v6;
  UIView *v7;
  _UIBackdropView *v8;
  _UIBackdropView *trackBlurView;

  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 2)
    {
      -[UIView removeFromSuperview](self->_trackDodgeView, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_trackBlurView, "removeFromSuperview");
      trackSolidView = (_UIBackdropView *)self->_trackSolidView;
      if (!trackSolidView)
      {
        v6 = objc_alloc_init(_UIActionSliderTrackComponentView);
        v7 = self->_trackSolidView;
        self->_trackSolidView = &v6->super;

        -[_UIActionSlider setCachedTrackMaskWidth:](self, "setCachedTrackMaskWidth:", 0.0);
        trackSolidView = (_UIBackdropView *)self->_trackSolidView;
      }
      p_trackBackgroundView = &self->_trackBackgroundView;
    }
    else if (a3 == 1)
    {
      if (!self->_trackBlurView)
      {
        v8 = -[_UIBackdropView initWithPrivateStyle:]([_UIBackdropView alloc], "initWithPrivateStyle:", 2020);
        trackBlurView = self->_trackBlurView;
        self->_trackBlurView = v8;

        -[_UIActionSlider setCachedTrackMaskWidth:](self, "setCachedTrackMaskWidth:", 0.0);
      }
      -[UIView removeFromSuperview](self->_trackDodgeView, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_trackSolidView, "removeFromSuperview");
      p_trackBackgroundView = &self->_trackBackgroundView;
      trackSolidView = self->_trackBlurView;
    }
    else
    {
      if (a3)
      {
LABEL_13:
        -[UIView setNeedsLayout](self, "setNeedsLayout");
        return;
      }
      -[UIView removeFromSuperview](self->_trackBlurView, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_trackSolidView, "removeFromSuperview");
      p_trackBackgroundView = &self->_trackBackgroundView;
      trackSolidView = (_UIBackdropView *)self->_trackDodgeView;
    }
    -[UIView insertSubview:atIndex:](*p_trackBackgroundView, "insertSubview:atIndex:", trackSolidView, 0);
    goto LABEL_13;
  }
}

- (UIBezierPath)knobMaskPath
{
  -[_UIActionSlider knobRect](self, "knobRect");
  return +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
}

- (UIImage)knobImage
{
  return -[UIImageView image](self->_knobImageView, "image");
}

- (void)setKnobImage:(id)a3
{
  -[UIImageView setImage:](self->_knobImageView, "setImage:", a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setKnobImageOffset:(CGSize)a3
{
  if (self->_knobImageOffset.width != a3.width || self->_knobImageOffset.height != a3.height)
  {
    self->_knobImageOffset = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIColor)knobColor
{
  return -[_UIActionSliderKnob knobColor](self->_knobView, "knobColor");
}

- (void)setKnobColor:(id)a3
{
  -[_UIActionSliderKnob setKnobColor:](self->_knobView, "setKnobColor:", a3);
}

- (void)setTrackText:(id)a3
{
  NSString *v4;
  NSString *trackText;

  if (self->_trackText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    trackText = self->_trackText;
    self->_trackText = v4;

    -[_UIActionSliderLabel setText:](self->_trackLabel, "setText:", self->_trackText);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTrackFont:(id)a3
{
  UIFont *v5;

  v5 = (UIFont *)a3;
  if (self->_trackFont != v5)
  {
    objc_storeStrong((id *)&self->_trackFont, a3);
    -[_UIActionSliderLabel setFont:](self->_trackLabel, "setFont:", v5);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTrackSize:(CGSize)a3
{
  if (a3.width != self->_trackSize.width || a3.height != self->_trackSize.height)
  {
    self->_trackSize = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UILabel)trackLabel
{
  _UIActionSliderLabel *trackLabel;
  id v5;

  if (-[_UIActionSlider textStyle](self, "textStyle") != 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't call -trackLabel when -textStyle is not _UIActionSliderTextStyleSolid"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  trackLabel = self->_trackLabel;
  if (!trackLabel)
  {
    -[_UIActionSlider _makeTrackLabel](self, "_makeTrackLabel");
    trackLabel = self->_trackLabel;
  }
  return (UILabel *)trackLabel;
}

- (void)setKnobPosition:(double)a3
{
  if (self->_knobPosition != a3)
  {
    self->_knobPosition = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setKnobWidth:(double)a3
{
  if (self->_knobWidth != a3)
  {
    self->_knobWidth = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setKnobInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_knobInsets.left
    || a3.top != self->_knobInsets.top
    || a3.right != self->_knobInsets.right
    || a3.bottom != self->_knobInsets.bottom)
  {
    self->_knobInsets = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)knobRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[_UIActionSlider _knobWidth](self, "_knobWidth");
  v4 = v3;
  -[_UIActionSlider _knobHorizontalPosition](self, "_knobHorizontalPosition");
  v6 = v5;
  -[_UIActionSlider _knobVerticalInset](self, "_knobVerticalInset");
  v8 = v7;
  v9 = v6;
  v10 = v4;
  v11 = v4;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (CGRect)trackTextRect
{
  int v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  unint64_t v14;
  CGRectEdge v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  double MinX;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double MaxX;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  void *v48;
  int64_t v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double Height;
  CGFloat v59;
  double v60;
  char v61;
  _UIActionSliderLabel *trackLabel;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat rect;
  double v81;
  CGFloat v82;
  CGRect slice;
  CGRect remainder;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect result;

  v3 = *((_DWORD *)&self->super.super._viewFlags + 4);
  -[_UIActionSlider _trackFrame](self, "_trackFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIActionSlider _knobWidth](self, "_knobWidth");
  v13 = v12;
  -[_UIActionSlider _knobMinXInset](self, "_knobMinXInset");
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  v14 = (*(_QWORD *)&v3 & 0x80000uLL) >> 18;
  v15 = v14 ^ 2;
  v17 = v13 + v16;
  v85.origin.x = v5;
  v85.origin.y = v7;
  v85.size.width = v9;
  v85.size.height = v11;
  rect = v11;
  CGRectDivide(v85, &slice, &remainder, v17, (CGRectEdge)v14);
  CGRectDivide(remainder, &slice, &remainder, 13.0, v15);
  -[_UIActionSliderLabel sizeThatFits:](self->_trackLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v19 = v18;
  v21 = v20;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  UIRectCenteredXInRectScale(0.0, 0.0, v19, v21, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v86.origin.x = v5;
  v86.origin.y = v7;
  v86.size.width = v9;
  v86.size.height = v11;
  v31 = CGRectGetWidth(v86) + -252.0;
  v75 = v31;
  if ((*(_QWORD *)&v3 & 0x80000) != 0)
    v32 = v31;
  else
    v32 = 86.0;
  v77 = v24;
  v79 = v26;
  v87.origin.x = v24;
  v87.origin.y = v26;
  v76 = v28;
  v87.size.width = v28;
  v81 = v30;
  v87.size.height = v30;
  v33 = v9;
  MinX = CGRectGetMinX(v87);
  v88.origin.x = v5;
  v82 = v7;
  v88.origin.y = v7;
  v88.size.width = v9;
  v88.size.height = rect;
  if (MinX - CGRectGetMinX(v88) >= v32)
  {
    v35 = v77;
  }
  else
  {
    v89.origin.x = v5;
    v89.origin.y = v7;
    v89.size.width = v9;
    v89.size.height = rect;
    v35 = v32 + CGRectGetMinX(v89);
  }
  v36 = rect;
  if ((v3 & 0x80000) != 0)
    v37 = 86.0;
  else
    v37 = v75;
  v38 = v5;
  v39 = v82;
  v40 = v33;
  MaxX = CGRectGetMaxX(*(CGRect *)(&v36 - 3));
  v90.origin.x = v35;
  v90.origin.y = v26;
  v42 = v76;
  v90.size.width = v76;
  v90.size.height = v30;
  if (MaxX - CGRectGetMaxX(v90) < v37)
  {
    v91.origin.x = v5;
    v91.origin.y = v82;
    v91.size.width = v33;
    v91.size.height = rect;
    v43 = CGRectGetMaxX(v91) - v37;
    v92.origin.x = v35;
    v92.origin.y = v79;
    v92.size.width = v76;
    v92.size.height = v30;
    v35 = v43 - CGRectGetWidth(v92);
    v42 = v76;
  }
  v93.origin.x = v35;
  v93.origin.y = v79;
  v93.size.width = v42;
  v93.size.height = v30;
  v44 = CGRectGetMinX(v93);
  v94.origin.x = v5;
  v94.origin.y = v82;
  v94.size.width = v33;
  v94.size.height = rect;
  v45 = v35;
  if (v44 - CGRectGetMinX(v94) < v32)
  {
    v46 = v42;
    v95.origin.x = v5;
    v95.origin.y = v82;
    v95.size.width = v33;
    v95.size.height = rect;
    v47 = CGRectGetMaxX(v95) - (v37 + -4.0);
    v96.origin.x = v35;
    v96.origin.y = v79;
    v96.size.width = v46;
    v96.size.height = v81;
    v45 = v47 - CGRectGetWidth(v96);
    v42 = v46;
  }
  -[_UIActionSlider trackText](self, "trackText");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[_UIActionSlider textStyle](self, "textStyle");
  -[UIView bounds](self->_trackBackgroundView, "bounds");
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  if (v49 == 1
    && (-[_UIActionSliderLabel numberOfLines](self->_trackLabel, "numberOfLines") > 1
     || !-[_UIActionSliderLabel numberOfLines](self->_trackLabel, "numberOfLines"))
    && objc_msgSend(v48, "containsString:", CFSTR("\n")))
  {
    v97.origin.x = v51;
    v97.origin.y = v53;
    v97.size.width = v55;
    v97.size.height = v57;
    Height = CGRectGetHeight(v97);
    v98.origin.x = v45;
    v98.origin.y = v79;
    v98.size.width = v42;
    v59 = v81;
    v98.size.height = v81;
    v60 = (Height - CGRectGetHeight(v98)) * 0.5;
  }
  else
  {
    v78 = v45;
    v61 = objc_opt_respondsToSelector();
    trackLabel = self->_trackLabel;
    v63 = v51;
    if ((v61 & 1) != 0)
    {
      v59 = v81;
      -[_UIActionSliderLabel baselineOffsetFromBottomWithSize:](trackLabel, "baselineOffsetFromBottomWithSize:", v42, v81);
      v65 = v64;
    }
    else
    {
      -[_UIActionSliderLabel _baselineOffsetFromBottom](trackLabel, "_baselineOffsetFromBottom");
      v65 = v66;
      v59 = v81;
    }
    -[_UIActionSlider trackTextBaselineFromBottom](self, "trackTextBaselineFromBottom");
    v68 = v67;
    v99.origin.x = v63;
    v99.origin.y = v53;
    v99.size.width = v55;
    v99.size.height = v57;
    v69 = CGRectGetHeight(v99);
    v45 = v78;
    v100.origin.y = v79;
    v100.origin.x = v78;
    v100.size.width = v42;
    v100.size.height = v59;
    v60 = v69 - (CGRectGetHeight(v100) - v65) - v68;
  }
  v70 = v60 + 0.0;

  v71 = v45;
  v72 = v70;
  v73 = v42;
  v74 = v59;
  result.size.height = v74;
  result.size.width = v73;
  result.origin.y = v72;
  result.origin.x = v71;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;
  CGRect v15;
  CGRect v16;

  width = a3.width;
  -[UIView superview](self, "superview", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    v7 = CGRectGetWidth(v15);
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v7 = CGRectGetWidth(v16);

  }
  if (width >= v7 || width <= 0.0)
    width = v7;
  -[_UIActionSlider trackSize](self, "trackSize");
  v11 = v10 + 0.0;

  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)openTrackAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  dispatch_time_t v7;
  _QWORD block[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[6];

  if (a3)
  {
    -[_UIActionSlider _hideTrackLabel:](self, "_hideTrackLabel:", 1);
    -[_UIActionSlider setAnimating:](self, "setAnimating:", 1);
    -[UIView layer](self->_trackBackgroundView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAnimations");

    -[UIView layer](self->_trackDodgeView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllAnimations");

    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37___UIActionSlider_openTrackAnimated___block_invoke;
    v11[3] = &unk_1E16B1888;
    v11[4] = self;
    v11[5] = 0x3FD3333333333333;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    v9[4] = self;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __37___UIActionSlider_openTrackAnimated___block_invoke_2;
    v10[3] = &unk_1E16B1B28;
    v10[4] = self;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __37___UIActionSlider_openTrackAnimated___block_invoke_3;
    v9[3] = &unk_1E16B3FD8;
    +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v10, v9, 0.05, 0.0);
    v7 = dispatch_time(0, 150000000);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __37___UIActionSlider_openTrackAnimated___block_invoke_4;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[_UIActionSlider setTrackWidthProportion:](self, "setTrackWidthProportion:", 1.0);
    -[_UIActionSlider _showTrackLabel](self, "_showTrackLabel");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)closeTrackAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = a3;
  -[_UIActionSlider _hideTrackLabel:](self, "_hideTrackLabel:");
  if (v3)
  {
    -[UIView layer](self->_trackBackgroundView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllAnimations");

    -[UIView layer](self->_trackDodgeView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllAnimations");

    -[_UIActionSlider setAnimating:](self, "setAnimating:", 1);
    -[_UIActionSlider updateAllTrackMasks](self, "updateAllTrackMasks");
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38___UIActionSlider_closeTrackAnimated___block_invoke;
    v8[3] = &unk_1E16B1B28;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38___UIActionSlider_closeTrackAnimated___block_invoke_2;
    v7[3] = &unk_1E16B3FD8;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v8, v7);
  }
  else
  {
    -[_UIActionSlider setTrackWidthProportion:](self, "setTrackWidthProportion:", 0.0);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_trackSolidView, "setBackgroundColor:", a3);
}

- (id)backgroundColor
{
  return -[UIView backgroundColor](self->_trackSolidView, "backgroundColor");
}

- (CGRect)_trackFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIActionSlider trackSize](self, "trackSize");
  v12 = v11;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  if (CGRectGetWidth(v17) > v12)
  {
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    v4 = v4 + (CGRectGetWidth(v18) - v12) * 0.5;
    v8 = v12;
  }
  v13 = v6 + 0.0;
  v14 = v4;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (double)_knobMinXInset
{
  double v2;

  -[_UIActionSlider knobInsets](self, "knobInsets");
  return v2;
}

- (double)_knobMaxXInset
{
  double v2;

  -[_UIActionSlider knobInsets](self, "knobInsets");
  return v2;
}

- (double)_knobVerticalInset
{
  double v2;

  -[_UIActionSlider knobInsets](self, "knobInsets");
  return v2 + 0.0;
}

- (double)_knobHorizontalPosition
{
  double v3;
  double v4;
  double v5;

  -[_UIActionSlider _knobAvailableX](self, "_knobAvailableX");
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    v4 = -(v3 * self->_knobPosition);
  else
    v4 = v3 * self->_knobPosition;
  -[_UIActionSlider _knobMinX](self, "_knobMinX");
  return v5 + v4;
}

- (double)_knobMinX
{
  double result;

  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    -[_UIActionSlider _knobRightMostX](self, "_knobRightMostX");
  else
    -[_UIActionSlider _knobLeftMostX](self, "_knobLeftMostX");
  return result;
}

- (double)_knobMaxX
{
  double result;

  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    -[_UIActionSlider _knobLeftMostX](self, "_knobLeftMostX");
  else
    -[_UIActionSlider _knobRightMostX](self, "_knobRightMostX");
  return result;
}

- (double)_knobLeftMostX
{
  double MinX;
  double v4;
  CGRect v6;

  -[_UIActionSlider _trackFrame](self, "_trackFrame");
  MinX = CGRectGetMinX(v6);
  -[_UIActionSlider _knobMinXInset](self, "_knobMinXInset");
  return MinX + v4;
}

- (double)_knobRightMostX
{
  double MaxX;
  double v4;
  double v5;
  double v6;
  CGRect v8;

  -[_UIActionSlider _trackFrame](self, "_trackFrame");
  MaxX = CGRectGetMaxX(v8);
  -[_UIActionSlider _knobMaxXInset](self, "_knobMaxXInset");
  v5 = MaxX - v4;
  -[_UIActionSlider _knobWidth](self, "_knobWidth");
  return v5 - v6;
}

- (double)_knobAvailableX
{
  double v3;
  double v4;
  double v5;

  -[_UIActionSlider _knobMaxX](self, "_knobMaxX");
  v4 = v3;
  -[_UIActionSlider _knobMinX](self, "_knobMinX");
  return vabdd_f64(v4, v5);
}

- (BOOL)xPointIsWithinTrack:(double)a3
{
  int v4;
  double v5;

  v4 = *((_DWORD *)&self->super.super._viewFlags + 4);
  -[_UIActionSlider _knobMinX](self, "_knobMinX");
  if ((*(_QWORD *)&v4 & 0x80000) != 0)
    return v5 >= a3;
  else
    return v5 <= a3;
}

- (BOOL)shouldHideTrackLabelForXPoint:(double)a3
{
  int v4;
  double v5;

  v4 = *((_DWORD *)&self->super.super._viewFlags + 4);
  -[_UIActionSlider _knobMinX](self, "_knobMinX");
  if ((*(_QWORD *)&v4 & 0x80000) != 0)
    return v5 > a3;
  else
    return v5 < a3;
}

- (void)didMoveToSuperview
{
  double v3;
  _UIActionSliderLabel *trackLabel;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIActionSlider;
  -[UIView didMoveToSuperview](&v5, sel_didMoveToSuperview);
  if (!-[_UIActionSlider textStyle](self, "textStyle"))
  {
    -[_UIActionSlider trackWidthProportion](self, "trackWidthProportion");
    if (v3 >= 1.0)
    {
      trackLabel = self->_trackLabel;
      if (!trackLabel)
      {
        -[_UIActionSlider _makeTrackLabel](self, "_makeTrackLabel");
        trackLabel = self->_trackLabel;
      }
      -[_UIActionSliderLabel startAnimating](trackLabel, "startAnimating");
    }
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIActionSlider;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[_UIActionSlider setCachedTrackMaskWidth:](self, "setCachedTrackMaskWidth:", 0.0);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_makeTrackLabel
{
  void *v3;
  int64_t v4;
  void *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  _UIActionSliderLabel *trackLabel;
  UILabel *v10;
  id v11;

  -[_UIActionSlider trackText](self, "trackText");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIActionSlider trackFont](self, "trackFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIActionSlider textStyle](self, "textStyle");
  if (v4 == 1)
  {
    v6 = objc_alloc_init(UILabel);
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6, "setTextColor:", v8);

    -[UILabel setText:](v6, "setText:", v11);
    -[UILabel setFont:](v6, "setFont:", v3);
  }
  else if (v4)
  {
    v6 = 0;
  }
  else
  {
    -[_UIActionSlider vibrantSettings](self, "vibrantSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UIGlintyStringView initWithText:andFont:]([_UIGlintyStringView alloc], "initWithText:andFont:", v11, v3);
    -[UILabel setAllowsLuminanceAdjustments:](v6, "setAllowsLuminanceAdjustments:", 0);
    -[UILabel setUsesBackgroundDimming:](v6, "setUsesBackgroundDimming:", 1);
    -[UILabel setVibrantSettings:](v6, "setVibrantSettings:", v5);
    objc_msgSend(v5, "legibilitySettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setLegibilitySettings:](v6, "setLegibilitySettings:", v7);

    -[UILabel setChevronStyle:](v6, "setChevronStyle:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v6, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel updateText](v6, "updateText");

  }
  -[_UIActionSliderLabel removeFromSuperview](self->_trackLabel, "removeFromSuperview");
  trackLabel = self->_trackLabel;
  self->_trackLabel = (_UIActionSliderLabel *)v6;
  v10 = v6;

  -[UIView addSubview:](self, "addSubview:", v10);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  BOOL v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  UIImageView *knobImageView;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  objc_super v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v66.receiver = self;
  v66.super_class = (Class)_UIActionSlider;
  -[UIView layoutSubviews](&v66, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v12 = v11;
  if (v11 <= 0.0)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v12 = v14;

    if (v12 <= 0.0)
      v12 = 1.0;
  }
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  -[_UIActionSlider _knobWidth](self, "_knobWidth");
  UIRoundToViewScale(self);
  v16 = v15;
  -[_UIActionSlider _knobMinXInset](self, "_knobMinXInset");
  UIRoundToViewScale(self);
  v18 = v17;
  -[_UIActionSlider _knobMaxXInset](self, "_knobMaxXInset");
  UIRoundToViewScale(self);
  v20 = v19;
  -[_UIActionSlider _trackFrame](self, "_trackFrame");
  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  if (self->_trackWidthProportion >= 1.0)
  {
    if (self->_knobPosition > 0.0)
    {
      -[_UIActionSlider _knobAvailableX](self, "_knobAvailableX");
      v32 = v31 * self->_knobPosition;
      v68.origin.x = v25;
      v68.origin.y = v26;
      v68.size.width = v27;
      v68.size.height = v28;
      v33 = CGRectGetWidth(v68) - v32;
      v69.origin.x = v25;
      v69.origin.y = v26;
      v69.size.width = v27;
      v69.size.height = v28;
      v34 = CGRectGetHeight(v69) - v33;
      v35 = v34 * 0.5;
      v28 = v28 - fmax(v34, 0.0);
      v36 = v34 <= 0.0;
      v37 = -0.0;
      if (v36)
        v35 = -0.0;
      v26 = v26 + v35;
      if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0)
        v37 = v32;
      v25 = v25 + v37;
      v27 = v27 - v32;
    }
  }
  else
  {
    v29 = v16 + v18 + v20;
    v30 = v21;
    if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
      v30 = (CGRectGetMaxX(*(CGRect *)&v21) - v29) * (1.0 - self->_trackWidthProportion);
    v67.origin.x = v25;
    v67.origin.y = v26;
    v67.size.width = v27;
    v67.size.height = v28;
    v27 = v29 + (CGRectGetWidth(v67) - v29) * self->_trackWidthProportion;
    v25 = v30;
  }
  -[UIView setFrame:](self->_trackBackgroundView, "setFrame:", v25, v26, v27, v28);
  -[UIView bounds](self->_trackBackgroundView, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  -[UIView setFrame:](self->_trackDodgeView, "setFrame:");
  -[UIView setFrame:](self->_trackBlurView, "setFrame:", v39, v41, v43, v45);
  -[UIView setFrame:](self->_trackSolidView, "setFrame:", v39, v41, v43, v45);
  -[_UIActionSlider cachedTrackMaskWidth](self, "cachedTrackMaskWidth");
  v47 = v46;
  v70.origin.x = v39;
  v70.origin.y = v41;
  v70.size.width = v43;
  v70.size.height = v45;
  if (v47 != CGRectGetWidth(v70))
  {
    v71.origin.x = v39;
    v71.origin.y = v41;
    v71.size.width = v43;
    v71.size.height = v45;
    if (CGRectGetWidth(v71) > 0.0)
      -[_UIActionSlider updateAllTrackMasks](self, "updateAllTrackMasks");
  }
  -[_UIActionSlider knobRect](self, "knobRect");
  v52 = UIRectIntegralWithScale(v48, v49, v50, v51, v12);
  v54 = v53;
  v56 = v55;
  -[UIView setFrame:](self->_knobView, "setFrame:", v52);
  knobImageView = self->_knobImageView;
  if (knobImageView)
  {
    -[UIImageView sizeThatFits:](knobImageView, "sizeThatFits:", v54, v56);
    v60 = UIRectCenteredIntegralRectScale(0.0, 0.0, v58, v59, 0.0, 0.0, v54, v56, v12);
    -[UIImageView setFrame:](self->_knobImageView, "setFrame:", floor(v12 * (v60 + self->_knobImageOffset.width)) / v12, floor(v12 * (v61 + self->_knobImageOffset.height)) / v12);
  }
  if (self->_trackLabel || (-[_UIActionSlider _makeTrackLabel](self, "_makeTrackLabel"), self->_trackLabel))
  {
    -[_UIActionSlider trackTextRect](self, "trackTextRect");
    -[_UIActionSliderLabel setFrame:](self->_trackLabel, "setFrame:", UIRectIntegralWithScale(v62, v63, v64, v65, v12));
  }
}

- (id)trackMaskImage
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGColorSpace *DeviceRGB;
  size_t v15;
  CGFloat Height;
  CGContext *v17;
  CGColor *v18;
  id v19;
  CGImage *Image;
  void *v21;
  _OWORD v23[2];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24 = *MEMORY[0x1E0C80C00];
  -[UIView _screen](self, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_trackBackgroundView, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "scale");
  v13 = v12;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v15 = vcvtpd_u64_f64(v13 * CGRectGetWidth(v25));
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  Height = CGRectGetHeight(v26);
  v17 = CGBitmapContextCreate(0, v15, vcvtpd_u64_f64(v13 * Height), 8uLL, 4 * v15, DeviceRGB, 2u);
  CGContextScaleCTM(v17, v13, v13);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = v9;
  v27.size.height = v11;
  CGContextClearRect(v17, v27);
  v23[0] = xmmword_18667ACF8;
  v23[1] = unk_18667AD08;
  v18 = CGColorCreate(DeviceRGB, (const CGFloat *)v23);
  CGContextSetFillColorWithColor(v17, v18);
  CGColorRelease(v18);
  _UIActionSliderTrackMaskPath(v5, v7, v9, v11);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextAddPath(v17, (CGPathRef)objc_msgSend(v19, "CGPath"));
  CGContextFillPath(v17);
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  CGColorSpaceRelease(DeviceRGB);
  +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", Image, 0, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);

  return v21;
}

- (id)trackMaskPath
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;

  -[UIView bounds](self->_trackBackgroundView, "bounds");
  return _UIActionSliderTrackMaskPath(v2, v3, v4, v5);
}

- (void)updateAllTrackMasks
{
  id v3;
  const CGPath *MutableCopy;
  _UIBackdropView **p_trackBlurView;
  uint64_t v6;
  _UIBackdropView *trackBlurView;
  void *v8;
  id v9;
  CGRect v10;

  if (-[_UIActionSlider isAnimating](self, "isAnimating"))
  {
    -[_UIActionSlider trackMaskPath](self, "trackMaskPath");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MutableCopy = CGPathCreateMutableCopy((CGPathRef)objc_msgSend(v3, "CGPath"));
    -[_UIActionSlider setMaskPath:onView:](self, "setMaskPath:onView:", MutableCopy, self->_trackDodgeView);
    if (self->_trackSolidView)
      -[_UIActionSlider setMaskPath:onView:](self, "setMaskPath:onView:", MutableCopy);
    CGPathRelease(MutableCopy);

    p_trackBlurView = &self->_trackBlurView;
    if (!self->_trackBlurView)
    {
      v9 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  -[_UIActionSlider trackMaskImage](self, "trackMaskImage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIActionSlider setMaskFromImage:onView:](self, "setMaskFromImage:onView:");
  if (self->_trackSolidView)
    -[_UIActionSlider setMaskFromImage:onView:](self, "setMaskFromImage:onView:", v9);
  v6 = (uint64_t)v9;
  p_trackBlurView = &self->_trackBlurView;
  trackBlurView = self->_trackBlurView;
  if (trackBlurView)
  {
    if (v9)
    {
LABEL_11:
      v9 = (id)v6;
      -[_UIBackdropView inputSettings](trackBlurView, "inputSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFilterMaskImage:", v9);
      objc_msgSend(v8, "setGrayscaleTintMaskImage:", v9);
      objc_msgSend(v8, "setColorTintMaskImage:", v9);

      goto LABEL_12;
    }
LABEL_10:
    -[_UIActionSlider trackMaskImage](self, "trackMaskImage");
    v6 = objc_claimAutoreleasedReturnValue();
    trackBlurView = *p_trackBlurView;
    goto LABEL_11;
  }
LABEL_12:
  -[UIView bounds](self->_trackBackgroundView, "bounds");
  -[_UIActionSlider setCachedTrackMaskWidth:](self, "setCachedTrackMaskWidth:", CGRectGetWidth(v10));

}

- (void)setMaskPath:(CGPath *)a3 onView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(v9, "setDelegate:", v10);
    objc_msgSend(v5, "setMask:", v9);
    v6 = v9;
  }
  objc_msgSend(v10, "bounds");
  objc_msgSend(v6, "setBounds:");
  objc_msgSend(v6, "setPath:", a3);

}

- (void)setMaskFromImage:(id)a3 onView:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = v5;
  v8 = objc_msgSend(v7, "CGImage");
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v22, "setBounds:");
  objc_msgSend(v22, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend(v7, "scale");
  objc_msgSend(v22, "setContentsScale:");
  objc_msgSend(v22, "setDelegate:", v6);
  objc_msgSend(v7, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "capInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v22, "setContentsCenter:", v16 / v10, v14 / v12, (v10 - v20 - v16) / v10, (v12 - v14 - v18) / v12);
  objc_msgSend(v22, "setContents:", v8);
  objc_msgSend(v6, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setMask:", v22);
}

- (void)_showTrackLabel
{
  _QWORD v3[5];

  if (!-[_UIActionSlider isShowingTrackLabel](self, "isShowingTrackLabel"))
  {
    if (!self->_trackLabel)
      -[_UIActionSlider _makeTrackLabel](self, "_makeTrackLabel");
    if (-[_UIActionSlider textStyle](self, "textStyle"))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __34___UIActionSlider__showTrackLabel__block_invoke;
      v3[3] = &unk_1E16B1B28;
      v3[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v3, 0.15);
    }
    else
    {
      -[_UIActionSliderLabel fadeInWithDuration:](self->_trackLabel, "fadeInWithDuration:", 0.15);
    }
    -[_UIActionSlider setShowingTrackLabel:](self, "setShowingTrackLabel:", 1);
  }
}

- (void)_hideTrackLabel:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _UIActionSliderLabel *trackLabel;
  _QWORD v7[5];

  v3 = a3;
  if (-[_UIActionSlider isShowingTrackLabel](self, "isShowingTrackLabel"))
  {
    if (!self->_trackLabel)
      -[_UIActionSlider _makeTrackLabel](self, "_makeTrackLabel");
    if (-[_UIActionSlider textStyle](self, "textStyle"))
    {
      v5 = 0.15;
      if (!v3)
        v5 = 0.0;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __35___UIActionSlider__hideTrackLabel___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, v5);
    }
    else
    {
      trackLabel = self->_trackLabel;
      if (v3)
        -[_UIActionSliderLabel fadeOutWithDuration:](trackLabel, "fadeOutWithDuration:", 0.15);
      else
        -[_UIActionSliderLabel hide](trackLabel, "hide");
    }
    -[_UIActionSlider setShowingTrackLabel:](self, "setShowingTrackLabel:", 0);
  }
}

- (void)_slideCompleted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  BOOL v11;

  v3 = a3;
  -[_UIActionSlider setAnimating:](self, "setAnimating:", 1);
  -[_UIActionSlider updateAllTrackMasks](self, "updateAllTrackMasks");
  self->_slideGestureInitialPoint = (CGPoint)*MEMORY[0x1E0C9D538];
  v5 = MEMORY[0x1E0C809B0];
  v9[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35___UIActionSlider__slideCompleted___block_invoke;
  v10[3] = &unk_1E16B1B78;
  v11 = v3;
  v10[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35___UIActionSlider__slideCompleted___block_invoke_2;
  v9[3] = &unk_1E16B3FD8;
  +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v10, v9);
  if (v3)
  {
    -[_UIActionSlider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl _incrementStatisticsForUserActionForEvents:](self, "_incrementStatisticsForUserActionForEvents:", 64);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "actionSliderDidCompleteSlide:", self);
  }
  else
  {
    v7 = dispatch_time(0, 150000000);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __35___UIActionSlider__slideCompleted___block_invoke_3;
    v8[3] = &unk_1E16B1B28;
    v8[4] = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], v8);
    -[_UIActionSlider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "actionSliderDidCancelSlide:", self);
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  BOOL v10;
  CGPoint v12;
  CGRect v13;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  v10 = 1;
  if (self->_slideGestureRecognizer == v4)
  {
    -[UIPanGestureRecognizer locationInView:](v4, "locationInView:", self->_knobView);
    v7 = v6;
    v9 = v8;
    -[UIView bounds](self->_knobView, "bounds");
    v12.x = v7;
    v12.y = v9;
    if (!CGRectContainsPoint(v13, v12))
      v10 = 0;
  }

  return v10;
}

- (void)_knobPanGesture:(id)a3
{
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGPoint *p_slideGestureInitialPoint;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  _UIActionSlider *v23;
  uint64_t v24;
  _BOOL4 v25;
  double *p_knobPosition;
  id v27;

  v27 = a3;
  v4 = *((_DWORD *)&self->super.super._viewFlags + 4);
  -[_UIActionSlider _knobMinX](self, "_knobMinX");
  v6 = v5;
  -[_UIActionSlider _knobAvailableX](self, "_knobAvailableX");
  v8 = v7;
  objc_msgSend(v27, "locationInView:", self);
  v10 = v9;
  v12 = v11;
  p_slideGestureInitialPoint = &self->_slideGestureInitialPoint;
  x = self->_slideGestureInitialPoint.x;
  objc_msgSend(v27, "velocityInView:", self);
  v16 = v15;
  v17 = self->_slideGestureInitialPoint.x;
  if ((v4 & 0x80000) != 0)
  {
    v18 = x - v10;
    if (v17 < 0.0)
    {
      -[_UIActionSlider _knobMinX](self, "_knobMinX");
      goto LABEL_6;
    }
LABEL_7:
    v20 = v8;
    goto LABEL_8;
  }
  v18 = v10 - x;
  if (v17 >= 0.0)
    goto LABEL_7;
  -[_UIActionSlider _knobMaxX](self, "_knobMaxX");
LABEL_6:
  v20 = v19;
LABEL_8:
  -[_UIActionSlider delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v18 / v20;
  switch(objc_msgSend(v27, "state"))
  {
    case 1:
      p_slideGestureInitialPoint->x = v10;
      self->_slideGestureInitialPoint.y = v12;
      if (-[_UIActionSlider shouldHideTrackLabelForXPoint:](self, "shouldHideTrackLabelForXPoint:", v10))
        -[_UIActionSlider _hideTrackLabel:](self, "_hideTrackLabel:", 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v21, "actionSliderDidBeginSlide:", self);
      goto LABEL_22;
    case 2:
      if (!-[_UIActionSlider xPointIsWithinTrack:](self, "xPointIsWithinTrack:", v10))
      {
        p_knobPosition = &self->_knobPosition;
        self->_knobPosition = 0.0;
LABEL_33:
        *p_knobPosition = 0.0;
        -[_UIActionSlider _showTrackLabel](self, "_showTrackLabel");
        goto LABEL_34;
      }
      if (!-[_UIActionSlider xPointIsWithinTrack:](self, "xPointIsWithinTrack:", p_slideGestureInitialPoint->x))
      {
        if (-[_UIActionSlider xPointIsWithinTrack:](self, "xPointIsWithinTrack:", p_slideGestureInitialPoint->x))
          v6 = p_slideGestureInitialPoint->x;
        v22 = vabdd_f64(v10, v6) / v8;
      }
      p_knobPosition = &self->_knobPosition;
      self->_knobPosition = v22;
      if (v22 <= 0.0)
        goto LABEL_33;
      if (v22 > 1.0)
        *p_knobPosition = 1.0;
      -[_UIActionSlider _hideTrackLabel:](self, "_hideTrackLabel:", 1);
LABEL_34:
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v21, "actionSlider:didUpdateSlideWithValue:", self, *p_knobPosition);
LABEL_22:

      return;
    case 3:
      v25 = v16 >= 150.0 && v22 >= 0.4;
      v24 = v18 / (v20 * 0.6) >= 0.999000013 || v25;
      v23 = self;
      goto LABEL_21;
    case 4:
    case 5:
      v23 = self;
      v24 = 0;
LABEL_21:
      -[_UIActionSlider _slideCompleted:](v23, "_slideCompleted:", v24);
      goto LABEL_22;
    default:
      goto LABEL_22;
  }
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(int64_t)a3
{
  self->_textStyle = a3;
}

- (CGSize)knobImageOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_knobImageOffset.width;
  height = self->_knobImageOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)trackText
{
  return self->_trackText;
}

- (UIFont)trackFont
{
  return self->_trackFont;
}

- (CGSize)trackSize
{
  double width;
  double height;
  CGSize result;

  width = self->_trackSize.width;
  height = self->_trackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)trackTextBaselineFromBottom
{
  return self->_trackTextBaselineFromBottom;
}

- (void)setTrackTextBaselineFromBottom:(double)a3
{
  self->_trackTextBaselineFromBottom = a3;
}

- (UIPanGestureRecognizer)slideGestureRecognizer
{
  return self->_slideGestureRecognizer;
}

- (_UIActionSliderDelegate)delegate
{
  return (_UIActionSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)knobPosition
{
  return self->_knobPosition;
}

- (double)knobWidth
{
  return self->_knobWidth;
}

- (UIEdgeInsets)knobInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_knobInsets.top;
  left = self->_knobInsets.left;
  bottom = self->_knobInsets.bottom;
  right = self->_knobInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)trackWidthProportion
{
  return self->_trackWidthProportion;
}

- (void)setTrackWidthProportion:(double)a3
{
  self->_trackWidthProportion = a3;
}

- (BOOL)isShowingTrackLabel
{
  return self->_showingTrackLabel;
}

- (void)setShowingTrackLabel:(BOOL)a3
{
  self->_showingTrackLabel = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)cachedTrackMaskWidth
{
  return self->_cachedTrackMaskWidth;
}

- (void)setCachedTrackMaskWidth:(double)a3
{
  self->_cachedTrackMaskWidth = a3;
}

- (UIView)_knobView
{
  return &self->_knobView->super;
}

- (_UIVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (void)setVibrantSettings:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackFont, 0);
  objc_storeStrong((id *)&self->_trackText, 0);
  objc_storeStrong((id *)&self->_slideGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_trackLabel, 0);
  objc_storeStrong((id *)&self->_knobImageView, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_trackSolidView, 0);
  objc_storeStrong((id *)&self->_trackBlurView, 0);
  objc_storeStrong((id *)&self->_trackBackgroundView, 0);
  objc_storeStrong((id *)&self->_trackDodgeView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

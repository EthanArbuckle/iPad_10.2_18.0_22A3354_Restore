@implementation PUCinematicSubjectIndicator

- (PUCinematicSubjectIndicator)initWithFrame:(CGRect)a3
{
  PUCinematicSubjectIndicator *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  CEKSubjectIndicatorView *fixedFocusView;
  uint64_t v11;
  CEKCinematicSubjectIndicatorView *subjectView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUCinematicSubjectIndicator;
  v3 = -[PUCinematicSubjectIndicator initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D0D0A0]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    fixedFocusView = v3->_fixedFocusView;
    v3->_fixedFocusView = (CEKSubjectIndicatorView *)v9;

    -[CEKSubjectIndicatorView setShape:](v3->_fixedFocusView, "setShape:", 3);
    -[PUCinematicSubjectIndicator addSubview:](v3, "addSubview:", v3->_fixedFocusView);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0D030]), "initWithFrame:", v5, v6, v7, v8);
    subjectView = v3->_subjectView;
    v3->_subjectView = (CEKCinematicSubjectIndicatorView *)v11;

    -[PUCinematicSubjectIndicator addSubview:](v3, "addSubview:", v3->_subjectView);
    -[PUCinematicSubjectIndicator setShape:](v3, "setShape:", 0);
    v3->_fixedFocusSize = (CGSize)vdupq_n_s64(0x4052C00000000000uLL);
    v3->_isPulsing = 0;
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCinematicSubjectIndicator;
  -[PUCinematicSubjectIndicator setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUCinematicSubjectIndicator setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MidX;
  double MidY;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v11.receiver = self;
  v11.super_class = (Class)PUCinematicSubjectIndicator;
  -[PUCinematicSubjectIndicator layoutSubviews](&v11, sel_layoutSubviews);
  -[PUCinematicSubjectIndicator bounds](self, "bounds");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  if (!CGRectIsNull(v12))
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    if (!CGRectIsInfinite(v13))
    {
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      if (!CGRectIsEmpty(v14))
      {
        v15.origin.x = x;
        v15.origin.y = y;
        v15.size.width = width;
        v15.size.height = height;
        MidX = CGRectGetMidX(v15);
        v16.origin.x = x;
        v16.origin.y = y;
        v16.size.width = width;
        v16.size.height = height;
        MidY = CGRectGetMidY(v16);
        objc_msgSend(MEMORY[0x1E0D0D030], "minimumSuggestedBounds");
        if (width >= v9)
          v9 = width;
        if (height >= v10)
          v10 = height;
        -[CEKCinematicSubjectIndicatorView setBounds:](self->_subjectView, "setBounds:", 0.0, 0.0, v9, v10);
        -[CEKCinematicSubjectIndicatorView setCenter:](self->_subjectView, "setCenter:", MidX, MidY);
        -[CEKSubjectIndicatorView setBounds:](self->_fixedFocusView, "setBounds:", 0.0, 0.0, self->_fixedFocusSize.width, self->_fixedFocusSize.height);
        -[CEKSubjectIndicatorView setCenter:](self->_fixedFocusView, "setCenter:", MidX, MidY);
        if (-[PUCinematicSubjectIndicator isPulsing](self, "isPulsing"))
          -[PUCinematicSubjectIndicator _startPulseAnimation](self, "_startPulseAnimation");
      }
    }
  }
}

- (void)setShape:(int64_t)a3
{
  -[PUCinematicSubjectIndicator setShape:animated:](self, "setShape:animated:", a3, 0);
}

- (void)setShape:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v7;

  v4 = a4;
  self->_shape = a3;
  v7 = a3 == 3;
  -[CEKSubjectIndicatorView setHidden:animated:](self->_fixedFocusView, "setHidden:animated:", a3 != 3);
  -[CEKCinematicSubjectIndicatorView setHidden:](self->_subjectView, "setHidden:", v7);
  if ((unint64_t)a3 <= 2)
    -[CEKCinematicSubjectIndicatorView setShape:animated:](self->_subjectView, "setShape:animated:", a3, v4);
}

- (void)setIsPulsing:(BOOL)a3
{
  id v3;

  if (self->_isPulsing != a3)
  {
    self->_isPulsing = a3;
    if (a3)
    {
      -[PUCinematicSubjectIndicator _startPulseAnimation](self, "_startPulseAnimation");
    }
    else
    {
      -[PUCinematicSubjectIndicator layer](self, "layer");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeAllAnimations");

    }
  }
}

- (void)_startPulseAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  -[PUCinematicSubjectIndicator superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUCinematicSubjectIndicator layer](self, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationForKey:", CFSTR("pulse"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v8, "removeAllAnimations");
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDuration:", 0.75);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTimingFunction:", v6);

      objc_msgSend(v5, "setToValue:", &unk_1E59BC4B0);
      LODWORD(v7) = 2139095040;
      objc_msgSend(v5, "setRepeatCount:", v7);
      objc_msgSend(v5, "setAutoreverses:", 1);
      objc_msgSend(v8, "addAnimation:forKey:", v5, CFSTR("pulse"));

    }
  }
}

- (int64_t)shape
{
  return self->_shape;
}

- (BOOL)isPulsing
{
  return self->_isPulsing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectView, 0);
  objc_storeStrong((id *)&self->_fixedFocusView, 0);
}

@end

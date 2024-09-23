@implementation SBHomeScreenBackdropDarkTintView

- (SBHomeScreenBackdropDarkTintView)initWithFrame:(CGRect)a3
{
  SBHomeScreenBackdropDarkTintView *v3;
  id v4;
  uint64_t v5;
  UIView *darkTintView;
  UIView *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  v3 = -[SBHomeScreenBackdropViewBase initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBHomeScreenBackdropDarkTintView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    darkTintView = v3->_darkTintView;
    v3->_darkTintView = (UIView *)v5;

    -[UIView setAutoresizingMask:](v3->_darkTintView, "setAutoresizingMask:", 18);
    -[UIView setHidden:](v3->_darkTintView, "setHidden:", 1);
    v7 = v3->_darkTintView;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[SBHomeScreenBackdropDarkTintView addSubview:](v3, "addSubview:", v3->_darkTintView);
  }
  return v3;
}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  -[SBHomeScreenBackdropViewBase beginRequiringBackdropViewForReason:](&v4, sel_beginRequiringBackdropViewForReason_, a3);
  -[SBHomeScreenBackdropDarkTintView _updateDarkTintViewHidden](self, "_updateDarkTintViewHidden");
}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  -[SBHomeScreenBackdropViewBase beginRequiringLiveBackdropViewForReason:](&v4, sel_beginRequiringLiveBackdropViewForReason_, a3);
  -[SBHomeScreenBackdropDarkTintView _updateDarkTintViewHidden](self, "_updateDarkTintViewHidden");
}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  -[SBHomeScreenBackdropViewBase endRequiringBackdropViewForReason:](&v4, sel_endRequiringBackdropViewForReason_, a3);
  -[SBHomeScreenBackdropDarkTintView _updateDarkTintViewHidden](self, "_updateDarkTintViewHidden");
}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  -[SBHomeScreenBackdropViewBase endRequiringLiveBackdropViewForReason:](&v4, sel_endRequiringLiveBackdropViewForReason_, a3);
  -[SBHomeScreenBackdropDarkTintView _updateDarkTintViewHidden](self, "_updateDarkTintViewHidden");
}

- (void)setBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[6];

  v8 = (void *)MEMORY[0x1E0CEABB0];
  v9 = a5;
  -[SBHomeScreenBackdropViewBase backdropBlurSettings](self, "backdropBlurSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__SBHomeScreenBackdropDarkTintView_setBlurProgress_behaviorMode_completion___block_invoke;
  v11[3] = &unk_1E8E9DE88;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  objc_msgSend(v8, "sb_animateWithSettings:mode:animations:completion:", v10, a4, v11, v9);

}

uint64_t __76__SBHomeScreenBackdropDarkTintView_setBlurProgress_behaviorMode_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", (double)(BSFloatIsZero() ^ 1));
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)_updateDarkTintViewHidden
{
  uint64_t v3;

  if (-[SBHomeScreenBackdropViewBase requiresBackdropView](self, "requiresBackdropView"))
    v3 = 0;
  else
    v3 = -[SBHomeScreenBackdropViewBase requiresLiveBackdropView](self, "requiresLiveBackdropView") ^ 1;
  -[UIView setHidden:](self->_darkTintView, "setHidden:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkTintView, 0);
}

@end

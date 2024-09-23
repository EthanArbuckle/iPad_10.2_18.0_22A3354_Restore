@implementation SBUIRingViewLabelButton

- (SBUIRingViewLabelButton)initWithFrame:(CGRect)a3
{
  SBUIRingViewLabelButton *v3;
  SBUIRingViewLabelButton *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  TPRevealingRingView *ringView;
  uint64_t v16;
  UILabel *label;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBUIRingViewLabelButton;
  v3 = -[SBUIRingViewLabelButton initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBUIRingViewLabelButton bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = objc_alloc(MEMORY[0x1E0DBD170]);
    v14 = objc_msgSend(v13, "initWithFrame:paddingOutsideRing:", v6, v8, v10, v12, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    ringView = v4->_ringView;
    v4->_ringView = (TPRevealingRingView *)v14;

    -[TPRevealingRingView setAutoresizingMask:](v4->_ringView, "setAutoresizingMask:", 18);
    -[TPRevealingRingView setDefaultRingStrokeWidth:](v4->_ringView, "setDefaultRingStrokeWidth:", 1.0);
    -[TPRevealingRingView setRevealAnimationDuration:](v4->_ringView, "setRevealAnimationDuration:", 0.0);
    -[TPRevealingRingView setUnrevealAnimationDuration:](v4->_ringView, "setUnrevealAnimationDuration:", 0.392500013);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v8, v10, v12);
    label = v4->_label;
    v4->_label = (UILabel *)v16;

    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    -[UILabel setAutoresizingMask:](v4->_label, "setAutoresizingMask:", 18);
    -[SBUIRingViewLabelButton addSubview:](v4, "addSubview:", v4->_ringView);
    -[SBUIRingViewLabelButton addSubview:](v4, "addSubview:", v4->_label);
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  SBUIRingViewLabelButton *v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[SBUIRingViewLabelButton bounds](self, "bounds", a4);
  v9.x = x;
  v9.y = y;
  if (CGRectContainsPoint(v10, v9))
    v7 = self;
  else
    v7 = 0;
  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[SBUIRingViewLabelButton isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)SBUIRingViewLabelButton;
  -[SBUIRingViewLabelButton setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != v3)
    -[TPRevealingRingView setRevealed:animated:](self->_ringView, "setRevealed:animated:", v3, 1);
}

- (TPRevealingRingView)backgroundRing
{
  return self->_ringView;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
}

@end

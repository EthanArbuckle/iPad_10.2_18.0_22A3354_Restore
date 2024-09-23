@implementation SBUIPasscodePillButton

- (SBUIPasscodePillButton)initWithFrame:(CGRect)a3
{
  SBUIPasscodePillButton *v3;
  SBUIPasscodePillButton *v4;
  id v5;
  uint64_t v6;
  UIView *pillView;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIView *v13;
  UIView *backdropView;
  void *v15;
  CABackdropLayer *v16;
  CABackdropLayer *backdropLayer;
  CABackdropLayer *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  UILabel *titleLabel;
  UILabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v43;
  _QWORD v44[2];
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)SBUIPasscodePillButton;
  v3 = -[SBUIPasscodePillButton initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_unhighlightedAlpha = 0.1;
    v3->_highlightedAlpha = 0.65;
    v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBUIPasscodePillButton bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    pillView = v4->_pillView;
    v4->_pillView = (UIView *)v6;

    v8 = v4->_pillView;
    -[SBUIPasscodePillButton unhighlightedAlpha](v4, "unhighlightedAlpha");
    -[UIView setAlpha:](v8, "setAlpha:");
    v9 = v4->_pillView;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UIView layer](v4->_pillView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v11, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    -[SBUIPasscodePillButton addSubview:](v4, "addSubview:", v4->_pillView);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    backdropView = v4->_backdropView;
    v4->_backdropView = v13;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setName:", CFSTR("saturation"));
    objc_msgSend(v15, "setValue:forKey:", &unk_1E4C7AD40, CFSTR("inputAmount"));
    v16 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E0CD2708]);
    backdropLayer = v4->_backdropLayer;
    v4->_backdropLayer = v16;

    v18 = v4->_backdropLayer;
    v45[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABackdropLayer setFilters:](v18, "setFilters:", v19);

    -[CABackdropLayer setCornerCurve:](v4->_backdropLayer, "setCornerCurve:", v12);
    -[UIView layer](v4->_backdropView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSublayer:", v4->_backdropLayer);

    -[SBUIPasscodePillButton addSubview:](v4, "addSubview:", v4->_backdropView);
    v21 = objc_alloc(MEMORY[0x1E0CEA700]);
    v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v22;

    v24 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.48);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v24, "setTextColor:", v25);

    -[UILabel layer](v4->_titleLabel, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCompositingFilter:", v27);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBUIPasscodePillButton addSubview:](v4, "addSubview:", v4->_titleLabel);
    v28 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), v4->_titleLabel, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(>=16)-[_titleLabel]-(>=16)-|"), 0, 0, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v30);

    v31 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), v4->_titleLabel, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(14)-[_titleLabel]-(14)-|"), 0, 0, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v33);

    v34 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel centerXAnchor](v4->_titleLabel, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodePillButton centerXAnchor](v4, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v37;
    -[UILabel centerYAnchor](v4->_titleLabel, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodePillButton centerYAnchor](v4, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v41);

  }
  return v4;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (UIFont)font
{
  return -[UILabel font](self->_titleLabel, "font");
}

- (void)setFont:(id)a3
{
  -[UILabel setFont:](self->_titleLabel, "setFont:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUIPasscodePillButton;
  -[SBUIPasscodePillButton setHighlighted:](&v10, sel_setHighlighted_);
  if (v3)
    v5 = 0.0;
  else
    v5 = 0.85;
  v6 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__SBUIPasscodePillButton_setHighlighted___block_invoke;
  v8[3] = &unk_1E4C3E430;
  v8[4] = self;
  v9 = v3;
  v7 = (void *)objc_msgSend(v6, "initWithDuration:controlPoint1:controlPoint2:animations:", v8, v5, 0.0, 0.0, 0.0, 1.0);
  objc_msgSend(v7, "startAnimation");

}

uint64_t __41__SBUIPasscodePillButton_setHighlighted___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[59];
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v2, "highlightedAlpha");
  else
    objc_msgSend(v2, "unhighlightedAlpha");
  return objc_msgSend(v3, "setAlpha:");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  SBUIPasscodePillButton *v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[SBUIPasscodePillButton bounds](self, "bounds", a4);
  v9.x = x;
  v9.y = y;
  if (CGRectContainsPoint(v10, v9))
    v7 = self;
  else
    v7 = 0;
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  CABackdropLayer *backdropLayer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodePillButton;
  -[SBUIPasscodePillButton layoutSubviews](&v7, sel_layoutSubviews);
  -[SBUIPasscodePillButton bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[UIView setFrame:](self->_pillView, "setFrame:");
  -[UIView layer](self->_pillView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  backdropLayer = self->_backdropLayer;
  -[UIView frame](self->_pillView, "frame");
  -[CABackdropLayer setFrame:](backdropLayer, "setFrame:");
  -[CABackdropLayer setCornerRadius:](self->_backdropLayer, "setCornerRadius:", v4);
}

- (double)unhighlightedAlpha
{
  return self->_unhighlightedAlpha;
}

- (void)setUnhighlightedAlpha:(double)a3
{
  self->_unhighlightedAlpha = a3;
}

- (double)highlightedAlpha
{
  return self->_highlightedAlpha;
}

- (void)setHighlightedAlpha:(double)a3
{
  self->_highlightedAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

@implementation SBSimplePasscodeEntryFieldButton

- (SBSimplePasscodeEntryFieldButton)initWithFrame:(CGRect)a3 paddingOutsideRing:(UIEdgeInsets)a4 useLightStyle:(BOOL)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  SBSimplePasscodeEntryFieldButton *v10;
  SBSimplePasscodeEntryFieldButton *v11;
  double *p_top;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  UIView *ringView;
  UIView *v21;
  double v22;
  void *v23;
  void *v24;
  objc_super v26;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v26.receiver = self;
  v26.super_class = (Class)SBSimplePasscodeEntryFieldButton;
  v10 = -[SBSimplePasscodeEntryFieldButton initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v11 = v10;
  if (v10)
  {
    v10->_useLightStyle = a5;
    p_top = &v10->_paddingOutsideRing.top;
    v10->_paddingOutsideRing.top = top;
    v10->_paddingOutsideRing.left = left;
    v10->_paddingOutsideRing.bottom = bottom;
    v10->_paddingOutsideRing.right = right;
    -[SBSimplePasscodeEntryFieldButton setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
    if (v11->_useLightStyle)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v11->_color, v13);

    v14 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBSimplePasscodeEntryFieldButton bounds](v11, "bounds");
    v19 = objc_msgSend(v14, "initWithFrame:", v15 + v11->_paddingOutsideRing.left, *p_top + v16, v17 - (v11->_paddingOutsideRing.left + v11->_paddingOutsideRing.right), v18 - (*p_top + v11->_paddingOutsideRing.bottom));
    ringView = v11->_ringView;
    v11->_ringView = (UIView *)v19;

    -[SBSimplePasscodeEntryFieldButton addSubview:](v11, "addSubview:", v11->_ringView);
    v21 = v11->_ringView;
    -[UIView frame](v21, "frame");
    -[UIView _setCornerRadius:](v21, "_setCornerRadius:", v22 * 0.5);
    -[UIView layer](v11->_ringView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderColor:", -[UIColor cgColor](v11->_color, "cgColor"));

    -[UIView layer](v11->_ringView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA9E68], "pinFixedDigitEntryFieldIndicatorStrokeSize");
    objc_msgSend(v24, "setBorderWidth:");

  }
  return v11;
}

- (void)layoutSubviews
{
  UIView *ringView;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  double v9;

  ringView = self->_ringView;
  -[SBSimplePasscodeEntryFieldButton bounds](self, "bounds");
  -[UIView setFrame:](ringView, "setFrame:", v4 + self->_paddingOutsideRing.left, v5 + self->_paddingOutsideRing.top, v6 - (self->_paddingOutsideRing.left + self->_paddingOutsideRing.right), v7 - (self->_paddingOutsideRing.top + self->_paddingOutsideRing.bottom));
  v8 = self->_ringView;
  -[UIView frame](v8, "frame");
  -[UIView _setCornerRadius:](v8, "_setCornerRadius:", v9 * 0.5);
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4
{
  -[SBSimplePasscodeEntryFieldButton setRevealed:animated:delay:](self, "setRevealed:animated:delay:", a3, a4, 0.0);
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4 delay:(double)a5
{
  BOOL v7;
  double v8;
  BOOL v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];

  if (fabs(a5) < 2.22044605e-16 || self->_revealed != a3)
  {
    self->_revealed = a3;
    v7 = !a4 || a3;
    if (!v7)
    {
      self->_animatingUnreveal = 1;
      *(_DWORD *)&a3 = self->_revealed;
    }
    v8 = 0.392500013;
    v9 = !v7;
    if (a3)
      v8 = 0.0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__SBSimplePasscodeEntryFieldButton_setRevealed_animated_delay___block_invoke;
    v12[3] = &unk_1E4C3E408;
    v12[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__SBSimplePasscodeEntryFieldButton_setRevealed_animated_delay___block_invoke_2;
    v10[3] = &unk_1E4C3EBD0;
    v11 = v9;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v12, v10, v8, a5);
  }
}

void __63__SBSimplePasscodeEntryFieldButton_setRevealed_animated_delay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 417))
  {
    v3 = *(id *)(v2 + 456);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setBackgroundColor:", v3);

}

uint64_t __63__SBSimplePasscodeEntryFieldButton_setRevealed_animated_delay___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    *(_BYTE *)(*(_QWORD *)(result + 32) + 472) = 0;
  return result;
}

- (BOOL)isAnimatingUnreveal
{
  return self->_animatingUnreveal;
}

- (void)setAnimatingUnreveal:(BOOL)a3
{
  self->_animatingUnreveal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end

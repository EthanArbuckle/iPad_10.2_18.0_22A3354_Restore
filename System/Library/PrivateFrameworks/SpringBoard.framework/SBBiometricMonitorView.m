@implementation SBBiometricMonitorView

- (SBBiometricMonitorView)initWithFrame:(CGRect)a3
{
  SBBiometricMonitorView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *stateView;
  uint64_t v11;
  UIView *presenceView;
  uint64_t v13;
  UIView *poseView;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBBiometricMonitorView;
  v3 = -[SBBiometricMonitorView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    stateView = v3->_stateView;
    v3->_stateView = (UIView *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
    presenceView = v3->_presenceView;
    v3->_presenceView = (UIView *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
    poseView = v3->_poseView;
    v3->_poseView = (UIView *)v13;

    -[SBBiometricMonitorView addSubview:](v3, "addSubview:", v3->_presenceView);
    -[SBBiometricMonitorView addSubview:](v3, "addSubview:", v3->_stateView);
    -[SBBiometricMonitorView addSubview:](v3, "addSubview:", v3->_poseView);
  }
  return v3;
}

- (void)setMatchState:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  self->_matchState = a3;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = (void *)v4;
      break;
    default:
      v5 = 0;
      break;
  }
  v6 = v5;
  -[UIView setBackgroundColor:](self->_stateView, "setBackgroundColor:", v5);

}

- (void)setPresenceDetectState:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  self->_presenceDetectState = a3;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = (void *)v4;
      break;
    default:
      v5 = 0;
      break;
  }
  v6 = v5;
  -[UIView setBackgroundColor:](self->_presenceView, "setBackgroundColor:", v5);

}

- (void)setPoseState:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  self->_poseState = a3;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "purpleColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:
  v6 = v5;
  -[UIView setBackgroundColor:](self->_poseView, "setBackgroundColor:", v5);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)layoutSubviews
{
  CGSize v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect slice;
  CGRect v18;

  -[SBBiometricMonitorView bounds](self, "bounds");
  UIRectCenteredXInRect();
  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  slice.size = v3;
  v16.origin = slice.origin;
  v16.size = v3;
  CGRectDivide(v18, &slice, &v16, 48.0, CGRectMinXEdge);
  UIRectInset();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  UIRectInset();
  v16.origin.x = v12;
  v16.origin.y = v13;
  v16.size.width = v14;
  v16.size.height = v15;
  -[UIView setFrame:](self->_stateView, "setFrame:", v5, v7, v9, v11);
  -[UIView _setCornerRadius:](self->_stateView, "_setCornerRadius:", 20.0);
  -[UIView setFrame:](self->_presenceView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UIView _setCornerRadius:](self->_presenceView, "_setCornerRadius:", 4.0);
  -[UIView setFrame:](self->_poseView, "setFrame:", *(_OWORD *)&v16.origin, *(_OWORD *)&v16.size);
}

- (int64_t)matchState
{
  return self->_matchState;
}

- (int64_t)presenceDetectState
{
  return self->_presenceDetectState;
}

- (int64_t)poseState
{
  return self->_poseState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poseView, 0);
  objc_storeStrong((id *)&self->_presenceView, 0);
  objc_storeStrong((id *)&self->_stateView, 0);
}

@end

@implementation UIDictationATVLinearView

- (void)setRenderConfig:(id)a3
{
  UIKBRenderConfig *v5;

  v5 = (UIKBRenderConfig *)a3;
  if (self->_renderConfig != v5)
  {
    objc_storeStrong((id *)&self->_renderConfig, a3);
    -[UIDictationATVLinearView _applyRenderConfig:](self, "_applyRenderConfig:", v5);
  }

}

- (void)_applyRenderConfig:(id)a3
{
  id v4;
  double v5;
  char v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "lightKeyboard"))
    v5 = 0.4;
  else
    v5 = 0.5;
  v6 = objc_msgSend(v4, "lightKeyboard");

  if ((v6 & 1) != 0)
    +[UIColor blackColor](UIColor, "blackColor");
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUICFlamesView setDictationColor:](self->super._flamesView, "setDictationColor:", v7);
    -[SUICFlamesView setAlpha:](self->super._flamesView, "setAlpha:", v5);
  }

}

- (BOOL)drawsOwnBackground
{
  return 1;
}

- (void)setState:(int)a3
{
  uint64_t v3;
  double v5;
  double v6;
  objc_class *SUICFlamesViewClass;
  SUICFlamesView *flamesView;
  id v9;
  void *v10;
  SUICFlamesView *v11;
  SUICFlamesView *v12;
  objc_super v13;

  v3 = *(_QWORD *)&a3;
  if (a3 == 2)
  {
    -[SUICFlamesView setState:](self->super._flamesView, "setState:", 1);
  }
  else if (a3 == 1)
  {
    -[UIView bounds](self, "bounds");
    v6 = v5;
    SUICFlamesViewClass = (objc_class *)getSUICFlamesViewClass();
    flamesView = self->super._flamesView;
    if (flamesView)
    {
      -[SUICFlamesView setFrame:](flamesView, "setFrame:", 0.0, 0.0, v6, 100.0);
    }
    else
    {
      v9 = [SUICFlamesViewClass alloc];
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (SUICFlamesView *)objc_msgSend(v9, "initWithFrame:screen:fidelity:", v10, 2, 0.0, 0.0, v6, 100.0);
      v12 = self->super._flamesView;
      self->super._flamesView = v11;

    }
    -[SUICFlamesView setDelegate:](self->super._flamesView, "setDelegate:", self);
    -[SUICFlamesView setMode:](self->super._flamesView, "setMode:", 1);
    -[SUICFlamesView setState:](self->super._flamesView, "setState:", 1);
    -[SUICFlamesView setNeedsLayout](self->super._flamesView, "setNeedsLayout");
    -[UIView addSubview:](self, "addSubview:", self->super._flamesView);
    if (self->_renderConfig)
      -[UIDictationATVLinearView _applyRenderConfig:](self, "_applyRenderConfig:");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  v13.receiver = self;
  v13.super_class = (Class)UIDictationATVLinearView;
  -[UIDictationView setState:](&v13, sel_setState_, v3);
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
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIDictationATVLinearView;
  -[UIView layoutSubviews](&v14, sel_layoutSubviews);
  -[UIView size](self, "size");
  v4 = v3;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView contentScaleFactor](self, "contentScaleFactor");
  -[SUICFlamesView setFrame:](self->super._flamesView, "setFrame:", UIRectCenteredIntegralRectScale(0.0, 0.0, v4, 100.0, v6, v8, v10, v12, v13));
  -[SUICFlamesView setNeedsLayout](self->super._flamesView, "setNeedsLayout");
}

- (void)removeFromSuperview
{
  SUICFlamesView *flamesView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDictationATVLinearView;
  -[UIView removeFromSuperview](&v4, sel_removeFromSuperview);
  -[SUICFlamesView removeFromSuperview](self->super._flamesView, "removeFromSuperview");
  -[SUICFlamesView setDelegate:](self->super._flamesView, "setDelegate:", 0);
  flamesView = self->super._flamesView;
  self->super._flamesView = 0;

}

- (void)returnToKeyboard
{
  void *v3;
  int v4;
  objc_super v5;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIDictationATVLinearView;
    -[UIDictationView returnToKeyboard](&v5, sel_returnToKeyboard);
  }
}

- (BOOL)isShowing
{
  void *v2;
  BOOL v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderConfig, 0);
}

@end

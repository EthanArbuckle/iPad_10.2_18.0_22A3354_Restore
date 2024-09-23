@implementation UIDictationPopUpView

- (void)returnToKeyboard
{
  void *v3;
  int v4;
  void *v5;
  SUICFlamesView *flamesView;
  objc_super v7;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 != 1)
  {
    +[UIKeyboardDictationMenu sharedInstance](UIKeyboardDictationMenu, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hide");

    -[SUICFlamesView removeFromSuperview](self->super._flamesView, "removeFromSuperview");
    -[SUICFlamesView setDelegate:](self->super._flamesView, "setDelegate:", 0);
    flamesView = self->super._flamesView;
    self->super._flamesView = 0;

    v7.receiver = self;
    v7.super_class = (Class)UIDictationPopUpView;
    -[UIDictationView returnToKeyboard](&v7, sel_returnToKeyboard);
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
  if (a3 == 1)
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
    -[UIView addSubview:](self, "addSubview:", self->super._endpointButton);
    -[UIView addSubview:](self, "addSubview:", self->super._endpointButtonLandscape);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  v13.receiver = self;
  v13.super_class = (Class)UIDictationPopUpView;
  -[UIDictationView setState:](&v13, sel_setState_, v3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDictationPopUpView;
  -[UIView layoutSubviews](&v6, sel_layoutSubviews);
  -[UIView size](self, "size");
  v4 = v3 * 0.5;
  -[UIView size](self, "size");
  -[SUICFlamesView setFrame:](self->super._flamesView, "setFrame:", 0.0, v4, v5, 100.0);
  -[SUICFlamesView setNeedsLayout](self->super._flamesView, "setNeedsLayout");
}

@end

@implementation UIKBDictationDisplayView

- (UIKBDictationDisplayView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  UIKBDictationDisplayView *v5;
  UIKBDictationDisplayView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBDictationDisplayView;
  v5 = -[UIKBKeyView initWithFrame:keyplane:key:](&v8, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
  return v6;
}

- (void)dealloc
{
  void *v3;
  UIKBDictationDisplayView *v4;
  void *v5;
  objc_super v6;

  -[UIKBDictationDisplayView dictationView](self, "dictationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (UIKBDictationDisplayView *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[UIKBDictationDisplayView dictationView](self, "dictationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
  -[UIKBDictationDisplayView setDictationView:](self, "setDictationView:", 0);
  v6.receiver = self;
  v6.super_class = (Class)UIKBDictationDisplayView;
  -[UIKBKeyView dealloc](&v6, sel_dealloc);
}

- (void)setRenderConfig:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKBDictationDisplayView;
  -[UIKBKeyView setRenderConfig:](&v4, sel_setRenderConfig_, a3);
  -[UIKBDictationDisplayView updateDictationColor](self, "updateDictationColor");
}

- (void)updateDictationColor
{
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;

  -[UIKBDictationDisplayView dictationView](self, "dictationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIKBDictationDisplayView dictationView](self, "dictationView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRenderConfig:", v5);

  }
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v4;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDictation");

}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  UIKBDictationDisplayView *v16;
  void *v17;

  -[UIKBDictationDisplayView dictationView](self, "dictationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayDelegate:", 0);

    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBDictationDisplayView setDictationView:](self, "setDictationView:", v5);

  }
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIKBDictationDisplayView dictationView](self, "dictationView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[UIKBDictationDisplayView dictationView](self, "dictationView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "superview");
  v16 = (UIKBDictationDisplayView *)objc_claimAutoreleasedReturnValue();

  if (v16 != self)
  {
    -[UIKBDictationDisplayView dictationView](self, "dictationView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v17);

  }
  -[UIKBDictationDisplayView updateDictationColor](self, "updateDictationColor");
}

- (void)removeFromSuperview
{
  void *v3;
  void *v4;
  UIKBDictationDisplayView *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBDictationDisplayView;
  -[UIKBKeyView removeFromSuperview](&v7, sel_removeFromSuperview);
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopDictation");

  }
  -[UIKBDictationDisplayView dictationView](self, "dictationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (UIKBDictationDisplayView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[UIKBDictationDisplayView dictationView](self, "dictationView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
}

- (UIDictationView)dictationView
{
  return self->_dictationView;
}

- (void)setDictationView:(id)a3
{
  objc_storeStrong((id *)&self->_dictationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationView, 0);
}

@end

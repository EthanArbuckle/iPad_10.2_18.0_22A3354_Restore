@implementation UIAlternativeCandidatesButton

- (UIAlternativeCandidatesButton)initWithFrame:(CGRect)a3
{
  UIAlternativeCandidatesButton *v3;
  UIAlternativeCandidatesButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAlternativeCandidatesButton;
  v3 = -[UIScriptSwitcherButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIAlternativeCandidatesButton updateImage](v3, "updateImage");
  return v4;
}

- (void)updateImage
{
  unint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;

  v3 = -[UIAlternativeCandidatesButton buttonState](self, "buttonState");
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = 1;
      v5 = CFSTR("script-switcher-down");
    }
    else
    {
      if (v3 != 1)
        return;
      v4 = 1;
      v5 = CFSTR("script-switcher-up");
    }
  }
  else
  {
    v4 = 0;
    v5 = CFSTR("script-switcher-disabled");
  }
  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScriptSwitcherButton setLeftImage:](self, "setLeftImage:", v6);

  -[UIButton setEnabled:](self, "setEnabled:", v4);
}

- (void)setButtonState:(unint64_t)a3
{
  self->_buttonState = a3;
  -[UIAlternativeCandidatesButton updateImage](self, "updateImage");
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setRenderConfig:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIAlternativeCandidatesButton;
  -[UIScriptSwitcherButton _setRenderConfig:](&v4, sel__setRenderConfig_, a3);
  -[UIAlternativeCandidatesButton updateImage](self, "updateImage");
}

- (unint64_t)buttonState
{
  return self->_buttonState;
}

@end

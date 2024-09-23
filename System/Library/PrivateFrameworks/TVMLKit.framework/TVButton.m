@implementation TVButton

+ (id)_buttonContentWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  return -[TVButtonContent initWithFrame:blurEffectStyle:blurEnabled:]([TVButtonContent alloc], "initWithFrame:blurEffectStyle:blurEnabled:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (TVButton)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  _BOOL8 v5;
  TVButton *v7;
  void *v8;
  uint64_t v9;
  TVButtonContent *buttonContent;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)TVButton;
  v7 = -[TVButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v8 = (void *)objc_opt_class();
    -[TVButton bounds](v7, "bounds");
    objc_msgSend(v8, "_buttonContentWithFrame:blurEffectStyle:blurEnabled:", a4, v5);
    v9 = objc_claimAutoreleasedReturnValue();
    buttonContent = v7->_buttonContent;
    v7->_buttonContent = (TVButtonContent *)v9;

    -[TVButton addSubview:](v7, "addSubview:", v7->_buttonContent);
    -[TVButton addTarget:action:forEvents:](v7, "addTarget:action:forEvents:", v7, sel__selectButtonAction_, 64);
    -[TVButton setCornerRadius:](v7, "setCornerRadius:", *(double *)&_kTVButtonDefaultCornerRadius);
  }
  return v7;
}

- (void)tv_setLayout:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVButton;
  v4 = a3;
  -[UIView tv_setLayout:](&v5, sel_tv_setLayout_, v4);
  -[UIView tv_setLayout:](self->_buttonContent, "tv_setLayout:", v4, v5.receiver, v5.super_class);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[TVButtonContent sizeThatFits:](self->_buttonContent, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  TVButtonContent *buttonContent;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVButton;
  -[TVButton layoutSubviews](&v4, sel_layoutSubviews);
  buttonContent = self->_buttonContent;
  -[TVButton bounds](self, "bounds");
  -[_UIFloatingContentView setFrame:](buttonContent, "setFrame:");
}

- (double)focusSizeIncrease
{
  double result;

  -[TVButtonContent focusSizeIncrease](self->_buttonContent, "focusSizeIncrease");
  return result;
}

- (void)setFocusSizeIncrease:(double)a3
{
  -[TVButtonContent setFocusSizeIncrease:](self->_buttonContent, "setFocusSizeIncrease:", a3);
}

- (BOOL)isDisabled
{
  return -[TVButton isEnabled](self, "isEnabled") ^ 1;
}

- (void)setDisabled:(BOOL)a3
{
  -[TVButton setEnabled:](self, "setEnabled:", !a3);
}

- (id)backgroundColor
{
  return -[TVButtonContent backgroundColor](self->_buttonContent, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  -[TVButtonContent setBackgroundColor:](self->_buttonContent, "setBackgroundColor:", a3);
  -[TVButton _updateBackgroundColorForState:](self, "_updateBackgroundColorForState:", -[TVButton state](self, "state"));
}

- (void)setHighlightColor:(id)a3
{
  -[TVButtonContent setHighlightColor:](self->_buttonContent, "setHighlightColor:", a3);
  -[TVButton _updateBackgroundColorForState:](self, "_updateBackgroundColorForState:", -[TVButton state](self, "state"));
}

- (void)_updateBackgroundColorForState:(unint64_t)a3
{
  -[TVButtonContent _updateBackgroundColorForState:](self->_buttonContent, "_updateBackgroundColorForState:", a3);
}

- (void)setCornerRadius:(double)a3
{
  -[TVButtonContent setCornerRadius:](self->_buttonContent, "setCornerRadius:", a3);
}

- (void)setTextContentView:(id)a3
{
  -[TVButtonContent setTextContentView:](self->_buttonContent, "setTextContentView:", a3);
}

- (void)setImageView:(id)a3
{
  -[TVButtonContent setImageView:](self->_buttonContent, "setImageView:", a3);
}

- (void)setAccessoryView:(id)a3
{
  -[TVButtonContent setAccessoryView:](self->_buttonContent, "setAccessoryView:", a3);
}

- (void)setImageTrailsTextContent:(BOOL)a3
{
  -[TVButtonContent setImageTrailsTextContent:](self->_buttonContent, "setImageTrailsTextContent:", a3);
}

- (int64_t)backdropStyle
{
  return -[TVButtonContent backdropStyle](self->_buttonContent, "backdropStyle");
}

- (BOOL)blurEnabled
{
  return -[TVButtonContent blurEnabled](self->_buttonContent, "blurEnabled");
}

- (UILabel)textContentView
{
  return -[TVButtonContent textContentView](self->_buttonContent, "textContentView");
}

- (_TVImageView)imageView
{
  return -[TVButtonContent imageView](self->_buttonContent, "imageView");
}

- (_TVImageView)accessoryView
{
  return -[TVButtonContent accessoryView](self->_buttonContent, "accessoryView");
}

- (_UIFloatingContentView)floatingView
{
  return (_UIFloatingContentView *)self->_buttonContent;
}

- (UIView)overlayView
{
  return -[TVButtonContent overlayView](self->_buttonContent, "overlayView");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  TVButton *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVButton;
  v6 = a4;
  v7 = a3;
  -[TVButton didUpdateFocusInContext:withAnimationCoordinator:](&v9, sel_didUpdateFocusInContext_withAnimationCoordinator_, v7, v6);
  objc_msgSend(v7, "nextFocusedView", v9.receiver, v9.super_class);
  v8 = (TVButton *)objc_claimAutoreleasedReturnValue();

  -[TVButton _setFocused:animationCoordinator:](self, "_setFocused:animationCoordinator:", v8 == self, v6);
}

- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3
{
  -[TVButton _setFocused:animationCoordinator:](self, "_setFocused:animationCoordinator:", a3, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (v4)
  {
    -[TVButton traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceStyle"))
    {
      objc_msgSend(v4, "userInterfaceStyle");
      -[TVButton traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInterfaceStyle");

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TVButton;
  -[TVButton traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);

}

- (void)_selectButtonAction:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[TVButton selectActionHandler](self, "selectActionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVButton selectActionHandler](self, "selectActionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, TVButton *))v5)[2](v5, self);

  }
  else
  {
    -[IKViewElement tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:](self->_viewElement, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("select"), 1, 1, 0, v6, 0);
  }

}

- (void)_playButtonAction:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[TVButton playActionHandler](self, "playActionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVButton playActionHandler](self, "playActionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, TVButton *))v5)[2](v5, self);

  }
  else
  {
    -[IKViewElement tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:](self->_viewElement, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("play"), 1, 1, 0, v6, 0);
  }

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TVButton;
  -[TVButton setSelected:](&v5, sel_setSelected_);
  -[TVButton setSelected:animated:](self, "setSelected:animated:", v3, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TVButton;
  -[UIView setHighlighted:](&v5, sel_setHighlighted_);
  -[TVButton setSelected:animated:](self, "setSelected:animated:", v3, 0);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TVButton;
  -[TVButton setEnabled:](&v5, sel_setEnabled_);
  -[TVButtonContent setEnabled:](self->_buttonContent, "setEnabled:", v3);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  -[TVButtonContent setSelected:animated:](self->_buttonContent, "setSelected:animated:", a3, a4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  -[TVButtonContent setSelected:animated:withAnimationCoordinator:](self->_buttonContent, "setSelected:animated:withAnimationCoordinator:", a3, a4, a5);
}

- (void)_setFocused:(BOOL)a3 animationCoordinator:(id)a4
{
  -[TVButtonContent _setFocused:animationCoordinator:](self->_buttonContent, "_setFocused:animationCoordinator:", a3, a4);
}

- (void)_updateFocusStateWithCoordinator:(id)a3
{
  -[TVButtonContent _updateFocusStateWithCoordinator:](self->_buttonContent, "_updateFocusStateWithCoordinator:", a3);
}

- (TVButtonContent)buttonContent
{
  return self->_buttonContent;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (id)selectActionHandler
{
  return self->_selectActionHandler;
}

- (void)setSelectActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (id)playActionHandler
{
  return self->_playActionHandler;
}

- (void)setPlayActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playActionHandler, 0);
  objc_storeStrong(&self->_selectActionHandler, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_buttonContent, 0);
}

@end

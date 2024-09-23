@implementation UIAssistantBarRoundedButtonViewButton

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIAssistantBarRoundedButtonViewButton;
  -[UIButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[UIAssistantBarRoundedButtonViewButton _updateBackgroundAndTitleColor](self, "_updateBackgroundAndTitleColor");
}

- (id)_currentTitleColor
{
  if (-[UIControl isHighlighted](self, "isHighlighted"))
    -[UIAssistantBarRoundedButtonViewButton highlightedTitleColor](self, "highlightedTitleColor");
  else
    -[UIAssistantBarRoundedButtonViewButton normalTitleColor](self, "normalTitleColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateBackgroundAndTitleColor
{
  void *v3;
  void *v4;
  id v5;

  if (-[UIControl isHighlighted](self, "isHighlighted"))
    -[UIAssistantBarRoundedButtonViewButton highlightedBackgroundColor](self, "highlightedBackgroundColor");
  else
    -[UIAssistantBarRoundedButtonViewButton normalBackgroundColor](self, "normalBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[UIAssistantBarRoundedButtonViewButton _currentTitleColor](self, "_currentTitleColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)setNormalBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_normalBackgroundColor, a3);
  -[UIAssistantBarRoundedButtonViewButton _updateBackgroundAndTitleColor](self, "_updateBackgroundAndTitleColor");
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
  -[UIAssistantBarRoundedButtonViewButton _updateBackgroundAndTitleColor](self, "_updateBackgroundAndTitleColor");
}

- (void)setNormalTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_normalTitleColor, a3);
  -[UIAssistantBarRoundedButtonViewButton _updateBackgroundAndTitleColor](self, "_updateBackgroundAndTitleColor");
}

- (void)setHighlightedTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTitleColor, a3);
  -[UIAssistantBarRoundedButtonViewButton _updateBackgroundAndTitleColor](self, "_updateBackgroundAndTitleColor");
}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (UIColor)normalTitleColor
{
  return self->_normalTitleColor;
}

- (UIColor)highlightedTitleColor
{
  return self->_highlightedTitleColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTitleColor, 0);
  objc_storeStrong((id *)&self->_normalTitleColor, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
}

@end

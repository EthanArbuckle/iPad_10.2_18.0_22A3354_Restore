@implementation _UIFloatingTabBarContentPalette

- (id)resolvedColorFromProvider:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEditing"))
  {
    if (objc_msgSend(v4, "isCustomizableItem"))
      +[UIColor labelColor](UIColor, "labelColor");
    else
      +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  }
  else
  {
    if (objc_msgSend(v4, "hasSelectionHighlight"))
    {
      -[_UIFloatingTabBarContentPalette selectedColor](self, "selectedColor");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (objc_msgSend(v4, "isHighlighted"))
      -[_UIFloatingTabBarContentPalette highlightedColor](self, "highlightedColor");
    else
      -[_UIFloatingTabBarContentPalette inactiveColor](self, "inactiveColor");
  }
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v6 = (void *)v5;

  return v6;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColor, a3);
}

- (UIColor)inactiveColor
{
  return self->_inactiveColor;
}

- (void)setInactiveColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveColor, a3);
}

- (UIColor)highlightedColor
{
  return self->_highlightedColor;
}

- (void)setHighlightedColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_inactiveColor, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
}

@end

@implementation BCLibraryButton

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCLibraryButton;
  -[BCLibraryButton setHighlighted:](&v7, "setHighlighted:");
  if (a3)
    v5 = objc_claimAutoreleasedReturnValue(-[BCLibraryButton highlightBackgroundColor](self, "highlightBackgroundColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(-[BCLibraryButton normalBackgroundColor](self, "normalBackgroundColor"));
  v6 = (void *)v5;
  -[BCLibraryButton setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)setNormalBackgroundColor:(id)a3
{
  UIColor *v5;
  unsigned __int8 v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_normalBackgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_normalBackgroundColor, a3);
    v6 = -[BCLibraryButton isHighlighted](self, "isHighlighted");
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      -[BCLibraryButton setBackgroundColor:](self, "setBackgroundColor:", v7);
      v5 = v7;
    }
  }

}

- (void)setHighlightBackgroundColor:(id)a3
{
  UIColor *v5;
  unsigned int v6;
  void *v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  if (self->_highlightBackgroundColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_highlightBackgroundColor, a3);
    v6 = -[BCLibraryButton isHighlighted](self, "isHighlighted");
    v5 = v8;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCLibraryButton highlightBackgroundColor](self, "highlightBackgroundColor"));
      -[BCLibraryButton setBackgroundColor:](self, "setBackgroundColor:", v7);

      v5 = v8;
    }
  }

}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
}

@end

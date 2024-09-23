@implementation PXHUDVisualization

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  if (self->_title != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    title = self->_title;
    self->_title = v4;

    -[PXHUDVisualization _notifyDelegateVisualizationDidChange](self, "_notifyDelegateVisualizationDidChange");
  }
}

- (UIColor)color
{
  UIColor *color;

  color = self->_color;
  if (color)
    return color;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    -[PXHUDVisualization _notifyDelegateVisualizationDidChange](self, "_notifyDelegateVisualizationDidChange");
    v5 = v6;
  }

}

- (void)_notifyDelegateVisualizationDidChange
{
  void *v3;
  char v4;
  id v5;

  -[PXHUDVisualization delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PXHUDVisualization delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualizationDidChange:", self);

  }
}

- (NSString)title
{
  return self->_title;
}

- (PXHUDVisualizationDelegate)delegate
{
  return (PXHUDVisualizationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end

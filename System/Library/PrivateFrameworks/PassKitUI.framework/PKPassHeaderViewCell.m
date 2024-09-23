@implementation PKPassHeaderViewCell

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassHeaderViewCell;
  -[PKPassHeaderViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKPassHeaderViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKPassHeaderViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPassHeaderViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  y = a3.origin.y;
  x = a3.origin.x;
  -[PKPassHeaderView sizeThatFits:](self->_passHeaderView, "sizeThatFits:", a3.size.width, a3.size.height);
  v9 = v8;
  v11 = v10;
  if (!a4)
  {
    -[PKPassHeaderView frame](self->_passHeaderView, "frame");
    -[PKPassHeaderView setFrame:](self->_passHeaderView, "setFrame:", x, y, v9, v11);
  }
  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
  -[PKPassHeaderViewCell _configurePassHeader](self, "_configurePassHeader");
}

- (void)setPassLibraryOverride:(id)a3
{
  objc_storeStrong((id *)&self->_passLibraryOverride, a3);
  -[PKPassHeaderViewCell _configurePassHeader](self, "_configurePassHeader");
}

- (void)_configurePassHeader
{
  PKPassHeaderView *passHeaderView;
  PKPassHeaderView *v4;
  PKPassHeaderView *v5;
  void *v6;

  passHeaderView = self->_passHeaderView;
  if (!passHeaderView)
  {
    v4 = -[PKPassHeaderView initWithPass:rendererState:]([PKPassHeaderView alloc], "initWithPass:rendererState:", self->_pass, 0);
    v5 = self->_passHeaderView;
    self->_passHeaderView = v4;

    -[PKPassHeaderView setSmall:](self->_passHeaderView, "setSmall:", 1);
    -[PKPassHeaderViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_passHeaderView);

    passHeaderView = self->_passHeaderView;
  }
  -[PKPassHeaderView setPass:](passHeaderView, "setPass:", self->_pass);
  -[PKPassHeaderView setPassLibraryOverride:](self->_passHeaderView, "setPassLibraryOverride:", self->_passLibraryOverride);
  -[PKPassHeaderViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (PKPass)pass
{
  return self->_pass;
}

- (PKPassLibraryDataProvider)passLibraryOverride
{
  return self->_passLibraryOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLibraryOverride, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passHeaderView, 0);
}

@end

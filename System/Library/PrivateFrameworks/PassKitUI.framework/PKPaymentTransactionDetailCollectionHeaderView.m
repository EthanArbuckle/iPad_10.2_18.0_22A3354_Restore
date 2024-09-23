@implementation PKPaymentTransactionDetailCollectionHeaderView

- (PKPaymentTransactionDetailCollectionHeaderView)init
{
  return -[PKPaymentTransactionDetailCollectionHeaderView initWithSize:](self, "initWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (PKPaymentTransactionDetailCollectionHeaderView)initWithSize:(CGSize)a3
{
  return -[PKPaymentTransactionDetailCollectionHeaderView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
}

- (PKPaymentTransactionDetailCollectionHeaderView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailCollectionHeaderView;
  return -[PKPaymentTransactionDetailCollectionHeaderView initWithFrame:](&v4, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKPaymentTransactionDetailHeaderView)headerView
{
  PKPaymentTransactionDetailHeaderView *headerView;
  PKPaymentTransactionDetailHeaderView *v4;
  PKPaymentTransactionDetailHeaderView *v5;
  void *v6;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = objc_alloc_init(PKPaymentTransactionDetailHeaderView);
    v5 = self->_headerView;
    self->_headerView = v4;

    -[PKPaymentTransactionDetailHeaderView setInBridge:](self->_headerView, "setInBridge:", PKBridgeUsesDarkAppearance());
    -[PKPaymentTransactionDetailCollectionHeaderView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_headerView);

    headerView = self->_headerView;
  }
  return headerView;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailCollectionHeaderView;
  -[PKPaymentTransactionDetailCollectionHeaderView layoutSubviews](&v4, sel_layoutSubviews);
  -[PKPaymentTransactionDetailCollectionHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKPaymentTransactionDetailCollectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPaymentTransactionDetailCollectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKPaymentTransactionDetailHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.size.width, 1.79769313e308);
  v11 = v10;
  if (!a4)
    -[PKPaymentTransactionDetailHeaderView setFrame:](self->_headerView, "setFrame:", x, y, width, height);
  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)prepareForReuse
{
  PKPaymentTransactionDetailHeaderView *headerView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailCollectionHeaderView;
  -[PKPaymentTransactionDetailCollectionHeaderView prepareForReuse](&v4, sel_prepareForReuse);
  -[PKPaymentTransactionDetailHeaderView removeFromSuperview](self->_headerView, "removeFromSuperview");
  headerView = self->_headerView;
  self->_headerView = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end

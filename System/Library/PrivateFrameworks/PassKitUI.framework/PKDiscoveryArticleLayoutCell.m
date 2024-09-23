@implementation PKDiscoveryArticleLayoutCell

- (void)layoutSubviews
{
  PKDiscoveryShelfView *shelfView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryArticleLayoutCell;
  -[PKDiscoveryArticleLayoutCell layoutSubviews](&v5, sel_layoutSubviews);
  shelfView = self->_shelfView;
  -[PKDiscoveryArticleLayoutCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PKDiscoveryShelfView setFrame:](shelfView, "setFrame:");

}

- (void)prepareForReuse
{
  PKDiscoveryShelfView *shelfView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryArticleLayoutCell;
  -[PKDiscoveryArticleLayoutCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PKDiscoveryShelfView removeFromSuperview](self->_shelfView, "removeFromSuperview");
  shelfView = self->_shelfView;
  self->_shelfView = 0;

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryArticleLayoutCell;
  -[PKDiscoveryArticleLayoutCell preferredLayoutAttributesFittingAttributes:](&v13, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKDiscoveryShelfView sizeThatFits:](self->_shelfView, "sizeThatFits:", v9, 1.79769313e308);
  objc_msgSend(v4, "setBounds:", v6, v8, v10, v11);
  return v4;
}

- (void)setShelfView:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_shelfView, a3);
  v5 = a3;
  -[PKDiscoveryArticleLayoutCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  -[PKDiscoveryArticleLayoutCell setNeedsLayout](self, "setNeedsLayout");
}

- (PKDiscoveryShelfView)shelfView
{
  return self->_shelfView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfView, 0);
}

@end

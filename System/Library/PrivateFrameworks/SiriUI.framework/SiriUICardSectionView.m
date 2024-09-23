@implementation SiriUICardSectionView

- (SiriUICardSectionView)initWithFrame:(CGRect)a3
{
  SiriUICardSectionView *v3;
  void *v4;
  uint64_t v5;
  NSString *cardSectionViewIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriUICardSectionView;
  v3 = -[SiriUICardSectionView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    cardSectionViewIdentifier = v3->_cardSectionViewIdentifier;
    v3->_cardSectionViewIdentifier = (NSString *)v5;

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = self->_contentSize.height + self->_headerViewHeight + self->_footerViewHeight;
  result.height = v3;
  return result;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[SiriUICardSectionView addSubview:](self, "addSubview:", self->_contentView);
    v5 = v7;
  }

}

- (void)setHeaderView:(id)a3
{
  SiriUIReusableView *v5;
  SiriUIReusableView *headerView;
  SiriUIReusableView *v7;

  v5 = (SiriUIReusableView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v7 = v5;
    -[SiriUIReusableView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[SiriUICardSectionView addSubview:](self, "addSubview:", self->_headerView);
    v5 = v7;
  }

}

- (void)setFooterView:(id)a3
{
  SiriUIReusableView *v5;
  SiriUIReusableView *footerView;
  SiriUIReusableView *v7;

  v5 = (SiriUIReusableView *)a3;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    v7 = v5;
    -[SiriUIReusableView removeFromSuperview](footerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_footerView, a3);
    -[SiriUICardSectionView addSubview:](self, "addSubview:", self->_footerView);
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double headerViewHeight;
  double v12;
  double footerViewHeight;
  double v14;
  UIView *contentView;
  double MaxY;
  double Width;
  SiriUIReusableView *footerView;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v20.receiver = self;
  v20.super_class = (Class)SiriUICardSectionView;
  -[SiriUICardSectionView layoutSubviews](&v20, sel_layoutSubviews);
  -[SiriUICardSectionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!self->_headerView || (headerViewHeight = self->_headerViewHeight, headerViewHeight <= 0.0))
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
    headerViewHeight = v12;
  }
  if (!self->_footerView || (footerViewHeight = self->_footerViewHeight, footerViewHeight <= 0.0))
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
    footerViewHeight = v14;
  }
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  -[SiriUIReusableView setFrame:](self->_headerView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v21), headerViewHeight);
  contentView = self->_contentView;
  -[SiriUIReusableView frame](self->_headerView, "frame");
  MaxY = CGRectGetMaxY(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  Width = CGRectGetWidth(v23);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  -[UIView setFrame:](contentView, "setFrame:", 0.0, MaxY, Width, CGRectGetMaxY(v24) - headerViewHeight - footerViewHeight);
  footerView = self->_footerView;
  -[UIView frame](self->_contentView, "frame");
  v19 = CGRectGetMaxY(v25);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  -[SiriUIReusableView setFrame:](footerView, "setFrame:", 0.0, v19, CGRectGetWidth(v26), footerViewHeight);
}

- (id)accessibilityIdentifier
{
  return CFSTR("SiriUICardSectionViewAccessibilityIdentifier");
}

+ (CGSize)sizeThatFitsCardSection:(id)a3 boundingSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)removeFromComposedSuperview
{
  id v3;

  -[SiriUICardSectionView composedSuperview](self, "composedSuperview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSectionSubviewWantsToBeRemovedFromHierarchy:", self);

}

- (CRKComposableView)composedSuperview
{
  return (CRKComposableView *)objc_loadWeakRetained((id *)&self->_composedSuperview);
}

- (void)setComposedSuperview:(id)a3
{
  objc_storeWeak((id *)&self->_composedSuperview, a3);
}

- (NSString)cardSectionViewIdentifier
{
  return self->_cardSectionViewIdentifier;
}

- (void)setCardSectionViewIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (SiriUIReusableView)headerView
{
  return self->_headerView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (SiriUIReusableView)footerView
{
  return self->_footerView;
}

- (double)headerViewHeight
{
  return self->_headerViewHeight;
}

- (void)setHeaderViewHeight:(double)a3
{
  self->_headerViewHeight = a3;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (double)footerViewHeight
{
  return self->_footerViewHeight;
}

- (void)setFooterViewHeight:(double)a3
{
  self->_footerViewHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_cardSectionViewIdentifier, 0);
  objc_destroyWeak((id *)&self->_composedSuperview);
}

@end

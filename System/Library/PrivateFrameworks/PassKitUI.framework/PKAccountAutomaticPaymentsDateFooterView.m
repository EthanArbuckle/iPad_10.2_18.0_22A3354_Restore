@implementation PKAccountAutomaticPaymentsDateFooterView

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKAccountAutomaticPaymentsDateFooterView;
  -[PKAccountAutomaticPaymentsDateFooterView layoutSubviews](&v19, sel_layoutSubviews);
  -[PKAccountAutomaticPaymentsDateFooterView bounds](self, "bounds");
  v4 = v3;
  -[PKMonthDayCollectionViewController collectionView](self->_collectionViewController, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMonthDayCollectionViewController sizeThatFits:](self->_collectionViewController, "sizeThatFits:", v4, 0.0);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v7 = v6;
  objc_msgSend(v5, "setFrame:");
  -[PKAccountAutomaticPaymentsDateFooterView textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v8, "sizeThatFits:", v4 + -30.0, 0.0);
  v10 = v9;
  v12 = v11;
  v13 = v7 + 8.0;
  v14 = 15.0;
  if (self->_collectionViewController && PKIsVision())
  {
    PKRectCenteredXInRect();
    v14 = v15;
    v13 = v16;
    v10 = v17;
    v12 = v18;
  }
  objc_msgSend(v8, "setFrame:", v14, v13, v10, v12);

}

- (void)setCollectionViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PKMonthDayCollectionViewController collectionView](self->_collectionViewController, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_storeStrong((id *)&self->_collectionViewController, a3);
  if (self->_collectionViewController)
  {
    -[PKAccountAutomaticPaymentsDateFooterView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMonthDayCollectionViewController collectionView](self->_collectionViewController, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

  }
  -[PKAccountAutomaticPaymentsDateFooterView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKMonthDayCollectionViewController sizeThatFits:](self->_collectionViewController, "sizeThatFits:");
  v7 = v6;
  -[PKAccountAutomaticPaymentsDateFooterView textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;

  v11 = v7 + v10 + 16.0;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (PKMonthDayCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewController, 0);
}

@end

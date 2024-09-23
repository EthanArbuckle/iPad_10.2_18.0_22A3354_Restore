@implementation PKTransactionHistoryPeerPaymentHeaderCell

- (PKTransactionHistoryPeerPaymentHeaderCell)initWithFrame:(CGRect)a3
{
  PKTransactionHistoryPeerPaymentHeaderCell *v3;
  PKAvatarHeaderView *v4;
  PKAvatarHeaderView *headerView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTransactionHistoryPeerPaymentHeaderCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[PKAvatarHeaderView initWithContact:counterpartHandle:]([PKAvatarHeaderView alloc], "initWithContact:counterpartHandle:", 0, 0);
    headerView = v3->_headerView;
    v3->_headerView = v4;

    -[PKTransactionHistoryPeerPaymentHeaderCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_headerView);

    -[PKDashboardCollectionViewCell setWantsCustomAppearance:](v3, "setWantsCustomAppearance:", 1);
  }
  return v3;
}

- (void)configureWithPeerPaymentCounterpartHandle:(id)a3 contact:(id)a4
{
  PKAvatarHeaderView *headerView;
  id v7;

  headerView = self->_headerView;
  v7 = a3;
  -[PKAvatarHeaderView setContact:](headerView, "setContact:", a4);
  -[PKAvatarHeaderView setCounterpartHandle:](self->_headerView, "setCounterpartHandle:", v7);

}

- (void)layoutSubviews
{
  PKAvatarHeaderView *headerView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryPeerPaymentHeaderCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  headerView = self->_headerView;
  -[PKTransactionHistoryPeerPaymentHeaderCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PKAvatarHeaderView setFrame:](headerView, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKAvatarHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.width, 1.79769313e308);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end

@implementation PKPaymentSetupGDPRCollectionViewCell

- (void)setprivacyView:(id)a3
{
  UIView *v4;
  UIView *privacyView;
  UIView *v6;
  id v7;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_privacyView, "removeFromSuperview");
  privacyView = self->_privacyView;
  self->_privacyView = v4;
  v6 = v4;

  -[PKPaymentSetupGDPRCollectionViewCell contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_privacyView);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView setNeedsLayout](self->_privacyView, "setNeedsLayout");
  -[UIView layoutIfNeeded](self->_privacyView, "layoutIfNeeded");
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_privacyView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v6, v7);
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  UIView *privacyView;

  -[PKPaymentSetupGDPRCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIView superview](self->_privacyView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PKPaymentSetupGDPRCollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_privacyView);

  }
  LODWORD(v8) = 1148846080;
  LODWORD(v9) = 1112014848;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_privacyView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v4, v6, v8, v9);
  privacyView = self->_privacyView;
  PKSizeAlignedInRect();
  -[UIView setFrame:](privacyView, "setFrame:");
}

- (UIView)privacyView
{
  return self->_privacyView;
}

- (void)setPrivacyView:(id)a3
{
  objc_storeStrong((id *)&self->_privacyView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyView, 0);
}

@end

@implementation NCNotificationSummaryPlatterContainingView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationSummaryPlatterContainingView summaryPlatterView](self, "summaryPlatterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
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
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NCNotificationSummaryPlatterContainingView;
  -[NCNotificationSummaryPlatterContainingView layoutSubviews](&v13, sel_layoutSubviews);
  -[NCNotificationSummaryPlatterContainingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[NCNotificationSummaryPlatterContainingView summaryPlatterView](self, "summaryPlatterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  -[NCNotificationSummaryPlatterContainingView summaryPlatterView](self, "summaryPlatterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v9, v11, v4, v6);

}

- (UIView)summaryPlatterView
{
  return self->_summaryPlatterView;
}

- (void)setSummaryPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_summaryPlatterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryPlatterView, 0);
}

@end

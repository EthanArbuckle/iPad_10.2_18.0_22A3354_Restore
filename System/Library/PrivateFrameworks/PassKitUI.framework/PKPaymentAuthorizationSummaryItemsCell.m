@implementation PKPaymentAuthorizationSummaryItemsCell

- (PKPaymentAuthorizationSummaryItemsCell)initWithLayout:(id)a3 reuseIdentifier:(id)a4
{
  id v6;
  PKPaymentAuthorizationSummaryItemsCell *v7;
  PKPaymentAuthorizationSummaryItemsCell *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *constraints;
  PKPaymentAuthorizationSummaryItemsView *v12;
  PKPaymentAuthorizationSummaryItemsView *summaryItemsView;
  void *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentAuthorizationSummaryItemsCell;
  v7 = -[PKPaymentAuthorizationSummaryItemsCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v8 = v7;
  if (v7)
  {
    -[PKPaymentAuthorizationSummaryItemsCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationSummaryItemsCell setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    constraints = v8->_constraints;
    v8->_constraints = v10;

    v12 = -[PKPaymentAuthorizationSummaryItemsView initWithLayout:]([PKPaymentAuthorizationSummaryItemsView alloc], "initWithLayout:", v6);
    summaryItemsView = v8->_summaryItemsView;
    v8->_summaryItemsView = v12;

    -[PKPaymentAuthorizationSummaryItemsCell contentView](v8, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v8->_summaryItemsView);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationSummaryItemsCell;
  -[PKPaymentAuthorizationSummaryItemsCell dealloc](&v2, sel_dealloc);
}

- (void)prepareForReuse
{
  objc_super v3;

  -[PKPaymentAuthorizationSummaryItemsView removeLabelsAndValues](self->_summaryItemsView, "removeLabelsAndValues");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationSummaryItemsCell;
  -[PKTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)layoutSubviews
{
  PKPaymentAuthorizationSummaryItemsView *summaryItemsView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationSummaryItemsCell;
  -[PKPaymentAuthorizationSummaryItemsCell layoutSubviews](&v11, sel_layoutSubviews);
  summaryItemsView = self->_summaryItemsView;
  -[PKPaymentAuthorizationSummaryItemsCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:](summaryItemsView, "sizeThatFits:", v5, v6);
  v8 = v7;
  v10 = v9;

  -[PKPaymentAuthorizationSummaryItemsView setFrame:](self->_summaryItemsView, "setFrame:", 0.0, 0.0, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:](self->_summaryItemsView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKPaymentAuthorizationSummaryItemsView)summaryItemsView
{
  return self->_summaryItemsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryItemsView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end

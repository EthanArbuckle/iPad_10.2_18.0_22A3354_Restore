@implementation PKPassDetailButtonsCell

- (PKPassDetailButtonsCell)initWithReuseIdentifier:(id)a3 widgetViewStyle:(unint64_t)a4
{
  PKPassDetailButtonsCell *v5;
  PKPaymentPassActionWidgetView *v6;
  PKPaymentPassActionWidgetView *widgetView;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPassDetailButtonsCell;
  v5 = -[PKPassDetailButtonsCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 0, a3);
  if (v5)
  {
    v6 = -[PKPaymentPassActionWidgetView initWithWidgetViewStyle:]([PKPaymentPassActionWidgetView alloc], "initWithWidgetViewStyle:", a4);
    widgetView = v5->_widgetView;
    v5->_widgetView = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDetailButtonsCell setBackgroundColor:](v5, "setBackgroundColor:", v8);

    -[PKPassDetailButtonsCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v5->_widgetView);
    -[PKPassDetailButtonsCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D681E8]);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPassDetailButtonsCell;
  -[PKPassDetailButtonsCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PKPassDetailButtonsCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKPaymentPassActionWidgetView setFrame:](self->_widgetView, "setFrame:", v5, v7, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPaymentPassActionWidgetView sizeThatFits:](self->_widgetView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setPaymentPass:(id)a3
{
  -[PKPaymentPassActionWidgetView setPaymentPass:](self->_widgetView, "setPaymentPass:", a3);
}

- (void)setDelegate:(id)a3
{
  -[PKPaymentPassActionWidgetView setDelegate:](self->_widgetView, "setDelegate:", a3);
}

- (void)setAccount:(id)a3
{
  -[PKPaymentPassActionWidgetView setAccount:](self->_widgetView, "setAccount:", a3);
}

- (void)setBankConnectAccount:(id)a3
{
  -[PKPaymentPassActionWidgetView setBankConnectAccount:](self->_widgetView, "setBankConnectAccount:", a3);
}

- (void)setPeerPaymentAccount:(id)a3
{
  -[PKPaymentPassActionWidgetView setPeerPaymentAccount:](self->_widgetView, "setPeerPaymentAccount:", a3);
}

- (void)setCurrentUser:(id)a3
{
  -[PKPaymentPassActionWidgetView setCurrentUser:](self->_widgetView, "setCurrentUser:", a3);
}

- (BOOL)hasEnabledWidgets
{
  return -[PKPaymentPassActionWidgetView hasEnabledWidgets](self->_widgetView, "hasEnabledWidgets");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetView, 0);
}

@end

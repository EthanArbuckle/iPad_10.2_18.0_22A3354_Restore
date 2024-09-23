@implementation PKPassMessageFooterContentView

- (PKPassMessageFooterContentView)initWithPass:(id)a3
{
  return -[PKPassMessageFooterContentView initWithPass:presentationContext:](self, "initWithPass:presentationContext:", a3, 0);
}

- (PKPassMessageFooterContentView)initWithPass:(id)a3 presentationContext:(id)a4
{
  PKPassMessageFooterContentView *v4;
  PKDashboardMessagesView *v5;
  uint64_t v6;
  PKDashboardMessagesView *messagesView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassMessageFooterContentView;
  v4 = -[PKPassFooterContentView initWithPass:presentationContext:](&v9, sel_initWithPass_presentationContext_, a3, 0);
  if (v4)
  {
    v5 = [PKDashboardMessagesView alloc];
    v6 = -[PKDashboardMessagesView initWithInsets:](v5, "initWithInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    messagesView = v4->_messagesView;
    v4->_messagesView = (PKDashboardMessagesView *)v6;

    -[PKPassMessageFooterContentView addSubview:](v4, "addSubview:", v4->_messagesView);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPassMessageFooterContentView;
  -[PKPassFooterContentView layoutSubviews](&v11, sel_layoutSubviews);
  -[PKPassMessageFooterContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[PKDashboardMessagesView sizeThatFits:](self->_messagesView, "sizeThatFits:", v7, v9 + -16.0);
  -[PKDashboardMessagesView setFrame:](self->_messagesView, "setFrame:", v4, v6 + 16.0, v8, v10);
}

- (void)updateWithMessages:(id)a3
{
  -[PKDashboardMessagesView updateWithMessages:currentIndex:](self->_messagesView, "updateWithMessages:currentIndex:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesView, 0);
}

@end

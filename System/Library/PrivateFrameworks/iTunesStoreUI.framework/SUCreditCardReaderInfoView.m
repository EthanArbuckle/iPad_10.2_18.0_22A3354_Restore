@implementation SUCreditCardReaderInfoView

- (SUCreditCardReaderInfoView)initWithFrame:(CGRect)a3
{
  SUCreditCardReaderInfoView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SUCreditCardReaderInfoView;
  v3 = -[SUCreditCardReaderInfoView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[SUCreditCardReaderInfoView setAddCardLabel:](v3, "setAddCardLabel:", v4);

    -[SUCreditCardReaderInfoView addCardLabel](v3, "addCardLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", 1);

    -[SUCreditCardReaderInfoView addCardLabel](v3, "addCardLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CREDIT_CARD_ADD"), &stru_24DE83F60, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v8);

    -[SUCreditCardReaderInfoView addCardLabel](v3, "addCardLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 32.0, *MEMORY[0x24BDF7878]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    -[SUCreditCardReaderInfoView addCardLabel](v3, "addCardLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCreditCardReaderInfoView addSubview:](v3, "addSubview:", v11);

    v12 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[SUCreditCardReaderInfoView setAddCardDetailLabel:](v3, "setAddCardDetailLabel:", v12);

    -[SUCreditCardReaderInfoView addCardDetailLabel](v3, "addCardDetailLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 1);

    -[SUCreditCardReaderInfoView addCardDetailLabel](v3, "addCardDetailLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CREDIT_CARD_POSITION"), &stru_24DE83F60, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v16);

    -[SUCreditCardReaderInfoView addCardDetailLabel](v3, "addCardDetailLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v18);

    -[SUCreditCardReaderInfoView addCardDetailLabel](v3, "addCardDetailLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCreditCardReaderInfoView addSubview:](v3, "addSubview:", v19);

  }
  return v3;
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
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v22.receiver = self;
  v22.super_class = (Class)SUCreditCardReaderInfoView;
  -[SUCreditCardReaderInfoView layoutSubviews](&v22, sel_layoutSubviews);
  -[SUCreditCardReaderInfoView addCardLabel](self, "addCardLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCreditCardReaderInfoView bounds](self, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  v7 = v6;
  v9 = v8;

  -[SUCreditCardReaderInfoView bounds](self, "bounds");
  v10 = CGRectGetMidX(v23) - v7 * 0.5;
  -[SUCreditCardReaderInfoView addCardLabel](self, "addCardLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v10, 25.0, v7, v9);

  -[SUCreditCardReaderInfoView addCardDetailLabel](self, "addCardDetailLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCreditCardReaderInfoView bounds](self, "bounds");
  objc_msgSend(v12, "sizeThatFits:", v13, v14);
  v16 = v15;
  v18 = v17;

  -[SUCreditCardReaderInfoView bounds](self, "bounds");
  v19 = CGRectGetMidX(v24) - v16 * 0.5;
  v25.origin.y = 25.0;
  v25.origin.x = v10;
  v25.size.width = v7;
  v25.size.height = v9;
  v20 = CGRectGetMaxY(v25) + 16.0;
  -[SUCreditCardReaderInfoView addCardDetailLabel](self, "addCardDetailLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v19, v20, v16, v18);

}

- (UILabel)addCardDetailLabel
{
  return self->_addCardDetailLabel;
}

- (void)setAddCardDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_addCardDetailLabel, a3);
}

- (UILabel)addCardLabel
{
  return self->_addCardLabel;
}

- (void)setAddCardLabel:(id)a3
{
  objc_storeStrong((id *)&self->_addCardLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addCardLabel, 0);
  objc_storeStrong((id *)&self->_addCardDetailLabel, 0);
}

@end

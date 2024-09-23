@implementation PXHistoryLineView

- (PXHistoryLineView)initWithHistoryLine:(id)a3
{
  id v4;
  PXHistoryLineView *v5;
  PXStateBadgeView *v6;
  PXStateBadgeView *stateBadgeView;
  UILabel *v8;
  UILabel *reasonLabel;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXHistoryLineView;
  v5 = -[PXHistoryLineView init](&v11, sel_init);
  if (v5)
  {
    v6 = -[PXStateBadgeView initWithState:]([PXStateBadgeView alloc], "initWithState:", 0);
    stateBadgeView = v5->_stateBadgeView;
    v5->_stateBadgeView = v6;

    -[PXHistoryLineView addSubview:](v5, "addSubview:", v5->_stateBadgeView);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    reasonLabel = v5->_reasonLabel;
    v5->_reasonLabel = v8;

    -[UILabel setNumberOfLines:](v5->_reasonLabel, "setNumberOfLines:", 2);
    -[PXHistoryLineView addSubview:](v5, "addSubview:", v5->_reasonLabel);
    -[PXHistoryLineView setHistoryLine:](v5, "setHistoryLine:", v4);
  }

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXHistoryLineView;
  -[PXHistoryLineView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXStateBadgeView setFrame:](self->_stateBadgeView, "setFrame:", 2.0, 3.0, 16.0, 16.0);
  -[UILabel setFrame:](self->_reasonLabel, "setFrame:", 22.0, 0.0, 300.0, 38.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_reasonLabel, "setFont:", v3);

}

- (void)setHistoryLine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStateBadgeView setState:](self->_stateBadgeView, "setState:", v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("agent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (%@): %@"), v7, v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_reasonLabel, "setText:", v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonLabel, 0);
  objc_storeStrong((id *)&self->_stateBadgeView, 0);
}

@end

@implementation PXTextSymbolView

- (PXTextSymbolView)init
{
  PXTextSymbolView *v2;
  UILabel *v3;
  UILabel *label;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXTextSymbolView;
  v2 = -[PXTextSymbolView init](&v6, sel_init);
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v2->_label;
    v2->_label = v3;

    -[UILabel setTextAlignment:](v2->_label, "setTextAlignment:", 1);
    -[PXTextSymbolView addSubview:](v2, "addSubview:", v2->_label);
  }
  return v2;
}

- (PXTextSymbolView)initWithSymbol:(id)a3
{
  id v4;
  PXTextSymbolView *v5;
  PXTextSymbolView *v6;

  v4 = a3;
  v5 = -[PXTextSymbolView init](self, "init");
  v6 = v5;
  if (v5)
    -[PXTextSymbolView setSymbol:](v5, "setSymbol:", v4);

  return v6;
}

- (void)layoutSubviews
{
  UILabel *label;
  void *v4;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)PXTextSymbolView;
  -[PXTextSymbolView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXTextSymbolView bounds](self, "bounds");
  v7 = CGRectInset(v6, -5.0, -5.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
  label = self->_label;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](label, "setFont:", v4);

}

- (void)setSymbol:(id)a3
{
  if (a3)
    -[UILabel setText:](self->_label, "setText:", a3);
  -[PXTextSymbolView setHidden:](self, "setHidden:", a3 == 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

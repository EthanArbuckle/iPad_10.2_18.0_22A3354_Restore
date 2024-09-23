@implementation PKApplySavingsInlineTermsRow

- (PKApplySavingsInlineTermsRow)initWithContent:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PKApplySavingsInlineTermsRow *v9;
  PKApplySavingsInlineTermsRow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplySavingsInlineTermsRow;
  v9 = -[PKApplySavingsInlineTermsRow init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (NSCopying)identifier
{
  return (NSCopying *)CFSTR("inlineTermsCell");
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v4;
  id v5;
  PKApplyFooterContent *content;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  -[PKApplySavingsInlineTermsRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v5 = v4;
    content = self->_content;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __46__PKApplySavingsInlineTermsRow_configureCell___block_invoke;
    v16 = &unk_1E3E62DF8;
    objc_copyWeak(&v17, &location);
    +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:linkTapped:](PKTextRangeHyperlink, "hyperlinkSourcesFromApplyFooter:linkTapped:", content, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyFooterContent footerText](self->_content, "footerText", v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v9);

    objc_msgSend(v5, "setTextAlignment:", 4);
    v10 = PKTableViewCellTextInset();
    objc_msgSend(v5, "setEdgeInsets:", 8.0, v10, 8.0, PKTableViewCellTextInset());
    objc_msgSend(v5, "setSources:", v7);
    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKProvisioningSecondaryBackgroundColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v12);

    objc_msgSend(v5, "setBackgroundConfiguration:", v11);
    objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68100]);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __46__PKApplySavingsInlineTermsRow_configureCell___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "didTapFooterLink:", v5);

}

- (void)didTapFooterLink:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didTapFooterLink:", v5);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_content, 0);
}

@end

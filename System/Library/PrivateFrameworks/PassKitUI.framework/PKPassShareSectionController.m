@implementation PKPassShareSectionController

- (PKPassShareSectionController)initWithIdentifiers:(id)a3
{
  PKPassShareSectionController *v3;
  PKPassShareSectionController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassShareSectionController;
  v3 = -[PKPaymentSetupListSectionController initWithIdentifiers:](&v6, sel_initWithIdentifiers_, a3);
  v4 = v3;
  if (v3)
    -[PKPaymentSetupListSectionController setHeaderDirectionalLayoutMargins:](v3, "setHeaderDirectionalLayoutMargins:", 8.0, 0.0, 8.0, 0.0);
  return v4;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPassShareSectionController;
  -[PKPaymentSetupListSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v19, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInsets");
  v10 = v9;
  v12 = v11;
  v13 = 6.0;
  if (self->_useCompactInsets)
  {
    v14 = 6.0;
  }
  else
  {
    v15 = v8;
    -[PKPaymentSetupListSectionController headerAttributedStringForIdentifier:](self, "headerAttributedStringForIdentifier:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v14 = 0.0;
    else
      v14 = 22.0;
    if (!self->_useCompactInsets)
    {
      -[PKPaymentSetupListSectionController footerAttributedStringForIdentifier:](self, "footerAttributedStringForIdentifier:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        v13 = v15;
      else
        v13 = 10.0;
    }
  }
  objc_msgSend(v7, "setContentInsets:", v14, v10, v13, v12);

  return v7;
}

- (BOOL)useCompactInsets
{
  return self->_useCompactInsets;
}

- (void)setUseCompactInsets:(BOOL)a3
{
  self->_useCompactInsets = a3;
}

@end

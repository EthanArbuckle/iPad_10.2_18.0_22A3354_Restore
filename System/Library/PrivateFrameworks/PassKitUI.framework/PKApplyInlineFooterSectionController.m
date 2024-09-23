@implementation PKApplyInlineFooterSectionController

- (PKApplyInlineFooterSectionController)initWithController:(id)a3 applyPage:(id)a4 content:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  PKApplyInlineFooterSectionController *v13;
  PKApplyInlineFooterSectionController *v14;
  uint64_t v15;
  NSString *identifier;
  objc_super v18;

  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKApplyInlineFooterSectionController;
  v13 = -[PKApplyCollectionViewSectionController initWithController:applyPage:](&v18, sel_initWithController_applyPage_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    objc_storeStrong((id *)&v14->_content, a5);
    objc_msgSend(v11, "footerText");
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

  }
  return v14;
}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_identifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  NSString *identifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  identifier = self->_identifier;
  v8 = (NSString *)v5;
  v9 = identifier;
  if (v9 == v8)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_9;
    }
    v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_9;
  }
  -[PKApplyInlineFooterSectionController _configureContentSection:](self, "_configureContentSection:", v6);
LABEL_9:

  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  NSString *identifier;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  int v12;
  void *v13;
  double v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  identifier = self->_identifier;
  v9 = (NSString *)v7;
  v10 = identifier;
  v11 = v10;
  if (v10 == v9)
  {
    v12 = 1;
  }
  else
  {
    v12 = 0;
    if (v9 && v10)
      v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);
  }

  v16.receiver = self;
  v16.super_class = (Class)PKApplyInlineFooterSectionController;
  -[PKApplyCollectionViewSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v16, sel_layoutWithLayoutEnvironment_sectionIdentifier_, v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInsets");
  if (v12)
    v14 = 16.0;
  objc_msgSend(v13, "setContentInsets:", v14);

  return v13;
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

- (void)_configureContentSection:(id)a3
{
  id v4;
  PKApplySavingsInlineTermsRow *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKApplySavingsInlineTermsRow initWithContent:delegate:]([PKApplySavingsInlineTermsRow alloc], "initWithContent:delegate:", self->_content, self);
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendItems:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

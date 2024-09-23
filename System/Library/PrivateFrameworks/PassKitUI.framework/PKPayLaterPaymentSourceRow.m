@implementation PKPayLaterPaymentSourceRow

- (PKPayLaterPaymentSourceRow)initWithPayLaterPaymentSource:(id)a3 selectionHandler:(id)a4
{
  id v7;
  id v8;
  PKPayLaterPaymentSourceRow *v9;
  PKPayLaterPaymentSourceRow *v10;
  uint64_t v11;
  id selectionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterPaymentSourceRow;
  v9 = -[PKPayLaterPaymentSourceRow init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentSource, a3);
    v11 = objc_msgSend(v8, "copy");
    selectionHandler = v10->_selectionHandler;
    v10->_selectionHandler = (id)v11;

  }
  return v10;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  -[PKPayLaterPaymentSource identifier](self->_paymentSource, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  if (self->_disabled)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("disabled-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  if (self->_selected)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("selected-%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSCopying *)v11;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterPaymentSourceRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 1);

  v7 = -[PKPayLaterPaymentSource type](self->_paymentSource, "type");
  switch(v7)
  {
    case 3:
      -[PKPayLaterPaymentSource fundingSource](self->_paymentSource, "fundingSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v10);

      objc_msgSend(v8, "panSuffix");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v12 = (void *)v11;
      objc_msgSend(v5, "setSecondaryText:", v11);
      goto LABEL_11;
    case 2:
      -[PKPayLaterPaymentSource accountPaymentFundingSource](self->_paymentSource, "accountPaymentFundingSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bankAccountRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bankName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v13);

      objc_msgSend(v12, "maskedAccountNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSecondaryText:", v14);

LABEL_11:
      goto LABEL_12;
    case 1:
      -[PKPayLaterPaymentSource paymentPass](self->_paymentSource, "paymentPass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v9);

      if (self->_overrideSecondaryText)
      {
        objc_msgSend(v5, "setSecondaryText:");
LABEL_12:

        break;
      }
      PKSanitizedPrimaryAccountRepresentationForPass();
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
  }
  objc_msgSend(v5, "secondaryTextProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setColor:", v16);

  objc_msgSend(v5, "setImage:", self->_image);
  objc_msgSend(v5, "setDirectionalLayoutMargins:", 15.0, 0.0, 15.0, 0.0);
  if (self->_selected)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0DC3548]);
    v19[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v4, "setAccessories:", v18);
  objc_msgSend(v4, "setContentConfiguration:", v5);
  objc_msgSend(v4, "setUserInteractionEnabled:", !self->_disabled);

LABEL_17:
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentSource);
  v4 = _Block_copy(self->_selectionHandler);
  objc_msgSend(v3, "safelyAddObject:", v4);

  PKCombinedHash();
  PKIntegerHash();
  v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterPaymentSourceRow *v4;
  PKPayLaterPaymentSourceRow *v5;
  const void **v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (PKPayLaterPaymentSourceRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
    {
      v7 = _Block_copy(self->_selectionHandler);
      v8 = _Block_copy(v6[2]);
      v9 = PKEqualObjects()
        && self->_selected == *((unsigned __int8 *)v6 + 25)
        && self->_disabled == *((unsigned __int8 *)v6 + 24);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)handleCellSelection
{
  void (**selectionHandler)(void);

  selectionHandler = (void (**)(void))self->_selectionHandler;
  if (selectionHandler)
    selectionHandler[2]();
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler && !self->_selected;
}

- (NSString)overrideSecondaryText
{
  return self->_overrideSecondaryText;
}

- (void)setOverrideSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_overrideSecondaryText, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_paymentSource, 0);
}

@end

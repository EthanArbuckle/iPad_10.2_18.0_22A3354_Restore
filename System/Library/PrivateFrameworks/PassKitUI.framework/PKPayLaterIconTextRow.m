@implementation PKPayLaterIconTextRow

- (PKPayLaterIconTextRow)initWithPrimaryTitle:(id)a3 identifier:(id)a4 selectionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPayLaterIconTextRow *v12;
  PKPayLaterIconTextRow *v13;
  void *v14;
  id selectionHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterIconTextRow;
  v12 = -[PKPayLaterIconTextRow init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_primaryText, a3);
    objc_storeStrong((id *)&v13->_identifier, a4);
    v14 = _Block_copy(v11);
    selectionHandler = v13->_selectionHandler;
    v13->_selectionHandler = v14;

  }
  return v13;
}

+ (id)rowConfiguredForDisputeLayoutWithFinancingPlan:(id)a3 payment:(id)a4 selectionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  PKPayLaterIconTextRow *v12;
  void *v13;
  PKPayLaterIconTextRow *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  void *v48;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "merchant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayName");
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = [PKPayLaterIconTextRow alloc];
  objc_msgSend(v7, "planIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v11;
  v14 = -[PKPayLaterIconTextRow initWithPrimaryTitle:identifier:selectionHandler:](v12, "initWithPrimaryTitle:identifier:selectionHandler:", v11, v13, v9);
  v47 = v9;

  v15 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCalendar:", v16);

  objc_msgSend(v15, "setDateStyle:", 1);
  if (v8)
  {
    PKLocalizedCocoonString(CFSTR("APPLE_PAY_LATER_PAYMENT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "amount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "formattedStringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "planSummary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transactionDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    switch(objc_msgSend(v7, "state"))
    {
      case 2:
      case 3:
        v24 = (void *)MEMORY[0x1E0CB3940];
        PKLocalizedCocoonString(CFSTR("INSTALLMENT_PENDING"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ - %@"), v17, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      case 5:
        objc_msgSend(v7, "planSummary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "cancellationDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v15, "stringFromDate:", v25);
          v29 = objc_claimAutoreleasedReturnValue();
          PKLocalizedCocoonString(CFSTR("INSTALLMENT_CANCELED_DATE"), CFSTR("%@"), v29);
          v27 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v29;
        }
        else
        {
          PKLocalizedCocoonString(CFSTR("INSTALLMENT_CANCELED"));
          v26 = objc_claimAutoreleasedReturnValue();
LABEL_5:
          v27 = v26;
        }

        v17 = (void *)v27;
        goto LABEL_15;
      case 6:
        objc_msgSend(v7, "scheduleSummary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastPayment");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "postedDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v15, "stringFromDate:", v31);
          v32 = objc_claimAutoreleasedReturnValue();
          PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID_DATE"), CFSTR("%@"), v32);
          v33 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v32;
        }
        else
        {
          PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID"));
          v33 = objc_claimAutoreleasedReturnValue();
        }

        v17 = (void *)v33;
        goto LABEL_15;
      case 8:
        PKLocalizedCocoonString(CFSTR("INSTALLMENT_PENDING_CANCELLATION"));
        v25 = v17;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        break;
      default:
        break;
    }
    objc_msgSend(v7, "planSummary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "totalAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "formattedStringValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_TOTAL_AMOUNT"), CFSTR("%@"), v35);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }
    else
    {
      v21 = 0;
      v19 = 0;
    }
  }
  v36 = v8;

  -[PKPayLaterIconTextRow setSecondaryText:](v14, "setSecondaryText:", v17);
  -[PKPayLaterIconTextRow setTertiaryText:](v14, "setTertiaryText:", v19);
  -[PKPayLaterIconTextRow setAmountText:](v14, "setAmountText:", v21);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterIconTextRow setPrimaryTextColor:](v14, "setPrimaryTextColor:", v37);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterIconTextRow setAmountTextColor:](v14, "setAmountTextColor:", v38);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterIconTextRow setSecondaryTextColor:](v14, "setSecondaryTextColor:", v39);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterIconTextRow setTertiaryTextColor:](v14, "setTertiaryTextColor:", v40);

  v41 = (void *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 32770, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterIconTextRow setPrimaryFont:](v14, "setPrimaryFont:", v42);

  v43 = (void *)*MEMORY[0x1E0DC4B10];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], v41, 0x8000, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterIconTextRow setSecondaryFont:](v14, "setSecondaryFont:", v44);

  PKFontForDefaultDesign(v43, v41, 0x8000, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterIconTextRow setTertiaryFont:](v14, "setTertiaryFont:", v45);

  -[PKPayLaterIconTextRow setAccessory:](v14, "setAccessory:", v47 != 0);
  -[PKPayLaterIconTextRow setMaskType:](v14, "setMaskType:", 3);
  -[PKPayLaterIconTextRow setMinimumHeight:](v14, "setMinimumHeight:", 76.0);

  return v14;
}

- (NSCopying)identifier
{
  return (NSCopying *)(id)-[NSString copy](self->_identifier, "copy");
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  NSString *primaryText;
  id v5;
  id v6;

  v6 = a3;
  -[PKPayLaterIconTextRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    primaryText = self->_primaryText;
    v5 = v6;
    objc_msgSend(v5, "setPrimaryText:", primaryText);
    objc_msgSend(v5, "setSecondaryText:", self->_secondaryText);
    objc_msgSend(v5, "setTertiaryText:", self->_tertiaryText);
    objc_msgSend(v5, "setAmountText:", self->_amountText);
    objc_msgSend(v5, "setAccessory:", self->_accessory);
    objc_msgSend(v5, "setIcon:animated:", self->_icon, 1);
    objc_msgSend(v5, "setMaskType:", self->_maskType);
    objc_msgSend(v5, "setPrimaryTextColor:", self->_primaryTextColor);
    objc_msgSend(v5, "setSecondaryTextColor:", self->_secondaryTextColor);
    objc_msgSend(v5, "setTertiaryTextColor:", self->_tertiaryTextColor);
    objc_msgSend(v5, "setAmountTextColor:", self->_amountTextColor);
    objc_msgSend(v5, "setPrimaryFont:", self->_primaryFont);
    objc_msgSend(v5, "setSecondaryFont:", self->_secondaryFont);
    objc_msgSend(v5, "setTertiaryFont:", self->_tertiaryFont);
    objc_msgSend(v5, "setAmountFont:", self->_amountFont);
    objc_msgSend(v5, "setMinimumHeight:", self->_minimumHeight);

  }
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryText);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryText);
  objc_msgSend(v3, "safelyAddObject:", self->_tertiaryText);
  objc_msgSend(v3, "safelyAddObject:", self->_amountText);
  objc_msgSend(v3, "safelyAddObject:", self->_icon);
  v4 = _Block_copy(self->_selectionHandler);
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_primaryTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_tertiaryTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_amountTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryFont);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryFont);
  objc_msgSend(v3, "safelyAddObject:", self->_tertiaryFont);
  objc_msgSend(v3, "safelyAddObject:", self->_amountFont);
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterIconTextRow *v4;
  PKPayLaterIconTextRow *v5;
  PKPayLaterIconTextRow *v6;
  NSString *primaryText;
  NSString *v8;
  NSString *v9;
  void *v10;
  _BOOL4 v11;
  NSString *secondaryText;
  NSString *v13;
  NSString *tertiaryText;
  NSString *v15;
  NSString *amountText;
  NSString *v17;

  v4 = (PKPayLaterIconTextRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        primaryText = v6->_primaryText;
        v8 = self->_primaryText;
        v9 = primaryText;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
            goto LABEL_45;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_46;
        }
        secondaryText = v6->_secondaryText;
        v8 = self->_secondaryText;
        v13 = secondaryText;
        if (v8 == v13)
        {

        }
        else
        {
          v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13)
            goto LABEL_45;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v13);

          if (!v11)
            goto LABEL_46;
        }
        tertiaryText = v6->_tertiaryText;
        v8 = self->_tertiaryText;
        v15 = tertiaryText;
        if (v8 == v15)
        {

        }
        else
        {
          v10 = v15;
          LOBYTE(v11) = 0;
          if (!v8 || !v15)
            goto LABEL_45;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v15);

          if (!v11)
            goto LABEL_46;
        }
        amountText = v6->_amountText;
        v8 = self->_amountText;
        v17 = amountText;
        if (v8 == v17)
        {

        }
        else
        {
          v10 = v17;
          LOBYTE(v11) = 0;
          if (!v8 || !v17)
            goto LABEL_45;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v17);

          if (!v11)
            goto LABEL_46;
        }
        if (!PKEqualObjects())
        {
          LOBYTE(v11) = 0;
LABEL_46:

          goto LABEL_47;
        }
        v8 = (NSString *)_Block_copy(self->_selectionHandler);
        v10 = _Block_copy(v6->_selectionHandler);
        LOBYTE(v11) = PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && self->_accessory == v6->_accessory
                   && self->_maskType == v6->_maskType
                   && self->_minimumHeight == v6->_minimumHeight;
LABEL_45:

        goto LABEL_46;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_47:

  return v11;
}

- (void)handleCellSelectionWithContinueBlock:(id)a3
{
  void (**selectionHandler)(id, id);

  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler)
    selectionHandler[2](selectionHandler, a3);
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler != 0;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (void)setTertiaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)amountText
{
  return self->_amountText;
}

- (void)setAmountText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (unint64_t)maskType
{
  return self->_maskType;
}

- (void)setMaskType:(unint64_t)a3
{
  self->_maskType = a3;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(unint64_t)a3
{
  self->_accessory = a3;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColor, a3);
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextColor, a3);
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (void)setTertiaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryTextColor, a3);
}

- (UIColor)amountTextColor
{
  return self->_amountTextColor;
}

- (void)setAmountTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_amountTextColor, a3);
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (void)setPrimaryFont:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFont, a3);
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (void)setSecondaryFont:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryFont, a3);
}

- (UIFont)tertiaryFont
{
  return self->_tertiaryFont;
}

- (void)setTertiaryFont:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryFont, a3);
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (void)setAmountFont:(id)a3
{
  objc_storeStrong((id *)&self->_amountFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_tertiaryFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
}

@end

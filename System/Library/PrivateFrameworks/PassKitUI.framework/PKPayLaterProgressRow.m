@implementation PKPayLaterProgressRow

- (PKPayLaterProgressRow)initWithRowIndex:(int64_t)a3 selectionHandler:(id)a4
{
  return -[PKPayLaterProgressRow initWithRowIndex:primaryText:secondaryText:amountText:selectionHandler:](self, "initWithRowIndex:primaryText:secondaryText:amountText:selectionHandler:", a3, 0, 0, 0, a4);
}

- (PKPayLaterProgressRow)initWithRowIndex:(int64_t)a3 primaryText:(id)a4 secondaryText:(id)a5 amountText:(id)a6 selectionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKPayLaterProgressRow *v16;
  PKPayLaterProgressRow *v17;
  uint64_t v18;
  NSAttributedString *primaryText;
  uint64_t v20;
  NSAttributedString *secondaryText;
  uint64_t v22;
  NSAttributedString *amountText;
  uint64_t v24;
  id selectionHandler;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PKPayLaterProgressRow;
  v16 = -[PKPayLaterProgressRow init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_rowIndex = a3;
    objc_msgSend(v12, "pk_attributedString");
    v18 = objc_claimAutoreleasedReturnValue();
    primaryText = v17->_primaryText;
    v17->_primaryText = (NSAttributedString *)v18;

    objc_msgSend(v13, "pk_attributedString");
    v20 = objc_claimAutoreleasedReturnValue();
    secondaryText = v17->_secondaryText;
    v17->_secondaryText = (NSAttributedString *)v20;

    objc_msgSend(v14, "pk_attributedString");
    v22 = objc_claimAutoreleasedReturnValue();
    amountText = v17->_amountText;
    v17->_amountText = (NSAttributedString *)v22;

    v24 = objc_msgSend(v15, "copy");
    selectionHandler = v17->_selectionHandler;
    v17->_selectionHandler = (id)v24;

  }
  return v17;
}

+ (id)progressRowsWithInstallmentCount:(int64_t)a3 firstRowFont:(id)a4 dynamicContentPage:(id)a5
{
  objc_class *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __objc2_class **v12;
  id v13;
  id v14;
  PKPayLaterProgressRow *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v39;
  void *v40;
  id v42;
  id v43;
  id v44;
  id v45;

  v43 = a5;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  v42 = objc_alloc_init(v7);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v9 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v9;
  if (v8)
    v10 = v8;
  else
    v10 = (void *)v9;
  v39 = v10;

  if (a3 >= 1)
  {
    v11 = 0;
    v12 = off_1E3E1B000;
    while (1)
    {
      v44 = 0;
      v45 = 0;
      objc_msgSend(a1, "_purchaseStringsForInstallmentNumber:title:amountString:dynamicContentPage:", v11, &v45, &v44, v43);
      v13 = v45;
      v14 = v44;
      v15 = -[PKPayLaterProgressRow initWithRowIndex:primaryText:secondaryText:amountText:selectionHandler:]([PKPayLaterProgressRow alloc], "initWithRowIndex:primaryText:secondaryText:amountText:selectionHandler:", v11, v13, 0, v14, 0);

      if (v11 == 1)
        break;
      if (v11)
      {
        v33 = objc_alloc(v12[158]);
        PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v33, "initWithTopGradientColor:bottomGradientColor:", v34, v35);

        if (v11 + 1 >= a3)
        {
          v22 = 0;
          ++v11;
          v24 = v40;
          v25 = 2;
          goto LABEL_14;
        }
        v36 = objc_alloc(v12[158]);
        PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v36, "initWithTopGradientColor:bottomGradientColor:", v19, v21);
        goto LABEL_12;
      }
      v16 = (void *)MEMORY[0x1E0DC3658];
      PKPayLaterPaymentScheduleVerticalConnectorGreenColor();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pkui_blendFromColor:toColor:withProgress:", v17, v18, 0.5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_alloc(v12[158]);
      PKPayLaterPaymentScheduleVerticalConnectorGreenColor();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithTopGradientColor:bottomGradientColor:", v21, v19);
      v23 = 0;
      v24 = v39;
      v25 = 3;
LABEL_13:

      ++v11;
LABEL_14:
      -[PKPayLaterProgressRow setTargetType:](v15, "setTargetType:", v25);
      -[PKPayLaterProgressRow setTopConnector:](v15, "setTopConnector:", v23);
      -[PKPayLaterProgressRow setBottomConnector:](v15, "setBottomConnector:", v22);
      -[PKPayLaterProgressRow setPrimaryFont:](v15, "setPrimaryFont:", v24);
      -[PKPayLaterProgressRow setAmountFont:](v15, "setAmountFont:", v24);
      objc_msgSend(v42, "addObject:", v15);

      v12 = off_1E3E1B000;
      if (v11 == a3)
        goto LABEL_17;
    }
    v26 = (void *)MEMORY[0x1E0DC3658];
    PKPayLaterPaymentScheduleVerticalConnectorGreenColor();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pkui_blendFromColor:toColor:withProgress:", v27, v28, 0.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_alloc(v12[158]);
    PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v29, "initWithTopGradientColor:bottomGradientColor:", v19, v30);

    v31 = objc_alloc(v12[158]);
    PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v31, "initWithTopGradientColor:bottomGradientColor:", v21, v32);

LABEL_12:
    v24 = v40;
    v25 = 2;
    goto LABEL_13;
  }
LABEL_17:
  v37 = (void *)objc_msgSend(v42, "copy");

  return v37;
}

+ (void)_purchaseStringsForInstallmentNumber:(unint64_t)a3 title:(id *)a4 amountString:(id *)a5 dynamicContentPage:(id)a6
{
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a6, "sections");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 > a3)
    {
      objc_msgSend(v9, "rows");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        objc_msgSend(v14, "contentTitle");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a5)
      {
        objc_msgSend(v14, "contentDetailTrailing");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v9 = 0;
  }

}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  NSAttributedString *primaryText;
  void *v7;
  NSAttributedString *secondaryText;
  void *v9;
  NSAttributedString *tertiaryText;
  void *v11;
  NSAttributedString *amountText;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  primaryText = self->_primaryText;
  if (primaryText)
  {
    -[NSAttributedString string](primaryText, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v7);

  }
  secondaryText = self->_secondaryText;
  if (secondaryText)
  {
    -[NSAttributedString string](secondaryText, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v9);

  }
  tertiaryText = self->_tertiaryText;
  if (tertiaryText)
  {
    -[NSAttributedString string](tertiaryText, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v11);

  }
  amountText = self->_amountText;
  if (amountText)
  {
    -[NSAttributedString string](amountText, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v13);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("rowIndex:%ld"), self->_rowIndex);
  if (self->_topConnector)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasTopConnector-%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v15);

  if (self->_bottomConnector)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasBottomConnector-%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v17);

  v18 = (void *)objc_msgSend(v3, "copy");
  return (NSCopying *)v18;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PKPayLaterProgressRow cellClass](self, "cellClass");
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v8;
    objc_msgSend(v6, "setPrimaryText:", self->_primaryText);
    objc_msgSend(v6, "setSecondaryText:", self->_secondaryText);
    objc_msgSend(v6, "setTertiaryText:", self->_tertiaryText);
    objc_msgSend(v6, "setAmountText:", self->_amountText);
    objc_msgSend(v6, "setShowChevron:", self->_showChevron);
    objc_msgSend(v6, "setTopConnector:", self->_topConnector);
    objc_msgSend(v6, "setBottomConnector:", self->_bottomConnector);
    objc_msgSend(v6, "setTargetType:", self->_targetType);
    objc_msgSend(v6, "setPrimaryTextColor:", self->_primaryTextColor);
    objc_msgSend(v6, "setSecondaryTextColor:", self->_secondaryTextColor);
    objc_msgSend(v6, "setTertiaryTextColor:", self->_tertiaryTextColor);
    objc_msgSend(v6, "setAmountTextColor:", self->_amountTextColor);
    objc_msgSend(v6, "setPrimaryFont:", self->_primaryFont);
    objc_msgSend(v6, "setSecondaryFont:", self->_secondaryFont);
    objc_msgSend(v6, "setAmountFont:", self->_amountFont);
    objc_msgSend(v6, "setMinimumHeight:", self->_minimumHeight);
    objc_msgSend(v6, "setCenterPrimaryText:", self->_centerPrimaryText);
    objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F10]);
    if (self->_backgroundColor)
    {
      objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", self->_backgroundColor);
      objc_msgSend(v6, "setBackgroundConfiguration:", v7);

    }
    v5 = v8;
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
  objc_msgSend(v3, "safelyAddObject:", self->_amountText);
  objc_msgSend(v3, "safelyAddObject:", self->_tertiaryText);
  objc_msgSend(v3, "safelyAddObject:", self->_topConnector);
  objc_msgSend(v3, "safelyAddObject:", self->_bottomConnector);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_tertiaryTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_amountTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryFont);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryFont);
  objc_msgSend(v3, "safelyAddObject:", self->_amountFont);
  v4 = _Block_copy(self->_selectionHandler);
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_backgroundColor);
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterProgressRow *v4;
  PKPayLaterProgressRow *v5;
  const void **v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (PKPayLaterProgressRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects()
      && PKEqualObjects())
    {
      v7 = _Block_copy(self->_selectionHandler);
      v8 = _Block_copy(v6[19]);
      v9 = PKEqualObjects()
        && PKEqualObjects()
        && self->_showChevron == *((unsigned __int8 *)v6 + 8)
        && self->_minimumHeight == *((double *)v6 + 15)
        && self->_centerPrimaryText == *((unsigned __int8 *)v6 + 9)
        && (const void *)self->_rowIndex == v6[2]
        && self->_targetType == (_QWORD)v6[18];

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

- (NSString)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("primaryText: '%@'; "), self->_primaryText);
  objc_msgSend(v3, "appendFormat:", CFSTR("secondaryText: '%@'; "), self->_secondaryText);
  objc_msgSend(v3, "appendFormat:", CFSTR("tertiaryText: '%@'; "), self->_tertiaryText);
  objc_msgSend(v3, "appendFormat:", CFSTR("amountText: '%@'; "), self->_amountText);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
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
  return self->_selectionHandler != 0;
}

- (BOOL)showChevron
{
  return self->_showChevron;
}

- (void)setShowChevron:(BOOL)a3
{
  self->_showChevron = a3;
}

- (int64_t)rowIndex
{
  return self->_rowIndex;
}

- (NSAttributedString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSAttributedString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSAttributedString)tertiaryText
{
  return self->_tertiaryText;
}

- (void)setTertiaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSAttributedString)amountText
{
  return self->_amountText;
}

- (void)setAmountText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
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

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (void)setAmountFont:(id)a3
{
  objc_storeStrong((id *)&self->_amountFont, a3);
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (PKGradientVerticalConnector)topConnector
{
  return self->_topConnector;
}

- (void)setTopConnector:(id)a3
{
  objc_storeStrong((id *)&self->_topConnector, a3);
}

- (PKGradientVerticalConnector)bottomConnector
{
  return self->_bottomConnector;
}

- (void)setBottomConnector:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConnector, a3);
}

- (unint64_t)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(unint64_t)a3
{
  self->_targetType = a3;
}

- (BOOL)centerPrimaryText
{
  return self->_centerPrimaryText;
}

- (void)setCenterPrimaryText:(BOOL)a3
{
  self->_centerPrimaryText = a3;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_bottomConnector, 0);
  objc_storeStrong((id *)&self->_topConnector, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end

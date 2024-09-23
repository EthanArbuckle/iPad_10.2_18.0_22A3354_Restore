@implementation PKPayLaterTitleDetailValueRow

- (PKPayLaterTitleDetailValueRow)initWithTitle:(id)a3 detail:(id)a4 value:(id)a5 accessory:(unint64_t)a6 selectionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPayLaterTitleDetailValueRow *v17;
  PKPayLaterTitleDetailValueRow *v18;
  uint64_t v19;
  id selectionHandler;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PKPayLaterTitleDetailValueRow;
  v17 = -[PKPayLaterTitleDetailValueRow init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_detail, a4);
    objc_storeStrong((id *)&v18->_value, a5);
    v18->_accessory = a6;
    v19 = objc_msgSend(v16, "copy");
    selectionHandler = v18->_selectionHandler;
    v18->_selectionHandler = (id)v19;

  }
  return v18;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  if (self->_title)
    objc_msgSend(v3, "appendString:");
  if (self->_detail)
    objc_msgSend(v3, "appendString:");
  if (self->_value)
    objc_msgSend(v3, "appendString:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_accessory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSCopying *)v8;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  NSString *title;
  id v5;
  id v6;

  v6 = a3;
  -[PKPayLaterTitleDetailValueRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    title = self->_title;
    v5 = v6;
    objc_msgSend(v5, "setTitleText:", title);
    objc_msgSend(v5, "setDetailText:", self->_detail);
    objc_msgSend(v5, "setDetailIcon:", self->_detailIcon);
    objc_msgSend(v5, "setValueText:", self->_value);
    objc_msgSend(v5, "setTitleColor:", self->_titleColor);
    objc_msgSend(v5, "setDetailColor:", self->_detailColor);
    objc_msgSend(v5, "setValueColor:", self->_valueColor);
    objc_msgSend(v5, "setTitleFont:", self->_titleFont);
    objc_msgSend(v5, "setDetailFont:", self->_detailFont);
    objc_msgSend(v5, "setValueFont:", self->_valueFont);
    objc_msgSend(v5, "setAccessory:", self->_accessory);
    objc_msgSend(v5, "setHorizontalMargin:", self->_horizontalMargin);
    objc_msgSend(v5, "setVerticalMargin:", self->_verticalMargin);
    objc_msgSend(v5, "setLabelPadding:", self->_labelPadding);
    objc_msgSend(v5, "setAccessibilityIdentifier:", self->_axID);

  }
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_detail);
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  objc_msgSend(v3, "safelyAddObject:", self->_titleColor);
  objc_msgSend(v3, "safelyAddObject:", self->_detailColor);
  objc_msgSend(v3, "safelyAddObject:", self->_valueColor);
  objc_msgSend(v3, "safelyAddObject:", self->_titleFont);
  objc_msgSend(v3, "safelyAddObject:", self->_detailFont);
  objc_msgSend(v3, "safelyAddObject:", self->_valueFont);
  objc_msgSend(v3, "safelyAddObject:", self->_detailIcon);
  v4 = _Block_copy(self->_selectionHandler);
  objc_msgSend(v3, "safelyAddObject:", v4);

  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterTitleDetailValueRow *v4;
  PKPayLaterTitleDetailValueRow *v5;
  PKPayLaterTitleDetailValueRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  void *v10;
  _BOOL4 v11;
  NSString *value;
  NSString *v13;

  v4 = (PKPayLaterTitleDetailValueRow *)a3;
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
        title = v6->_title;
        v8 = self->_title;
        v9 = title;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
            goto LABEL_33;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_34;
        }
        if (!PKEqualObjects())
          goto LABEL_31;
        value = v6->_value;
        v8 = self->_value;
        v13 = value;
        if (v8 == v13)
        {

          goto LABEL_19;
        }
        v10 = v13;
        LOBYTE(v11) = 0;
        if (v8 && v13)
        {
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v13);

          if (!v11)
            goto LABEL_34;
LABEL_19:
          if (PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects())
          {
            v8 = (NSString *)_Block_copy(self->_selectionHandler);
            v10 = _Block_copy(v6->_selectionHandler);
            LOBYTE(v11) = PKEqualObjects()
                       && self->_accessory == v6->_accessory
                       && self->_horizontalMargin == v6->_horizontalMargin
                       && self->_labelPadding == v6->_labelPadding
                       && self->_verticalMargin == v6->_verticalMargin;
            goto LABEL_33;
          }
LABEL_31:
          LOBYTE(v11) = 0;
LABEL_34:

          goto LABEL_35;
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_35:

  return v11;
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

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIImage)detailIcon
{
  return self->_detailIcon;
}

- (void)setDetailIcon:(id)a3
{
  objc_storeStrong((id *)&self->_detailIcon, a3);
}

- (UIColor)detailColor
{
  return self->_detailColor;
}

- (void)setDetailColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailColor, a3);
}

- (UIFont)detailFont
{
  return self->_detailFont;
}

- (void)setDetailFont:(id)a3
{
  objc_storeStrong((id *)&self->_detailFont, a3);
}

- (UIColor)valueColor
{
  return self->_valueColor;
}

- (void)setValueColor:(id)a3
{
  objc_storeStrong((id *)&self->_valueColor, a3);
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (void)setValueFont:(id)a3
{
  objc_storeStrong((id *)&self->_valueFont, a3);
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (void)setHorizontalMargin:(double)a3
{
  self->_horizontalMargin = a3;
}

- (double)verticalMargin
{
  return self->_verticalMargin;
}

- (void)setVerticalMargin:(double)a3
{
  self->_verticalMargin = a3;
}

- (double)labelPadding
{
  return self->_labelPadding;
}

- (void)setLabelPadding:(double)a3
{
  self->_labelPadding = a3;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(unint64_t)a3
{
  self->_accessory = a3;
}

- (NSString)axID
{
  return self->_axID;
}

- (void)setAxID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axID, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_valueColor, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_detailColor, 0);
  objc_storeStrong((id *)&self->_detailIcon, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

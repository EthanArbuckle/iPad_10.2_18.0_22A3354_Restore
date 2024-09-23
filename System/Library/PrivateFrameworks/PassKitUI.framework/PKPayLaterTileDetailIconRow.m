@implementation PKPayLaterTileDetailIconRow

- (PKPayLaterTileDetailIconRow)initWithTitle:(id)a3 detail:(id)a4 iconImage:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPayLaterTileDetailIconRow *v12;
  PKPayLaterTileDetailIconRow *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterTileDetailIconRow;
  v12 = -[PKPayLaterTileDetailIconRow init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_detail, a4);
    objc_storeStrong((id *)&v13->_icon, a5);
  }

  return v13;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  if (self->_title)
    objc_msgSend(v3, "appendString:");
  if (self->_detail)
    objc_msgSend(v3, "appendString:");
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSCopying *)v6;
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
  -[PKPayLaterTileDetailIconRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    title = self->_title;
    v5 = v6;
    objc_msgSend(v5, "setTitleText:", title);
    objc_msgSend(v5, "setDetailText:", self->_detail);
    objc_msgSend(v5, "setTitleFont:", self->_titleFont);
    objc_msgSend(v5, "setDetailFont:", self->_detailFont);
    objc_msgSend(v5, "setTitleTextColor:", self->_titleTextColor);
    objc_msgSend(v5, "setDetailTextColor:", self->_detailTextColor);
    objc_msgSend(v5, "setIcon:", self->_icon);
    objc_msgSend(v5, "setAdditionalIconPadding:", self->_additionalIconPadding);
    objc_msgSend(v5, "setCenterTitleText:", self->_centerTitleText);
    objc_msgSend(v5, "setCenterDetailText:", self->_centerDetailText);
    objc_msgSend(v5, "setAccessibilityIdentifier:", self->_axID);

  }
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_detail);
  objc_msgSend(v3, "safelyAddObject:", self->_icon);
  objc_msgSend(v3, "safelyAddObject:", self->_titleFont);
  objc_msgSend(v3, "safelyAddObject:", self->_detailFont);
  objc_msgSend(v3, "safelyAddObject:", self->_titleTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_detailTextColor);
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterTileDetailIconRow *v4;
  PKPayLaterTileDetailIconRow *v5;
  PKPayLaterTileDetailIconRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *detail;
  NSString *v14;
  _BOOL4 v15;

  v4 = (PKPayLaterTileDetailIconRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
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
          if (!v8 || !v9)
            goto LABEL_17;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_27;
        }
        detail = v6->_detail;
        v8 = self->_detail;
        v14 = detail;
        if (v8 == v14)
        {

LABEL_19:
          if (PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && self->_additionalIconPadding == v6->_additionalIconPadding
            && self->_centerTitleText == v6->_centerTitleText)
          {
            v12 = self->_centerDetailText == v6->_centerDetailText;
LABEL_28:

            goto LABEL_29;
          }
LABEL_27:
          v12 = 0;
          goto LABEL_28;
        }
        v10 = v14;
        if (v8 && v14)
        {
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (!v15)
            goto LABEL_27;
          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_27;
      }
    }
    v12 = 0;
  }
LABEL_29:

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)axID
{
  return self->_axID;
}

- (void)setAxID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIFont)detailFont
{
  return self->_detailFont;
}

- (void)setDetailFont:(id)a3
{
  objc_storeStrong((id *)&self->_detailFont, a3);
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextColor, a3);
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (void)setDetailTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextColor, a3);
}

- (double)additionalIconPadding
{
  return self->_additionalIconPadding;
}

- (void)setAdditionalIconPadding:(double)a3
{
  self->_additionalIconPadding = a3;
}

- (BOOL)centerTitleText
{
  return self->_centerTitleText;
}

- (void)setCenterTitleText:(BOOL)a3
{
  self->_centerTitleText = a3;
}

- (BOOL)centerDetailText
{
  return self->_centerDetailText;
}

- (void)setCenterDetailText:(BOOL)a3
{
  self->_centerDetailText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_axID, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

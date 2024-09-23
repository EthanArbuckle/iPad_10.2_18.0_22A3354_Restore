@implementation PKPayLaterSubtitleRow

- (PKPayLaterSubtitleRow)initWithTitle:(id)a3 subtitle:(id)a4 selectionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPayLaterSubtitleRow *v12;
  PKPayLaterSubtitleRow *v13;
  uint64_t v14;
  id selectionHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterSubtitleRow;
  v12 = -[PKPayLaterSubtitleRow init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
    v14 = objc_msgSend(v11, "copy");
    selectionHandler = v13->_selectionHandler;
    v13->_selectionHandler = (id)v14;

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
  if (self->_subtitle)
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
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterSubtitleRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_title)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", self->_title);
    else
      v5 = 0;
    if (self->_titleIcon)
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E3E7D690);
      v7 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      objc_msgSend(v7, "setImage:", self->_titleIcon);
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendAttributedString:", v8);
      if (v5)
        objc_msgSend(v6, "appendAttributedString:", v5);

    }
    else
    {
      v6 = v5;
    }
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedText:", v6);
    objc_msgSend(v9, "setSecondaryText:", self->_subtitle);
    objc_msgSend(v9, "textProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v11);

    if (self->_titleFont)
    {
      objc_msgSend(v9, "textProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", self->_titleFont);

    }
    if (self->_titleTextColor)
    {
      objc_msgSend(v9, "textProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setColor:", self->_titleTextColor);

    }
    objc_msgSend(v9, "secondaryTextProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColor:", v15);

    if (self->_subtitleFont)
    {
      objc_msgSend(v9, "secondaryTextProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", self->_subtitleFont);

    }
    if (self->_subtitleTextColor)
    {
      objc_msgSend(v9, "secondaryTextProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setColor:", self->_subtitleTextColor);

    }
    objc_msgSend(v9, "setDirectionalLayoutMargins:", 15.0, 0.0, 15.0, 0.0);
    if (self->_showSpinner)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0DC3438]);
      objc_msgSend(v18, "startAnimating");
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v18, 1);
      v26[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (self->_selected)
      {
        v18 = objc_alloc_init(MEMORY[0x1E0DC3548]);
        v25 = v18;
        v21 = (void *)MEMORY[0x1E0C99D20];
        v22 = &v25;
      }
      else
      {
        if (!self->_selectionHandler || self->_hideDisclosure)
        {
          v20 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_24;
        }
        v18 = objc_alloc_init(MEMORY[0x1E0DC3568]);
        v24 = v18;
        v21 = (void *)MEMORY[0x1E0C99D20];
        v22 = &v24;
      }
      objc_msgSend(v21, "arrayWithObjects:count:", v22, 1, v24, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_24:
    objc_msgSend(v4, "setAccessories:", v20);
    objc_msgSend(v4, "setContentConfiguration:", v9);
    objc_msgSend(v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pkui_setExcludedFromScreenCapture:andBroadcasting:", self->_excludeFromScreenCapture, self->_excludeFromScreenCapture);

    objc_msgSend(v4, "setAccessibilityIdentifier:", self->_axID);
  }

}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_subtitle);
  objc_msgSend(v3, "safelyAddObject:", self->_titleFont);
  objc_msgSend(v3, "safelyAddObject:", self->_subtitleFont);
  objc_msgSend(v3, "safelyAddObject:", self->_titleTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_subtitleTextColor);
  objc_msgSend(v3, "safelyAddObject:", self->_titleIcon);
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
  PKPayLaterSubtitleRow *v4;
  PKPayLaterSubtitleRow *v5;
  PKPayLaterSubtitleRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  void *v10;
  _BOOL4 v11;
  NSString *subtitle;
  NSString *v13;

  v4 = (PKPayLaterSubtitleRow *)a3;
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
            goto LABEL_30;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_31;
        }
        subtitle = v6->_subtitle;
        v8 = self->_subtitle;
        v13 = subtitle;
        if (v8 == v13)
        {

        }
        else
        {
          v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13)
            goto LABEL_30;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v13);

          if (!v11)
            goto LABEL_31;
        }
        if (!PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects())
        {
          LOBYTE(v11) = 0;
LABEL_31:

          goto LABEL_32;
        }
        v8 = (NSString *)_Block_copy(self->_selectionHandler);
        v10 = _Block_copy(v6->_selectionHandler);
        LOBYTE(v11) = PKEqualObjects()
                   && self->_showSpinner == v6->_showSpinner
                   && self->_excludeFromScreenCapture == v6->_excludeFromScreenCapture
                   && self->_selected == v6->_selected
                   && self->_hideDisclosure == v6->_hideDisclosure;
LABEL_30:

        goto LABEL_31;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_32:

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

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)titleIcon
{
  return self->_titleIcon;
}

- (void)setTitleIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)axID
{
  return self->_axID;
}

- (void)setAxID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFont, a3);
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextColor, a3);
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (void)setSubtitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextColor, a3);
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)hideDisclosure
{
  return self->_hideDisclosure;
}

- (void)setHideDisclosure:(BOOL)a3
{
  self->_hideDisclosure = a3;
}

- (BOOL)excludeFromScreenCapture
{
  return self->_excludeFromScreenCapture;
}

- (void)setExcludeFromScreenCapture:(BOOL)a3
{
  self->_excludeFromScreenCapture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_axID, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleIcon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
}

@end

@implementation PKPayLaterTitleDetailRow

- (PKPayLaterTitleDetailRow)initWithTitle:(id)a3 detail:(id)a4 selectionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPayLaterTitleDetailRow *v12;
  PKPayLaterTitleDetailRow *v13;
  uint64_t v14;
  id selectionHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterTitleDetailRow;
  v12 = -[PKPayLaterTitleDetailRow init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_detail, a4);
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
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void **v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterTitleDetailRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", self->_title);
    if (self->_titleFont)
    {
      objc_msgSend(v5, "textProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", self->_titleFont);

    }
    if (self->_titleColor)
    {
      objc_msgSend(v5, "textProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setColor:", self->_titleColor);

    }
    objc_msgSend(v5, "setSecondaryText:", self->_detail);
    if (self->_detailFont)
    {
      objc_msgSend(v5, "secondaryTextProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFont:", self->_detailFont);

    }
    if (self->_detailColor)
    {
      objc_msgSend(v5, "secondaryTextProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setColor:", self->_detailColor);

    }
    if (self->_image)
    {
      objc_msgSend(v5, "setImage:");
      if (self->_imageTintColor)
      {
        objc_msgSend(v5, "imageProperties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTintColor:", self->_imageTintColor);

      }
    }
    objc_msgSend(v4, "setContentConfiguration:", v5);
    if (self->_showSpinner)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0DC3438]);
      objc_msgSend(v11, "startAnimating");
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v11, 1);
      v19[0] = v12;
      v13 = (void **)v19;
    }
    else
    {
      if (!self->_selectionHandler)
      {
        v17 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_18;
      }
      v14 = objc_alloc(MEMORY[0x1E0DC3890]);
      PKUIChevronImage();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v14, "initWithImage:", v15);

      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v16);

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v11, 1);
      v18 = v12;
      v13 = &v18;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
    objc_msgSend(v4, "setAccessories:", v17);
    objc_msgSend(v4, "setUserInteractionEnabled:", !self->_showSpinner);

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
  objc_msgSend(v3, "safelyAddObject:", self->_titleFont);
  objc_msgSend(v3, "safelyAddObject:", self->_detailFont);
  objc_msgSend(v3, "safelyAddObject:", self->_titleColor);
  objc_msgSend(v3, "safelyAddObject:", self->_detailColor);
  v4 = _Block_copy(self->_selectionHandler);
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_image);
  objc_msgSend(v3, "safelyAddObject:", self->_imageTintColor);
  PKCombinedHash();
  v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterTitleDetailRow *v4;
  PKPayLaterTitleDetailRow *v5;
  PKPayLaterTitleDetailRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  void *v10;
  _BOOL4 v11;
  NSString *detail;
  NSString *v13;

  v4 = (PKPayLaterTitleDetailRow *)a3;
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
            goto LABEL_28;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_29;
        }
        detail = v6->_detail;
        v8 = self->_detail;
        v13 = detail;
        if (v8 == v13)
        {

        }
        else
        {
          v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13)
            goto LABEL_28;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v13);

          if (!v11)
            goto LABEL_29;
        }
        if (!PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects())
        {
          LOBYTE(v11) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v8 = (NSString *)_Block_copy(self->_selectionHandler);
        v10 = _Block_copy(v6->_selectionHandler);
        LOBYTE(v11) = PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && self->_showSpinner == v6->_showSpinner;
LABEL_28:

        goto LABEL_29;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_30:

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

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (UIFont)detailFont
{
  return self->_detailFont;
}

- (void)setDetailFont:(id)a3
{
  objc_storeStrong((id *)&self->_detailFont, a3);
}

- (UIColor)detailColor
{
  return self->_detailColor;
}

- (void)setDetailColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailColor, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageTintColor, a3);
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_detailColor, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
}

@end

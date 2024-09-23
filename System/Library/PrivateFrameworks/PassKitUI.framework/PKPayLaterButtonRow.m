@implementation PKPayLaterButtonRow

- (PKPayLaterButtonRow)initWithTitle:(id)a3 selectionHandler:(id)a4
{
  id v6;
  id v7;
  PKPayLaterButtonRow *v8;
  PKPayLaterButtonRow *v9;
  uint64_t v10;
  NSAttributedString *title;
  uint64_t v12;
  id selectionHandler;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterButtonRow;
  v8 = -[PKPayLaterButtonRow init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
      title = v9->_title;
      v9->_title = (NSAttributedString *)v10;
    }
    else
    {
      title = v8->_title;
      v8->_title = 0;
    }

    v12 = objc_msgSend(v7, "copy");
    selectionHandler = v9->_selectionHandler;
    v9->_selectionHandler = (id)v12;

  }
  return v9;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  NSAttributedString *title;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  title = self->_title;
  if (title)
  {
    -[NSAttributedString string](title, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v7);

  }
  if (self->_disabled)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("disabled-%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSCopying *)v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  UIImage **p_image;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterButtonRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_25;
  if (!self->_title)
  {
    p_image = &self->_image;
    if (!self->_image)
    {
      v6 = 0;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", self->_title);
  v6 = (void *)v5;
  p_image = &self->_image;
  if (self->_image)
  {
    if (v5)
    {
LABEL_8:
      v8 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      objc_msgSend(v8, "setImage:", *p_image);
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v6, "appendAttributedString:", v10);

      objc_msgSend(v6, "appendAttributedString:", v9);
      goto LABEL_9;
    }
LABEL_7:
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E3E7D690);
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v4, "defaultContentConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v6);
  if (self->_selectionHandler && !self->_disabled)
  {
    objc_msgSend(v11, "textProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (self->_showSpinner)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (self->_textColor)
      {
        objc_msgSend(v12, "setColor:");
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    objc_msgSend(v13, "setColor:", v14);

LABEL_17:
  }
  objc_msgSend(v4, "setContentConfiguration:", v11);
  v16 = !self->_disabled && !self->_showSpinner;
  objc_msgSend(v4, "setUserInteractionEnabled:", v16);
  if (self->_showSpinner)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0DC3438]);
    objc_msgSend(v17, "startAnimating");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v17, 1);
    v20[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v4, "setAccessories:", v19);

LABEL_25:
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_textColor);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  v4 = _Block_copy(self->_selectionHandler);
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_image);
  PKCombinedHash();
  PKIntegerHash();
  v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterButtonRow *v4;
  PKPayLaterButtonRow *v5;
  const void **v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (PKPayLaterButtonRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects() && PKEqualObjects() && PKEqualObjects())
    {
      v7 = _Block_copy(self->_selectionHandler);
      v8 = _Block_copy(v6[2]);
      v9 = PKEqualObjects()
        && self->_disabled == *((unsigned __int8 *)v6 + 25)
        && self->_showSpinner == *((unsigned __int8 *)v6 + 24);

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
  return self->_selectionHandler != 0;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

@implementation KeychainSyncSecurityCodeCell

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  int securityCodeType;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  void *v29;
  unint64_t v31;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  securityCodeType = self->_securityCodeType;
  if (securityCodeType == 1)
  {
    objc_msgSend(v9, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "length");
    if (v16 > 0x20)
    {
LABEL_29:
      v17 = 0;
      goto LABEL_30;
    }
  }
  else if (securityCodeType == 2)
  {
    if (self->_firstPasscodeEntry || (self->_mode & 0xFFFFFFFE) == 2)
    {
      objc_msgSend(v9, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_mode == 3)
      {
        objc_msgSend(v9, "setText:", &stru_1E4A69238);
        objc_msgSend(v9, "text");
        v13 = objc_claimAutoreleasedReturnValue();

        location = 0;
        length = 0;
        v12 = (void *)v13;
      }
      if (length + location <= objc_msgSend(v12, "length"))
      {
        v31 = -[NSString length](self->_firstPasscodeEntry, "length");
        v18 = objc_msgSend(v9, "selectionRange");
        v19 = v18 + objc_msgSend(v10, "length");
        if (length == 1)
          v19 = (__PAIR128__(v19, objc_msgSend(v10, "length")) - 1) >> 64;
        objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "uppercaseString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "invertedSet");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)objc_msgSend(v21, "mutableCopy");
        v25 = objc_msgSend(v24, "length");
        if (v25 - 1 < 1)
        {
          v27 = 0;
        }
        else
        {
          v26 = v25;
          v27 = 0;
          do
          {
            if (objc_msgSend(v23, "characterIsMember:", objc_msgSend(v24, "characterAtIndex:", --v26)))
            {
              objc_msgSend(v24, "deleteCharactersInRange:", v26, 1);
              v27 -= v26 < v19;
            }
          }
          while (v26 > 1);
        }
        if ((unint64_t)objc_msgSend(v24, "length") >= 5)
        {
          v28 = 4;
          do
          {
            if (v19 > v28)
              ++v27;
            objc_msgSend(v24, "insertString:atIndex:", CFSTR("-"), v28);
            v28 += 5;
          }
          while (objc_msgSend(v24, "length") > v28);
        }
        if (objc_msgSend(v24, "length") <= v31 || (self->_mode & 0xFFFFFFFE) == 2)
        {
          objc_msgSend(v9, "setText:", v24);
          objc_msgSend(v9, "setSelectionRange:", v19 + v27, 0);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "postNotificationName:object:", *MEMORY[0x1E0CEBD20], v9);

        }
      }
      else
      {

      }
    }
    goto LABEL_29;
  }
  v17 = 1;
LABEL_30:

  return v17;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return self->_securityCodeType != 2 || self->_firstPasscodeEntry || self->_mode == 2;
}

- (void)setBulletText:(id)a3
{
  id v4;
  UILabel *v5;
  UILabel *bulletTextLabel;
  UILabel *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  if (!self->_bulletTextLabel && objc_msgSend(v12, "length"))
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    bulletTextLabel = self->_bulletTextLabel;
    self->_bulletTextLabel = v5;

    v7 = self->_bulletTextLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 13.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[KeychainSyncSecurityCodeCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_bulletTextLabel);

  }
  -[UILabel text](self->_bulletTextLabel, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v12);

  if ((v11 & 1) == 0)
  {
    -[UILabel setText:](self->_bulletTextLabel, "setText:", v12);
    -[UILabel sizeToFit](self->_bulletTextLabel, "sizeToFit");
    -[KeychainSyncSecurityCodeCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;

  v41.receiver = self;
  v41.super_class = (Class)KeychainSyncSecurityCodeCell;
  -[PSEditableTableCell layoutSubviews](&v41, sel_layoutSubviews);
  -[KeychainSyncSecurityCodeCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[KeychainSyncSecurityCodeCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "borderWidth");
  v13 = v12;

  if (v13 > 0.0)
  {
    v7 = v7 + -30.0;
    -[KeychainSyncSecurityCodeCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", 15.0, v5, v7, v9);

  }
  -[UILabel text](self->_bulletTextLabel, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    -[UILabel frame](self->_bulletTextLabel, "frame");
    v18 = v17;
    v20 = v19;
    -[PSEditableTableCell textField](self, "textField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    -[PSEditableTableCell textField](self, "textField");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "font");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ascender");
    v27 = v23 + v26;
    -[UILabel font](self->_bulletTextLabel, "font");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ascender");
    v30 = v27 - v29;

    if (PSLocaleLanguageDirection() == 1)
      v31 = 15.0;
    else
      v31 = v7 + -15.0 - v18;
    -[UILabel setFrame:](self->_bulletTextLabel, "setFrame:", v31, v30, v18, v20);
  }
  else
  {
    v31 = *MEMORY[0x1E0C9D648];
    v30 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[PSEditableTableCell textField](self, "textField");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v33;
  v36 = v35;

  if (PSLocaleLanguageDirection() == 1)
  {
    v42.origin.x = v31;
    v42.origin.y = v30;
    v42.size.width = v18;
    v42.size.height = v20;
    v37 = CGRectGetMaxX(v42) + 15.0;
    v43.origin.x = v31;
    v43.origin.y = v30;
    v43.size.width = v18;
    v43.size.height = v20;
    v38 = v7 - CGRectGetMaxX(v43) + -30.0;
  }
  else
  {
    v39 = 0.0;
    v37 = 15.0;
    if (v18 > 0.0)
      v39 = 15.0;
    v38 = v7 - v18 + -30.0 - v39;
  }
  -[PSEditableTableCell textField](self, "textField");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v37, v34, v38, v36);

}

- (int)securityCodeType
{
  return self->_securityCodeType;
}

- (void)setSecurityCodeType:(int)a3
{
  self->_securityCodeType = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (NSString)firstPasscodeEntry
{
  return self->_firstPasscodeEntry;
}

- (void)setFirstPasscodeEntry:(id)a3
{
  objc_storeStrong((id *)&self->_firstPasscodeEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPasscodeEntry, 0);
  objc_storeStrong((id *)&self->_bulletTextLabel, 0);
}

@end

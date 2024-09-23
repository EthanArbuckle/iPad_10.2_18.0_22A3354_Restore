@implementation UITableViewLabel

- (id)_disabledFontColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewLabel;
  -[UILabel _disabledFontColor](&v3, sel__disabledFontColor);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  NSInteger v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSString *v17;
  _BOOL4 IsAccessibilityCategory;
  NSString *v19;
  _BOOL4 v20;
  _BOOL4 v21;
  int64_t savedNumberOfLines;
  NSAttributedString *shadowAttributedText;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UITableViewLabel;
  -[UILabel traitCollectionDidChange:](&v25, sel_traitCollectionDidChange_, v4);
  if (!dyld_program_sdk_at_least())
    goto LABEL_24;
  v5 = -[UILabel numberOfLines](self, "numberOfLines");
  v6 = objc_msgSend(v4, "userInterfaceIdiom");
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == objc_msgSend(v7, "userInterfaceIdiom"))
  {

    goto LABEL_10;
  }
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 != 3)
  {
LABEL_10:
    -[UIView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    -[UIView traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSizeCategory");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

    objc_msgSend(v4, "preferredContentSizeCategory");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    v20 = UIContentSizeCategoryIsAccessibilityCategory(v19);

    if ((v15 & 1) == 0)
    {
      if (v5)
        v21 = IsAccessibilityCategory;
      else
        v21 = 0;
      if (v21)
      {
        -[UITableViewLabel _clearNumberOfLines](self, "_clearNumberOfLines");
      }
      else if (v20 && !IsAccessibilityCategory)
      {
        savedNumberOfLines = self->_savedNumberOfLines;
        if (savedNumberOfLines != 0x7FFFFFFFFFFFFFFFLL && v5 != savedNumberOfLines)
          -[UITableViewLabel _restoreNumberOfLines](self, "_restoreNumberOfLines");
      }
      if (!IsAccessibilityCategory || v20)
      {
        if (self->_shadowAttributedText)
        {
          -[UITableViewLabel setAttributedText:](self, "setAttributedText:");
          shadowAttributedText = self->_shadowAttributedText;
          self->_shadowAttributedText = 0;

        }
      }
      else
      {
        -[UILabel attributedText](self, "attributedText");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewLabel setAttributedText:](self, "setAttributedText:", v24);

      }
    }
    goto LABEL_24;
  }
  v10 = self->_savedNumberOfLines;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v5 != v10)
    -[UITableViewLabel _restoreNumberOfLines](self, "_restoreNumberOfLines");
LABEL_24:

}

- (void)_setFirstParagraphFirstLineHeadIndent:(double)a3
{
  double firstParagraphFirstLineHeadIndent;
  double v4;
  id v6;

  firstParagraphFirstLineHeadIndent = self->_firstParagraphFirstLineHeadIndent;
  v4 = fmax(a3, 0.0);
  self->_firstParagraphFirstLineHeadIndent = v4;
  if (firstParagraphFirstLineHeadIndent != v4)
  {
    if (self->_shadowAttributedText)
    {
      -[UITableViewLabel setAttributedText:](self, "setAttributedText:");
    }
    else
    {
      -[UILabel attributedText](self, "attributedText");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[UITableViewLabel setAttributedText:](self, "setAttributedText:", v6);

    }
  }
}

- (void)setFont:(id)a3
{
  objc_super v3;

  self->_usingDefaultFont = 0;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewLabel;
  -[UILabel setFont:](&v3, sel_setFont_, a3);
}

- (void)setTableCell:(id)a3
{
  objc_storeWeak((id *)&self->_tableCell, a3);
}

- (UITableViewLabel)initWithFrame:(CGRect)a3
{
  UITableViewLabel *v3;
  UITableViewLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITableViewLabel;
  v3 = -[UILabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_savedNumberOfLines = 0x7FFFFFFFFFFFFFFFLL;
    v3->_usingDefaultFont = 1;
    -[UITableViewLabel _setNumberOfLinesForAXLayoutIfNecessary](v3, "_setNumberOfLinesForAXLayoutIfNecessary");
  }
  return v4;
}

- (void)_setNumberOfLinesForAXLayoutIfNecessary
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id v5;

  -[UIView traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom") == 3 || (dyld_program_sdk_at_least() & 1) == 0)
  {

  }
  else
  {
    objc_msgSend((id)UIApp, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

    if (IsAccessibilityCategory)
      -[UITableViewLabel _clearNumberOfLines](self, "_clearNumberOfLines");
  }
}

- (void)_setDefaultFont:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  self->_usingDefaultFont = 1;
  -[UILabel font](self, "font");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewLabel;
    -[UILabel setFont:](&v6, sel_setFont_, v4);
  }

}

- (void)setText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSAttributedString *shadowAttributedText;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v4 = a3;
  -[UILabel text](self, "text");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    -[UILabel text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      if (dyld_program_sdk_at_least()
        && self->_firstParagraphFirstLineHeadIndent != 0.0
        && objc_msgSend(v4, "length"))
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
        -[UITableViewLabel setAttributedText:](self, "setAttributedText:", v9);

      }
      else
      {
        shadowAttributedText = self->_shadowAttributedText;
        self->_shadowAttributedText = 0;

        v15.receiver = self;
        v15.super_class = (Class)UITableViewLabel;
        -[UILabel setText:](&v15, sel_setText_, v4);
        if (dyld_program_sdk_at_least())
          -[UITableViewLabel _cleanupErrantFirstLineHeadIndent](self, "_cleanupErrantFirstLineHeadIndent");
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_tableCell);
      v12 = WeakRetained;
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "_contentViewLabelTextDidChange:", self);
      }
      else
      {
        -[UIView superview](self, "superview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          do
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            objc_msgSend(v13, "superview");
            v14 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v14;
          }
          while (v14);
        }
        objc_msgSend(v13, "setNeedsLayout");

      }
    }
  }

}

- (void)_cleanupErrantFirstLineHeadIndent
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  -[UILabel _content](self, "_content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAttributed");

  if (v4)
  {
    -[UILabel _content](self, "_content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      v15 = 0;
      v16 = 0;
      v7 = *(_QWORD *)off_1E1678F98;
      objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, &v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        -[UILabel _defaultAttributes](self, "_defaultAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v7);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v10, "firstLineHeadIndent");
      if (v12 != 0.0)
      {
        v13 = (void *)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(v13, "setFirstLineHeadIndent:", 0.0);
        v14 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v14, "addAttribute:value:range:", v7, v13, v15, v16);
        -[UITableViewLabel setAttributedText:](self, "setAttributedText:", v14);

      }
    }

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableCell);
  objc_storeStrong((id *)&self->_shadowAttributedText, 0);
}

- (void)_clearNumberOfLines
{
  self->_savedNumberOfLines = -[UILabel numberOfLines](self, "numberOfLines");
  -[UILabel setNumberOfLines:](self, "setNumberOfLines:", 0);
}

- (void)_restoreNumberOfLines
{
  -[UILabel setNumberOfLines:](self, "setNumberOfLines:", self->_savedNumberOfLines);
  self->_savedNumberOfLines = 0x7FFFFFFFFFFFFFFFLL;
}

- (UITableViewLabel)initWithCoder:(id)a3
{
  id v4;
  UITableViewLabel *v5;
  UITableViewLabel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewLabel;
  v5 = -[UILabel initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_savedNumberOfLines = 0x7FFFFFFFFFFFFFFFLL;
    v5->_usingDefaultFont = objc_msgSend(v4, "containsValueForKey:", CFSTR("UIFont")) ^ 1;
    -[UITableViewLabel _setNumberOfLinesForAXLayoutIfNecessary](v6, "_setNumberOfLinesForAXLayoutIfNecessary");
  }

  return v6;
}

- (BOOL)_attributedStringHasParagraphStyleWithNonzeroFirstLineHeadIndent:(id)a3
{
  id v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstLineHeadIndent");
    v6 = v5 != 0.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  NSAttributedString *v5;
  NSAttributedString *shadowAttributedText;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  v5 = (NSAttributedString *)objc_msgSend(v4, "copy");
  shadowAttributedText = self->_shadowAttributedText;
  self->_shadowAttributedText = v5;

  if (dyld_program_sdk_at_least()
    && self->_firstParagraphFirstLineHeadIndent != 0.0
    && objc_msgSend(v4, "length"))
  {
    -[UILabel _setOverallWritingDirectionFollowsLayoutDirection:](self, "_setOverallWritingDirectionFollowsLayoutDirection:", 1);
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    v8 = *(_QWORD *)off_1E1678F98;
    objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = objc_alloc_init((Class)off_1E1679BC0);
    v14 = v12;

    objc_msgSend(v14, "setFirstLineHeadIndent:", self->_firstParagraphFirstLineHeadIndent);
    if (!v9)
    {
      objc_msgSend(off_1E1679C48, "defaultParagraphStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAttribute:value:range:", v8, v15, 0, objc_msgSend(v7, "length"));

    }
    objc_msgSend(v4, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "paragraphRangeForRange:", 0, 0);
    objc_msgSend(v7, "addAttribute:value:range:", v8, v14, v17, v18);

    v13 = 0;
  }
  else
  {
    -[UILabel _setOverallWritingDirectionFollowsLayoutDirection:](self, "_setOverallWritingDirectionFollowsLayoutDirection:", 0);
    if (dyld_program_sdk_at_least())
      v13 = !-[UITableViewLabel _attributedStringHasParagraphStyleWithNonzeroFirstLineHeadIndent:](self, "_attributedStringHasParagraphStyleWithNonzeroFirstLineHeadIndent:", v4);
    else
      v13 = 0;
    v7 = v4;
  }
  v19.receiver = self;
  v19.super_class = (Class)UITableViewLabel;
  -[UILabel setAttributedText:](&v19, sel_setAttributedText_, v7);
  if (v13)
    -[UITableViewLabel _cleanupErrantFirstLineHeadIndent](self, "_cleanupErrantFirstLineHeadIndent");

}

- (UITableViewCell)tableCell
{
  return (UITableViewCell *)objc_loadWeakRetained((id *)&self->_tableCell);
}

- (BOOL)usingDefaultFont
{
  return self->_usingDefaultFont;
}

@end

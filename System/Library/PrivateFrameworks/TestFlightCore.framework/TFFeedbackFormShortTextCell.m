@implementation TFFeedbackFormShortTextCell

- (TFFeedbackFormShortTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TFFeedbackFormShortTextCell *v4;
  id v5;
  uint64_t v6;
  UITextField *textField;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TFFeedbackFormShortTextCell;
  v4 = -[TFFeedbackFormBaseCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6EA8]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textField = v4->_textField;
    v4->_textField = (UITextField *)v6;

    -[UITextField setDelegate:](v4->_textField, "setDelegate:", v4);
    -[UITextField setClearButtonMode:](v4->_textField, "setClearButtonMode:", 2);
    -[TFFeedbackFormShortTextCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_textField);

    -[TFFeedbackFormShortTextCell traitCollection](v4, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormShortTextCell _prepareForDisplayWithTraitCollection:](v4, "_prepareForDisplayWithTraitCollection:", v9);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TFFeedbackFormShortTextCell;
  -[TFFeedbackFormBaseCell layoutSubviews](&v21, sel_layoutSubviews);
  +[TFFeedbackFormShortTextCell _textFieldInsetsInTraitEnvironment:](TFFeedbackFormShortTextCell, "_textFieldInsetsInTraitEnvironment:", self);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TFFeedbackFormShortTextCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v6 + v12;
  v15 = v4 + v14;
  v17 = v16 - (v6 + v10);
  v19 = v18 - (v4 + v8);

  -[TFFeedbackFormShortTextCell textField](self, "textField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TFFeedbackFormShortTextCell;
  -[TFFeedbackFormShortTextCell traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[TFFeedbackFormShortTextCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormShortTextCell _prepareForDisplayWithTraitCollection:](self, "_prepareForDisplayWithTraitCollection:", v4);

  -[TFFeedbackFormShortTextCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TFFeedbackFormShortTextCell;
  -[TFFeedbackFormShortTextCell prepareForReuse](&v10, sel_prepareForReuse);
  -[TFFeedbackFormShortTextCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if (v4)
  {
    -[TFFeedbackFormShortTextCell shortTextEntry](self, "shortTextEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TFFeedbackFormBaseCell updateProxy](self, "updateProxy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackFormShortTextCell shortTextEntry](self, "shortTextEntry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackFormShortTextCell textField](self, "textField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didUpdateEntry:toString:editInProgress:", v7, v9, 0);

    }
  }
  -[TFFeedbackFormShortTextCell setShortTextEntry:](self, "setShortTextEntry:", 0);
}

- (void)applyContentsOfEntry:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!objc_msgSend(v8, "type"))
  {
    -[TFFeedbackFormShortTextCell setShortTextEntry:](self, "setShortTextEntry:", v8);
    -[TFFeedbackFormShortTextCell shortTextEntry](self, "shortTextEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormShortTextCell textField](self, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaceholder:", v5);

    -[TFFeedbackFormShortTextCell shortTextEntry](self, "shortTextEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormShortTextCell _configureTextFieldForContentType:](self, "_configureTextFieldForContentType:", objc_msgSend(v7, "contentType"));

  }
}

+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a6;
  v13 = v11;
  v14 = a4;
  objc_msgSend(v13, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringForIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || !objc_msgSend(v16, "length"))
  {
    objc_msgSend(v13, "placeholder");
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  objc_msgSend(a1, "_sizeToFitText:fittingSize:inTraitEnvironment:", v16, v12, width, height);
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (unint64_t)displayableDataType
{
  return 0;
}

- (void)setDisplayedDataString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TFFeedbackFormShortTextCell textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  if (!a4)
  {
    v11 = v6;
    -[TFFeedbackFormShortTextCell shortTextEntry](self, "shortTextEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v11;
    if (v7)
    {
      -[TFFeedbackFormBaseCell updateProxy](self, "updateProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackFormShortTextCell shortTextEntry](self, "shortTextEntry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didUpdateEntry:toString:editInProgress:", v9, v10, 0);

      v6 = v11;
    }
  }

}

- (void)_configureTextFieldForContentType:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3 == 1)
  {
    v10 = (id)*MEMORY[0x24BDF7E70];
    v4 = 1;
    v5 = 7;
  }
  else
  {
    v10 = 0;
    v5 = 0;
    v4 = 0;
  }
  -[TFFeedbackFormShortTextCell textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextContentType:", v10);

  -[TFFeedbackFormShortTextCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyboardType:", v5);

  -[TFFeedbackFormShortTextCell textField](self, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSmartInsertDeleteType:", v4);

  -[TFFeedbackFormShortTextCell textField](self, "textField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutocorrectionType:", v4);

}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  void *v4;
  id v5;

  +[TFFeedbackFormShortTextCell _createTextFieldFontWithTraitCollection:](TFFeedbackFormShortTextCell, "_createTextFieldFontWithTraitCollection:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormShortTextCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

+ (CGSize)_sizeToFitText:(id)a3 fittingSize:(CGSize)a4 inTraitEnvironment:(id)a5
{
  double width;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  uint64_t v30;
  _QWORD v31[2];
  CGSize result;
  CGRect v33;

  width = a4.width;
  v31[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  +[TFFeedbackFormShortTextCell _textFieldInsetsInTraitEnvironment:](TFFeedbackFormShortTextCell, "_textFieldInsetsInTraitEnvironment:", v8);
  v11 = v10;
  v13 = v12;
  v16 = width - v14 - v15;
  v30 = *MEMORY[0x24BDF65F8];
  objc_msgSend(v8, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_createTextFieldFontWithTraitCollection:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 2, v19, 0, v16, 1.79769313e308);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v33.origin.x = v21;
  v33.origin.y = v23;
  v33.size.width = v25;
  v33.size.height = v27;
  v28 = ceil(v13 + v11 + CGRectGetHeight(v33));
  v29 = width;
  result.height = v28;
  result.width = v29;
  return result;
}

+ (UIEdgeInsets)_textFieldInsetsInTraitEnvironment:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:](TFFeedbackFormViewSpecification, "formCellInsetsInTraitEnvironment:", a3);
  UIEdgeInsetsAdd();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (id)_createTextFieldFontWithTraitCollection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77B0], a3);
}

- (UITextField)textField
{
  return self->_textField;
}

- (TFFeedbackEntryShortText)shortTextEntry
{
  return self->_shortTextEntry;
}

- (void)setShortTextEntry:(id)a3
{
  objc_storeStrong((id *)&self->_shortTextEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTextEntry, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end

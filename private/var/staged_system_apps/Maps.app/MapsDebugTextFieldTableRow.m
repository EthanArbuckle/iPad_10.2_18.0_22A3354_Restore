@implementation MapsDebugTextFieldTableRow

- (MapsDebugTextFieldTableRow)init
{
  MapsDebugTextFieldTableRow *v2;
  MapsDebugTextFieldTableRow *v3;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsDebugTextFieldTableRow;
  v2 = -[MapsDebugTableRow init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[MapsDebugTextFieldTableRow setPlaceholderText:](v2, "setPlaceholderText:", CFSTR("Value"));
    objc_initWeak(&location, v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100710914;
    v5[3] = &unk_1011AD260;
    objc_copyWeak(&v6, &location);
    -[MapsDebugTableRow setSelectionAction:](v3, "setSelectionAction:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsDebugTextFieldTableRow invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugTextFieldTableRow;
  -[MapsDebugTableRow dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  MapsDebugTextFieldTableRow *v3;
  objc_super v4;

  -[MapsDebugTextFieldTableRow setGet:](self, "setGet:", 0);
  -[MapsDebugTextFieldTableRow setSet:](self, "setSet:", 0);
  -[UITextField removeTarget:action:forControlEvents:](self->_textField, "removeTarget:action:forControlEvents:", self, "_fieldDidChangeValue:", 0x20000);
  -[UITextField removeTarget:action:forControlEvents:](self->_textField, "removeTarget:action:forControlEvents:", self, "_fieldDidChangeValue:", 0x40000);
  v3 = (MapsDebugTextFieldTableRow *)objc_claimAutoreleasedReturnValue(-[UITextField delegate](self->_textField, "delegate"));

  if (v3 == self)
    -[UITextField setDelegate:](self->_textField, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MapsDebugTextFieldTableRow;
  -[MapsDebugTableRow invalidate](&v4, "invalidate");
}

- (id)_setupTextField
{
  void *v3;
  id v4;
  UITextField *textField;
  UITextField *v6;
  UITextField *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t (**v21)(void);
  uint64_t v22;
  void *v23;
  _QWORD v25[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField traitCollection](self->_textField, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  textField = self->_textField;
  if (!textField)
  {
    v6 = (UITextField *)objc_msgSend(objc_alloc((Class)UITextField), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = self->_textField;
    self->_textField = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UITextField setTextColor:](self->_textField, "setTextColor:", v8);

    if (v4 == (id)5)
      v9 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    else
      v9 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v10 = (void *)v9;
    -[UITextField setFont:](self->_textField, "setFont:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextField setBackgroundColor:](self->_textField, "setBackgroundColor:", v11);

    -[UITextField setReturnKeyType:](self->_textField, "setReturnKeyType:", 9);
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField setTag:](self->_textField, "setTag:", 999);
    textField = self->_textField;
  }
  -[UITextField setDelegate:](textField, "setDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow placeholderText](self, "placeholderText"));
  -[UITextField setPlaceholder:](self->_textField, "setPlaceholder:", v12);

  -[UITextField setAdjustsFontForContentSizeCategory:](self->_textField, "setAdjustsFontForContentSizeCategory:", 1);
  v13 = (unint64_t)-[MapsDebugTextFieldTableRow inputType](self, "inputType") - 1;
  if (v13 > 2)
    v14 = 0;
  else
    v14 = qword_100E3A228[v13];
  -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:", v14);
  -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:", (char *)-[MapsDebugTextFieldTableRow inputType](self, "inputType") - 1 < (char *)3);
  -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", 2 * ((char *)-[MapsDebugTextFieldTableRow inputType](self, "inputType") - 1 > (char *)2));
  v15 = -[UITextField keyboardType](self->_textField, "keyboardType");
  if (v15 == (id)8 || v15 == (id)4)
  {
    v16 = objc_alloc_init((Class)UIToolbar);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v16, "setBarStyle:", 0);
    objc_msgSend(v16, "setUserInteractionEnabled:", 1);
    objc_msgSend(v16, "setTranslucent:", 1);
    v17 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v18 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_donePressed:");
    v25[0] = v17;
    v25[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
    objc_msgSend(v16, "setItems:", v19);

    -[UITextField setInputAccessoryView:](self->_textField, "setInputAccessoryView:", v16);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow get](self, "get"));

  if (v20)
  {
    v21 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow get](self, "get"));
    v22 = v21[2]();
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[UITextField setText:](self->_textField, "setText:", v23);

  }
  -[UITextField addTarget:action:forControlEvents:](self->_textField, "addTarget:action:forControlEvents:", self, "_fieldDidChangeValue:", 0x20000);
  -[UITextField addTarget:action:forControlEvents:](self->_textField, "addTarget:action:forControlEvents:", self, "_fieldDidChangeValue:", 0x40000);
  -[UITextField sizeToFit](self->_textField, "sizeToFit");
  -[UITextField removeFromSuperview](self->_textField, "removeFromSuperview");
  -[UITextField setAccessibilityIdentifier:](self->_textField, "setAccessibilityIdentifier:", CFSTR("MapsDebugTextField"));
  return self->_textField;
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  UITextField *v14;
  UITextField *textField;
  void *v16;
  NSArray *v17;
  void *v18;
  id v19;
  UITextField *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSArray *lastConstraints;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _QWORD v50[4];
  _QWORD v51[2];
  _BYTE v52[128];

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)MapsDebugTextFieldTableRow;
  -[MapsDebugTableRow configureCollectionViewCell:](&v49, "configureCollectionViewCell:", v4);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "tag") == (id)999)
          objc_msgSend(v13, "removeFromSuperview");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v10);
  }

  v14 = (UITextField *)objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow _setupTextField](self, "_setupTextField"));
  textField = self->_textField;
  self->_textField = v14;

  -[UITextField setClearButtonMode:](self->_textField, "setClearButtonMode:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UITextField setTextColor:](self->_textField, "setTextColor:", v16);

  objc_msgSend(v6, "addSubview:", self->_textField);
  objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v6, "setPreservesSuperviewLayoutMargins:", 1);
  v17 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](self, "title"));
  v19 = objc_msgSend(v18, "length");

  v20 = self->_textField;
  if (v19)
  {
    -[UITextField setTextAlignment:](v20, "setTextAlignment:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_textField, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLayoutGuide"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", 16.0));
    v51[0] = v43;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_textField, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v42 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -16.0));
    v51[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
    -[NSArray addObjectsFromArray:](v17, "addObjectsFromArray:", v26);
  }
  else
  {
    -[UITextField setTextAlignment:](v20, "setTextAlignment:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_textField, "leadingAnchor"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 16.0));
    v50[0] = v44;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_textField, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v43 = v27;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v42, -16.0));
    v50[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField topAnchor](self->_textField, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 6.0));
    v50[2] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField bottomAnchor](self->_textField, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v41 = v6;
    v29 = v17;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v28, -6.0));
    v50[3] = v30;
    v31 = v5;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 4));
    -[NSArray addObjectsFromArray:](v29, "addObjectsFromArray:", v32);

    v5 = v31;
    v22 = (void *)v39;

    v17 = v29;
    v6 = v41;

    v21 = v40;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField centerYAnchor](self->_textField, "centerYAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
  -[NSArray addObject:](v17, "addObject:", v35);

  if (self->_lastConstraints)
    objc_msgSend(v6, "removeConstraints:");
  objc_msgSend(v6, "addConstraints:", v17);
  lastConstraints = self->_lastConstraints;
  self->_lastConstraints = v17;

}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSArray *v14;
  void *v15;
  id v16;
  UITextField *textField;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSArray *lastConstraints;
  NSArray *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _BYTE v42[128];

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MapsDebugTextFieldTableRow;
  -[MapsDebugTableRow configureCell:](&v39, "configureCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "tag") == (id)999)
          objc_msgSend(v12, "removeFromSuperview");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "setSelectionStyle:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow _setupTextField](self, "_setupTextField"));
  objc_msgSend(v5, "addSubview:", v13);

  v34 = v4;
  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 1);
  v14 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](self, "title"));
  v16 = objc_msgSend(v15, "length");

  textField = self->_textField;
  if (v16)
  {
    -[UITextField setTextAlignment:](textField, "setTextAlignment:", 2);
    v32 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_textField, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLayoutGuide"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", 5.0));
    v41[0] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_textField, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -5.0));
    v41[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
    -[NSArray addObjectsFromArray:](v32, "addObjectsFromArray:", v24);

    v25 = v18;
    v14 = v32;
  }
  else
  {
    -[UITextField setTextAlignment:](textField, "setTextAlignment:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_textField, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v19, 5.0));
    v40[0] = v33;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_textField, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -5.0));
    v40[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    -[NSArray addObjectsFromArray:](v14, "addObjectsFromArray:", v23);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField centerYAnchor](self->_textField, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  -[NSArray addObject:](v14, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:", 44.0));
  -[NSArray addObject:](v14, "addObject:", v30);

  if (self->_lastConstraints)
    objc_msgSend(v5, "removeConstraints:");
  objc_msgSend(v5, "addConstraints:", v14);
  lastConstraints = self->_lastConstraints;
  self->_lastConstraints = v14;

}

- (void)_fieldDidChangeValue:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow set](self, "set"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow set](self, "set"));
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  -[MapsDebugTextFieldTableRow setText:](self, "setText:", v6);

}

- (void)_donePressed:(id)a3
{
  -[UITextField resignFirstResponder](self->_textField, "resignFirstResponder", a3);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  objc_msgSend(a3, "resignFirstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow done](self, "done"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow done](self, "done"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow text](self, "text"));
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  void (**v5)(void);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow didBeginEditing](self, "didBeginEditing", a3));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow didBeginEditing](self, "didBeginEditing"));
    v5[2]();

  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSUInteger v11;
  void *v12;
  id v13;
  void *v14;
  char *v15;
  char *v16;
  char v17;
  void *v18;
  uint64_t (**v19)(_QWORD, _QWORD);

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if (!-[MapsDebugTextFieldTableRow maximumNumberOfCharacters](self, "maximumNumberOfCharacters"))
    goto LABEL_5;
  v11 = length + location;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v13 = objc_msgSend(v12, "length");

  if (v11 > (unint64_t)v13
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text")),
        v15 = (char *)objc_msgSend(v14, "length"),
        v16 = &v15[(_QWORD)objc_msgSend(v10, "length") - length],
        v14,
        v16 > (char *)-[MapsDebugTextFieldTableRow maximumNumberOfCharacters](self, "maximumNumberOfCharacters")))
  {
    v17 = 0;
  }
  else
  {
LABEL_5:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow filter](self, "filter"));

    if (v18)
    {
      v19 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MapsDebugTextFieldTableRow filter](self, "filter"));
      v17 = ((uint64_t (**)(_QWORD, id))v19)[2](v19, v10);

    }
    else if ((id)-[MapsDebugTextFieldTableRow inputType](self, "inputType") == (id)1)
    {
      if (qword_1014D2FD0 != -1)
        dispatch_once(&qword_1014D2FD0, &stru_1011C1690);
      v17 = objc_msgSend(v10, "rangeOfCharacterFromSet:", qword_1014D2FC8) == (id)0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (id)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)get
{
  return self->_get;
}

- (void)setGet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)done
{
  return self->_done;
}

- (void)setDone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)maximumNumberOfCharacters
{
  return self->_maximumNumberOfCharacters;
}

- (void)setMaximumNumberOfCharacters:(int64_t)a3
{
  self->_maximumNumberOfCharacters = a3;
}

- (id)didBeginEditing
{
  return self->_didBeginEditing;
}

- (void)setDidBeginEditing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didBeginEditing, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_set, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastConstraints, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end

@implementation UIKBAutoFillTestTaggerView

- (UIKBAutoFillTestTaggerView)initWithFrame:(CGRect)a3
{
  UIKBAutoFillTestTaggerView *v3;
  UIKBAutoFillTestTaggerView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIVisualEffectView *v13;
  void *v14;
  uint64_t v15;
  UIVisualEffectView *visualEffectView;
  void *v17;
  UIView *v18;
  void *v19;
  UIToolbar *v20;
  UIToolbar *toolbar;
  UILabel *v22;
  UILabel *titleLabel;
  void *v24;
  void *v25;
  UIPickerView *v26;
  UIPickerView *pickerView;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIBarButtonItem *v38;
  UIBarButtonItem *previousBarButtonItem;
  UIBarButtonItem *v40;
  UIBarButtonItem *nextBarButtoItem;
  UIBarButtonItem *v42;
  UIBarButtonItem *doneBarButtonItem;
  UIKBAutoFillTestTaggerView *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  UIView *v97;
  objc_super v98;
  _QWORD v99[21];

  v99[19] = *MEMORY[0x1E0C80C00];
  v98.receiver = self;
  v98.super_class = (Class)UIKBAutoFillTestTaggerView;
  v3 = -[UIView initWithFrame:](&v98, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = [UIVisualEffectView alloc];
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 501);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UIVisualEffectView initWithEffect:](v13, "initWithEffect:", v14);
    visualEffectView = v4->_visualEffectView;
    v4->_visualEffectView = (UIVisualEffectView *)v15;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_visualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4, "addSubview:", v4->_visualEffectView);
    -[UIVisualEffectView contentView](v4->_visualEffectView, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(UIView);
    +[UIColor lightGrayColor](UIColor, "lightGrayColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4, "addSubview:", v18);
    v20 = -[UIToolbar initWithFrame:]([UIToolbar alloc], "initWithFrame:", v6, v8, v10, v12);
    toolbar = v4->_toolbar;
    v4->_toolbar = v20;

    -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](v4->_toolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "addSubview:", v4->_toolbar);
    v22 = objc_alloc_init(UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v22;

    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 15.0, *(double *)off_1E167DC70);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v24);

    +[UIColor grayColor](UIColor, "grayColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v25);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "addSubview:", v4->_titleLabel);
    v26 = -[UIPickerView initWithFrame:]([UIPickerView alloc], "initWithFrame:", v6, v8, v10, v12);
    pickerView = v4->_pickerView;
    v4->_pickerView = v26;

    -[UIPickerView setDataSource:](v4->_pickerView, "setDataSource:", v4);
    -[UIPickerView setDelegate:](v4->_pickerView, "setDelegate:", v4);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_pickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "addSubview:", v4->_pickerView);
    v73 = (void *)MEMORY[0x1E0D156E0];
    -[UIView topAnchor](v18, "topAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4, "topAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v95);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v94;
    -[UIView leadingAnchor](v18, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v91;
    -[UIView trailingAnchor](v18, "trailingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v89);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2] = v88;
    v97 = v18;
    -[UIView heightAnchor](v18, "heightAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "scale");
    objc_msgSend(v86, "constraintEqualToConstant:", 1.0 / v28);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v99[3] = v85;
    -[UIView topAnchor](v4->_visualEffectView, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v18, "bottomAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v99[4] = v82;
    -[UIView leadingAnchor](v4->_visualEffectView, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v99[5] = v79;
    -[UIView trailingAnchor](v4->_visualEffectView, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v99[6] = v76;
    -[UIView bottomAnchor](v4->_visualEffectView, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v74);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v99[7] = v72;
    -[UIView topAnchor](v4->_toolbar, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v99[8] = v68;
    -[UIView leadingAnchor](v4->_toolbar, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v99[9] = v65;
    -[UIView trailingAnchor](v4->_toolbar, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v99[10] = v62;
    -[UIView topAnchor](v4->_titleLabel, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->_toolbar, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, 15.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v99[11] = v59;
    -[UIView centerXAnchor](v4->_titleLabel, "centerXAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerXAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v99[12] = v56;
    -[UIView leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 16.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v99[13] = v53;
    -[UIView trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v17;
    objc_msgSend(v17, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -16.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v99[14] = v50;
    -[UIView topAnchor](v4->_pickerView, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->_titleLabel, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v99[15] = v47;
    -[UIView leadingAnchor](v4->_pickerView, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v99[16] = v30;
    -[UIView trailingAnchor](v4->_pickerView, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v99[17] = v33;
    -[UIView bottomAnchor](v4->_pickerView, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v99[18] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 19);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "activateConstraints:", v37);

    v38 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", CFSTR("Previous"), 0, v4, sel__previousBarButtonAction_);
    previousBarButtonItem = v4->_previousBarButtonItem;
    v4->_previousBarButtonItem = v38;

    v40 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", CFSTR("Next"), 0, v4, sel__nextBarButtonAction_);
    nextBarButtoItem = v4->_nextBarButtoItem;
    v4->_nextBarButtoItem = v40;

    v42 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 0, v4, sel__doneBarButtonAction_);
    doneBarButtonItem = v4->_doneBarButtonItem;
    v4->_doneBarButtonItem = v42;

    v44 = v4;
  }

  return v4;
}

- (void)setTagRequests:(id)a3
{
  NSArray *v4;
  NSArray *tagRequests;
  BOOL v6;
  NSArray *v7;
  NSArray *v8;
  void *v9;
  NSArray *v10;

  v4 = (NSArray *)a3;
  tagRequests = self->_tagRequests;
  if (tagRequests != v4)
  {
    v10 = v4;
    v6 = -[NSArray isEqualToArray:](tagRequests, "isEqualToArray:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSArray *)-[NSArray copy](v10, "copy");
      v8 = self->_tagRequests;
      self->_tagRequests = v7;

      -[NSArray firstObject](self->_tagRequests, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBAutoFillTestTaggerView _performTagRequest:](self, "_performTagRequest:", v9);

      v4 = v10;
    }
  }

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = -[UIKBAutoFillTestTagRequest requestType](self->_currentRequest, "requestType", a3, a4);
  if (v5 == 1)
  {
    -[UIKBAutoFillTestTaggerView _textFieldTypes](self, "_textFieldTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v5)
  {
    -[UIKBAutoFillTestTaggerView _formTypes](self, "_formTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v6;
    v8 = objc_msgSend(v6, "count");

    return v8;
  }
  return 0;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;

  v7 = -[UIKBAutoFillTestTagRequest requestType](self->_currentRequest, "requestType", a3, a4, a5);
  if (v7 == 1)
  {
    -[UIKBAutoFillTestTaggerView _textFieldTypes](self, "_textFieldTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
    v11 = CFSTR("Unspecified");
    switch(v10)
    {
      case 0:
        goto LABEL_24;
      case 1:
        v11 = CFSTR("User Name");
        break;
      case 2:
        v11 = CFSTR("User Name (Email)");
        break;
      case 3:
        v11 = CFSTR("Password");
        break;
      case 4:
        v11 = CFSTR("Confirm Password");
        break;
      case 5:
        v11 = CFSTR("New Password");
        break;
      case 6:
        v11 = CFSTR("One Time Code");
        break;
      case 7:
        v11 = CFSTR("Email");
        break;
      case 8:
        v11 = CFSTR("First Name");
        break;
      case 9:
        v11 = CFSTR("Last Name");
        break;
      case 10:
        v11 = CFSTR("Zip Code");
        break;
      default:
LABEL_8:
        if (v10 == 10000)
          v11 = CFSTR("Other");
        else
          v11 = &stru_1E16EDF20;
        break;
    }
    goto LABEL_24;
  }
  if (!v7)
  {
    -[UIKBAutoFillTestTaggerView _formTypes](self, "_formTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
    v11 = CFSTR("Unspecified");
    switch(v10)
    {
      case 0:
        break;
      case 1:
        v11 = CFSTR("Sign In");
        break;
      case 2:
        v11 = CFSTR("Sign In (Multi-step)");
        break;
      case 3:
        v11 = CFSTR("Sign Up");
        break;
      case 4:
        v11 = CFSTR("Sign Up (Multi-step)");
        break;
      case 5:
        v11 = CFSTR("Change Password");
        break;
      default:
        goto LABEL_8;
    }
LABEL_24:

    return (id)v11;
  }
  return &stru_1E16EDF20;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 35.0;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  UIKBAutoFillTestTagRequest *currentRequest;
  void *v8;
  void *v9;
  UIKBAutoFillTestTagRequest *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (-[UIKBAutoFillTestTagRequest requestType](self->_currentRequest, "requestType"))
  {
    if (-[UIKBAutoFillTestTagRequest requestType](self->_currentRequest, "requestType") == 1
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      currentRequest = self->_currentRequest;
      -[UIKBAutoFillTestTaggerView _textFieldTypes](self, "_textFieldTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "taggerView:didTagTextFieldRequest:withSelectedType:", self, currentRequest, objc_msgSend(v9, "integerValue"));
LABEL_7:

    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = self->_currentRequest;
    -[UIKBAutoFillTestTaggerView _formTypes](self, "_formTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "taggerView:didTagFormRequest:withSelectedType:", self, v10, objc_msgSend(v9, "integerValue"));
    goto LABEL_7;
  }

}

- (id)_formTypes
{
  id v2;

  if (_formTypes_formTypes)
  {
    v2 = (id)_formTypes_formTypes;
  }
  else
  {
    v2 = &unk_1E1A936F8;
    _formTypes_formTypes = (uint64_t)&unk_1E1A936F8;
  }
  return v2;
}

- (id)_textFieldTypes
{
  id v2;

  if (_textFieldTypes_textFieldTypes)
  {
    v2 = (id)_textFieldTypes_textFieldTypes;
  }
  else
  {
    v2 = &unk_1E1A93710;
    _textFieldTypes_textFieldTypes = (uint64_t)&unk_1E1A93710;
  }
  return v2;
}

- (void)_performTagRequest:(id)a3
{
  UIKBAutoFillTestTagRequest *v5;
  UIKBAutoFillTestTagRequest **p_currentRequest;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  UIKBAutoFillTestTagRequest *v14;

  v5 = (UIKBAutoFillTestTagRequest *)a3;
  if (v5)
  {
    p_currentRequest = &self->_currentRequest;
    if (self->_currentRequest != v5)
    {
      v14 = v5;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "taggerView:willTagRequest:", self, v14);
      objc_storeStrong((id *)&self->_currentRequest, a3);
      -[UIKBAutoFillTestTaggerView _updateToolbarButtons](self, "_updateToolbarButtons");
      -[UIKBAutoFillTestTaggerView _updateTitle](self, "_updateTitle");
      if (-[UIKBAutoFillTestTagRequest requestType](v14, "requestType"))
      {
        if (-[UIKBAutoFillTestTagRequest requestType](v14, "requestType") == 1
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = objc_msgSend(WeakRetained, "taggerView:selectedTypeForTextFieldRequest:", self, *p_currentRequest);
          -[UIKBAutoFillTestTaggerView _textFieldTypes](self, "_textFieldTypes");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = objc_msgSend(WeakRetained, "taggerView:selectedTypeForFormRequest:", self, *p_currentRequest);
        -[UIKBAutoFillTestTaggerView _formTypes](self, "_formTypes");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v10 = (void *)v9;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "indexOfObject:", v11);

        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          v13 = 0;
        else
          v13 = v12;
        goto LABEL_15;
      }
      v13 = 0;
LABEL_15:
      -[UIPickerView reloadAllComponents](self->_pickerView, "reloadAllComponents");
      -[UIPickerView selectRow:inComponent:animated:](self->_pickerView, "selectRow:inComponent:animated:", v13, 0, 1);

      v5 = v14;
    }
  }

}

- (void)_updateToolbarButtons
{
  void *v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  UIBarButtonItem *v7;

  v7 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", self->_previousBarButtonItem, v7, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSArray indexOfObject:](self->_tagRequests, "indexOfObject:", self->_currentRequest);
  v5 = -[NSArray count](self->_tagRequests, "count");
  v6 = 6;
  if (v4 < v5 - 1)
    v6 = 5;
  objc_msgSend(v3, "addObject:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIKBAutoFillTestTaggerView__visualEffectView[v6]));
  -[UIBarButtonItem setEnabled:](self->_previousBarButtonItem, "setEnabled:", v4 != 0);
  -[UIToolbar setItems:animated:](self->_toolbar, "setItems:animated:", v3, 1);

}

- (void)_updateTitle
{
  UIKBAutoFillTestTagRequest *currentRequest;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;

  currentRequest = self->_currentRequest;
  v4 = &stru_1E16EDF20;
  if (currentRequest)
  {
    v5 = -[UIKBAutoFillTestTagRequest requestType](currentRequest, "requestType");
    v6 = CFSTR("What kind of form field is this?");
    if (v5 != 1)
      v6 = &stru_1E16EDF20;
    if (v5)
      v4 = v6;
    else
      v4 = CFSTR("What kind of form is this view controller?");
  }
  -[UILabel setText:](self->_titleLabel, "setText:", v4);
}

- (void)_nextBarButtonAction:(id)a3
{
  NSUInteger v4;
  id v5;

  v4 = -[NSArray indexOfObject:](self->_tagRequests, "indexOfObject:", self->_currentRequest) + 1;
  if (v4 < -[NSArray count](self->_tagRequests, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_tagRequests, "objectAtIndexedSubscript:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBAutoFillTestTaggerView _performTagRequest:](self, "_performTagRequest:", v5);

  }
}

- (void)_previousBarButtonAction:(id)a3
{
  id v4;

  -[NSArray objectAtIndexedSubscript:](self->_tagRequests, "objectAtIndexedSubscript:", -[NSArray indexOfObject:](self->_tagRequests, "indexOfObject:", self->_currentRequest) - 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBAutoFillTestTaggerView _performTagRequest:](self, "_performTagRequest:", v4);

}

- (void)_doneBarButtonAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "taggerViewDidFinish:", self);

}

- (UIKBAutoFillTestTaggerViewDelegate)delegate
{
  return (UIKBAutoFillTestTaggerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)tagRequests
{
  return self->_tagRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_previousBarButtonItem, 0);
  objc_storeStrong((id *)&self->_nextBarButtoItem, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end

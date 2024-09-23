@implementation CarAlertViewController

- (CarAlertViewController)init
{
  return -[CarAlertViewController initWithResultBlock:](self, "initWithResultBlock:", 0);
}

- (CarAlertViewController)initWithResultBlock:(id)a3
{
  id v4;
  CarAlertViewController *v5;
  id v6;
  id resultBlock;
  NSMutableArray *v8;
  NSMutableArray *buttons;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarAlertViewController;
  v5 = -[CarAlertViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    resultBlock = v5->_resultBlock;
    v5->_resultBlock = v6;

    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    buttons = v5->_buttons;
    v5->_buttons = v8;

  }
  return v5;
}

- (void)setAlertTitle:(id)a3
{
  NSString *v4;
  NSString *alertTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  alertTitle = self->_alertTitle;
  self->_alertTitle = v4;

  -[CarAlertViewController _updateSubviews](self, "_updateSubviews");
}

- (void)setAlertMessage:(id)a3
{
  NSString *v4;
  NSString *alertMessage;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  alertMessage = self->_alertMessage;
  self->_alertMessage = v4;

  -[CarAlertViewController _updateSubviews](self, "_updateSubviews");
}

- (void)setActions:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_actions, a3);
  if (objc_msgSend(v10, "count"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController _buttonWithTitle:index:](self, "_buttonWithTitle:index:", v7, v5));

      objc_msgSend(v8, "setCancels:", objc_msgSend(v6, "cancels"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttons](self, "buttons"));
      objc_msgSend(v9, "addObject:", v8);

      if ((objc_msgSend(v6, "cancels") & 1) == 0)
        -[CarAlertViewController setPreferredButton:](self, "setPreferredButton:", v8);

      ++v5;
    }
    while (v5 < (unint64_t)objc_msgSend(v10, "count"));
  }
  -[CarAlertViewController _updateSubviews](self, "_updateSubviews");

}

+ (id)_textAttributes
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];

  v2 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v2, "setAlignment:", 1);
  objc_msgSend(v2, "setLineBreakMode:", 0);
  v7[0] = NSForegroundColorAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v7[1] = NSParagraphStyleAttributeName;
  v8[0] = v3;
  v8[1] = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  return v5;
}

+ (id)_titleAttributes
{
  void *v2;
  void *v3;
  void *v4;
  NSAttributedStringKey v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_textAttributes"));
  v6 = NSFontAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:", 22.0));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  return v2;
}

- (id)_titleAttributedString
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)NSAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](self, "alertTitle"));
  v5 = objc_msgSend((id)objc_opt_class(self), "_titleAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithString:attributes:", v4, v6);

  return v7;
}

+ (id)_calloutFixedFontWithSymbolicTraits:(unsigned int)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleCallout, *(_QWORD *)&a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 16.0));

  return v4;
}

+ (id)_messageAttributes
{
  void *v3;
  void *v4;
  void *v5;
  NSAttributedStringKey v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_textAttributes"));
  v7 = NSFontAttributeName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_calloutFixedFontWithSymbolicTraits:", 0));
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  return v3;
}

- (id)_messageAttributedString
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertAttributedMessage](self, "alertAttributedMessage"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertAttributedMessage](self, "alertAttributedMessage"));
  }
  else
  {
    v5 = objc_alloc((Class)NSAttributedString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertMessage](self, "alertMessage"));
    v7 = objc_msgSend((id)objc_opt_class(self), "_messageAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v4 = objc_msgSend(v5, "initWithString:attributes:", v6, v8);

  }
  return v4;
}

+ (id)_messageAttributesSmallText
{
  void *v2;
  void *v3;
  void *v4;
  NSAttributedStringKey v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_textAttributes"));
  v6 = NSFontAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  return v2;
}

- (id)_messageAttributedStringSmallText
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)NSAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertMessage](self, "alertMessage"));
  v5 = objc_msgSend((id)objc_opt_class(self), "_messageAttributesSmallText");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithString:attributes:", v4, v6);

  return v7;
}

- (id)_buttonWithTitle:(id)a3 index:(int64_t)a4
{
  id v6;
  void *v7;
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
  _QWORD v19[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusableButton button](CarAlertButton, "button"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setModifiesBackgroundColor:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
  objc_msgSend(v7, "setNonFocusedBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
  objc_msgSend(v7, "setBackgroundColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  objc_msgSend(v7, "setTintColor:", v10);

  objc_msgSend(v7, "_setContinuousCornerRadius:", 8.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController _buttonFont](self, "_buttonFont"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleLabel"));
  objc_msgSend(v12, "setFont:", v11);

  objc_msgSend(v7, "setTitle:forState:", v6, 0);
  objc_msgSend(v7, "setIndex:", a4);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widthAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToConstant:", 241.0));
  v19[0] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 40.0));
  v19[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  objc_msgSend(v7, "addConstraints:", v17);

  return v7;
}

- (id)_buttonFont
{
  return objc_msgSend((id)objc_opt_class(self), "_calloutFixedFontWithSymbolicTraits:", 2);
}

- (void)_buttonTapped:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "index");
  v6 = objc_msgSend(v4, "cancels");

  -[CarAlertViewController _dismissWithResult:buttonIndex:](self, "_dismissWithResult:buttonIndex:", v6, v5);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarAlertViewController;
  -[CarAlertViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarAlertView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[CarAlertViewController _setupSubviews](self, "_setupSubviews");
  -[CarAlertViewController _setupConstraints](self, "_setupConstraints");
  -[CarAlertViewController _updateSubviews](self, "_updateSubviews");
}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CarButtonGridView *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = objc_alloc_init((Class)UILabel);
  -[CarAlertViewController setTitleLabel:](self, "setTitleLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setNumberOfLines:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = objc_alloc_init((Class)UILabel);
  -[CarAlertViewController setMessageLabel:](self, "setMessageLabel:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("MessageLabel"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v12, "setNumberOfLines:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v13, "addSubview:", v14);

  v15 = -[CarButtonGridView initWithFrame:]([CarButtonGridView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CarAlertViewController setButtonGrid:](self, "setButtonGrid:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = (id)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
  objc_msgSend(v18, "addSubview:", v17);

}

- (void)_updateSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];

  if (!-[CarAlertViewController isViewLoaded](self, "isViewLoaded"))
    return;
  v3 = objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](self, "alertTitle"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](self, "alertTitle"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
      objc_msgSend(v12, "setHidden:", 0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController _titleAttributedString](self, "_titleAttributedString"));
      objc_msgSend(v11, "setAttributedText:", v13);

      goto LABEL_7;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](self, "alertTitle"));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
    objc_msgSend(v10, "setHidden:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
    objc_msgSend(v11, "setText:", 0);
LABEL_7:

  }
  v14 = objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertAttributedMessage](self, "alertAttributedMessage"));
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributedText"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertAttributedMessage](self, "alertAttributedMessage"));
    v19 = objc_msgSend(v17, "isEqualToAttributedString:", v18);

    if ((v19 & 1) == 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
      objc_msgSend(v30, "setHidden:", 0);

      v31 = objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertAttributedMessage](self, "alertAttributedMessage"));
LABEL_17:
      v26 = (void *)v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
      objc_msgSend(v33, "setAttributedText:", v26);

      goto LABEL_18;
    }
  }
  v20 = objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertMessage](self, "alertMessage"));
  if (v20)
  {
    v21 = (void *)v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "text"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertMessage](self, "alertMessage"));
    v25 = objc_msgSend(v23, "isEqualToString:", v24);

    if ((v25 & 1) == 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
      objc_msgSend(v32, "setHidden:", 0);

      v31 = objc_claimAutoreleasedReturnValue(-[CarAlertViewController _messageAttributedString](self, "_messageAttributedString"));
      goto LABEL_17;
    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertMessage](self, "alertMessage"));
  if (v26)
  {
LABEL_18:

    goto LABEL_19;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertAttributedMessage](self, "alertAttributedMessage"));

  if (!v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
    objc_msgSend(v28, "setHidden:", 1);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
    objc_msgSend(v29, "setText:", 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
    objc_msgSend(v26, "setAttributedText:", 0);
    goto LABEL_18;
  }
LABEL_19:
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "buttons"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttons](self, "buttons"));
  v37 = objc_msgSend(v35, "isEqualToArray:", v36);

  if ((v37 & 1) == 0)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttons](self, "buttons", 0));
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v52;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v52 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
          objc_msgSend(v44, "addButton:", v43);

          if (objc_msgSend(v43, "cancels"))
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController backButtonRecognizer](self, "backButtonRecognizer"));

            if (!v45)
            {
              v46 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleBackButtonPressed:");
              -[CarAlertViewController setBackButtonRecognizer:](self, "setBackButtonRecognizer:", v46);

              v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController backButtonRecognizer](self, "backButtonRecognizer"));
              objc_msgSend(v47, "setAllowedPressTypes:", &off_101274250);

              v48 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController backButtonRecognizer](self, "backButtonRecognizer"));
              objc_msgSend(v48, "addGestureRecognizer:", v49);

            }
          }
          v42 = (char *)v42 + 1;
        }
        while (v40 != v42);
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v40);
    }

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  objc_msgSend(v50, "setNeedsLayout");

}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  NSString *alertTitle;
  NSString *alertMessage;
  NSAttributedString *alertAttributedMessage;
  id resultBlock;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController backButtonRecognizer](self, "backButtonRecognizer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController backButtonRecognizer](self, "backButtonRecognizer"));
    objc_msgSend(v4, "removeGestureRecognizer:", v5);

    -[CarAlertViewController setBackButtonRecognizer:](self, "setBackButtonRecognizer:", 0);
  }
  objc_storeWeak((id *)&self->_preferredButton, 0);
  -[NSMutableArray removeAllObjects](self->_buttons, "removeAllObjects");
  -[CarButtonGridView resetButtons](self->_buttonGrid, "resetButtons");
  alertTitle = self->_alertTitle;
  self->_alertTitle = 0;

  alertMessage = self->_alertMessage;
  self->_alertMessage = 0;

  alertAttributedMessage = self->_alertAttributedMessage;
  self->_alertAttributedMessage = 0;

  resultBlock = self->_resultBlock;
  self->_resultBlock = 0;

  -[CarAlertViewController _updateSubviews](self, "_updateSubviews");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
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
  id v72;
  _QWORD v73[12];

  v72 = objc_alloc_init((Class)UILayoutGuide);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  objc_msgSend(v3, "addLayoutGuide:", v72);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "firstBaselineAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "safeAreaLayoutGuide"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v67, 40.0));
  v73[0] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "safeAreaLayoutGuide"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 12.0));
  v73[1] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "safeAreaLayoutGuide"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 12.0));
  v73[2] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "firstBaselineAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController titleLabel](self, "titleLabel"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastBaselineAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, 30.0));
  v73[3] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "safeAreaLayoutGuide"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v44, 12.0));
  v73[4] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "safeAreaLayoutGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 12.0));
  v73[5] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lastBaselineAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:constant:", v33, 14.0));
  v73[6] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "safeAreaLayoutGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:constant:", v26, 20.0));
  v73[7] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "safeAreaLayoutGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:constant:", v20, 20.0));
  v73[8] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "widthAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:", 360.0));
  v73[9] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safeAreaLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v6));
  v73[10] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "safeAreaLayoutGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttonGrid](self, "buttonGrid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 35.0));
  v73[11] = v13;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 12));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertAttributedMessage](self, "alertAttributedMessage"));

  if (!v3)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
    objc_msgSend(v12, "frame");
    if (v4 > 0.0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
      objc_msgSend(v5, "intrinsicContentSize");
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
      objc_msgSend(v8, "frame");
      v10 = v9;

      if (v7 <= v10)
        return;
      v12 = (id)objc_claimAutoreleasedReturnValue(-[CarAlertViewController messageLabel](self, "messageLabel"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController _messageAttributedStringSmallText](self, "_messageAttributedStringSmallText"));
      objc_msgSend(v12, "setAttributedText:", v11);

    }
  }
}

- (void)dismiss
{
  -[CarAlertViewController _dismissWithResult:buttonIndex:](self, "_dismissWithResult:buttonIndex:", 2, -1);
}

- (void)_dismissWithResult:(int64_t)a3 buttonIndex:(int64_t)a4
{
  void *v7;
  void (**v8)(id, CarAlertViewController *, int64_t, int64_t);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController resultBlock](self, "resultBlock"));

  if (v7)
  {
    v8 = (void (**)(id, CarAlertViewController *, int64_t, int64_t))objc_claimAutoreleasedReturnValue(-[CarAlertViewController resultBlock](self, "resultBlock"));
    v8[2](v8, self, a3, a4);

  }
}

- (void)supersede
{
  -[CarAlertViewController _dismissWithResult:buttonIndex:](self, "_dismissWithResult:buttonIndex:", 3, -1);
}

- (void)_handleBackButtonPressed:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttons](self, "buttons", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100ADCC84;
  v5[3] = &unk_1011E2018;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[CarAlertViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttons](self, "buttons"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController buttons](self, "buttons"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexesOfObjectsPassingTest:", &stru_1011E2058));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectsAtIndexes:", v5));

  }
  else
  {
    v6 = &__NSArray0__struct;
  }
  return (NSArray *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v8;

  if (!-[CarAlertViewController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)&__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController preferredButton](self, "preferredButton"));
  v4 = objc_msgSend(v3, "_maps_isVisible");

  if (!v4)
    return (NSArray *)&__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController preferredButton](self, "preferredButton"));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return (NSArray *)v6;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (NSAttributedString)alertAttributedMessage
{
  return self->_alertAttributedMessage;
}

- (void)setAlertAttributedMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)actions
{
  return self->_actions;
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (CarButtonGridView)buttonGrid
{
  return self->_buttonGrid;
}

- (void)setButtonGrid:(id)a3
{
  objc_storeStrong((id *)&self->_buttonGrid, a3);
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (UIButton)preferredButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_preferredButton);
}

- (void)setPreferredButton:(id)a3
{
  objc_storeWeak((id *)&self->_preferredButton, a3);
}

- (UITapGestureRecognizer)backButtonRecognizer
{
  return self->_backButtonRecognizer;
}

- (void)setBackButtonRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_backButtonRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backButtonRecognizer, 0);
  objc_destroyWeak((id *)&self->_preferredButton);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_buttonGrid, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_alertAttributedMessage, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
}

@end

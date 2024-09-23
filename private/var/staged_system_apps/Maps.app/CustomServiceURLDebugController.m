@implementation CustomServiceURLDebugController

- (id)title
{
  return CFSTR("Custom URL");
}

- (CustomServiceURLDebugController)initWithStyle:(int64_t)a3
{
  CustomServiceURLDebugController *v3;
  UITextField *v4;
  UITextField *textField;
  void *v6;
  CustomServiceURLDebugController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CustomServiceURLDebugController;
  v3 = -[CustomServiceURLDebugController initWithStyle:](&v9, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (UITextField *)objc_alloc_init((Class)UITextField);
    textField = v3->_textField;
    v3->_textField = v4;

    -[UITextField setAutoresizingMask:](v3->_textField, "setAutoresizingMask:", 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextField setBackgroundColor:](v3->_textField, "setBackgroundColor:", v6);

    -[UITextField setAutocorrectionType:](v3->_textField, "setAutocorrectionType:", 1);
    -[UITextField setAutocapitalizationType:](v3->_textField, "setAutocapitalizationType:", 0);
    -[UITextField setKeyboardType:](v3->_textField, "setKeyboardType:", 3);
    -[UITextField setReturnKeyType:](v3->_textField, "setReturnKeyType:", 9);
    -[UITextField setClearButtonMode:](v3->_textField, "setClearButtonMode:", 3);
    -[UITextField setDelegate:](v3->_textField, "setDelegate:", v3);
    v7 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextField setDelegate:](self->_textField, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CustomServiceURLDebugController;
  -[CustomServiceURLDebugController dealloc](&v3, "dealloc");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)CustomServiceURLDebugController;
  -[CustomServiceURLDebugController viewDidAppear:](&v5, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  UIKeyboardForceOrderOutAutomaticAnimated(a3, a2);
  v5.receiver = self;
  v5.super_class = (Class)CustomServiceURLDebugController;
  -[CustomServiceURLDebugController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  NSString *v6;
  uint64_t String;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;

  v5 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
  objc_msgSend(v5, "setAccessoryType:", 0);
  objc_msgSend(v5, "setSelectionStyle:", 0);
  v6 = self->_defaultURLString;
  if (_GEOConfigHasValue(*(_QWORD *)&self->_defaultsKey.key.identifier, self->_defaultsKey.key.metadata))
  {
    String = GEOConfigGetString(*(_QWORD *)&self->_defaultsKey.key.identifier, self->_defaultsKey.key.metadata);
    v8 = objc_claimAutoreleasedReturnValue(String);

    v6 = (NSString *)v8;
  }
  -[UITextField setText:](self->_textField, "setText:", v6);
  -[UITextField sizeToFit](self->_textField, "sizeToFit");
  -[UITextField frame](self->_textField, "frame");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  objc_msgSend(v11, "bounds");
  v13 = v12 + -12.0;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  objc_msgSend(v14, "bounds");
  v16 = (v15 - v13) * 0.5;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  objc_msgSend(v17, "bounds");
  v19 = (v18 - v10) * 0.5;

  -[UITextField setFrame:](self->_textField, "setFrame:", v16, v19, v13, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  objc_msgSend(v20, "addSubview:", self->_textField);

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder", a3, a4);
}

- (void)textFieldDidEndEditing:(id)a3
{
  void (**callback)(id, id, _QWORD);
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_textField, "text", a3));
  if (objc_msgSend(v6, "length"))
  {
    if (v6)
    {
      GEOConfigSetString(*(_QWORD *)&self->_defaultsKey.key.identifier, self->_defaultsKey.key.metadata, v6);
      goto LABEL_6;
    }
  }
  else
  {

  }
  _GEOConfigRemoveValue(*(_QWORD *)&self->_defaultsKey.key.identifier, self->_defaultsKey.key.metadata);
  v6 = 0;
LABEL_6:
  callback = (void (**)(id, id, _QWORD))self->_callback;
  if (callback)
    callback[2](callback, v6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:userInfo:", GEOCountryConfigurationProvidersDidChangeNotification, self, 0);

  -[UITextField resignFirstResponder](self->_textField, "resignFirstResponder");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CustomServiceURLDebugController navigationController](self, "navigationController", a3));
  v4 = objc_msgSend(v3, "popViewControllerAnimated:", 1);

  return 1;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)defaultsKey
{
  $6F5222B66F7267E8E15258F009EE747C *p_defaultsKey;
  uint64_t v3;
  void *metadata;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  p_defaultsKey = &self->_defaultsKey;
  v3 = *(_QWORD *)&self->_defaultsKey.key.identifier;
  metadata = p_defaultsKey->key.metadata;
  result.var0.var1 = metadata;
  *(_QWORD *)&result.var0.var0 = v3;
  return result;
}

- (void)setDefaultsKey:(id)a3
{
  self->_defaultsKey = ($6F5222B66F7267E8E15258F009EE747C)a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)defaultURLString
{
  return self->_defaultURLString;
}

- (void)setDefaultURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_defaultURLString, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end

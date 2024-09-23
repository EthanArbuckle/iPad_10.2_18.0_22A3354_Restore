@implementation _JSAAlertActionModel

- (_JSAAlertActionModel)initWithAction:(id)a3
{
  id v4;
  _JSAAlertActionModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *actionType;
  uint64_t v15;
  NSString *option;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  JSValue *callback;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *placeholderText;
  unsigned int v30;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_JSAAlertActionModel;
  v5 = -[_JSAAlertActionModel init](&v35, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", CFSTR("actionType")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", CFSTR("option")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", CFSTR("title")));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", CFSTR("selected")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", CFSTR("style")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", CFSTR("type")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", CFSTR("placeholderText")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", CFSTR("allowsEmpty")));
    if ((objc_msgSend(v6, "isString") & 1) != 0)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toString"));
      actionType = v5->_actionType;
      v5->_actionType = (NSString *)v13;
    }
    else
    {
      actionType = v5->_actionType;
      v5->_actionType = (NSString *)&stru_2F6710;
    }

    if ((objc_msgSend(v7, "isString") & 1) != 0)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toString"));
      option = v5->_option;
      v5->_option = (NSString *)v15;
    }
    else
    {
      option = v5->_option;
      v5->_option = (NSString *)&stru_2F6710;
    }

    if ((objc_msgSend(v8, "isString") & 1) != 0)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toString"));
      title = v5->_title;
      v5->_title = (NSString *)v17;
    }
    else
    {
      title = v5->_title;
      v5->_title = (NSString *)&stru_2F6710;
    }

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", CFSTR("callback")));
    callback = v5->_callback;
    v5->_callback = (JSValue *)v19;

    v21 = objc_msgSend(v34, "isBoolean");
    v32 = v8;
    if (v21)
      LOBYTE(v21) = objc_msgSend(v34, "toBool", v8);
    v22 = v7;
    v5->_selected = v21;
    v23 = v6;
    if ((objc_msgSend(v9, "isString", v32) & 1) != 0)
    {
      v24 = (void *)objc_opt_class(v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toString"));
      v5->_style = (int64_t)objc_msgSend(v24, "_alertActionStyleForName:", v25);

    }
    else
    {
      v5->_style = 0;
    }
    if ((objc_msgSend(v10, "isString") & 1) != 0)
    {
      v26 = (void *)objc_opt_class(v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "toString"));
      v5->_type = (unint64_t)objc_msgSend(v26, "_modelTypeForString:", v27);

    }
    else
    {
      v5->_type = 0;
    }
    if ((objc_msgSend(v11, "isString") & 1) != 0)
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toString"));
      placeholderText = v5->_placeholderText;
      v5->_placeholderText = (NSString *)v28;
    }
    else
    {
      placeholderText = v5->_placeholderText;
      v5->_placeholderText = 0;
    }

    v30 = objc_msgSend(v12, "isBoolean");
    if (v30)
      LOBYTE(v30) = objc_msgSend(v12, "toBool");
    v5->_allowsEmpty = v30;

  }
  return v5;
}

+ (unint64_t)_modelTypeForString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("textField"));
}

+ (int64_t)_alertActionStyleForName:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("destructive")) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("cancel"));

  return v4;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)option
{
  return self->_option;
}

- (NSString)title
{
  return self->_title;
}

- (JSValue)callback
{
  return self->_callback;
}

- (BOOL)selected
{
  return self->_selected;
}

- (int64_t)style
{
  return self->_style;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (BOOL)allowsEmpty
{
  return self->_allowsEmpty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_option, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

@end

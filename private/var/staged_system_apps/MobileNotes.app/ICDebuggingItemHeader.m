@implementation ICDebuggingItemHeader

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  -[ICDebuggingItemHeader setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)setClearButtonHandler:(id)a3
{
  id v4;
  id clearButtonHandler;

  v4 = objc_retainBlock(a3);
  clearButtonHandler = self->_clearButtonHandler;
  self->_clearButtonHandler = v4;

  -[ICDebuggingItemHeader setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v11;
  id v12;

  v11.receiver = self;
  v11.super_class = (Class)ICDebuggingItemHeader;
  -[ICDebuggingItemHeader updateConfigurationUsingState:](&v11, "updateConfigurationUsingState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedHeaderConfiguration](UIListContentConfiguration, "groupedHeaderConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItemHeader title](self, "title"));
  objc_msgSend(v4, "setText:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItemHeader clearButtonHandler](self, "clearButtonHandler"));
  if (v6)
  {
    v7 = objc_alloc((Class)UICellAccessoryCustomView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItemHeader clearButton](self, "clearButton"));
    v9 = objc_msgSend(v7, "initWithCustomView:placement:", v8, 1);

    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    -[ICDebuggingItemHeader setAccessories:](self, "setAccessories:", v10);

  }
  else
  {
    -[ICDebuggingItemHeader setAccessories:](self, "setAccessories:", &__NSArray0__struct);
  }
  -[ICDebuggingItemHeader setContentConfiguration:](self, "setContentConfiguration:", v4);

}

- (UIButton)clearButton
{
  UIButton *clearButton;
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *v8;
  UIButton *v9;
  _QWORD v10[5];

  clearButton = self->_clearButton;
  if (clearButton)
    return clearButton;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A0414;
  v10[3] = &unk_1005518D0;
  v10[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v10));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v6, "setTitle:", CFSTR("Clear"));
  objc_msgSend(v6, "setButtonSize:", 2);
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v6, v5));
  v8 = self->_clearButton;
  self->_clearButton = v7;

  v9 = self->_clearButton;
  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (id)clearButtonHandler
{
  return self->_clearButtonHandler;
}

- (void)setClearButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong(&self->_clearButtonHandler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

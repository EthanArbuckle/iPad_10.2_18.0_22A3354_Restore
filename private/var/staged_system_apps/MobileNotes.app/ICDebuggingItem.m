@implementation ICDebuggingItem

- (ICDebuggingItem)initWithTitle:(id)a3 selector:(SEL)a4
{
  id v7;
  ICDebuggingItem *v8;
  ICDebuggingItem *v9;
  NSString *subtitle;
  NSString *selectedDefaultsKey;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICDebuggingItem;
  v8 = -[ICDebuggingItem init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_selector = a4;
    subtitle = v9->_subtitle;
    v9->_subtitle = 0;

    selectedDefaultsKey = v9->_selectedDefaultsKey;
    v9->_selectedDefaultsKey = 0;

  }
  return v9;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItem title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uppercaseString"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItem subtitle](self, "subtitle"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItem subtitle](self, "subtitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uppercaseString"));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v4, v7));

  }
  else
  {
    v8 = v4;
  }

  return (NSString *)v8;
}

- (BOOL)isSelected
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItem selectedDefaultsKey](self, "selectedDefaultsKey"));
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ICDebuggingItem;
  v3 = -[ICDebuggingItem debugDescription](&v14, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItem title](self, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItem subtitle](self, "subtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItem identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingItem selectedDefaultsKey](self, "selectedDefaultsKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICDebuggingItem isSelected](self, "isSelected")));
  v10 = NSStringFromSelector(-[ICDebuggingItem selector](self, "selector"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, title: %@, subtitle: %@, identifier: %@, selectedDefaultsKey: %@, selected: %@, selector: %@"), v4, v5, v6, v7, v8, v9, v11));

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (BOOL)isPresenter
{
  return self->_presenter;
}

- (void)setPresenter:(BOOL)a3
{
  self->_presenter = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (NSString)selectedDefaultsKey
{
  return self->_selectedDefaultsKey;
}

- (void)setSelectedDefaultsKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_selectedDefaultsKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

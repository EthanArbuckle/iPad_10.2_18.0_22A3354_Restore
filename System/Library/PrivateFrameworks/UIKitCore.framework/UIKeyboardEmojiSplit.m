@implementation UIKeyboardEmojiSplit

- (id)defaultIndexPath
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
}

- (UIKeyboardEmojiSplit)initWithFrame:(CGRect)a3
{
  UIKeyboardEmojiSplit *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UITableView *v9;
  UITableView *picker;
  void *v11;
  UIKeyboardEmojiSplit *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardEmojiSplit;
  v3 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView bounds](v3, "bounds");
    v9 = -[UITableView initWithFrame:]([UITableView alloc], "initWithFrame:", v5, v6, v7, v8);
    picker = v3->_picker;
    v3->_picker = v9;

    -[UITableView setSeparatorStyle:](v3->_picker, "setSeparatorStyle:", 0);
    -[UITableView setDelaysContentTouches:](v3->_picker, "setDelaysContentTouches:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v3->_picker, "setBackgroundColor:", v11);

    -[UIView addSubview:](v3, "addSubview:", v3->_picker);
    v12 = v3;
  }

  return v3;
}

- (BOOL)shouldCache
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferencesActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rivenSizeFactor:", 200.0);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferencesActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rivenSizeFactor:", 34.0);
  v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setOpaque:", 0);
  +[UIColor clearColor](UIColor, "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (UITableView)picker
{
  return (UITableView *)objc_getProperty(self, a2, 608, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
}

@end

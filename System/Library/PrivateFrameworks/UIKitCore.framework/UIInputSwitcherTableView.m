@implementation UIInputSwitcherTableView

- (void)deselectRowAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  -[UITableView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputSwitcherTableView menu](self, "menu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "usesDarkTheme") & 1) != 0)
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  -[UIInputSwitcherTableView menu](self, "menu");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "usesDarkTheme") & 1) != 0)
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  objc_msgSend(v7, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsDisplay");

  v15.receiver = self;
  v15.super_class = (Class)UIInputSwitcherTableView;
  -[UITableView deselectRowAtIndexPath:animated:](&v15, sel_deselectRowAtIndexPath_animated_, v6, v4);

}

- (void)selectRowAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  UIInputSwitcherTableView *v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(v8, "section");
  if (v9 >= -[UITableView numberOfSections](self, "numberOfSections")
    || (v10 = objc_msgSend(v8, "row"),
        v10 >= -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", objc_msgSend(v8, "section"))))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v8;
        v23 = 2112;
        v24 = self;
        _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Attempted to select an out-of-bounds index path (%@) in %@", buf, 0x16u);
      }

    }
    else
    {
      v17 = selectRowAtIndexPath_animated_scrollPosition____s_category;
      if (!selectRowAtIndexPath_animated_scrollPosition____s_category)
      {
        v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&selectRowAtIndexPath_animated_scrollPosition____s_category);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v8;
        v23 = 2112;
        v24 = self;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Attempted to select an out-of-bounds index path (%@) in %@", buf, 0x16u);
      }
    }
  }
  else
  {
    -[UITableView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detailTextLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v14);

    objc_msgSend(v11, "backgroundView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsDisplay");

    v20.receiver = self;
    v20.super_class = (Class)UIInputSwitcherTableView;
    -[UITableView selectRowAtIndexPath:animated:scrollPosition:](&v20, sel_selectRowAtIndexPath_animated_scrollPosition_, v8, v6, a5);

  }
}

- (UIKeyboardMenuView)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  self->_menu = (UIKeyboardMenuView *)a3;
}

@end

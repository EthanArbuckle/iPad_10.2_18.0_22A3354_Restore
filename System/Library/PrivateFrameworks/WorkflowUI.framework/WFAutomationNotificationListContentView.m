@implementation WFAutomationNotificationListContentView

- (WFAutomationNotificationListContentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  WFAutomationNotificationListContentView *v7;
  UITableView *v8;
  UITableView *tableView;
  UITableView *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  WFAutomationNotificationListContentView *v27;
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)WFAutomationNotificationListContentView;
  v7 = -[WFAutomationNotificationListContentView initWithFrame:](&v29, sel_initWithFrame_);
  if (v7)
  {
    v8 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F0]), "initWithFrame:style:", 0, x, y, width, height);
    tableView = v7->_tableView;
    v7->_tableView = v8;
    v10 = v8;

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    v13 = *MEMORY[0x24BEBE770];
    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRowHeight:", v13);

    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEstimatedRowHeight:", 110.0);

    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSeparatorInset:", 0.0, 124.0, 0.0, 0.0);

    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAutoresizingMask:", 18);

    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v7);

    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDataSource:", v7);

    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationNotificationListContentView addSubview:](v7, "addSubview:", v20);

    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "wf_addConstraintsToFillSuperview:", v7);

    -[WFAutomationNotificationListContentView tableView](v7, "tableView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    v25 = (objc_class *)objc_opt_class();

    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", v24, v26);

    v27 = v7;
  }

  return v7;
}

- (void)updateUIFromNotificationUserInfo:(id)a3
{
  void *v4;
  id v5;

  WFTriggerDisplayInfoToDisableFromNotificationUserInfo();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAutomationNotificationListContentView setTriggerDisplayInfo:](self, "setTriggerDisplayInfo:", v5);
  -[WFAutomationNotificationListContentView tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;

  v5 = a4;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationNotificationListContentView triggerDisplayInfo](self, "triggerDisplayInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v5, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAutomationNotificationListContentView tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableCellWithIdentifier:forIndexPath:", v7, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAccessoryType:", 0);
  objc_msgSend(v9, "localizedTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v9, "triggerClass"), "displayGlyph");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v9, "triggerClass"), "displayGlyphTintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v9, "triggerClass"), "displayGlyphCornerRadius");
  v17 = v16;
  objc_msgSend(v9, "actionIcons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:description:triggerIcon:triggerTintColor:triggerCornerRadius:actionIcons:", v12, v13, v14, v15, v18, v17);

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFAutomationNotificationListContentView triggerDisplayInfo](self, "triggerDisplayInfo", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (CGSize)preferredSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[WFAutomationNotificationListContentView tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[WFAutomationNotificationListContentView tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NSArray)triggerDisplayInfo
{
  return self->_triggerDisplayInfo;
}

- (void)setTriggerDisplayInfo:(id)a3
{
  objc_storeStrong((id *)&self->_triggerDisplayInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerDisplayInfo, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end

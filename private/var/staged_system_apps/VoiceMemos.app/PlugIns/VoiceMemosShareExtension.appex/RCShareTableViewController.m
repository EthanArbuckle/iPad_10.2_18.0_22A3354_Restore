@implementation RCShareTableViewController

- (void)loadView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  UITableViewCell *v7;
  UITableViewCell *voiceMemoTitleCell;
  void *v9;
  id v10;
  void *v11;
  UITextField *v12;
  UITextField *voiceMemoTitleText;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)RCShareTableViewController;
  -[RCShareTableViewController loadView](&v15, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareTableViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = RCLocalizedFrameworkString(CFSTR("VOICE_MEMOS_APP_NAME"), CFSTR("Voice Memos app name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[RCShareTableViewController setTitle:](self, "setTitle:", v6);

  v7 = (UITableViewCell *)objc_alloc_init((Class)UITableViewCell);
  voiceMemoTitleCell = self->_voiceMemoTitleCell;
  self->_voiceMemoTitleCell = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UITableViewCell setBackgroundColor:](self->_voiceMemoTitleCell, "setBackgroundColor:", v9);

  v10 = objc_alloc((Class)UITextField);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell contentView](self->_voiceMemoTitleCell, "contentView"));
  objc_msgSend(v11, "bounds");
  v17 = CGRectInset(v16, 15.0, 0.0);
  v12 = (UITextField *)objc_msgSend(v10, "initWithFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  voiceMemoTitleText = self->_voiceMemoTitleText;
  self->_voiceMemoTitleText = v12;

  -[UITextField setAutoresizingMask:](self->_voiceMemoTitleText, "setAutoresizingMask:", 18);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell contentView](self->_voiceMemoTitleCell, "contentView"));
  objc_msgSend(v14, "addSubview:", self->_voiceMemoTitleText);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCShareTableViewController;
  -[RCShareTableViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  if (self->_sharedFileName)
    -[RCShareTableViewController _setupTitleCellTextWithDefaultFileName:](self, "_setupTitleCellTextWithDefaultFileName:");
}

- (void)setSharedFileName:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_sharedFileName, a3);
  v5 = a3;
  -[RCShareTableViewController _setupTitleCellTextWithDefaultFileName:](self, "_setupTitleCellTextWithDefaultFileName:", v5);

}

- (void)_setupTitleCellTextWithDefaultFileName:(id)a3
{
  id v4;
  UITextField *voiceMemoTitleText;
  id v6;

  v4 = a3;
  voiceMemoTitleText = self->_voiceMemoTitleText;
  if (voiceMemoTitleText && !self->_didSetupTitleCellText)
  {
    v6 = v4;
    -[UITextField setText:](voiceMemoTitleText, "setText:", v4);
    -[UITextField setPlaceholder:](self->_voiceMemoTitleText, "setPlaceholder:", v6);
    v4 = v6;
    self->_didSetupTitleCellText = 1;
  }

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
  return self->_voiceMemoTitleCell;
}

- (UITextField)voiceMemoTitleText
{
  return self->_voiceMemoTitleText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceMemoTitleText, 0);
  objc_storeStrong((id *)&self->_sharedFileName, 0);
  objc_storeStrong((id *)&self->_voiceMemoTitleCell, 0);
}

@end

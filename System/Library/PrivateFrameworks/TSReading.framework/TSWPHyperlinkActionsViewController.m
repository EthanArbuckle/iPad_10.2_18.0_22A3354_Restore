@implementation TSWPHyperlinkActionsViewController

- (TSWPHyperlinkActionsViewController)initWithHyperlink:(id)a3 readOnly:(BOOL)a4
{
  TSWPHyperlinkActionsViewController *v6;
  TSWPHyperlinkActionsViewController *v7;

  v6 = -[TSWPHyperlinkActionsViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_readOnly = a4;
    -[TSWPHyperlinkActionsViewController setHyperlink:](v6, "setHyperlink:", a3);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkActionsViewController;
  -[TSWPHyperlinkActionsViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  id v3;

  v3 = +[TSWPHyperlinkUIController defaultTableView](TSWPHyperlinkUIController, "defaultTableView");
  objc_msgSend(v3, "setDataSource:", self);
  objc_msgSend(v3, "setDelegate:", self);
  -[TSWPHyperlinkActionsViewController setView:](self, "setView:", v3);
  -[TSWPHyperlinkActionsViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  +[TSKPopoverBasedViewController preferredContentSizeForTableView:](TSKPopoverBasedViewController, "preferredContentSizeForTableView:", v3);
  -[TSWPHyperlinkActionsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  objc_super v18;

  v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TSWPHyperlinkActionsViewController;
  -[TSWPHyperlinkActionsViewController viewWillAppear:](&v18, sel_viewWillAppear_);
  objc_opt_class();
  objc_msgSend((id)objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "interactiveCanvasController"), "layerHost");
  v5 = (void *)TSUDynamicCast();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v6 = objc_msgSend(v5, "performSelector:withObject:", sel_hyperlinkUICustomStringForURLString_, objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "stringForURL"))) == 0)
  {
    v6 = objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "stringForURL");
  }
  objc_msgSend((id)-[TSWPHyperlinkActionsViewController view](self, "view"), "frame");
  v8 = v7;
  if (objc_msgSend((id)-[TSWPHyperlinkActionsViewController navigationItem](self, "navigationItem"), "titleView"))
  {
    objc_msgSend((id)objc_msgSend((id)-[TSWPHyperlinkActionsViewController navigationItem](self, "navigationItem"), "titleView"), "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v14 = v8 + -20.0;
    v10 = 0.0;
    v16 = 35.0;
    v12 = 0.0;
  }
  objc_msgSend((id)-[TSWPHyperlinkActionsViewController navigationItem](self, "navigationItem"), "setTitleView:", -[TSWPHyperlinkPopoverTitleView initWithFrame:titleString:]([TSWPHyperlinkPopoverTitleView alloc], "initWithFrame:titleString:", v6, v10, v12, v14, v16));
  objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "p_clearTextSelection");
  objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "showHyperlinkHighlight");
  v17.receiver = self;
  v17.super_class = (Class)TSWPHyperlinkActionsViewController;
  -[TSWPHyperlinkActionsViewController viewWillAppear:](&v17, sel_viewWillAppear_, v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_readOnly)
    return 1;
  else
    return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  const __CFString *v10;

  v5 = -[NSString isEqualToString:](-[NSURL scheme](-[TSWPHyperlinkField url](-[TSWPHyperlinkActionsViewController hyperlink](self, "hyperlink", a3), "url"), "scheme"), "isEqualToString:", CFSTR("mailto"));
  v6 = objc_msgSend(a4, "section");
  v7 = objc_msgSend(a4, "row");
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, 0);
  if (!(v6 | v7))
  {
    v9 = (void *)TSWPBundle();
    if (v5)
      v10 = CFSTR("New Message");
    else
      v10 = CFSTR("Open");
    goto LABEL_8;
  }
  if (!v6 && v7 == 1)
  {
    v9 = (void *)TSWPBundle();
    v10 = CFSTR("Copy");
LABEL_8:
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setText:", objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_24D82FEB0, CFSTR("TSText")));
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setTextAlignment:", 1);
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setText:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Link Settings"), &stru_24D82FEB0, CFSTR("TSText")));
    objc_msgSend(v8, "setAccessoryType:", 1);
  }
LABEL_9:
  +[TSKPopoverBasedViewController configureTableViewCell:](TSKPopoverBasedViewController, "configureTableViewCell:", v8);
  return v8;
}

- (id)hyperlinkSettingsViewController
{
  id result;

  result = self->_hyperlinkSettingsViewController;
  if (!result)
  {
    result = -[TSWPHyperlinkSettingsViewController initWithHyperlink:readOnly:]([TSWPHyperlinkSettingsViewController alloc], "initWithHyperlink:readOnly:", -[TSWPHyperlinkActionsViewController hyperlink](self, "hyperlink"), self->_readOnly);
    self->_hyperlinkSettingsViewController = (TSWPHyperlinkSettingsViewController *)result;
  }
  return result;
}

- (TSWPHyperlinkField)hyperlink
{
  return self->_hyperlink;
}

- (void)setHyperlink:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 968);
}

@end

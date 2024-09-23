@implementation TSWPHyperlinkSettingsViewController

- (TSWPHyperlinkSettingsViewController)initWithHyperlink:(id)a3 readOnly:(BOOL)a4
{
  TSWPHyperlinkSettingsViewController *v6;
  TSWPHyperlinkSettingsViewController *v7;

  v6 = -[TSWPHyperlinkSettingsViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_readOnly = a4;
    -[TSWPHyperlinkSettingsViewController setHyperlink:](v6, "setHyperlink:", a3);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkSettingsViewController;
  -[TSWPHyperlinkSettingsViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  id v3;

  v3 = +[TSWPHyperlinkUIController defaultTableView](TSWPHyperlinkUIController, "defaultTableView");
  objc_msgSend(v3, "setDataSource:", self);
  objc_msgSend(v3, "setDelegate:", self);
  -[TSWPHyperlinkSettingsViewController setView:](self, "setView:", v3);
  objc_msgSend((id)-[TSWPHyperlinkSettingsViewController navigationItem](self, "navigationItem"), "setTitle:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Link Settings"), &stru_24D82FEB0, CFSTR("TSText")));
  -[TSWPHyperlinkSettingsViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  +[TSKPopoverBasedViewController preferredContentSizeForTableView:](TSKPopoverBasedViewController, "preferredContentSizeForTableView:", v3);
  -[TSWPHyperlinkSettingsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
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
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  TSWPTextFieldTableViewCell *v10;
  uint64_t v11;
  UITextField *v12;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v7 = +[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController");
  v8 = -[NSString isEqualToString:](-[NSURL scheme](-[TSWPHyperlinkField url](-[TSWPHyperlinkSettingsViewController hyperlink](self, "hyperlink"), "url"), "scheme"), "isEqualToString:", CFSTR("mailto"));
  v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cell%ld.%ld"), objc_msgSend(a4, "section"), objc_msgSend(a4, "row"));
  v10 = (TSWPTextFieldTableViewCell *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", v9);
  if (!v10)
  {
    if (objc_msgSend(a4, "section"))
    {
      v10 = (TSWPTextFieldTableViewCell *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, 0);
      objc_msgSend((id)-[TSWPTextFieldTableViewCell textLabel](v10, "textLabel"), "setText:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Remove Link"), &stru_24D82FEB0, CFSTR("TSText")));
      objc_msgSend((id)-[TSWPTextFieldTableViewCell textLabel](v10, "textLabel"), "setTextAlignment:", 1);
      v11 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
      v12 = (UITextField *)-[TSWPTextFieldTableViewCell textLabel](v10, "textLabel");
LABEL_4:
      -[UITextField setTextColor:](v12, "setTextColor:", v11);
      goto LABEL_5;
    }
    v10 = -[TSWPTextFieldTableViewCell initWithStyle:reuseIdentifier:]([TSWPTextFieldTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, v9);
    v14 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel_textFieldDidChange_, *MEMORY[0x24BDF7F58], -[TSWPTextFieldTableViewCell textField](v10, "textField"));
    -[UITextField setTag:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setTag:", objc_msgSend(a4, "row"));
    if (objc_msgSend(a4, "row"))
    {
      if (objc_msgSend(a4, "row") == 1)
      {
        objc_msgSend((id)-[TSWPTextFieldTableViewCell textLabel](v10, "textLabel"), "setText:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Display"), &stru_24D82FEB0, CFSTR("TSText")));
        -[UITextField setText:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setText:", objc_msgSend(v7, "stringForDisplay"));
        -[TSWPTextFieldTableViewCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
        if (self->_readOnly)
        {
          -[UITextField setEnabled:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setEnabled:", 0);
          v11 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.219999999, 0.330000013, 0.529999971, 0.5);
          v12 = -[TSWPTextFieldTableViewCell textField](v10, "textField");
          goto LABEL_4;
        }
      }
    }
    else
    {
      v15 = (void *)TSWPBundle();
      if (v8)
        v16 = CFSTR("To");
      else
        v16 = CFSTR("Link");
      if (v8)
        v17 = 7;
      else
        v17 = 3;
      objc_msgSend((id)-[TSWPTextFieldTableViewCell textLabel](v10, "textLabel"), "setText:", objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_24D82FEB0, CFSTR("TSText")));
      -[UITextField setKeyboardType:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setKeyboardType:", v17);
      objc_opt_class();
      objc_msgSend((id)objc_msgSend(v7, "interactiveCanvasController"), "layerHost");
      v18 = (void *)TSUDynamicCast();
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (v19 = objc_msgSend(v18, "performSelector:withObject:", sel_hyperlinkUICustomStringForURLString_, objc_msgSend(v7, "stringForURL"))) != 0)
      {
        -[UITextField setText:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setText:", v19);
        -[UITextField setEnabled:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setEnabled:", 0);
        -[UITextField setTextColor:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.219999999, 0.330000013, 0.529999971, 0.5));
      }
      else
      {
        -[UITextField setText:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setText:", objc_msgSend((id)objc_msgSend(v7, "stringForURL"), "stringByRemovingPercentEncoding"));
      }
      -[UITextField setAutocorrectionType:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setAutocorrectionType:", 1);
      -[TSWPTextFieldTableViewCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
    }
  }
LABEL_5:
  +[TSKPopoverBasedViewController configureTableViewCell:](TSKPopoverBasedViewController, "configureTableViewCell:", v10);
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_super v6;

  v3 = a3;
  v5 = +[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController");
  v6.receiver = self;
  v6.super_class = (Class)TSWPHyperlinkSettingsViewController;
  -[TSWPHyperlinkSettingsViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  if (objc_msgSend(v5, "editingController"))
  {
    objc_msgSend(v5, "hideHyperlinkHighlight");
    objc_msgSend(v5, "p_selectHyperlinkField");
  }
  if (TSUPhoneUI())
    +[TSKKeyboardMonitor addKeyboardObserver:](TSKKeyboardMonitor, "addKeyboardObserver:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPHyperlinkSettingsViewController;
  -[TSWPHyperlinkSettingsViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (TSUPhoneUI())
    +[TSKKeyboardMonitor removeKeyboardObserver:](TSKKeyboardMonitor, "removeKeyboardObserver:", self);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "delegate");
  return objc_msgSend(v3, "application:supportedInterfaceOrientationsForWindow:", objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), objc_msgSend((id)-[TSWPHyperlinkSettingsViewController view](self, "view"), "window"));
}

- (void)keyboardDidShowOrDock:(id)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)-[TSWPHyperlinkSettingsViewController view](self, "view", a3);
  objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "keyboardFrame");
  if (v5 >= v6)
    v5 = v6;
  objc_msgSend(v4, "setContentInset:", 0.0, 0.0, v5, 0.0);
  objc_msgSend(v4, "scrollToRowAtIndexPath:atScrollPosition:animated:", objc_msgSend(v4, "indexPathForCell:", self->_editingCell), 0, 1);
}

- (void)keyboardDidHideOrUndock:(id)a3
{
  void *v3;

  v3 = (void *)-[TSWPHyperlinkSettingsViewController view](self, "view", a3);
  objc_msgSend(v3, "setContentInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
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

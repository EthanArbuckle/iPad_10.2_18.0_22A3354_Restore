@implementation MTOptionsTableViewController

+ (double)rowHeight
{
  id v2;
  void *v3;
  double v4;
  double v5;

  v2 = objc_msgSend((id)objc_opt_class(a1), "optionFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "lineHeight");
  v5 = v4 + 30.0;

  return v5;
}

+ (id)optionFont
{
  return +[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody);
}

- (MTOptionsTableViewController)initWithOption:(id)a3
{
  return -[MTOptionsTableViewController initWithOption:largeTitleDisplayMode:](self, "initWithOption:largeTitleDisplayMode:", a3, 0);
}

- (MTOptionsTableViewController)initWithOption:(id)a3 largeTitleDisplayMode:(int64_t)a4
{
  id v7;
  MTOptionsTableViewController *v8;
  MTOptionsTableViewController *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTOptionsTableViewController;
  v8 = -[MTOptionsTableViewController initWithStyle:](&v13, "initWithStyle:", 2);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_option, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController navigationItem](v9, "navigationItem"));
    objc_msgSend(v11, "setLargeTitleDisplayMode:", a4);

  }
  return v9;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTOptionsTableViewController;
  -[MTOptionsTableViewController viewDidLoad](&v3, "viewDidLoad");
  -[MTOptionsTableViewController updateRowHeight](self, "updateRowHeight");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTOptionsTableViewController;
  -[MTOptionsTableViewController dealloc](&v4, "dealloc");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTOptionsTableViewController;
  v7 = a4;
  -[MTOptionsTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000EEB74;
  v8[3] = &unk_1004A7508;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController view](self, "view", a3));
  objc_msgSend(v4, "setNeedsLayout");

  -[MTOptionsTableViewController updateRowHeight](self, "updateRowHeight");
}

- (void)updateRowHeight
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController tableView](self, "tableView"));
  objc_msgSend((id)objc_opt_class(self), "rowHeight");
  objc_msgSend(v3, "setRowHeight:");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "longTitles"));
  v7 = objc_msgSend(v6, "count");

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  MTTableViewCell *v7;
  id v8;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = (MTTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("OptionCell")));
  if (!v7)
    v7 = -[MTTableViewCell initWithStyle:reuseIdentifier:]([MTTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("OptionCell"));
  v8 = objc_msgSend(v6, "row");
  v9 = v8 == (id)-[MTOptionsTableViewController selectedIndex](self, "selectedIndex");
  v10 = v9;
  if (v9)
    v11 = 3;
  else
    v11 = 0;
  -[MTTableViewCell setAccessoryType:](v7, "setAccessoryType:", v11);
  -[MTOptionsTableViewController _updateTextColorForCell:selected:](self, "_updateTextColorForCell:selected:", v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell textLabel](v7, "textLabel"));
  v13 = objc_msgSend((id)objc_opt_class(self), "optionFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v12, "setFont:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell textLabel](v7, "textLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "options"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "longTitles"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v6, "row")));
  objc_msgSend(v15, "setText:", v19);

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  MTGenericSettingsFooterLabelView *v5;
  void *v6;
  void *v7;

  v5 = (MTGenericSettingsFooterLabelView *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController footerText](self, "footerText", a3, a4));

  if (v5)
  {
    v5 = objc_alloc_init(MTGenericSettingsFooterLabelView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController footerText](self, "footerText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](v5, "textView"));
    objc_msgSend(v7, "setAttributedText:", v6);

  }
  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  NSAttributedStringKey v15;
  void *v16;
  CGRect v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController footerText](self, "footerText", a3, a4));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController view](self, "view"));
    objc_msgSend(v7, "frame");
    v8 = CGRectGetWidth(v17) + -64.0;
    v15 = NSFontAttributeName;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont sectionFooterFont](UIFont, "sectionFooterFont"));
    v16 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, v8, 1.79769313e308);
    v12 = v11;

    v13 = v12 + 16.0;
  }
  else
  {
    v13 = 16.0;
  }

  return v13;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = objc_opt_class(UITableViewHeaderFooterView);
  if ((objc_opt_isKindOfClass(v10, v6) & 1) != 0)
  {
    v7 = v10;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController headerText](self, "headerText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));

    objc_msgSend(v9, "setText:", v8);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**optionSelectedBlock)(id, id);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[MTOptionsTableViewController selectedIndex](self, "selectedIndex"), objc_msgSend(v6, "section")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cellForRowAtIndexPath:", v7));
  objc_msgSend(v8, "setAccessoryType:", 0);
  -[MTOptionsTableViewController _updateTextColorForCell:selected:](self, "_updateTextColorForCell:selected:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cellForRowAtIndexPath:", v6));

  objc_msgSend(v9, "setAccessoryType:", 3);
  -[MTOptionsTableViewController _updateTextColorForCell:selected:](self, "_updateTextColorForCell:selected:", v9, 1);
  objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v6, 1);
  optionSelectedBlock = (void (**)(id, id))self->_optionSelectedBlock;
  if (optionSelectedBlock)
    optionSelectedBlock[2](optionSelectedBlock, objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v6, "section")));
  objc_msgSend(v16, "reloadSections:withRowAnimation:", v11, 100);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "headerViewForSection:", objc_msgSend(v6, "section")));
  v13 = objc_opt_class(UITableViewHeaderFooterView);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController headerText](self, "headerText"));
    objc_msgSend(v14, "setText:", v15);

  }
}

- (void)_updateTextColorForCell:(id)a3 selected:(BOOL)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  if (a4)
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](UIColor, "appTintColor"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](UIColor, "cellTextColor"));
  v8 = (id)v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));

  objc_msgSend(v7, "setTextColor:", v8);
}

- (id)footerText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "footerText"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "footerCallback"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "options"));
    v10 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "footerCallback"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
    v13 = (id)((uint64_t (**)(_QWORD, id))v10)[2](v10, objc_msgSend(v12, "unsignedIntegerValue"));

  }
  return v4;
}

- (id)headerText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerCallback"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "options"));
    v8 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerCallback"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
    v11 = (id)((uint64_t (**)(_QWORD, id))v8)[2](v8, objc_msgSend(v10, "unsignedIntegerValue"));

  }
  return 0;
}

- (unint64_t)selectedIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v7 = objc_msgSend(v4, "indexForValue:", objc_msgSend(v6, "unsignedIntegerValue"));

  return (unint64_t)v7;
}

- (id)metricsName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "headerTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Settings: %@"), v3));

  return v4;
}

- (id)optionSelectedBlock
{
  return self->_optionSelectedBlock;
}

- (void)setOptionSelectedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MTOptionSetting)option
{
  return self->_option;
}

- (void)setOption:(id)a3
{
  objc_storeStrong((id *)&self->_option, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_option, 0);
  objc_storeStrong(&self->_optionSelectedBlock, 0);
}

@end

@implementation TUIStatsFeedEntryViewController

- (TUIStatsFeedEntryViewController)initWithFeedEntry:(id)a3
{
  id v5;
  TUIStatsFeedEntryViewController *v6;
  TUIStatsFeedEntryViewController *v7;
  id v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIStatsFeedEntryViewController;
  v6 = -[TUIStatsFeedEntryViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedEntry, a3);
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Done"), 2, v7, "_dismiss:");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntryViewController navigationItem](v7, "navigationItem"));
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
  return v7;
}

- (void)_dismiss:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntryViewController navigationController](self, "navigationController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIStatsFeedEntryViewController;
  -[TUIStatsFeedEntryViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntryViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUIStatsCell nib](TUIStatsCell, "nib"));
  objc_msgSend(v3, "registerNib:forCellReuseIdentifier:", v4, CFSTR("cell"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntryViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setRowHeight:", UITableViewAutomaticDimension);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntryViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setEstimatedRowHeight:", 100.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntryViewController tableView](self, "tableView"));
  objc_msgSend(v7, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView, v8), CFSTR("header"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  if (!a4)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntry passes](self->_feedEntry, "passes", a3));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntryViewController tableView](self, "tableView", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header")));

  if (a4 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    v8 = v7;
    v9 = CFSTR("Passes");
    goto LABEL_5;
  }
  if (!a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    v8 = v7;
    v9 = CFSTR("Summary");
LABEL_5:
    objc_msgSend(v7, "setText:", v9);

  }
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v6));
  if (objc_msgSend(v6, "section"))
  {
    if (objc_msgSend(v6, "section") == (char *)&dword_0 + 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntry passes](self->_feedEntry, "passes"));
      v9 = (char *)objc_msgSend(v8, "count");
      v10 = &v9[~(unint64_t)objc_msgSend(v6, "row")];

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedEntry passes](self->_feedEntry, "passes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v10));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
      v15 = TUIStatsReasonToString((char)objc_msgSend(v12, "reason"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@\n\n"), v14, v16));
      objc_msgSend(v7, "setHeader:", v17);

      objc_msgSend(v7, "setTimingProvider:", v12);
      objc_msgSend(v7, "setEventProvider:", v12);

    }
  }
  else
  {
    objc_msgSend(v7, "setHeader:", 0);
    objc_msgSend(v7, "setTimingProvider:", self->_feedEntry);
    objc_msgSend(v7, "setEventProvider:", self->_feedEntry);
  }
  objc_msgSend(v7, "updateContent");

  return v7;
}

- (TUIStatsFeedEntry)feedEntry
{
  return self->_feedEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedEntry, 0);
}

@end

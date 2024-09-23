@implementation TUIStatsFeedViewController

- (TUIStatsFeedViewController)initWithFeed:(id)a3
{
  id v5;
  TUIStatsFeedViewController *v6;
  TUIStatsFeedViewController *v7;
  id v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIStatsFeedViewController;
  v6 = -[TUIStatsFeedViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feed, a3);
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Done"), 2, v7, "_dismiss:");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedViewController navigationItem](v7, "navigationItem"));
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
  return v7;
}

- (void)_dismiss:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedViewController navigationController](self, "navigationController", a3));
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
  v9.super_class = (Class)TUIStatsFeedViewController;
  -[TUIStatsFeedViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUIStatsCell nib](TUIStatsCell, "nib"));
  objc_msgSend(v3, "registerNib:forCellReuseIdentifier:", v4, CFSTR("cell"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setRowHeight:", UITableViewAutomaticDimension);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setEstimatedRowHeight:", 100.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedViewController tableView](self, "tableView"));
  objc_msgSend(v7, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView, v8), CFSTR("header"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeed passes](self->_feed, "passes"));
    }
    else
    {
      if (a4 != 1)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeed currentEntriesUID](self->_feed, "currentEntriesUID"));
    }
    v9 = v7;
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = &dword_0 + 1;
  }
LABEL_9:

  return (int64_t)v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedViewController tableView](self, "tableView", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header")));

  switch(a4)
  {
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
      v8 = v7;
      v9 = CFSTR("Passes");
      goto LABEL_7;
    case 1:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
      v8 = v7;
      v9 = CFSTR("Entries");
      goto LABEL_7;
    case 0:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
      v8 = v7;
      v9 = CFSTR("Summary");
LABEL_7:
      objc_msgSend(v7, "setText:", v9);

      break;
  }
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  TUIStatsFeed *feed;
  void *v52;
  void *v53;
  char *v54;
  char *v55;
  void *v56;
  double v57;
  double v58;
  __CFString *v59;
  void *v60;
  void *v61;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v6));
  if (!objc_msgSend(v6, "section"))
  {
    v9 = objc_alloc_init((Class)NSMutableString);
    v21 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed creationDate](self->_feed, "creationDate"));
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("creation: %@\n"), v23);

    v24 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed initialResourcesRenderedDate](self->_feed, "initialResourcesRenderedDate"));
    v25 = (void *)v24;
    if (v24)
      v26 = (const __CFString *)v24;
    else
      v26 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("initialResourcesRenderedDate: %@\n"), v26);

    v27 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed contentUpdateDate](self->_feed, "contentUpdateDate"));
    v28 = (void *)v27;
    if (v27)
      v29 = (const __CFString *)v27;
    else
      v29 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("contentUpdate: %@\n"), v29);

    v30 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed initialContentReadyDate](self->_feed, "initialContentReadyDate"));
    v31 = (void *)v30;
    if (v30)
      v32 = (const __CFString *)v30;
    else
      v32 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("initialContentReady: %@\n"), v32);

    v33 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed initialLayoutStartDate](self->_feed, "initialLayoutStartDate"));
    v34 = (void *)v33;
    if (v33)
      v35 = (const __CFString *)v33;
    else
      v35 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("initialLayoutStartDate: %@\n"), v35);

    v36 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed allContentReadyDate](self->_feed, "allContentReadyDate"));
    v37 = (void *)v36;
    if (v36)
      v38 = (const __CFString *)v36;
    else
      v38 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("allContentReady: %@\n"), v38);

    v39 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed dynamicUpdateDate](self->_feed, "dynamicUpdateDate"));
    v40 = (void *)v39;
    if (v39)
      v41 = (const __CFString *)v39;
    else
      v41 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("dynamicUpdate: %@\n"), v41);

    v42 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed resourcesStartLoadingDate](self->_feed, "resourcesStartLoadingDate"));
    v43 = (void *)v42;
    if (v42)
      v44 = (const __CFString *)v42;
    else
      v44 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("resourcesStartLoadingDate: %@\n"), v44);

    v45 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed resourcesLoadedDate](self->_feed, "resourcesLoadedDate"));
    v46 = (void *)v45;
    if (v45)
      v47 = (const __CFString *)v45;
    else
      v47 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("resourcesLoaded: %@\n"), v47);

    v48 = objc_claimAutoreleasedReturnValue(-[TUIStatsFeed viewWillAppearDate](self->_feed, "viewWillAppearDate"));
    v49 = (void *)v48;
    if (v48)
      v50 = (const __CFString *)v48;
    else
      v50 = CFSTR("-");
    objc_msgSend(v9, "appendFormat:", CFSTR("viewWillAppear: %@\n"), v50);

    objc_msgSend(v7, "setHeader:", v9);
    objc_msgSend(v7, "setTimingProvider:", self->_feed);
    feed = self->_feed;
    v52 = v7;
    goto LABEL_37;
  }
  if (objc_msgSend(v6, "section") == (char *)&dword_0 + 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeed currentEntriesUID](self->_feed, "currentEntriesUID"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeed entries](self->_feed, "entries"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "passes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));

    objc_msgSend(v11, "elapsedTimeForPhase:", 0);
    v15 = v14 * 1000.0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "url"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
    v18 = TUIStatsReasonToString((char)objc_msgSend(v13, "reason"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.3fms - %@ - %@\n\n"), *(_QWORD *)&v15, v17, v19));
    objc_msgSend(v7, "setHeader:", v20);

    objc_msgSend(v7, "setTimingProvider:", 0);
    objc_msgSend(v7, "setEventProvider:", 0);

LABEL_38:
    goto LABEL_39;
  }
  if (objc_msgSend(v6, "section") == (char *)&dword_0 + 2)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeed passes](self->_feed, "passes"));
    v54 = (char *)objc_msgSend(v53, "count");
    v55 = &v54[~(unint64_t)objc_msgSend(v6, "row")];

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeed passes](self->_feed, "passes"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));

    objc_msgSend(v9, "elapsedTimeForPhase:", 0);
    v58 = v57 * 1000.0;
    v59 = TUIStatsReasonToString((char)objc_msgSend(v9, "reason"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.3fms - %@\n\n"), *(_QWORD *)&v58, v60));
    objc_msgSend(v7, "setHeader:", v61);

    objc_msgSend(v7, "setTimingProvider:", 0);
    v52 = v7;
    feed = 0;
LABEL_37:
    objc_msgSend(v52, "setEventProvider:", feed);
    goto LABEL_38;
  }
LABEL_39:
  objc_msgSend(v7, "updateContent");

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  if (objc_msgSend(v11, "section") == (char *)&dword_0 + 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeed currentEntriesUID](self->_feed, "currentEntriesUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v11, "row")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeed entries](self->_feed, "entries"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));
    v9 = +[TUIStatsViewControllerFactory newViewControllerWithFeedEntry:](TUIStatsViewControllerFactory, "newViewControllerWithFeedEntry:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsFeedViewController navigationController](self, "navigationController"));
    objc_msgSend(v10, "pushViewController:animated:", v9, 1);

  }
}

- (TUIStatsFeed)feed
{
  return self->_feed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feed, 0);
}

@end

@implementation SBLogoutDebugBlockingViewController

- (void)setDebugBlockingTasks:(id)a3
{
  NSDictionary **p_debugBlockingTasks;
  void *v6;
  NSArray *v7;
  NSArray *applicationKeys;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;

  p_debugBlockingTasks = &self->_debugBlockingTasks;
  v12 = (NSDictionary *)a3;
  if (*p_debugBlockingTasks != v12)
  {
    objc_storeStrong((id *)&self->_debugBlockingTasks, a3);
    -[NSDictionary allKeys](*p_debugBlockingTasks, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    applicationKeys = self->_applicationKeys;
    self->_applicationKeys = v7;

    -[SBLogoutDebugBlockingViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SBLogoutDebugBlockingViewController _tableView](self, "_tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadData");

    }
  }

}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setBackgroundColor:", 0);
  -[SBLogoutDebugBlockingViewController setView:](self, "setView:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLogoutDebugBlockingViewController;
  -[SBLogoutDebugBlockingViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[SBLogoutDebugBlockingViewController _tableView](self, "_tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_configureCell:(id)a3 withBlockingTask:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "name");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reason");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = &stru_1E8EC7EC0;
  if (v21)
    v10 = v21;
  else
    v10 = &stru_1E8EC7EC0;
  v11 = v10;
  if (v7)
    v12 = v7;
  else
    v12 = &stru_1E8EC7EC0;
  v13 = v12;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:", CFSTR(" "));
  if (v9)
    objc_msgSend(v14, "appendString:", v9);
  objc_msgSend(v6, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextAlignment:", 0);
  objc_msgSend(v15, "setText:", v14);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.75);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setColor:", v16);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 13.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v17);

  objc_msgSend(v6, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextAlignment:", 0);
  objc_msgSend(v18, "setText:", v13);
  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setColor:", v19);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 13.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v20);

  objc_msgSend(v6, "setBackgroundColor:", 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSDictionary count](self->_debugBlockingTasks, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[NSArray objectAtIndex:](self->_applicationKeys, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSDictionary objectForKey:](self->_debugBlockingTasks, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("DebugBlockingViewCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_applicationKeys, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSDictionary objectForKey:](self->_debugBlockingTasks, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (!v7)
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("DebugBlockingViewCell"));
        -[SBLogoutDebugBlockingViewController _configureCell:withBlockingTask:](self, "_configureCell:withBlockingTask:", v7, v10);
      }

    }
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[NSArray objectAtIndex:](self->_applicationKeys, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "displayName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  return 2;
}

- (NSDictionary)debugBlockingTasks
{
  return self->_debugBlockingTasks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationKeys, 0);
  objc_storeStrong((id *)&self->_debugBlockingTasks, 0);
}

@end

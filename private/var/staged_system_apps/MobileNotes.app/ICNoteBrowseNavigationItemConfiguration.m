@implementation ICNoteBrowseNavigationItemConfiguration

- (ICNoteBrowseNavigationItemConfiguration)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  ICNoteBrowseNavigationItemConfiguration *v8;
  ICNoteBrowseNavigationItemConfiguration *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteBrowseNavigationItemConfiguration;
  v8 = -[ICNoteBrowseNavigationItemConfiguration init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v9->_noteContainerViewMode = -1;
    v9->_collectionType = 0;
  }

  return v9;
}

- (UINavigationItem)navigationItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration presentingViewController](self, "presentingViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationItem"));

  return (UINavigationItem *)v3;
}

- (ICToolbarSummaryView)summaryView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteBrowseNavigationitemConfigurationNavigationToolbarSummaryView:", self));

  return (ICToolbarSummaryView *)v4;
}

- (UIBarButtonItem)actionBarButtonItem
{
  UIBarButtonItem *actionBarButtonItem;
  UIBarButtonItem *v3;
  const __CFString *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  actionBarButtonItem = self->_actionBarButtonItem;
  if (actionBarButtonItem)
  {
    v3 = actionBarButtonItem;
  }
  else
  {
    if (-[ICNoteBrowseNavigationItemConfiguration usesPlainBarButtonItems](self, "usesPlainBarButtonItems"))
      v5 = CFSTR("ellipsis");
    else
      v5 = CFSTR("ellipsis.circle");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5));
    v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:menu:", v6, 0);
    v8 = self->_actionBarButtonItem;
    self->_actionBarButtonItem = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Manage notes and views"), &stru_1005704B8, 0));
    -[UIBarButtonItem setTitle:](self->_actionBarButtonItem, "setTitle:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Folder Actions"), &stru_1005704B8, 0));
    -[UIBarButtonItem setAccessibilityLabel:](self->_actionBarButtonItem, "setAccessibilityLabel:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Double tap to show the notes list action menu"), &stru_1005704B8, 0));
    -[UIBarButtonItem setAccessibilityHint:](self->_actionBarButtonItem, "setAccessibilityHint:", v14);

    v3 = self->_actionBarButtonItem;
  }
  return v3;
}

- (UIBarButtonItem)addNoteBarButtonItem
{
  UIBarButtonItem *addNoteBarButtonItem;
  UIBarButtonItem *v3;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  addNoteBarButtonItem = self->_addNoteBarButtonItem;
  if (addNoteBarButtonItem)
  {
    v3 = addNoteBarButtonItem;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.pencil")));
    v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v5, 0, self, "addNoteAction:event:");
    v7 = self->_addNoteBarButtonItem;
    self->_addNoteBarButtonItem = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("New note"), &stru_1005704B8, 0));
    -[UIBarButtonItem setTitle:](self->_addNoteBarButtonItem, "setTitle:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("New note"), &stru_1005704B8, 0));
    -[UIBarButtonItem setAccessibilityLabel:](self->_addNoteBarButtonItem, "setAccessibilityLabel:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Double tap to compose a new note"), &stru_1005704B8, 0));
    -[UIBarButtonItem setAccessibilityHint:](self->_addNoteBarButtonItem, "setAccessibilityHint:", v13);

    v3 = self->_addNoteBarButtonItem;
  }
  return v3;
}

- (UIBarButtonItem)collaborationBarButtonItem
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteBrowseNavigationItemConfigurationCollaborationBarButtonItem:", self));

  return (UIBarButtonItem *)v4;
}

- (UIBarButtonItem)debugBarButtonItem
{
  UIBarButtonItem *debugBarButtonItem;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;

  debugBarButtonItem = self->_debugBarButtonItem;
  if (!debugBarButtonItem)
  {
    v4 = objc_alloc((Class)UIBarButtonItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gear")));
    v6 = (UIBarButtonItem *)objc_msgSend(v4, "initWithImage:style:target:action:", v5, 0, self, "debugAction:");
    v7 = self->_debugBarButtonItem;
    self->_debugBarButtonItem = v6;

    debugBarButtonItem = self->_debugBarButtonItem;
  }
  return debugBarButtonItem;
}

- (UIBarButtonItem)deleteBarButtonItem
{
  UIBarButtonItem *deleteBarButtonItem;
  unsigned __int8 v4;
  id v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;

  deleteBarButtonItem = self->_deleteBarButtonItem;
  if (!deleteBarButtonItem)
  {
    v4 = -[ICNoteBrowseNavigationItemConfiguration usesPlainBarButtonItems](self, "usesPlainBarButtonItems");
    v5 = objc_alloc((Class)UIBarButtonItem);
    v6 = v5;
    if ((v4 & 1) != 0)
    {
      v7 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("trash")));
      v8 = (UIBarButtonItem *)objc_msgSend(v6, "initWithImage:style:target:action:", v7, 0, self, "deleteAction:");
      v9 = self->_deleteBarButtonItem;
      self->_deleteBarButtonItem = v8;

    }
    else
    {
      v10 = (UIBarButtonItem *)objc_msgSend(v5, "initWithTitle:style:target:action:", 0, 0, self, "deleteAction:");
      v7 = self->_deleteBarButtonItem;
      self->_deleteBarButtonItem = v10;
    }

    deleteBarButtonItem = self->_deleteBarButtonItem;
  }
  return deleteBarButtonItem;
}

- (UIBarButtonItem)editBarButtonItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration presentingViewController](self, "presentingViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editButtonItem"));

  return (UIBarButtonItem *)v3;
}

- (UIBarButtonItem)lockBarButtonItem
{
  UIBarButtonItem *lockBarButtonItem;
  UIBarButtonItem *v3;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  lockBarButtonItem = self->_lockBarButtonItem;
  if (lockBarButtonItem)
  {
    v3 = lockBarButtonItem;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("lock.open")));
    v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v5, 0, self, "lockAction:");
    v7 = self->_lockBarButtonItem;
    self->_lockBarButtonItem = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Lock notes"), &stru_1005704B8, 0));
    -[UIBarButtonItem setAccessibilityLabel:](self->_lockBarButtonItem, "setAccessibilityLabel:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Double tap to lock notes"), &stru_1005704B8, 0));
    -[UIBarButtonItem setAccessibilityHint:](self->_lockBarButtonItem, "setAccessibilityHint:", v11);

    v3 = self->_lockBarButtonItem;
  }
  return v3;
}

- (UIBarButtonItem)moveBarButtonItem
{
  UIBarButtonItem *moveBarButtonItem;
  unsigned __int8 v4;
  id v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;

  moveBarButtonItem = self->_moveBarButtonItem;
  if (!moveBarButtonItem)
  {
    v4 = -[ICNoteBrowseNavigationItemConfiguration usesPlainBarButtonItems](self, "usesPlainBarButtonItems");
    v5 = objc_alloc((Class)UIBarButtonItem);
    v6 = v5;
    if ((v4 & 1) != 0)
    {
      v7 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("folder")));
      v8 = (UIBarButtonItem *)objc_msgSend(v6, "initWithImage:style:target:action:", v7, 0, self, "moveAction:");
      v9 = self->_moveBarButtonItem;
      self->_moveBarButtonItem = v8;

    }
    else
    {
      v10 = (UIBarButtonItem *)objc_msgSend(v5, "initWithTitle:style:target:action:", 0, 0, self, "moveAction:");
      v7 = self->_moveBarButtonItem;
      self->_moveBarButtonItem = v10;
    }

    moveBarButtonItem = self->_moveBarButtonItem;
  }
  return moveBarButtonItem;
}

- (UIBarButtonItem)shareBarButtonItem
{
  UIBarButtonItem *shareBarButtonItem;
  UIBarButtonItem *v3;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  shareBarButtonItem = self->_shareBarButtonItem;
  if (shareBarButtonItem)
  {
    v3 = shareBarButtonItem;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
    v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v5, 0, self, "shareAction:");
    v7 = self->_shareBarButtonItem;
    self->_shareBarButtonItem = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_1005704B8, 0));
    -[UIBarButtonItem setAccessibilityLabel:](self->_shareBarButtonItem, "setAccessibilityLabel:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Double tap to show folder sharing options"), &stru_1005704B8, 0));
    -[UIBarButtonItem setAccessibilityHint:](self->_shareBarButtonItem, "setAccessibilityHint:", v11);

    v3 = self->_shareBarButtonItem;
  }
  return v3;
}

- (UIBarButtonItem)summaryBarButtonItem
{
  void *v3;
  id v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *summaryBarButtonItem;

  if (self->_summaryBarButtonItem)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration summaryView](self, "summaryView"));
    -[UIBarButtonItem setCustomView:](self->_summaryBarButtonItem, "setCustomView:", v3);
  }
  else
  {
    v4 = objc_alloc((Class)UIBarButtonItem);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration summaryView](self, "summaryView"));
    v5 = (UIBarButtonItem *)objc_msgSend(v4, "initWithCustomView:", v3);
    summaryBarButtonItem = self->_summaryBarButtonItem;
    self->_summaryBarButtonItem = v5;

  }
  return self->_summaryBarButtonItem;
}

- (UIBarButtonItem)tagsBarButtonItem
{
  UIBarButtonItem *tagsBarButtonItem;
  unsigned __int8 v4;
  id v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;

  tagsBarButtonItem = self->_tagsBarButtonItem;
  if (!tagsBarButtonItem)
  {
    v4 = -[ICNoteBrowseNavigationItemConfiguration usesPlainBarButtonItems](self, "usesPlainBarButtonItems");
    v5 = objc_alloc((Class)UIBarButtonItem);
    if ((v4 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("number")));
      v7 = (UIBarButtonItem *)objc_msgSend(v5, "initWithImage:style:target:action:", v6, 0, self, "tagsAction:");
      v8 = self->_tagsBarButtonItem;
      self->_tagsBarButtonItem = v7;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Tags"), &stru_1005704B8, 0));
      v9 = (UIBarButtonItem *)objc_msgSend(v5, "initWithTitle:style:target:action:", v8, 0, self, "tagsAction:");
      v10 = self->_tagsBarButtonItem;
      self->_tagsBarButtonItem = v9;

    }
    tagsBarButtonItem = self->_tagsBarButtonItem;
  }
  return tagsBarButtonItem;
}

- (void)reset
{
  UIBarButtonItem *addNoteBarButtonItem;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteBrowseNavigationItemConfiguration;
  -[ICNoteBrowseNavigationItemConfiguration reset](&v4, "reset");
  addNoteBarButtonItem = self->_addNoteBarButtonItem;
  self->_addNoteBarButtonItem = 0;

}

- (BOOL)updateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v7;

  v3 = a3;
  v5 = -[ICNoteBrowseNavigationItemConfiguration needsUpdate](self, "needsUpdate");
  if (v5)
  {
    -[ICNoteBrowseNavigationItemConfiguration updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", v3);
    -[ICNoteBrowseNavigationItemConfiguration updateToolbarAnimated:](self, "updateToolbarAnimated:", v3);
    -[ICNoteBrowseNavigationItemConfiguration updateTitles](self, "updateTitles");
    -[ICNoteBrowseNavigationItemConfiguration updateMenus](self, "updateMenus");
    -[ICNoteBrowseNavigationItemConfiguration updateEnabled](self, "updateEnabled");
    v7.receiver = self;
    v7.super_class = (Class)ICNoteBrowseNavigationItemConfiguration;
    LOBYTE(v5) = -[ICNoteBrowseNavigationItemConfiguration updateAnimated:](&v7, "updateAnimated:", v3);
  }
  return v5;
}

- (BOOL)isEditing
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration presentingViewController](self, "presentingViewController"));
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (NSString)navigationTitle
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteBrowseNavigationItemConfigurationNavigationTitle:", self));

  return (NSString *)v4;
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int64_t v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchController"));
  if (objc_msgSend(v6, "isActive"))
  {
    v7 = -[ICNoteBrowseNavigationItemConfiguration noteContainerViewMode](self, "noteContainerViewMode");

    if (v7 == 1)
    {
      v30 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
      objc_msgSend(v30, "setRightBarButtonItems:animated:", &__NSArray0__struct, v3);

      return;
    }
  }
  else
  {

  }
  v8 = -[ICNoteBrowseNavigationItemConfiguration isEditing](self, "isEditing");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setHidesBackButton:animated:", 1, v3);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration editBarButtonItem](self, "editBarButtonItem"));
    v32 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    objc_msgSend(v11, "setRightBarButtonItems:animated:", v13, v3);

    return;
  }
  objc_msgSend(v9, "setHidesBackButton:animated:", 0, v3);

  v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = -[ICNoteBrowseNavigationItemConfiguration collectionType](self, "collectionType");
  if (v14 - 3 >= 2)
  {
    if (v14 == 2)
    {
      v18 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration editBarButtonItem](self, "editBarButtonItem"));
    }
    else
    {
      if (v14 != 1)
        goto LABEL_29;
      v15 = -[ICNoteBrowseNavigationItemConfiguration isTrashFolder](self, "isTrashFolder")
          ? objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration editBarButtonItem](self, "editBarButtonItem"))
          : objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration actionBarButtonItem](self, "actionBarButtonItem"));
      v19 = (void *)v15;
      objc_msgSend(v31, "ic_addNonNilObject:", v15);

      if (!-[ICNoteBrowseNavigationItemConfiguration isCompactWidth](self, "isCompactWidth"))
      {
        if ((id)-[ICNoteBrowseNavigationItemConfiguration noteContainerViewMode](self, "noteContainerViewMode") == (id)1
          && !-[ICNoteBrowseNavigationItemConfiguration isCompactHeight](self, "isCompactHeight"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration addNoteBarButtonItem](self, "addNoteBarButtonItem"));
          objc_msgSend(v31, "ic_insertNonNilObject:atIndex:", v20, 0);

          if (-[ICNoteBrowseNavigationItemConfiguration isAuthenticated](self, "isAuthenticated"))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem"));
            objc_msgSend(v31, "ic_addNonNilObject:", v21);

          }
        }
        if ((id)-[ICNoteBrowseNavigationItemConfiguration noteContainerViewMode](self, "noteContainerViewMode") != (id)1)
          goto LABEL_29;
      }
      if (-[ICNoteBrowseNavigationItemConfiguration canBeShared](self, "canBeShared"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration shareBarButtonItem](self, "shareBarButtonItem"));
        objc_msgSend(v31, "ic_addNonNilObject:", v22);

      }
      if (!-[ICNoteBrowseNavigationItemConfiguration isShared](self, "isShared"))
        goto LABEL_29;
      v18 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration collaborationBarButtonItem](self, "collaborationBarButtonItem"));
    }
    v17 = (void *)v18;
    objc_msgSend(v31, "ic_addNonNilObject:", v18);
    goto LABEL_28;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration actionBarButtonItem](self, "actionBarButtonItem"));
  objc_msgSend(v31, "addObject:", v16);

  if ((id)-[ICNoteBrowseNavigationItemConfiguration noteContainerViewMode](self, "noteContainerViewMode") == (id)1
    && !-[ICNoteBrowseNavigationItemConfiguration isCompactWidth](self, "isCompactWidth"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration addNoteBarButtonItem](self, "addNoteBarButtonItem"));
    objc_msgSend(v31, "insertObject:atIndex:", v17, 0);
LABEL_28:

  }
LABEL_29:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
  objc_msgSend(v23, "_setSupportsTwoLineLargeTitles:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
  v25 = objc_msgSend(v31, "copy");
  objc_msgSend(v24, "setRightBarButtonItems:animated:", v25, v3);

  LODWORD(v25) = -[ICNoteBrowseNavigationItemConfiguration showsDebugItem](self, "showsDebugItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
  v27 = v26;
  if ((_DWORD)v25)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration debugBarButtonItem](self, "debugBarButtonItem"));
    objc_msgSend(v27, "setLeftBarButtonItem:animated:", v28, v3);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
    v27 = v26;
    v29 = 1;
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(v26, "setLeftItemsSupplementBackButton:", v29);

}

- (void)updateEnabled
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v3 = -[ICNoteBrowseNavigationItemConfiguration canAddNote](self, "canAddNote");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration addNoteBarButtonItem](self, "addNoteBarButtonItem"));
  objc_msgSend(v4, "setEnabled:", v3);

  v5 = -[ICNoteBrowseNavigationItemConfiguration canDeleteNotes](self, "canDeleteNotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration deleteBarButtonItem](self, "deleteBarButtonItem"));
  objc_msgSend(v6, "setEnabled:", v5);

  v7 = -[ICNoteBrowseNavigationItemConfiguration canMoveNotes](self, "canMoveNotes");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration moveBarButtonItem](self, "moveBarButtonItem"));
  objc_msgSend(v8, "setEnabled:", v7);

  switch(-[ICNoteBrowseNavigationItemConfiguration collectionType](self, "collectionType"))
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
      goto LABEL_2;
    case 1uLL:
      if (-[ICNoteBrowseNavigationItemConfiguration isTrashFolder](self, "isTrashFolder"))
        v9 = 1;
      else
LABEL_2:
        v9 = -[ICNoteBrowseNavigationItemConfiguration isEditing](self, "isEditing");
      goto LABEL_6;
    case 2uLL:
      v9 = -[ICNoteBrowseNavigationItemConfiguration noteCount](self, "noteCount") != 0;
LABEL_6:
      v10 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration editBarButtonItem](self, "editBarButtonItem"));
      objc_msgSend(v10, "setEnabled:", v9);

      break;
    default:
      return;
  }
}

- (void)updateMenus
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  switch(-[ICNoteBrowseNavigationItemConfiguration collectionType](self, "collectionType"))
  {
    case 0uLL:
    case 2uLL:
      v7 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration actionBarButtonItem](self, "actionBarButtonItem"));
      objc_msgSend(v7, "setMenu:", 0);
      goto LABEL_7;
    case 1uLL:
      v7 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration dataSource](self, "dataSource"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration actionBarButtonItem](self, "actionBarButtonItem"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noteBrowseNavigationItemConfigurationNoteContainerActionMenu:actionBarButtonItem:", self, v3));
      goto LABEL_6;
    case 3uLL:
      v7 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration dataSource](self, "dataSource"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration actionBarButtonItem](self, "actionBarButtonItem"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noteBrowseNavigationItemConfigurationQueryActionMenu:actionBarButtonItem:", self, v3));
      goto LABEL_6;
    case 4uLL:
      v7 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration dataSource](self, "dataSource"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration actionBarButtonItem](self, "actionBarButtonItem"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noteBrowseNavigationItemConfigurationVirtualSmartFolderActionMenu:actionBarButtonItem:", self, v3));
LABEL_6:
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration actionBarButtonItem](self, "actionBarButtonItem"));
      objc_msgSend(v6, "setMenu:", v5);

LABEL_7:
      break;
    default:
      return;
  }
}

- (void)updateTitles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationTitle](self, "navigationTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setTitle:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationTitle](self, "navigationTitle"));
  if (objc_msgSend(v5, "length"))
    v6 = 1;
  else
    v6 = 2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setLargeTitleDisplayMode:", v6);

  v8 = -[ICNoteBrowseNavigationItemConfiguration selectedNoteCount](self, "selectedNoteCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v9;
  if (v8)
    v11 = CFSTR("Move");
  else
    v11 = CFSTR("Move All");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1005704B8, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration moveBarButtonItem](self, "moveBarButtonItem"));
  objc_msgSend(v13, "setTitle:", v12);

  v14 = -[ICNoteBrowseNavigationItemConfiguration selectedNoteCount](self, "selectedNoteCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = v15;
  if (v14)
    v16 = CFSTR("Delete");
  else
    v16 = CFSTR("Delete All");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_1005704B8, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration deleteBarButtonItem](self, "deleteBarButtonItem"));
  objc_msgSend(v18, "setTitle:", v17);

}

- (void)updateToolbarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[3];
  _QWORD v28[5];

  v3 = a3;
  v5 = -[ICNoteBrowseNavigationItemConfiguration isCompactWidth](self, "isCompactWidth");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem flexibleSpaceItem](UIBarButtonItem, "flexibleSpaceItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration presentingViewController](self, "presentingViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));

  if (-[ICNoteBrowseNavigationItemConfiguration isEditing](self, "isEditing"))
  {
    v9 = -[ICNoteBrowseNavigationItemConfiguration canAssignTags](self, "canAssignTags");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration presentingViewController](self, "presentingViewController"));
    v11 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration moveBarButtonItem](self, "moveBarButtonItem"));
    v12 = (void *)v11;
    if (v9)
    {
      v28[0] = v11;
      v28[1] = v6;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration tagsBarButtonItem](self, "tagsBarButtonItem"));
      v28[2] = v13;
      v28[3] = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration deleteBarButtonItem](self, "deleteBarButtonItem"));
      v28[4] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 5));
      objc_msgSend(v10, "setToolbarItems:animated:", v15, v3);

    }
    else
    {
      v27[0] = v11;
      v27[1] = v6;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration deleteBarButtonItem](self, "deleteBarButtonItem"));
      v27[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 3));
      objc_msgSend(v10, "setToolbarItems:animated:", v14, v3);
    }

    objc_msgSend(v8, "setToolbarHidden:animated:", 0, v3);
  }
  else
  {
    if ((id)-[ICNoteBrowseNavigationItemConfiguration noteContainerViewMode](self, "noteContainerViewMode") == (id)1
      || -[ICNoteBrowseNavigationItemConfiguration isShowingEmptyState](self, "isShowingEmptyState"))
    {
      v16 = !-[ICNoteBrowseNavigationItemConfiguration isCompactHeight](self, "isCompactHeight");
    }
    else
    {
      v16 = 0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationItem](self, "navigationItem"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "searchController"));
    if ((objc_msgSend(v18, "isActive") & 1) != 0)
      v19 = 1;
    else
      v19 = v16 & ~v5;

    objc_msgSend(v8, "setToolbarHidden:animated:", v19, v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem flexibleSpaceItem](UIBarButtonItem, "flexibleSpaceItem"));
    objc_msgSend(v20, "addObject:", v21);

    if ((v19 & 1) == 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration summaryBarButtonItem](self, "summaryBarButtonItem"));
      objc_msgSend(v20, "ic_addNonNilObject:", v22);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem flexibleSpaceItem](UIBarButtonItem, "flexibleSpaceItem"));
    objc_msgSend(v20, "addObject:", v23);

    if ((v5 & 1) != 0
      || (id)-[ICNoteBrowseNavigationItemConfiguration noteContainerViewMode](self, "noteContainerViewMode") == (id)1
      && -[ICNoteBrowseNavigationItemConfiguration isCompactHeight](self, "isCompactHeight"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration addNoteBarButtonItem](self, "addNoteBarButtonItem"));
      objc_msgSend(v20, "addObject:", v24);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration presentingViewController](self, "presentingViewController"));
    v26 = objc_msgSend(v20, "copy");
    objc_msgSend(v25, "setToolbarItems:animated:", v26, v3);

  }
}

- (void)addNoteAction:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration delegate](self, "delegate"));
  objc_msgSend(v8, "noteBrowseNavigationItemConfiguration:shouldAddNoteFromBarButtonItem:event:", self, v7, v6);

}

- (void)debugAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration delegate](self, "delegate"));
  objc_msgSend(v5, "noteBrowseNavigationItemConfiguration:shouldShowDebugViewControllerFromBarButtonItem:", self, v4);

}

- (void)deleteAction:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[ICNoteBrowseNavigationItemConfiguration selectedNoteCount](self, "selectedNoteCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration delegate](self, "delegate"));
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "noteBrowseNavigationItemConfiguration:shouldDeleteSelectedFromBarButtonItem:", self, v4);
  else
    objc_msgSend(v6, "noteBrowseNavigationItemConfiguration:shouldDeleteAllFromBarButtonItem:", self, v4);

}

- (void)lockAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration delegate](self, "delegate"));
  objc_msgSend(v5, "noteBrowseNavigationItemConfiguration:shouldLockFromBarButtonItem:", self, v4);

}

- (void)moveAction:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[ICNoteBrowseNavigationItemConfiguration selectedNoteCount](self, "selectedNoteCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration delegate](self, "delegate"));
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "noteBrowseNavigationItemConfiguration:shouldMoveSelectedFromBarButtonItem:", self, v4);
  else
    objc_msgSend(v6, "noteBrowseNavigationItemConfiguration:shouldMoveAllFromBarButtonItem:", self, v4);

}

- (void)shareAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration delegate](self, "delegate"));
  objc_msgSend(v5, "noteBrowseNavigationItemConfiguration:shouldShareFromBarButtonItem:", self, v4);

}

- (void)tagsAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration delegate](self, "delegate"));
  objc_msgSend(v5, "noteBrowseNavigationItemConfiguration:shouldAssignTagsFromBarButtonItem:", self, v4);

}

- (UIViewController)presentingViewController
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteBrowseNavigationItemConfigurationPresentingViewController:", self));

  return (UIViewController *)v4;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[17];

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration canAddNote](self, "canAddNote")));
  v35[0] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration canAssignTags](self, "canAssignTags")));
  v35[1] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration canDeleteNotes](self, "canDeleteNotes")));
  v35[2] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration canMoveNotes](self, "canMoveNotes")));
  v35[3] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration canBeShared](self, "canBeShared")));
  v35[4] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[ICNoteBrowseNavigationItemConfiguration collectionType](self, "collectionType")));
  v35[5] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration isAuthenticated](self, "isAuthenticated")));
  v35[6] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration isCompactWidth](self, "isCompactWidth")));
  v35[7] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration isCompactHeight](self, "isCompactHeight")));
  v35[8] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration isEditing](self, "isEditing")));
  v35[9] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration isShowingEmptyState](self, "isShowingEmptyState")));
  v35[10] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration isShared](self, "isShared")));
  v35[11] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration isTrashFolder](self, "isTrashFolder")));
  v35[12] = v22;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[ICNoteBrowseNavigationItemConfiguration noteContainerViewMode](self, "noteContainerViewMode")));
  v35[13] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[ICNoteBrowseNavigationItemConfiguration noteCount](self, "noteCount")));
  v35[14] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[ICNoteBrowseNavigationItemConfiguration selectedNoteCount](self, "selectedNoteCount")));
  v35[15] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICNoteBrowseNavigationItemConfiguration usesPlainBarButtonItems](self, "usesPlainBarButtonItems")));
  v35[16] = v6;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 17));
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v9 = 0;
    v10 = 31;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
      if (((unint64_t)objc_msgSend(v11, "integerValue") & 0x8000000000000000) != 0)
        break;
      v9 += v10 + v10 * (_QWORD)objc_msgSend(v11, "unsignedIntegerValue");

      ++v8;
      v10 += 31;
      if (v8 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_8;
    }

  }
  v9 = 0;
LABEL_8:

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseNavigationItemConfiguration navigationTitle](self, "navigationTitle"));
  v20 = sub_10005B8CC(v9, v13, v14, v15, v16, v17, v18, v19, (char)v12);

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  ICNoteBrowseNavigationItemConfiguration *v4;
  ICNoteBrowseNavigationItemConfiguration *v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  v4 = (ICNoteBrowseNavigationItemConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = -[ICNoteBrowseNavigationItemConfiguration hash](self, "hash");
    v8 = v7 == (id)-[ICNoteBrowseNavigationItemConfiguration hash](v5, "hash");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (ICNoteBrowseNavigationItemConfigurationDataSource)dataSource
{
  return (ICNoteBrowseNavigationItemConfigurationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (ICNoteBrowseNavigationItemConfigurationDelegate)delegate
{
  return (ICNoteBrowseNavigationItemConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setActionBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_actionBarButtonItem, a3);
}

- (void)setAddNoteBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_addNoteBarButtonItem, a3);
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

- (BOOL)canAddNote
{
  return self->_canAddNote;
}

- (void)setCanAddNote:(BOOL)a3
{
  self->_canAddNote = a3;
}

- (BOOL)canDeleteNotes
{
  return self->_canDeleteNotes;
}

- (void)setCanDeleteNotes:(BOOL)a3
{
  self->_canDeleteNotes = a3;
}

- (BOOL)canMoveNotes
{
  return self->_canMoveNotes;
}

- (void)setCanMoveNotes:(BOOL)a3
{
  self->_canMoveNotes = a3;
}

- (BOOL)canAssignTags
{
  return self->_canAssignTags;
}

- (void)setCanAssignTags:(BOOL)a3
{
  self->_canAssignTags = a3;
}

- (BOOL)isCompactWidth
{
  return self->_compactWidth;
}

- (void)setCompactWidth:(BOOL)a3
{
  self->_compactWidth = a3;
}

- (BOOL)isCompactHeight
{
  return self->_compactHeight;
}

- (void)setCompactHeight:(BOOL)a3
{
  self->_compactHeight = a3;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (BOOL)showsDebugItem
{
  return self->_showsDebugItem;
}

- (void)setShowsDebugItem:(BOOL)a3
{
  self->_showsDebugItem = a3;
}

- (void)setDeleteBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteBarButtonItem, a3);
}

- (void)setLockBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_lockBarButtonItem, a3);
}

- (void)setMoveBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_moveBarButtonItem, a3);
}

- (void)setShareBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareBarButtonItem, a3);
}

- (void)setSummaryBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_summaryBarButtonItem, a3);
}

- (void)setTagsBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_tagsBarButtonItem, a3);
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  self->_noteContainerViewMode = a3;
}

- (unint64_t)noteCount
{
  return self->_noteCount;
}

- (void)setNoteCount:(unint64_t)a3
{
  self->_noteCount = a3;
}

- (unint64_t)selectedNoteCount
{
  return self->_selectedNoteCount;
}

- (void)setSelectedNoteCount:(unint64_t)a3
{
  self->_selectedNoteCount = a3;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(BOOL)a3
{
  self->_canBeShared = a3;
}

- (BOOL)isShared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (UIBarButtonItem)sharedBarButtonItem
{
  return self->_sharedBarButtonItem;
}

- (BOOL)isTrashFolder
{
  return self->_trashFolder;
}

- (void)setTrashFolder:(BOOL)a3
{
  self->_trashFolder = a3;
}

- (BOOL)usesPlainBarButtonItems
{
  return self->_usesPlainBarButtonItems;
}

- (void)setUsesPlainBarButtonItems:(BOOL)a3
{
  self->_usesPlainBarButtonItems = a3;
}

- (BOOL)isShowingEmptyState
{
  return self->_showingEmptyState;
}

- (void)setShowingEmptyState:(BOOL)a3
{
  self->_showingEmptyState = a3;
}

- (void)setDebugBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_debugBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sharedBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tagsBarButtonItem, 0);
  objc_storeStrong((id *)&self->_summaryBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_moveBarButtonItem, 0);
  objc_storeStrong((id *)&self->_lockBarButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addNoteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_actionBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end

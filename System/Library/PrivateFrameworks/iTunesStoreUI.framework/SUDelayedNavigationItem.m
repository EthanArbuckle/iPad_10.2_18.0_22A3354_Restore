@implementation SUDelayedNavigationItem

- (SUDelayedNavigationItem)initWithNavigationItem:(id)a3
{
  id v5;
  SUDelayedNavigationItem *v6;
  SUDelayedNavigationItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUDelayedNavigationItem;
  v6 = -[SUDelayedNavigationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedNavigationItem, a3);

  return v7;
}

- (void)dealloc
{
  id delayedBackButtonTitle;
  id delayedLeftBarButtonItems;
  NSNumber *delayedLeftItemsSupplementBackButton;
  id delayedRightBarButtonItems;
  id delayedTitle;
  id delayedTitleView;
  SUNavigationItem *wrappedNavigationItem;
  objc_super v10;

  delayedBackButtonTitle = self->_delayedBackButtonTitle;
  self->_delayedBackButtonTitle = 0;

  delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
  self->_delayedLeftBarButtonItems = 0;

  delayedLeftItemsSupplementBackButton = self->_delayedLeftItemsSupplementBackButton;
  self->_delayedLeftItemsSupplementBackButton = 0;

  delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
  self->_delayedRightBarButtonItems = 0;

  delayedTitle = self->_delayedTitle;
  self->_delayedTitle = 0;

  delayedTitleView = self->_delayedTitleView;
  self->_delayedTitleView = 0;

  wrappedNavigationItem = self->_wrappedNavigationItem;
  self->_wrappedNavigationItem = 0;

  v10.receiver = self;
  v10.super_class = (Class)SUDelayedNavigationItem;
  -[SUDelayedNavigationItem dealloc](&v10, sel_dealloc);
}

- (void)commitDelayedChanges
{
  void *v3;
  id delayedBackButtonTitle;
  id v5;
  id v6;
  id v7;
  NSNumber *delayedLeftItemsSupplementBackButton;
  NSNumber *v9;
  id delayedLeftBarButtonItems;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id delayedRightBarButtonItems;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id delayedTitle;
  id v30;
  id v31;
  id v32;
  id delayedTitleView;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", self->_wrappedNavigationItem);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", self->_delayedBackButtonHidden);
  delayedBackButtonTitle = self->_delayedBackButtonTitle;
  if (delayedBackButtonTitle)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedBackButtonTitle == v5)
      v6 = 0;
    else
      v6 = self->_delayedBackButtonTitle;
    objc_msgSend(v3, "setBackButtonTitle:", v6);
    v7 = self->_delayedBackButtonTitle;
    self->_delayedBackButtonTitle = 0;

  }
  delayedLeftItemsSupplementBackButton = self->_delayedLeftItemsSupplementBackButton;
  if (delayedLeftItemsSupplementBackButton)
  {
    objc_msgSend(v3, "setLeftItemsSupplementBackButton:", -[NSNumber BOOLValue](delayedLeftItemsSupplementBackButton, "BOOLValue"));
    v9 = self->_delayedLeftItemsSupplementBackButton;
    self->_delayedLeftItemsSupplementBackButton = 0;

  }
  delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
  if (delayedLeftBarButtonItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedLeftBarButtonItems == v11)
    {
      v18 = v3;
      v17 = 0;
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v12 = self->_delayedLeftBarButtonItems;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v43;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v43 != v15)
              objc_enumerationMutation(v12);
            -[SUDelayedNavigationItem _prepareButtonItemForDisplay:](self, "_prepareButtonItemForDisplay:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v16++));
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v14);
      }

      v17 = self->_delayedLeftBarButtonItems;
      v18 = v3;
    }
    objc_msgSend(v18, "setLeftBarButtonItems:", v17);
    v19 = self->_delayedLeftBarButtonItems;
    self->_delayedLeftBarButtonItems = 0;

  }
  delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
  if (delayedRightBarButtonItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedRightBarButtonItems == v21)
    {
      v27 = 0;
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v22 = self->_delayedRightBarButtonItems;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v39;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v39 != v25)
              objc_enumerationMutation(v22);
            -[SUDelayedNavigationItem _prepareButtonItemForDisplay:](self, "_prepareButtonItemForDisplay:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v26++), (_QWORD)v38);
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v24);
      }

      v27 = self->_delayedRightBarButtonItems;
    }
    objc_msgSend(v3, "setRightBarButtonItems:", v27, (_QWORD)v38);
    v28 = self->_delayedRightBarButtonItems;
    self->_delayedRightBarButtonItems = 0;

  }
  delayedTitle = self->_delayedTitle;
  if (delayedTitle)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (delayedTitle == v30)
      v31 = 0;
    else
      v31 = self->_delayedTitle;
    objc_msgSend(v3, "setTitle:", v31);

    v32 = self->_delayedTitle;
    self->_delayedTitle = 0;

  }
  delayedTitleView = self->_delayedTitleView;
  if (delayedTitleView)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (delayedTitleView == v34)
      v35 = 0;
    else
      v35 = self->_delayedTitleView;
    v36 = v35;

    if (objc_msgSend(v36, "conformsToProtocol:", &unk_2551D9640))
      objc_msgSend(v36, "setDeferringInterfaceUpdates:", 0);
    objc_msgSend(v3, "setTitleView:", v36);
    v37 = self->_delayedTitleView;
    self->_delayedTitleView = 0;

  }
}

- (id)backButtonTitle
{
  id delayedBackButtonTitle;
  id v4;
  SUNavigationItem *wrappedNavigationItem;
  void *v7;
  objc_super v8;

  delayedBackButtonTitle = self->_delayedBackButtonTitle;
  if (delayedBackButtonTitle)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedBackButtonTitle == v4)
      return 0;
    else
      return self->_delayedBackButtonTitle;
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      -[SUNavigationItem backButtonTitle](wrappedNavigationItem, "backButtonTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      -[SUDelayedNavigationItem backButtonTitle](&v8, sel_backButtonTitle);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v7;
  }
}

- (id)leftBarButtonItem
{
  id delayedLeftBarButtonItems;
  id v4;
  void *v5;
  SUNavigationItem *wrappedNavigationItem;
  objc_super v8;

  delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
  if (delayedLeftBarButtonItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedLeftBarButtonItems == v4)
      return 0;
    v5 = (void *)objc_msgSend(self->_delayedLeftBarButtonItems, "count");
    if (v5)
    {
      objc_msgSend(self->_delayedLeftBarButtonItems, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      -[SUNavigationItem leftBarButtonItem](wrappedNavigationItem, "leftBarButtonItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      -[SUDelayedNavigationItem leftBarButtonItem](&v8, sel_leftBarButtonItem);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (id)leftBarButtonItems
{
  id delayedLeftBarButtonItems;
  id v4;
  SUNavigationItem *wrappedNavigationItem;
  void *v7;
  objc_super v8;

  delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
  if (delayedLeftBarButtonItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedLeftBarButtonItems == v4)
      return 0;
    else
      return (id)objc_msgSend(self->_delayedLeftBarButtonItems, "copy");
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      -[SUNavigationItem leftBarButtonItems](wrappedNavigationItem, "leftBarButtonItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      -[SUDelayedNavigationItem leftBarButtonItems](&v8, sel_leftBarButtonItems);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v7;
  }
}

- (BOOL)leftItemsSupplementBackButton
{
  objc_super v3;

  if (self->_delayedLeftItemsSupplementBackButton)
    return -[NSNumber BOOLValue](self->_delayedLeftItemsSupplementBackButton, "BOOLValue");
  if (self->_wrappedNavigationItem)
    return -[SUNavigationItem leftItemsSupplementBackButton](self->_wrappedNavigationItem, "leftItemsSupplementBackButton");
  v3.receiver = self;
  v3.super_class = (Class)SUDelayedNavigationItem;
  return -[SUDelayedNavigationItem leftItemsSupplementBackButton](&v3, sel_leftItemsSupplementBackButton);
}

- (id)navigationBar
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUDelayedNavigationItem;
  -[SUDelayedNavigationItem navigationBar](&v8, sel_navigationBar);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SUNavigationItem navigationBar](self->_wrappedNavigationItem, "navigationBar");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)rightBarButtonItem
{
  id delayedRightBarButtonItems;
  id v4;
  void *v5;
  SUNavigationItem *wrappedNavigationItem;
  objc_super v8;

  delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
  if (delayedRightBarButtonItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedRightBarButtonItems == v4)
      return 0;
    v5 = (void *)objc_msgSend(self->_delayedRightBarButtonItems, "count");
    if (v5)
    {
      objc_msgSend(self->_delayedRightBarButtonItems, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      -[SUNavigationItem rightBarButtonItem](wrappedNavigationItem, "rightBarButtonItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      -[SUDelayedNavigationItem rightBarButtonItem](&v8, sel_rightBarButtonItem);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (id)rightBarButtonItems
{
  id delayedRightBarButtonItems;
  id v4;
  SUNavigationItem *wrappedNavigationItem;
  void *v7;
  objc_super v8;

  delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
  if (delayedRightBarButtonItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedRightBarButtonItems == v4)
      return 0;
    else
      return (id)objc_msgSend(self->_delayedRightBarButtonItems, "copy");
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      -[SUNavigationItem rightBarButtonItems](wrappedNavigationItem, "rightBarButtonItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      -[SUDelayedNavigationItem rightBarButtonItems](&v8, sel_rightBarButtonItems);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v7;
  }
}

- (void)setBackButtonTitle:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id delayedBackButtonTitle;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  if (!-[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges"))
  {
    -[SUNavigationItem setBackButtonTitle:](self->_wrappedNavigationItem, "setBackButtonTitle:", v10);
    delayedBackButtonTitle = self->_delayedBackButtonTitle;
    self->_delayedBackButtonTitle = 0;

LABEL_8:
    v4 = v10;
    goto LABEL_9;
  }
  v4 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_delayedBackButtonTitle;
    self->_delayedBackButtonTitle = v8;

    goto LABEL_7;
  }
  if (self->_delayedBackButtonTitle != v10)
  {
    v5 = (void *)objc_msgSend(v10, "copy");
    v6 = self->_delayedBackButtonTitle;
    self->_delayedBackButtonTitle = v5;

LABEL_7:
    -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
    goto LABEL_8;
  }
LABEL_9:

}

- (void)setHidesBackButton:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges"))
  {
    if (self->_delayedBackButtonHidden != v3)
    {
      self->_delayedBackButtonHidden = v3;
      -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
    }
  }
  else
  {
    -[SUNavigationItem setHidesBackButton:](self->_wrappedNavigationItem, "setHidesBackButton:", v3);
  }
}

- (void)setLeftBarButtonItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id delayedLeftBarButtonItems;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v4 = a4;
  v13 = a3;
  if (-[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges"))
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
        self->_delayedLeftBarButtonItems = v6;

      }
      v8 = objc_msgSend(self->_delayedLeftBarButtonItems, "count");
      v9 = self->_delayedLeftBarButtonItems;
      if (v8)
        objc_msgSend(v9, "replaceObjectAtIndex:withObject:", 0, v13);
      else
        objc_msgSend(v9, "addObject:", v13);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(self->_delayedLeftBarButtonItems, "count"))
          objc_msgSend(self->_delayedLeftBarButtonItems, "removeObjectAtIndex:", 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self->_delayedLeftBarButtonItems;
        self->_delayedLeftBarButtonItems = v11;

      }
    }
    -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
  }
  else
  {
    -[SUNavigationItem setLeftBarButtonItem:animated:](self->_wrappedNavigationItem, "setLeftBarButtonItem:animated:", v13, v4);
    v10 = self->_delayedLeftBarButtonItems;
    self->_delayedLeftBarButtonItems = 0;

  }
}

- (void)setLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  BOOL v6;
  SUNavigationItem *wrappedNavigationItem;
  id v8;
  void *v9;
  id delayedLeftBarButtonItems;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = -[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges");
  wrappedNavigationItem = self->_wrappedNavigationItem;
  if (v6)
  {
    -[SUNavigationItem leftBarButtonItems](wrappedNavigationItem, "leftBarButtonItems");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 != v12 && (objc_msgSend(v8, "isEqualToArray:", v12) & 1) == 0)
    {
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
        self->_delayedLeftBarButtonItems = v11;
        goto LABEL_10;
      }
      if (self->_delayedLeftBarButtonItems != v12)
      {
        v9 = (void *)objc_msgSend(v12, "mutableCopy");
        delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
        self->_delayedLeftBarButtonItems = v9;
LABEL_10:

        -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
      }
    }
  }
  else
  {
    -[SUNavigationItem setLeftBarButtonItems:animated:](wrappedNavigationItem, "setLeftBarButtonItems:animated:", v12, v4);
    v8 = self->_delayedLeftBarButtonItems;
    self->_delayedLeftBarButtonItems = 0;
  }

}

- (void)setLeftItemsSupplementBackButton:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *v5;
  NSNumber *delayedLeftItemsSupplementBackButton;
  NSNumber *v7;

  v3 = a3;
  if (-[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges"))
  {
    v5 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", v3);
    delayedLeftItemsSupplementBackButton = self->_delayedLeftItemsSupplementBackButton;
    self->_delayedLeftItemsSupplementBackButton = v5;

    -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
  }
  else
  {
    -[SUNavigationItem setLeftItemsSupplementBackButton:](self->_wrappedNavigationItem, "setLeftItemsSupplementBackButton:", v3);
    v7 = self->_delayedLeftItemsSupplementBackButton;
    self->_delayedLeftItemsSupplementBackButton = 0;

  }
}

- (void)setRightBarButtonItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id delayedRightBarButtonItems;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v4 = a4;
  v13 = a3;
  if (-[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges"))
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
        self->_delayedRightBarButtonItems = v6;

      }
      v8 = objc_msgSend(self->_delayedRightBarButtonItems, "count");
      v9 = self->_delayedRightBarButtonItems;
      if (v8)
        objc_msgSend(v9, "replaceObjectAtIndex:withObject:", 0, v13);
      else
        objc_msgSend(v9, "addObject:", v13);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(self->_delayedRightBarButtonItems, "count"))
          objc_msgSend(self->_delayedRightBarButtonItems, "removeObjectAtIndex:", 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self->_delayedRightBarButtonItems;
        self->_delayedRightBarButtonItems = v11;

      }
    }
    -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
  }
  else
  {
    -[SUNavigationItem setRightBarButtonItem:animated:](self->_wrappedNavigationItem, "setRightBarButtonItem:animated:", v13, v4);
    v10 = self->_delayedRightBarButtonItems;
    self->_delayedRightBarButtonItems = 0;

  }
}

- (void)setRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  BOOL v6;
  SUNavigationItem *wrappedNavigationItem;
  id v8;
  void *v9;
  id delayedRightBarButtonItems;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = -[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges");
  wrappedNavigationItem = self->_wrappedNavigationItem;
  if (v6)
  {
    -[SUNavigationItem rightBarButtonItems](wrappedNavigationItem, "rightBarButtonItems");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 != v12 && (objc_msgSend(v8, "isEqualToArray:", v12) & 1) == 0)
    {
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
        self->_delayedRightBarButtonItems = v11;
        goto LABEL_10;
      }
      if (self->_delayedRightBarButtonItems != v12)
      {
        v9 = (void *)objc_msgSend(v12, "mutableCopy");
        delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
        self->_delayedRightBarButtonItems = v9;
LABEL_10:

        -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
      }
    }
  }
  else
  {
    -[SUNavigationItem setRightBarButtonItems:animated:](wrappedNavigationItem, "setRightBarButtonItems:animated:", v12, v4);
    v8 = self->_delayedRightBarButtonItems;
    self->_delayedRightBarButtonItems = 0;
  }

}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  id delayedTitle;
  id v7;
  id v8;

  v8 = a3;
  if (!-[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges"))
  {
    -[SUNavigationItem setTitle:](self->_wrappedNavigationItem, "setTitle:", v8);
    delayedTitle = self->_delayedTitle;
    self->_delayedTitle = 0;

LABEL_8:
    v4 = v8;
    goto LABEL_9;
  }
  v4 = v8;
  if (self->_delayedTitle != v8)
  {
    if (v8)
    {
      v5 = (void *)objc_msgSend(v8, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->_delayedTitle;
    self->_delayedTitle = v5;

    -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
    goto LABEL_8;
  }
LABEL_9:

}

- (void)setTitleView:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id delayedTitleView;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges"))
  {
    -[SUNavigationItem setTitleView:](self->_wrappedNavigationItem, "setTitleView:", v9);
    delayedTitleView = self->_delayedTitleView;
    self->_delayedTitleView = 0;

LABEL_8:
    v4 = v9;
    goto LABEL_9;
  }
  v4 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_delayedTitleView;
    self->_delayedTitleView = v8;
    goto LABEL_7;
  }
  if (self->_delayedTitleView != v9)
  {
    v5 = v9;
    v6 = self->_delayedTitleView;
    self->_delayedTitleView = v5;
LABEL_7:

    -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
    goto LABEL_8;
  }
LABEL_9:

}

- (void)setTitleView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;
  id delayedTitleView;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (!-[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges"))
  {
    -[UINavigationItem setTitleView:animated:](self->_wrappedNavigationItem, "setTitleView:animated:", v11, v4);
    delayedTitleView = self->_delayedTitleView;
    self->_delayedTitleView = 0;

LABEL_8:
    v6 = v11;
    goto LABEL_9;
  }
  v6 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_delayedTitleView;
    self->_delayedTitleView = v10;
    goto LABEL_7;
  }
  if (self->_delayedTitleView != v11)
  {
    v7 = v11;
    v8 = self->_delayedTitleView;
    self->_delayedTitleView = v7;
LABEL_7:

    -[SUDelayedNavigationItem _scheduleCommit](self, "_scheduleCommit");
    goto LABEL_8;
  }
LABEL_9:

}

- (id)title
{
  id delayedTitle;
  id v4;
  SUNavigationItem *wrappedNavigationItem;
  void *v7;
  objc_super v8;

  delayedTitle = self->_delayedTitle;
  if (delayedTitle)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedTitle == v4)
      return 0;
    else
      return self->_delayedTitle;
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      -[SUNavigationItem title](wrappedNavigationItem, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      -[SUDelayedNavigationItem title](&v8, sel_title);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v7;
  }
}

- (id)titleView
{
  id delayedTitleView;
  id v4;
  SUNavigationItem *wrappedNavigationItem;
  void *v7;
  objc_super v8;

  delayedTitleView = self->_delayedTitleView;
  if (delayedTitleView)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (delayedTitleView == v4)
      return 0;
    else
      return self->_delayedTitleView;
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      -[SUNavigationItem titleView](wrappedNavigationItem, "titleView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      -[SUDelayedNavigationItem titleView](&v8, sel_titleView);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v7;
  }
}

- (void)_prepareButtonItemForDisplay:(id)a3
{
  id v3;

  objc_msgSend(a3, "customView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2551D9640))
    objc_msgSend(v3, "setDeferringInterfaceUpdates:", 0);

}

- (void)_scheduleCommit
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_commitDelayedChanges, 0);
  if (-[SUDelayedNavigationItem shouldDelayChanges](self, "shouldDelayChanges"))
    -[SUDelayedNavigationItem performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_commitDelayedChanges, 0, 0.35);
  else
    -[SUDelayedNavigationItem commitDelayedChanges](self, "commitDelayedChanges");
}

- (BOOL)shouldDelayChanges
{
  return self->_shouldDelayChanges;
}

- (void)setShouldDelayChanges:(BOOL)a3
{
  self->_shouldDelayChanges = a3;
}

- (SUNavigationItem)wrappedNavigationItem
{
  return self->_wrappedNavigationItem;
}

- (void)setWrappedNavigationItem:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedNavigationItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedNavigationItem, 0);
  objc_storeStrong(&self->_delayedRightBarButtonItems, 0);
  objc_storeStrong(&self->_delayedTitleView, 0);
  objc_storeStrong(&self->_delayedTitle, 0);
  objc_storeStrong((id *)&self->_delayedLeftItemsSupplementBackButton, 0);
  objc_storeStrong(&self->_delayedLeftBarButtonItems, 0);
  objc_storeStrong(&self->_delayedBackButtonTitle, 0);
}

@end

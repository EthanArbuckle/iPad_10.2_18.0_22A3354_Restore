@implementation ICQUsageDetailController

+ (id)mediaGroups
{
  return 0;
}

+ (id)mpKeyTranslations
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("name");
  v2 = *MEMORY[0x24BDDBC68];
  v7[0] = CFSTR("audiopodcasts");
  v7[1] = CFSTR("videopodcasts");
  v8[0] = v2;
  v8[1] = v2;
  v3 = *MEMORY[0x24BDDBAF8];
  v7[2] = CFSTR("audiocourses");
  v7[3] = CFSTR("videocourses");
  v8[2] = v3;
  v8[3] = v3;
  v7[4] = CFSTR("audiobooks");
  v8[4] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (float)totalSizeForGroups:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t i;
  void *v11;
  float v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "mediaCollectionForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "totalSize");
        v9 = v9 + v12;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

+ (BOOL)hasMediaForGroups:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "mediaCollectionForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "items");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          if (v11)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (void)setupSpecifier:(id)a3 forMediaGroups:(id)a4
{
  id v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  uint64_t v14;
  float v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v16, "propertyForKey:", CFSTR("USAGE_APP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQUsageDetailController totalSizeForGroups:](ICQUsageDetailController, "totalSizeForGroups:", v6);
  v9 = v8;
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "totalSize");
  *(float *)&v12 = v9 + v11;
  objc_msgSend(v10, "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProperty:forKey:", v13, kTotalSizeProperty);

  if (v7)
  {
    v14 = 2;
  }
  else
  {
    objc_msgSend(a1, "totalSizeForGroups:", v6);
    if (v15 <= 0.0)
      v14 = 4;
    else
      v14 = 2;
  }
  objc_msgSend(v16, "setCellType:", v14);

}

- (BOOL)hasMedia
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "mediaGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "hasMediaForGroups:", v2);

  return v3;
}

- (BOOL)isAppController
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ICQUsageDetailController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("USAGE_APP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)loadView
{
  void *v3;
  ICQUsageDetailHeader *v4;
  double v5;
  ICQUsageDetailHeader *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICQUsageDetailController;
  -[ICQUsageDetailController loadView](&v15, sel_loadView);
  -[ICQUsageDetailController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICQUsageDetailController isAppController](self, "isAppController"))
  {
    v4 = [ICQUsageDetailHeader alloc];
    +[ICQUsageDetailHeader usageDetailHeaderHeight](ICQUsageDetailHeader, "usageDetailHeaderHeight");
    v6 = -[ICQUsageDetailHeader initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, 0.0, v5);
    -[ICQUsageDetailHeader setLabelTextAndIconWithSpecifier:](v6, "setLabelTextAndIconWithSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));
    objc_msgSend(v3, "setTableHeaderView:", v6);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INFO"), &stru_24E400750, CFSTR("Usage Statistics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUsageDetailController setTitle:](self, "setTitle:", v8);

    -[ICQUsageDetailController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rightBarButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BEBDB00]);
    if (PSIsiPad())
      v12 = 20.0;
    else
      v12 = 10.0;
    v6 = (ICQUsageDetailHeader *)objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, 0.0, v12);
    objc_msgSend(v3, "setTableHeaderView:", v6);
  }

  if (!-[ICQUsageDetailController hasMedia](self, "hasMedia"))
    -[PSEditableListController setEditingButtonHidden:animated:](self, "setEditingButtonHidden:animated:", 1, 0);
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "footerItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUsageDetailController setToolbarItems:animated:](self, "setToolbarItems:animated:", v14, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQUsageDetailController;
  -[ICQUsageDetailController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[ICQUsageDetailController isMovingFromParentViewController](self, "isMovingFromParentViewController"))-[ICQUsageDetailController setStorageController:](self, "setStorageController:", 0);
}

- (BOOL)needsToShowToolbarInPrefsAppRoot
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)showMore:(id)a3
{
  id v4;
  NSMutableDictionary *media;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v12 = 0;
  -[ICQUsageDetailController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v12, 0, v4);
  media = self->_media;
  objc_msgSend(v4, "propertyForKey:", CFSTR("mediaKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](media, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("usageGroupSpecifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = 0;
  if (v9 >= 7)
  {
    objc_msgSend(v8, "subarrayWithRange:", 6, v9 - 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("usageGroupShowAll"));

  objc_msgSend(v7, "removeObjectForKey:", CFSTR("usageGroupShowAllSpecifier"));
  -[ICQUsageDetailController beginUpdates](self, "beginUpdates");
  -[ICQUsageDetailController removeSpecifier:](self, "removeSpecifier:", v4);
  if (v10)
    -[ICQUsageDetailController insertContiguousSpecifiers:atEndOfGroup:animated:](self, "insertContiguousSpecifiers:atEndOfGroup:animated:", v10, v12, 1);
  -[ICQUsageDetailController endUpdates](self, "endUpdates");

}

- (BOOL)removeMediaEntry:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  objc_msgSend(v6, "propertyForKey:", CFSTR("mediaKind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_media, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("usageGroupSpecifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUsageDetailController beginUpdates](self, "beginUpdates");
  objc_msgSend(v8, "objectForKey:", CFSTR("usageGroupShowAll"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v9, "removeObject:", v6);
    if ((unint64_t)objc_msgSend(v9, "count") > 6)
    {
      -[ICQUsageDetailController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 1);
      objc_msgSend(v9, "objectAtIndex:", 5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("usageGroupShowAllSpecifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUsageDetailController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v17, -[ICQUsageDetailController indexOfSpecifier:](self, "indexOfSpecifier:", v18), 1);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("usageGroupShowAll"));

      objc_msgSend(v8, "objectForKey:", CFSTR("usageGroupShowAllSpecifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUsageDetailController removeSpecifier:animated:](self, "removeSpecifier:animated:", v13, 1);

      -[ICQUsageDetailController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 1);
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("usageGroupShowAllSpecifier"));
      objc_msgSend(v9, "objectAtIndex:", 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUsageDetailController insertSpecifier:atEndOfGroup:animated:](self, "insertSpecifier:atEndOfGroup:animated:", v14, a4, 1);

    }
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v9, "count") >= 3)
  {
    -[ICQUsageDetailController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 1);
    objc_msgSend(v9, "removeObject:", v6);
LABEL_8:
    v16 = v9;
    goto LABEL_9;
  }
  -[ICQUsageDetailController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v9, 1);
  -[NSMutableDictionary removeObjectForKey:](self->_media, "removeObjectForKey:", v7);
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeMediaCollectionCacheForKey:", v7);

  v16 = 0;
LABEL_9:

  -[ICQUsageDetailController endUpdates](self, "endUpdates");
  return v16 == 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD block[4];
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v7 = objc_msgSend(v6, "row");
  v8 = objc_msgSend(v6, "section");
  v9 = -[ICQUsageDetailController indexForIndexPath:](self, "indexForIndexPath:", v6);

  -[ICQUsageDetailController specifierAtIndex:](self, "specifierAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertyForKey:", CFSTR("mediaKind"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_media, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mediaCollectionForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICQUsageDetailController removeMediaEntry:inSection:](self, "removeMediaEntry:inSection:", v10, v8);
  objc_msgSend(v12, "objectForKey:", CFSTR("usageGroupMediaType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  if (v17)
  {
    if (v17 != 1)
    {
      v22 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v14, "items");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v14, "items");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndex:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "items");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v20;

LABEL_7:
  dispatch_get_global_queue(-2, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__ICQUsageDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
  block[3] = &unk_24E3F3610;
  v26 = v22;
  v24 = v22;
  dispatch_async(v23, block);

  objc_msgSend(v14, "removeItemAtIndex:", v7);
  -[ICQUsageDetailController updateSizesAfterDeletingMediaKind:deletedSection:shouldPop:](self, "updateSizesAfterDeletingMediaKind:deletedSection:shouldPop:", v11, v15, 1);

}

void __75__ICQUsageDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItems:", *(_QWORD *)(a1 + 32));

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_3);
}

void __75__ICQUsageDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2()
{
  id v0;

  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fetchSystemSizeStrings");

}

- (BOOL)updateSizesAfterDeletingMediaKind:(id)a3 deletedSection:(BOOL)a4 shouldPop:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id WeakRetained;
  id v25;
  BOOL v26;
  void *v28;
  void *v29;
  id v30;

  v5 = a5;
  v8 = a3;
  if (!a4)
  {
    -[NSMutableDictionary objectForKey:](self->_media, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("usageGroupSpecifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaCollectionForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "totalSize");
    v15 = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProperty:forKey:", v16, CFSTR("SIZE"));

    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", (uint64_t)v15, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyForKey:", *MEMORY[0x24BE75AB0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSize:", v17);

  }
  v19 = -[ICQUsageDetailController isAppController](self, "isAppController");
  v20 = (void *)objc_opt_class();
  v21 = (int)*MEMORY[0x24BE757A8];
  v22 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v21);
  objc_msgSend((id)objc_opt_class(), "mediaGroups");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setupSpecifier:forMediaGroups:", v22, v23);

  if (!v19 && !-[NSMutableDictionary count](self->_media, "count"))
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v21), "setCellType:", 4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_storageController);
  if (!WeakRetained)
    -[ICQUsageDetailController updateSizesAfterDeletingMediaKind:deletedSection:shouldPop:].cold.1();

  v25 = objc_loadWeakRetained((id *)&self->_storageController);
  objc_msgSend(v25, "sizeChangedForSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + v21));

  if (v19 || !v5 || -[NSMutableDictionary count](self->_media, "count"))
  {
    v26 = 0;
  }
  else
  {
    -[ICQUsageDetailController navigationController](self, "navigationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUsageDetailController parentController](self, "parentController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 1;
    v30 = (id)objc_msgSend(v28, "popToViewController:animated:", v29, 1);

  }
  return v26;
}

- (id)size:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("mediaKind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  -[ICQUsageDetailController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", 0, &v19, v4);

  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_media, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("usageGroupMediaType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  if (!v9)
  {
    objc_msgSend(v6, "mediaCollectionForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemSizes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v10 = v16;
    goto LABEL_5;
  }
  v10 = 0.0;
  if (v9 == 1)
  {
    objc_msgSend(v6, "mediaCollectionForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForProperty:", *MEMORY[0x24BDDBB70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v10 = v15;

LABEL_5:
  }
  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", (uint64_t)v10, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  char *v6;
  unint64_t v7;
  void *v8;
  int v9;
  unsigned int v10;
  int64_t v11;

  v5 = -[ICQUsageDetailController indexForIndexPath:](self, "indexForIndexPath:", a4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v5);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)&v6[*MEMORY[0x24BE75738]] - 1;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("DOCS_AND_DATA"));

  v10 = (v9 | objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode")) ^ 1;
  if (v7 < 4)
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (-[ICQUsageDetailController tableView:editingStyleForRowAtIndexPath:](self, "tableView:editingStyleForRowAtIndexPath:", a3, v6))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", -[ICQUsageDetailController indexForIndexPath:](self, "indexForIndexPath:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75AC0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "isEqualToString:", CFSTR("SHOW_ALL"));

  }
  return v7;
}

- (id)dynamicSize:(id)a3
{
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  float v9;
  __CFString *v10;

  v4 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "propertyForKey:", CFSTR("USAGE_APP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "propertyForKey:", CFSTR("USAGE_APP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1490];
    objc_msgSend(v7, "dataSize");
    objc_msgSend(v8, "stringFromByteCount:countStyle:", (uint64_t)v9, 2);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_24E400750;
  }
  return v10;
}

- (void)confirmAppDeletion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  char *v21;

  v21 = (char *)objc_alloc_init(MEMORY[0x24BE754D0]);
  v19 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_24E400750, CFSTR("Usage Statistics"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BE75980];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E400750, CFSTR("Usage Statistics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE75970];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DELETE_APP_EXPLANATION"), &stru_24E400750, CFSTR("Usage Statistics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE75988];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE_APP"), &stru_24E400750, CFSTR("Usage Statistics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v16, v15, v3, v14, v8, v9, v11, *MEMORY[0x24BE75990], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setupWithDictionary:", v12);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setProperty:forKey:", v13, *MEMORY[0x24BE75978]);

  objc_storeWeak((id *)&v21[*MEMORY[0x24BE75768]], self);
  objc_msgSend(v21, "setConfirmationAction:", sel_deleteApp);
  -[ICQUsageDetailController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v21);

}

- (void)deleteApp
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[ICQUsageDetailController deleteApp]";
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "%@-%s: This class should no longer be used.", (uint8_t *)&v2, 0x16u);
}

- (id)documentsAndDataSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ICQUsageDetailController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DOCUMENTS_AND_DATA"), &stru_24E400750, CFSTR("Usage Statistics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, sel_dynamicSize_, 0, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v10, "setIdentifier:", CFSTR("DOCS_AND_DATA"));
  objc_msgSend(v5, "addObject:", v10);

  return v5;
}

- (id)copyMediaSpecifiers
{
  NSMutableDictionary *v3;
  NSMutableDictionary *media;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  ICQUsageDetailController *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  void *v72;
  id obj;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v74 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!self->_media)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 7);
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    media = self->_media;
    self->_media = v3;

  }
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "mediaGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = MEMORY[0x24BDAC760];
  v97[1] = 3221225472;
  v97[2] = __47__ICQUsageDetailController_copyMediaSpecifiers__block_invoke;
  v97[3] = &unk_24E3F3E38;
  v7 = v5;
  v98 = v7;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v97);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v94;
    v68 = *MEMORY[0x24BDDBB70];
    v77 = *MEMORY[0x24BDDBCD8];
    v82 = *MEMORY[0x24BE75948];
    v81 = *MEMORY[0x24BE75B88];
    v67 = *MEMORY[0x24BE75AA0];
    v66 = *MEMORY[0x24BE75AC0];
    v69 = *(_QWORD *)v94;
    v70 = v7;
    do
    {
      v12 = 0;
      v71 = v10;
      do
      {
        if (*(_QWORD *)v94 != v11)
          objc_enumerationMutation(obj);
        v76 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v12);
        objc_msgSend(v7, "mediaCollectionForKey:", v13);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "items");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          -[NSMutableDictionary objectForKey:](self->_media, "objectForKey:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = v16;
            objc_msgSend(v16, "objectForKey:", CFSTR("usageGroupSpecifiers"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", CFSTR("usageGroupShowAll"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "BOOLValue");

            if (v20)
            {
              objc_msgSend(v74, "addObjectsFromArray:", v18);
            }
            else
            {
              objc_msgSend(v18, "subarrayWithRange:", 0, 6);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "addObjectsFromArray:", v39);

              objc_msgSend(v17, "objectForKey:", CFSTR("usageGroupShowAllSpecifier"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "addObject:", v40);

            }
          }
          else
          {
            v84 = v13;
            objc_msgSend(v78, "sortItemsByMediaKey:", v68);
            objc_msgSend(v78, "items");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v21, "count") + 1);
            v23 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("usageGroupSpecifiers"));
            v24 = objc_msgSend(v78, "isGrouped");
            v25 = v24;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v24 ^ 1u);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v22;
            objc_msgSend(v22, "setObject:forKey:", v26, CFSTR("usageGroupMediaType"));

            v75 = v21;
            v83 = (void *)v23;
            if ((v25 & 1) != 0)
            {
              v87 = 0uLL;
              v88 = 0uLL;
              v85 = 0uLL;
              v86 = 0uLL;
              v79 = v21;
              v27 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
              if (v27)
              {
                v28 = v27;
                v80 = *(_QWORD *)v86;
                do
                {
                  for (i = 0; i != v28; ++i)
                  {
                    v30 = self;
                    if (*(_QWORD *)v86 != v80)
                      objc_enumerationMutation(v79);
                    objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "representativeItem");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    +[ICQUsageDetailController mpKeyTranslations](ICQUsageDetailController, "mpKeyTranslations");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "objectForKey:", CFSTR("name"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "objectForKey:", v84);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "valueForProperty:", v34);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    self = v30;
                    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, v30, 0, sel_size_, 0, 4, 0);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "setProperty:forKey:", objc_opt_class(), v82);
                    objc_msgSend(v31, "artworkCatalog");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "setProperty:forKey:", v37, CFSTR("ICON_LOADER"));

                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "setProperty:forKey:", v38, v81);

                    objc_msgSend(v36, "setProperty:forKey:", v84, CFSTR("mediaKind"));
                    objc_msgSend(v83, "addObject:", v36);

                  }
                  v28 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
                }
                while (v28);
              }
            }
            else
            {
              v91 = 0uLL;
              v92 = 0uLL;
              v89 = 0uLL;
              v90 = 0uLL;
              v41 = v21;
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v90;
                do
                {
                  for (j = 0; j != v43; ++j)
                  {
                    if (*(_QWORD *)v90 != v44)
                      objc_enumerationMutation(v41);
                    v46 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
                    objc_msgSend(v46, "valueForProperty:", v77);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v47, self, 0, sel_size_, 0, 4, 0);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "setProperty:forKey:", objc_opt_class(), v82);
                    objc_msgSend(v46, "artworkCatalog");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "setProperty:forKey:", v49, CFSTR("ICON_LOADER"));

                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "setProperty:forKey:", v50, v81);

                    objc_msgSend(v48, "setProperty:forKey:", v84, CFSTR("mediaKind"));
                    objc_msgSend(v83, "addObject:", v48);

                  }
                  v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
                }
                while (v43);
              }
            }

            v51 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "localizedStringForKey:value:table:", v84, &stru_24E400750, CFSTR("Usage Statistics"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v53, 0, 0, 0, 0, 0, 0);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            v55 = v84;
            objc_msgSend(v54, "setProperty:forKey:", CFSTR("PSUsageSizeHeader"), v67);
            v56 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v78, "totalSize");
            objc_msgSend(v56, "numberWithFloat:");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setProperty:forKey:", v57, CFSTR("SIZE"));

            objc_msgSend(v54, "setProperty:forKey:", v84, CFSTR("mediaKind"));
            objc_msgSend(v83, "insertObject:atIndex:", v54, 0);
            if ((unint64_t)(objc_msgSend(v83, "count") - 7) > 0xFFFFFFFFFFFFFFF9)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v72;
              objc_msgSend(v72, "setObject:forKey:", v64, CFSTR("usageGroupShowAll"));

              objc_msgSend(v74, "addObjectsFromArray:", v83);
            }
            else
            {
              objc_msgSend(v83, "subarrayWithRange:", 0, 6);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "addObjectsFromArray:", v58);

              v59 = (void *)MEMORY[0x24BE75590];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL"), &stru_24E400750, CFSTR("Usage Statistics"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v61, self, 0, 0, 0, 13, 0);
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v62, "setProperty:forKey:", CFSTR("SHOW_ALL"), v66);
              objc_msgSend(v62, "setProperty:forKey:", v84, CFSTR("mediaKind"));
              objc_msgSend(v62, "setProperty:forKey:", objc_opt_class(), v82);
              objc_msgSend(v62, "setButtonAction:", sel_showMore_);
              objc_msgSend(v74, "addObject:", v62);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v72;
              objc_msgSend(v72, "setObject:forKey:", v63, CFSTR("usageGroupShowAll"));

              objc_msgSend(v72, "setObject:forKey:", v62, CFSTR("usageGroupShowAllSpecifier"));
              v55 = v84;
            }
            v7 = v70;
            v10 = v71;
            v11 = v69;
            -[NSMutableDictionary setObject:forKey:](self->_media, "setObject:forKey:", v17, v55);

            v18 = v75;
          }

        }
        v12 = v76 + 1;
      }
      while (v76 + 1 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
    }
    while (v10);
  }

  return v74;
}

uint64_t __47__ICQUsageDetailController_copyMediaSpecifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "mediaCollectionForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaCollectionForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v7)
      v10 = 1;
    else
      v10 = v8 == 0;
    v11 = !v10;
    if (v7)
      v12 = v8 == 0;
    else
      v12 = 0;
    if (v12)
      v17 = -1;
    else
      v17 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "totalSize");
    objc_msgSend(v13, "numberWithFloat:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "totalSize");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "compare:", v16);

  }
  return v17;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (-[ICQUsageDetailController hasMedia](self, "hasMedia"))
      v5 = -[ICQUsageDetailController copyMediaSpecifiers](self, "copyMediaSpecifiers");
    else
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = v5;
    if (-[ICQUsageDetailController isAppController](self, "isAppController"))
    {
      -[ICQUsageDetailController documentsAndDataSpecifiers](self, "documentsAndDataSpecifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v7);

    }
    if (!-[ICQUsageDetailController isAppController](self, "isAppController"))
      goto LABEL_13;
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "effectiveRestrictedBoolValueForSetting:", *MEMORY[0x24BE637B8]) != 2)
    {
      v9 = objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode");

      if ((v9 & 1) != 0)
      {
LABEL_13:
        v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
        *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v6;

        v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
        return v4;
      }
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "propertyForKey:", CFSTR("USAGE_APP"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isSystemApp") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v10);

        v11 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_APP"), &stru_24E400750, CFSTR("Usage Statistics"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deleteButtonSpecifierWithName:target:action:", v13, self, sel_confirmAppDeletion);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

      }
    }

    goto LABEL_13;
  }
  return v4;
}

- (NSDictionary)mediaCache
{
  return &self->_media->super;
}

- (ICQUsageStorageController)storageController
{
  return (ICQUsageStorageController *)objc_loadWeakRetained((id *)&self->_storageController);
}

- (void)setStorageController:(id)a3
{
  objc_storeWeak((id *)&self->_storageController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storageController);
  objc_storeStrong((id *)&self->_documentsGroup, 0);
  objc_storeStrong((id *)&self->_media, 0);
}

- (void)updateSizesAfterDeletingMediaKind:deletedSection:shouldPop:.cold.1()
{
  __assert_rtn("-[ICQUsageDetailController updateSizesAfterDeletingMediaKind:deletedSection:shouldPop:]", "ICQUsageDetailController.m", 358, "_storageController");
}

@end

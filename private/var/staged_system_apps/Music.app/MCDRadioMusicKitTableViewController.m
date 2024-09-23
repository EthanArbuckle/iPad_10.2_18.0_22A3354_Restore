@implementation MCDRadioMusicKitTableViewController

- (MCDRadioMusicKitTableViewController)initWithLimitedUI:(BOOL)a3
{
  MCDRadioMusicKitTableViewController *v3;
  MCDRadioMusicKitTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDRadioMusicKitTableViewController;
  v3 = -[MCDFuseTableViewController initWithLimitedUI:](&v6, "initWithLimitedUI:", a3);
  v4 = v3;
  if (v3)
    -[MCDRadioMusicKitTableViewController setPlayActivityFeatureName:](v3, "setPlayActivityFeatureName:", CFSTR("radio"));
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDRadioMusicKitTableViewController;
  -[MCDContentItemTableViewController viewDidLoad](&v7, "viewDidLoad");
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, sub_10000BC4C, &unk_1010A8A18));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDRadioMusicKitTableViewController;
  -[MCDFuseTableViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MCDRadioMusicKitTableViewController _resetTimerForShowsUpdate](self, "_resetTimerForShowsUpdate");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDRadioMusicKitTableViewController;
  -[MCDTableViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRadioMusicKitTableViewController showsUpdateTimer](self, "showsUpdateTimer"));
  objc_msgSend(v4, "invalidate");

  -[MCDRadioMusicKitTableViewController setShowsUpdateTimer:](self, "setShowsUpdateTimer:", 0);
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  MCDRadioMusicKitTableViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *i;
  uint64_t v36;
  uint64_t (*v37)(void);
  uint64_t v38;
  void *v39;
  void *v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void *v51;
  _BYTE v52[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if ((objc_msgSend(v11, "hasLoadedValueForKey:", MPModelStoreBrowseSectionRelationshipRadioStation) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadAdditionalContentURL"));
    if (v13)
    {

    }
    else if (objc_msgSend(v11, "sectionType") == (id)8 || objc_msgSend(v11, "sectionType") == (id)11)
    {
      v12 = -[MCDRadioMusicKitTableViewController initWithLimitedUI:]([MCDRadioMusicKitTableViewController alloc], "initWithLimitedUI:", -[MCDTableViewController limitedUI](self, "limitedUI"));
      v25 = (void *)objc_opt_new(MPMutableSectionedCollection);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentResults"));
      v27 = v26;
      if (v26)
      {
        v28 = v26;
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastReceivedResponse"));
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "results"));

        v28 = (id)v30;
      }

      v31 = objc_msgSend(v28, "numberOfSections");
      v42 = v28;
      if ((uint64_t)v31 <= (uint64_t)objc_msgSend(v10, "section"))
      {
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v37 = (uint64_t (*)(void))off_1011ECA10;
        v51 = off_1011ECA10;
        if (!off_1011ECA10)
        {
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = sub_10000C998;
          v47[3] = &unk_1010A89D8;
          v47[4] = &v48;
          sub_10000C998((uint64_t)v47);
          v37 = (uint64_t (*)(void))v49[3];
        }
        _Block_object_dispose(&v48, 8);
        if (!v37)
        {
          sub_100DE9368();
          __break(1u);
        }
        v38 = v37();
        v32 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          sub_100DE9388(v10, (uint64_t)v28, v32);
      }
      else
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "itemsInSectionAtIndex:", objc_msgSend(v10, "section")));
        v33 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v33; i = (char *)i + 1)
            {
              if (*(_QWORD *)v44 != v34)
                objc_enumerationMutation(v32);
              v36 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v25, "appendSection:", v36);
              objc_msgSend(v25, "appendItem:", v36);
            }
            v33 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          }
          while (v33);
        }
      }

      -[MCDContentItemTableViewController setContentResults:](v12, "setContentResults:", v25);
      goto LABEL_32;
    }
    v12 = -[MCDContentItemMusicKitTableViewController initWithSectionItem:limitedUI:radioDomain:]([MCDContentItemMusicKitTableViewController alloc], "initWithSectionItem:limitedUI:radioDomain:", v11, -[MCDTableViewController limitedUI](self, "limitedUI"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadAdditionalContentURL"));

    if (!v14)
    {
      v15 = (void *)objc_opt_new(MPMutableSectionedCollection);
      objc_msgSend(v15, "appendSection:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentResults"));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentResults"));
        v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstSection"));
        v19 = v18 == v11;

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentResults"));
        v21 = v20;
        if (v19)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "itemsInSectionAtIndex:", objc_msgSend(v10, "row")));
          objc_msgSend(v15, "appendItems:", v23);
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "itemsInSectionAtIndex:", 0));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v10, "row")));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "itemsInSectionAtIndex:", 0));
          objc_msgSend(v15, "appendItems:", v24);

          v21 = v22;
        }
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastReceivedResponse"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "results"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "itemsInSectionAtIndex:", objc_msgSend(v10, "section")));
        objc_msgSend(v15, "appendItems:", v39);

      }
      -[MCDContentItemTableViewController setContentResults:](v12, "setContentResults:", v15);

    }
LABEL_32:
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    -[MCDRadioMusicKitTableViewController setTitle:](v12, "setTitle:", v40);

    goto LABEL_33;
  }
  v12 = 0;
LABEL_33:

  return v12;
}

- (id)_contentManager
{
  MCDRadioMusicKitContentManager *v3;
  MCDRadioMusicKitDataSource *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  MCDRadioMusicKitContentManager *v8;

  v3 = [MCDRadioMusicKitContentManager alloc];
  v4 = objc_opt_new(MCDRadioMusicKitDataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v6 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemTableViewController contentResults](self, "contentResults"));
  v8 = -[MCDFuseContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:](v3, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:", v4, self, self, v5, v6, v7);

  return v8;
}

- (void)setHasLoadedStoreContent:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDRadioMusicKitTableViewController;
  -[MCDFuseTableViewController setHasLoadedStoreContent:](&v4, "setHasLoadedStoreContent:", a3);
  -[MCDRadioMusicKitTableViewController _resetTimerForShowsUpdate](self, "_resetTimerForShowsUpdate");
}

- (id)dateIntervalFormatter
{
  if (qword_1011ECA08 != -1)
    dispatch_once(&qword_1011ECA08, &stru_1010A8AD8);
  return (id)qword_1011ECA00;
}

- (void)_resetTimerForShowsUpdate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRadioMusicKitTableViewController showsUpdateTimer](self, "showsUpdateTimer"));
  objc_msgSend(v3, "invalidate");

  if (-[MCDFuseTableViewController hasLoadedStoreContent](self, "hasLoadedStoreContent"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRadioMusicKitTableViewController _radioContentManager](self, "_radioContentManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextUpcomingShowStartTime"));

    if (v5)
    {
      objc_initWeak(&location, self);
      objc_msgSend(v5, "timeIntervalSinceNow");
      v7 = v6;
      v8 = &_dispatch_main_q;
      v10 = _NSConcreteStackBlock;
      v11 = 3221225472;
      v12 = sub_10000C8C4;
      v13 = &unk_1010A8B00;
      objc_copyWeak(&v14, &location);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSVTimer timerWithInterval:queue:block:](MSVTimer, "timerWithInterval:queue:block:", &_dispatch_main_q, &v10, v7));
      -[MCDRadioMusicKitTableViewController setShowsUpdateTimer:](self, "setShowsUpdateTimer:", v9, v10, v11, v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_updateRadioShowCells
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCDRadioMusicKitTableViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRadioMusicKitTableViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForVisibleRows"));
  objc_msgSend(v5, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 100);

}

- (MSVTimer)showsUpdateTimer
{
  return self->_showsUpdateTimer;
}

- (void)setShowsUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_showsUpdateTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showsUpdateTimer, 0);
}

@end

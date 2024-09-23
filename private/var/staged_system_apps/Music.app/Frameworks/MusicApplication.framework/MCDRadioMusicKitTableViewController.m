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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, __50__MCDRadioMusicKitTableViewController_viewDidLoad__block_invoke, &unk_1339168));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__MCDRadioMusicKitTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v35;
  void *v36;
  id v37;

  v37 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = v6;
  if (objc_msgSend(v8, "hasLoadedValueForKey:", MPModelStoreBrowseSectionRelationshipRadioStation))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "radioStation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Music"), CFSTR(" ")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Apple Music"), v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "textLabel"));
    objc_msgSend(v13, "setText:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "radioStation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentStationEvent"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dateIntervalFormatter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startTime"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endTime"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringFromDate:toDate:", v17, v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localeIdentifier"));
      LODWORD(v18) = objc_msgSend(v21, "isEqualToString:", CFSTR("en_US"));

      if ((_DWORD)v18)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":00"), &stru_13E1990));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_13E1990));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_13E1990));

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ · %@"), v24, v19));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "detailTextLabel"));
      objc_msgSend(v26, "setText:", v25);

    }
    if ((objc_msgSend(v8, "displaysAsGridCellInCarPlay") & 1) == 0)
      objc_msgSend(v37, "setAccessoryType:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "radioStation"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "artworkCatalog"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "traitCollection"));
    objc_msgSend(v29, "displayScale");
    objc_msgSend(v37, "setArtworkCatalog:andScale:fallbackImage:", v28, 0);

  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "textLabel"));
    objc_msgSend(v31, "setText:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _labelColor](UIColor, "_labelColor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "textLabel"));
    objc_msgSend(v33, "setTextColor:", v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "textLabel"));
    objc_msgSend(v35, "setHighlightedTextColor:", v34);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "detailTextLabel"));
    objc_msgSend(v36, "setText:", 0);

    if ((objc_msgSend(v8, "displaysAsGridCellInCarPlay") & 1) == 0)
    {
      objc_msgSend(v37, "setAccessoryView:", 0);
      objc_msgSend(v37, "setAccessoryType:", 1);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "traitCollection"));
    objc_msgSend(v12, "displayScale");
    objc_msgSend(v37, "setArtworkCatalog:andScale:fallbackImage:", 0, 0);
  }

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
    else if (objc_msgSend(v11, "sectionType") == &dword_8 || objc_msgSend(v11, "sectionType") == (char *)&dword_8 + 3)
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
        v37 = (uint64_t (*)(void))getMCDMusicGeneralLoggingSymbolLoc_ptr_13;
        v51 = getMCDMusicGeneralLoggingSymbolLoc_ptr_13;
        if (!getMCDMusicGeneralLoggingSymbolLoc_ptr_13)
        {
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = __getMCDMusicGeneralLoggingSymbolLoc_block_invoke_4;
          v47[3] = &unk_1339000;
          v47[4] = &v48;
          __getMCDMusicGeneralLoggingSymbolLoc_block_invoke_4((uint64_t)v47);
          v37 = (uint64_t (*)(void))v49[3];
        }
        _Block_object_dispose(&v48, 8);
        if (!v37)
        {
          soft_MCDMusicGeneralLogging_cold_1();
          __break(1u);
        }
        v38 = v37();
        v32 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[MCDRadioMusicKitTableViewController contentManager:viewControllerForItem:indexPath:].cold.2(v10, (uint64_t)v28, v32);
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
  if (dateIntervalFormatter_onceToken != -1)
    dispatch_once(&dateIntervalFormatter_onceToken, &__block_literal_global_19);
  return (id)dateIntervalFormatter_formatter;
}

void __60__MCDRadioMusicKitTableViewController_dateIntervalFormatter__block_invoke(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSDateIntervalFormatter);
  v2 = (void *)dateIntervalFormatter_formatter;
  dateIntervalFormatter_formatter = (uint64_t)v1;

  objc_msgSend((id)dateIntervalFormatter_formatter, "setDateStyle:", 0);
  objc_msgSend((id)dateIntervalFormatter_formatter, "setTimeStyle:", 1);
  objc_msgSend((id)dateIntervalFormatter_formatter, "setBoundaryStyle:", 2);
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
      v12 = __64__MCDRadioMusicKitTableViewController__resetTimerForShowsUpdate__block_invoke;
      v13 = &unk_1338FB0;
      objc_copyWeak(&v14, &location);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSVTimer timerWithInterval:queue:block:](MSVTimer, "timerWithInterval:queue:block:", &_dispatch_main_q, &v10, v7));
      -[MCDRadioMusicKitTableViewController setShowsUpdateTimer:](self, "setShowsUpdateTimer:", v9, v10, v11, v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

  }
}

void __64__MCDRadioMusicKitTableViewController__resetTimerForShowsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateRadioShowCells");
  objc_msgSend(WeakRetained, "_resetTimerForShowsUpdate");

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

- (void)contentManager:(void *)a1 viewControllerForItem:(uint64_t)a2 indexPath:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;

  v5 = 134218242;
  v6 = objc_msgSend(a1, "section");
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "[Radio] Cannot get items in non existing section %ld from results %@", (uint8_t *)&v5, 0x16u);
}

@end

@implementation MCDBrowseTableViewController

- (MCDBrowseTableViewController)initWithLimitedUI:(BOOL)a3
{
  MCDBrowseTableViewController *v3;
  MCDBrowseTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDBrowseTableViewController;
  v3 = -[MCDFuseTableViewController initWithLimitedUI:](&v6, "initWithLimitedUI:", a3);
  v4 = v3;
  if (v3)
    -[MCDBrowseTableViewController setPlayActivityFeatureName:](v3, "setPlayActivityFeatureName:", CFSTR("browse"));
  return v4;
}

- (void)viewDidLoad
{
  uint64_t (*v3)(void);
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _Unwind_Exception *v7;
  objc_super v8;
  uint8_t buf[8];
  uint64_t v10;
  void *(*v11)(uint64_t);
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v8.receiver = self;
  v8.super_class = (Class)MCDBrowseTableViewController;
  -[MCDFuseTableViewController viewDidLoad](&v8, "viewDidLoad");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v3 = (uint64_t (*)(void))getMCDMusicGeneralLoggingSymbolLoc_ptr_8;
  v17 = getMCDMusicGeneralLoggingSymbolLoc_ptr_8;
  if (!getMCDMusicGeneralLoggingSymbolLoc_ptr_8)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = __getMCDMusicGeneralLoggingSymbolLoc_block_invoke_2;
    v12 = &unk_1339000;
    v13 = &v14;
    __getMCDMusicGeneralLoggingSymbolLoc_block_invoke_2((uint64_t)buf);
    v3 = (uint64_t (*)(void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v7);
  }
  v4 = v3();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Loading view for Browse", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v6, "setTableCellConfigurationBlock:", &__block_literal_global_12);

}

void __43__MCDBrowseTableViewController_viewDidLoad__block_invoke(id a1, UITableViewCell *a2, MPModelObject *a3, MPModelObject *a4, UITableView *a5, NSIndexPath *a6)
{
  UITableViewCell *v7;
  void *v8;
  void *v9;
  MPModelObject *v10;

  v10 = a4;
  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject title](v10, "title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v7, "textLabel"));
  objc_msgSend(v9, "setText:", v8);

  -[UITableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
}

- (id)_contentManager
{
  MCDBrowseContentManager *v3;
  MCDBrowseDataSource *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  MCDBrowseContentManager *v8;

  v3 = [MCDBrowseContentManager alloc];
  v4 = objc_opt_new(MCDBrowseDataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v6 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowseTableViewController contentResults](self, "contentResults"));
  v8 = -[MCDFuseContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:](v3, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:", v4, self, self, v5, v6, v7);

  return v8;
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  _BOOL8 v14;
  void *v15;
  MCDBrowseTableViewController *v16;
  MCDContentItemTableViewController *v17;
  void *v18;
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
  void *v29;
  void *v30;
  void *v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (unint64_t)objc_msgSend(v10, "sectionType") - 1;
  v14 = (v12 & 7) == 0 && v12 < 3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadAdditionalContentURL"));
  if (v15)
  {

    goto LABEL_15;
  }
  if (objc_msgSend(v10, "sectionType") != &dword_8)
  {
LABEL_15:
    v17 = -[MCDContentItemTableViewController initWithSectionItem:limitedUI:showRankedList:queueListForPlayback:radioDomain:]([MCDContentItemTableViewController alloc], "initWithSectionItem:limitedUI:showRankedList:queueListForPlayback:radioDomain:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), v12 < 3, v14, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadAdditionalContentURL"));

    if (v21)
    {
      v16 = 0;
    }
    else
    {
      v22 = (void *)objc_opt_new(MPMutableSectionedCollection);
      objc_msgSend(v22, "appendSection:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentResults"));

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentResults"));
        v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstSection"));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentResults"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "itemsInSectionAtIndex:", objc_msgSend(v11, "row")));
        if (v25 == v10)
        {
          objc_msgSend(v22, "appendItems:", v27);
          v28 = v27;
        }
        else
        {

          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v11, "row")));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "itemsInSectionAtIndex:", 0));
          objc_msgSend(v22, "appendItems:", v29);

          v26 = v27;
        }
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastReceivedResponse"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "results"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "itemsInSectionAtIndex:", objc_msgSend(v11, "section")));
        objc_msgSend(v22, "appendItems:", v30);

      }
      -[MCDContentItemTableViewController setContentResults:](v17, "setContentResults:", v22);
      v17 = v17;

      v16 = (MCDBrowseTableViewController *)v17;
    }
    goto LABEL_23;
  }
  v16 = -[MCDBrowseTableViewController initWithLimitedUI:]([MCDBrowseTableViewController alloc], "initWithLimitedUI:", -[MCDTableViewController limitedUI](self, "limitedUI"));
  v17 = (MCDContentItemTableViewController *)objc_opt_new(MPMutableSectionedCollection);
  -[MCDContentItemTableViewController appendSection:](v17, "appendSection:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentResults"));
  v19 = v18;
  if (!v18)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastReceivedResponse"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "itemsInSectionAtIndex:", objc_msgSend(v11, "row")));
  -[MCDContentItemTableViewController appendItems:](v17, "appendItems:", v20);

  if (!v18)
  {

  }
  -[MCDBrowseTableViewController setContentResults:](v16, "setContentResults:", v17);
LABEL_23:

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  -[MCDBrowseTableViewController setTitle:](v16, "setTitle:", v31);

  return v16;
}

- (MPSectionedCollection)contentResults
{
  return self->_contentResults;
}

- (void)setContentResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentResults, 0);
}

@end

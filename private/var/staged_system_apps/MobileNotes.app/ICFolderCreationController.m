@implementation ICFolderCreationController

- (ICFolderCreationController)initWithViewController:(id)a3 noteContainer:(id)a4 smartFolderQuery:(id)a5 folderTitle:(id)a6 creationApproach:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ICFolderCreationController *v16;
  ICFolderCreationController *v17;
  void *v18;
  uint64_t v19;
  NSManagedObjectContext *viewContext;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ICFolderCreationController;
  v16 = -[ICFolderCreationController init](&v22, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_viewController, v12);
    objc_storeStrong((id *)&v17->_noteContainer, a4);
    objc_storeStrong((id *)&v17->_smartFolderQuery, a5);
    objc_storeStrong((id *)&v17->_folderTitle, a6);
    v17->_creationApproach = a7;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "managedObjectContext"));
    viewContext = v17->_viewContext;
    v17->_viewContext = (NSManagedObjectContext *)v19;

  }
  return v17;
}

- (ICFolderCreationController)initWithViewController:(id)a3 noteContainer:(id)a4 creationApproach:(int64_t)a5
{
  return -[ICFolderCreationController initWithViewController:noteContainer:smartFolderQuery:folderTitle:creationApproach:](self, "initWithViewController:noteContainer:smartFolderQuery:folderTitle:creationApproach:", a3, a4, 0, 0, a5);
}

- (ICFolderCreationController)initWithViewController:(id)a3 creationApproach:(int64_t)a4
{
  return -[ICFolderCreationController initWithViewController:noteContainer:smartFolderQuery:folderTitle:creationApproach:](self, "initWithViewController:noteContainer:smartFolderQuery:folderTitle:creationApproach:", a3, 0, 0, 0, a4);
}

- (ICNAEventReporter)eventReporter
{
  void *v3;
  void *v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  ICNAEventReporter *v11;
  ICNAEventReporter *eventReporter;
  void *v13;

  if (!self->_eventReporter)
  {
    if (+[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewIfLoaded"));

      if (v4)
      {
        v5 = objc_alloc((Class)ICNAEventReporter);
        v6 = (objc_class *)objc_opt_class(self);
        v7 = NSStringFromClass(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
        v11 = (ICNAEventReporter *)objc_msgSend(v5, "initWithSubTrackerName:view:", v8, v10);
        eventReporter = self->_eventReporter;
        self->_eventReporter = v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v13, "addObserver:selector:name:object:", self, "eventReporterLostSession:", ICNAEventReporterLostSessionNotification, self->_eventReporter);

      }
    }
  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = ICNAEventReporterLostSessionNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (UIMenu)menu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewContext](self, "viewContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController sortDescriptorForDefaultAccountFirstWithKey:defaultAccount:](self, "sortDescriptorForDefaultAccountFirstWithKey:defaultAccount:", CFSTR("accountNameForAccountListSorting"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewContext](self, "viewContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v6));
  v13 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingDescriptors:", v8));

  if (!objc_msgSend(v9, "count"))
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1004046B4(v11);

    goto LABEL_7;
  }
  if (objc_msgSend(v9, "count") == (id)1)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController accountMenuWithAccounts:](self, "accountMenuWithAccounts:", v9));
LABEL_8:

  return (UIMenu *)v10;
}

- (void)promptToAddFolderAllowingSmartFolder:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void (**v17)(void);

  v4 = a3;
  v17 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController noteContainer](self, "noteContainer"));
  v7 = objc_msgSend(v6, "isModernCustomFolder");

  if (!v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController noteContainer](self, "noteContainer"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController noteContainer](self, "noteContainer"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "noteContainerAccount"));
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewContext](self, "viewContext"));
      v16 = objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v15));
    }
    v13 = v16;

    v11 = 0;
    goto LABEL_10;
  }
  v8 = objc_opt_class(ICFolder);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController noteContainer](self, "noteContainer"));
  v10 = ICCheckedDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = objc_msgSend(v11, "depth");
  if (v12 < +[ICFolder folderDepthLimit](ICFolder, "folderDepthLimit"))
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "account"));
LABEL_10:
    -[ICFolderCreationController promptToAddFolderToAccount:allowsSmartFolder:noteContainer:completionHandler:](self, "promptToAddFolderToAccount:allowsSmartFolder:noteContainer:completionHandler:", v13, v4, v11, v17);

    v11 = (void *)v13;
    goto LABEL_11;
  }
  -[ICFolderCreationController showFolderDepthLimitAlert](self, "showFolderDepthLimitAlert");
  if (v17)
    v17[2]();
LABEL_11:

}

- (id)sortDescriptorForDefaultAccountFirstWithKey:(id)a3 defaultAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "valueForKey:", v5));
  v7 = v6;
  if (a4 && v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000420B0;
    v10[3] = &unk_100550A20;
    v11 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:](NSSortDescriptor, "sortDescriptorWithKey:ascending:comparator:", v5, 1, v10));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v5, 1));

  }
  return v8;
}

- (id)accountMenuWithAccounts:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100042200;
  v6[3] = &unk_100550A70;
  v6[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ic_compactMap:", v6));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v3));

  return v4;
}

- (void)promptToAddFolderToAccount:(id)a3 allowsSmartFolder:(BOOL)a4 noteContainer:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11 || !a4)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000424A0;
    v19[3] = &unk_100550A98;
    v19[4] = self;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    -[ICFolderCreationController promptToEnterNewFolderTitleWithAccount:completionHandler:](self, "promptToEnterNewFolderTitleWithAccount:completionHandler:", v20, v19);

  }
  else
  {
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100042518;
    v13[3] = &unk_100550AC0;
    objc_copyWeak(&v17, &location);
    v14 = v10;
    v15 = 0;
    v16 = v12;
    -[ICFolderCreationController showFolderComposerWithAccount:completion:](self, "showFolderComposerWithAccount:completion:", v14, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)createFolderInAccount:(id)a3 noteContainer:(id)a4 smartFolderQuery:(id)a5 folderTitle:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  int64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  if (objc_msgSend(v15, "length")
    && (v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController")),
        v17,
        v17))
  {
    if (v12)
      goto LABEL_5;
    +[ICNoteContext enableLocalAccount](ICNoteContext, "enableLocalAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    objc_msgSend(v18, "addOrDeleteLocalAccountIfNecessary");

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    objc_msgSend(v19, "save");

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewContext](self, "viewContext"));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount localAccountInContext:](ICAccount, "localAccountInContext:", v20));

    if (v12)
    {
LABEL_5:
      v21 = objc_opt_class(ICFolder);
      v22 = ICDynamicCast(v21, v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v48 = v14;
      v49 = v13;
      if (v14)
        v24 = (id)objc_claimAutoreleasedReturnValue(+[ICFolder smartFolderWithQuery:account:](ICFolder, "smartFolderWithQuery:account:", v14, v12));
      else
        v24 = +[ICFolder newFolderInAccount:](ICFolder, "newFolderInAccount:", v12);
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:](ICFolder, "deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:", v15, v24, v23, v12));
      objc_msgSend(v25, "setTitle:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v25, "setDateForLastTitleModification:", v27);

      if (v23)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "account"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));

        if (objc_msgSend(v30, "isEqualToString:", v28))
          objc_msgSend(v25, "setParent:", v23);

      }
      v52 = 0;
      v31 = objc_msgSend(v25, "isTitleValid:error:", v15, &v52);
      v32 = v52;
      if ((v31 & 1) != 0)
      {
        v33 = objc_msgSend(v25, "persistCreateActivityEventForObject:inParentObject:", v25, v23);
        objc_msgSend(v25, "updateChangeCountWithReason:", CFSTR("Created folder"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        objc_msgSend(v34, "save");

        if (v16)
          v16[2](v16, v25);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_100042A64;
        v50[3] = &unk_10054FE80;
        v50[4] = self;
        v35 = v25;
        v51 = v35;
        ICAccessibilityPerformBlockOnMainThreadAfterDelay(v50, 2.5);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController eventReporter](self, "eventReporter"));
        v37 = -[ICFolderCreationController creationApproach](self, "creationApproach");
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController filterSelection](self, "filterSelection"));
        objc_msgSend(v36, "submitFolderCreateEventForModernFolder:creationApproach:filterSelection:", v35, v37, v38);

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectID"));
        objc_msgSend(v39, "postNotificationName:object:", CFSTR("ICFolderCreationControllerFolderWasCreatedNotification"), v40);

      }
      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "userInfo"));
        v47 = v23;
        v43 = v32;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "userInfo"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", NSLocalizedRecoverySuggestionErrorKey));
        objc_msgSend(v41, "ic_showSingleButtonAlertWithTitle:message:", v44, v46);

        v32 = v43;
        v23 = v47;

        +[ICFolder deleteFolder:](ICFolder, "deleteFolder:", v25);
        if (v16)
          v16[2](v16, 0);
      }

      v14 = v48;
      v13 = v49;
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICFolderCreationController createFolderInAccount:noteContainer:smartFolderQuery:folderTitle:completionHandler:]", 1, 0, CFSTR("Unable to determine or create account"));
      if (v16)
        v16[2](v16, 0);
      v12 = 0;
    }
  }
  else if (v16)
  {
    v16[2](v16, 0);
  }

}

- (void)promptToEnterNewFolderTitleWithAccount:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[6];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("New Folder"), &stru_1005704B8, 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Enter a name for this folder."), &stru_1005704B8, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICDismissableAlertController alertControllerWithTitle:message:preferredStyle:](ICDismissableAlertController, "alertControllerWithTitle:message:preferredStyle:", v21, v20, 1));
    -[ICFolderCreationController setEditTitleAlert:](self, "setEditTitleAlert:", v9);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100042DBC;
    v29[3] = &unk_100550AE8;
    v29[4] = self;
    objc_msgSend(v9, "addTextFieldWithConfigurationHandler:", v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1005704B8, 0));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100042E98;
    v27[3] = &unk_100550B10;
    v12 = v5;
    v28 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, v27));

    objc_msgSend(v9, "addAction:", v13);
    objc_msgSend(v9, "setDismissAction:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Save"), &stru_1005704B8, 0));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100042EB0;
    v24[3] = &unk_100550B38;
    v16 = v9;
    v25 = v16;
    v26 = v12;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v24));

    objc_msgSend(v17, "setEnabled:", 0);
    objc_msgSend(v16, "addAction:", v17);
    objc_msgSend(v16, "setPreferredAction:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100042F34;
    v22[3] = &unk_100550110;
    v23 = v16;
    v19 = v16;
    objc_msgSend(v18, "presentViewController:animated:completion:", v19, 1, v22);

  }
  else if (v5)
  {
    (*((void (**)(id, const __CFString *))v5 + 2))(v5, &stru_1005704B8);
  }

}

- (void)editTitleTextFieldChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  UIAccessibilityTraits v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v4 = a3;
  v5 = objc_opt_class(UITextField);
  v6 = ICDynamicCast(v5, v4);
  v28 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "text"));
  v8 = objc_opt_class(UIAlertAction);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController editTitleAlert](self, "editTitleAlert"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 1));
  v12 = ICDynamicCast(v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v28)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController editTitleAlert](self, "editTitleAlert"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v15));

      objc_msgSend(v13, "setEnabled:", objc_msgSend(v16, "length") != 0);
      v17 = objc_opt_class(UIView);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "safeValueForKey:", CFSTR("_representer")));
      v19 = ICDynamicCast(v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if ((objc_msgSend(v13, "isEnabled") & 1) != 0)
      {
        v21 = UIAccessibilityTraitNotEnabled;
        v22 = (unint64_t)objc_msgSend(v20, "accessibilityTraits") & ~v21;
      }
      else
      {
        v23 = (unint64_t)objc_msgSend(v20, "accessibilityTraits");
        v22 = UIAccessibilityTraitNotEnabled | v23;
      }
      objc_msgSend(v20, "setAccessibilityTraits:", v22);

    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder stringByScrubbingStringForFolderName:](ICFolder, "stringByScrubbingStringForFolderName:", v7));
  if ((objc_msgSend(v7, "isEqualToString:", v24) & 1) == 0)
  {
    v25 = (char *)objc_msgSend(v28, "selectionRange");
    v27 = v26;
    objc_msgSend(v28, "setText:", v24);
    if (&v25[v27] < objc_msgSend(v24, "length"))
      objc_msgSend(v28, "setSelectionRange:", v25, v27);
  }

}

- (void)showFolderDepthLimitAlert
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Can’t add folder"), &stru_1005704B8, 0));

    v5 = (char *)+[ICFolder folderDepthLimit](ICFolder, "folderDepthLimit") + 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FOLDER_DEPTH_LIMIT_MESSAGE_%lu"), &stru_1005704B8, 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController"));
    +[UIAlertController ic_showAlertWithTitle:message:viewController:](UIAlertController, "ic_showAlertWithTitle:message:viewController:", v10, v8, v9);

  }
}

- (void)showFolderComposerWithAccount:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  ICFolderComposerViewController *v8;
  void *v9;
  void *v10;
  ICFolderComposerViewController *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController"));

  if (v7)
  {
    v8 = [ICFolderComposerViewController alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController folderTitle](self, "folderTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController smartFolderQuery](self, "smartFolderQuery"));
    v11 = -[ICFolderComposerViewController initWithAccount:folderTitle:smartFolderQuery:completion:](v8, "initWithAccount:folderTitle:smartFolderQuery:completion:", v14, v9, v10, v6);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderComposerViewController ic_embedInNavigationControllerForModalPresentation](v11, "ic_embedInNavigationControllerForModalPresentation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderCreationController viewController](self, "viewController"));
    objc_msgSend(v13, "presentViewController:animated:completion:", v12, 1, 0);

  }
}

- (void)_icaxAnnounceCreatedFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Created folder: %@"), &stru_1005704B8, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6));

  ICAccessibilityPostAnnouncementNotification(self, v7);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (int64_t)creationApproach
{
  return self->_creationApproach;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (NSManagedObjectContext)viewContext
{
  return self->_viewContext;
}

- (void)setViewContext:(id)a3
{
  objc_storeStrong((id *)&self->_viewContext, a3);
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
  objc_storeStrong((id *)&self->_noteContainer, a3);
}

- (ICQuery)smartFolderQuery
{
  return self->_smartFolderQuery;
}

- (void)setSmartFolderQuery:(id)a3
{
  objc_storeStrong((id *)&self->_smartFolderQuery, a3);
}

- (NSString)folderTitle
{
  return self->_folderTitle;
}

- (void)setFolderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (ICFilterSelection)filterSelection
{
  return self->_filterSelection;
}

- (void)setFilterSelection:(id)a3
{
  objc_storeStrong((id *)&self->_filterSelection, a3);
}

- (UIAlertController)editTitleAlert
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_editTitleAlert);
}

- (void)setEditTitleAlert:(id)a3
{
  objc_storeWeak((id *)&self->_editTitleAlert, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editTitleAlert);
  objc_storeStrong((id *)&self->_filterSelection, 0);
  objc_storeStrong((id *)&self->_folderTitle, 0);
  objc_storeStrong((id *)&self->_smartFolderQuery, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end

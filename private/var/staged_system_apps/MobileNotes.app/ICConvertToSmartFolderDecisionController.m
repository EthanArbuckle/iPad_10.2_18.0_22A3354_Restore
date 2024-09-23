@implementation ICConvertToSmartFolderDecisionController

- (ICConvertToSmartFolderDecisionController)initWithSourceFolder:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  ICConvertToSmartFolderDecisionController *v9;
  ICConvertToSmartFolderDecisionController *v10;
  ICConvertToSmartFolderDecision *v11;
  ICConvertToSmartFolderDecision *decision;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICConvertToSmartFolderDecisionController;
  v9 = -[ICConvertToSmartFolderDecisionController init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceFolder, a3);
    v11 = -[ICConvertToSmartFolderDecision initWithSourceFolder:]([ICConvertToSmartFolderDecision alloc], "initWithSourceFolder:", v7);
    decision = v10->_decision;
    v10->_decision = v11;

    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (void)performDecisionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController decision](self, "decision"));
  v6 = objc_msgSend(v5, "type");

  if (v6 == (id)2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C331C;
    v10[3] = &unk_10054FFA8;
    v11 = v4;
    -[ICConvertToSmartFolderDecisionController showPreventionAlertWithCompletion:](self, "showPreventionAlertWithCompletion:", v10);
    v7 = v11;
    goto LABEL_6;
  }
  if (v6 == (id)1)
  {
    v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController decision](self, "decision"));
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Unable to convert to smart folder with decision: %@", buf, 0xCu);

    }
    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else if (!v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C32F0;
    v12[3] = &unk_1005539A0;
    v12[4] = self;
    v13 = v4;
    -[ICConvertToSmartFolderDecisionController showConfirmationAlertWithCompletion:](self, "showConfirmationAlertWithCompletion:", v12);
    v7 = v13;
LABEL_6:

  }
}

- (void)convertToSmartFolderWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *i;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  ICConvertToSmartFolderDecisionController *v30;
  const char *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void (**v51)(id, void *, void *);
  id obj;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;

  v51 = (void (**)(id, void *, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController tagDisplayText](self, "tagDisplayText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICHashtag hashtagWithDisplayText:account:createIfNecessary:](ICHashtag, "hashtagWithDisplayText:account:createIfNecessary:", v6, v5, 1));

  v8 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_loggingIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_loggingDescription"));
    *(_DWORD *)buf = 138412546;
    v60 = v10;
    v61 = 2112;
    v62 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Hashtag for conversion of manual folder (%@) to smart folder: %@", buf, 0x16u);

  }
  v12 = objc_alloc((Class)ICTagSelection);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "managedObjectContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet ic_setFromNonNilObject:](NSSet, "ic_setFromNonNilObject:", v15));
  v17 = objc_msgSend(v12, "initWithManagedObjectContext:includedObjectIDs:", v14, v16);

  v49 = v17;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuery queryForNotesMatchingTagSelection:](ICQuery, "queryForNotesMatchingTagSelection:", v17));
  v50 = (void *)v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder smartFolderWithQuery:account:](ICFolder, "smartFolderWithQuery:account:"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));

  v47 = v18;
  objc_msgSend(v18, "setParent:", 0);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "visibleNotesIncludingChildFolders"));

  obj = v21;
  v53 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v53)
  {
    v22 = *(_QWORD *)v55;
    v23 = "com.apple.notes";
    do
    {
      for (i = 0; i != v53; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v22)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v26 = os_log_create(v23, "CoreData");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ic_loggingIdentifier"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
          v29 = v22;
          v30 = self;
          v31 = v23;
          v32 = v7;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ic_loggingIdentifier"));
          *(_DWORD *)buf = 138412546;
          v60 = v27;
          v61 = 2112;
          v62 = v33;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Re-parenting note (%@) to default folder because its parent (%@) is being converted to a smart folder", buf, 0x16u);

          v7 = v32;
          v23 = v31;
          self = v30;
          v22 = v29;

        }
        v34 = objc_msgSend(v25, "addHashtagToNoteBodyIfMissing:", v7);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "account"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "defaultFolder"));
        objc_msgSend(v25, "setFolder:", v37);

        objc_msgSend(v25, "updateChangeCountWithReason:", CFSTR("Moved to default folder"));
      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v53);
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
  objc_msgSend(v38, "markForDeletion");

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder deduplicatingTitle:account:](ICFolder, "deduplicatingTitle:account:", v46, v50));
  objc_msgSend(v47, "setTitle:", v39);
  objc_msgSend(v7, "updateChangeCountWithReason:", CFSTR("Created smart folder"));
  objc_msgSend(v47, "updateChangeCountWithReason:", CFSTR("Created smart folder"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "managedObjectContext"));
  objc_msgSend(v41, "ic_save");

  v42 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "ic_loggingIdentifier"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "ic_loggingDescription"));
    *(_DWORD *)buf = 138412546;
    v60 = v44;
    v61 = 2112;
    v62 = v45;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Successfully converted (%@) to smart folder: %@", buf, 0x16u);

  }
  if (v51)
    v51[2](v51, v47, v7);

}

- (void)showConfirmationAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  if (!-[ICConvertToSmartFolderDecisionController skipAlerts](self, "skipAlerts"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Convert to Smart Folder"), &stru_1005704B8, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("“%@” will be added to each note and this folder will be turned into a Smart Folder. This can’t be undone."), &stru_1005704B8, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController tagDisplayText](self, "tagDisplayText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_withHashtagPrefix"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1005704B8, 0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Convert"), &stru_1005704B8, 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v11, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController folderSourceView](self, "folderSourceView"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController folderSourceView](self, "folderSourceView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "popoverPresentationController"));
      objc_msgSend(v19, "setSourceView:", v18);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController presentingBarButtonItem](self, "presentingBarButtonItem"));

      if (!v20)
      {
LABEL_9:
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1000C3C6C;
        v29[3] = &unk_100550B10;
        v21 = v4;
        v30 = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 1, v29));
        objc_msgSend(v16, "addAction:", v22);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000C3C84;
        v27[3] = &unk_100550B10;
        v28 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v27));
        objc_msgSend(v16, "addAction:", v23);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000C3C9C;
        v25[3] = &unk_10054FE80;
        v25[4] = self;
        v26 = v16;
        v24 = v16;
        performBlockOnMainThread(v25);

        goto LABEL_10;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController presentingBarButtonItem](self, "presentingBarButtonItem"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "popoverPresentationController"));
      objc_msgSend(v19, "setBarButtonItem:", v18);
    }

    goto LABEL_9;
  }
  if (v4)
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_10:

}

- (void)showPreventionAlertWithCompletion:(id)a3
{
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void (**v14)(void);

  v14 = (void (**)(void))a3;
  if (!-[ICConvertToSmartFolderDecisionController skipAlerts](self, "skipAlerts"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Can’t Convert Folder"), &stru_1005704B8, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController decision](self, "decision"));
    v8 = objc_msgSend(v7, "additionalStep");

    switch((unint64_t)v8)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
        if (v14)
          v14[2]();
        goto LABEL_7;
      case 3uLL:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = v10;
        v12 = CFSTR("Shared folders can’t be turned into Smart Folders.");
        goto LABEL_11;
      case 4uLL:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = v10;
        v12 = CFSTR("Folders with subfolders can’t be turned into Smart Folders.");
        goto LABEL_11;
      case 5uLL:
      case 6uLL:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = v10;
        v12 = CFSTR("Folders containing shared or locked notes can’t be turned into Smart Folders.");
LABEL_11:
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1005704B8, 0));

        break;
      default:
LABEL_7:
        v9 = 0;
        break;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController presentingViewController](self, "presentingViewController"));
    +[UIAlertController ic_showAlertWithTitle:message:viewController:](UIAlertController, "ic_showAlertWithTitle:message:viewController:", v6, v9, v13);

    goto LABEL_13;
  }
  v4 = v14;
  if (v14)
  {
    ((void (*)(void (**)(void)))v14[2])(v14);
LABEL_13:
    v4 = v14;
  }

}

- (NSString)tagDisplayText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderDecisionController sourceFolder](self, "sourceFolder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_trimmedString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_whitespaceAndNewlineCoalescedString"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_stringByReplacingCharactersInSet:withString:", v6, CFSTR("-")));

  return (NSString *)v7;
}

- (ICFolder)sourceFolder
{
  return self->_sourceFolder;
}

- (void)setSourceFolder:(id)a3
{
  objc_storeStrong((id *)&self->_sourceFolder, a3);
}

- (ICConvertToSmartFolderDecision)decision
{
  return self->_decision;
}

- (void)setDecision:(id)a3
{
  objc_storeStrong((id *)&self->_decision, a3);
}

- (BOOL)skipAlerts
{
  return self->_skipAlerts;
}

- (void)setSkipAlerts:(BOOL)a3
{
  self->_skipAlerts = a3;
}

- (UIView)folderSourceView
{
  return self->_folderSourceView;
}

- (void)setFolderSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_folderSourceView, a3);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_folderSourceView, 0);
  objc_storeStrong((id *)&self->_decision, 0);
  objc_storeStrong((id *)&self->_sourceFolder, 0);
}

@end

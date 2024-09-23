@implementation ICCollaborationUIController

- (void)associateWindowScene:(id)a3 withURL:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
    objc_msgSend(v8, "setQuery:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController windowScenesByObjectID](self, "windowScenesByObjectID"));
    objc_sync_enter(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController windowScenesByObjectID](self, "windowScenesByObjectID"));
    objc_msgSend(v11, "setObject:forKey:", v12, v9);

    objc_sync_exit(v10);
  }

}

- (id)windowSceneForURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
    objc_msgSend(v6, "setQuery:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController windowScenesByObjectID](self, "windowScenesByObjectID"));
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController windowScenesByObjectID](self, "windowScenesByObjectID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

    objc_sync_exit(v8);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)eventReporterForURL:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController windowSceneForURL:](self, "windowSceneForURL:"));
    v4 = objc_alloc((Class)ICNAEventReporter);
    v5 = objc_msgSend(v4, "initWithSubTrackerName:windowScene:", kICNASubtrackerNameCollaborationController, v3);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (ICAccount)account
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController note](self, "note"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "folder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController folder](self, "folder"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));

  }
  return (ICAccount *)v7;
}

- (id)cloudSharingControllerForObject:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  ICCollaborationUIController *v16;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortLoggingDescription"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Creating cloud sharing controller for %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v19 = 0x3032000000;
  v20 = sub_1000841AC;
  v21 = sub_1000841BC;
  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = objc_msgSend(v8, "length") == 0;

  if (v9)
  {
    v11 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100408498();

    v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000841C4;
    v13[3] = &unk_10054FC70;
    v14 = v7;
    v16 = self;
    p_buf = &buf;
    v15 = v4;
    objc_msgSend(v14, "performBlockInPersonaContext:", v13);
    v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  }
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (void)showCloudSharingControllerForFolder:(id)a3 presentingViewController:(id)a4 popoverBarButtonItem:(id)a5 presented:(id)a6 dismissed:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ICCollaborationUIController setPresentingBarButtonItem:](self, "setPresentingBarButtonItem:", v14);
  -[ICCollaborationUIController setPresentingViewController:](self, "setPresentingViewController:", v13);
  -[ICCollaborationUIController setFolder:](self, "setFolder:", v12);
  -[ICCollaborationUIController setNote:](self, "setNote:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "account"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_windowScene"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URIRepresentation"));
  -[ICCollaborationUIController associateWindowScene:withURL:](self, "associateWindowScene:withURL:", v19, v21);

  v22 = (void *)objc_opt_class(self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100084964;
  v29[3] = &unk_1005523C0;
  v29[4] = self;
  v30 = v12;
  v31 = v18;
  v32 = v14;
  v33 = v13;
  v34 = v16;
  v35 = v15;
  v23 = v15;
  v24 = v13;
  v25 = v14;
  v26 = v16;
  v27 = v18;
  v28 = v12;
  objc_msgSend(v22, "showSharingUIWithSanityChecksForFolder:presentingViewController:showSharingUIBlock:", v28, v24, v29);

}

- (void)showCloudSharingControllerForNote:(id)a3 presentingViewController:(id)a4 popoverBarButtonItem:(id)a5 presented:(id)a6 dismissed:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  ICCollaborationUIController *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ICCollaborationUIController setPresentingBarButtonItem:](self, "setPresentingBarButtonItem:", v14);
  -[ICCollaborationUIController setPresentingViewController:](self, "setPresentingViewController:", v13);
  -[ICCollaborationUIController setNote:](self, "setNote:", v12);
  -[ICCollaborationUIController setFolder:](self, "setFolder:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController account](self, "account"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_windowScene"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URIRepresentation"));
  -[ICCollaborationUIController associateWindowScene:withURL:](self, "associateWindowScene:withURL:", v18, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController note](self, "note"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100084EA0;
  v29[3] = &unk_1005523C0;
  v30 = v17;
  v31 = self;
  v32 = v12;
  v33 = v14;
  v34 = v13;
  v35 = v16;
  v36 = v15;
  v23 = v15;
  v24 = v13;
  v25 = v14;
  v26 = v16;
  v27 = v12;
  v28 = v17;
  objc_msgSend(v21, "fetchShareIfNecessaryForObject:completionHandler:", v22, v29);

}

- (void)didFailToUpdateShareWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController presentingViewController](self, "presentingViewController"));

  if (!v5)
    goto LABEL_11;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  if ((objc_msgSend(v7, "isEqualToString:", CKErrorDomain) & 1) != 0)
    goto LABEL_5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v6 = (id)v10;
LABEL_5:

  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1000841AC;
  v30 = sub_1000841BC;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Couldn’t Connect"), &stru_1005704B8, 0));

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1000841AC;
  v24 = sub_1000841BC;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("There may be a problem with the server. Please try again later."), &stru_1005704B8, 0));

  v13 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1004085F8();

  if (objc_msgSend(v6, "code") == (id)2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100085758;
    v19[3] = &unk_100552410;
    v19[4] = &v26;
    v19[5] = &v20;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v19);

  }
  v16 = v27[5];
  v17 = v21[5];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController presentingViewController](self, "presentingViewController"));
  +[UIAlertController ic_showAlertWithTitle:message:viewController:](UIAlertController, "ic_showAlertWithTitle:message:viewController:", v16, v17, v18);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

LABEL_11:
}

- (void)presentSendNoteActivityViewControllerWithPresentingWindow:(id)a3 presentingViewController:(id)a4 sourceItem:(id)a5 sourceView:(id)a6 sourceRect:(CGRect)a7 note:(id)a8 excludedTypes:(id)a9 eventReporter:(id)a10 didPresentActivityHandler:(id)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v20 = a3;
  v21 = a4;
  v22 = (unint64_t)a5;
  v23 = (unint64_t)a6;
  v24 = a8;
  v25 = a10;
  v26 = a11;
  if (v22 | v23)
  {
    v33 = v20;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ic_windowScene"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "URIRepresentation"));
    -[ICCollaborationUIController associateWindowScene:withURL:](self, "associateWindowScene:withURL:", v27, v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "visibleTopLevelAttachments"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allObjects"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100085AD4;
    v34[3] = &unk_100552488;
    v35 = v24;
    v36 = v21;
    v37 = v25;
    v38 = (id)v22;
    v39 = (id)v23;
    v41 = x;
    v42 = y;
    v43 = width;
    v44 = height;
    v40 = v26;
    v20 = v33;
    +[ICDocCamPDFGenerator generatePDFsIfNecessaryForGalleryAttachments:displayWindow:presentingViewController:completionHandler:](ICDocCamPDFGenerator, "generatePDFsIfNecessaryForGalleryAttachments:displayWindow:presentingViewController:completionHandler:", v31, v33, v36, v34);

    v32 = v35;
  }
  else
  {
    v32 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_100408658();
  }

}

- (void)presentFolderActivityViewControllerWithFolder:(id)a3 presentingViewController:(id)a4 sourceItem:(id)a5 sourceView:(id)a6 sourceRect:(CGRect)a7 completion:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void (**v27)(_QWORD);
  _QWORD *v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  void *v32;
  id v33;
  _QWORD *v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD *v42;
  _QWORD v43[4];
  id v44;
  void (**v45)(_QWORD);
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = (unint64_t)a5;
  v20 = (unint64_t)a6;
  v21 = a8;
  v22 = v21;
  if (v19 | v20)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ic_windowScene"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "URIRepresentation"));
    -[ICCollaborationUIController associateWindowScene:withURL:](self, "associateWindowScene:withURL:", v23, v25);

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10008638C;
    v49[3] = &unk_1005524D8;
    v49[4] = self;
    v26 = v17;
    v50 = v26;
    v38 = v18;
    v51 = v38;
    v52 = (id)v19;
    v53 = (id)v20;
    v55 = x;
    v56 = y;
    v57 = width;
    v58 = height;
    v27 = v22;
    v54 = v27;
    v28 = objc_retainBlock(v49);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100086498;
    v46[3] = &unk_100550160;
    v29 = v26;
    v47 = v29;
    v30 = v28;
    v48 = v30;
    v31 = objc_retainBlock(v46);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    switch((unint64_t)+[ICCollaborationController shareStatusOfFolder:objectsForMakingDecision:](ICCollaborationController, "shareStatusOfFolder:objectsForMakingDecision:", v29, v32))
    {
      case 0uLL:
      case 3uLL:
        goto LABEL_8;
      case 1uLL:
      case 2uLL:
        ((void (*)(_QWORD *))v31[2])(v31);
        break;
      case 4uLL:
        +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:", v32, v38, 0);
LABEL_8:
        if (v27)
          v27[2](v27);
        break;
      default:
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100086508;
        v43[3] = &unk_100552528;
        v33 = v29;
        v44 = v33;
        v45 = v27;
        v34 = objc_retainBlock(v43);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "rootSharedNotesIncludingChildFolders"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "rootSharedFoldersInDescendantsIncludingSelf"));
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100086740;
        v39[3] = &unk_1005502E8;
        v40 = v33;
        v41 = v34;
        v42 = v30;
        v36 = v34;
        +[ICMoveAlertUtilities postAlertForSharingFolderWithSharedNotes:sharedSubfolders:presentingViewController:shareHandler:cancelHandler:](ICMoveAlertUtilities, "postAlertForSharingFolderWithSharedNotes:sharedSubfolders:presentingViewController:shareHandler:cancelHandler:", v37, v35, v38, v39, 0);

        break;
    }

  }
  else if (v21)
  {
    (*((void (**)(id))v21 + 2))(v21);
  }

}

- (void)showFolderActivityViewControllerWithFolder:(id)a3 presentingViewController:(id)a4 sourceItem:(id)a5 sourceView:(id)a6 sourceRect:(CGRect)a7 itemProvider:(id)a8 completion:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  ICActivityItemProvider *v26;
  uint64_t v27;
  void *v28;
  ICActivityItemProvider *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[3];
  ICActivityItemProvider *v50;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v23 = a9;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1000841AC;
  v47 = sub_1000841BC;
  v48 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "managedObjectContext"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100086B54;
  v40[3] = &unk_100550660;
  v42 = &v43;
  v25 = v18;
  v41 = v25;
  objc_msgSend(v24, "performBlockAndWait:", v40);

  v26 = [ICActivityItemProvider alloc];
  v27 = v44[5];
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController shareSheetFolderThumbnailImage](ICCollaborationController, "shareSheetFolderThumbnailImage"));
  v29 = -[ICActivityItemProvider initWithItemProvider:title:image:](v26, "initWithItemProvider:title:image:", v22, v27, v28);

  v30 = objc_alloc((Class)UIActivityViewController);
  v50 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  v32 = objc_msgSend(v30, "initWithActivityItems:applicationActivities:", v31, 0);

  v49[0] = ICActivityTypeShareToNote;
  v49[1] = UIActivityTypeOpenInIBooks;
  v49[2] = UIActivityTypeSharePlay;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 3));
  objc_msgSend(v32, "setExcludedActivityTypes:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "account"));
  objc_msgSend(v32, "setIsContentManaged:", objc_msgSend(v34, "isManaged"));

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    v35 = -2;
  else
    v35 = 7;
  objc_msgSend(v32, "setModalPresentationStyle:", v35);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100086B8C;
  v38[3] = &unk_100552550;
  v36 = v25;
  v39 = v36;
  objc_msgSend(v32, "setCompletionWithItemsHandler:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "popoverPresentationController"));
  objc_msgSend(v37, "setSourceItem:", v20);
  objc_msgSend(v37, "setSourceView:", v21);
  objc_msgSend(v37, "setSourceRect:", x, y, width, height);
  objc_msgSend(v37, "setPermittedArrowDirections:", 3);
  objc_msgSend(v37, "_setIgnoreBarButtonItemSiblings:", 1);
  objc_msgSend(v19, "ic_replacePresentedViewControllerWithViewController:animated:completion:", v32, 1, v23);

  _Block_object_dispose(&v43, 8);
}

+ (void)showSharingUIWithSanityChecksForFolder:(id)a3 presentingViewController:(id)a4 showSharingUIBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void ***v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100086DDC;
  v24[3] = &unk_100550160;
  v10 = v7;
  v25 = v10;
  v11 = v9;
  v26 = v11;
  v12 = objc_retainBlock(v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  switch((unint64_t)+[ICCollaborationController shareStatusOfFolder:objectsForMakingDecision:](ICCollaborationController, "shareStatusOfFolder:objectsForMakingDecision:", v10, v13))
  {
    case 0uLL:
    case 3uLL:
      break;
    case 1uLL:
    case 2uLL:
      ((void (*)(_QWORD *))v12[2])(v12);
      break;
    case 4uLL:
      +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:", v13, v8, 0);
      break;
    default:
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = sub_100086F2C;
      v21 = &unk_100550160;
      v14 = v10;
      v22 = v14;
      v23 = v12;
      v15 = objc_retainBlock(&v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rootSharedNotesIncludingChildFolders", v18, v19, v20, v21));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rootSharedFoldersInDescendantsIncludingSelf"));
      +[ICMoveAlertUtilities postAlertForSharingFolderWithSharedNotes:sharedSubfolders:presentingViewController:shareHandler:cancelHandler:](ICMoveAlertUtilities, "postAlertForSharingFolderWithSharedNotes:sharedSubfolders:presentingViewController:shareHandler:cancelHandler:", v16, v17, v8, v15, 0);

      break;
  }

}

- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4
{
  -[ICCollaborationUIController didFailToUpdateShareWithError:](self, "didFailToUpdateShareWithError:", a4);
}

- (void)cloudSharingControllerDidSaveShare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "share"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController account](self, "account"));
  v7 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_loggingDescription"));
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cloud sharing controller did save share: %@", (uint8_t *)&v11, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v9, "didSaveShare:accountID:", v5, v10);

  -[ICCollaborationUIController populateParticipantDetailsForCloudSharingController:](self, "populateParticipantDetailsForCloudSharingController:", v4);
}

- (void)populateParticipantDetailsForCloudSharingController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
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
  id v27;
  unsigned int v28;
  ICCollaborationUIController *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "share"));
  v29 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController presentingViewController](self, "presentingViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v28 = objc_msgSend(v6, "ic_isDark");

  v7 = objc_alloc((Class)NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "participants"));
  v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "participants"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "acceptanceStatus") == (id)2)
        {
          v16 = objc_alloc_init((Class)_UIShareParticipantDetails);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userIdentity"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userRecordID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recordName"));
          objc_msgSend(v16, "setParticipantID:", v19);

          objc_msgSend(v16, "setDetailText:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "participantID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController note](v29, "note"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController highlightColorForUserID:inNote:isDark:](ICCollaborationController, "highlightColorForUserID:inNote:isDark:", v20, v21, v28));
          objc_msgSend(v16, "setParticipantColor:", v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userIdentity"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userRecordID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordName"));
          objc_msgSend(v9, "setObject:forKey:", v16, v25);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v12);
  }

  objc_msgSend(v27, "_setParticipantDetails:", v9);
}

- (void)cloudSharingControllerDidStopSharing:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "share"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController account](self, "account"));
  v6 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_loggingDescription"));
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloud sharing controller did stop sharing: %@", (uint8_t *)&v11, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  objc_msgSend(v8, "didStopSharing:recordID:accountID:", v4, v9, v10);

}

- (id)itemThumbnailDataForCloudSharingController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController note](self, "note", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController shareSheetNoteThumbnailImage](ICCollaborationController, "shareSheetNoteThumbnailImage"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController folder](self, "folder"));

    if (!v6)
    {
      v8 = 0;
      return v8;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController shareSheetFolderThumbnailImage](ICCollaborationController, "shareSheetFolderThumbnailImage"));
  }
  v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_PNGData"));

  return v8;
}

- (id)itemTypeForCloudSharingController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController note](self, "note", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shareType"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController folder](self, "folder"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shareType"));

  }
  return v7;
}

- (id)itemTitleForCloudSharingController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController note](self, "note", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController note](self, "note"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shareTitle"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController folder](self, "folder"));

    if (!v7)
    {
      v6 = 0;
      return v6;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Share Folder: %@"), &stru_1005704B8, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController folder](self, "folder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shareTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10));

  }
  return v6;
}

- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100408768(v3, v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController note](self, "note"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordID"));
  +[ICShareNotifier setShouldPreventNotifications:forRecordID:](ICShareNotifier, "setShouldPreventNotifications:forRecordID:", v3, v8);

}

- (void)_cloudSharingControllerDidActivateShowSharedFolder
{
  _QWORD v3[5];

  +[CATransaction begin](CATransaction, "begin");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000878E0;
  v3[3] = &unk_100550110;
  v3[4] = self;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v3);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)fetchAndAcceptShareMetadataWithURL:(id)a3 windowScene:(id)a4 managedObjectContext:(id)a5 alertBlock:(id)a6 showObjectBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  os_log_t v16;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    -[ICCollaborationUIController associateWindowScene:withURL:](self, "associateWindowScene:withURL:", a4, v12);
    v16 = (os_log_t)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
    -[NSObject fetchAndAcceptShareMetadataWithURL:managedObjectContext:alertBlock:showObjectBlock:](v16, "fetchAndAcceptShareMetadataWithURL:managedObjectContext:alertBlock:showObjectBlock:", v12, v13, v14, v15);
  }
  else
  {
    v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1004087E8();
  }

}

- (void)processShareAcceptanceWithMetadata:(id)a3 windowScene:(id)a4 managedObjectContext:(id)a5 alertBlock:(id)a6 showObjectBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  os_log_t v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "share"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URL"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "share"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URL"));
      -[ICCollaborationUIController associateWindowScene:withURL:](self, "associateWindowScene:withURL:", v13, v20);

    }
    v21 = (os_log_t)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
    -[NSObject processShareAcceptanceWithMetadata:managedObjectContext:alertBlock:showObjectBlock:](v21, "processShareAcceptanceWithMetadata:managedObjectContext:alertBlock:showObjectBlock:", v12, v14, v15, v16);
  }
  else
  {
    v21 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100408814();
  }

}

+ (ICCollaborationUIController)sharedInstance
{
  if (qword_1005DDEC0 != -1)
    dispatch_once(&qword_1005DDEC0, &stru_100553E40);
  return (ICCollaborationUIController *)(id)qword_1005DDEC8;
}

- (ICCollaborationUIController)init
{
  ICCollaborationUIController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCollaborationUIController;
  v2 = -[ICCollaborationUIController init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    -[ICCollaborationUIController setWindowScenesByObjectID:](v2, "setWindowScenesByObjectID:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "notesCloudContextDidFetchShare:", ICNotesCloudContextDidFetchShareNotification, 0);

  }
  return v2;
}

- (void)notesCloudContextDidFetchShare:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_log_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v3 = a3;
  v4 = objc_opt_class(CKShare);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", ICNotesCloudContextDidFetchShareNotificationShareKey));
  v7 = ICCheckedDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_opt_class(NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", ICNotesCloudContextDidFetchShareNotificationAccountIDKey));
  v12 = ICCheckedDynamicCast(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICSharedWithYouController sharedController](ICSharedWithYouController, "sharedController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "managedObjectContext"));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000BF3C4;
    v18[3] = &unk_100550020;
    v19 = v8;
    v20 = v13;
    v21 = v16;
    v17 = v16;
    -[NSObject performBlockAndWait:](v17, "performBlockAndWait:", v18);

  }
  else
  {
    v17 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10040A514(v8);

  }
}

- (void)trackCollaborationActionAddPeopleForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URIRepresentation"));
  v12 = (id)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController eventReporterForURL:](self, "eventReporterForURL:", v11));

  objc_msgSend(v12, "submitCollaborationActionEventForCloudSyncingObject:share:isInviting:inviteStep:", v9, v8, v5, 1);
}

- (void)trackCollaborationActionFirstShareForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URIRepresentation"));
  v12 = (id)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController eventReporterForURL:](self, "eventReporterForURL:", v11));

  objc_msgSend(v12, "submitCollaborationActionEventForCloudSyncingObject:share:isInviting:inviteStep:", v9, v8, v5, 2);
}

- (void)trackCollaborationActionSecondShareForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URIRepresentation"));
  v12 = (id)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController eventReporterForURL:](self, "eventReporterForURL:", v11));

  objc_msgSend(v12, "submitCollaborationActionEventForCloudSyncingObject:share:isInviting:inviteStep:", v9, v8, v5, 3);
}

- (void)trackCollaborationActionSecondCancelForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URIRepresentation"));
  v12 = (id)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController eventReporterForURL:](self, "eventReporterForURL:", v11));

  objc_msgSend(v12, "submitCollaborationActionEventForCloudSyncingObject:share:isInviting:inviteStep:", v9, v8, v5, 4);
}

- (void)trackShareActionForNote:(id)a3 activityType:(id)a4 collaborationSelected:(BOOL)a5 countOfCollaboratorsAdded:(int64_t)a6 countOfCollaboratorsRemoved:(int64_t)a7 startInvitedCount:(int64_t)a8 startAcceptedCount:(int64_t)a9 endInvitedCount:(int64_t)a10 endAcceptedCount:(int64_t)a11
{
  _BOOL8 v14;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v14 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URIRepresentation"));
  v21 = (id)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController eventReporterForURL:](self, "eventReporterForURL:", v20));

  objc_msgSend(v21, "submitNoteSharrowEventForModernNote:activityType:collaborationSelected:countOfCollaboratorsAdded:countOfCollaboratorsRemoved:startInvitedCount:startAcceptedCount:endInvitedCount:endAcceptedCount:", v18, v17, v14, a6, a7, a8, a9, a10, a11);
}

- (void)trackCollaborationNotificationAcceptanceForObject:(id)a3 shareURL:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URIRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController eventReporterForURL:](self, "eventReporterForURL:", v7));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController eventReporterForURL:](self, "eventReporterForURL:", v12));
  v11 = v10;

  objc_msgSend(v11, "submitCollabNotificationEventWithAction:", 1);
}

- (id)viewContextForCollaborationController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  return v4;
}

- (id)backgroundContextForCollaborationController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workerManagedObjectContext"));

  return v4;
}

- (id)cloudContextForCollaborationController:(id)a3
{
  return +[ICCloudContext sharedContext](ICCloudContext, "sharedContext", a3);
}

- (void)collaborationController:(id)a3 fetchShareMetadataWithURLs:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[ICSharedWithYouController sharedController](ICSharedWithYouController, "sharedController"));
  objc_msgSend(v8, "fetchShareMetadataWithURLs:completion:", v7, v6);

}

- (void)collaborationController:(id)a3 userAcceptedInvitationWithShareMetadata:(id)a4 associatedObjectID:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[ICSharedWithYouController sharedController](ICSharedWithYouController, "sharedController"));
  objc_msgSend(v8, "userAcceptedInvitationWithShareMetadata:associatedObjectID:", v7, v6);

}

- (void)collaborationController:(id)a3 persistParticipantActivityEventsOnObject:(id)a4 oldShare:(id)a5 newShare:(id)a6
{
  _objc_msgSend(a4, "persistParticipantActivityEventsWithOldShare:newShare:", a5, a6);
}

- (void)collaborationController:(id)a3 persistJoinActivityEventOnObject:(id)a4
{
  _objc_msgSend(a4, "persistJoinActivityEvent", a3);
}

- (void)collaborationController:(id)a3 persistLeaveActivityEventOnObject:(id)a4
{
  _objc_msgSend(a4, "persistLeaveActivityEvent", a3);
}

- (void)collaborationController:(id)a3 showQuotaExceededAlertIfNeededWithRecordID:(id)a4 accountID:(id)a5
{
  id v7;
  id v8;
  ICQuotaExceededAlertController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICQuotaExceededAlertController *v14;

  v7 = a5;
  v8 = a4;
  v9 = [ICQuotaExceededAlertController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v14 = -[ICQuotaExceededAlertController initWithRecordID:accountID:date:](v9, "initWithRecordID:accountID:date:", v8, v7, v10);

  -[ICQuotaExceededAlertController setIgnoresDebouncing:](v14, "setIgnoresDebouncing:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationUIController presentingViewController](self, "presentingViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_windowScene"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyWindow"));

  if (v13)
    -[ICQuotaExceededAlertController showIfNeededFromWindow:](v14, "showIfNeededFromWindow:", v13);

}

- (void)collaborationController:(id)a3 didFailToSaveShareWithError:(id)a4
{
  -[ICCollaborationUIController didFailToUpdateShareWithError:](self, "didFailToUpdateShareWithError:", a4);
}

- (CKShare)newlyCreatedShare
{
  return self->_newlyCreatedShare;
}

- (NSMapTable)windowScenesByObjectID
{
  return self->_windowScenesByObjectID;
}

- (void)setWindowScenesByObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_windowScenesByObjectID, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, a3);
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_windowScenesByObjectID, 0);
  objc_storeStrong((id *)&self->_newlyCreatedShare, 0);
}

@end

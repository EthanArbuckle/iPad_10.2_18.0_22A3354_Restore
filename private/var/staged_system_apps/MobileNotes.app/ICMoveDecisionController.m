@implementation ICMoveDecisionController

- (ICMoveDecisionController)initWithSourceObjects:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  ICMoveDecisionController *v9;
  ICFolder *v10;
  uint64_t v11;
  uint64_t v12;
  ICFolder *sourceFolder;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICMoveDecisionController;
  v9 = -[ICMoveDecisionController init](&v15, "init");
  if (v9)
  {
    if (objc_msgSend(v7, "count"))
    {
      v10 = (ICFolder *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      v11 = objc_opt_class(ICFolder);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
        sourceFolder = v9->_sourceFolder;
        v9->_sourceFolder = (ICFolder *)v12;
      }
      else
      {
        sourceFolder = v9->_sourceFolder;
        v9->_sourceFolder = 0;
      }

    }
    else
    {
      v10 = v9->_sourceFolder;
      v9->_sourceFolder = 0;
    }

    objc_storeStrong((id *)&v9->_sourceObjects, a3);
    objc_storeStrong((id *)&v9->_presentingViewController, a4);
  }

  return v9;
}

+ (void)postAdditionalStepAlertForMoveDecision:(id)a3 isCopy:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  switch((unint64_t)objc_msgSend(v10, "additionalStep"))
  {
    case 1uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultPresentingViewController"));
      +[ICMoveAlertUtilities postAlertForFolderDepthLimitWithPresentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForFolderDepthLimitWithPresentingViewController:completionHandler:", v6, 0);
      goto LABEL_9;
    case 2uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultPresentingViewController"));
      +[ICMoveAlertUtilities postAlertForMovingLockedNotesToOtherAccountIsCopy:presentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForMovingLockedNotesToOtherAccountIsCopy:presentingViewController:completionHandler:", v4, v6, 0);
      goto LABEL_9;
    case 3uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guiltyObjects"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultPresentingViewController"));
      +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:", v6, v7, 0);
      goto LABEL_8;
    case 4uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultPresentingViewController"));
      +[ICMoveAlertUtilities postAlertForMovingSharedNotesToAnotherAccountWithPresentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForMovingSharedNotesToAnotherAccountWithPresentingViewController:completionHandler:", v6, 0);
      goto LABEL_9;
    case 5uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "htmlDestinationFolder"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultPresentingViewController"));
      +[ICMoveAlertUtilities postAlertForUnsupportedAttachmentsInLegacyAccount:presentingViewController:](ICMoveAlertUtilities, "postAlertForUnsupportedAttachmentsInLegacyAccount:presentingViewController:", v8, v9);

      goto LABEL_9;
    case 0xDuLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modernDestinationAccount"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultPresentingViewController"));
      +[ICMoveAlertUtilities postAlertForMovingSmartFolderWithRestrictedFilterToLocalAccount:presentingViewController:](ICMoveAlertUtilities, "postAlertForMovingSmartFolderWithRestrictedFilterToLocalAccount:presentingViewController:", v6, v7);
LABEL_8:

LABEL_9:
      break;
    default:
      break;
  }

}

+ (void)moveNotesWithDeletingShares:(id)a3 destination:(id)a4 isCopy:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004CDA8;
  v20[3] = &unk_100550160;
  v13 = v10;
  v21 = v13;
  v14 = v12;
  v22 = v14;
  v15 = objc_retainBlock(v20);
  v16 = v15;
  if (v7)
  {
    ((void (*)(_QWORD *))v15[2])(v15);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultPresentingViewController"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004CF70;
    v18[3] = &unk_10054FFA8;
    v19 = v14;
    +[ICMoveAlertUtilities postAlertForMovingNotesContainingSharedNotesToSharedFolder:destination:presentingViewController:shareHandler:cancelHandler:](ICMoveAlertUtilities, "postAlertForMovingNotesContainingSharedNotesToSharedFolder:destination:presentingViewController:shareHandler:cancelHandler:", v13, v11, v17, v16, v18);

  }
}

+ (void)moveFolderWithDeletingShares:(id)a3 destination:(id)a4 isCopy:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10004D10C;
  v22[3] = &unk_100550160;
  v13 = v10;
  v23 = v13;
  v14 = v12;
  v24 = v14;
  v15 = objc_retainBlock(v22);
  v16 = v15;
  if (v7)
  {
    ((void (*)(_QWORD *))v15[2])(v15);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rootSharedNotesIncludingChildFolders"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rootSharedFoldersInDescendantsIncludingSelf"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultPresentingViewController"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10004D2B8;
    v20[3] = &unk_10054FFA8;
    v21 = v14;
    +[ICMoveAlertUtilities postAlertForMovingFolderWithSharedNotes:sharedSubfolders:destination:presentingViewController:shareHandler:cancelHandler:](ICMoveAlertUtilities, "postAlertForMovingFolderWithSharedNotes:sharedSubfolders:destination:presentingViewController:shareHandler:cancelHandler:", v17, v18, v11, v19, v16, v20);

  }
}

- (void)performDecision
{
  -[ICMoveDecisionController performDecisionWithCompletion:](self, "performDecisionWithCompletion:", 0);
}

- (void)performDecisionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICMoveNavigationController *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController destination](self, "destination"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController destination](self, "destination"));
    -[ICMoveDecisionController moveSourceObjectsToDestination:completionHandler:](self, "moveSourceObjectsToDestination:completionHandler:", v6, v4);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController presentingViewController](self, "presentingViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_viewControllerManager"));

    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController sourceObjects](self, "sourceObjects"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_map:", &stru_100550E80));

      v10 = -[ICMoveNavigationController initWithViewControllerManager:sourceObjectIds:]([ICMoveNavigationController alloc], "initWithViewControllerManager:sourceObjectIds:", v6, v9);
      objc_initWeak(&location, v10);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10004D4E0;
      v13[3] = &unk_100550EA8;
      objc_copyWeak(&v15, &location);
      v13[4] = self;
      v14 = v4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveNavigationController moveViewController](v10, "moveViewController"));
      objc_msgSend(v11, "setCompletionHandler:", v13);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController presentingViewController](self, "presentingViewController"));
      objc_msgSend(v12, "presentViewController:animated:completion:", v10, 1, 0);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);

    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((viewControllerManager) != nil)", "-[ICMoveDecisionController performDecisionWithCompletion:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "viewControllerManager");
    }
  }

}

- (void)moveSourceObjectsToDestination:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  char v15;
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
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  id v46;
  id v47;
  _QWORD *v48;
  id v49;
  id v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  _QWORD *v59;
  id v60;
  _QWORD v61[4];
  _QWORD *v62;
  id v63;
  _QWORD v64[5];
  id v65;
  id v66;
  _QWORD v67[5];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)ICMoveDecision);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController sourceObjects](self, "sourceObjects"));
  v10 = objc_msgSend(v8, "initWithSourceObjects:destination:", v9, v6);
  -[ICMoveDecisionController setMoveDecision:](self, "setMoveDecision:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
  LODWORD(v9) = objc_msgSend(v11, "shouldProceed");

  if (!(_DWORD)v9)
  {
    if (!v7)
      goto LABEL_39;
    goto LABEL_32;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
  v13 = objc_msgSend(v12, "additionalStep");

  v14 = 0;
  v15 = 1;
  switch((unint64_t)v13)
  {
    case 1uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController presentingViewController](self, "presentingViewController"));
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_10004DFD0;
      v70[3] = &unk_10054FFA8;
      v71 = v7;
      +[ICMoveAlertUtilities postAlertForFolderDepthLimitWithPresentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForFolderDepthLimitWithPresentingViewController:completionHandler:", v16, v70);

      v17 = v71;
      goto LABEL_23;
    case 2uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController presentingViewController](self, "presentingViewController"));
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_10004DFB4;
      v72[3] = &unk_10054FFA8;
      v73 = v7;
      +[ICMoveAlertUtilities postAlertForMovingLockedNotesToOtherAccountIsCopy:presentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForMovingLockedNotesToOtherAccountIsCopy:presentingViewController:completionHandler:", 0, v18, v72);

      v17 = v73;
      goto LABEL_23;
    case 3uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController sourceFolder](self, "sourceFolder"));

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "guiltyObjects"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController presentingViewController](self, "presentingViewController"));
        v78[0] = _NSConcreteStackBlock;
        v78[1] = 3221225472;
        v78[2] = sub_10004DF60;
        v78[3] = &unk_10054FFA8;
        v79 = v7;
        +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:", v21, v22, v78);

        v17 = v79;
      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController sourceObjects](self, "sourceObjects"));
        v40 = objc_msgSend(v39, "count");
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "guiltyObjects"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController presentingViewController](self, "presentingViewController"));
        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = sub_10004DF7C;
        v76[3] = &unk_10054FFA8;
        v77 = v7;
        +[ICMoveAlertUtilities postAlertForMovingLockedOrSingleJoinedNotesToSharedFolderWithCountOfNotes:guiltyObjects:presentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForMovingLockedOrSingleJoinedNotesToSharedFolderWithCountOfNotes:guiltyObjects:presentingViewController:completionHandler:", v40, v42, v43, v76);

        v17 = v77;
      }
      goto LABEL_23;
    case 4uLL:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController presentingViewController](self, "presentingViewController"));
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_10004DF98;
      v74[3] = &unk_10054FFA8;
      v75 = v7;
      +[ICMoveAlertUtilities postAlertForMovingSharedNotesToAnotherAccountWithPresentingViewController:completionHandler:](ICMoveAlertUtilities, "postAlertForMovingSharedNotesToAnotherAccountWithPresentingViewController:completionHandler:", v23, v74);

      v17 = v75;
LABEL_23:

      v15 = 0;
      goto LABEL_24;
    case 6uLL:
      v14 = 1;
      break;
    case 7uLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "guiltyObjects"));
      v27 = v24;
      v28 = v26;
      v29 = 1;
      goto LABEL_13;
    case 8uLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "guiltyObjects"));
      v27 = v24;
      v28 = v26;
      v29 = 0;
LABEL_13:
      objc_msgSend(v27, "undoablyMarkNotes:asSystemPaper:", v28, v29);
      goto LABEL_20;
    case 9uLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "guiltyObjects"));
      v30 = v24;
      v31 = v26;
      v32 = 1;
      goto LABEL_16;
    case 0xAuLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "guiltyObjects"));
      v30 = v24;
      v31 = v26;
      v32 = 0;
LABEL_16:
      objc_msgSend(v30, "undoablyMarkNotes:asMathNotes:", v31, v32);
      goto LABEL_20;
    case 0xBuLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "guiltyObjects"));
      v33 = v24;
      v34 = v26;
      v35 = 1;
      goto LABEL_19;
    case 0xCuLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "guiltyObjects"));
      v33 = v24;
      v34 = v26;
      v35 = 0;
LABEL_19:
      objc_msgSend(v33, "undoablyMarkNotes:asCallNotes:", v34, v35);
LABEL_20:

LABEL_24:
      v14 = 0;
      break;
    case 0xDuLL:
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "modernDestinationAccount"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController presentingViewController](self, "presentingViewController"));
      +[ICMoveAlertUtilities postAlertForMovingSmartFolderWithRestrictedFilterToLocalAccount:presentingViewController:](ICMoveAlertUtilities, "postAlertForMovingSmartFolderWithRestrictedFilterToLocalAccount:presentingViewController:", v37, v38);

      v14 = 0;
      v15 = 1;
      break;
    default:
      break;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
  v45 = objc_msgSend(v44, "shouldMove");

  if (v45)
  {
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10004DFEC;
    v67[3] = &unk_10054FEA8;
    v67[4] = self;
    v46 = v6;
    v68 = v46;
    v47 = v7;
    v69 = v47;
    v48 = objc_retainBlock(v67);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10004E1B0;
    v64[3] = &unk_10054FEA8;
    v64[4] = self;
    v49 = v46;
    v65 = v49;
    v50 = v47;
    v66 = v50;
    v51 = objc_retainBlock(v64);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController sourceFolder](self, "sourceFolder"));

    if (v14)
    {
      if (v52)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController sourceFolder](self, "sourceFolder"));
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10004E564;
        v61[3] = &unk_100550EF8;
        v62 = v48;
        v63 = v50;
        +[ICMoveDecisionController moveFolderWithDeletingShares:destination:isCopy:completionHandler:](ICMoveDecisionController, "moveFolderWithDeletingShares:destination:isCopy:completionHandler:", v53, v49, 0, v61);

        v54 = v62;
      }
      else
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveDecisionController moveDecision](self, "moveDecision"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "modernNotes"));
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_10004E590;
        v58[3] = &unk_100550EF8;
        v59 = v51;
        v60 = v50;
        +[ICMoveDecisionController moveNotesWithDeletingShares:destination:isCopy:completionHandler:](ICMoveDecisionController, "moveNotesWithDeletingShares:destination:isCopy:completionHandler:", v57, v49, 0, v58);

        v54 = v59;
      }

    }
    else if (v52)
    {
      ((void (*)(_QWORD *))v48[2])(v48);
    }
    else
    {
      ((void (*)(_QWORD *))v51[2])(v51);
    }

    goto LABEL_39;
  }
  v55 = v15 ^ 1;
  if (!v7)
    v55 = 1;
  if ((v55 & 1) == 0)
LABEL_32:
    (*((void (**)(id, void *))v7 + 2))(v7, &__NSArray0__struct);
LABEL_39:

}

- (UIViewController)presentingViewController
{
  UIViewController *presentingViewController;
  id v4;

  presentingViewController = self->_presentingViewController;
  if (presentingViewController)
    return presentingViewController;
  v4 = objc_msgSend((id)objc_opt_class(self), "defaultPresentingViewController");
  return (UIViewController *)(id)objc_claimAutoreleasedReturnValue(v4);
}

+ (id)defaultPresentingViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyWindow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyWindow"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootViewController"));

  }
  return v7;
}

- (void)announceMoveToDestination:(id)a3 delay:(double)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E778;
  v8[3] = &unk_100550338;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  dispatchMainAfterDelay(v8, a4);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workerContext, a3);
}

- (NSArray)sourceObjects
{
  return self->_sourceObjects;
}

- (ICMoveDecision)moveDecision
{
  return self->_moveDecision;
}

- (void)setMoveDecision:(id)a3
{
  objc_storeStrong((id *)&self->_moveDecision, a3);
}

- (id)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong(&self->_destination, a3);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (ICFolder)sourceFolder
{
  return self->_sourceFolder;
}

- (void)setSourceFolder:(id)a3
{
  objc_storeStrong((id *)&self->_sourceFolder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceFolder, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong(&self->_destination, 0);
  objc_storeStrong((id *)&self->_moveDecision, 0);
  objc_storeStrong((id *)&self->_sourceObjects, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
}

@end

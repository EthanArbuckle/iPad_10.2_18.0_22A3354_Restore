@implementation RCShareMemoViewController

+ (RCShareMemoViewController)presentedController
{
  return (RCShareMemoViewController *)objc_loadWeakRetained(&qword_1001ED870);
}

+ (void)setPresentedController:(id)a3
{
  objc_storeWeak(&qword_1001ED870, a3);
}

+ (void)presentInViewController:(id)a3 source:(id)a4 compositions:(id)a5 ignoringInteraction:(BOOL)a6 shouldContinuePreparingBlock:(id)a7 preparedToPresentBlock:(id)a8 isShareButton:(BOOL)a9 completionWithItemsHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  id v22;
  _QWORD *v23;
  id v24;
  id v25;
  _QWORD *v26;
  _BOOL4 v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;

  v27 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10003FBBC;
  v38[3] = &unk_1001ABE60;
  v39 = a8;
  v28 = v39;
  v19 = a10;
  v20 = objc_retainBlock(v38);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10003FBD0;
  v36[3] = &unk_1001ABEB8;
  v37 = v18;
  v21 = v18;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003FBE8;
  v29[3] = &unk_1001ABF00;
  v30 = v15;
  v31 = v16;
  v34 = objc_retainBlock(v36);
  v35 = a1;
  v32 = v17;
  v33 = v20;
  v22 = v17;
  v23 = v34;
  v24 = v16;
  v25 = v15;
  v26 = v20;
  +[RCShareMemoViewController prepareToShareCompositions:ignoringInteraction:source:isShareButton:shouldContinuePreparingBlock:preparedHandler:completionWithItemsHandler:](RCShareMemoViewController, "prepareToShareCompositions:ignoringInteraction:source:isShareButton:shouldContinuePreparingBlock:preparedHandler:completionWithItemsHandler:", v22, v27, v24, a9, v23, v29, v19);

}

+ (void)prepareToShareCompositions:(id)a3 ignoringInteraction:(BOOL)a4 source:(id)a5 isShareButton:(BOOL)a6 shouldContinuePreparingBlock:(id)a7 preparedHandler:(id)a8 completionWithItemsHandler:(id)a9
{
  id v10;
  void (**v11)(id, RCShareMemoViewController *, _QWORD);
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  RCShareMemoViewController *v23;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v10 = a3;
  v11 = (void (**)(id, RCShareMemoViewController *, _QWORD))a8;
  v25 = a9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "composedAVURL"));
        v26 = 0;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "prepareToExportCompositionAVURL:error:", v20, &v26));

        if (v21)
          objc_msgSend(v12, "addObject:", v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  v22 = objc_msgSend(v12, "count");
  if (v22 == objc_msgSend(v13, "count"))
  {
    v23 = -[RCShareMemoViewController initWithCompositions:accessTokens:]([RCShareMemoViewController alloc], "initWithCompositions:accessTokens:", v13, v12);
    +[RCShareMemoViewController setPresentedController:](RCShareMemoViewController, "setPresentedController:", v23);
    if (!a6)
      -[RCShareMemoViewController setSharingStyle:](v23, "setSharingStyle:", 1);
    if (v25)
      -[RCShareMemoViewController setCompletionWithItemsHandler:](v23, "setCompletionWithItemsHandler:", v25);
    v11[2](v11, v23, 0);

  }
}

- (RCShareMemoViewController)initWithCompositions:(id)a3 accessTokens:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  RCShareMemoViewController *v11;
  RCShareMemoViewController *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoHelper shareableCompositionsFromCompositions:](RCShareMemoHelper, "shareableCompositionsFromCompositions:", v7));
  if (-[RCShareMemoViewController isRecentlyDeletedShown](self, "isRecentlyDeletedShown"))
    v10 = 0;
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoHelper customActivitiesForShareableCompositions:](RCShareMemoHelper, "customActivitiesForShareableCompositions:", v9));
  v16.receiver = self;
  v16.super_class = (Class)RCShareMemoViewController;
  v11 = -[RCShareMemoViewController initWithActivityItems:applicationActivities:](&v16, "initWithActivityItems:applicationActivities:", v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_shareableCompositions, v9);
    objc_storeStrong((id *)&v12->_compositions, a3);
    objc_storeStrong((id *)&v12->_accessTokens, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoHelper customActivityTypes](RCShareMemoHelper, "customActivityTypes"));
    -[RCShareMemoViewController setActivityTypeOrder:](v12, "setActivityTypeOrder:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoHelper unsupportedActivityTypes](RCShareMemoHelper, "unsupportedActivityTypes"));
    -[RCShareMemoViewController setExcludedActivityTypes:](v12, "setExcludedActivityTypes:", v14);

    -[RCShareMemoViewController setShowKeyboardAutomatically:](v12, "setShowKeyboardAutomatically:", 1);
  }

  return v12;
}

- (void)_endAccessSession
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSArray *accessTokens;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (-[NSArray count](self->_accessTokens, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = self->_accessTokens;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService", (_QWORD)v11));
          objc_msgSend(v9, "endAccessSessionWithToken:error:", v8, 0);

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    accessTokens = self->_accessTokens;
    self->_accessTokens = 0;

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  +[RCAnalyticsUtilities sendDidOpenShareMemoController](RCAnalyticsUtilities, "sendDidOpenShareMemoController");
  v5.receiver = self;
  v5.super_class = (Class)RCShareMemoViewController;
  -[RCShareMemoViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[RCShareMemoViewController _endAccessSession](self, "_endAccessSession");
  +[RCShareMemoViewController setPresentedController:](RCShareMemoViewController, "setPresentedController:", 0);
  v5.receiver = self;
  v5.super_class = (Class)RCShareMemoViewController;
  -[RCShareMemoViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)isRecentlyDeletedShown
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultSceneDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainViewController"));

  LOBYTE(v4) = objc_msgSend(v5, "isShowingRecentlyDeleted");
  return (char)v4;
}

+ (id)_newPresentedPrepareFailureAlertControllerForCompositions:(id)a3 source:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PREPARE_TO_SHARE_MEMO_FAILED_TITLE"), &stru_1001B2BC0, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PREPARE_TO_SHARE_MEMOS_FAILED_MESSAGE_FORMAT"), &stru_1001B2BC0, 0));
  v11 = objc_msgSend(v6, "count");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v12, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1001B2BC0, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, 0));
  objc_msgSend(v13, "addAction:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rootViewController"));

  objc_msgSend(v13, "rc_configurePopoverControllerWithSource:", v5);
  objc_msgSend(v20, "presentViewController:animated:completion:", v13, 1, 0);

  return v13;
}

- (NSArray)compositions
{
  return self->_compositions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositions, 0);
  objc_storeStrong((id *)&self->_shareableCompositions, 0);
  objc_storeStrong((id *)&self->_accessTokens, 0);
}

@end

@implementation RCMainViewController

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return (unint64_t)v3;
}

- (void)setIsInForeground:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  id foregroundCompletionBlock;

  if (self->_isInForeground != a3)
  {
    self->_isInForeground = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController foregroundCompletionBlock](self, "foregroundCompletionBlock"));

      if (v4)
      {
        v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RCMainViewController foregroundCompletionBlock](self, "foregroundCompletionBlock"));
        v5[2]();

        foregroundCompletionBlock = self->_foregroundCompletionBlock;
        self->_foregroundCompletionBlock = 0;

      }
    }
  }
}

- (void)stopPlayback
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v2, "stopPlayback");

}

- (RCMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  RCMainViewController *v4;
  RCMainViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCMainViewController;
  v4 = -[RCMainViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[RCMainViewController _commonInit](v4, "_commonInit");
  return v5;
}

- (void)finishInitialSetup:(id)a3 goToAllRecordings:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(void);
  void *v7;
  void (**v8)(void);

  v4 = a4;
  v6 = (void (**)(void))a3;
  if (v4)
  {
    v8 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    objc_msgSend(v7, "goToBuiltInFolderOfType:animated:completion:", 0, 0, v8);

LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  if (v6)
  {
    v8 = v6;
    v6[2]();
    goto LABEL_5;
  }
LABEL_6:

}

- (void)didSelectFolderOfType:(int64_t)a3
{
  void *v4;

  -[RCMainViewController stopPlayback](self, "stopPlayback", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v4, "clear");

  -[RCMainViewController updatePlaybackContentUnavailableViewIfNeeded](self, "updatePlaybackContentUnavailableViewIfNeeded");
}

- (void)handleEndOfWelcome
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)didSelectForUUID:(id)a3 resetPosition:(BOOL)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;

  v5 = a5;
  v6 = a4;
  v31 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:", v31));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v9, "stopScrolling");
  if (v31)
  {
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuidBeingDisplayed"));
      v11 = objc_msgSend(v10, "isEqualToString:", v31);

      if (!v11 || v5)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentUnavailableConfiguration"));
        v13 = v12 != 0;

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
        objc_msgSend(v14, "prepareForPlaybackForUUID:force:", v31, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuidBeingDisplayed"));
        if (v15 && (objc_msgSend(v31, "isEqualToString:", v15) & 1) == 0)
          objc_msgSend(v14, "stopForUUID:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "compositionForUUID:", v31));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedRecording"));

        objc_msgSend(v9, "updateWithRecordingModel:", v8);
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentRecordingDisplayModel"));

          if (v19 != v8)
            objc_msgSend(v14, "setCurrentRecordingDisplayModel:", v8);
        }
        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));

        if (!v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
          v30 = v15;
          v22 = v6;
          v23 = v18;
          v24 = v16;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeController"));
          objc_msgSend(v9, "enablePlaybackWithComposition:displayModel:timeController:", v24, v8, v25);

          v16 = v24;
          v18 = v23;
          v6 = v22;
          v15 = v30;

        }
        +[CATransaction commit](CATransaction, "commit");
        -[RCMainViewController updatePlaybackContentUnavailableViewIfNeeded](self, "updatePlaybackContentUnavailableViewIfNeeded");
        if ((objc_msgSend(v14, "isPlayingForUUID:", v31) & 1) == 0)
        {
          if (v6)
          {
            objc_msgSend(v14, "setCurrentTime:", 0.0);
          }
          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeController"));
            objc_msgSend(v26, "currentTime");
            v28 = v27;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeController"));
            objc_msgSend(v29, "setTargetTime:", v28);

          }
        }

      }
    }
  }

}

- (void)performDelayedSetup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));
  objc_msgSend(v4, "performDelayedSetup");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setBackButtonTitle:", CFSTR(" "));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v6, "startMonitoringFinalizingRecordings");

}

- (void)updateNavBarTitleAndDeleteButtonForRecordingsCount:(unint64_t)a3 isEditMode:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentActiveFolderViewController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

  if (v8)
    objc_msgSend(v9, "updateNavBarTitleAndDeleteButtonForRecordingsCount:isEditMode:", a3, v4);

}

- (void)updatePlaybackContentUnavailableViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeRecordingsCollectionViewController"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordingsDataCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingDataArray"));
    v7 = objc_msgSend(v6, "count");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuidBeingDisplayed"));

    if ((objc_msgSend(v13, "isEditing") & 1) != 0)
      v10 = 0;
    else
      v10 = (v7 != 0) & ~objc_msgSend(v13, "willSelectRecordingAfterExitingEditMode");
    if (v9)
      v11 = -1;
    else
      v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    objc_msgSend(v12, "updateContentUnavailableViewState:", v11);

  }
}

- (RCPlaybackViewController)playbackViewController
{
  return (RCPlaybackViewController *)objc_loadWeakRetained((id *)&self->_playbackViewController);
}

- (void)_commonInit
{
  RCMainControllerHelper *v3;
  RCMainControllerHelper *mainControllerHelper;
  RCRecordingsModelInteractor *v5;
  RCRecordingsModelInteractor *recordingsModelInteractor;
  RCUndoManager *v7;
  RCUndoManager *currentUndoManager;
  NSMutableDictionary *v9;
  NSMutableDictionary *editingProgressItems;
  void *v11;
  void *v12;
  UIBarButtonItem *v13;
  UIBarButtonItem *createNewFolderButtonItem;
  void *v15;
  void *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *flexBarItem;
  RCFolderBrowsingCollectionViewController *v19;

  v19 = objc_opt_new(RCFolderBrowsingCollectionViewController);
  -[RCFolderBrowsingCollectionViewController setLibraryActionHandler:](v19, "setLibraryActionHandler:", self);
  -[RCFolderBrowsingCollectionViewController setRecordingViewControllerDelegate:](v19, "setRecordingViewControllerDelegate:", self);
  -[RCFoldersCollectionViewController setSelectionDelegate:](v19, "setSelectionDelegate:", self);
  -[RCFolderBrowsingCollectionViewController setBrowsingDelegate:](v19, "setBrowsingDelegate:", self);
  -[RCMainViewController setBrowseFoldersViewController:](self, "setBrowseFoldersViewController:", v19);
  -[RCMainViewController addChildViewController:](self, "addChildViewController:", v19);
  -[RCFolderBrowsingCollectionViewController didMoveToParentViewController:](v19, "didMoveToParentViewController:", self);
  v3 = objc_opt_new(RCMainControllerHelper);
  mainControllerHelper = self->_mainControllerHelper;
  self->_mainControllerHelper = v3;

  -[RCMainControllerHelper setDelegate:](self->_mainControllerHelper, "setDelegate:", self);
  v5 = (RCRecordingsModelInteractor *)objc_claimAutoreleasedReturnValue(+[RCRecordingsModelInteractor sharedRecordingsModelInteractor](RCRecordingsModelInteractor, "sharedRecordingsModelInteractor"));
  recordingsModelInteractor = self->_recordingsModelInteractor;
  self->_recordingsModelInteractor = v5;

  v7 = objc_opt_new(RCUndoManager);
  currentUndoManager = self->_currentUndoManager;
  self->_currentUndoManager = v7;

  -[RCFolderBrowsingCollectionViewController setUndoManager:](v19, "setUndoManager:", self->_currentUndoManager);
  -[RCMainViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  v9 = objc_opt_new(NSMutableDictionary);
  editingProgressItems = self->_editingProgressItems;
  self->_editingProgressItems = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "createNewFolderImage"));

  v13 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v12, 0, self, "_handleNewFolder");
  createNewFolderButtonItem = self->_createNewFolderButtonItem;
  self->_createNewFolderButtonItem = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AX_NEW_FOLDER"), &stru_1001B2BC0, 0));
  -[UIBarButtonItem setAccessibilityLabel:](self->_createNewFolderButtonItem, "setAccessibilityLabel:", v16);

  v17 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, self, 0);
  flexBarItem = self->_flexBarItem;
  self->_flexBarItem = v17;

}

- (id)contentScrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionViewIfLoaded"));

  return v3;
}

- (RCFolderBrowsingCollectionViewController)browseFoldersViewController
{
  return self->_browseFoldersViewController;
}

- (BOOL)isPlayingForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v6 = objc_msgSend(v5, "isPlayingForUUID:", v4);

  return v6;
}

- (RCMainControllerHelper)mainControllerHelper
{
  return self->_mainControllerHelper;
}

- (double)currentTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v2, "currentTime");
  v4 = v3;

  return v4;
}

- (RCPlaybackSettings)playbackSettings
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  double v7;
  RCPlaybackSettings *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRecordingDisplayModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  if (v4)
  {
    v5 = objc_msgSend(v3, "isEnhanced");
    v6 = objc_msgSend(v2, "isSilenceRemovedForUUID:", v4);
    objc_msgSend(v2, "playbackSpeedForUUID:", v4);
    v8 = -[RCPlaybackSettings initWithUUID:enhanced:silenceRemoved:playbackSpeed:]([RCPlaybackSettings alloc], "initWithUUID:enhanced:silenceRemoved:playbackSpeed:", v4, v5, v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setPlaybackViewController:(id)a3
{
  objc_storeWeak((id *)&self->_playbackViewController, a3);
}

- (void)setMainViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mainViewControllerDelegate, a3);
}

- (void)setBrowseFoldersViewController:(id)a3
{
  objc_storeStrong((id *)&self->_browseFoldersViewController, a3);
}

- (id)foregroundCompletionBlock
{
  return self->_foregroundCompletionBlock;
}

- (VMAudioRecorder)audioRecorder
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "audioRecorder"));

  return (VMAudioRecorder *)v3;
}

- (VMAudioPlayer)audioPlayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "audioPlayer"));

  return (VMAudioPlayer *)v3;
}

- (id)recordingInProgressUUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingInProgressUUID"));

  return v3;
}

- (void)openSidebar
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v2, "showColumn:", 0);

}

- (void)closeSidebar
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
  v5 = objc_opt_class(RCSplitViewController, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
    if (objc_msgSend(v8, "isCollapsedAndShowingPrimary"))
    {
      -[RCMainViewController goToAllRecordingsIfNeeded:completion:](self, "goToAllRecordingsIfNeeded:completion:", 1, 0);
    }
    else if ((objc_msgSend(v8, "isCollapsed") & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
      objc_msgSend(v7, "hideColumn:", 0);

    }
  }
}

- (void)goToFolderOfType:(int64_t)a3 withName:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a5;
  v13 = a4;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v12 = v11;
  if (a3 == 4)
    objc_msgSend(v11, "goToUserFolderWithName:animated:completion:", v13, v7, v10);
  else
    objc_msgSend(v11, "goToBuiltInFolderOfType:animated:completion:", a3, v7, v10);

}

- (id)activeFolderViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentActiveFolderViewController"));

  return v3;
}

- (void)setState:(int64_t)a3
{
  -[RCMainViewController setState:withOptions:completion:](self, "setState:withOptions:completion:", a3, 0, 0);
}

- (void)setState:(int64_t)a3 withOptions:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3 == 1)
    {
      v9 = v8;
      -[RCMainViewController _transitionToCaptureAndModifyWithOptions:completion:](self, "_transitionToCaptureAndModifyWithOptions:completion:", a4, v8);
      goto LABEL_6;
    }
    if (!a3)
    {
      v9 = v8;
      -[RCMainViewController _transitionToBrowsing:](self, "_transitionToBrowsing:", v8);
LABEL_6:
      v8 = v9;
    }
  }

}

- (void)setForegroundCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id foregroundCompletionBlock;
  unsigned int v16;
  id v17;

  v4 = (void (**)(_QWORD))a3;
  if (self->_foregroundCompletionBlock)
  {
    v5 = OSLogForCategory(kVMLogCategoryDefault);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10010D424(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = objc_msgSend(v4, "copy");
  foregroundCompletionBlock = self->_foregroundCompletionBlock;
  self->_foregroundCompletionBlock = v14;

  v16 = -[RCMainViewController isInForeground](self, "isInForeground");
  if (v4 && v16)
  {
    v4[2](v4);
    v17 = self->_foregroundCompletionBlock;
    self->_foregroundCompletionBlock = 0;

  }
}

- (BOOL)isRecording
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v3 = objc_msgSend(v2, "isRecording");

  return v3;
}

- (RCMainViewController)initWithCoder:(id)a3
{
  RCMainViewController *v3;
  RCMainViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCMainViewController;
  v3 = -[RCMainViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RCMainViewController _commonInit](v3, "_commonInit");
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)loadView
{
  RCMainView *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCMainViewController;
  -[RCMainViewController loadView](&v6, "loadView");
  v3 = objc_opt_new(RCMainView);
  -[RCMainViewController setView:](self, "setView:", v3);
  -[RCMainViewController _styleView](self, "_styleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setBackButtonTitle:", CFSTR(" "));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController view](self, "view"));
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController view](self, "view"));
  objc_msgSend(v7, "setBrowseFoldersView:", v6);

  self->_viewIsAppearingOrDisappearing = 1;
  v9.receiver = self;
  v9.super_class = (Class)RCMainViewController;
  -[RCMainViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  -[RCMainViewController _styleView](self, "_styleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationController](self, "navigationController"));
  objc_msgSend(v8, "setToolbarHidden:animated:", 0, 0);

  -[RCMainViewController _updateToolbar](self, "_updateToolbar");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCMainViewController;
  -[RCMainViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  self->_viewIsAppearingOrDisappearing = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  self->_viewIsAppearingOrDisappearing = 1;
  v3.receiver = self;
  v3.super_class = (Class)RCMainViewController;
  -[RCMainViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCMainViewController;
  -[RCMainViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  self->_viewIsAppearingOrDisappearing = 0;
}

- (void)_updateToolbar
{
  void *v3;
  void *v4;
  void *v5;
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
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v3, "sidebarHasTransparentNavigationBar"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationController](self, "navigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));
    objc_msgSend(v5, "setBarStyle:", 4);

    v6 = objc_alloc_init((Class)UIImage);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationController](self, "navigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
    objc_msgSend(v8, "setShadowImage:", v6);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationController](self, "navigationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toolbar"));
    objc_msgSend(v10, "setBarStyle:", 4);

    v11 = objc_alloc_init((Class)UIImage);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationController](self, "navigationController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "toolbar"));
    objc_msgSend(v13, "setShadowImage:forToolbarPosition:", v11, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationController](self, "navigationController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "toolbar"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sidebarNavBarNewFolderImageTintColor"));
    objc_msgSend(v15, "setTintColor:", v16);

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingCardBottomAccessoryBackgroundColor"));
    v11 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationController](self, "navigationController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toolbar"));
    objc_msgSend(v14, "setBarTintColor:", v6);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v18 = objc_msgSend(v17, "isEditing");

  if (v18)
  {
    -[RCMainViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", 0, 1);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController flexBarItem](self, "flexBarItem"));
    v22[0] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController createNewFolderButtonItem](self, "createNewFolderButtonItem"));
    v22[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
    -[RCMainViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v21, 1);

  }
}

- (void)_handleNewFolder
{
  -[RCMainViewController showNewFolderUIFromController:](self, "showNewFolderUIFromController:", self);
}

- (void)restyle
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[RCMainViewController _restyleCardViewAndReparentIfNeeded](self, "_restyleCardViewAndReparentIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  objc_msgSend(WeakRetained, "restyle");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v4, "restyle");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "restyle");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  objc_msgSend(v7, "restyle");

  -[RCMainViewController _styleView](self, "_styleView");
  -[RCMainViewController _updateRecordingViewStatusBarHeight](self, "_updateRecordingViewStatusBarHeight");
  -[RCMainViewController updateLibraryViewInEditModeForMedusa](self, "updateLibraryViewInEditModeForMedusa");
}

- (void)willTransitionFromHorizontalSizeClass:(int64_t)a3 toHorizontalSizeClass:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  -[RCMainViewController updatePlaybackSettings](self, "updatePlaybackSettings", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedPlaybackSettingsViewController](self, "presentedPlaybackSettingsViewController"));

  if (v5)
    -[RCMainViewController hidePlaybackSettingsViewController](self, "hidePlaybackSettingsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoViewController presentedController](RCShareMemoViewController, "presentedController"));

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)updateLibraryViewInEditModeForMedusa
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
  v5 = objc_msgSend(v4, "isEditing");

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeRecordingsCollectionViewController"));
    objc_msgSend(v6, "updateToolbarAndFooterView");

  }
}

- (void)_restyleCardViewAndReparentIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "applicationState");

  if (v4 != (id)2)
  {
    -[RCMainViewController _restyleRecordingCardSheetPresentationController](self, "_restyleRecordingCardSheetPresentationController");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingViewController"));
    objc_msgSend(v5, "restyle");

  }
}

- (void)_styleView
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if ((objc_msgSend(v12, "usesLargeTitles") & 1) == 0)
  {
    v3 = objc_msgSend(objc_alloc((Class)_UINavigationBarTitleView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
    if (objc_msgSend(v4, "splitBehavior") == (id)1)
    {
      v5 = objc_msgSend(v12, "sidebarPresentsWithGesture");

      if ((v5 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend(v3, "setHideBackButton:", 1);
    objc_msgSend(v3, "setHeight:", 0.0);
LABEL_7:
    objc_msgSend(v3, "setHideStandardTitle:", 1);
    objc_msgSend(v3, "setHideLeadingBarButtons:", 1);
    objc_msgSend(v3, "setHideTrailingBarButtons:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setLargeTitleDisplayMode:", 2);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v7, "setTitleView:", v3);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationItem](self, "navigationItem"));
  if (objc_msgSend(v12, "usesLargeTitles"))
  {
    objc_msgSend(v8, "setLargeTitleDisplayMode:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DEFAULT_NAVIGATION_TITLE"), &stru_1001B2BC0, 0));
    objc_msgSend(v8, "setTitle:", v10);

    objc_msgSend(v8, "_setSupportsTwoLineLargeTitles:", 1);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController view](self, "view"));
  objc_msgSend(v11, "restyle");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)RCMainViewController;
  v7 = a4;
  -[RCMainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007B7B4;
  v8[3] = &unk_1001ABA08;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)doActionEditRecordingInSharingSheetWithUUID:(id)a3
{
  -[RCMainViewController _openForModifyRecordingWithUUID:enterTrim:](self, "_openForModifyRecordingWithUUID:enterTrim:", a3, 0);
}

- (id)selectedComposition
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentRecordingDisplayModel](self->_mainControllerHelper, "currentRecordingDisplayModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper compositionForUUID:](self->_mainControllerHelper, "compositionForUUID:", v4));
  return v5;
}

- (void)saveAsNewDoneButtonAction:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v4, "doneButtonShouldSaveAsNew:", v3);

}

- (void)_transitionToBrowsing:(id)a3
{
  id v4;
  void *v5;
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
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v5, "exitEditMode");

  -[RCMainViewController _dismissCardView:](self, "_dismissCardView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingViewController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uuidBeingDisplayed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingViewController"));
  objc_msgSend(v9, "reset");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedRecording"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  LODWORD(v11) = objc_msgSend(v13, "shouldSaveAsNew");

  if ((_DWORD)v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController recordingsModelInteractor](self, "recordingsModelInteractor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mostRecentRecording"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));

    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeRecordingsCollectionViewController"));

    objc_msgSend(v19, "prepareForAdditionOfNewRecordingWithUUID:", v17);
    -[RCMainViewController selectRecordingWithUUID:returnToBrowse:](self, "selectRecordingWithUUID:returnToBrowse:", v17, 1);

    objc_msgSend(v19, "scrollToTop");
    v12 = v17;
  }
  if (!v12)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuidOfPlayingRecording"));

    if (!v12)
      v12 = v7;
  }
  -[RCMainViewController didSelectForUUID:resetPosition:force:](self, "didSelectForUUID:resetPosition:force:", v12, 0, 1);
  -[RCMainViewController _updateToolbarTranscriptionButtonState](self, "_updateToolbarTranscriptionButtonState");

}

- (void)_transitionToCaptureAndModifyWithOptions:(unint64_t)a3 completion:(id)a4
{
  -[RCMainViewController _presentCardViewWithOptions:completion:](self, "_presentCardViewWithOptions:completion:", a3, a4);
}

- (void)_presentCardViewWithOptions:(unint64_t)a3 completion:(id)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  RCRecordingCardViewController *v22;
  double v23;
  RCRecordingCardViewController *v24;
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  RCUndoManager *v33;
  RCUndoManager *currentUndoManager;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  _QWORD *v42;
  _QWORD v43[4];
  _QWORD *v44;
  _QWORD v45[4];
  id v46;
  RCMainViewController *v47;
  _QWORD v48[4];
  RCRecordingCardViewController *v49;
  id v50;
  id v51;
  id v52;
  RCMainViewController *v53;
  id v54;
  char v55;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v9 = objc_msgSend(v8, "shouldHidePrimaryColumnInEditView");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
    v12 = objc_opt_class(RCSplitViewController, v11);
    isKindOfClass = objc_opt_isKindOfClass(v10, v12);

    if ((isKindOfClass & 1) != 0 && v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
      objc_msgSend(v14, "hidePrimaryColumnForEnteringEditModeIfNeeded");

    }
    v15 = objc_msgSend(v8, "animatesRecordingCardPresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentActiveFolderViewController"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "recordingsCollectionViewController"));
    objc_msgSend(v40, "setEditing:animated:", 0, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recordingViewController"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
    v21 = objc_msgSend(v8, "supportsCompactRecordingCard");
    objc_msgSend(v20, "prepareForPresent:", v4 & 1 | ((v21 & 1) == 0));
    -[RCMainViewController _updateRecordingViewStatusBarHeight](self, "_updateRecordingViewStatusBarHeight");
    v22 = -[RCRecordingCardViewController initWithNibName:bundle:]([RCRecordingCardViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[RCMainViewController setPresentedCardViewController:](self, "setPresentedCardViewController:", v22);
    -[RCRecordingCardViewController setTransitioningDelegate:](v22, "setTransitioningDelegate:", self);
    -[RCMainViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
    -[RCRecordingCardViewController setModalInPresentation:](v22, "setModalInPresentation:", 1);
    if (objc_msgSend(v8, "supportsSheetPresentationSPI"))
    {
      if (v21)
      {
        objc_msgSend(v20, "intrinsicHeightForCompactView");
        -[RCMainViewController _styleRecordingCardSheetPresentationControllerWithOptions:customDetentHeight:](self, "_styleRecordingCardSheetPresentationControllerWithOptions:customDetentHeight:", -[RCMainViewController _cardSheetOptionsForDefaultRecordingView](self, "_cardSheetOptionsForDefaultRecordingView"), v23);
        if ((v4 & v21) != 0)
          -[RCMainViewController _selectLargeDetentOnRecordingCardSheetPresentationController](self, "_selectLargeDetentOnRecordingCardSheetPresentationController");
      }
      else
      {
        -[RCMainViewController _styleRecordingCardSheetPresentationControllerWithOptions:customDetentHeight:](self, "_styleRecordingCardSheetPresentationControllerWithOptions:customDetentHeight:", -[RCMainViewController _cardSheetOptionsForDefaultRecordingView](self, "_cardSheetOptionsForDefaultRecordingView"), 0.0);
      }
    }
    else
    {
      -[RCRecordingCardViewController setModalPresentationStyle:](v22, "setModalPresentationStyle:", 5);
    }
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10007BF50;
    v48[3] = &unk_1001ACDC8;
    v24 = v22;
    v49 = v24;
    v39 = v19;
    v50 = v39;
    v25 = v20;
    v51 = v25;
    v26 = v8;
    v55 = v4 & 1;
    v52 = v26;
    v53 = self;
    v54 = v6;
    v27 = objc_retainBlock(v48);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10007C150;
    v45[3] = &unk_1001AB6E8;
    v28 = v25;
    v46 = v28;
    v47 = self;
    v29 = objc_retainBlock(v45);
    -[RCMainViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, v15, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardViewController transitionCoordinator](v24, "transitionCoordinator"));

    v37 = v26;
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardViewController transitionCoordinator](v24, "transitionCoordinator", v26, v39));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10007C178;
      v43[3] = &unk_1001ACD40;
      v44 = v27;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10007C184;
      v41[3] = &unk_1001ACD40;
      v42 = v29;
      objc_msgSend(v31, "animateAlongsideTransition:completion:", v43, v41);

    }
    else
    {
      ((void (*)(_QWORD *))v27[2])(v27);
      ((void (*)(_QWORD *))v29[2])(v29);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController undoManager](self, "undoManager", v37));
    -[RCMainViewController setMainUndoManager:](self, "setMainUndoManager:", v32);

    v33 = (RCUndoManager *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardViewController undoManager](v24, "undoManager"));
    currentUndoManager = self->_currentUndoManager;
    self->_currentUndoManager = v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v35, "addObserver:selector:name:object:", self, "updateUndoButtonStateFromUndoManager", NSUndoManagerDidUndoChangeNotification, self->_currentUndoManager);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v36, "addObserver:selector:name:object:", self, "updateUndoButtonStateFromUndoManager", NSUndoManagerDidRedoChangeNotification, self->_currentUndoManager);

  }
}

- (id)_recordingCardSheetPresentationController
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentationController"));

  v5 = objc_opt_class(UISheetPresentationController, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (void)_restyleRecordingCardSheetPresentationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController _recordingCardSheetPresentationController](self, "_recordingCardSheetPresentationController"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
    v7 = objc_msgSend(v4, "supportsCompactRecordingCard");
    v8 = 0.0;
    if (v7)
    {
      objc_msgSend(v6, "intrinsicHeightForCompactView");
      v8 = v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordingViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v13 = objc_msgSend(v12, "recordingViewState");

    if (v13 == (id)8)
      v14 = -[RCMainViewController _cardSheetOptionsForLargeDetentOnly](self, "_cardSheetOptionsForLargeDetentOnly");
    else
      v14 = -[RCMainViewController _cardSheetOptionsForDefaultRecordingView](self, "_cardSheetOptionsForDefaultRecordingView");
    -[RCMainViewController _styleSheetPresentationController:options:customDetentHeight:](self, "_styleSheetPresentationController:options:customDetentHeight:", v5, v14, v8);
    if (v7)
      -[RCMainViewController _selectLargeDetentOnSheetPresentationController:](self, "_selectLargeDetentOnSheetPresentationController:", v5);

  }
}

- (void)_styleRecordingCardSheetPresentationControllerWithOptions:(unint64_t)a3 customDetentHeight:(double)a4
{
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController _recordingCardSheetPresentationController](self, "_recordingCardSheetPresentationController"));
  if (v7)
  {
    v8 = v7;
    -[RCMainViewController _styleSheetPresentationController:options:customDetentHeight:](self, "_styleSheetPresentationController:options:customDetentHeight:", v7, a3, a4);
    v7 = v8;
  }

}

- (void)_styleSheetPresentationController:(id)a3 options:(unint64_t)a4 customDetentHeight:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  _QWORD v16[2];
  void *v17;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent"));
  v17 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  if ((a4 & 1) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007C544;
    v14[3] = &unk_1001ACDE8;
    *(double *)&v14[4] = a5;
    v10 = objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent customDetentWithIdentifier:resolver:](UISheetPresentationControllerDetent, "customDetentWithIdentifier:resolver:", CFSTR("RCRecordingCardCustomDetent"), v14));
    v11 = (void *)v10;
    if ((a4 & 2) != 0)
    {
      v16[0] = v10;
      v13 = objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent"));
      v16[1] = v13;
      v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));

      v9 = (void *)v13;
    }
    else
    {
      v15 = v10;
      v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    }

    v9 = (void *)v12;
  }
  objc_msgSend(v7, "setDetents:", v9);
  objc_msgSend(v7, "setPrefersGrabberVisible:", (a4 >> 2) & 1);
  objc_msgSend(v7, "_setWantsFullScreen:", (a4 >> 3) & 1);

}

- (unint64_t)_cardSheetOptionsForDefaultRecordingView
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "supportsCompactRecordingCard");

  if (v3)
    return 7;
  else
    return 10;
}

- (unint64_t)_cardSheetOptionsForLargeDetentOnly
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "supportsCompactRecordingCard");

  if (v3)
    return 2;
  else
    return 10;
}

- (void)_expandPresentedCompactRecordingCard
{
  void *v3;
  unsigned int v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController _recordingCardSheetPresentationController](self, "_recordingCardSheetPresentationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = objc_msgSend(v3, "supportsCompactRecordingCard");

  if (v5 && v4)
  {
    -[RCMainViewController _selectLargeDetentOnSheetPresentationController:](self, "_selectLargeDetentOnSheetPresentationController:", v5);
    -[RCMainViewController __animateRecordingCardDetentTransitionForSheetPresentationController:](self, "__animateRecordingCardDetentTransitionForSheetPresentationController:", v5);
  }

}

- (void)_collapsePresentedCompactRecordingCard
{
  void *v3;
  unsigned int v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController _recordingCardSheetPresentationController](self, "_recordingCardSheetPresentationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = objc_msgSend(v3, "supportsCompactRecordingCard");

  if (v5 && v4)
  {
    objc_msgSend(v5, "setSelectedDetentIdentifier:", CFSTR("RCRecordingCardCustomDetent"));
    -[RCMainViewController __animateRecordingCardDetentTransitionForSheetPresentationController:](self, "__animateRecordingCardDetentTransitionForSheetPresentationController:", v5);
  }

}

- (void)__animateRecordingCardDetentTransitionForSheetPresentationController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expandCompactRecordingCardPropertyAnimator"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007C790;
  v7[3] = &unk_1001AB588;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "addAnimations:", v7);
  objc_msgSend(v5, "startAnimation");

}

- (void)_transitionPresentedCompactRecordingCardToTrimMode:(BOOL)a3
{
  -[RCMainViewController _updateSheetPresentationOptions:](self, "_updateSheetPresentationOptions:", a3);
}

- (void)_updateSheetPresentationOptions:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  id v13;

  v3 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController _recordingCardSheetPresentationController](self, "_recordingCardSheetPresentationController"));
  if (v13)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v6 = objc_msgSend(v5, "supportsCompactRecordingCard");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

    v10 = 0.0;
    if (v6)
    {
      objc_msgSend(v9, "intrinsicHeightForCompactView");
      v10 = v11;
    }
    if (v3)
      v12 = -[RCMainViewController _cardSheetOptionsForLargeDetentOnly](self, "_cardSheetOptionsForLargeDetentOnly");
    else
      v12 = -[RCMainViewController _cardSheetOptionsForDefaultRecordingView](self, "_cardSheetOptionsForDefaultRecordingView");
    -[RCMainViewController _styleSheetPresentationController:options:customDetentHeight:](self, "_styleSheetPresentationController:options:customDetentHeight:", v13, v12, v10);
    if (v6)
      -[RCMainViewController _selectLargeDetentOnSheetPresentationController:](self, "_selectLargeDetentOnSheetPresentationController:", v13);

  }
}

- (void)_selectLargeDetentOnRecordingCardSheetPresentationController
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController _recordingCardSheetPresentationController](self, "_recordingCardSheetPresentationController"));
  if (v3)
  {
    v4 = v3;
    -[RCMainViewController _selectLargeDetentOnSheetPresentationController:](self, "_selectLargeDetentOnSheetPresentationController:", v3);
    v3 = v4;
  }

}

- (void)_selectLargeDetentOnSheetPresentationController:(id)a3
{
  objc_msgSend(a3, "setSelectedDetentIdentifier:", UISheetPresentationControllerDetentIdentifierLarge);
}

- (void)_showGrabberOnRecordingCardSheetPresentationController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController _recordingCardSheetPresentationController](self, "_recordingCardSheetPresentationController"));
  if (v5)
  {
    v6 = v5;
    -[RCMainViewController _showGrabberOnSheetPresentationController:showGrabber:](self, "_showGrabberOnSheetPresentationController:showGrabber:", v5, v3);
    v5 = v6;
  }

}

- (void)_showGrabberOnSheetPresentationController:(id)a3 showGrabber:(BOOL)a4
{
  objc_msgSend(a3, "setPrefersGrabberVisible:", a4);
}

- (void)recordingView:(id)a3 didUpdateViewHeight:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  unsigned int v27;
  BOOL v29;
  uint64_t v30;
  BOOL v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController _recordingCardSheetPresentationController](self, "_recordingCardSheetPresentationController"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detents"));
    v10 = objc_msgSend(v9, "count");

    v11 = (unint64_t)objc_msgSend(v6, "displayStyle");
    if (v10 == (id)2)
    {
      v12 = v11;
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        objc_msgSend(v6, "intrinsicHeightForCompactView");
        v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));
        objc_msgSend(v17, "safeAreaInsets");
        v19 = v14 + v18;

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
        objc_msgSend(v20, "bounds");
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
        v24 = v22 - _UISheetMinimumTopInset();

        v25 = (a4 - v19) / (v24 - v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedDetentIdentifier"));
        v27 = objc_msgSend(v26, "isEqualToString:", UISheetPresentationControllerDetentIdentifierLarge);

        v29 = v25 >= 1.0 || v25 <= 0.5 || v27 == 0;
        if (!v29 && objc_msgSend(v6, "transcriptViewState") == (id)1)
          objc_msgSend(v6, "setTranscriptViewState:", 0);
        if (v25 > 0.5)
          v30 = 2;
        else
          v30 = 1;
        -[RCMainViewController setSheetPresentationState:](self, "setSheetPresentationState:", v30);
        v31 = v12 == 3;
        if (v25 > 0.5)
        {
          v32 = 0;
        }
        else
        {
          v31 = 0;
          v32 = v12 == 2;
        }
        if (!v32 && !v31)
        {
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10007CBFC;
          v33[3] = &unk_1001AB588;
          v34 = v6;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v33);

        }
      }
    }
  }

}

- (void)goToAllRecordingsIfNeeded:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  int v11;
  void *v12;
  void (**v13)(void);

  v4 = a3;
  v13 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentActiveFolderViewController"));
  v8 = v7;
  if (!v7)
    goto LABEL_8;
  v9 = objc_msgSend(v7, "supportsRecording");
  v10 = objc_msgSend(v8, "folderType");
  v11 = !v4;
  if (!v10)
    v11 = 1;
  if (v9 && v11)
  {
    if (v13)
      v13[2]();
  }
  else
  {
LABEL_8:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    objc_msgSend(v12, "goToBuiltInFolderOfType:animated:completion:", 0, 0, v13);

  }
}

- (void)goToRecentlyDeletedIfNeededWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentActiveFolderViewController"));
  v6 = objc_msgSend(v5, "folderType");
  if (v5 && v6 == (id)3)
  {
    if (v8)
      v8[2]();
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    objc_msgSend(v7, "goToBuiltInFolderOfType:animated:completion:", 3, 0, v8);

  }
}

- (void)_updateRecordingViewStatusBarHeight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingViewController"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v9, "topMarginMinSafeAreaTopInsetForCardView");
  if (v8 < v10)
    v8 = v10;
  objc_msgSend(v9, "topMarginForCardView");
  objc_msgSend(v12, "setStatusBarHeight:", v11 + v8);

}

- (BOOL)toggleRecording
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  UIAccessibilityNotifications v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  unsigned int v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentActiveFolderViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingsCollectionViewController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  if ((objc_msgSend(v6, "isShowingRecentlyDeleted") & 1) != 0)
  {

LABEL_4:
    v8 = UIAccessibilityAnnouncementNotification;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AX_RECORDING_UNAVAILABLE"), &stru_1001B2BC0, 0));
    UIAccessibilityPostNotification(v8, v10);

    v11 = 0;
    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "isEditing");

  if ((v7 & 1) != 0)
    goto LABEL_4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v13 = objc_msgSend(v12, "isRecording");

  if (v13)
    -[RCMainViewController endRecording](self, "endRecording");
  else
    -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 3, 0, 0, 0, 0.0);
  v11 = 1;
LABEL_9:

  return v11;
}

- (void)_startCapturing:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  unsigned int v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v9 = objc_msgSend(v8, "isRecording");

  if (v9)
  {
    if (v7)
      v7[2](v7);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10007D06C;
    v10[3] = &unk_1001AC270;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[RCMainViewController goToAllRecordingsIfNeeded:completion:](self, "goToAllRecordingsIfNeeded:completion:", 0, v10);

  }
}

- (void)pauseRecording
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v3, "pauseCapturing");

  -[RCMainViewController updateUndoButtonStateFromUndoManager](self, "updateUndoButtonStateFromUndoManager");
}

- (void)resumeRecording
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v2, "resumeCapturing");

}

- (void)replaceRecording
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v2, "replaceCapturing");

}

- (void)endRecording
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v2, "stopCapturing");

}

- (void)endEditing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((id)-[RCMainViewController state](self, "state") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = objc_msgSend(v5, "recordingViewState");

    if (v6 == (id)8)
      -[RCMainViewController cancelTrimMode](self, "cancelTrimMode");
  }
  -[RCMainViewController setState:](self, "setState:", 0);
}

- (void)playRecordingWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  void ***v16;
  void *v17;
  void **v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  RCMainViewController *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuidBeingDisplayed"));
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  if ((v8 & 1) == 0)
    -[RCMainViewController endEditing](self, "endEditing");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v9, "playbackForUUID:atPosition:", v4, 0.0);

  objc_initWeak(&location, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10007D454;
  v28[3] = &unk_1001AC160;
  objc_copyWeak(&v30, &location);
  v10 = v4;
  v29 = v10;
  v11 = objc_retainBlock(v28);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10007D590;
  v25[3] = &unk_1001ACE10;
  objc_copyWeak(&v27, &location);
  v12 = v11;
  v26 = v12;
  v13 = objc_retainBlock(v25);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_10007D6A4;
  v21 = &unk_1001AC270;
  v22 = self;
  v14 = v10;
  v23 = v14;
  v15 = v13;
  v24 = v15;
  v16 = objc_retainBlock(&v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController", v18, v19, v20, v21, v22));

  if (v17)
    ((void (*)(void ***))v16[2])(v16);
  else
    -[RCMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v16);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)exitTrimMode
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v3, "exitTrimMode");

  -[RCMainViewController updateUndoButtonStateFromUndoManager](self, "updateUndoButtonStateFromUndoManager");
  -[RCMainViewController _transitionPresentedCompactRecordingCardToTrimMode:](self, "_transitionPresentedCompactRecordingCardToTrimMode:", 0);
}

- (void)shouldEnableTrimSave:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingViewController"));
  objc_msgSend(v4, "updateTrimSaveState:", v3);

}

- (void)enableUndoFirstResponder
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = objc_msgSend(v3, "supportsMainViewControllerUndo");

  if (v4)
  {
    -[RCMainViewController becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));
    objc_msgSend(v5, "becomeFirstResponder");

  }
}

- (void)didUpdateToStatus:(int)a3 progress:(float)a4 forRecordingWithUUID:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  RCEditingProgressItem *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  id v18;

  v8 = a5;
  v9 = v8;
  if (a3 == 1)
  {
    v18 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController editingProgressItems](self, "editingProgressItems"));
    v11 = (RCEditingProgressItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v18));

    if (!v11)
    {
      v11 = objc_opt_new(RCEditingProgressItem);
      -[RCEditingProgressItem setDelegate:](v11, "setDelegate:", self);
      -[RCEditingProgressItem setUUID:](v11, "setUUID:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController editingProgressItems](self, "editingProgressItems"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v18);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
      objc_msgSend(v14, "stopForUUID:", v18);

    }
    *(float *)&v12 = a4;
    -[RCEditingProgressItem setProgress:](v11, "setProgress:", v12);
    if (-[RCEditingProgressItem hasMetTimeThreshold](v11, "hasMetTimeThreshold"))
    {
      *(float *)&v15 = a4;
      -[RCMainViewController _updateControllersToEditingInFlight:progress:forUUID:](self, "_updateControllersToEditingInFlight:progress:forUUID:", 1, v18, v15);
    }

    goto LABEL_9;
  }
  if (v8)
  {
    v18 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController editingProgressItems](self, "editingProgressItems"));
    objc_msgSend(v16, "removeObjectForKey:", v18);

    LODWORD(v17) = 1.0;
    -[RCMainViewController _updateControllersToEditingInFlight:progress:forUUID:](self, "_updateControllersToEditingInFlight:progress:forUUID:", 0, v18, v17);
LABEL_9:
    v9 = v18;
  }

}

- (BOOL)isQuickRecordingWorkflowDismissal
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = objc_msgSend(v4, "displayStyle") == (id)2;

  return v5;
}

- (void)backupTimerFiredForUUID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController editingProgressItems](self, "editingProgressItems"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v10)
  {
    objc_msgSend(v10, "progress");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
    LODWORD(v9) = v7;
    -[RCMainViewController _updateControllersToEditingInFlight:progress:forUUID:](self, "_updateControllersToEditingInFlight:progress:forUUID:", 1, v8, v9);

  }
}

- (void)_updateControllersToEditingInFlight:(BOOL)a3 progress:(float)a4 forUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  v6 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeRecordingsCollectionViewController"));
  *(float *)&v11 = a4;
  objc_msgSend(v10, "editingIsInFlight:progress:forUUID:", v6, v8, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordingViewController"));
  *(float *)&v14 = a4;
  objc_msgSend(v13, "updateToEditingInFlight:progress:forUUID:", v6, v8, v14);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  *(float *)&v15 = a4;
  objc_msgSend(v16, "updateToEditingInFlight:progress:forUUID:", v6, v8, v15);

}

- (id)_stringForAudioEditingStatus:(int)a3
{
  if (a3 > 4)
    return 0;
  else
    return *(&off_1001AD0A0 + a3);
}

- (BOOL)isShowingRecentlyDeleted
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = objc_msgSend(v2, "isShowingRecentlyDeleted");

  return v3;
}

- (BOOL)canSwipeToNavigateBack
{
  int64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = -[RCMainViewController state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentActiveFolderViewController"));

  if (v3)
    v6 = 1;
  else
    v6 = v5 == 0;
  return !v6;
}

- (void)updateUndoButtonStateFromUndoManager
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = -[RCUndoManager canUndo](self->_currentUndoManager, "canUndo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "audioRecorder"));
  v6 = objc_msgSend(v5, "isNewRecording");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingViewController"));
  objc_msgSend(v7, "updateUndoState:isNewRecording:", v3, v6);

}

- (void)willBeginDragSession
{
  unint64_t activeDragSessionCount;
  void *v4;

  activeDragSessionCount = self->_activeDragSessionCount;
  if (!activeDragSessionCount)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    objc_msgSend(v4, "enableWaveformScrolling:", 0);

    activeDragSessionCount = self->_activeDragSessionCount;
  }
  self->_activeDragSessionCount = activeDragSessionCount + 1;
}

- (void)didEndDragSession
{
  unint64_t v2;
  id v3;

  v2 = self->_activeDragSessionCount - 1;
  self->_activeDragSessionCount = v2;
  if (!v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    objc_msgSend(v3, "enableWaveformScrolling:", 1);

  }
}

- (void)cancelTrimMode
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v3, "cancelTrimModeWithDismissal:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingViewController"));
  objc_msgSend(v5, "cleanupAfterExitTrim");

  -[RCMainViewController updateUndoButtonStateFromUndoManager](self, "updateUndoButtonStateFromUndoManager");
  -[RCMainViewController _transitionPresentedCompactRecordingCardToTrimMode:](self, "_transitionPresentedCompactRecordingCardToTrimMode:", 0);
}

- (id)waveformViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waveformViewController"));

  return v4;
}

- (id)overviewWaveformViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "overviewWaveformViewController"));

  return v4;
}

- (BOOL)remoteToggleShouldPauseRecording
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingViewController"));
  v4 = objc_msgSend(v3, "recordingControlState") == (id)1;

  return v4;
}

- (void)recordingDidEnd
{
  -[RCMainViewController setRecordingStartTimeInfo:](self, "setRecordingStartTimeInfo:", 0);
  -[RCMainViewController saveAsNewDoneButtonAction:](self, "saveAsNewDoneButtonAction:", 0);
}

- (void)updatePlaybackSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackSettings](self, "playbackSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
  objc_msgSend(v4, "updateWithPlaybackSettings:", v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v5, "updateWithPlaybackSettings:", v8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedPlaybackSettingsViewController](self, "presentedPlaybackSettingsViewController"));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setPlaybackSettings:", v8);

}

- (void)waveformTimeUpdated:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "setCurrentTime:", a3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  objc_msgSend(v8, "setCurrentTime:", a3);

}

- (BOOL)recordingTitleHasBeenEditedForUUID:(id)a3
{
  return -[RCRecordingsModelInteractor recordingTitleHasBeenEditedForUUID:](self->_recordingsModelInteractor, "recordingTitleHasBeenEditedForUUID:", a3);
}

- (void)didUpdateRecordingViewDisplayStyle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v9, "supportsCompactRecordingCard"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = objc_msgSend(v5, "displayStyle");

    v7 = -[RCMainViewController sheetPresentationState](self, "sheetPresentationState");
    if (v6 == (id)3 && v7 == 1)
      -[RCMainViewController _expandPresentedCompactRecordingCard](self, "_expandPresentedCompactRecordingCard");
    v8 = -[RCMainViewController sheetPresentationState](self, "sheetPresentationState");
    if (v6 == (id)2 && v8 == 2)
      -[RCMainViewController _collapsePresentedCompactRecordingCard](self, "_collapsePresentedCompactRecordingCard");
  }

}

- (void)setFavorite:(BOOL)a3 forRecordingWithUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  -[RCMainViewController setFavorite:forRecordingsWithUUIDs:](self, "setFavorite:forRecordingsWithUUIDs:", v4, v7, v8);
}

- (void)setFavorite:(BOOL)a3 forRecordingsWithUUIDs:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v7, "setFavorite:forRecordingsWithUUIDs:", v4, v6);

}

- (BOOL)isFavoriteForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v6 = objc_msgSend(v5, "isFavoriteForUUID:", v4);

  return v6;
}

- (void)toggleFavoriteForUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v5, "toggleFavoriteForUUID:", v4);

}

- (void)_dismissCardView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unsigned int v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  RCUndoManager *v25;
  RCUndoManager *currentUndoManager;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  char v31;
  char v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v7 = objc_msgSend(v6, "shouldHidePrimaryColumnInEditView");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
    v10 = objc_opt_class(RCSplitViewController, v9);
    isKindOfClass = objc_opt_isKindOfClass(v8, v10);

    if (v7 && (isKindOfClass & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
      objc_msgSend(v12, "showPrimaryColumnForExitingEditModeIfNeeded");

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentActiveFolderViewController"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordingViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
    objc_msgSend(v16, "prepareForDismiss");
    v17 = objc_msgSend(v6, "animatesRecordingCardPresentation");
    if ((v17 & 1) == 0)
      +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    v18 = objc_msgSend(v6, "supportsCompactRecordingCard");
    v19 = v18;
    if (v18)
      -[RCMainViewController _showGrabberOnRecordingCardSheetPresentationController:](self, "_showGrabberOnRecordingCardSheetPresentationController:", 0);
    else
      -[RCMainViewController _reparentAfterDismiss](self, "_reparentAfterDismiss");
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10007E544;
    v27[3] = &unk_1001ACE38;
    v31 = v19;
    v27[4] = self;
    v28 = v6;
    v32 = (char)v17;
    v29 = v16;
    v30 = v4;
    v20 = v16;
    v21 = v6;
    -[RCMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v17, v27);
    -[RCMainViewController selectNewRecordingForDismiss](self, "selectNewRecordingForDismiss");
    -[RCMainViewController setPresentedCardViewController:](self, "setPresentedCardViewController:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v22, "removeObserver:name:object:", self, NSUndoManagerDidUndoChangeNotification, self->_currentUndoManager);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "removeObserver:name:object:", self, NSUndoManagerDidRedoChangeNotification, self->_currentUndoManager);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController view](self, "view"));
    objc_msgSend(v24, "setNeedsUpdateConstraints");

    v25 = (RCUndoManager *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainUndoManager](self, "mainUndoManager"));
    currentUndoManager = self->_currentUndoManager;
    self->_currentUndoManager = v25;

  }
}

- (void)_reparentAfterDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentActiveFolderViewController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v8, "willMoveToParentViewController:", 0);
  objc_msgSend(v8, "removeFromParentViewController");
  objc_msgSend(v7, "setRecordingView:", v4);
  objc_msgSend(v6, "setRecordingViewController:", v8);

}

- (void)selectRecordingWithUUID:(id)a3 returnToBrowse:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  _QWORD v12[5];
  id v13;
  unsigned __int8 v14;

  v4 = a4;
  v6 = a3;
  if (!-[RCMainViewController isRecording](self, "isRecording"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentActiveFolderViewController"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingsCollectionViewController"));
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "presentsRecordingWithUUID:", v6);
    else
      v11 = 0;
    +[CATransaction begin](CATransaction, "begin");
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007E85C;
    v12[3] = &unk_1001ACE60;
    v12[4] = self;
    v13 = v6;
    v14 = v11;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v12);
    if (v4)
      -[RCMainViewController setState:](self, "setState:", 0);
    +[CATransaction commit](CATransaction, "commit");

  }
}

- (void)_selectRecordingWithUUID:(id)a3 inRecordingsCollectionViewController:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuidOfSelectedItem"));
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
  {
    objc_msgSend(v6, "selectItemWithUUID:animated:", v8, 0);
    -[RCMainViewController didSelectForUUID:resetPosition:force:](self, "didSelectForUUID:resetPosition:force:", v8, 1, 0);
  }

}

- (void)undo
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController undoManager](self, "undoManager"));
  objc_msgSend(v3, "undo");

  -[RCMainViewController updateUndoButtonStateFromUndoManager](self, "updateUndoButtonStateFromUndoManager");
}

- (void)performRenameWithNewTitle:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeRecordingsCollectionViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionView"));
  objc_msgSend(v10, "becomeFirstResponder");

  -[RCRecordingsModelInteractor performRenameWithNewTitle:forUUID:](self->_recordingsModelInteractor, "performRenameWithNewTitle:forUUID:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:", v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v12, "setCurrentRecordingDisplayModel:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordingViewController"));
  objc_msgSend(v14, "renameForUUID:toNewTitle:", v6, v7);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v15, "renameForUUID:toNewTitle:", v6, v7);

  -[RCMainViewController updateQuickActions](self, "updateQuickActions");
}

- (void)refreshDisplayWithDisplayModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRecordingDisplayModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    objc_msgSend(v9, "setCurrentRecordingDisplayModel:", v14);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordingViewController"));
  objc_msgSend(v11, "updateWithRecordingModel:requireMatchingUUID:", v14, 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  objc_msgSend(WeakRetained, "updateWithRecordingModel:requireMatchingUUID:", v14, 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v13, "updateWithRecordingModel:requireMatchingUUID:", v14, 1);

}

- (void)performClearAllRecentlyDeleted
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v2, "performClearAllRecentlyDeleted");

}

- (void)wasDeselectedForUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeRecordingsCollectionViewController"));
  objc_msgSend(v5, "showIdleForItemWithUUID:", v12);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v6, "showIdleForUUID:", v12);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuidBeingDisplayed"));
  v9 = objc_msgSend(v8, "isEqualToString:", v12);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    objc_msgSend(v10, "clear");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v11, "stopForUUID:", v12);

}

- (void)performAction:(int64_t)a3 atPosition:(double)a4 forUUID:(id)a5 sourceController:(id)a6 source:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  RCMainViewController *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  RCMainViewController *v35;
  id v36;
  uint64_t v37;
  RCMainViewController *v38;
  uint64_t v39;
  RCMainViewController *v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (v12 || (unint64_t)a3 <= 0x2B && ((1 << a3) & 0x800406D80FELL) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordingViewController"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController recordingsModelInteractor](self, "recordingsModelInteractor"));
    -[RCMainViewController saveAsNewDoneButtonAction:](self, "saveAsNewDoneButtonAction:", 0);
    switch(a3)
    {
      case 0:
        objc_msgSend(v15, "playbackForUUID:atPosition:", v12, a4);
        break;
      case 1:
        if (v12)
          objc_msgSend(v15, "pauseForUUID:", v12);
        else
          objc_msgSend(v15, "stopPlayback");
        break;
      case 2:
        if (v12)
          objc_msgSend(v15, "toggleForUUID:", v12);
        else
          objc_msgSend(v15, "togglePlayback");
        break;
      case 3:
        -[RCMainViewController _startCapturing:completion:](self, "_startCapturing:completion:", 0, 0);
        +[RCAnalyticsUtilities sendDidCaptureNewRecording](RCAnalyticsUtilities, "sendDidCaptureNewRecording");
        break;
      case 4:
        -[RCMainViewController endRecording](self, "endRecording");
        break;
      case 5:
        -[RCMainViewController pauseRecording](self, "pauseRecording");
        break;
      case 6:
        -[RCMainViewController saveAsNewDoneButtonAction:](self, "saveAsNewDoneButtonAction:", 1);
        -[RCMainViewController resumeRecording](self, "resumeRecording");
        goto LABEL_15;
      case 7:
        -[RCMainViewController saveAsNewDoneButtonAction:](self, "saveAsNewDoneButtonAction:", 1);
        -[RCMainViewController replaceRecording](self, "replaceRecording");
LABEL_15:
        +[RCAnalyticsUtilities sendDidCaptureModifyExistingRecording](RCAnalyticsUtilities, "sendDidCaptureModifyExistingRecording");
        break;
      case 8:
        objc_msgSend(v15, "startScrubbingForUUID:atPosition:", v12, a4);
        break;
      case 9:
        objc_msgSend(v15, "updateScrubbingForUUID:atPosition:", v12, a4);
        break;
      case 10:
        objc_msgSend(v15, "endScrubbingForUUID:atPosition:", v12, a4);
        break;
      case 11:
        objc_msgSend(v15, "jumpForwardForUUID:", v12);
        break;
      case 12:
        objc_msgSend(v15, "jumpBackwardForUUID:", v12);
        break;
      case 13:
        v19 = objc_msgSend(v18, "duplicateRecordingWithUUID:", v12);
        break;
      case 14:
        v45 = v12;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
        -[RCMainViewController deleteRecordingsWithUUIDs:sourceController:source:showInfo:](self, "deleteRecordingsWithUUIDs:sourceController:source:showInfo:", v20, v13, v14, 1);
        goto LABEL_30;
      case 15:
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activeRecordingsCollectionViewController"));
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectedUUIDs"));
        goto LABEL_25;
      case 16:
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activeRecordingsCollectionViewController"));
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allUUIDs"));
LABEL_25:
        v23 = (void *)v22;
        -[RCMainViewController deleteRecordingsWithUUIDs:sourceController:source:showInfo:](self, "deleteRecordingsWithUUIDs:sourceController:source:showInfo:", v22, v13, v14, 1);

        goto LABEL_30;
      case 17:
        v44 = v12;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
        -[RCMainViewController confirmEraseWithUUIDs:sourceController:source:eraseAllDeleted:](self, "confirmEraseWithUUIDs:sourceController:source:eraseAllDeleted:", v20, v13, v14, 0);
        goto LABEL_30;
      case 18:
        -[RCMainViewController confirmEraseSelectedWithSourceController:source:eraseAllDeleted:](self, "confirmEraseSelectedWithSourceController:source:eraseAllDeleted:", v13, v14, 0);
        break;
      case 19:
        -[RCMainViewController confirmEraseAllWithSourceController:source:eraseAllDeleted:](self, "confirmEraseAllWithSourceController:source:eraseAllDeleted:", v13, v14, 1);
        break;
      case 20:
        v43 = v12;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
        -[RCMainViewController confirmRecoverWithUUIDs:sourceController:source:force:](self, "confirmRecoverWithUUIDs:sourceController:source:force:", v20, v13, v14, 0);
LABEL_30:

        break;
      case 21:
        -[RCMainViewController confirmRecoverSelectedWithSourceController:source:](self, "confirmRecoverSelectedWithSourceController:source:", v13, v14);
        break;
      case 22:
        -[RCMainViewController confirmRecoverAllWithSourceController:source:](self, "confirmRecoverAllWithSourceController:source:", v13, v14);
        break;
      case 23:
        goto LABEL_43;
      case 24:
        v24 = self;
        v25 = 0;
        goto LABEL_35;
      case 25:
        v24 = self;
        v25 = 1;
LABEL_35:
        -[RCMainViewController saveAsNewDoneButtonAction:](v24, "saveAsNewDoneButtonAction:", v25);
        objc_msgSend(v17, "handleDone");
        break;
      case 26:
        objc_msgSend(v17, "handleCancel");
        break;
      case 27:
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
        objc_msgSend(v26, "toggleFullCompact");
        goto LABEL_41;
      case 28:
        -[RCMainViewController _endDescriptionViewTextEditing](self, "_endDescriptionViewTextEditing");
        v47 = v12;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
        v27 = v15;
        v28 = v26;
        v29 = v13;
        v30 = v14;
        v31 = 0;
        goto LABEL_40;
      case 29:
        -[RCMainViewController _endDescriptionViewTextEditing](self, "_endDescriptionViewTextEditing");
        v46 = v12;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
        v27 = v15;
        v28 = v26;
        v29 = v13;
        v30 = v14;
        v31 = 1;
LABEL_40:
        objc_msgSend(v27, "shareRecordingsWithUUIDs:inViewController:source:isShareButton:completionWithItemsHandler:", v28, v29, v30, v31, 0);
LABEL_41:

        break;
      case 30:
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "activeRecordingsCollectionViewController"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "selectedUUIDs"));

        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_10007F4EC;
        v42[3] = &unk_1001ACE88;
        v42[4] = self;
        objc_msgSend(v15, "shareRecordingsWithUUIDs:inViewController:source:isShareButton:completionWithItemsHandler:", v34, v13, v14, 1, v42);

LABEL_43:
        v35 = self;
        v36 = v12;
        v37 = 0;
        goto LABEL_45;
      case 31:
        v35 = self;
        v36 = v12;
        v37 = 1;
LABEL_45:
        -[RCMainViewController _openForModifyRecordingWithUUID:enterTrim:](v35, "_openForModifyRecordingWithUUID:enterTrim:", v36, v37);
        break;
      case 33:
        objc_msgSend(v17, "setInPointToCurrentTime");
        break;
      case 34:
        objc_msgSend(v17, "setOutPointToCurrentTime");
        break;
      case 35:
        objc_msgSend(v15, "performTrimByKeepingSelectedRangeForRecordingWithUUID:source:", v12, v14);
        break;
      case 36:
        objc_msgSend(v15, "performTrimByDeletingSelectedRangeForRecordingWithUUID:source:", v12, v14);
        break;
      case 37:
        -[RCMainViewController undo](self, "undo");
        break;
      case 38:
        v38 = self;
        v39 = 1;
        goto LABEL_53;
      case 39:
        v38 = self;
        v39 = 0;
LABEL_53:
        -[RCMainViewController setFavorite:forRecordingWithUUID:](v38, "setFavorite:forRecordingWithUUID:", v39, v12);
        break;
      case 40:
        -[RCMainViewController _endDescriptionViewTextEditing](self, "_endDescriptionViewTextEditing");
        objc_msgSend(v18, "setEnhanced:forUUID:", 1, v12);
        v40 = self;
        v41 = 1;
        goto LABEL_56;
      case 41:
        -[RCMainViewController _endDescriptionViewTextEditing](self, "_endDescriptionViewTextEditing");
        objc_msgSend(v18, "setEnhanced:forUUID:", 0, v12);
        v40 = self;
        v41 = 0;
LABEL_56:
        -[RCMainViewController _axAnnounceDidSetEnhanced:](v40, "_axAnnounceDidSetEnhanced:", v41);
        break;
      case 42:
        -[RCMainViewController _endDescriptionViewTextEditing](self, "_endDescriptionViewTextEditing");
        -[RCMainViewController _presentMoveToFolderUIForRecordingWithUUID:](self, "_presentMoveToFolderUIForRecordingWithUUID:", v12);
        break;
      case 43:
        -[RCMainViewController _presentMoveToFolderUIForSelectedRecordings](self, "_presentMoveToFolderUIForSelectedRecordings");
        break;
      case 44:
        -[RCMainViewController _endDescriptionViewTextEditing](self, "_endDescriptionViewTextEditing");
        -[RCMainViewController _presentPlaybackSettingsUIWithSource:](self, "_presentPlaybackSettingsUIWithSource:", v14);
        break;
      case 45:
        -[RCMainViewController toggleTranscriptView](self, "toggleTranscriptView");
        break;
      case 46:
        -[RCMainViewController copyTranscript:](self, "copyTranscript:", v12);
        break;
      default:
        break;
    }

  }
}

- (void)_openForModifyRecordingWithUUID:(id)a3 enterTrim:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v4 = a4;
  v16 = a3;
  if (v4 && (id)-[RCMainViewController state](self, "state") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    objc_msgSend(v6, "enterTrimMode");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingViewController"));
    objc_msgSend(v8, "updateForTrimMode");

LABEL_10:
    -[RCMainViewController _transitionPresentedCompactRecordingCardToTrimMode:](self, "_transitionPresentedCompactRecordingCardToTrimMode:", 1);
    goto LABEL_11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeRecordingsCollectionViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuidOfSelectedItem"));

  if ((objc_msgSend(v12, "isEqualToString:", v16) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeRecordingsCollectionViewController"));
    objc_msgSend(v14, "selectItemWithUUID:", v16);

  }
  if (v4)
    v15 = 2;
  else
    v15 = 0;
  objc_msgSend(v9, "openForModifyRecordingWithUUID:withSubActivityType:", v16, v15);

  if (v4)
    goto LABEL_10;
LABEL_11:

}

- (void)deleteRecordingsWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 showInfo:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a6;
  v17 = a3;
  v10 = a4;
  v11 = a5;
  if (v17 && objc_msgSend(v17, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v13 = objc_msgSend(v12, "rc_deletionIsImmediate");

    if (v13)
    {
      -[RCMainViewController confirmEraseWithUUIDs:sourceController:source:eraseAllDeleted:](self, "confirmEraseWithUUIDs:sourceController:source:eraseAllDeleted:", v17, v10, v11, 0);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deleteWithUUIDs:source:showInfo:", v17, v11, v6));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoViewController presentedController](RCShareMemoViewController, "presentedController"));
        objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 0, 0);

        objc_msgSend(v15, "rc_configurePopoverControllerWithSource:", v11);
        -[RCMainViewController _myPresentViewController:sourceController:animated:completion:](self, "_myPresentViewController:sourceController:animated:completion:", v15, v10, 1, 0);
      }

    }
    -[RCMainViewController updatePlaybackContentUnavailableViewIfNeeded](self, "updatePlaybackContentUnavailableViewIfNeeded");
  }

}

- (void)confirmEraseSelectedWithSourceController:(id)a3 source:(id)a4 eraseAllDeleted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  v10 = objc_opt_class(RCRecordingsCollectionViewController, v9);
  if ((objc_opt_isKindOfClass(v13, v10) & 1) != 0)
  {
    v11 = v13;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectedUUIDs"));
    -[RCMainViewController confirmEraseWithUUIDs:sourceController:source:eraseAllDeleted:](self, "confirmEraseWithUUIDs:sourceController:source:eraseAllDeleted:", v12, v11, v8, v5);

  }
}

- (void)confirmEraseAllWithSourceController:(id)a3 source:(id)a4 eraseAllDeleted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  v10 = objc_opt_class(RCRecordingsCollectionViewController, v9);
  if ((objc_opt_isKindOfClass(v13, v10) & 1) != 0)
  {
    v11 = v13;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allUUIDs"));
    -[RCMainViewController confirmEraseWithUUIDs:sourceController:source:eraseAllDeleted:](self, "confirmEraseWithUUIDs:sourceController:source:eraseAllDeleted:", v12, v11, v8, v5);

  }
}

- (void)confirmEraseWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 eraseAllDeleted:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a6;
  v18 = a3;
  v10 = a4;
  v11 = a5;
  if (v18 && objc_msgSend(v18, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v13 = v12;
    if (v6)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eraseAllRecordingsAndConfirmWithSource:", v11));
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeRecordingsCollectionViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eraseAndConfirmWithUUIDs:source:collectionViewController:", v18, v11, v16));

    }
    if (v14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoViewController presentedController](RCShareMemoViewController, "presentedController"));
      objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 0, 0);

      objc_msgSend(v14, "rc_configurePopoverControllerWithSource:", v11);
      -[RCMainViewController _myPresentViewController:sourceController:animated:completion:](self, "_myPresentViewController:sourceController:animated:completion:", v14, v10, 1, 0);
    }

  }
}

- (void)recoverRecordingsWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 force:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a6;
  v12 = a3;
  v10 = a4;
  v11 = a5;
  if (v12 && objc_msgSend(v12, "count"))
    -[RCMainViewController confirmRecoverWithUUIDs:sourceController:source:force:](self, "confirmRecoverWithUUIDs:sourceController:source:force:", v12, v10, v11, v6);

}

- (void)confirmRecoverSelectedWithSourceController:(id)a3 source:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v8 = objc_opt_class(RCRecordingsCollectionViewController, v7);
  if ((objc_opt_isKindOfClass(v11, v8) & 1) != 0)
  {
    v9 = v11;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedUUIDs"));
    -[RCMainViewController confirmRecoverWithUUIDs:sourceController:source:force:](self, "confirmRecoverWithUUIDs:sourceController:source:force:", v10, v9, v6, 0);

  }
}

- (void)confirmRecoverAllWithSourceController:(id)a3 source:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v8 = objc_opt_class(RCRecordingsCollectionViewController, v7);
  if ((objc_opt_isKindOfClass(v11, v8) & 1) != 0)
  {
    v9 = v11;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allUUIDs"));
    -[RCMainViewController confirmRecoverWithUUIDs:sourceController:source:force:](self, "confirmRecoverWithUUIDs:sourceController:source:force:", v10, v9, v6, 0);

  }
}

- (void)confirmRecoverWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 force:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10 && objc_msgSend(v10, "count"))
  {
    v24 = v6;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
          objc_msgSend(v19, "pauseForUUID:", v18);

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activeRecordingsCollectionViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "restoreRecordingsWithUUIDs:isRecover:source:force:collectionViewController:", v13, 1, v12, v24, v22));

    if (v23)
    {
      objc_msgSend(v23, "rc_configurePopoverControllerWithSource:", v12);
      -[RCMainViewController _myPresentViewController:sourceController:animated:completion:](self, "_myPresentViewController:sourceController:animated:completion:", v23, v11, 1, 0);
    }

  }
}

- (void)moveRecordingsWithUUIDs:(id)a3 toUserFolderNamed:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (v11)
  {
    v10 = objc_msgSend(v11, "count");
    if (v8)
    {
      if (v10)
        -[RCRecordingsModelInteractor addRecordingsWithUUIDs:toUserFolderNamed:](self->_recordingsModelInteractor, "addRecordingsWithUUIDs:toUserFolderNamed:", v11, v8);
    }
  }

}

- (void)moveRecordingsWithUUIDs:(id)a3 toBuiltInFolderOfType:(int64_t)a4 source:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (v9 && objc_msgSend(v9, "count"))
    -[RCRecordingsModelInteractor addRecordingsWithUUIDs:toBuiltInFolderOfType:](self->_recordingsModelInteractor, "addRecordingsWithUUIDs:toBuiltInFolderOfType:", v9, a4);

}

- (void)_myPresentViewController:(id)a3 sourceController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  RCMainViewController *v10;
  id v11;
  void *v12;
  id v13;

  v7 = a5;
  v13 = a3;
  v10 = (RCMainViewController *)a4;
  v11 = a6;
  if (!v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController navigationController](self, "navigationController"));
    v10 = (RCMainViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));

    if (!v10)
      v10 = self;
  }
  -[RCMainViewController setPresentedConfirmationController:](self, "setPresentedConfirmationController:", v13);
  -[RCMainViewController presentViewController:animated:completion:](v10, "presentViewController:animated:completion:", v13, v7, v11);

}

- (void)hideBackButtonTitle:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentActiveFolderViewController"));
  objc_msgSend(v4, "setHideNavigationTitle:", v3);

}

- (void)libraryWillChangeEditingState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    objc_msgSend(v5, "stopPlayback");

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v6, "setCollectionViewEditingShouldDisableActionButtons:", v3);

}

- (BOOL)isEditingInFlightForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController editingProgressItems](self, "editingProgressItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6 != 0;
}

- (void)mostRecentRecordingIsSelectable
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v4 = objc_msgSend(v3, "isRecording");

  if (v4)
  {
    self->_canSelectNewestRecording = 1;
    -[RCMainViewController selectNewRecordingForDismiss](self, "selectNewRecordingForDismiss");
  }
  else
  {
    -[RCMainViewController setUuidToSelectAfterDismiss:](self, "setUuidToSelectAfterDismiss:", 0);
  }
}

- (void)selectNewRecordingForDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController uuidToSelectAfterDismiss](self, "uuidToSelectAfterDismiss"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellForUUID:", v12));

  if (!-[RCMainViewController state](self, "state") && self->_canSelectNewestRecording && v5 != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeRecordingsCollectionViewController"));
    objc_msgSend(v8, "selectItemWithUUID:", v12);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuidBeingDisplayed"));
    v11 = objc_msgSend(v10, "isEqualToString:", v12);

    if ((v11 & 1) == 0)
      -[RCMainViewController didSelectForUUID:resetPosition:force:](self, "didSelectForUUID:resetPosition:force:", v12, 0, 0);
    -[RCMainViewController setUuidToSelectAfterDismiss:](self, "setUuidToSelectAfterDismiss:", 0);
    self->_canSelectNewestRecording = 0;
  }

}

- (void)_presentMoveToFolderUIForSelectedRecordings
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedUUIDs"));
  -[RCMainViewController _presentMoveToFolderUIForRecordingsWithUUIDs:](self, "_presentMoveToFolderUIForRecordingsWithUUIDs:", v4);

}

- (void)_presentMoveToFolderUIForRecordingWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = a3;
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

    -[RCMainViewController _presentMoveToFolderUIForRecordingsWithUUIDs:](self, "_presentMoveToFolderUIForRecordingsWithUUIDs:", v5, v6);
  }
}

- (void)_presentMoveToFolderUIForRecordingsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController moveToFolderContainerViewControllerWithUUIDs:](self, "moveToFolderContainerViewControllerWithUUIDs:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionViewController"));
  objc_msgSend(v6, "setPresentingDelegate:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v7, "presentedViewsMinimumWidth");
  v9 = v8;

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100080490;
  v11[3] = &unk_1001AC160;
  objc_copyWeak(&v13, &location);
  v10 = v5;
  v12 = v10;
  -[RCMainViewController _presentViewController:fromViewController:animated:widthHeightConstraintConstant:completion:](self, "_presentViewController:fromViewController:animated:widthHeightConstraintConstant:completion:", v10, self, 1, v11, v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (id)moveToFolderContainerViewControllerWithUUIDs:(id)a3
{
  id v4;
  RCFolderSelectionCollectionViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RCFolderSelectionContainerViewController *v11;

  v4 = a3;
  v5 = objc_opt_new(RCFolderSelectionCollectionViewController);
  -[RCFolderSelectionCollectionViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
  -[RCFolderSelectionCollectionViewController setSelectionDelegate:](v5, "setSelectionDelegate:", self);
  -[RCFolderSelectionCollectionViewController setUuidsToMove:](v5, "setUuidsToMove:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentActiveFolderViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "folderUUID"));
  -[RCFolderSelectionCollectionViewController setUuidOfSourceFolder:](v5, "setUuidOfSourceFolder:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentActiveFolderViewController"));
  -[RCFolderSelectionCollectionViewController setFolderTypeOfSourceFolder:](v5, "setFolderTypeOfSourceFolder:", objc_msgSend(v10, "folderType"));

  v11 = -[RCFolderSelectionContainerViewController initWithCollectionViewController:]([RCFolderSelectionContainerViewController alloc], "initWithCollectionViewController:", v5);
  return v11;
}

- (id)folderUUIDsToExcludeWhenMovingRecordingUUIDs:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  int v10;
  int v11;
  void *i;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v25;
  id obj;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v6)
  {

    v27 = 0;
    goto LABEL_24;
  }
  v7 = v6;
  v25 = v4;
  obj = v5;
  v8 = 0;
  v27 = 0;
  v9 = *(_QWORD *)v30;
  v10 = 1;
  v11 = 1;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController recordingsModelInteractor](self, "recordingsModelInteractor", v25));
      v15 = objc_msgSend(v14, "isRecentlyDeletedForUUID:", v13);
      v16 = objc_msgSend(v14, "isFavoriteForUUID:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuidOfUserFolderForRecordingWithUUID:", v13));
      if ((v8 & 1) != 0)
      {
LABEL_7:
        v8 = 1;
        goto LABEL_14;
      }
      if (v27)
      {
        if (!v17 || (objc_msgSend(v27, "isEqualToString:", v17) & 1) == 0)
          goto LABEL_7;
      }
      else
      {
        v27 = v17;
      }
      v8 = 0;
LABEL_14:
      v11 &= v15;
      v10 &= v16;

    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v7);
  v5 = obj;

  if (v27)
    v18 = v8;
  else
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    v4 = v25;
    -[NSMutableArray addObject:](v25, "addObject:");
    if ((v11 & 1) == 0)
      goto LABEL_27;
    goto LABEL_24;
  }
  v4 = v25;
  if (v11)
  {
LABEL_24:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recentlyDeletedRecordingsFolder"));
    goto LABEL_25;
  }
LABEL_27:
  if (v10)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "favoriteRecordingsFolder"));
    goto LABEL_25;
  }
  if (!-[NSMutableArray count](v4, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "voiceMemosRecordingsFolder"));
LABEL_25:
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuid"));
    -[NSMutableArray addObject:](v4, "addObject:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));

  return v23;
}

- (void)_presentPlaybackSettingsUIWithSource:(id)a3
{
  id v4;
  void *v5;
  RCPlaybackSettingsViewController *v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  RCMainViewController *v24;
  RCMainViewController *v25;
  void *v26;
  double v27;
  double v28;
  RCPlaybackSettingsViewController *v29;
  RCMainViewController *v30;
  void *v31;
  _QWORD v32[4];
  RCPlaybackSettingsViewController *v33;
  RCMainViewController *v34;
  id v35;
  id location;
  _QWORD v37[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackSettings](self, "playbackSettings"));
  if (!v5)
    goto LABEL_16;
  v6 = objc_alloc_init(RCPlaybackSettingsViewController);
  -[RCPlaybackSettingsViewController setDelegate:](v6, "setDelegate:", self);
  -[RCPlaybackSettingsViewController setPlaybackSettings:](v6, "setPlaybackSettings:", v5);
  v7 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v8 = objc_msgSend(v31, "supportsPopoverPlaybackSettingsPresentation");
  if (!v4)
    goto LABEL_9;
  v10 = v8;
  v11 = objc_opt_class(UIView, v9);
  if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
  {
    LOBYTE(v13) = 0;
    if (!v10)
      goto LABEL_9;
  }
  else
  {
    v14 = objc_opt_class(UIBarButtonItem, v12);
    v13 = objc_opt_isKindOfClass(v4, v14) ^ 1;
    if (!v10)
    {
LABEL_9:
      -[RCPlaybackSettingsViewController setNeedsCloseButton:](v6, "setNeedsCloseButton:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentationController"));
      v17 = objc_opt_class(UISheetPresentationController, v16);
      if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
      {
        v18 = v15;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent mediumDetent](UISheetPresentationControllerDetent, "mediumDetent"));
        v37[0] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent"));
        v37[1] = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
        objc_msgSend(v18, "setDetents:", v21);

      }
      goto LABEL_12;
    }
  }
  if ((v13 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v7, "setModalPresentationStyle:", 7);
  objc_msgSend(v7, "rc_configurePopoverControllerWithSource:", v4);
LABEL_12:
  v22 = objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));
  v23 = (void *)v22;
  if (v22)
    v24 = (RCMainViewController *)v22;
  else
    v24 = self;
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v26, "presentedViewsMinimumWidth");
  v28 = v27;

  objc_initWeak(&location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100080B9C;
  v32[3] = &unk_1001AB560;
  objc_copyWeak(&v35, &location);
  v29 = v6;
  v33 = v29;
  v30 = v25;
  v34 = v30;
  -[RCMainViewController _presentViewController:fromViewController:animated:widthHeightConstraintConstant:completion:](self, "_presentViewController:fromViewController:animated:widthHeightConstraintConstant:completion:", v7, v30, 1, v32, v28);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

LABEL_16:
}

- (void)_presentViewController:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 widthHeightConstraintConstant:(double)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v9 = a5;
  v33 = a3;
  v11 = a4;
  v12 = a7;
  if (a6 > 0.0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintGreaterThanOrEqualToConstant:", a6));
    objc_msgSend(v15, "setActive:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "heightAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintGreaterThanOrEqualToConstant:", a6));
    objc_msgSend(v18, "setActive:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));

    if (v21)
    {
      objc_msgSend(v21, "frame");
      v23 = v22 * 0.9;
      v25 = v24 * 0.9;
      if (v22 * 0.9 > a6 && v25 > a6)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "widthAnchor"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToConstant:", v23));
        objc_msgSend(v29, "setActive:", 1);

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "heightAnchor"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintLessThanOrEqualToConstant:", v25));
        objc_msgSend(v32, "setActive:", 1);

      }
    }

  }
  objc_msgSend(v11, "presentViewController:animated:completion:", v33, v9, v12);

}

- (void)_endDescriptionViewTextEditing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v2, "endDescriptionViewTextEditing");

}

- (void)didCancelFolderSelection
{
  -[RCMainViewController hideFolderSelectionViewController](self, "hideFolderSelectionViewController");
}

- (void)didCompleteFolderSelection
{
  -[RCMainViewController hideFolderSelectionViewController](self, "hideFolderSelectionViewController");
}

- (void)hideFolderSelectionViewController
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedSelectFolderViewController](self, "presentedSelectFolderViewController"));
  if (v3)
  {
    v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedViewController](self, "presentedViewController"));
    v5 = objc_msgSend(v6, "isEqual:", v4);

    v3 = v6;
    if (v5)
    {
      -[RCMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      v3 = v6;
    }
  }

}

- (void)_processMoveOfUUID:(id)a3 toBuiltInFolderOfType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 3:
      v14 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
      -[RCMainViewController deleteRecordingsWithUUIDs:sourceController:source:showInfo:](self, "deleteRecordingsWithUUIDs:sourceController:source:showInfo:", v8, v11, 0, 0);

LABEL_11:
      break;
    case 1:
      -[RCMainViewController setFavorite:forRecordingWithUUID:](self, "setFavorite:forRecordingWithUUID:", 1, v6);
      break;
    case 0:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController recordingsModelInteractor](self, "recordingsModelInteractor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuidOfUserFolderForRecordingWithUUID:", v7));
      if (v10)
      {
        objc_msgSend(v9, "removeRecordingWithUUID:fromUserFolderWithUUID:", v7, v10);
      }
      else
      {
        v15 = v7;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
        v13 = objc_msgSend(v8, "restoreRecordingsWithUUIDs:isRecover:source:force:collectionViewController:", v12, 1, 0, 1, 0);

      }
      goto LABEL_11;
    default:
      -[RCRecordingsModelInteractor addRecordingWithUUID:toBuiltInFolderOfType:](self->_recordingsModelInteractor, "addRecordingWithUUID:toBuiltInFolderOfType:", v6, a4);
      break;
  }

}

- (void)showNewFolderUIFromController:(id)a3
{
  id v4;
  void *v5;
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
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id location;
  _QWORD v21[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NEW_FOLDER"), &stru_1001B2BC0, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ENTER_NEW_FOLDER_NAME"), &stru_1001B2BC0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100081314;
  v21[3] = &unk_1001ACEB0;
  v21[4] = self;
  objc_msgSend(v9, "addTextFieldWithConfigurationHandler:", v21);
  objc_initWeak(&location, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SAVE"), &stru_1001B2BC0, 0));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000813BC;
  v17[3] = &unk_1001ACED8;
  objc_copyWeak(&v19, &location);
  v17[4] = self;
  v12 = v4;
  v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v17));

  objc_msgSend(v13, "setEnabled:", 0);
  -[RCMainViewController setCreateNewFolderSaveAction:](self, "setCreateNewFolderSaveAction:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1001B2BC0, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, &stru_1001ACF18));

  objc_msgSend(v9, "addAction:", v13);
  objc_msgSend(v9, "addAction:", v16);
  -[RCMainViewController _myPresentViewController:sourceController:animated:completion:](self, "_myPresentViewController:sourceController:animated:completion:", v9, v12, 1, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)showRenamingControllerWithFolderName:(id)a3 controller:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  RCMainViewController *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  RCMainViewController *v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RENAME_FOLDER"), &stru_1001B2BC0, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, 0, 1));

  -[RCMainViewController setOldFolderName:](self, "setOldFolderName:", v6);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100081738;
  v31[3] = &unk_1001ACF40;
  v11 = v6;
  v32 = v11;
  v33 = self;
  objc_msgSend(v10, "addTextFieldWithConfigurationHandler:", v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SAVE"), &stru_1001B2BC0, 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textFields"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));

  objc_msgSend(v15, "setText:", v11);
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_100081798;
  v26 = &unk_1001ACF68;
  v27 = self;
  v28 = v15;
  v29 = v7;
  v30 = v11;
  v16 = v11;
  v17 = v7;
  v18 = v15;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, &v23));
  -[RCMainViewController setRenameFolderSaveAction:](self, "setRenameFolderSaveAction:", v19, v23, v24, v25, v26, v27);
  -[RCMainViewController _renamingTextDidChange:](self, "_renamingTextDidChange:", v18);
  objc_msgSend(v10, "addAction:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1001B2BC0, 0));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 1, 0));
  objc_msgSend(v10, "addAction:", v22);
  objc_msgSend(v10, "rc_configurePopoverControllerWithSource:", v17);
  -[RCMainViewController presentViewController:sourceController:animated:completion:](self, "presentViewController:sourceController:animated:completion:", v10, self, 1, 0);

}

- (void)_presentNameTakenAlertWithName:(id)a3 sourceController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NEW_FOLDER_NAME_EXISTS"), &stru_1001B2BC0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NEW_FOLDER_CHOOSE_DIFFERENT"), &stru_1001B2BC0, 0));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1001B2BC0, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, 0));

  objc_msgSend(v14, "addAction:", v12);
  -[RCMainViewController _myPresentViewController:sourceController:animated:completion:](self, "_myPresentViewController:sourceController:animated:completion:", v14, v5, 1, 0);

  LODWORD(self) = UIAccessibilityScreenChangedNotification;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  UIAccessibilityPostNotification((UIAccessibilityNotifications)self, v13);

}

- (void)_newFolderTextDidChange:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v4 = objc_msgSend(v6, "length") != 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController createNewFolderSaveAction](self, "createNewFolderSaveAction"));
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)_renamingTextDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  if (objc_msgSend(v7, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController oldFolderName](self, "oldFolderName"));
    v5 = objc_msgSend(v7, "isEqualToString:", v4) ^ 1;

  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController renameFolderSaveAction](self, "renameFolderSaveAction"));
  objc_msgSend(v6, "setEnabled:", v5);

}

- (void)moveFolder:(id)a3 toDestinationIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController recordingsModelInteractor](self, "recordingsModelInteractor"));
  objc_msgSend(v8, "moveFolder:toDestinationIndexPath:", v7, v6);

}

- (void)deleteFolder:(id)a3 controller:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deleteFolder:source:completionBlock:", v9, v12, v8));

  if (v11)
    -[RCMainViewController _myPresentViewController:sourceController:animated:completion:](self, "_myPresentViewController:sourceController:animated:completion:", v11, v12, 1, 0);

}

- (void)setEnhanced:(BOOL)a3 forUUID:(id)a4
{
  uint64_t v4;

  if (a3)
    v4 = 40;
  else
    v4 = 41;
  -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", v4, a4, 0, 0, 0.0);
}

- (void)setRemoveSilence:(BOOL)a3 forUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v7, "setRemoveSilence:forUUID:", v4, v6);

  -[RCMainViewController updatePlaybackSettings](self, "updatePlaybackSettings");
}

- (void)setPlaybackSpeed:(double)a3 forUUID:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  objc_msgSend(v7, "setPlaybackSpeed:forUUID:", v6, a3);

  -[RCMainViewController updatePlaybackSettings](self, "updatePlaybackSettings");
}

- (void)hidePlaybackSettingsViewController
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedPlaybackSettingsViewController](self, "presentedPlaybackSettingsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentingPlaybackSettingsViewController](self, "presentingPlaybackSettingsViewController"));
  if (v7)
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
      v6 = objc_msgSend(v3, "isEqual:", v5);

      if (v6)
      {
        if ((objc_msgSend(v3, "isBeingDismissed") & 1) == 0)
          objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
      }
    }
  }

}

- (void)playbackSettingsViewController:(id)a3 contentSizeChanged:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v7, "playbackSettingsPopoverBottomPadding");
  v9 = height + v8;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController"));
  objc_msgSend(v10, "setPreferredContentSize:", width, v9);

}

- (void)didReturnToFoldersList
{
  id v3;

  -[RCMainViewController stopPlayback](self, "stopPlayback");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v3, "clear");

}

- (void)renameFolder:(id)a3 toName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController recordingsModelInteractor](self, "recordingsModelInteractor"));
  objc_msgSend(v8, "renameFolder:toName:", v7, v6);

}

- (BOOL)canMoveRecordingsWithUUIDs:(id)a3 toFolderWithUUID:(id)a4 toFolderType:(int64_t)a5 fromFolderUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;

  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v14 = v13;
  switch(a5)
  {
    case 0:
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "voiceMemosRecordingsFolder"));
      goto LABEL_8;
    case 1:
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "favoriteRecordingsFolder"));
      goto LABEL_8;
    case 2:
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "capturedOnWatchRecordingsFolder"));
      goto LABEL_8;
    case 3:
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recentlyDeletedRecordingsFolder"));
      goto LABEL_8;
    case 4:
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingFolderWithUUID:", v10));
LABEL_8:
      v16 = (void *)v15;
      break;
    default:
      v16 = 0;
      break;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel folderDisplayModelWithFolderModel:](RCFolderDisplayModel, "folderDisplayModelWithFolderModel:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController folderUUIDsToExcludeWhenMovingRecordingUUIDs:](self, "folderUUIDsToExcludeWhenMovingRecordingUUIDs:", v12));

  v19 = -[RCMainViewController canMoveSelectedRecordingsFromFolderWithUUID:toFolderWithDisplayModel:excludedFolderUUIDsForSelection:](self, "canMoveSelectedRecordingsFromFolderWithUUID:toFolderWithDisplayModel:excludedFolderUUIDsForSelection:", v11, v17, v18);
  return v19;
}

- (BOOL)canMoveSelectedRecordingsFromFolderWithUUID:(id)a3 toFolderWithDisplayModel:(id)a4 excludedFolderUUIDsForSelection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if ((v11 & 1) != 0 || (objc_msgSend(v10, "isEqualToString:", v7) & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(v8, "representsPossibleMoveDestination");

  return v12;
}

- (void)moveRecordingsWithUUIDs:(id)a3 toFolderWithUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeRecordingsCollectionViewController"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v10 = objc_msgSend(v9, "restoreRecordingsWithUUIDs:isRecover:source:force:collectionViewController:", v7, 1, 0, 1, v11);

  -[RCRecordingsModelInteractor addRecordingsWithUUIDs:toUserFolderWithUUID:](self->_recordingsModelInteractor, "addRecordingsWithUUIDs:toUserFolderWithUUID:", v7, v6);
  objc_msgSend(v11, "endEditing");

}

- (void)moveRecordingsWithUUIDs:(id)a3 fromFolderOfType:(int64_t)a4 toBuiltInFolderOfType:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeRecordingsCollectionViewController"));

  if (a4 == 3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v12 = objc_msgSend(v11, "restoreRecordingsWithUUIDs:isRecover:source:force:collectionViewController:", v8, 1, 0, 1, v10);

  }
  if (a5)
  {
    if (a5 == 1)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            -[RCMainViewController setFavorite:forRecordingWithUUID:](self, "setFavorite:forRecordingWithUUID:", 1, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), (_QWORD)v18);
            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v15);
      }

    }
    else if (a5 == 3)
    {
      -[RCMainViewController deleteRecordingsWithUUIDs:sourceController:source:showInfo:](self, "deleteRecordingsWithUUIDs:sourceController:source:showInfo:", v8, v10, 0, 0);
    }
  }
  else if (a4 == 4)
  {
    -[RCMainViewController _removeFromUserFolderRecordingsWithUUIDs:](self, "_removeFromUserFolderRecordingsWithUUIDs:", v8);
  }
  else if (a4 == 1)
  {
    -[RCMainViewController setFavorite:forRecordingsWithUUIDs:](self, "setFavorite:forRecordingsWithUUIDs:", 0, v8);
  }
  objc_msgSend(v10, "endEditing", (_QWORD)v18);

}

- (void)_removeFromUserFolderRecordingsWithUUIDs:(id)a3
{
  -[RCRecordingsModelInteractor removeRecordingsWithUUIDs:fromUserFolderWithUUID:](self->_recordingsModelInteractor, "removeRecordingsWithUUIDs:fromUserFolderWithUUID:", a3, 0);
}

- (void)didTransitionWithTransitionInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "toActivityType");
  v6 = objc_msgSend(v4, "toSubType");
  v7 = objc_msgSend(v4, "fromActivityType");
  v8 = objc_msgSend(v4, "fromSubType");
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waveformDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composition"));

  switch((unint64_t)v5)
  {
    case 0uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
      -[RCMainViewController _switchToIdleFromPreviousActivityType:fromSubActivityType:toSubActivityType:displayModel:withUUID:](self, "_switchToIdleFromPreviousActivityType:fromSubActivityType:toSubActivityType:displayModel:withUUID:", v7, v8, v6, v15, v11);

      break;
    case 1uLL:
      -[RCMainViewController _switchToCapturingFromPreviousActivityType:displayModel:waveformDataSource:isReplaceOrAppend:](self, "_switchToCapturingFromPreviousActivityType:displayModel:waveformDataSource:isReplaceOrAppend:", v7, v15, v9, v6 != (id)3);
      break;
    case 2uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
      -[RCMainViewController _switchToPlayingBackFromPreviousActivityType:withUUID:](self, "_switchToPlayingBackFromPreviousActivityType:withUUID:", v7, v12);

      break;
    case 3uLL:
      -[RCMainViewController _switchToEditingFromPreviousActivityType:displayModel:withComposition:enterTrim:](self, "_switchToEditingFromPreviousActivityType:displayModel:withComposition:enterTrim:", v7, v15, v10, v6 == (id)2);
      break;
    default:
      break;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeRecordingsCollectionViewController"));
  objc_msgSend(v14, "setCaptureIsUnderway:", v5 == (id)1);

}

- (void)_switchToPlayingBackFromPreviousActivityType:(int64_t)a3 withUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeRecordingsCollectionViewController"));
  objc_msgSend(v7, "showPlayingForItemWithUUID:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingViewController"));
  objc_msgSend(v9, "showPlayingForUUID:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  objc_msgSend(WeakRetained, "showPlayingForUUID:", v5);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v11, "showPlayingForUUID:", v5);

  -[RCMainViewController updateQuickActions](self, "updateQuickActions");
}

- (void)_switchToEditingFromPreviousActivityType:(int64_t)a3 displayModel:(id)a4 withComposition:(id)a5 enterTrim:(BOOL)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  RCMainViewController *v14;
  id v15;
  int64_t v16;
  BOOL v17;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100082664;
  v12[3] = &unk_1001ACFD8;
  v13 = a4;
  v14 = self;
  v15 = a5;
  v16 = a3;
  v17 = a6;
  v10 = v15;
  v11 = v13;
  -[RCMainViewController _prepareToDisplayCardViewWithCompletionBlock:](self, "_prepareToDisplayCardViewWithCompletionBlock:", v12);

}

- (id)lockScreenRecordingViewController
{
  RCLockScreenRecordingViewController **p_lockScreenRecordingViewController;
  RCLockScreenRecordingViewController *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v38[5];

  p_lockScreenRecordingViewController = &self->_lockScreenRecordingViewController;
  WeakRetained = (RCLockScreenRecordingViewController *)objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  if (!WeakRetained)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100082DF4;
    v38[3] = &unk_1001AB588;
    v38[4] = self;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v38);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingViewController"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "cancelTextEditing");

    WeakRetained = objc_opt_new(RCLockScreenRecordingViewController);
    v8 = objc_storeWeak((id *)p_lockScreenRecordingViewController, WeakRetained);
    -[RCRecordingViewController setRecordingViewControllerDelegate:](WeakRetained, "setRecordingViewControllerDelegate:", self);

    v9 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v10, "prepareForPresent:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
    objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

    v22 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
    objc_msgSend(v23, "setDisplayStyle:", 3);

    v24 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "transcriptionButton"));
    objc_msgSend(v26, "rc_setEnabled:", 0);

    v27 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    objc_msgSend(v27, "restyle");

    v28 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    objc_msgSend(v28, "updateForRecordingStart:", 0);

    v29 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "currentRecordingDisplayModel"));
    objc_msgSend(v29, "updateWithRecordingModel:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "timeController"));
    v34 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    objc_msgSend(v34, "setActiveTimeController:", v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waveformDataSource"));
    v36 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    objc_msgSend(v36, "setWaveformDataSource:", v35);

    +[CATransaction commit](CATransaction, "commit");
  }
  return WeakRetained;
}

- (void)removeLockScreenRecordingViewController
{
  objc_storeWeak((id *)&self->_lockScreenRecordingViewController, 0);
}

- (void)expandCardFromLockScreenInput
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = objc_msgSend(v5, "displayStyle");

  if (v6 == (id)2)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordingViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v8, "toggleFullCompact");

  }
}

- (void)performDoneButtonFromLockScreenInput
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
  objc_msgSend(v2, "handleDone");

}

- (id)platterViewControllerForPresentationStyle:(unint64_t)a3
{
  RCPlatterViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[RCPlatterViewController initWithPresentationStyle:]([RCPlatterViewController alloc], "initWithPresentationStyle:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeController"));
  -[RCPlatterViewController setActiveTimeController:](v4, "setActiveTimeController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityWaveformProcessor"));
  -[RCPlatterViewController setActivityWaveformProcessor:](v4, "setActivityWaveformProcessor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeController"));
  objc_msgSend(v10, "addTimeObserver:", v4);

  return v4;
}

- (void)_switchToCapturingFromPreviousActivityType:(int64_t)a3 displayModel:(id)a4 waveformDataSource:(id)a5 isReplaceOrAppend:(BOOL)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  RCMainViewController *v10;
  id v11;
  id v12;
  BOOL v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000830DC;
  v9[3] = &unk_1001AC678;
  v13 = a6;
  v10 = self;
  v11 = a4;
  v12 = a5;
  v7 = v12;
  v8 = v11;
  -[RCMainViewController _prepareToDisplayCardViewWithCompletionBlock:](v10, "_prepareToDisplayCardViewWithCompletionBlock:", v9);

}

- (void)_prepareToDisplayCardViewWithCompletionBlock:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  v4 = objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedViewController](self, "presentedViewController"));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedViewController](self, "presentedViewController")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController")),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v6,
        v5,
        (v8 & 1) == 0))
  {
    -[RCMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v9);
  }
  else
  {
    v9[2]();
  }

}

- (void)_setCorrectOriginalFolderForRecordingWithUUID:(id)a3 folderType:(int64_t)a4 userFolderName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a5;
  if (v8 && a4)
  {
    if (a4 == 1)
    {
      -[RCRecordingsModelInteractor setFavorite:forUUID:](self->_recordingsModelInteractor, "setFavorite:forUUID:", 1, v8);
    }
    else if (a4 == 4)
    {
      v13 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
      -[RCMainViewController moveRecordingsWithUUIDs:toUserFolderNamed:source:](self, "moveRecordingsWithUUIDs:toUserFolderNamed:source:", v10, v9, 0);

    }
    else
    {
      v12 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      -[RCMainViewController moveRecordingsWithUUIDs:toBuiltInFolderOfType:source:](self, "moveRecordingsWithUUIDs:toBuiltInFolderOfType:source:", v11, a4, 0);

    }
  }

}

- (void)_switchToIdleFromPreviousActivityType:(int64_t)a3 fromSubActivityType:(int64_t)a4 toSubActivityType:(int64_t)a5 displayModel:(id)a6 withUUID:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id location;

  v12 = a6;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordingViewController"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v16, "showIdleForUUID:", v13);

  if (a3 == 1)
  {
    if (-[RCMainViewController _cardDismissalRequiredForSwitchToIdleFromActivityType:subActivityType:](self, "_cardDismissalRequiredForSwitchToIdleFromActivityType:subActivityType:", 1, a4))
    {
      objc_initWeak(&location, self);
      v26 = _NSConcreteStackBlock;
      v27 = 3221225472;
      v28 = sub_10008395C;
      v29 = &unk_1001AC138;
      objc_copyWeak(&v30, &location);
      -[RCMainViewController setState:withOptions:completion:](self, "setState:withOptions:completion:", 0, 0, &v26);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    v17 = a4 == 4;
    objc_msgSend(v15, "updateForRecordingEnd:", v17, v26, v27, v28, v29);
    WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
    objc_msgSend(WeakRetained, "updateForRecordingEnd:", v17);

  }
  else if (a5 != 6)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeRecordingsCollectionViewController"));
    objc_msgSend(v20, "showIdleForItemWithUUID:", v13);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uuidOfPlayingRecording"));
    objc_msgSend(v15, "showIdleForUUID:", v22);

    v23 = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uuidOfPlayingRecording"));
    objc_msgSend(v23, "showIdleForUUID:", v25);

  }
  -[RCMainViewController updateQuickActions](self, "updateQuickActions");

}

- (BOOL)_cardDismissalRequiredForSwitchToIdleFromActivityType:(int64_t)a3 subActivityType:(int64_t)a4
{
  return +[RCUserActivity requiresDismissalAtEndOfCaptureForActivityType:subActivityType:](RCUserActivity, "requiresDismissalAtEndOfCaptureForActivityType:subActivityType:", a3, a4);
}

- (void)captureFailedWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (!objc_msgSend(v5, "isEqualToString:", RCVoiceMemosErrorDomain))
    goto LABEL_4;
  v6 = objc_msgSend(v4, "code");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ERROR_RECORDING_FAILED"), &stru_1001B2BC0, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100083C3C;
    v16[3] = &unk_1001AB588;
    v16[4] = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController rc_OKAlertControllerWithTitle:message:handler:](UIAlertController, "rc_OKAlertControllerWithTitle:message:handler:", v8, v9, v16));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeRecordingsCollectionViewController"));
    objc_msgSend(v11, "presentViewController:animated:completion:", v5, 1, 0);

LABEL_4:
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("VMAudioServiceErrorDomain"))
    && objc_msgSend(v4, "code") == (id)6)
  {
    v13 = -[RCMainViewController state](self, "state");

    if (v13 != 1)
      goto LABEL_10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordingViewController"));
    objc_msgSend(v14, "handleDone");

  }
LABEL_10:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController selectedUUID](self, "selectedUUID"));
  if (v15)
    -[RCMainViewController didSelectForUUID:resetPosition:force:](self, "didSelectForUUID:resetPosition:force:", v15, 0, 1);

}

- (void)recordingDurationUpdated:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;

  if (!-[RCMainViewController isRecording](self, "isRecording"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "setRecordingDuration:", a3);

    v30 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController selectedComposition](self, "selectedComposition"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "savedRecordingUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:", v8));

    if (!v30)
      goto LABEL_12;
    if (!v9)
      goto LABEL_12;
    objc_msgSend(v9, "duration");
    if (v10 != a3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creationDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
      v14 = objc_msgSend(v9, "recentlyDeleted");
      v15 = objc_msgSend(v9, "isFavorite");
      v16 = objc_msgSend(v9, "isEnhanced");
      v17 = objc_msgSend(v9, "hasTranscription");
      BYTE2(v29) = objc_msgSend(v9, "wasManuallyRenamed");
      BYTE1(v29) = v17;
      LOBYTE(v29) = v16;
      v18 = objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:](RCRecordingDisplayModel, "recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:", v11, v12, v13, v14, 0, v15, a3, v29));

      v9 = (void *)v18;
      if (!v18)
        goto LABEL_12;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentRecordingDisplayModel"));

    if (v20 != v9)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
      objc_msgSend(v21, "setCurrentRecordingDisplayModel:", v9);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));
    if (!v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "uuidBeingDisplayed"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if (!v26)
      {
LABEL_12:

        return;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "timeController"));
      objc_msgSend(v22, "enablePlaybackWithComposition:displayModel:timeController:", v30, v9, v28);

    }
    goto LABEL_12;
  }
}

- (NSString)selectedUUID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedRecording"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  return (NSString *)v4;
}

- (void)setCurrentTime:(double)a3 withUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeRecordingsCollectionViewController"));
  objc_msgSend(v8, "setCurrentTime:forItemWithUUID:", v6, a3);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordingViewController"));
  objc_msgSend(v10, "updateCurrentTimeForUUID:toTime:", v6, a3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  objc_msgSend(WeakRetained, "updateCurrentTimeForUUID:toTime:", v6, a3);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v12, "updateCurrentTimeForUUID:toTime:", v6, a3);

}

- (void)userDidDeleteRecordingsWithUUIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  -[RCMainViewController _dismissShareMemoVCIfNeededForDeletedUUIDs:](self, "_dismissShareMemoVCIfNeededForDeletedUUIDs:", v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController", (_QWORD)v16));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeRecordingsCollectionViewController"));
        objc_msgSend(v12, "handleDeleteForUUID:", v10);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordingViewController"));
        objc_msgSend(v14, "handleRemovalOfUUID:", v10);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
        objc_msgSend(v15, "handleRemovalOfUUID:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[RCMainViewController updateQuickActions](self, "updateQuickActions");
}

- (void)userDidRecoverRecordingsWithUUIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
        objc_msgSend(v10, "handleRemovalOfUUID:", v9);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeRecordingsCollectionViewController"));

        v14 = objc_opt_class(RCRecentlyDeletedRecordingsCollectionViewController, v13);
        if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
          objc_msgSend(v12, "handleRecoverForUUID:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)userDidEraseRecordingsWithUUIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  -[RCMainViewController _dismissShareMemoVCIfNeededForDeletedUUIDs:](self, "_dismissShareMemoVCIfNeededForDeletedUUIDs:", v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController", (_QWORD)v16));
        objc_msgSend(v11, "handleRemovalOfUUID:", v10);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeRecordingsCollectionViewController"));

        v15 = objc_opt_class(RCRecentlyDeletedRecordingsCollectionViewController, v14);
        if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
          objc_msgSend(v13, "handleEraseForUUID:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[RCMainViewController updateQuickActions](self, "updateQuickActions");
}

- (void)_dismissShareMemoVCIfNeededForDeletedUUIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoViewController presentedController](RCShareMemoViewController, "presentedController"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeRecordingsCollectionViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuidOfSelectedItem"));

    if (objc_msgSend(v8, "containsObject:", v7))
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (RCUndoManager)undoManager
{
  return self->_currentUndoManager;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return -[RCMainViewController _sharedAnimationControllerResolverForFromVC:toVC:](self, "_sharedAnimationControllerResolverForFromVC:toVC:", a5, a6);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[RCMainViewController _sharedAnimationControllerResolverForFromVC:toVC:](self, "_sharedAnimationControllerResolverForFromVC:toVC:", a4, a3, a5);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[RCMainViewController _sharedAnimationControllerResolverForFromVC:toVC:](self, "_sharedAnimationControllerResolverForFromVC:toVC:", a3, 0);
}

- (id)_sharedAnimationControllerResolverForFromVC:(id)a3 toVC:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int isKindOfClass;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v32;

  v6 = a4;
  v7 = a3;
  v9 = objc_opt_class(RCRecordingCardViewController, v8);
  isKindOfClass = objc_opt_isKindOfClass(v6, v9);

  v12 = objc_opt_class(RCRecordingCardViewController, v11);
  v13 = objc_opt_isKindOfClass(v7, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v15 = objc_msgSend(v14, "animatesRecordingCardPresentation");

  v16 = 0;
  if (v15 && ((isKindOfClass | v13) & 1) != 0)
  {
    v16 = objc_alloc_init((Class)_UISheetAnimationController);
    objc_msgSend(v16, "setIsReversed:", (isKindOfClass & 1) == 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "recordingViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));

    objc_msgSend(v19, "intrinsicHeightForBottomAccessoryViewAndSafeArea");
    v21 = v20;
    objc_msgSend(v19, "frame");
    if (CGRectIsEmpty(v32))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController splitViewController](self, "splitViewController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "viewControllerForColumn:", 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
      objc_msgSend(v24, "width");
      v26 = v25;
      objc_msgSend(v24, "bounds");
      v28 = v27;

    }
    else
    {
      objc_msgSend(v19, "bounds");
      v26 = v29;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
      objc_msgSend(v22, "bounds");
      v28 = v30;
    }

    objc_msgSend(v16, "setSourceFrame:", 0.0, v28 - v21, v26, v21);
  }
  return v16;
}

- (BOOL)_shouldPresentPlaybackQuickActions
{
  unsigned __int8 v3;

  v3 = -[RCMainViewController _isRecordingOrBlockedByModal](self, "_isRecordingOrBlockedByModal");
  return (v3 | -[RCMainViewController _libraryIsEditing](self, "_libraryIsEditing")) ^ 1;
}

- (void)updateQuickActions
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController availableQuickActions](self, "availableQuickActions"));
  objc_msgSend(v4, "setShortcutItems:", v3);

}

- (id)availableQuickActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v18;
  const __CFString *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[RCMainViewController canStartNewRecording](self, "canStartNewRecording"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("largecircle.fill.circle")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("START_RECORDING_QUICK_ACTION_TITLE"), &stru_1001B2BC0, CFSTR("Localizable-OrbHW")));

    v7 = objc_msgSend(objc_alloc((Class)UIApplicationShortcutItem), "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.VoiceMemos.NewRecording"), v6, 0, v4, 0);
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[RCMainViewController _shouldPresentPlaybackQuickActions](self, "_shouldPresentPlaybackQuickActions"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recordings"));
    for (i = 0; i != 3; ++i)
    {
      if (i >= (unint64_t)objc_msgSend(v8, "count"))
        break;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
      if (objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("play.circle")));
        v14 = objc_alloc((Class)UIApplicationShortcutItem);
        v19 = CFSTR("uniqueID");
        v20 = v12;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
        v16 = objc_msgSend(v14, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.VoiceMemos.PlayRecording"), v11, 0, v13, v15);

        objc_msgSend(v3, "addObject:", v16);
      }

    }
  }
  return v3;
}

- (BOOL)canHandleCustomAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  id v18;
  id WeakRetained;
  char v20;
  BOOL v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a4;
  v7 = objc_opt_class(UIKeyCommand, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0
    || (objc_msgSend(v5, "modifierFlags") & 0x100000) != 0
    || (-[RCMainViewController isFirstResponder](self, "isFirstResponder") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIResponder currentFirstResponder](UIResponder, "currentFirstResponder"));
    v25 = objc_opt_class(UITextField, v24);
    if ((objc_opt_isKindOfClass(v23, v25) & 1) != 0)
      v8 = objc_msgSend(v23, "isEditing");
    else
      v8 = 0;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedViewController](self, "presentedViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "presentedViewController"));

      v16 = 0;
      v9 = (void *)v15;
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedViewController](self, "presentedViewController"));

  v18 = objc_msgSend(v9, "modalPresentationStyle");
  WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);

  if (v17)
    v20 = v16;
  else
    v20 = 1;
  if (v18 == (id)7)
    v20 = 1;
  if (WeakRetained)
    v20 = 0;
  if ((v8 & 1) != 0)
    v21 = 0;
  else
    v21 = v20;

  return v21;
}

- (BOOL)canStartNewRecording
{
  unsigned int v3;
  void *v4;
  void *v5;
  unsigned int v6;
  int v7;

  v3 = -[RCMainViewController _isRecordingOrBlockedByModal](self, "_isRecordingOrBlockedByModal");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController activeFolderViewController](self, "activeFolderViewController"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController activeFolderViewController](self, "activeFolderViewController"));
    v6 = objc_msgSend(v5, "supportsRecording");

    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 0;
  }

  return ((v3 | v7) & 1) == 0 && !self->_viewIsAppearingOrDisappearing;
}

- (BOOL)_isRecordingOrBlockedByModal
{
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v4 = objc_msgSend((id)v3, "isRecording");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainViewControllerDelegate](self, "mainViewControllerDelegate"));
  LOBYTE(v3) = objc_msgSend(v5, "modalMustShowOrIsShowing");

  return v4 | v3;
}

- (BOOL)_libraryIsEditing
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeRecordingsCollectionViewController"));
  v4 = objc_msgSend(v3, "isEditing");

  return v4;
}

- (void)startNewRecordingAction
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController selectedComposition](self, "selectedComposition"));
  if (!v5
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "savedRecordingUUID")),
        v3,
        v4 = v5,
        v3))
  {
    -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 3, 0, 0, 0, 0.0);
    v4 = v5;
  }

}

- (BOOL)canPlayRecording
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  if ((objc_msgSend(v5, "isRecording") & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
    if (objc_msgSend(v7, "readyForPlayback"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController _uuidOfRecordingForPlaybackActivities](self, "_uuidOfRecordingForPlaybackActivities"));
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
        if ((objc_msgSend(v10, "textFieldIsBeingEdited") & 1) != 0
          || (objc_msgSend(v4, "selectedCellIsEditingTitle") & 1) != 0
          || (objc_msgSend(v4, "selectedCellIsInFlightEditing") & 1) != 0)
        {
          LOBYTE(v6) = 0;
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordingViewController"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
          v6 = objc_msgSend(v14, "textFieldIsBeingEdited") ^ 1;

        }
      }
      else
      {
        LOBYTE(v6) = 0;
      }

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  return v6;
}

- (void)playRecording
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController _uuidOfRecordingForPlaybackActivities](self, "_uuidOfRecordingForPlaybackActivities"));
  -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 2, v3, 0, 0, 0.0);

}

- (BOOL)canRenameRecording
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidBeingDisplayed"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuidBeingDisplayed"));
    v8 = v7 == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)renameRecording
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));
  objc_msgSend(v2, "editSelectedItemTitle");

}

- (BOOL)canShareRecording
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidBeingDisplayed"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeRecordingsCollectionViewController"));
    v7 = objc_msgSend(v6, "selectedCellIsInFlightEditing") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)shareRecording:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v5, "shareCurrentRecording:", v4);

}

- (BOOL)canDuplicateRecording
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedUUIDs"));

  if (objc_msgSend(v5, "count") == (id)1)
    v6 = -[RCMainViewController _canDuplicate](self, "_canDuplicate");
  else
    v6 = 0;

  return v6;
}

- (BOOL)canEditRecording
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));

  if (-[RCMainViewController state](self, "state"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuidBeingDisplayed"));
    if (!v7
      || (objc_msgSend(v4, "selectedCellIsEditingTitle") & 1) != 0
      || (objc_msgSend(v4, "selectedCellIsInFlightEditing") & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
      v5 = objc_msgSend(v9, "isShowingRecentlyDeleted") ^ 1;

    }
  }

  return v5;
}

- (BOOL)canTrimRecording
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v18;

  v3 = -[RCMainViewController isRecording](self, "isRecording");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = objc_msgSend(v6, "recordingViewState");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingViewController"));
  if ((objc_msgSend(v9, "isDisplayingTranscriptView") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    v10 = objc_msgSend(v11, "isDisplayingTranscriptView");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeRecordingsCollectionViewController"));

  LOBYTE(v13) = 0;
  if (v7 == (id)8)
    v14 = 1;
  else
    v14 = v3;
  if ((v14 & 1) == 0 && (v10 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuidBeingDisplayed"));
    if (!v16
      || (objc_msgSend(v12, "selectedCellIsEditingTitle") & 1) != 0
      || (objc_msgSend(v12, "selectedCellIsInFlightEditing") & 1) != 0)
    {
      LOBYTE(v13) = 0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
      LODWORD(v13) = objc_msgSend(v18, "isShowingRecentlyDeleted") ^ 1;

    }
  }

  return (char)v13;
}

- (BOOL)canToggleFavoriteRecording
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidBeingDisplayed"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v6 = objc_msgSend(v5, "isShowingRecentlyDeleted") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)canToggleEnhanceRecording
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[RCMainViewController isRecording](self, "isRecording"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuidBeingDisplayed"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
      v3 = objc_msgSend(v6, "isShowingRecentlyDeleted") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (BOOL)canToggleRemoveSilence
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[RCMainViewController isRecording](self, "isRecording"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuidBeingDisplayed"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
      v3 = objc_msgSend(v6, "isShowingRecentlyDeleted") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (void)duplicateRecording
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeRecordingsCollectionViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidOfSelectedRecording"));
  -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 13, v4, 0, 0, 0.0);

}

- (void)editRecording
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRecordingDisplayModel"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));

  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    objc_msgSend(v5, "stopScrolling");

    -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 23, v6, 0, 0, 0.0);
  }

}

- (void)trimRecording
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidBeingDisplayed"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    objc_msgSend(v5, "stopScrolling");

    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuidBeingDisplayed"));
    -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 31, v6, 0, 0, 0.0);

  }
}

- (BOOL)currentSelectionIsFavorite
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidBeingDisplayed"));

  if (v4)
    v5 = -[RCMainViewController isFavoriteForUUID:](self, "isFavoriteForUUID:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)toggleFavoriteRecording
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidBeingDisplayed"));

  v4 = v5;
  if (v5)
  {
    -[RCMainViewController toggleFavoriteForUUID:](self, "toggleFavoriteForUUID:", v5);
    v4 = v5;
  }

}

- (BOOL)currentSelectionIsEnhanced
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuidBeingDisplayed"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:", v3));
    v5 = objc_msgSend(v4, "isEnhanced");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)toggleEnhanceRecording
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuidBeingDisplayed"));
  -[RCMainViewController toggleEnhanceRecordingForUUID:](self, "toggleEnhanceRecordingForUUID:", v3);

}

- (void)toggleEnhanceRecordingForUUID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:"));
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isEnhanced"))
      v6 = 41;
    else
      v6 = 40;
    -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", v6, v7, 0, 0, 0.0);
  }

}

- (BOOL)currentSelectionHasSilenceRemoved
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidBeingDisplayed"));

  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackSettings](self, "playbackSettings")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid")),
        v7 = objc_msgSend(v6, "isEqual:", v4),
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackSettings](self, "playbackSettings"));
    v9 = objc_msgSend(v8, "silenceRemoved");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)toggleRemoveSilence
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuidBeingDisplayed"));
  -[RCMainViewController toggleRemoveSilenceForUUID:](self, "toggleRemoveSilenceForUUID:", v3);

}

- (void)toggleRemoveSilenceForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackSettings](self, "playbackSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackSettings](self, "playbackSettings"));
    v9 = objc_msgSend(v8, "silenceRemoved") ^ 1;

    -[RCMainViewController setRemoveSilence:forUUID:](self, "setRemoveSilence:forUUID:", v9, v4);
  }
  else
  {
    v10 = OSLogForCategory(kVMLogCategoryDefault);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_10010D51C((uint64_t)v4, self, v11);

  }
}

- (void)displayPlaybackSettingsUI
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackSettings](self, "playbackSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v6 = objc_claimAutoreleasedReturnValue(-[RCMainViewController _uuidOfRecordingForPlaybackActivities](self, "_uuidOfRecordingForPlaybackActivities"));
  v7 = (void *)v6;
  if (v4 && (!v6 || (objc_msgSend(v4, "isEqual:", v6) & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v9 = objc_msgSend(v8, "supportsPopoverPlaybackSettingsPresentation");

    if (v9)
    {
      v10 = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playbackSettingsButtonItem"));
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 44, v4, v10, v11, 0.0);

  }
  else
  {
    v12 = OSLogForCategory(kVMLogCategoryDefault);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10010D5EC(v13, v14, v15, v16, v17, v18, v19, v20);

  }
}

- (void)toggleTranscriptView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedCardViewController](self, "presentedCardViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingViewController"));
    objc_msgSend(v5, "toggleTranscriptView");

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  objc_msgSend(v6, "toggleTranscriptView");

}

- (void)copyTranscript:(id)a3
{
  id v3;
  _TtC10VoiceMemos22RCControlsActionHelper *v4;

  v3 = a3;
  v4 = objc_opt_new(_TtC10VoiceMemos22RCControlsActionHelper);
  -[RCControlsActionHelper transcriptionStringForRecordingUUID:completionHandler:](v4, "transcriptionStringForRecordingUUID:completionHandler:", v3, &stru_1001AD080);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (-[RCMainViewController canHandleCustomAction:withSender:](self, "canHandleCustomAction:withSender:", a3, a4)
    && "delete:" == a3)
  {
    return -[RCMainViewController canDelete](self, "canDelete");
  }
  else
  {
    return 0;
  }
}

- (BOOL)canDelete
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedConfirmationController](self, "presentedConfirmationController"));

  if (v3)
    return 0;
  else
    return -[RCMainViewController _canDelete](self, "_canDelete");
}

- (void)delete:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeRecordingsCollectionViewController"));
  v6 = objc_msgSend(v5, "selectedCellIsEditingTitle");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeRecordingsCollectionViewController"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    if (objc_msgSend(v9, "isShowingRecentlyDeleted"))
      v10 = 18;
    else
      v10 = 15;

    v11 = -[RCMainViewController state](self, "state");
    if (v11 == 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordingViewController"));

      v12 = v15;
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuidBeingDisplayed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
      -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 14, v20, v12, v16, 0.0);

    }
    else
    {
      if (v11)
      {
        v12 = 0;
      }
      else
      {
        v12 = v8;
        if (!objc_msgSend(v12, "isEditing")
          || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedUUIDs")),
              v13,
              !v13))
        {
          v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuidOfSelectedItem"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
          if (v18)
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForUUID:", v20));
          else
            v19 = 0;

          -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", v10, v20, v12, v19, 0.0);
          goto LABEL_17;
        }
        objc_msgSend(v12, "deleteSelectedItems");
      }
      v20 = 0;
    }
LABEL_17:

  }
}

- (BOOL)canJumpForward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuidBeingDisplayed"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    if ((objc_msgSend(v7, "textFieldIsBeingEdited") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordingViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
      if ((objc_msgSend(v11, "textFieldIsBeingEdited") & 1) != 0
        || (objc_msgSend(v4, "selectedCellIsEditingTitle") & 1) != 0
        || (objc_msgSend(v4, "selectedCellIsInFlightEditing") & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
        v8 = objc_msgSend(v13, "canJumpForward");

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)jumpSelectionForward
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController _uuidOfRecordingForPlaybackActivities](self, "_uuidOfRecordingForPlaybackActivities"));
  -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 11, v3, 0, 0, 0.0);

}

- (BOOL)canJumpBackward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuidBeingDisplayed"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    if ((objc_msgSend(v7, "textFieldIsBeingEdited") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordingViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
      if ((objc_msgSend(v11, "textFieldIsBeingEdited") & 1) != 0
        || (objc_msgSend(v4, "selectedCellIsEditingTitle") & 1) != 0
        || (objc_msgSend(v4, "selectedCellIsInFlightEditing") & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self, "mainControllerHelper"));
        v8 = objc_msgSend(v13, "canJumpBackward");

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)jumpSelectionBackward
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController _uuidOfRecordingForPlaybackActivities](self, "_uuidOfRecordingForPlaybackActivities"));
  -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 12, v3, 0, 0, 0.0);

}

- (BOOL)canHandleDone
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = objc_msgSend(v5, "recordingViewState");

  if (!v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v10 = objc_msgSend(v9, "recordingViewState");

  if (v10 != (id)8)
    return 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordingViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v14 = objc_msgSend(v13, "canSaveTrimChanges");

  return v14;
}

- (void)handleDone
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
  objc_msgSend(v2, "handleDone");

}

- (BOOL)canHandleCancel
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = objc_msgSend(v4, "recordingViewState") == (id)8;

  return v5;
}

- (void)handleCancel
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
  objc_msgSend(v2, "handleCancel");

}

- (BOOL)canToggleSidebar
{
  int64_t v3;
  uint64_t v4;
  int64_t v5;

  v3 = -[RCMainViewController state](self, "state");
  v4 = objc_claimAutoreleasedReturnValue(-[RCMainViewController presentedViewController](self, "presentedViewController"));
  v5 = v3 | v4;

  return v5 == 0;
}

- (void)recoverRecording
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuidBeingDisplayed"));
  -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 20, v3, self, 0, 0.0);

}

- (void)eraseRecording
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuidBeingDisplayed"));
  -[RCMainViewController performAction:atPosition:forUUID:sourceController:source:](self, "performAction:atPosition:forUUID:sourceController:source:", 17, v3, self, 0, 0.0);

}

- (id)_uuidOfRecordingForPlaybackActivities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRecordingsCollectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedRecording"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuidBeingDisplayed"));

  }
  return v6;
}

- (BOOL)_canDuplicate
{
  unsigned __int8 v3;
  void *v4;
  char v5;

  v3 = -[RCMainViewController _canDelete](self, "_canDelete");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v5 = objc_msgSend(v4, "isShowingRecentlyDeleted") ^ 1;

  return v3 & v5;
}

- (BOOL)_canDelete
{
  void *v2;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  BOOL v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeRecordingsCollectionViewController"));

  if ((-[RCMainViewController isFirstResponder](self, "isFirstResponder") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIResponder currentFirstResponder](UIResponder, "currentFirstResponder"));
    v9 = objc_opt_class(UITextView, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      objc_msgSend(v7, "selectedRange");
      v6 = v10 != 0;
    }
    else
    {
      v6 = 0;
    }

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuidBeingDisplayed"));
  if (!v12)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuidOfSelectedItem"));
    if (!v2)
    {
      LOBYTE(v16) = 0;
LABEL_17:

      v17 = v16;
      goto LABEL_18;
    }
  }
  if (!-[RCMainViewController state](self, "state")
    && (objc_msgSend(v5, "selectedCellIsEditingTitle") & 1) == 0
    && (objc_msgSend(v5, "selectedCellIsInFlightEditing") & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "searchBar"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "searchTextField"));
    if ((objc_msgSend(v15, "isEditing") & 1) == 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController playbackViewController](self, "playbackViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
      if ((objc_msgSend(v19, "textFieldIsBeingEdited") & 1) != 0)
      {
        LOBYTE(v16) = 0;
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "recordingViewController"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "view"));
        if ((objc_msgSend(v23, "textFieldIsBeingEdited") & 1) != 0)
        {
          LOBYTE(v16) = 0;
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController browseFoldersViewController](self, "browseFoldersViewController"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "recordingViewController"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
          v16 = (objc_msgSend(v20, "editingInFlight") | v6) ^ 1;

        }
      }

      v17 = v16;
      if (!v12)
        goto LABEL_17;
      goto LABEL_18;
    }

  }
  LOBYTE(v16) = 0;
  v17 = 0;
  if (!v12)
    goto LABEL_17;
LABEL_18:

  return v17;
}

- (void)_axAnnounceDidSetEnhanced:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("AX_ENHANCE_ON_ANNOUNCE");
  else
    v6 = CFSTR("AX_ENHANCE_OFF_ANNOUNCE");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1001B2BC0, 0));

  v8 = dispatch_time(0, 800000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000869B4;
  block[3] = &unk_1001AB588;
  v11 = v7;
  v9 = v7;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (RCRecordingStartTimeInfo)recordingStartTimeInfo
{
  return self->recordingStartTimeInfo;
}

- (void)setRecordingStartTimeInfo:(id)a3
{
  objc_storeStrong((id *)&self->recordingStartTimeInfo, a3);
}

- (RCMainViewControllerDelegate)mainViewControllerDelegate
{
  return (RCMainViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_mainViewControllerDelegate);
}

- (BOOL)hideNavigationTitle
{
  return self->_hideNavigationTitle;
}

- (void)setHideNavigationTitle:(BOOL)a3
{
  self->_hideNavigationTitle = a3;
}

- (BOOL)isInForeground
{
  return self->_isInForeground;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setMainControllerHelper:(id)a3
{
  objc_storeStrong((id *)&self->_mainControllerHelper, a3);
}

- (RCRecordingsModelInteractor)recordingsModelInteractor
{
  return self->_recordingsModelInteractor;
}

- (void)setRecordingsModelInteractor:(id)a3
{
  objc_storeStrong((id *)&self->_recordingsModelInteractor, a3);
}

- (RCRecordingCardViewController)presentedCardViewController
{
  return self->_presentedCardViewController;
}

- (void)setPresentedCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedCardViewController, a3);
}

- (RCUndoManager)mainUndoManager
{
  return self->_mainUndoManager;
}

- (void)setMainUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_mainUndoManager, a3);
}

- (NSString)uuidToSelectAfterDismiss
{
  return self->_uuidToSelectAfterDismiss;
}

- (void)setUuidToSelectAfterDismiss:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSMutableDictionary)editingProgressItems
{
  return self->_editingProgressItems;
}

- (void)setEditingProgressItems:(id)a3
{
  objc_storeStrong((id *)&self->_editingProgressItems, a3);
}

- (UIViewController)presentedConfirmationController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentedConfirmationController);
}

- (void)setPresentedConfirmationController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedConfirmationController, a3);
}

- (RCFolderSelectionContainerViewController)presentedSelectFolderViewController
{
  return (RCFolderSelectionContainerViewController *)objc_loadWeakRetained((id *)&self->_presentedSelectFolderViewController);
}

- (void)setPresentedSelectFolderViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedSelectFolderViewController, a3);
}

- (RCPlaybackSettingsViewController)presentedPlaybackSettingsViewController
{
  return (RCPlaybackSettingsViewController *)objc_loadWeakRetained((id *)&self->_presentedPlaybackSettingsViewController);
}

- (void)setPresentedPlaybackSettingsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedPlaybackSettingsViewController, a3);
}

- (UIViewController)presentingPlaybackSettingsViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingPlaybackSettingsViewController);
}

- (void)setPresentingPlaybackSettingsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingPlaybackSettingsViewController, a3);
}

- (UIBarButtonItem)createNewFolderButtonItem
{
  return self->_createNewFolderButtonItem;
}

- (void)setCreateNewFolderButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_createNewFolderButtonItem, a3);
}

- (UIBarButtonItem)flexBarItem
{
  return self->_flexBarItem;
}

- (void)setFlexBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_flexBarItem, a3);
}

- (UIAlertAction)createNewFolderSaveAction
{
  return (UIAlertAction *)objc_loadWeakRetained((id *)&self->_createNewFolderSaveAction);
}

- (void)setCreateNewFolderSaveAction:(id)a3
{
  objc_storeWeak((id *)&self->_createNewFolderSaveAction, a3);
}

- (UIAlertAction)renameFolderSaveAction
{
  return (UIAlertAction *)objc_loadWeakRetained((id *)&self->_renameFolderSaveAction);
}

- (void)setRenameFolderSaveAction:(id)a3
{
  objc_storeWeak((id *)&self->_renameFolderSaveAction, a3);
}

- (NSString)oldFolderName
{
  return self->_oldFolderName;
}

- (void)setOldFolderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (unint64_t)sheetPresentationState
{
  return self->_sheetPresentationState;
}

- (void)setSheetPresentationState:(unint64_t)a3
{
  self->_sheetPresentationState = a3;
}

- (unint64_t)activeDragSessionCount
{
  return self->_activeDragSessionCount;
}

- (void)setActiveDragSessionCount:(unint64_t)a3
{
  self->_activeDragSessionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldFolderName, 0);
  objc_destroyWeak((id *)&self->_renameFolderSaveAction);
  objc_destroyWeak((id *)&self->_createNewFolderSaveAction);
  objc_storeStrong((id *)&self->_flexBarItem, 0);
  objc_storeStrong((id *)&self->_createNewFolderButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingPlaybackSettingsViewController);
  objc_destroyWeak((id *)&self->_presentedPlaybackSettingsViewController);
  objc_destroyWeak((id *)&self->_presentedSelectFolderViewController);
  objc_destroyWeak((id *)&self->_presentedConfirmationController);
  objc_storeStrong((id *)&self->_editingProgressItems, 0);
  objc_storeStrong((id *)&self->_uuidToSelectAfterDismiss, 0);
  objc_storeStrong((id *)&self->_mainUndoManager, 0);
  objc_storeStrong((id *)&self->_presentedCardViewController, 0);
  objc_storeStrong((id *)&self->_browseFoldersViewController, 0);
  objc_storeStrong((id *)&self->_recordingsModelInteractor, 0);
  objc_storeStrong((id *)&self->_mainControllerHelper, 0);
  objc_storeStrong(&self->_foregroundCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_mainViewControllerDelegate);
  objc_destroyWeak((id *)&self->_playbackViewController);
  objc_storeStrong((id *)&self->recordingStartTimeInfo, 0);
  objc_destroyWeak((id *)&self->_lockScreenRecordingViewController);
  objc_storeStrong((id *)&self->_currentUndoManager, 0);
}

@end

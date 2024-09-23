@implementation RCRecordingViewController

- (void)viewDidLayoutSubviews
{
  id v3;
  RCDebugOverlay *alwaysOnDebugOverlay;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCRecordingViewController;
  v3 = -[RCRecordingViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  if (RCSupportsDebugAODOverlay(v3))
  {
    alwaysOnDebugOverlay = self->_alwaysOnDebugOverlay;
    if (alwaysOnDebugOverlay)
      -[RCDebugOverlay needsUpdateForBoundsChange](alwaysOnDebugOverlay, "needsUpdateForBoundsChange");
  }
}

- (BOOL)supportsAppEntityInteraction
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v3 = (unint64_t)objc_msgSend(v2, "displayStyle");

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_styleView
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = objc_msgSend(v3, "playbackCardHasInsets");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v5, "setClipsToBounds:", v4);

}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCRecordingViewController;
  -[RCRecordingViewController loadView](&v4, "loadView");
  v3 = (void *)objc_opt_new(-[RCRecordingViewController _viewClass](self, "_viewClass"));
  -[RCRecordingViewController setView:](self, "setView:", v3);
  objc_msgSend(v3, "setViewDelegate:", self);
  -[RCRecordingViewController _styleView](self, "_styleView");
  -[RCRecordingViewController _classSpecificLoadView](self, "_classSpecificLoadView");

}

- (void)viewDidLoad
{
  void *v3;
  RCDebugOverlay *v4;
  void *v5;
  RCDebugOverlay *v6;
  RCDebugOverlay *alwaysOnDebugOverlay;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;
  void *v13;

  v12.receiver = self;
  v12.super_class = (Class)RCRecordingViewController;
  -[RCRecordingViewController viewDidLoad](&v12, "viewDidLoad");
  -[RCRecordingViewController _setupTranscriptViewDependenciesIfNeeded](self, "_setupTranscriptViewDependenciesIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
  objc_msgSend(v3, "registerObserver:", self);

  v4 = [RCDebugOverlay alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v6 = -[RCDebugOverlay initWithParentView:shouldObserveChanges:](v4, "initWithParentView:shouldObserveChanges:", v5, 1);
  alwaysOnDebugOverlay = self->_alwaysOnDebugOverlay;
  self->_alwaysOnDebugOverlay = v6;

  v8 = objc_opt_self(UITraitBacklightLuminance);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v13 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v11 = -[RCRecordingViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v10, "_traitCollectionDidChange:previousTraitCollection:");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCRecordingViewController;
  -[RCRecordingViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (-[RCRecordingViewController supportsAppEntityInteraction](self, "supportsAppEntityInteraction"))
    -[RCRecordingViewController registerAppEntityInteraction](self, "registerAppEntityInteraction");
}

- (void)setRecordingViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recordingViewControllerDelegate, a3);
}

- (Class)_viewClass
{
  return (Class)objc_opt_class(RCRecordingView, a2);
}

- (void)setActiveTimeController:(id)a3
{
  RCTimeController **p_activeTimeController;
  id v5;
  id WeakRetained;
  id v7;
  id v8;

  p_activeTimeController = &self->_activeTimeController;
  v8 = a3;
  v5 = objc_storeWeak((id *)p_activeTimeController, v8);
  -[RCAVWaveformViewController setActiveTimeController:](self->_waveformViewController, "setActiveTimeController:", v8);

  WeakRetained = objc_loadWeakRetained((id *)p_activeTimeController);
  -[RCAVWaveformViewController setActiveTimeController:](self->_overviewWaveformViewController, "setActiveTimeController:", WeakRetained);

  v7 = objc_loadWeakRetained((id *)p_activeTimeController);
  -[TranscriptViewCoordinator setTimeController:](self->_transcriptViewCoordinator, "setTimeController:", v7);

}

- (void)setLiveTranscription:(id)a3
{
  _TtC10VoiceMemos19RCLiveTranscription **p_liveTranscription;
  id v5;

  p_liveTranscription = &self->_liveTranscription;
  v5 = a3;
  objc_storeWeak((id *)p_liveTranscription, v5);
  -[RCRecordingViewController _configureTranscriptViewForLiveTranscription:](self, "_configureTranscriptViewForLiveTranscription:", v5);

}

- (void)setWaveformDataSource:(id)a3
{
  RCWaveformDataSource **p_waveformDataSource;
  id WeakRetained;
  void *v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  id obj;

  p_waveformDataSource = &self->_waveformDataSource;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_waveformDataSource);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_waveformDataSource);
    v8 = objc_msgSend(v7, "finished");

    if ((v8 & 1) == 0)
    {
      v9 = objc_loadWeakRetained((id *)p_waveformDataSource);
      objc_msgSend(v9, "cancelLoading");

    }
  }
  objc_storeWeak((id *)p_waveformDataSource, obj);
  -[RCRecordingViewController _configureWaveformViewWithDataSource:](self, "_configureWaveformViewWithDataSource:", obj);

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
  v9.super_class = (Class)RCRecordingViewController;
  v7 = a4;
  -[RCRecordingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005A04C;
  v8[3] = &unk_1001ABA08;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCRecordingViewController;
  -[RCRecordingViewController viewIsAppearing:](&v8, "viewIsAppearing:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  -[RCRecordingViewController _registerForSceneStateChanges:](self, "_registerForSceneStateChanges:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
  objc_msgSend(v7, "windowSceneWillEnterForeground");

}

- (void)_setupTranscriptViewDependenciesIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  _TtC10VoiceMemos25TranscriptViewCoordinator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
  v4 = objc_msgSend(v3, "deviceIsSupported");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));

    if (!v5)
    {
      v6 = objc_alloc_init(_TtC10VoiceMemos25TranscriptViewCoordinator);
      -[RCRecordingViewController setTranscriptViewCoordinator:](self, "setTranscriptViewCoordinator:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
      objc_msgSend(v7, "setTranscriptViewHost:", self);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transcriptView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
      objc_msgSend(v10, "setTranscriptView:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
      objc_msgSend(v12, "bounds");
      objc_msgSend(v11, "didChangeHostViewWidth:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "windowScene"));

      if (objc_msgSend(v17, "activationState") == (id)1 || !objc_msgSend(v17, "activationState"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
        objc_msgSend(v16, "windowSceneWillEnterForeground");

      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCRecordingViewController;
  -[RCRecordingViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[RCRecordingViewController removeAppEntityInteraction](self, "removeAppEntityInteraction");
}

- (void)_registerForSceneStateChanges:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_sceneWillEnterForegroundNotification:", UISceneWillEnterForegroundNotification, v4);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_sceneDidEnterBackgroundNotification:", UISceneDidEnterBackgroundNotification, v4);

  }
}

- (void)_sceneWillEnterForegroundNotification:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator", a3));
  objc_msgSend(v3, "windowSceneWillEnterForeground");

}

- (void)_sceneDidEnterBackgroundNotification:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator", a3));
  objc_msgSend(v3, "windowSceneDidEnterBackground");

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  id v6;
  RCTimelineGenerator *v7;
  void *v8;
  void *v9;
  void *v10;
  RCTimelineGenerator *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "isInAndromeda");

  if (-[RCRecordingViewController _supportsTimelineGeneration](self, "_supportsTimelineGeneration")
    && (_DWORD)v6 != objc_msgSend(v17, "isInAndromeda"))
  {
    if ((_DWORD)v6)
    {
      v7 = [RCTimelineGenerator alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingStartTimeInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController elapsedRecordingTimeInfo](self, "elapsedRecordingTimeInfo"));
      v11 = -[RCTimelineGenerator initWithRecordingStartTimeInfo:elapsedRecordingTimeInfo:](v7, "initWithRecordingStartTimeInfo:elapsedRecordingTimeInfo:", v9, v10);
      -[RCRecordingViewController setTimelineGenerator:](self, "setTimelineGenerator:", v11);

      if (RCSupportsDebugAODOverlay(-[RCRecordingViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2)))-[RCDebugOverlay addToParentView](self->_alwaysOnDebugOverlay, "addToParentView");
    }
    else
    {
      -[RCRecordingViewController setTimelineGenerator:](self, "setTimelineGenerator:", 0);
      if (RCSupportsDebugAODOverlay(-[RCRecordingViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 0)))-[RCDebugOverlay removeFromParentView](self->_alwaysOnDebugOverlay, "removeFromParentView");
    }
    -[RCRecordingViewController updateTraitsIfNeeded](self, "updateTraitsIfNeeded");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
    objc_msgSend(v12, "setBlurred:", v6);

    v13 = v6 & -[RCRecordingViewController isRecording](self, "isRecording");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v14, "setShouldHideSubseconds:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v15, "setForceDisableRecordingControl:", v6);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v16, "restyle");

    -[RCRecordingViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }

}

- (int64_t)preferredStatusBarStyle
{
  return -[RCRecordingViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle") == (id)2;
}

- (BOOL)_supportsTimelineGeneration
{
  return 1;
}

- (void)restyle
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController viewIfLoaded](self, "viewIfLoaded"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      v6 = objc_msgSend(v5, "shouldShowOverviewWaveform");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
      v10 = v9;
      if (v6)
        objc_msgSend(v9, "setFixedOverviewWaveformView:", v8);
      else
        objc_msgSend(v9, "setTrimOverviewWaveformView:", v8);

    }
    -[RCRecordingViewController _styleView](self, "_styleView");
    v11 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v11, "restyle");

  }
}

- (void)_reset
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v3, "reset");

  -[RCRecordingViewController _configureWaveformViewWithDataSource:](self, "_configureWaveformViewWithDataSource:", 0);
  -[RCRecordingViewController _clearTranscriptView](self, "_clearTranscriptView");
  -[RCRecordingViewController updateWithRecordingModel:](self, "updateWithRecordingModel:", 0);
}

- (int64_t)recordingControlState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v3 = objc_msgSend(v2, "recordingControlState");

  return (int64_t)v3;
}

- (void)actionActivated:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  switch(a3)
  {
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      v5 = v3;
      v4 = 3;
      goto LABEL_7;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      v5 = v3;
      v4 = 5;
      goto LABEL_7;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      v5 = v3;
      v4 = 4;
      goto LABEL_7;
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      v5 = v3;
      v4 = 7;
      goto LABEL_7;
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      v5 = v3;
      v4 = 6;
LABEL_7:
      objc_msgSend(v3, "performAction:atPosition:forUUID:sourceController:source:", v4, 0, 0, 0, 0.0);

      break;
    default:
      return;
  }
}

- (void)updateForRecordingStart:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waveformViewController"));
  objc_msgSend(v6, "resetZoomScale");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v7, "setShouldSaveAsNew:", v3);

  objc_msgSend(v8, "updateForRecordingStart");
}

- (void)_updateRecordButtonViewState:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v4, "currentTime");
  v6 = v5;

  objc_msgSend(v7, "updateRecordButtonViewStateWithCurrentTime:", v6);
}

- (void)updateForRecordingPause
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  -[RCRecordingViewController _updateRecordButtonViewState:](self, "_updateRecordButtonViewState:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v4, "setIsEditMode:", 1);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  objc_msgSend(v5, "setIsEditMode:", 1);

}

- (void)updateForRecordingPauseAtEnd
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v3, "setIsEditMode:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  objc_msgSend(v4, "setIsEditMode:", 1);

}

- (void)updateForRecordingAppend
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v3, "setRecordingViewState:", 6);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v4, "setIsEditMode:", 1);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  objc_msgSend(v5, "setIsEditMode:", 1);

}

- (void)updateForRecordingReplace
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v3, "setRecordingViewState:", 7);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v4, "setIsEditMode:", 1);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  objc_msgSend(v5, "setIsEditMode:", 1);

}

- (void)updateForTrimMode
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v2, "setRecordingViewState:", 8);

}

- (void)updateForRecordingEnd:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v5, "updateForRecordingEnd:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v7 = objc_msgSend(v6, "displayStyle");

  if (v7 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
    objc_msgSend(v8, "setCurrentTime:", 0.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v9, "setCurrentTime:", 0.0);

    -[RCRecordingViewController _reset](self, "_reset");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
    objc_msgSend(v10, "setIsEditMode:", 1);

    v11 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
    objc_msgSend(v11, "setIsEditMode:", 1);

  }
}

- (void)updateUndoState:(BOOL)a3 isNewRecording:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v6, "undoStateChanged:isNewRecording:", v5, v4);

}

- (void)updateTrimSaveState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v4, "trimSaveStateChanged:", v3);

}

- (void)prepareForPresent:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v4, "prepareForPresent:", v3);

}

- (void)updateForSizeChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v2, "updateForSizeChange");

}

- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4
{
  double var1;
  double var0;
  void *v8;
  id v9;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v8, "setSelectedTimeRange:animationDuration:", var0, var1, a4);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  objc_msgSend(v9, "setSelectedTimeRange:animationDuration:", var0, var1, a4);

}

- (void)setInPointToCurrentTime
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v3, "currentTime");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v6, "selectedTimeRange");
  v8 = v7;
  v10 = v9;

  if (v5 > v10 || v8 == v10)
    v12 = -1.0;
  else
    v12 = v10;
  -[RCRecordingViewController setSelectedTimeRange:animationDuration:](self, "setSelectedTimeRange:animationDuration:", v5, v12, 0.0);
}

- (void)setOutPointToCurrentTime
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v3, "currentTime");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v6, "selectedTimeRange");
  v8 = v7;
  v10 = v9;

  if (v8 != v10)
  {
    if (v5 <= v8)
      v11 = -1.0;
    else
      v11 = v5;
    -[RCRecordingViewController setSelectedTimeRange:animationDuration:](self, "setSelectedTimeRange:animationDuration:", v8, v11, 0.0);
  }
}

- (void)toggleTranscriptView
{
  void *v3;
  _BOOL8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v4 = objc_msgSend(v3, "centerContentViewState") == 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v5, "setCenterContentViewState:", v4);

  -[RCRecordingViewController _didToggleTranscriptView](self, "_didToggleTranscriptView");
}

- (void)_beginFileTranscriptionIfNeeded
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  id v17;

  v3 = objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[RCRecordingViewController isDisplayingTranscriptView](self, "isDisplayingTranscriptView");

    if (v5)
    {
      v6 = -[RCRecordingViewController isRecording](self, "isRecording");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
      v8 = objc_msgSend(v7, "isPerformingLiveTranscription");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
      v11 = objc_msgSend(v9, "isProcessingOrDisplayingFileTranscriptionForUUID:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController composition](self, "composition"));
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController composition](self, "composition"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "decomposedFragments"));
        v15 = objc_msgSend(v14, "count") == 0;

      }
      else
      {
        v15 = 1;
      }

      if ((v6 | v8 | v11) != 1 && v15)
      {
        v17 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
        objc_msgSend(v17, "beginFileTranscriptionForRecordingUUID:", v16);

      }
    }
  }
}

- (BOOL)isDisplayingTranscriptView
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v3 = objc_msgSend(v2, "centerContentViewState") == (id)1;

  return v3;
}

- (void)showPlayingForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v7, "setPlayControlState:", 1);

  }
}

- (void)showIdleForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v7, "setPlayControlState:", 0);

  }
}

- (void)renameForUUID:(id)a3 toNewTitle:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v9, "setRecordingTitle:", v10);

  }
}

- (void)handleDeleteForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[RCRecordingViewController _reset](self, "_reset");
}

- (void)updateCurrentTimeForUUID:(id)a3 toTime:(double)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v9, "setCurrentTime:", a4);

  }
}

- (void)updateToEditingInFlight:(BOOL)a3 progress:(float)a4 forUUID:(id)a5
{
  _BOOL4 v6;
  void *v8;
  NSMutableDictionary *v9;
  RCEditingStatusItem *v10;
  RCEditingStatusItem *v11;
  RCEditingStatusItem *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v16 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController editingStatusDict](self, "editingStatusDict"));

  if (!v8)
  {
    v9 = objc_opt_new(NSMutableDictionary);
    -[RCRecordingViewController setEditingStatusDict:](self, "setEditingStatusDict:", v9);

  }
  v10 = (RCEditingStatusItem *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController editingStatusDict](self, "editingStatusDict"));
  v11 = v10;
  if (v6)
  {
    v12 = (RCEditingStatusItem *)objc_claimAutoreleasedReturnValue(-[RCEditingStatusItem objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v16));

    if (!v12)
      v12 = objc_opt_new(RCEditingStatusItem);
    *(float *)&v13 = a4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
    -[RCEditingStatusItem setProgress:](v12, "setProgress:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController editingStatusDict](self, "editingStatusDict"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v16);

    v11 = v12;
  }
  else
  {
    -[RCEditingStatusItem setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", 0, v16);
  }

  -[RCRecordingViewController _syncEditingInFlight](self, "_syncEditingInFlight");
}

- (void)_syncEditingInFlight
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController editingStatusDict](self, "editingStatusDict"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  if (v10)
  {
    objc_msgSend(v5, "setEditingInFlight:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "progress"));
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    LODWORD(v9) = v7;
    objc_msgSend(v8, "setEditingProgress:", v9);

  }
  else
  {
    objc_msgSend(v5, "setEditingInFlight:", 0);
  }

}

- (void)performAction:(int64_t)a3 atPosition:(double)a4 source:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[RCRecordingViewController stopScrolling](self, "stopScrolling");
  v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v10, "performAction:atPosition:forUUID:sourceController:source:", a3, v9, self, v8, a4);

}

- (void)performRenameWithNewTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  objc_msgSend(v6, "performRenameWithNewTitle:forUUID:", v4, v5);

}

- (void)updateAfterRecordingWithRecordingModel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  if (objc_msgSend(v4, "recordingViewState") == (id)1)
  {

LABEL_4:
    -[RCRecordingViewController updateWithRecordingModel:](self, "updateWithRecordingModel:", v8);
    v7 = v8;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v6 = objc_msgSend(v5, "displayStyle");

  v7 = v8;
  if (v6 == (id)3)
    goto LABEL_4;
LABEL_5:

}

- (void)updateWithRecordingModel:(id)a3
{
  -[RCRecordingViewController updateWithRecordingModel:requireMatchingUUID:](self, "updateWithRecordingModel:requireMatchingUUID:", a3, 0);
}

- (void)updateWithRecordingModel:(id)a3 requireMatchingUUID:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  if (!v4
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUID")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID")),
        v8 = objc_msgSend(v6, "isEqualToString:", v7),
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUID"));
    -[RCRecordingViewController setUUID:](self, "setUUID:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v11, "setRecordingTitle:", v10);

    objc_msgSend(v19, "duration");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v14, "setRecordingDuration:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "creationDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v16, "setCreationDate:", v15);

    v17 = objc_msgSend(v19, "hasTranscription");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v18, "setHasTranscription:", v17);

  }
}

- (void)updateWithPlaybackSettings:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(a3, "hasCustomizedPlaybackSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v5, "setHasCustomizedPlaybackSettings:", v4);

}

- (void)setCurrentTime:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v4, "setCurrentTime:", a3);

}

- (void)startEditWithComposition:(id)a3 displayModel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v8, "updateForEditingStart");

  -[RCRecordingViewController setComposition:](self, "setComposition:", v7);
  v16 = objc_msgSend(objc_alloc((Class)RCCompositionWaveformDataSource), "initWithComposition:", v7);

  -[RCRecordingViewController setWaveformDataSource:](self, "setWaveformDataSource:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);
  objc_msgSend(v9, "setActiveTimeController:", WeakRetained);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  v12 = objc_loadWeakRetained((id *)&self->_activeTimeController);
  objc_msgSend(v11, "setActiveTimeController:", v12);

  -[RCRecordingViewController updateWithRecordingModel:](self, "updateWithRecordingModel:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  -[RCRecordingViewController audioWaveformControllerDidChangeAVTimes:](self, "audioWaveformControllerDidChangeAVTimes:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "waveformViewController"));
  objc_msgSend(v15, "resetZoomScale");

  -[RCRecordingViewController _beginFileTranscriptionIfNeeded](self, "_beginFileTranscriptionIfNeeded");
}

- (id)createNewWaveformViewControllerWithDataSource:(id)a3 isOverview:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RCAVWaveformViewController *v7;
  id WeakRetained;

  v4 = a4;
  v6 = a3;
  v7 = -[RCAVWaveformViewController initWithWaveformDataSource:displayStyle:isOverview:delegate:]([RCAVWaveformViewController alloc], "initWithWaveformDataSource:displayStyle:isOverview:delegate:", v6, 0, v4, self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);
  -[RCAVWaveformViewController setActiveTimeController:](v7, "setActiveTimeController:", WeakRetained);

  return v7;
}

- (void)_configureWaveformViewWithDataSource:(id)a3
{
  RCAVWaveformViewController *waveformViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  RCAVWaveformViewController *overviewWaveformViewController;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v20 = a3;
  waveformViewController = self->_waveformViewController;
  if (!waveformViewController)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController createNewWaveformViewControllerWithDataSource:isOverview:](self, "createNewWaveformViewControllerWithDataSource:isOverview:", v20, 0));
    -[RCRecordingViewController setWaveformViewController:](self, "setWaveformViewController:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    objc_msgSend(v7, "setWaveformView:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waveformViewController"));
    objc_msgSend(v8, "setIsOverview:", 0);

    -[RCRecordingViewController addChildViewController:](self, "addChildViewController:", v5);
    -[RCAVWaveformViewController didMoveToParentViewController:](self->_waveformViewController, "didMoveToParentViewController:", self);

    waveformViewController = self->_waveformViewController;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);
  -[RCAVWaveformViewController reloadWaveformDataSource:withActiveTimeController:](waveformViewController, "reloadWaveformDataSource:withActiveTimeController:", v20, WeakRetained);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self->_waveformViewController, "waveformViewController"));
  objc_msgSend(v10, "setIsOverview:", 0);

  overviewWaveformViewController = self->_overviewWaveformViewController;
  if (!overviewWaveformViewController)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController createNewWaveformViewControllerWithDataSource:isOverview:](self, "createNewWaveformViewControllerWithDataSource:isOverview:", v20, 1));
    -[RCRecordingViewController setOverviewWaveformViewController:](self, "setOverviewWaveformViewController:", v12);
    -[RCRecordingViewController addChildViewController:](self, "addChildViewController:", v12);
    objc_msgSend(v12, "didMoveToParentViewController:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v14 = objc_msgSend(v13, "shouldShowOverviewWaveform");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    v17 = v16;
    if (v14)
      objc_msgSend(v16, "setFixedOverviewWaveformView:", v15);
    else
      objc_msgSend(v16, "setTrimOverviewWaveformView:", v15);

    overviewWaveformViewController = self->_overviewWaveformViewController;
  }
  v18 = objc_loadWeakRetained((id *)&self->_activeTimeController);
  -[RCAVWaveformViewController reloadWaveformDataSource:withActiveTimeController:](overviewWaveformViewController, "reloadWaveformDataSource:withActiveTimeController:", v20, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self->_overviewWaveformViewController, "waveformViewController"));
  objc_msgSend(v19, "setIsOverview:", 1);

  -[RCRecordingViewController _syncWaveformCompactness](self, "_syncWaveformCompactness");
}

- (void)_syncWaveformCompactness
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v4 = objc_msgSend(v3, "displayStyle");

  if (v4 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v5 = (unint64_t)objc_msgSend(v6, "supportsCompactRecordingCard");

  }
  else
  {
    v5 = v4 == (id)2;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v8 = (char *)objc_msgSend(v7, "recordingViewState");

  if ((unint64_t)(v8 - 2) < 6)
    v9 = v5;
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "waveformViewController"));
  objc_msgSend(v11, "setShowPlayBarOnly:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "waveformViewController"));
  objc_msgSend(v13, "setIsCompactView:", v5);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v14, "setUserInteractionEnabled:", v4 == (id)3);

}

- (void)_configureTranscriptViewForLiveTranscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
  objc_msgSend(v5, "beginLiveTranscription:", v4);

}

- (void)_clearTranscriptView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
  objc_msgSend(v2, "clearData");

}

- (void)handleCancel
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v4 = objc_msgSend(v3, "recordingViewState");

  if (v4 == (id)8)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
    objc_msgSend(v5, "cancelTrimMode");

  }
}

- (void)cleanupAfterExitTrim
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeTimeController"));
  objc_msgSend(v4, "currentRate");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v8 = v7;
  if (v6 <= 0.0)
    v9 = 3;
  else
    v9 = 2;
  objc_msgSend(v7, "setRecordingViewState:", v9);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v10, "currentTime");
  objc_msgSend(v11, "updateRecordButtonViewStateWithCurrentTime:");

}

- (void)handleDone
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v3 = (unint64_t)objc_msgSend(v6, "recordingViewState");
  if (v3 <= 8)
  {
    if (((1 << v3) & 0x3C) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      objc_msgSend(v4, "endEditing");
    }
    else if (((1 << v3) & 0xC2) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      objc_msgSend(v4, "performAction:atPosition:forUUID:sourceController:source:", 4, 0, 0, 0, 0.0);
    }
    else
    {
      if (v3 != 8)
        goto LABEL_7;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      objc_msgSend(v5, "exitTrimMode");

      objc_msgSend(v6, "setRecordingViewState:", 5);
      +[RCAnalyticsUtilities sendDidTrimVoiceMemo](RCAnalyticsUtilities, "sendDidTrimVoiceMemo");
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
      objc_msgSend(v4, "currentTime");
      objc_msgSend(v6, "updateRecordButtonViewStateWithCurrentTime:");
    }

  }
LABEL_7:

}

- (void)cleanupAfterDismiss
{
  id v3;

  -[RCRecordingViewController _reset](self, "_reset");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v3, "cleanupAfterDismiss");

}

- (void)reset
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v2, "reset");

}

- (BOOL)recordingTitleHasBeenEdited
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  v5 = objc_msgSend(v3, "recordingTitleHasBeenEditedForUUID:", v4);

  return v5;
}

- (BOOL)isRecording
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  v3 = objc_msgSend(v2, "isRecording");

  return v3;
}

- (void)didUpdateRecordingViewState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  objc_msgSend(v2, "didUpdateRecordingViewState");

}

- (void)didUpdateRecordingViewDisplayStyle
{
  void *v3;
  id v4;
  id v5;

  if (-[RCRecordingViewController isDisplayingTranscriptView](self, "isDisplayingTranscriptView"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    v4 = objc_msgSend(v3, "displayStyle");

    if (v4 != (id)3)
      -[RCRecordingViewController toggleTranscriptView](self, "toggleTranscriptView");
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  objc_msgSend(v5, "didUpdateRecordingViewDisplayStyle");

}

- (void)willUpdateRecordingCenterContentViewState:(int64_t)a3
{
  id v3;

  if (a3 == 1)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
    objc_msgSend(v3, "willDisplayTranscriptView");

  }
}

- (void)didUpdateRecordingCenterContentViewState
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  objc_msgSend(v3, "didUpdateRecordingCenterContentViewState");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v5 = objc_msgSend(v4, "centerContentViewState");

  if (v5 != (id)1)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
    objc_msgSend(v6, "didDismissTranscriptView");

  }
}

- (void)willUpdateRecordingViewTranscriptState:(int64_t)a3
{
  id v3;
  id v4;

  if (a3)
  {
    if (a3 == 1)
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
      objc_msgSend(v3, "willExpandTranscriptView");

    }
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
    objc_msgSend(v4, "willCollapseTranscriptView");

  }
}

- (void)recordingViewWidthDidChange:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController transcriptViewCoordinator](self, "transcriptViewCoordinator"));
  objc_msgSend(v4, "didChangeHostViewWidth:", a3);

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  if (objc_msgSend(v3, "displayStyle") == (id)2)
  {

    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v5 = objc_msgSend(v4, "recordingViewState");

  if (v5 == (id)1)
    return 0;
  -[RCRecordingViewController handleDone](self, "handleDone");
  return 1;
}

- (void)stopScrolling
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waveformViewController"));
  objc_msgSend(v2, "stopScrolling");

}

- (void)expandTranscriptView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v2, "setTranscriptViewState:", 1);

}

- (void)collapseTranscriptView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v2, "setTranscriptViewState:", 0);

}

- (void)audioWaveformControllerDidChangeAVTimes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  RCElapsedRecordingTimeInfo *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  char v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  unsigned int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;

  v53 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  if (v4 == v53)
  {

    v6 = v53;
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));

    v6 = v53;
    if (v5 != v53)
      goto LABEL_28;
  }
  if ((byte_1001ED8E0 & 1) != 0)
    goto LABEL_28;
  byte_1001ED8E0 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v8 = objc_msgSend(v7, "playControlState");

  v9 = -[RCRecordingViewController isRecording](self, "isRecording");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v11 = objc_msgSend(v10, "recordingViewState");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController activeTimeController](self, "activeTimeController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController elapsedRecordingTimeInfo](self, "elapsedRecordingTimeInfo"));

  if (!v13)
  {
    v14 = objc_alloc_init(RCElapsedRecordingTimeInfo);
    -[RCRecordingViewController setElapsedRecordingTimeInfo:](self, "setElapsedRecordingTimeInfo:", v14);

  }
  v15 = mach_absolute_time();
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController elapsedRecordingTimeInfo](self, "elapsedRecordingTimeInfo"));
  objc_msgSend(v16, "setMachElapsedRecordingTime:", v15);

  objc_msgSend(v12, "currentTime");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController elapsedRecordingTimeInfo](self, "elapsedRecordingTimeInfo"));
  objc_msgSend(v19, "setElapsedRecordingTime:", v18);

  objc_msgSend(v12, "currentDuration");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v22, "setRecordingDuration:", v21);

  objc_msgSend(v12, "currentTime");
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  objc_msgSend(v25, "setCurrentTime:", v24);

  if (v8)
    v26 = 1;
  else
    v26 = v9;
  if ((v26 & 1) == 0 && v11)
  {
    -[RCRecordingViewController _updateRecordButtonViewState:](self, "_updateRecordButtonViewState:", v53);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController traitCollection](self, "traitCollection"));
    if ((objc_msgSend(v27, "isInAndromeda") & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController timelineGenerator](self, "timelineGenerator"));

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "window"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "windowScene"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_backlightSceneEnvironment"));
        objc_msgSend(v32, "invalidateAllTimelinesForReason:", CFSTR("Recording Stopped"));

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
        objc_msgSend(v33, "setShouldHideSubseconds:", 0);

        -[RCRecordingViewController setTimelineGenerator:](self, "setTimelineGenerator:", 0);
      }
    }
    else
    {

    }
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  if (objc_msgSend(v34, "recordingViewState") != (id)8)
  {

    goto LABEL_21;
  }
  objc_msgSend(v53, "selectedTimeRange");
  v36 = v35;
  v38 = v37;
  objc_msgSend(v12, "currentDuration");
  v40 = RCTimeRangeMake(0.0, v39);
  v42 = RCTimeRangeEqualToTimeRange(v36, v38, v40, v41);

  if ((v42 & 1) != 0)
  {
LABEL_21:
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
    v44 = v43;
    v45 = 0;
    goto LABEL_22;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
  v44 = v43;
  v45 = 1;
LABEL_22:
  objc_msgSend(v43, "setTrimEnabled:", v45);

  v46 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  if (v46 == v53)
  {
    v50 = objc_claimAutoreleasedReturnValue(-[RCRecordingViewController waveformViewController](self, "waveformViewController"));
  }
  else
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "waveformViewController"));
    v49 = objc_msgSend(v48, "isSelectionOverlayCurrentlyTracking");

    if (v49)
      -[RCRecordingViewController stopScrolling](self, "stopScrolling");
    v50 = objc_claimAutoreleasedReturnValue(-[RCRecordingViewController overviewWaveformViewController](self, "overviewWaveformViewController"));
  }
  v51 = (void *)v50;
  objc_msgSend(v53, "selectedTimeRange");
  objc_msgSend(v51, "setSelectedTimeRange:animationDuration:");

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  objc_msgSend(v53, "currentTime");
  objc_msgSend(v52, "waveformTimeUpdated:");

  byte_1001ED8E0 = 0;
  v6 = v53;
LABEL_28:

}

- (void)handleRemovalOfUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController UUID](self, "UUID"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
    -[RCRecordingViewController _reset](self, "_reset");
}

- (BOOL)hasShareableComposition
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController composition](self, "composition"));
  v3 = objc_msgSend(v2, "compositionIsShareable");

  return v3;
}

- (id)_timelinesForDateInterval:(id)a3
{
  id v4;
  void *v5;
  RCTimelineGenerator *v6;
  void *v7;
  void *v8;
  void *v9;
  RCTimelineGenerator *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (-[RCRecordingViewController isRecording](self, "isRecording"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController timelineGenerator](self, "timelineGenerator"));

    if (!v5)
    {
      v6 = [RCTimelineGenerator alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingStartTimeInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController elapsedRecordingTimeInfo](self, "elapsedRecordingTimeInfo"));
      v10 = -[RCTimelineGenerator initWithRecordingStartTimeInfo:elapsedRecordingTimeInfo:](v6, "initWithRecordingStartTimeInfo:elapsedRecordingTimeInfo:", v8, v9);
      -[RCRecordingViewController setTimelineGenerator:](self, "setTimelineGenerator:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController timelineGenerator](self, "timelineGenerator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController elapsedRecordingTimeInfo](self, "elapsedRecordingTimeInfo"));
    objc_msgSend(v12, "elapsedRecordingTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timelinesForDateInterval:displayedRecordingTime:timelineIdentifier:", v4, CFSTR("RCAlwaysOnRecordingIdentifier")));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCTimelineGenerator emptyTimelineWithIdentifier:](RCTimelineGenerator, "emptyTimelineWithIdentifier:", CFSTR("RCAlwaysOnEmptyIdentifier")));
  }

  return v13;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  RCDebugOverlay *alwaysOnDebugOverlay;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entrySpecifierForTimelineIdentifier:", CFSTR("RCAlwaysOnRecordingIdentifier")));
    v7 = objc_claimAutoreleasedReturnValue(-[RCRecordingViewController timelineGenerator](self, "timelineGenerator"));
    v8 = (void *)v7;
    if (v6 && v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timelineEntry"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userObject"));
      v12 = objc_opt_class(RCTimelineDateEntryUserInfo, v11);
      isKindOfClass = objc_opt_isKindOfClass(v10, v12);

      if ((isKindOfClass & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userObject"));
        objc_msgSend(v14, "currentTime");
        v16 = v15;
        objc_msgSend(v14, "recordingDuration");
        v18 = v17;
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordingStartTimeInfo"));

        objc_msgSend(v14, "recordingTimeAtStartTime");
        v21 = v20;
        objc_msgSend(v14, "recordingDurationAtStartTime");
        v18 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timelineEntry"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "presentationTime"));

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingStartTime"));
        objc_msgSend(v24, "timeIntervalSinceDate:", v25);
        v27 = v26;

        v16 = v21 + v27;
        if (v18 < v16)
          v18 = v16;

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
      objc_msgSend(v28, "setRecordingDuration:", v18);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingViewController view](self, "view"));
      objc_msgSend(v29, "setCurrentTime:", v16);

      v31 = RCSupportsDebugAODLogs(v30);
      if ((_DWORD)v31)
      {
        v32 = OSLogForCategory(kVMLogCategoryDefault);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentationInterval"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bls_shortLoggingString"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timelineEntry"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "presentationTime"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bls_shortLoggingString"));
          v41 = RCDebugStringForTimeInterval(v16);
          v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          *(_DWORD *)buf = 136315906;
          v46 = "-[RCRecordingViewController _updateWithFrameSpecifier:]";
          v47 = 2112;
          v48 = v38;
          v49 = 2112;
          v50 = v40;
          v51 = 2112;
          v52 = v42;
          _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s -- presentationInterval = %@    presentationTime = %@    elapsedTime = %@", buf, 0x2Au);

        }
      }
      if (RCSupportsDebugAODOverlay(v31))
      {
        alwaysOnDebugOverlay = self->_alwaysOnDebugOverlay;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timelineEntry"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "presentationTime"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentationInterval"));
        -[RCDebugOverlay updateOverlayLayerStringWithPresentationTime:presentationInterval:elapsedRecordingTime:](alwaysOnDebugOverlay, "updateOverlayLayerStringWithPresentationTime:presentationInterval:elapsedRecordingTime:", v36, v37, v16);

      }
    }

  }
}

- (RCRecordingViewControllerDelegate)recordingViewControllerDelegate
{
  return (RCRecordingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_recordingViewControllerDelegate);
}

- (RCTimeController)activeTimeController
{
  return (RCTimeController *)objc_loadWeakRetained((id *)&self->_activeTimeController);
}

- (RCWaveformDataSource)waveformDataSource
{
  return (RCWaveformDataSource *)objc_loadWeakRetained((id *)&self->_waveformDataSource);
}

- (_TtC10VoiceMemos19RCLiveTranscription)liveTranscription
{
  return (_TtC10VoiceMemos19RCLiveTranscription *)objc_loadWeakRetained((id *)&self->_liveTranscription);
}

- (RCAVWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
  objc_storeStrong((id *)&self->_waveformViewController, a3);
}

- (RCAVWaveformViewController)overviewWaveformViewController
{
  return self->_overviewWaveformViewController;
}

- (void)setOverviewWaveformViewController:(id)a3
{
  objc_storeStrong((id *)&self->_overviewWaveformViewController, a3);
}

- (RCToolBarController)toolBarController
{
  return (RCToolBarController *)objc_loadWeakRetained((id *)&self->_toolBarController);
}

- (void)setToolBarController:(id)a3
{
  objc_storeWeak((id *)&self->_toolBarController, a3);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (RCComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSMutableDictionary)editingStatusDict
{
  return self->_editingStatusDict;
}

- (void)setEditingStatusDict:(id)a3
{
  objc_storeStrong((id *)&self->_editingStatusDict, a3);
}

- (_TtC10VoiceMemos25TranscriptViewCoordinator)transcriptViewCoordinator
{
  return self->_transcriptViewCoordinator;
}

- (void)setTranscriptViewCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptViewCoordinator, a3);
}

- (RCTimelineGenerator)timelineGenerator
{
  return self->_timelineGenerator;
}

- (void)setTimelineGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_timelineGenerator, a3);
}

- (RCElapsedRecordingTimeInfo)elapsedRecordingTimeInfo
{
  return self->_elapsedRecordingTimeInfo;
}

- (void)setElapsedRecordingTimeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedRecordingTimeInfo, a3);
}

- (RCDebugOverlay)alwaysOnDebugOverlay
{
  return self->_alwaysOnDebugOverlay;
}

- (void)setAlwaysOnDebugOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_alwaysOnDebugOverlay, a3);
}

- (UIInteraction)entityInteraction
{
  return self->_entityInteraction;
}

- (void)setEntityInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_entityInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityInteraction, 0);
  objc_storeStrong((id *)&self->_alwaysOnDebugOverlay, 0);
  objc_storeStrong((id *)&self->_elapsedRecordingTimeInfo, 0);
  objc_storeStrong((id *)&self->_timelineGenerator, 0);
  objc_storeStrong((id *)&self->_transcriptViewCoordinator, 0);
  objc_storeStrong((id *)&self->_editingStatusDict, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_toolBarController);
  objc_storeStrong((id *)&self->_overviewWaveformViewController, 0);
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_destroyWeak((id *)&self->_liveTranscription);
  objc_destroyWeak((id *)&self->_waveformDataSource);
  objc_destroyWeak((id *)&self->_activeTimeController);
  objc_destroyWeak((id *)&self->_recordingViewControllerDelegate);
}

- (void)registerAppEntityInteraction
{
  RCRecordingViewController *v2;

  v2 = self;
  sub_1000F6918();

}

- (void)removeAppEntityInteraction
{
  RCRecordingViewController *v2;

  v2 = self;
  sub_1000AAF68();

}

@end

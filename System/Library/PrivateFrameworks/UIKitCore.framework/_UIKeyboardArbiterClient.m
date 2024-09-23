@implementation _UIKeyboardArbiterClient

+ (id)automaticSharedArbiterClient
{
  if (_MergedGlobals_1016 != -1)
    dispatch_once(&_MergedGlobals_1016, &__block_literal_global_162);
  return (id)qword_1ECD7D750;
}

- (void)willResume:(id)a3
{
  void *v4;
  _QWORD v5[5];

  if (!-[_UIKeyboardArbiterClient enqueuedWillEnterForegroundActions](self, "enqueuedWillEnterForegroundActions", a3))
  {
    -[_UIKeyboardArbiterClient setEnqueuedWillEnterForegroundActions:](self, "setEnqueuedWillEnterForegroundActions:", 1);
    objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39___UIKeyboardArbiterClient_willResume___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    objc_msgSend(v4, "performAsync:", v5);

  }
}

- (BOOL)enqueuedWillEnterForegroundActions
{
  return self->_enqueuedWillEnterForegroundActions;
}

- (void)queue_keyboardChangedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64___UIKeyboardArbiterClient_queue_keyboardChangedWithCompletion___block_invoke;
  v7[3] = &unk_1E16B1D18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsync:", v7);

}

- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61___UIKeyboardArbiterClient_queue_keyboardChanged_onComplete___block_invoke;
  v11[3] = &unk_1E16BAD68;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performAsync:", v11);

}

- (void)keyboardChangedCompleted
{
  id v2;

  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetAnimationFencing");

}

- (void)_handleKeyboardChanged:(id)a3 isLocal:(BOOL)a4 onComplete:(id)a5
{
  _BOOL8 v6;
  void (**v8)(_QWORD);
  _BOOL4 v9;
  id v10;
  CGRect v11;

  v6 = a4;
  v10 = a3;
  v8 = (void (**)(_QWORD))a5;
  if (objc_msgSend((id)UIApp, "systemIsAnimatingApplicationLifecycleEvent"))
  {
    objc_msgSend(v10, "keyboardPosition");
    if (CGRectGetHeight(v11) != 0.0)
    {
      if (!v8)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  v9 = -[_UIKeyboardArbiterClient _didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:](self, "_didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", v10, objc_msgSend(v10, "shouldTakeSnapshot"), v6);
  if (v8)
  {
    if (v9)
    {
      objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v8);
      goto LABEL_8;
    }
LABEL_7:
    v8[2](v8);
  }
LABEL_8:

}

- (BOOL)_didHandleKeyboardClientChange:(id)a3 shouldConsiderSnapshottingKeyboard:(BOOL)a4 isLocalEvent:(BOOL)a5
{
  id v7;
  BOOL handlingRemoteEvent;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  handlingRemoteEvent = self->_handlingRemoteEvent;
  self->_handlingRemoteEvent = !a5;
  if (!a5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "automaticMinimizationEnabled");
    v11 = objc_msgSend(v7, "automaticMinimizationEnabled");

    if (v10 != v11)
    {
      v12 = objc_msgSend(v7, "automaticMinimizationEnabled");
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAutomaticMinimizationEnabled:", v12);

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "geometryDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "syncMinimizedStateToHardwareKeyboardAttachedState");

    }
  }
  -[_UIKeyboardArbiterClient keyboardActive](self, "keyboardActive");
  v16 = -[_UIKeyboardArbiterClient keyboardClientDidChange:](self, "keyboardClientDidChange:", v7);
  objc_msgSend(v7, "sourceBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClient isSpotlight:](self, "isSpotlight:", v17);

  if (v16)
  {
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClient setBackupState:](self, "setBackupState:", v18);

    -[_UIKeyboardArbiterClient setCurrentClientState:](self, "setCurrentClientState:", v7);
    -[_UIKeyboardArbiterClient changeInfoDelegate](self, "changeInfoDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "didHandleKeyboardClientChange:", self);

  }
  self->_handlingRemoteEvent = handlingRemoteEvent;

  return 1;
}

- (BOOL)keyboardUIHost
{
  return self->_keyboardUIHost;
}

- (BOOL)keyboardClientDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "sourceSceneIdentityString");
  v5 = objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "sourceSceneIdentityString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)v5, "isEqualToString:", v7);

  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "keyboardOnScreen");
  LOBYTE(v6) = objc_msgSend(v4, "keyboardOnScreen");

  return (v8 | v5 ^ v6) ^ 1;
}

- (_UIKeyboardChangedInformation)currentClientState
{
  return self->_currentClientState;
}

- (BOOL)keyboardActive
{
  return -[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination")
      || -[_UIKeyboardArbiterClient keyboardUIHost](self, "keyboardUIHost");
}

- (BOOL)currentInputDestination
{
  return self->_currentInputDestination;
}

- (_UIKeyboardUIInformation)currentUIState
{
  return self->_currentUIState;
}

- (void)setDidSignalKeyboardChangedForCurrentKeyboard:(BOOL)a3
{
  self->_didSignalKeyboardChangedForCurrentKeyboard = a3;
}

- (void)setCurrentUIState:(id)a3
{
  objc_storeStrong((id *)&self->_currentUIState, a3);
}

- (void)setCurrentClientState:(id)a3
{
  objc_storeStrong((id *)&self->_currentClientState, a3);
}

- (void)setBackupState:(id)a3
{
  objc_storeStrong((id *)&self->_backupState, a3);
}

- (_UIKBArbiterClientKeyboardChangeDelegate)changeInfoDelegate
{
  return (_UIKBArbiterClientKeyboardChangeDelegate *)objc_loadWeakRetained((id *)&self->_changeInfoDelegate);
}

- (void)queue_getDebugInfoWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)startConnectionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSXPCConnection *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location[2];

  v4 = a3;
  -[_UIKeyboardArbiterClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (objc_msgSend((id)UIApp, "_shouldAllowKeyboardArbiter"))
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      if ((unint64_t)(v7 - 2) >= 3)
      {
        -[_UIKeyboardArbiterClient arbiterConnection](self, "arbiterConnection");
        v8 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
        connection = self->_connection;
        self->_connection = v8;

        v10 = BSDispatchQueueCreateWithQualityOfService();
        -[_UIKeyboardArbiterClient connection](self, "connection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v10;
        objc_msgSend(v11, "_setQueue:", v10);

        objc_initWeak(location, self);
        v12 = MEMORY[0x1E0C809B0];
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke;
        v34[3] = &unk_1E16B3F40;
        objc_copyWeak(&v35, location);
        -[_UIKeyboardArbiterClient connection](self, "connection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setInterruptionHandler:", v34);

        v32[0] = v12;
        v32[1] = 3221225472;
        v32[2] = __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_126;
        v32[3] = &unk_1E16B3F40;
        objc_copyWeak(&v33, location);
        -[_UIKeyboardArbiterClient connection](self, "connection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setInvalidationHandler:", v32);

        -[_UIKeyboardArbiterClient connection](self, "connection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setExportedObject:", self);

        -[_UIKeyboardArbiterClient connection](self, "connection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
LABEL_15:
          objc_destroyWeak(&v33);
          objc_destroyWeak(&v35);
          objc_destroyWeak(location);

          goto LABEL_16;
        }
        -[_UIKeyboardArbiterClient connection](self, "connection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "resume");

        -[_UIKeyboardArbiterClient setExpectingInitialState:](self, "setExpectingInitialState:", 1);
        -[_UIKeyboardArbiterClient setAvoidDisableKeyboard:](self, "setAvoidDisableKeyboard:", 0);
        -[_UIKeyboardArbiterClient requiredScene](self, "requiredScene");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination");
        if (v20)
        {
          -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
LABEL_7:
            v22 = 0;
LABEL_10:
            -[_UIKeyboardArbiterClient currentHostedPIDs](self, "currentHostedPIDs");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[_UIKeyboardArbiterClient shouldFence](self, "shouldFence");
            v25 = -[_UIKeyboardArbiterClient expectedSuppression](self, "expectedSuppression");
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_129;
            v29[3] = &unk_1E16C4038;
            v30 = v4;
            objc_copyWeak(&v31, location);
            objc_msgSend(v19, "startArbitrationWithExpectedState:focusContext:hostingPIDs:usingFence:withSuppression:onConnected:", v21, v22, v23, v24, v25, v29);

            if (v18)
            {

            }
            if (v20)

            objc_destroyWeak(&v31);
            goto LABEL_15;
          }
        }
        else
        {
          v21 = 0;
          if (!v18)
            goto LABEL_7;
        }
        objc_msgSend(v18, "identityToken");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:contextID:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:contextID:", v27, objc_msgSend(v26, "_contextId"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
  }
LABEL_16:

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)startConnection
{
  -[_UIKeyboardArbiterClient startConnectionWithCompletion:](self, "startConnectionWithCompletion:", 0);
}

- (BOOL)shouldFence
{
  return self->_shouldFence;
}

- (void)setExpectingInitialState:(BOOL)a3
{
  self->_expectingInitialState = a3;
}

- (void)setEnqueuedWillEnterForegroundActions:(BOOL)a3
{
  self->_enqueuedWillEnterForegroundActions = a3;
}

- (void)setAvoidDisableKeyboard:(BOOL)a3
{
  self->_avoidDisableKeyboard = a3;
}

- (FBSScene)requiredScene
{
  FBSScene *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = self->_requiredScene;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v2)
  {
    objc_msgSend(v3, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_FBSScene");
    v2 = (FBSScene *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(v4, "responder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_responderWindow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_settingsScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_FBSScene");
      v2 = (FBSScene *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v2;
}

- (BOOL)keyboardVisible
{
  void *v2;
  char v3;

  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardOnScreen");

  return v3;
}

- (int64_t)keyboardSource
{
  return self->_keyboardSource;
}

- (double)heightForRemoteIAVPlaceholderIfNecessary
{
  int v3;
  double result;

  v3 = objc_msgSend((id)UIApp, "_isSpringBoard");
  result = 0.0;
  if (v3)
    return self->_heightForRemoteIAVPlaceholderIfNecessary;
  return result;
}

- (BOOL)expectingInitialState
{
  return self->_expectingInitialState;
}

- (BOOL)expectedSuppression
{
  return self->_expectedSuppression;
}

- (id)arbiterConnection
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  KeyboardArbiterClientLog_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient arbiterConnection]  Starting arbiter connection", v12, 2u);
  }

  v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
  objc_msgSend((id)objc_opt_class(), "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithMachServiceName:options:", v5, 4096);

  -[_UIKeyboardArbiterClient configureArbiterCommunication:](self, "configureArbiterCommunication:", v6);
  objc_msgSend(v6, "exportedInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKBArbiterSetForPlacements();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_queue_keyboardTransition_event_withInfo_onComplete_, 2, 0);

  objc_msgSend(v6, "remoteObjectInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKBArbiterSetForPlacements();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_transition_eventStage_withInfo_, 2, 0);

  return v6;
}

- (void)applicationResume:(id)a3
{
  if (!self->_windowEnabled)
    -[_UIKeyboardArbiterClient willResume:](self, "willResume:", a3);
}

- (void)_updateEventSource:(int64_t)a3 options:(unint64_t)a4 responder:(id)a5
{
  char v5;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = a5;
  if (!a3)
  {
    if ((v5 & 8) == 0)
    {
      a3 = -[_UIKeyboardArbiterClient keyboardSource](self, "keyboardSource");
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((v5 & 8) != 0)
LABEL_6:
    -[_UIKeyboardArbiterClient setKeyboardSource:](self, "setKeyboardSource:", a3);
LABEL_7:
  if (self->_lastEventSource == a3)
    goto LABEL_13;
  self->_lastEventSource = a3;
  if ((v5 & 1) != 0)
  {
    +[UIScribbleInteraction _lastEventSourceChanged:](UIScribbleInteraction, "_lastEventSourceChanged:", a3);
    if ((v5 & 4) == 0)
    {
LABEL_10:
      if ((v5 & 2) == 0)
        goto LABEL_11;
LABEL_16:
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:", 0);

      if ((v5 & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_10;
  }
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signalEventSourceChanged:completionHandler:", a3, &__block_literal_global_164);

  if ((v5 & 2) != 0)
    goto LABEL_16;
LABEL_11:
  if ((v5 & 1) != 0)
LABEL_12:
    -[_UIKeyboardArbiterClient _postInputSourceDidChangeNotificationForResponder:](self, "_postInputSourceDidChangeNotificationForResponder:", v10);
LABEL_13:

}

- (void)_updateEventSource:(int64_t)a3 options:(unint64_t)a4
{
  -[_UIKeyboardArbiterClient _updateEventSource:options:responder:](self, "_updateEventSource:options:responder:", a3, a4, 0);
}

+ (id)serviceName
{
  if (qword_1ECD7D760 != -1)
    dispatch_once(&qword_1ECD7D760, &__block_literal_global_27);
  return (id)qword_1ECD7D758;
}

+ (id)mainBundleIdentifier
{
  if (qword_1ECD7D768 != -1)
    dispatch_once(&qword_1ECD7D768, &__block_literal_global_200_0);
  return (id)qword_1ECD7D770;
}

+ (BOOL)enabled
{
  if ((_UIApplicationIsApplicationWidgetExtension() & 1) != 0
    || (_UIApplicationIsKeyboardExtension() & 1) != 0
    || (_UIApplicationIsKeyboardMediaService() & 1) != 0
    || (_UIApplicationIsWidgetServer() & 1) != 0)
  {
    return 0;
  }
  else
  {
    return _UIApplicationIsFirstPartyStickers() ^ 1;
  }
}

- (_UIKeyboardArbiterClient)init
{
  return -[_UIKeyboardArbiterClient initWithShouldConnect:](self, "initWithShouldConnect:", 1);
}

- (_UIKeyboardArbiterClient)initWithShouldConnect:(BOOL)a3
{
  _BOOL4 v3;
  _UIKeyboardArbiterClient *v4;
  _UIKeyboardArbiterClient *v5;
  _UIRemoteKeyboardsEventObserver *v6;
  _UIRemoteKeyboardsEventObserver *eventObserver;
  uint64_t v8;
  NSHashTable *windowControllers;
  _UIAssertionController *v10;
  _UIAssertionController *assertionController;
  void *v12;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIKeyboardArbiterClient;
  v4 = -[_UIKeyboardArbiterClient init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_shouldFence = 1;
    v6 = objc_alloc_init(_UIRemoteKeyboardsEventObserver);
    eventObserver = v5->_eventObserver;
    v5->_eventObserver = v6;

    -[_UIRemoteKeyboardsEventObserver setDelegate:](v5->_eventObserver, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    windowControllers = v5->_windowControllers;
    v5->_windowControllers = (NSHashTable *)v8;

    if (v3)
      -[_UIKeyboardArbiterClient checkConnection](v5, "checkConnection");
    v10 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", v5);
    assertionController = v5->_assertionController;
    v5->_assertionController = v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel_applicationResume_, CFSTR("UIApplicationResumedEventsOnlyNotification"), UIApp);
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel_willResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel_didSuspend_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIApplicationResumedEventsOnlyNotification");
  v6[1] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v6[2] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[_UIKeyboardArbiterClient stopConnection](self, "stopConnection");
  -[_UIKeyboardArbiterClient resetSnapshotWithWindowCheck:](self, "resetSnapshotWithWindowCheck:", 0);
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardArbiterClient;
  -[_UIKeyboardArbiterClient dealloc](&v5, sel_dealloc);
}

- (id)currentHostedPIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)configureArbiterCommunication:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE0A0788);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDE7F438);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v6);

}

- (id)arbiterProxy
{
  void *v2;
  void *v3;

  -[_UIKeyboardArbiterClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_123_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)stopConnection
{
  void *v3;
  void *v4;
  void *v5;
  NSXPCConnection *connection;

  -[_UIKeyboardArbiterClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", 0);

  -[_UIKeyboardArbiterClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterruptionHandler:", 0);

  -[_UIKeyboardArbiterClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  connection = self->_connection;
  self->_connection = 0;

}

- (void)checkConnection
{
  void *v3;

  -[_UIKeyboardArbiterClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[_UIKeyboardArbiterClient allowedToShowKeyboard](self, "allowedToShowKeyboard"))
  {
    -[_UIKeyboardArbiterClient startConnection](self, "startConnection");
  }
}

- (void)checkState
{
  void *v3;

  if (objc_msgSend((id)UIApp, "_shouldAllowKeyboardArbiter"))
  {
    -[_UIKeyboardArbiterClient checkConnection](self, "checkConnection");
  }
  else
  {
    -[_UIKeyboardArbiterClient connection](self, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[_UIKeyboardArbiterClient stopConnection](self, "stopConnection");
  }
}

- (BOOL)isOnScreenRotating
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46___UIKeyboardArbiterClient_isOnScreenRotating__block_invoke;
  v4[3] = &unk_1E16C4060;
  v4[4] = &v5;
  -[_UIKeyboardArbiterClient performOnExistingControllers:](self, "performOnExistingControllers:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isHostedInAnotherProcess
{
  return 0;
}

- (BOOL)hasAnyHostedViews
{
  void *v2;
  BOOL v3;

  -[_UIKeyboardArbiterClient currentHostedPIDs](self, "currentHostedPIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasWindowHostingCallerID:(id)a3
{
  return 0;
}

- (BOOL)hasWindowHostingPID:(int)a3
{
  return 0;
}

- (BOOL)remoteKeyboardUndocked
{
  return -[_UIKeyboardArbiterClient remoteKeyboardUndocked:](self, "remoteKeyboardUndocked:", 0);
}

- (BOOL)remoteKeyboardUndocked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  BOOL v7;

  v3 = a3;
  if (-[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination") && !v3
    || !-[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible"))
  {
    return 0;
  }
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardPosition");
  v7 = v6 != 0.0;

  return v7;
}

- (BOOL)isSpotlight:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Spotlight"));
  else
    v6 = 0;

  return v6;
}

- (BOOL)hasActiveKeyboardSuppressionAssertionsForReason:(id)a3
{
  return -[_UIAssertionController hasAssertionsForReason:](self->_assertionController, "hasAssertionsForReason:", a3);
}

- (id)vendKeyboardSuppressionAssertionForReason:(id)a3
{
  return -[_UIKeyboardArbiterClient vendKeyboardSuppressionAssertionForReason:type:](self, "vendKeyboardSuppressionAssertionForReason:type:", a3, 0);
}

- (id)vendKeyboardSuppressionAssertionForReason:(id)a3 type:(unint64_t)a4
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self->_assertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", a4, 1, a3, 0);
}

- (id)vendEmojiKeyboardPrewarmingAssertionForReason:(id)a3
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self->_assertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", 2, 1, a3, 0);
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return a3 <= 1 && -[_UIKeyboardArbiterClient disableBecomeFirstResponder](self, "disableBecomeFirstResponder");
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (a4 <= 1)
    -[_UIKeyboardArbiterClient setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:wantsAssistant:](self, "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:wantsAssistant:", a3, 1, 1, 0);
}

- (UIInputWindowController)inputWindowRootViewController
{
  void *v2;
  void *v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIInputWindowController *)v3;
}

- (id)existingInputWindowRootViewController
{
  void *v2;
  void *v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingContainerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)queue_endInputSessionWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64___UIKeyboardArbiterClient_queue_endInputSessionWithCompletion___block_invoke;
  v6[3] = &unk_1E16B1BF8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performAsync:", v6);

}

- (void)queue_failedConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  KeyboardArbiterClientLog_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient queue_failedConnection:]  Did fail arbiter connection", buf, 2u);
  }

  objc_msgSend(v4, "interruptionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidationHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterruptionHandler:", 0);
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51___UIKeyboardArbiterClient_queue_failedConnection___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "performAsync:", v10);

}

- (void)didFailArbiterConnection
{
  _UIKeyboardUIInformation *v3;
  _UIKeyboardUIInformation *v4;
  void *v5;

  v3 = [_UIKeyboardUIInformation alloc];
  v4 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:](v3, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_UIKeyboardArbiterClient setCurrentUIState:](self, "setCurrentUIState:", v4);

  +[_UIKeyboardChangedInformation informationForKeyboardDown](_UIKeyboardChangedInformation, "informationForKeyboardDown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClient _didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:](self, "_didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", v5, 0, 1);

  -[_UIKeyboardArbiterClient cleanSuppression](self, "cleanSuppression");
}

- (void)queue_setLastEventSource:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68___UIKeyboardArbiterClient_queue_setLastEventSource_withCompletion___block_invoke;
  v9[3] = &unk_1E16B44E8;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performAsync:", v9);

}

- (void)queue_keyboardSuppressed:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68___UIKeyboardArbiterClient_queue_keyboardSuppressed_withCompletion___block_invoke;
  v9[3] = &unk_1E16BAFE8;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performAsync:", v9);

}

- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4
{
  if (a4)
    (*((void (**)(id, double))a4 + 2))(a4, a3);
}

- (void)queue_keyboardTransition:(id)a3 event:(unint64_t)a4 withInfo:(id)a5 onComplete:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  void (**v25)(_QWORD);
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD aBlock[4];
  id v36;
  id v37;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  if (-[_UIKeyboardArbiterClient keyboardActive](self, "keyboardActive")
    && !+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    goto LABEL_18;
  }
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    if ((objc_msgSend(v10, "isEqualToString:", 0x1E174E5A0) & 1) != 0)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", 0x1E174E5E0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v11, "mutableCopy");
        +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOffScreenDown, "placement");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, 0x1E174E5E0);

        v11 = v15;
      }
      objc_msgSend(v11, "bs_filter:", &__block_literal_global_141);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v17;
      goto LABEL_8;
    }
LABEL_18:
    if (v12)
      v12[2](v12);
    goto LABEL_20;
  }
LABEL_8:
  switch(a4)
  {
    case 0uLL:
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_2;
      aBlock[3] = &unk_1E16C40A8;
      v36 = v10;
      v37 = v11;
      v18 = _Block_copy(aBlock);

      v19 = v36;
      goto LABEL_16;
    case 1uLL:
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_3;
      v32[3] = &unk_1E16C40A8;
      v33 = v10;
      v34 = v11;
      v18 = _Block_copy(v32);

      v19 = v33;
      goto LABEL_16;
    case 2uLL:
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_4;
      v29[3] = &unk_1E16C40A8;
      v30 = v10;
      v31 = v11;
      v18 = _Block_copy(v29);

      v19 = v30;
      goto LABEL_16;
    case 3uLL:
      if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
        goto LABEL_18;
      if (!objc_msgSend(CFSTR("Placement"), "isEqualToString:", v10))
        goto LABEL_14;
      objc_msgSend(v11, "objectForKey:", CFSTR("Placement"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_5;
      v26[3] = &unk_1E16C40A8;
      v27 = v20;
      v28 = v11;
      v19 = v20;
      v18 = _Block_copy(v26);

LABEL_16:
      if (!v18)
        goto LABEL_18;
      objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_6;
      v23[3] = &unk_1E16BC240;
      v23[4] = self;
      v24 = v18;
      v25 = v12;
      v22 = v18;
      objc_msgSend(v21, "performAsync:", v23);

      break;
    default:
LABEL_14:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown transition data: %@/%lu/%@"), v10, a4, v11);
      goto LABEL_18;
  }
LABEL_20:

}

- (void)setDisableBecomeFirstResponder:(BOOL)a3
{
  -[_UIKeyboardArbiterClient setDisableBecomeFirstResponder:forSuppressionAssertion:](self, "setDisableBecomeFirstResponder:forSuppressionAssertion:", a3, 0);
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4
{
  -[_UIKeyboardArbiterClient setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:](self, "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:", a3, a4, 1);
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5
{
  -[_UIKeyboardArbiterClient setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:wantsAssistant:](self, "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:wantsAssistant:", a3, a4, a5, 0);
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5 wantsAssistant:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  BOOL v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  if (self->_disableBecomeFirstResponder != a3)
  {
    v6 = a6;
    v7 = a5;
    v8 = a4;
    v9 = a3;
    if (a3
      || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v12 = objc_msgSend(v11, "isWaitingForInputUI"), v11, !v12))
    {
      -[_UIKeyboardArbiterClient existingInputWindowRootViewController](self, "existingInputWindowRootViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "placement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDeactivatedKeyboard:forScene:forSuppressionAssertion:updatePlacement:wantsAssistant:", v9, 0, v8, v7, v6);

      objc_msgSend(v13, "placement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_disableBecomeFirstResponder = v9;
      if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      {
        if (v9)
          v17 = 1;
        else
          v17 = objc_msgSend(v16, "showsKeyboard");
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "remoteTextInputPartner");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = CFSTR("disabled");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v20;
        v29[1] = CFSTR("forSuppressionAssertion");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v21;
        v29[2] = CFSTR("updatePlacement");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30[2] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "forwardApplicationOperation:object:", sel_setRemoteDisableBecomeFirstResponder_, v23);

      }
    }
    else
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __114___UIKeyboardArbiterClient_setDisableBecomeFirstResponder_forSuppressionAssertion_updatePlacement_wantsAssistant___block_invoke;
      v24[3] = &unk_1E16BFE10;
      v24[4] = self;
      v25 = v9;
      v26 = v8;
      v27 = v7;
      v28 = v6;
      objc_msgSend(v13, "addPostWaitingForInputUIBlock:", v24);
    }

  }
}

- (void)verifyPlacement
{
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_162);
}

- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)_postInputSourceDidChangeNotificationForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  const __CFString **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "responder"), v4 = (id)objc_claimAutoreleasedReturnValue(), v5, v4))
  {
    v15[0] = CFSTR("UITextInputSourceDidChangeInputSourceKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastEventSource);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("UITextInputResponderCapabilitiesChangedInputResponderKey");
    v16[0] = v6;
    v16[1] = v4;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = (void **)v16;
    v9 = (const __CFString **)v15;
    v10 = 2;
  }
  else
  {
    v13 = CFSTR("UITextInputSourceDidChangeInputSourceKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastEventSource);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v14;
    v9 = &v13;
    v10 = 1;
  }
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("UITextInputSourceDidChangeNotification"), 0, v11);

}

- (void)cleanSuppression
{
  void *v3;
  int externalSuppression;
  BOOL v5;

  if (self->_externalSuppression >= 1)
  {
    do
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDeactivatedKeyboard:forScene:", 0, 0);

      externalSuppression = self->_externalSuppression;
      v5 = __OFSUB__(externalSuppression--, 1);
      self->_externalSuppression = externalSuppression;
    }
    while (!((externalSuppression < 0) ^ v5 | (externalSuppression == 0)));
  }
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_165);
}

- (void)registerController:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EDFA9398) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Object does not implement expected protocol: %@"), v4);
  -[NSHashTable addObject:](self->_windowControllers, "addObject:", v4);
  objc_msgSend(v4, "setControllerDelegate:", self);

}

- (void)unregisterController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setControllerDelegate:", 0);
  -[NSHashTable removeObject:](self->_windowControllers, "removeObject:", v4);

}

- (void)performOnControllers:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[NSHashTable copy](self->_windowControllers, "copy");
  -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v5, "containsObject:", v6))
    v4[2](v4, v6);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        if (*(void **)(*((_QWORD *)&v12 + 1) + 8 * v11) != v6)
          ((void (*)(void (**)(id, void *)))v4[2])(v4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)performOnExistingControllers:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[NSHashTable copy](self->_windowControllers, "copy");
  -[_UIKeyboardArbiterClient existingInputWindowRootViewController](self, "existingInputWindowRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v5, "containsObject:", v6))
    v4[2](v4, v6);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        if (*(void **)(*((_QWORD *)&v12 + 1) + 8 * v11) != v6)
          ((void (*)(void (**)(id, void *)))v4[2])(v4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_performOnDistributedControllersExceptSelf:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71___UIKeyboardArbiterClient__performOnDistributedControllersExceptSelf___block_invoke;
  v6[3] = &unk_1E16C40F0;
  v7 = v4;
  v5 = v4;
  -[_UIKeyboardArbiterClient performOnControllers:](self, "performOnControllers:", v6);

}

- (void)performOnDistributedControllers:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  -[_UIKeyboardArbiterClient _performOnDistributedControllersExceptSelf:](self, "_performOnDistributedControllersExceptSelf:", v5);

}

- (void)restorePreservedInputViewsIfNecessary
{
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_195);
}

- (BOOL)shouldAllowInputViewsRestoredForId:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible")
    && !-[_UIKeyboardArbiterClient keyboardActive](self, "keyboardActive"))
  {
    v5 = objc_msgSend(v4, "isEqual:", CFSTR("inputui-keyboard-inputviews-preservation-key"));
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)controllerDidLayoutSubviews:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self->_ignoreLayoutSubviews <= 0)
  {
    v6 = v4;
    v5 = -[_UIKeyboardArbiterClient keyboardActive](self, "keyboardActive");
    v4 = v6;
    if (v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __56___UIKeyboardArbiterClient_controllerDidLayoutSubviews___block_invoke;
      v7[3] = &unk_1E16B1B50;
      v7[4] = self;
      v8 = v6;
      -[_UIKeyboardArbiterClient ignoreLayoutNotifications:](self, "ignoreLayoutNotifications:", v7);

      v4 = v6;
    }
  }

}

- (void)ignoreLayoutNotifications:(id)a3
{
  ++self->_ignoreLayoutSubviews;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_ignoreLayoutSubviews;
}

- (void)signalToProxyKeyboardChanged:(id)a3 onCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (unint64_t)localSceneCount
{
  return 1;
}

- (void)sceneUpdated
{
  if (-[_UIKeyboardArbiterClient snapshotting](self, "snapshotting"))
    -[_UIKeyboardArbiterClient reloadForSnapshotting](self, "reloadForSnapshotting");
}

- (void)reloadForSnapshotting
{
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_196);
}

- (BOOL)shouldSnapshot
{
  return 0;
}

- (void)setSnapshotting:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  KeyboardArbiterClientLog_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient setSnapshotting:]  setSnapshotting: %d", (uint8_t *)v6, 8u);
  }

  self->_snapshotting = v3;
  -[_UIKeyboardArbiterClient reloadForSnapshotting](self, "reloadForSnapshotting");
}

- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4
{
  BOOL handlingRemoteEvent;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  handlingRemoteEvent = self->_handlingRemoteEvent;
  self->_handlingRemoteEvent = 1;
  -[_UIKeyboardArbiterClient setCurrentUIState:](self, "setCurrentUIState:", a3);
  v7 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
  -[_UIKeyboardArbiterClient eventObserver](self, "eventObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKeyboardIsVisible:", v7);

  -[_UIKeyboardArbiterClient changeInfoDelegate](self, "changeInfoDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didHandleKeyboardUIChange:", self);

  v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    v10 = v11;
  }
  self->_handlingRemoteEvent = handlingRemoteEvent;

}

+ (id)keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identityToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a3, "_sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)allowedToShowKeyboard
{
  int v3;
  void *v5;
  char v6;

  if (objc_msgSend((id)UIApp, "isSuspendedEventsOnly"))
    v3 = objc_msgSend((id)UIApp, "isSuspendedUnderLock") ^ 1;
  else
    v3 = 0;
  if (-[_UIKeyboardArbiterClient isHostedInAnotherProcess](self, "isHostedInAnotherProcess")
    || ((objc_msgSend((id)UIApp, "isSuspended") ^ 1 | v3) & 1) != 0)
  {
    return 1;
  }
  -[_UIKeyboardArbiterClient kbUIStateDelegate](self, "kbUIStateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActivatingInForeground");

  return v6;
}

- (void)didSuspend:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSXPCConnection *connection;
  NSXPCConnection *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[6];

  v4 = objc_msgSend((id)UIApp, "_beginBackgroundTaskWithName:expirationHandler:", CFSTR("_UIKeyboardArbiterClient XPC disconnection"), 0);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___UIKeyboardArbiterClient_didSuspend___block_invoke;
  aBlock[3] = &unk_1E16B1888;
  aBlock[4] = self;
  aBlock[5] = v4;
  v6 = _Block_copy(aBlock);
  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;
    v8 = connection;

    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", 0);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __39___UIKeyboardArbiterClient_didSuspend___block_invoke_2;
    v14[3] = &unk_1E16B1BF8;
    v15 = v6;
    -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v14);
    -[NSXPCConnection invalidate](v8, "invalidate");

  }
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __39___UIKeyboardArbiterClient_didSuspend___block_invoke_3;
  v11[3] = &unk_1E16BAFE8;
  v13 = connection != 0;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "performAsync:", v11);

}

- (id)prepareForHostedWindowWithScene:(id)a3
{
  return 0;
}

- (void)setShouldFence:(BOOL)a3
{
  self->_shouldFence = a3;
}

- (_UIKeyboardUIStateDelegate)kbUIStateDelegate
{
  return (_UIKeyboardUIStateDelegate *)objc_loadWeakRetained((id *)&self->_kbUIStateDelegate);
}

- (void)setKbUIStateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_kbUIStateDelegate, a3);
}

- (void)setInputWindowRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inputWindowRootViewController, a3);
}

- (int64_t)lastEventSource
{
  return self->_lastEventSource;
}

- (void)setLastEventSource:(int64_t)a3
{
  self->_lastEventSource = a3;
}

- (BOOL)snapshotting
{
  return self->_snapshotting;
}

- (BOOL)handlingRemoteEvent
{
  return self->_handlingRemoteEvent;
}

- (void)setHandlingRemoteEvent:(BOOL)a3
{
  self->_handlingRemoteEvent = a3;
}

- (void)setChangeInfoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_changeInfoDelegate, a3);
}

- (BOOL)disableBecomeFirstResponder
{
  return self->_disableBecomeFirstResponder;
}

- (BOOL)avoidDisableKeyboard
{
  return self->_avoidDisableKeyboard;
}

- (void)setCurrentInputDestination:(BOOL)a3
{
  self->_currentInputDestination = a3;
}

- (void)setKeyboardUIHost:(BOOL)a3
{
  self->_keyboardUIHost = a3;
}

- (void)setExpectedSuppression:(BOOL)a3
{
  self->_expectedSuppression = a3;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (UIView)keyboardSnapshot
{
  return self->_keyboardSnapshot;
}

- (void)setKeyboardSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardSnapshot, a3);
}

- (BOOL)windowEnabled
{
  return self->_windowEnabled;
}

- (void)setWindowEnabled:(BOOL)a3
{
  self->_windowEnabled = a3;
}

- (BOOL)updatingHeight
{
  return self->_updatingHeight;
}

- (void)setUpdatingHeight:(BOOL)a3
{
  self->_updatingHeight = a3;
}

- (BOOL)didSignalKeyboardChangedForCurrentKeyboard
{
  return self->_didSignalKeyboardChangedForCurrentKeyboard;
}

- (_UIKeyboardChangedInformation)backupState
{
  return self->_backupState;
}

- (void)setKeyboardSource:(int64_t)a3
{
  self->_keyboardSource = a3;
}

- (unint64_t)hostedCount
{
  return self->_hostedCount;
}

- (void)setHostedCount:(unint64_t)a3
{
  self->_hostedCount = a3;
}

- (_UIRemoteKeyboardsEventObserver)eventObserver
{
  return self->_eventObserver;
}

- (void)setEventObserver:(id)a3
{
  objc_storeStrong((id *)&self->_eventObserver, a3);
}

- (BOOL)deactivatedByControlCenter
{
  return self->_deactivatedByControlCenter;
}

- (void)setDeactivatedByControlCenter:(BOOL)a3
{
  self->_deactivatedByControlCenter = a3;
}

- (BOOL)deactivatedBySystemGesture
{
  return self->_deactivatedBySystemGesture;
}

- (void)setDeactivatedBySystemGesture:(BOOL)a3
{
  self->_deactivatedBySystemGesture = a3;
}

- (void)setRequiredScene:(id)a3
{
  objc_storeStrong((id *)&self->_requiredScene, a3);
}

- (BOOL)handlingKeyboardTransition
{
  return self->_handlingKeyboardTransition;
}

- (void)setHandlingKeyboardTransition:(BOOL)a3
{
  self->_handlingKeyboardTransition = a3;
}

- (void)setHeightForRemoteIAVPlaceholderIfNecessary:(double)a3
{
  self->_heightForRemoteIAVPlaceholderIfNecessary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredScene, 0);
  objc_storeStrong((id *)&self->_eventObserver, 0);
  objc_storeStrong((id *)&self->_backupState, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshot, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_changeInfoDelegate);
  objc_storeStrong((id *)&self->_inputWindowRootViewController, 0);
  objc_destroyWeak((id *)&self->_kbUIStateDelegate);
  objc_storeStrong((id *)&self->_currentUIState, 0);
  objc_storeStrong((id *)&self->_currentClientState, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_windowControllers, 0);
}

- (void)startTransition:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transition:eventStage:withInfo:", v7, 0, v6);

}

- (void)updateTransition:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transition:eventStage:withInfo:", v7, 1, v6);

}

- (void)completeTransition:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transition:eventStage:withInfo:", v7, 2, v6);

}

- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v17[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v16[0] = CFSTR("Placement");
  v16[1] = CFSTR("Quiet");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  v16[2] = CFSTR("Animated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  v16[3] = CFSTR("Notify");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "transition:eventStage:withInfo:", CFSTR("Placement"), 3, v15);
}

@end

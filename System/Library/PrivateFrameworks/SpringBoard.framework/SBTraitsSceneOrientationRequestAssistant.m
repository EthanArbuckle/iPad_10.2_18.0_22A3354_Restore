@implementation SBTraitsSceneOrientationRequestAssistant

- (SBTraitsSceneOrientationRequestAssistant)initWithTraitsSceneDelegate:(id)a3 errorDomain:(id)a4
{
  id v6;
  id v7;
  SBTraitsSceneOrientationRequestAssistant *v8;
  SBTraitsSceneOrientationRequestAssistant *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBTraitsSceneOrientationRequestAssistant;
  v8 = -[SBTraitsSceneOrientationRequestAssistant init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_traitsDelegate, v6);
    objc_storeWeak((id *)&v9->_errorDomain, v7);
  }

  return v9;
}

- (void)invalidate
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_traitsDelegate);
  objc_msgSend(WeakRetained, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_setInitialDeviceOrientationFromSceneOrientationRequestSetup:", 0);
  objc_msgSend(v6, "_setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:", 0);
  objc_msgSend(v6, "_setSettingUpSceneOrientationRequest:", 0);

}

- (void)checkValidityAgainstUpdateReasons:(int64_t)a3
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_traitsDelegate);
  v5 = objc_opt_class();
  objc_msgSend(WeakRetained, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "_isSettingUpSceneOrientationRequest"))
    {
      objc_msgSend(v7, "_setSettingUpSceneOrientationRequest:", 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "participant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "sbf_currentDeviceOrientation");

      v10 = objc_msgSend(v7, "_initialDeviceOrientationFromSceneOrientationRequestSetup");
      if (objc_msgSend(v7, "_supportedInterfaceOrientationsFromSceneOrientationRequestSetup") && (!v10 || v9 != v10))
      {
        if ((unint64_t)(v9 - 1) > 3)
        {
          objc_msgSend(v7, "_setInitialDeviceOrientationFromSceneOrientationRequestSetup:", 0);
        }
        else
        {
          objc_initWeak(&location, self);
          v11 = (void *)MEMORY[0x1E0CD28B0];
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __78__SBTraitsSceneOrientationRequestAssistant_checkValidityAgainstUpdateReasons___block_invoke;
          v12[3] = &unk_1E8E9DF28;
          objc_copyWeak(&v13, &location);
          objc_msgSend(v11, "bs_performAfterCommit:", v12);
          objc_destroyWeak(&v13);
          objc_destroyWeak(&location);
        }
      }
    }
  }

}

void __78__SBTraitsSceneOrientationRequestAssistant_checkValidityAgainstUpdateReasons___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "invalidate");
    objc_msgSend(v2, "_performCoalescedBroadcastArbitrationUpdateWithReason:", CFSTR("SceneOrientationRequest invalidation"));
    WeakRetained = v2;
  }

}

- (void)setUpForTransitionContextIfNeeded:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_errorDomain);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_299);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "requestedInterfaceOrientationMask");
      if (objc_msgSend(v7, "policy") == 2
        && (+[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "isUserLocked"),
            v9,
            v10))
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB2D50];
        v30[0] = CFSTR("NOOP: honoring user orientation lock");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", WeakRetained, 1, v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = objc_loadWeakRetained((id *)&self->_traitsDelegate);
        v14 = objc_opt_class();
        objc_msgSend(v12, "sceneHandle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        SBSafeCast(v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v26 = 0;
          -[SBTraitsSceneOrientationRequestAssistant _startSceneOrientationRequestWithDesiredOrientations:error:](self, "_startSceneOrientationRequestWithDesiredOrientations:error:", v8, &v26);
          v13 = v26;
        }
        else
        {
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v27 = *MEMORY[0x1E0CB2D50];
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v12, "scene");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("The requesting scene [%@] is not supported"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", WeakRetained, 1, v22);
          v13 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

      if (objc_msgSend(v7, "canSendResponse"))
      {
        v23 = objc_alloc(MEMORY[0x1E0D016A8]);
        objc_msgSend(v7, "info");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v23, "initWithInfo:error:", v24, v13);

        objc_msgSend(v7, "sendResponse:", v25);
      }

    }
  }

}

BOOL __78__SBTraitsSceneOrientationRequestAssistant_setUpForTransitionContextIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UIActionType") == 49;
}

- (void)_startSceneOrientationRequestWithDesiredOrientations:(unint64_t)a3 error:(id *)a4
{
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_traitsDelegate);
  v9 = objc_opt_class();
  objc_msgSend(WeakRetained, "sceneHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneOrientationRequestAssistant.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError"));

    if (a3)
      goto LABEL_4;
LABEL_7:
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = objc_loadWeakRetained((id *)&self->_errorDomain);
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("Invalid requested orientation.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 0, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneOrientationRequestAssistant.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!a3)
    goto LABEL_7;
LABEL_4:
  v12 = objc_msgSend(v11, "_supportedInterfaceOrientationsFromSceneOrientationRequestSetup");
  objc_msgSend(v11, "_setInterfaceOrientationFromUserResizing:", 0);
  objc_msgSend(v11, "_setSettingUpSceneOrientationRequest:", v12 == 0);
  objc_msgSend(v11, "_setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:", a3);
  objc_msgSend(WeakRetained, "participant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setInitialDeviceOrientationFromSceneOrientationRequestSetup:", objc_msgSend(v13, "currentDeviceOrientation"));

  -[SBTraitsSceneOrientationRequestAssistant _performCoalescedBroadcastArbitrationUpdateWithReason:](self, "_performCoalescedBroadcastArbitrationUpdateWithReason:", CFSTR("SceneOrientationRequest setup"));
LABEL_8:

}

- (void)_performCoalescedBroadcastArbitrationUpdateWithReason:(id)a3
{
  id v4;
  id v5;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  BSRunLoopPerformRelativeToCACommit();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __98__SBTraitsSceneOrientationRequestAssistant__performCoalescedBroadcastArbitrationUpdateWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("SBSceneGeometryOrientationRequestChanged"), 0);

    WeakRetained = v3;
  }

}

- (SBTraitsSceneParticipantDelegate)traitsDelegate
{
  return (SBTraitsSceneParticipantDelegate *)objc_loadWeakRetained((id *)&self->_traitsDelegate);
}

- (NSString)errorDomain
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_errorDomain);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_errorDomain);
  objc_destroyWeak((id *)&self->_traitsDelegate);
}

@end

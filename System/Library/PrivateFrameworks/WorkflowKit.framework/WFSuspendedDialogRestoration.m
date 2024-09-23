@implementation WFSuspendedDialogRestoration

- (WFSuspendedDialogRestoration)initWithUserInterfacePresenter:(id)a3
{
  id v5;
  WFSuspendedDialogRestoration *v6;
  WFSuspendedDialogRestoration *v7;
  WFScreenOnObserver *v8;
  WFScreenOnObserver *screenOnObserver;
  WFSuspendedDialogRestoration *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSuspendedDialogRestoration;
  v6 = -[WFSuspendedDialogRestoration init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    v8 = objc_alloc_init(WFScreenOnObserver);
    screenOnObserver = v7->_screenOnObserver;
    v7->_screenOnObserver = v8;

    -[WFScreenOnObserver start](v7->_screenOnObserver, "start");
    *(_WORD *)&v7->_screenDidTurnOffDuringActiveRequest = 0;
    v10 = v7;
  }

  return v7;
}

- (void)beginObservingApplicationState
{
  void *v3;
  FBSDisplayLayoutMonitor *v4;
  FBSDisplayLayoutMonitor *layoutMonitor;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUserInteractivePriority:", 1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__WFSuspendedDialogRestoration_beginObservingApplicationState__block_invoke;
  v6[3] = &unk_1E7AF9310;
  v6[4] = self;
  objc_msgSend(v3, "setTransitionHandler:", v6);
  objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v3);
  v4 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v4;

}

- (void)stopObservingApplicationState
{
  void *v3;
  FBSDisplayLayoutMonitor *layoutMonitor;

  -[WFSuspendedDialogRestoration layoutMonitor](self, "layoutMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = 0;

}

- (void)reset
{
  -[WFSuspendedDialogRestoration setScreenDidTurnOffDuringActiveRequest:](self, "setScreenDidTurnOffDuringActiveRequest:", 0);
  -[WFSuspendedDialogRestoration setShortcutsAppDidBackgroundDuringActiveRequest:](self, "setShortcutsAppDidBackgroundDuringActiveRequest:", 0);
  -[WFSuspendedDialogRestoration setSuspendedRequest:](self, "setSuspendedRequest:", 0);
  -[WFSuspendedDialogRestoration setSuspendedRunningContext:](self, "setSuspendedRunningContext:", 0);
  -[WFSuspendedDialogRestoration setSuspendedRequestCompletion:](self, "setSuspendedRequestCompletion:", 0);
}

- (BOOL)shortcutsAppIsForegroundInLayout:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "elements", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x1E0D22C78];
    v9 = *MEMORY[0x1E0DC7FD8];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v8);

      if ((v13 & 1) != 0)
        break;
      if (objc_msgSend(v11, "isUIApplicationElement"))
      {
        objc_msgSend(v11, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v9);

      }
      else
      {
        v15 = 0;
      }
      v6 |= v15;
      if (v5 == ++v10)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
  }
  v6 = 0;
LABEL_14:

  return v6 & 1;
}

- (BOOL)presenterShouldShowRequest:(id)a3 runningContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFSuspendedDialogRestoration reset](self, "reset");
  if (!objc_msgSend(v9, "isShortcutsApp"))
    goto LABEL_7;
  -[WFSuspendedDialogRestoration layoutMonitor](self, "layoutMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[WFSuspendedDialogRestoration stopObservingApplicationState](self, "stopObservingApplicationState");
  -[WFSuspendedDialogRestoration beginObservingApplicationState](self, "beginObservingApplicationState");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFSuspendedDialogRestoration setSuspendedRequest:](self, "setSuspendedRequest:", v8);
    -[WFSuspendedDialogRestoration setSuspendedRunningContext:](self, "setSuspendedRunningContext:", v9);
    -[WFSuspendedDialogRestoration setSuspendedRequestCompletion:](self, "setSuspendedRequestCompletion:", v10);
  }
  -[WFSuspendedDialogRestoration screenOnObserver](self, "screenOnObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "screenOn");

  if ((v13 & 1) == 0)
  {
    -[WFSuspendedDialogRestoration setScreenDidTurnOffDuringActiveRequest:](self, "setScreenDidTurnOffDuringActiveRequest:", 1);
    v14 = 0;
  }
  else
  {
LABEL_7:
    v14 = 1;
  }

  return v14;
}

- (void)presenterDidReceiveSuspendedResponseForRequest:(id)a3 runningContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;

  v9 = a5;
  v8 = a4;
  -[WFSuspendedDialogRestoration setSuspendedRequest:](self, "setSuspendedRequest:", a3);
  -[WFSuspendedDialogRestoration setSuspendedRunningContext:](self, "setSuspendedRunningContext:", v8);

  -[WFSuspendedDialogRestoration setSuspendedRequestCompletion:](self, "setSuspendedRequestCompletion:", v9);
}

- (WFScreenOnObserver)screenOnObserver
{
  return self->_screenOnObserver;
}

- (void)setScreenOnObserver:(id)a3
{
  objc_storeStrong((id *)&self->_screenOnObserver, a3);
}

- (WFUIPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_layoutMonitor, a3);
}

- (WFDialogRequest)suspendedRequest
{
  return self->_suspendedRequest;
}

- (void)setSuspendedRequest:(id)a3
{
  objc_storeStrong((id *)&self->_suspendedRequest, a3);
}

- (WFWorkflowRunningContext)suspendedRunningContext
{
  return self->_suspendedRunningContext;
}

- (void)setSuspendedRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_suspendedRunningContext, a3);
}

- (id)suspendedRequestCompletion
{
  return self->_suspendedRequestCompletion;
}

- (void)setSuspendedRequestCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)screenDidTurnOffDuringActiveRequest
{
  return self->_screenDidTurnOffDuringActiveRequest;
}

- (void)setScreenDidTurnOffDuringActiveRequest:(BOOL)a3
{
  self->_screenDidTurnOffDuringActiveRequest = a3;
}

- (BOOL)shortcutsAppDidBackgroundDuringActiveRequest
{
  return self->_shortcutsAppDidBackgroundDuringActiveRequest;
}

- (void)setShortcutsAppDidBackgroundDuringActiveRequest:(BOOL)a3
{
  self->_shortcutsAppDidBackgroundDuringActiveRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suspendedRequestCompletion, 0);
  objc_storeStrong((id *)&self->_suspendedRunningContext, 0);
  objc_storeStrong((id *)&self->_suspendedRequest, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_screenOnObserver, 0);
}

void __62__WFSuspendedDialogRestoration_beginObservingApplicationState__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  id v19;
  int v20;
  id v21;
  id v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  _BYTE v37[10];
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    getWFDialogLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
      v36 = 2112;
      *(_QWORD *)v37 = v8;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_INFO, "%s Transitioned to layout: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "screenOnObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "screenOn");

    if ((objc_msgSend(*(id *)(a1 + 32), "screenDidTurnOffDuringActiveRequest") & 1) == 0 && (v12 & 1) == 0)
    {
      getWFDialogLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEFAULT, "%s Screen did turn off during active request", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setScreenDidTurnOffDuringActiveRequest:", 1);
    }
    v14 = objc_msgSend(*(id *)(a1 + 32), "shortcutsAppIsForegroundInLayout:", v8);
    if ((objc_msgSend(*(id *)(a1 + 32), "shortcutsAppDidBackgroundDuringActiveRequest") & 1) == 0 && (v14 & 1) == 0)
    {
      getWFDialogLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_DEFAULT, "%s Shortcuts app did background during active request", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setShortcutsAppDidBackgroundDuringActiveRequest:", 1);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "screenDidTurnOffDuringActiveRequest") & 1) != 0)
      v16 = 0;
    else
      v16 = objc_msgSend(*(id *)(a1 + 32), "shortcutsAppDidBackgroundDuringActiveRequest") ^ 1;
    getWFDialogLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v16;
      v18 = v14;
      v19 = v8;
      v20 = v12;
      v21 = v9;
      v22 = v7;
      v23 = objc_msgSend(*(id *)(a1 + 32), "screenDidTurnOffDuringActiveRequest");
      v24 = objc_msgSend(*(id *)(a1 + 32), "shortcutsAppDidBackgroundDuringActiveRequest");
      objc_msgSend(*(id *)(a1 + 32), "suspendedRequest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
      v36 = 1024;
      *(_DWORD *)v37 = v23;
      v7 = v22;
      v9 = v21;
      v12 = v20;
      v8 = v19;
      v14 = v18;
      v16 = v33;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v24;
      v38 = 1024;
      v39 = v12;
      v40 = 1024;
      v41 = v14;
      v42 = 2112;
      v43 = v25;
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_DEFAULT, "%s Deciding if we should bring back the dialog: screenDidTurnOff: %i, appDidBackground: %i, displayIsOn: %i, shortcutsAppIsVisible: %i, suspended request: %@", buf, 0x2Eu);

    }
    if (((v12 & v14 ^ 1 | v16) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "suspendedRequest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        getWFDialogLogObject();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "suspendedRequest");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
          v36 = 2112;
          *(_QWORD *)v37 = v28;
          _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_DEFAULT, "%s Bringing back suspended dialog: %@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "presenter");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "suspendedRequest");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "suspendedRunningContext");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "suspendedRequestCompletion");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "showDialogRequest:runningContext:completionHandler:", v30, v31, v32);

      }
    }
  }

}

@end

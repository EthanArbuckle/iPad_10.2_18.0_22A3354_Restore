@implementation WFUIPresenter

- (WFUIPresenter)initWithConnection:(id)a3
{
  id v6;
  WFUIPresenter *v7;
  WFUIPresenter *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUIPresenter.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  v11.receiver = self;
  v11.super_class = (Class)WFUIPresenter;
  v7 = -[WFUIPresenter init](&v11, sel_init);
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setHost:", v7);
    objc_storeStrong((id *)&v7->_connection, a3);
    v8 = v7;
  }

  return v7;
}

- (WFUIPresenter)initWithConnection:(id)a3 auxiliaryConnection:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFUIPresenter *v11;
  uint64_t v12;
  NSMutableSet *runningContextsUsingAuxiliaryConnection;
  WFUIPresenter *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUIPresenter.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUIPresenter.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auxiliaryConnection"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)WFUIPresenter;
  v11 = -[WFUIPresenter init](&v18, sel_init);
  if (v11)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setHost:", v11);
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v11->_auxiliaryConnection, a4);
    v12 = objc_opt_new();
    runningContextsUsingAuxiliaryConnection = v11->_runningContextsUsingAuxiliaryConnection;
    v11->_runningContextsUsingAuxiliaryConnection = (NSMutableSet *)v12;

    v14 = v11;
  }

  return v11;
}

- (void)pauseDialogPresentationForDuration:(id)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *))a4;
  -[WFUIPresenter connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presenterWithErrorHandler:", &__block_literal_global_585);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "pauseDialogPresentationForDuration:withCompletionHandler:", v10, v6);
  }
  else
  {
    WFRunnerFailureErrorMessage(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9);

  }
}

- (void)resumeDialogPresentationWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[WFUIPresenter connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenterWithErrorHandler:", &__block_literal_global_128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "resumeDialogPresentationWithCompletionHandler:", v7);
  }
  else
  {
    WFRunnerFailureErrorMessage(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
}

- (void)beginPersistentModeWithRunningContext:(id)a3 attribution:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[WFUIPresenter connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presenterWithErrorHandler:", &__block_literal_global_129);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "beginPersistentModeWithRunningContext:attribution:completionHandler:", v13, v8, v9);
  }
  else
  {
    WFRunnerFailureErrorMessage(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12);

  }
}

- (void)completePersistentModeWithSuccess:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[WFUIPresenter connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presenterWithErrorHandler:", &__block_literal_global_130);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "completePersistentModeWithSuccess:runningContext:completionHandler:", v13, v8, v9);
  }
  else
  {
    WFRunnerFailureErrorMessage(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12);

  }
}

- (void)updateRunViewSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFUIPresenter connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenterWithErrorHandler:", &__block_literal_global_131);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "updateRunViewSource:", v4);
  }
  else
  {
    getWFDialogLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[WFUIPresenter updateRunViewSource:]";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Did not get a UI presenter to update the run view source.", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[WFUIPresenter requestShouldUseAuxiliaryConnection:](self, "requestShouldUseAuxiliaryConnection:", v8))
  {
    -[WFUIPresenter auxiliaryConnection](self, "auxiliaryConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUIPresenter runningContextsUsingAuxiliaryConnection](self, "runningContextsUsingAuxiliaryConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v9);

  }
  else
  {
    -[WFUIPresenter connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __68__WFUIPresenter_showDialogRequest_runningContext_completionHandler___block_invoke;
  v37[3] = &unk_1E7AF4FB0;
  v14 = v10;
  v38 = v14;
  objc_msgSend(v11, "presenterWithErrorHandler:", v37);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithResponseCode:", 1);
    (*((void (**)(id, void *, _QWORD))v14 + 2))(v14, v27, 0);
LABEL_18:

    goto LABEL_19;
  }
  -[WFUIPresenter delegate](self, "delegate");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[WFUIPresenter delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[WFUIPresenter delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "presenterShouldShowRequest:runningContext:withCompletionHandler:", v8, v9, v14);

      if ((v21 & 1) == 0)
      {
        -[WFUIPresenter delegate](self, "delegate");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          -[WFUIPresenter delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_opt_respondsToSelector();

          if ((v25 & 1) != 0)
          {
            getWFDialogLogObject();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v40 = "-[WFUIPresenter showDialogRequest:runningContext:completionHandler:]";
              v41 = 2112;
              v42 = v9;
              _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_DEFAULT, "%s Workflow (%@) is running from the app and the display is off, we need to suspend the request before we pass it to the presenter", buf, 0x16u);
            }

            -[WFUIPresenter delegate](self, "delegate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "presenterDidReceiveSuspendedResponseForRequest:runningContext:withCompletionHandler:", v8, v9, v14);
            goto LABEL_18;
          }
        }
      }
    }
  }
  -[WFUIPresenter delegate](self, "delegate");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[WFUIPresenter delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_opt_respondsToSelector();

    if ((v31 & 1) != 0)
    {
      -[WFUIPresenter delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "presenterWillShowRequest:runningContext:", v8, v9);

    }
  }
  v33[0] = v13;
  v33[1] = 3221225472;
  v33[2] = __68__WFUIPresenter_showDialogRequest_runningContext_completionHandler___block_invoke_139;
  v33[3] = &unk_1E7AEA310;
  v33[4] = self;
  v34 = v8;
  v35 = v9;
  v36 = v14;
  objc_msgSend(v15, "showDialogRequest:runningContext:completionHandler:", v34, v35, v33);

LABEL_19:
}

- (void)updateAttribution:(id)a3 runningContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFUIPresenter connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presenterWithErrorHandler:", &__block_literal_global_141);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "updateAttribution:runningContext:", v6, v7);
  }
  else
  {
    getWFDialogLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[WFUIPresenter updateAttribution:runningContext:]";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Did not get a UI presenter to update the run view source.", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)applicationWillLaunchInForegroundForRunningContext:(id)a3 isLastAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFUIPresenter connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presenterWithErrorHandler:", &__block_literal_global_142);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "applicationWillLaunchInForegroundForRunningContext:isLastAction:", v6, v7);
  }
  else
  {
    getWFDialogLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[WFUIPresenter applicationWillLaunchInForegroundForRunningContext:isLastAction:]";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Did not get a UI presenter to update the run view source.", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[WFUIPresenter runningContextsUsingAuxiliaryConnection](self, "runningContextsUsingAuxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    -[WFUIPresenter auxiliaryConnection](self, "auxiliaryConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUIPresenter runningContextsUsingAuxiliaryConnection](self, "runningContextsUsingAuxiliaryConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v6);

  }
  else
  {
    -[WFUIPresenter connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v10, "isConnected") & 1) != 0)
  {
    objc_msgSend(v10, "presenterWithErrorHandler:", &__block_literal_global_143);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[WFUIPresenter delegate](self, "delegate");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        -[WFUIPresenter delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          -[WFUIPresenter delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "presenterWillDismissPresentedContent");

        }
      }
      objc_msgSend(v12, "dismissPresentedContentForRunningContext:completionHandler:", v6, v7);
    }
    else
    {
      WFRunnerFailureErrorMessage(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v19);

    }
  }
  else
  {
    getWFDialogLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "-[WFUIPresenter dismissPresentedContentForRunningContext:completionHandler:]";
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_DEFAULT, "%s Not reaching out to UI for dismissal, this shortcut hasn't presented any UI", (uint8_t *)&v20, 0xCu);
    }

    v7[2](v7, 0);
  }

}

- (BOOL)showWebPage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFUIPresenter connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WFUIPresenter connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__WFUIPresenter_showWebPage_completionHandler___block_invoke;
    v19[3] = &unk_1E7AF4FB0;
    v12 = v7;
    v20 = v12;
    objc_msgSend(v10, "synchronousPresenterWithErrorHandler:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13 != 0;
    if (v13)
    {
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __47__WFUIPresenter_showWebPage_completionHandler___block_invoke_2;
      v17[3] = &unk_1E7AED378;
      v18 = v12;
      objc_msgSend(v13, "openURL:completionHandler:", v6, v17);

    }
    v15 = v20;
  }
  else
  {
    getWFDialogLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[WFUIPresenter showWebPage:completionHandler:]";
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Unable to show web page, because the presenter does not offer a synchronous presenter", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (void)presenterRequestedWorkflowStopForContext:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFUIPresenter delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFUIPresenter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presenterRequestedWorkflowStopForContext:", v7);

  }
}

- (void)presenterRequestedWorkflowPauseForContext:(id)a3 dialogRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[WFUIPresenter delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[WFUIPresenter delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presenterRequestedWorkflowPauseForContext:dialogRequest:", v13, v8);

  }
  v9[2](v9, 0);

}

- (void)presenterRequestedUpdatedRunViewSource:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[WFUIPresenter delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFUIPresenter delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presenterRequestedUpdatedRunViewSource:completionHandler:", v10, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (BOOL)requestShouldUseAuxiliaryConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0C99EA0], "bannerWorkaroundsDisabled") & 1) != 0
    || (-[WFUIPresenter auxiliaryConnection](self, "auxiliaryConnection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v8 = 0;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "actionClassName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(&unk_1E7B8D328, "containsObject:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (WFUIPresenterDelegate)delegate
{
  return (WFUIPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (WFUIPresenterConnection)connection
{
  return self->_connection;
}

- (WFUIPresenterConnection)auxiliaryConnection
{
  return self->_auxiliaryConnection;
}

- (NSMutableSet)runningContextsUsingAuxiliaryConnection
{
  return self->_runningContextsUsingAuxiliaryConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningContextsUsingAuxiliaryConnection, 0);
  objc_storeStrong((id *)&self->_auxiliaryConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __47__WFUIPresenter_showWebPage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__WFUIPresenter_showWebPage_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "BOOLValue"), v5);

}

void __76__WFUIPresenter_dismissPresentedContentForRunningContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    getWFDialogLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFUIPresenter dismissPresentedContentForRunningContext:completionHandler:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Failed to dismiss presented content: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __81__WFUIPresenter_applicationWillLaunchInForegroundForRunningContext_isLastAction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    getWFDialogLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFUIPresenter applicationWillLaunchInForegroundForRunningContext:isLastAction:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (beginPersistentModeWithRunningContext): %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __50__WFUIPresenter_updateAttribution_runningContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    getWFDialogLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFUIPresenter updateAttribution:runningContext:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (beginPersistentModeWithRunningContext): %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __68__WFUIPresenter_showDialogRequest_runningContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFDialogLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[WFUIPresenter showDialogRequest:runningContext:completionHandler:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (showDialogRequest): %@", (uint8_t *)&v7, 0x16u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithResponseCode:", 1);
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v3);

}

void __68__WFUIPresenter_showDialogRequest_runningContext_completionHandler___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "responseCode") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "presenterDidReceiveSuspendedResponseForRequest:runningContext:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_12:

      }
    }
  }
  else
  {
    if (!v5)
    {
      getWFWorkflowExecutionLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315394;
        v16 = "-[WFUIPresenter showDialogRequest:runningContext:completionHandler:]_block_invoke";
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Show dialog request failed with error: %@", (uint8_t *)&v15, 0x16u);
      }

      v14 = *(_QWORD *)(a1 + 56);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithResponseCode:", 1);
      (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v11, v6);
      goto LABEL_12;
    }
    getWFDialogLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[WFUIPresenter showDialogRequest:runningContext:completionHandler:]_block_invoke";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s Received dialog response: %@", (uint8_t *)&v15, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __37__WFUIPresenter_updateRunViewSource___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    getWFDialogLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFUIPresenter updateRunViewSource:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (beginPersistentModeWithRunningContext): %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __84__WFUIPresenter_completePersistentModeWithSuccess_runningContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    getWFDialogLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFUIPresenter completePersistentModeWithSuccess:runningContext:completionHandler:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (completePersistentModeWithSuccess): %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __85__WFUIPresenter_beginPersistentModeWithRunningContext_attribution_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    getWFDialogLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFUIPresenter beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (beginPersistentModeWithRunningContext): %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __63__WFUIPresenter_resumeDialogPresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    getWFDialogLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFUIPresenter resumeDialogPresentationWithCompletionHandler:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (resumeDialogPresentation): %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __74__WFUIPresenter_pauseDialogPresentationForDuration_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    getWFDialogLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFUIPresenter pauseDialogPresentationForDuration:withCompletionHandler:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (pauseDialogPresentation): %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

+ (WFUIPresenter)defaultPresenter
{
  int v3;
  id v4;
  WFUIPresenterXPCConnection *v5;
  WFUIPresenterXPCConnection *v6;
  void *v7;

  if (!objc_msgSend(MEMORY[0x1E0C99EA0], "bannersEnabled"))
  {
    v4 = objc_alloc((Class)a1);
    v5 = -[WFUIPresenterXPCConnection initWithMachServiceName:]([WFUIPresenterXPCConnection alloc], "initWithMachServiceName:", CFSTR("com.apple.shortcuts.dialogpresentation"));
    goto LABEL_5;
  }
  v3 = objc_msgSend(MEMORY[0x1E0C99EA0], "bannerWorkaroundsDisabled");
  v4 = objc_alloc((Class)a1);
  v5 = (WFUIPresenterXPCConnection *)objc_opt_new();
  if (v3)
  {
LABEL_5:
    v7 = (void *)objc_msgSend(v4, "initWithConnection:", v5);
    goto LABEL_6;
  }
  v6 = -[WFUIPresenterXPCConnection initWithMachServiceName:]([WFUIPresenterXPCConnection alloc], "initWithMachServiceName:", CFSTR("com.apple.shortcuts.dialogpresentation"));
  v7 = (void *)objc_msgSend(v4, "initWithConnection:auxiliaryConnection:", v5, v6);

LABEL_6:
  return (WFUIPresenter *)v7;
}

@end

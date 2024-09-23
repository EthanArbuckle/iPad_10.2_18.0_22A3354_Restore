@implementation SHSheetRemoteScene

- (SHSheetRemoteScene)initWithSession:(id)a3
{
  id v4;
  SHSheetRemoteScene *v5;
  SHSheetRemoteScene *v6;
  uint64_t v7;
  SHSheetUIServiceClientContext *sessionContext;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHSheetRemoteScene;
  v5 = -[SHSheetRemoteScene init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_session, v4);
    objc_msgSend(v4, "createClientContext");
    v7 = objc_claimAutoreleasedReturnValue();
    sessionContext = v6->_sessionContext;
    v6->_sessionContext = (SHSheetUIServiceClientContext *)v7;

    objc_msgSend(v4, "activityViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_presentationStyle = SHSheetPresentationControllerPresentationStyle(v9);

  }
  return v6;
}

- (void)activate
{
  NSObject *v3;
  int v4;
  SHSheetRemoteScene *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "scene %@ activating", (uint8_t *)&v4, 0xCu);
  }

  -[SHSheetRemoteScene setupSceneHosting](self, "setupSceneHosting");
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  SHSheetRemoteScene *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "scene %@ invalidating", (uint8_t *)&v4, 0xCu);
  }

  -[SHSheetRemoteScene setHostingController:](self, "setHostingController:", 0);
}

- (id)createSceneSettings
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__SHSheetRemoteScene_createSceneSettings__block_invoke;
  v3[3] = &unk_1E4001638;
  v3[4] = self;
  +[SHSheetRemoteSceneSettings settingsWithConfigurationBlock:](SHSheetRemoteSceneSettings, "settingsWithConfigurationBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __41__SHSheetRemoteScene_createSceneSettings__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sessionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionContext:", v5);

  objc_msgSend(v4, "setPresentationStyle:", objc_msgSend(*(id *)(a1 + 32), "presentationStyle"));
  objc_msgSend(v4, "setHostProcessType:", objc_msgSend(*(id *)(a1 + 32), "hostProcessType"));
  objc_msgSend(*(id *)(a1 + 32), "customizationGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomizationGroups:", v6);

}

- (void)setupSceneHosting
{
  NSObject *v3;
  id v4;
  void *v5;
  _UISceneHostingController *v6;
  _UISceneHostingController *hostingController;
  _UISceneHostingController *v8;
  void *v9;
  id SFUIShareSheetRemoteSettingsHelperClass;
  _UISceneHostingController *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  SHSheetRemoteScene *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_hostingController)
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "scene %@ setting up scene hosting", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D87D80], "identityForAngelJobLabel:", CFSTR("com.apple.sharinguiservice"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0DC42F8]);
    v5 = (void *)objc_opt_new();
    v6 = (_UISceneHostingController *)objc_msgSend(v4, "initWithProcessIdentity:sceneSpecification:", v20, v5);
    hostingController = self->_hostingController;
    self->_hostingController = v6;

    -[_UISceneHostingController setDelegate:](self->_hostingController, "setDelegate:", self);
    v8 = self->_hostingController;
    v9 = (void *)objc_opt_new();
    -[_UISceneHostingController setActivationController:](v8, "setActivationController:", v9);

    SFUIShareSheetRemoteSettingsHelperClass = getSFUIShareSheetRemoteSettingsHelperClass();
    v11 = self->_hostingController;
    -[SHSheetRemoteScene sessionContext](self, "sessionContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SHSheetRemoteScene hostProcessType](self, "hostProcessType");
    v14 = -[SHSheetRemoteScene presentationStyle](self, "presentationStyle");
    -[SHSheetRemoteScene customizationGroups](self, "customizationGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteScene collaborationOptions](self, "collaborationOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteScene _dataRepresentationForCollaborationShareOptions:](self, "_dataRepresentationForCollaborationShareOptions:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteScene cloudShareRequest](self, "cloudShareRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(SFUIShareSheetRemoteSettingsHelperClass, "updateHostingController:withContext:hostProcessType:hostPresentationStyle:optionGroups:collaborationOptionsData:cloudShareRequest:", v11, v12, v13, v14, v15, v17, v18);

    -[SHSheetRemoteScene delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sceneDidBecomeActive:", self);

  }
}

- (void)updateWithSessionContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SHSheetRemoteScene_updateWithSessionContext___block_invoke;
  v6[3] = &unk_1E4001200;
  v7 = v4;
  v5 = v4;
  -[SHSheetRemoteScene updateWithChange:](self, "updateWithChange:", v6);

}

uint64_t __47__SHSheetRemoteScene_updateWithSessionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSessionContext:", *(_QWORD *)(a1 + 32));
}

- (void)updateWithChange:(id)a3
{
  void (**v4)(id, SHSheetRemoteScene *);
  NSObject *v5;
  id SFUIShareSheetRemoteSettingsHelperClass;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  SHSheetRemoteScene *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, SHSheetRemoteScene *))a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "scene %@ will update", buf, 0xCu);
  }

  v4[2](v4, self);
  SFUIShareSheetRemoteSettingsHelperClass = getSFUIShareSheetRemoteSettingsHelperClass();
  -[SHSheetRemoteScene hostingController](self, "hostingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRemoteScene sessionContext](self, "sessionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SHSheetRemoteScene hostProcessType](self, "hostProcessType");
  v10 = -[SHSheetRemoteScene presentationStyle](self, "presentationStyle");
  -[SHSheetRemoteScene customizationGroups](self, "customizationGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRemoteScene collaborationOptions](self, "collaborationOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRemoteScene _dataRepresentationForCollaborationShareOptions:](self, "_dataRepresentationForCollaborationShareOptions:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRemoteScene cloudShareRequest](self, "cloudShareRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SFUIShareSheetRemoteSettingsHelperClass, "updateHostingController:withContext:hostProcessType:hostPresentationStyle:optionGroups:collaborationOptionsData:cloudShareRequest:", v7, v8, v9, v10, v11, v13, v14);

}

- (void)setHostProcessType:(int64_t)a3
{
  int64_t hostProcessType;

  hostProcessType = self->_hostProcessType;
  if (hostProcessType != a3 && hostProcessType <= 0)
    self->_hostProcessType = a3;
}

- (void)receivedAction:(id)a3
{
  SHSheetRemoteScene *v4;
  NSObject *v5;
  SHSheetRemoteScene *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  SHSheetRemoteScene *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  NSObject *v15;
  int v16;
  SHSheetRemoteScene *v17;
  __int16 v18;
  SHSheetRemoteScene *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (SHSheetRemoteScene *)a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "scene %@ received action: %@", (uint8_t *)&v16, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    if (-[SHSheetRemoteScene type](v6, "type") == 10)
    {
      -[SHSheetRemoteScene session](self, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activityViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_endDelayingPresentation");

    }
    -[SHSheetRemoteScene delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject scene:didReceiveAction:](v9, "scene:didReceiveAction:", self, v6);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[SHSheetRemoteScene delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject scene:didReceiveMetadataUpdateAction:](v9, "scene:didReceiveMetadataUpdateAction:", self, v6);
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[SHSheetRemoteScene delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject scene:didReceiveSuggestionAction:](v9, "scene:didReceiveSuggestionAction:", self, v6);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[SHSheetRemoteScene delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject scene:didReceiveOptionUpdateAction:](v9, "scene:didReceiveOptionUpdateAction:", self, v6);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v4;
    -[SHSheetRemoteScene delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteScene collaborationOptions](v10, "collaborationOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject scene:didReceiveCollaborationOptionUpdateAction:](v9, "scene:didReceiveCollaborationOptionUpdateAction:", self, v11);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v4;
      -[SHSheetRemoteScene setCloudShareRequest:](self, "setCloudShareRequest:", 0);
      -[SHSheetRemoteScene collaborationCreateSharingURLCompletionHandler](self, "collaborationCreateSharingURLCompletionHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[SHSheetRemoteScene collaborationCreateSharingURLCompletionHandler](self, "collaborationCreateSharingURLCompletionHandler");
        v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[NSObject result](v9, "result");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v13)[2](v13, v14);

        -[SHSheetRemoteScene setCollaborationCreateSharingURLCompletionHandler:](self, "setCollaborationCreateSharingURLCompletionHandler:", 0);
      }
      else
      {
        share_sheet_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[SHSheetRemoteScene receivedAction:].cold.1(v15);

      }
    }
    else
    {
      share_sheet_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v4;
        _os_log_impl(&dword_19E419000, v9, OS_LOG_TYPE_DEFAULT, "scene receieved unsupported action:%@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
LABEL_14:

}

- (void)clientIsReady
{
  NSObject *v3;
  uint8_t v4[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteScene clientIsReady", v4, 2u);
  }

  self->_isActive = 1;
}

- (void)sendAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  SHSheetRemoteScene *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "scene %@ will send action:%@", (uint8_t *)&v7, 0x16u);
  }

  -[SHSheetRemoteScene hostingController](self, "hostingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendAction:", v4);

}

- (void)presentCollaborationParticipantsViewControllerForCloudSharingRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "Request collaboration participants view presentation from the remote", buf, 2u);
  }

  -[SHSheetRemoteScene setCollaborationCreateSharingURLCompletionHandler:](self, "setCollaborationCreateSharingURLCompletionHandler:", v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__SHSheetRemoteScene_presentCollaborationParticipantsViewControllerForCloudSharingRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E4001200;
  v11 = v6;
  v9 = v6;
  -[SHSheetRemoteScene updateWithChange:](self, "updateWithChange:", v10);

}

uint64_t __109__SHSheetRemoteScene_presentCollaborationParticipantsViewControllerForCloudSharingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCloudShareRequest:", *(_QWORD *)(a1 + 32));
}

- (id)_dataRepresentationForCollaborationShareOptions:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", v4, *MEMORY[0x1E0CB2CD0]);

  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SHSheetSession)session
{
  return (SHSheetSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (SHSheetRemoteSceneDelegate)delegate
{
  return (SHSheetRemoteSceneDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UISceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingController, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (SHSheetUIServiceClientContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
  objc_storeStrong((id *)&self->_sessionContext, a3);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (int64_t)hostProcessType
{
  return self->_hostProcessType;
}

- (NSArray)customizationGroups
{
  return self->_customizationGroups;
}

- (void)setCustomizationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_SWCollaborationShareOptions)collaborationOptions
{
  return self->_collaborationOptions;
}

- (void)setCollaborationOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SFCollaborationCloudSharingRequest)cloudShareRequest
{
  return self->_cloudShareRequest;
}

- (void)setCloudShareRequest:(id)a3
{
  objc_storeStrong((id *)&self->_cloudShareRequest, a3);
}

- (id)collaborationCreateSharingURLCompletionHandler
{
  return self->_collaborationCreateSharingURLCompletionHandler;
}

- (void)setCollaborationCreateSharingURLCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_collaborationCreateSharingURLCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cloudShareRequest, 0);
  objc_storeStrong((id *)&self->_collaborationOptions, 0);
  objc_storeStrong((id *)&self->_customizationGroups, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_hostingController, 0);
}

- (void)receivedAction:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "Received collaboration participants sharing update with no completion handler", v1, 2u);
}

@end

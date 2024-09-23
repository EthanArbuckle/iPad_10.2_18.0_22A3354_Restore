@implementation _UINavigationBarTitleRenamerRemoteSession

- (_UINavigationBarTitleRenamerRemoteSession)initWithSuggestedTitle:(id)a3 iconMetadata:(id)a4 scene:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UINavigationBarTitleRenamerRemoteSession *v12;
  _UIOverlayService *v13;
  _UIOverlayService *overlayService;
  _UIOverlayService *v15;
  void *v16;
  uint64_t v17;
  FBSSceneIdentityToken *sceneOriginIdentityToken;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (_UIApplicationProcessIsOverlayUI())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarTitleRenamerRemoteSession.m"), 348, CFSTR("initializing a remote session in this process is not allowed outside of decoding a session from another process."));

  }
  v21.receiver = self;
  v21.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  v12 = -[_UINavigationBarTitleRenamerSession initWithSuggestedTitle:iconMetadata:](&v21, sel_initWithSuggestedTitle_iconMetadata_, v9, v10);
  if (v12)
  {
    v13 = (_UIOverlayService *)objc_opt_new();
    -[_UIOverlayService setDelegate:](v13, "setDelegate:", v12);
    -[_UIOverlayService prewarmConnection](v13, "prewarmConnection");
    overlayService = v12->_overlayService;
    v12->_overlayService = v13;
    v15 = v13;

    objc_msgSend(v11, "_FBSScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identityToken");
    v17 = objc_claimAutoreleasedReturnValue();
    sceneOriginIdentityToken = v12->_sceneOriginIdentityToken;
    v12->_sceneOriginIdentityToken = (FBSSceneIdentityToken *)v17;

    v12->_currentState = 1;
  }

  return v12;
}

- (_UINavigationBarTitleRenamerRemoteSession)initWithFileURL:(id)a3 iconMetadata:(id)a4 error:(id *)a5 scene:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _UINavigationBarTitleRenamerRemoteSession *v16;
  int v17;
  uint64_t v18;
  id v19;
  FPSandboxingURLWrapper *urlWrapper;
  id v21;
  unint64_t v22;
  _UINavigationBarTitleRenamerRemoteSession *v23;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a4;
  if (_UIApplicationProcessIsOverlayUI())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarTitleRenamerRemoteSession.m"), 376, CFSTR("initializing a remote session in this process is not allowed outside of decoding a session from another process."));

  }
  objc_msgSend(v11, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByDeletingPathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_UINavigationBarTitleRenamerRemoteSession initWithSuggestedTitle:iconMetadata:scene:](self, "initWithSuggestedTitle:iconMetadata:scene:", v15, v13, v12);

  if (!v16)
    goto LABEL_11;
  v17 = objc_msgSend(v11, "startAccessingSecurityScopedResource");
  v29 = 0;
  objc_msgSend(getFPSandboxingURLWrapperClass(), "wrapperWithURL:readonly:error:", v11, 0, &v29);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v29;
  urlWrapper = v16->_urlWrapper;
  v16->_urlWrapper = (FPSandboxingURLWrapper *)v18;

  if (v17)
    objc_msgSend(v11, "stopAccessingSecurityScopedResource");
  if (v19)
  {
    v21 = objc_retainAutorelease(v19);
    *a5 = v21;
    v22 = initWithFileURL_iconMetadata_error_scene____s_category;
    if (!initWithFileURL_iconMetadata_error_scene____s_category)
    {
      v22 = __UILogCategoryGetNode("OOPRename", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&initWithFileURL_iconMetadata_error_scene____s_category);
    }
    if ((*(_BYTE *)v22 & 1) != 0)
    {
      v26 = *(NSObject **)(v22 + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        -[_UINavigationBarTitleRenamerSession sessionIdentifier](v16, "sessionIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v28;
        v32 = 2112;
        v33 = v21;
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "[%@] Unable to get sandbox extension for URL. Session will behave like a local session: %@", buf, 0x16u);

      }
    }

    v23 = 0;
  }
  else
  {
LABEL_11:
    v23 = v16;
  }

  return v23;
}

- (void)dealloc
{
  objc_super v3;

  -[_UINavigationBarTitleRenamerRemoteSession setConnection:](self, "setConnection:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerRemoteSession dealloc](&v3, sel_dealloc);
}

- (id)createRenamerContentView
{
  void *v3;
  _UINavigationBarTitleRenameRemoteView *v4;
  void *v5;

  -[_UINavigationBarTitleRenamerRemoteSession overlayService](self, "overlayService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[_UINavigationBarTitleRenameRemoteView initWithSession:]([_UINavigationBarTitleRenameRemoteView alloc], "initWithSession:", self);
  }
  else
  {
    v4 = -[_UINavigationBarTitleRenameTextField initWithSession:]([_UINavigationBarTitleRenameTextField alloc], "initWithSession:", self);
    -[_UINavigationBarTitleRenamerRemoteSession sceneOriginIdentityToken](self, "sceneOriginIdentityToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleRenameRemoteView _setLayeringSceneIdentity:](v4, "_setLayeringSceneIdentity:", v5);

  }
  return v4;
}

- (NSURL)fileURL
{
  void *v2;
  void *v3;

  -[_UINavigationBarTitleRenamerRemoteSession urlWrapper](self, "urlWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  FPSandboxingURLWrapper *urlWrapper;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerSession encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  urlWrapper = self->_urlWrapper;
  if (urlWrapper)
    objc_msgSend(v4, "encodeObject:forKey:", urlWrapper, CFSTR("_UINavigationBarTitleRenamerRemoteSessionURLWrapper"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneOriginIdentityToken, CFSTR("_UINavigationBarTitleRenamerRemoteSessionSceneOriginIdentityToken"));

}

- (_UINavigationBarTitleRenamerRemoteSession)initWithBSXPCCoder:(id)a3
{
  id v4;
  _UINavigationBarTitleRenamerRemoteSession *v5;
  uint64_t v6;
  FPSandboxingURLWrapper *urlWrapper;
  uint64_t v8;
  FBSSceneIdentityToken *sceneOriginIdentityToken;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  v5 = -[_UINavigationBarTitleRenamerSession initWithBSXPCCoder:](&v11, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", getFPSandboxingURLWrapperClass(), CFSTR("_UINavigationBarTitleRenamerRemoteSessionURLWrapper"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlWrapper = v5->_urlWrapper;
    v5->_urlWrapper = (FPSandboxingURLWrapper *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UINavigationBarTitleRenamerRemoteSessionSceneOriginIdentityToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    sceneOriginIdentityToken = v5->_sceneOriginIdentityToken;
    v5->_sceneOriginIdentityToken = (FBSSceneIdentityToken *)v8;

    v5->_currentState = 1;
  }

  return v5;
}

- (BOOL)_isServerSide
{
  void *v2;
  BOOL v3;

  -[_UINavigationBarTitleRenamerRemoteSession connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)sessionDidStartInRenamer:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sessionDidStartInRenamer____s_category;
  if (!sessionDidStartInRenamer____s_category)
  {
    v5 = __UILogCategoryGetNode("OOPRename", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&sessionDidStartInRenamer____s_category);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      -[_UINavigationBarTitleRenamerSession sessionIdentifier](self, "sessionIdentifier");
      LODWORD(v9) = 138412290;
      *(_QWORD *)((char *)&v9 + 4) = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)((char *)&v9 + 4);
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "[%@] Session did start.", (uint8_t *)&v9, 0xCu);

    }
  }
  v13 = 0;
  *(_QWORD *)&v9 = self;
  *((_QWORD *)&v9 + 1) = v4;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v14 = 0;
  handleEvent(stateMachineSpec_6, self->_currentState, 0, (uint64_t)&v9, (uint64_t *)&self->_currentState);

}

- (void)sessionDidEnd
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _BYTE v7[24];
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = sessionDidEnd___s_category;
  if (!sessionDidEnd___s_category)
  {
    v3 = __UILogCategoryGetNode("OOPRename", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&sessionDidEnd___s_category);
  }
  if ((*(_BYTE *)v3 & 1) != 0)
  {
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      -[_UINavigationBarTitleRenamerSession sessionIdentifier](self, "sessionIdentifier");
      *(_DWORD *)v7 = 138412290;
      *(_QWORD *)&v7[4] = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)&v7[4];
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "[%@] Session did end.", v7, 0xCu);

    }
  }
  v9 = 0u;
  v8 = 0u;
  *(_OWORD *)&v7[8] = 0u;
  *(_QWORD *)v7 = self;
  handleEvent(stateMachineSpec_6, self->_currentState, 4, (uint64_t)v7, (uint64_t *)&self->_currentState);

}

- (void)cancelSessionAndNotify:(BOOL)a3
{
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _BYTE v9[24];
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = cancelSessionAndNotify____s_category;
  if (!cancelSessionAndNotify____s_category)
  {
    v5 = __UILogCategoryGetNode("OOPRename", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&cancelSessionAndNotify____s_category);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      -[_UINavigationBarTitleRenamerSession sessionIdentifier](self, "sessionIdentifier");
      *(_DWORD *)v9 = 138412290;
      *(_QWORD *)&v9[4] = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)&v9[4];
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "[%@] Session did cancel.", v9, 0xCu);

    }
  }
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)&v9[8] = 0u;
  *(_QWORD *)v9 = self;
  BYTE8(v10) = a3;
  handleEvent(stateMachineSpec_6, self->_currentState, 7, (uint64_t)v9, (uint64_t *)&self->_currentState);

}

- (void)cancelSession
{
  -[_UINavigationBarTitleRenamerRemoteSession cancelSessionAndNotify:](self, "cancelSessionAndNotify:", 1);
}

- (id)_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4
{
  id v6;
  id v7;
  _QWORD v9[2];
  id v10;
  _NSRange *v11;
  uint64_t v12;
  id v13;
  id v14;

  v6 = a3;
  v12 = 0;
  v13 = 0;
  v9[0] = self;
  v9[1] = 0;
  v10 = v6;
  v11 = a4;
  v14 = 0;
  if ((handleEvent(stateMachineSpec_6, self->_currentState, 1, (uint64_t)v9, (uint64_t *)&self->_currentState) & 1) == 0)
    -[_UINavigationBarTitleRenamerRemoteSession cancelSessionAndNotify:](self, "cancelSessionAndNotify:", 1);
  v7 = v10;

  return v7;
}

- (BOOL)_textFieldShouldEndEditingWithText:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[3];
  __int128 v8;
  __int128 v9;

  v4 = a3;
  v7[0] = self;
  v7[1] = 0;
  v7[2] = v4;
  v8 = 0u;
  v9 = 0u;
  if ((handleEvent(stateMachineSpec_6, self->_currentState, 2, (uint64_t)v7, (uint64_t *)&self->_currentState) & 1) == 0)
    -[_UINavigationBarTitleRenamerRemoteSession cancelSessionAndNotify:](self, "cancelSessionAndNotify:", 1);
  v5 = BYTE9(v8);

  return v5;
}

- (void)_textFieldDidEndEditingWithText:(id)a3
{
  id v4;
  _QWORD v5[3];
  __int128 v6;
  __int128 v7;

  v4 = a3;
  v5[0] = self;
  v5[1] = 0;
  v5[2] = v4;
  v6 = 0u;
  v7 = 0u;
  if ((handleEvent(stateMachineSpec_6, self->_currentState, 3, (uint64_t)v5, (uint64_t *)&self->_currentState) & 1) == 0)
    -[_UINavigationBarTitleRenamerRemoteSession cancelSessionAndNotify:](self, "cancelSessionAndNotify:", 1);

}

- (void)fileRenameDidFail:(id)a3 proposedName:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = fileRenameDidFail_proposedName____s_category;
  if (!fileRenameDidFail_proposedName____s_category)
  {
    v8 = __UILogCategoryGetNode("OOPRename", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&fileRenameDidFail_proposedName____s_category);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v10 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      -[_UINavigationBarTitleRenamerSession sessionIdentifier](self, "sessionIdentifier");
      *(_DWORD *)v13 = 138412546;
      *(_QWORD *)&v13[4] = objc_claimAutoreleasedReturnValue();
      *(_WORD *)&v13[12] = 2112;
      *(_QWORD *)&v13[14] = v6;
      v12 = *(void **)&v13[4];
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "[%@] Session file rename did fail: %@", v13, 0x16u);

    }
  }
  *(_QWORD *)v13 = self;
  *(_QWORD *)&v13[8] = 0;
  v14 = 0;
  v15 = 0;
  *(_QWORD *)&v13[16] = v7;
  v9 = v6;
  v16 = v9;
  v17 = 0;
  if ((handleEvent(stateMachineSpec_6, self->_currentState, 5, (uint64_t)v13, (uint64_t *)&self->_currentState) & 1) == 0)
    -[_UINavigationBarTitleRenamerRemoteSession cancelSessionAndNotify:](self, "cancelSessionAndNotify:", 1);

}

- (void)fileRenameDidEnd:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v6 = 0;
  v5[0] = self;
  memset(&v5[1], 0, 32);
  v4 = a3;
  v7 = v4;
  if ((handleEvent(stateMachineSpec_6, *(_QWORD *)(v5[0] + 56), 6, (uint64_t)v5, (uint64_t *)(v5[0] + 56)) & 1) == 0)
    -[_UINavigationBarTitleRenamerRemoteSession cancelSessionAndNotify:](self, "cancelSessionAndNotify:", 1);

}

- (void)overlayServiceDidInvalidate:(id)a3
{
  -[_UINavigationBarTitleRenamerRemoteSession cancelSessionAndNotify:](self, "cancelSessionAndNotify:", 0);
}

- (void)_updateSessionWithAction:(int64_t)a3
{
  _UIONavigationBarTitleRenamerConnectionAction *v5;
  _UIONavigationBarTitleRenamerConnectionAction *v6;
  void *v7;
  _QWORD v8[5];

  v5 = [_UIONavigationBarTitleRenamerConnectionAction alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70___UINavigationBarTitleRenamerRemoteSession__updateSessionWithAction___block_invoke;
  v8[3] = &unk_1E16DD268;
  v8[4] = self;
  v6 = -[_UIONavigationBarTitleRenamerConnectionAction initWithSession:action:responseHandler:](v5, "initWithSession:action:responseHandler:", self, a3, v8);
  -[_UINavigationBarTitleRenamerRemoteSession overlayService](self, "overlayService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendOverlayAction:", v6);

}

- (void)_client_sessionDidStartInRenamer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerSession sessionDidStartInRenamer:](&v4, sel_sessionDidStartInRenamer_, a3);
  -[_UINavigationBarTitleRenamerRemoteSession _updateSessionWithAction:](self, "_updateSessionWithAction:", 0);
}

- (void)_client_sessionDidEnd
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerSession sessionDidEnd](&v3, sel_sessionDidEnd);
  -[_UINavigationBarTitleRenamerRemoteSession _updateSessionWithAction:](self, "_updateSessionWithAction:", 1);
}

- (void)_client_cancelSessionAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerSession cancelSession](&v5, sel_cancelSession);
  if (v3)
    -[_UINavigationBarTitleRenamerRemoteSession _updateSessionWithAction:](self, "_updateSessionWithAction:", 2);
}

- (id)_client_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerSession _willBeginRenamingWithText:selectedRange:](&v5, sel__willBeginRenamingWithText_selectedRange_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_client_textFieldShouldEndEditingWithText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  return -[_UINavigationBarTitleRenamerSession _textFieldShouldEndEditingWithText:](&v4, sel__textFieldShouldEndEditingWithText_, a3);
}

- (void)_client_textFieldDidEndEditingWithText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerSession _textFieldDidEndEditingWithText:](&v3, sel__textFieldDidEndEditingWithText_, a3);
}

- (void)_attemptLocalRenameForFileURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_get_global_queue(25, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106___UINavigationBarTitleRenamerRemoteSession__attemptLocalRenameForFileURL_proposedName_completionHandler___block_invoke;
  block[3] = &unk_1E16BAD68;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, block);

}

- (void)_client_fileRenameDidFail:(id)a3 proposedName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v6 = a3;
  v7 = a4;
  -[_UINavigationBarTitleRenamerRemoteSession fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB28A8]) || objc_msgSend(v6, "code") != 4)
  {

    goto LABEL_6;
  }

  if (!v8)
  {
LABEL_6:
    -[_UINavigationBarTitleRenamerSession attachedRenamer](self, "attachedRenamer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_session:fileRenameDidFail:", self, v6);

    goto LABEL_7;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84___UINavigationBarTitleRenamerRemoteSession__client_fileRenameDidFail_proposedName___block_invoke;
  v11[3] = &unk_1E16E1FE0;
  v11[4] = self;
  -[_UINavigationBarTitleRenamerRemoteSession _attemptLocalRenameForFileURL:proposedName:completionHandler:](self, "_attemptLocalRenameForFileURL:proposedName:completionHandler:", v8, v7, v11);
LABEL_7:

}

- (void)_client_fileRenameDidEnd:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UINavigationBarTitleRenamerSession attachedRenamer](self, "attachedRenamer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_session:fileRenameDidEnd:", self, v4);

}

- (void)setConnection:(id)a3
{
  _UIOServiceConnection *v5;
  _UIOServiceConnection *connection;
  _UIOServiceConnection *v7;

  v5 = (_UIOServiceConnection *)a3;
  connection = self->_connection;
  v7 = v5;
  if (connection != v5)
  {
    -[_UIOServiceConnection removeObserver:](connection, "removeObserver:", self);
    objc_storeStrong((id *)&self->_connection, a3);
    -[_UIOServiceConnection addObserver:](v7, "addObserver:", self);
  }

}

- (void)serviceConnectionDidInvalidate:(id)a3
{
  -[_UINavigationBarTitleRenamerRemoteSession cancelSessionAndNotify:](self, "cancelSessionAndNotify:", 0);
}

- (void)_server_sessionDidStartInRenamer:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerSession sessionDidStartInRenamer:](&v3, sel_sessionDidStartInRenamer_, a3);
}

- (void)_server_sessionDidEnd
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerSession sessionDidEnd](&v2, sel_sessionDidEnd);
}

- (void)_server_cancelSessionAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  -[_UINavigationBarTitleRenamerSession cancelSession](&v7, sel_cancelSession);
  if (v3)
  {
    +[_UIONavigationBarTitleRenamerRemoteSessionAction didCancelSession:responseHandler:](_UIONavigationBarTitleRenamerRemoteSessionAction, "didCancelSession:responseHandler:", self, &__block_literal_global_49_4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleRenamerRemoteSession connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendAction:", v5);

  }
}

- (id)_server_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  uint64_t *v14;
  void *v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  _NSRange *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  -[_UINavigationBarTitleRenamerRemoteSession fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v6;
  }
  else
  {
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__178;
    v31 = __Block_byref_object_dispose__178;
    v32 = 0;
    v21 = 0;
    v22 = (_NSRange *)&v21;
    v23 = 0x3010000000;
    v25 = 0;
    v26 = 0;
    v24 = &unk_18685B0AF;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __93___UINavigationBarTitleRenamerRemoteSession__server_willBeginRenamingWithText_selectedRange___block_invoke;
    v17[3] = &unk_1E16E2028;
    v19 = &v27;
    v20 = &v21;
    v10 = v9;
    v18 = v10;
    +[_UIONavigationBarTitleRenamerRemoteSessionAction willBeginRenamingActionWithSession:text:selectedRange:responseHandler:](_UIONavigationBarTitleRenamerRemoteSessionAction, "willBeginRenamingActionWithSession:text:selectedRange:responseHandler:", self, v6, a4->location, a4->length, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleRenamerRemoteSession connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendAction:", v11);

    v13 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v10, v13);
    v14 = v28;
    if (v28[5])
    {
      *a4 = v22[2];
      v15 = (void *)v14[5];
    }
    else
    {
      -[_UINavigationBarTitleRenamerRemoteSession cancelSessionAndNotify:](self, "cancelSessionAndNotify:", 1);
      v15 = v6;
    }
    v8 = v15;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

  }
  return v8;
}

- (BOOL)_server_textFieldShouldEndEditingWithText:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  -[_UINavigationBarTitleRenamerRemoteSession fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1;
  if (!v5)
  {
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __87___UINavigationBarTitleRenamerRemoteSession__server_textFieldShouldEndEditingWithText___block_invoke;
    v16 = &unk_1E16E2050;
    v18 = &v19;
    v8 = v7;
    v17 = v8;
    +[_UIONavigationBarTitleRenamerRemoteSessionAction shouldEndEditingActionWithSession:text:responseHandler:](_UIONavigationBarTitleRenamerRemoteSessionAction, "shouldEndEditingActionWithSession:text:responseHandler:", self, v4, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleRenamerRemoteSession connection](self, "connection", v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendAction:", v9);

    v11 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v8, v11);
    v6 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v6;
}

- (void)_server_textFieldDidEndEditingWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  id location;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  -[_UINavigationBarTitleRenamerRemoteSession fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v4);

    if (v8)
    {
      -[_UINavigationBarTitleRenamerRemoteSession fileRenameDidEnd:](self, "fileRenameDidEnd:", v5);
    }
    else
    {
      v11 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
      v22 = 0;
      v23 = &v22;
      v24 = 0x2050000000;
      v12 = (void *)qword_1ECD788B0;
      v25 = qword_1ECD788B0;
      v13 = MEMORY[0x1E0C809B0];
      if (!qword_1ECD788B0)
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __getDOCRenameSupportClass_block_invoke;
        v21[3] = &unk_1E16B14C0;
        v21[4] = &v22;
        __getDOCRenameSupportClass_block_invoke((uint64_t)v21);
        v12 = (void *)v23[3];
      }
      v14 = objc_retainAutorelease(v12);
      _Block_object_dispose(&v22, 8);
      v15[0] = v13;
      v15[1] = 3221225472;
      v15[2] = __84___UINavigationBarTitleRenamerRemoteSession__server_textFieldDidEndEditingWithText___block_invoke;
      v15[3] = &unk_1E16E2078;
      objc_copyWeak(&v18, &location);
      v16 = v4;
      v19 = v11;
      v17 = v5;
      objc_msgSend(v14, "_spi_renameDocumentAtURL:proposedName:completionHandler:", v17, v16, v15);

      objc_destroyWeak(&v18);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    +[_UIONavigationBarTitleRenamerRemoteSessionAction didEndEditingActionWithSession:text:responseHandler:](_UIONavigationBarTitleRenamerRemoteSessionAction, "didEndEditingActionWithSession:text:responseHandler:", self, v4, &__block_literal_global_50_1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleRenamerRemoteSession connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendAction:", v9);

  }
}

- (void)_server_fileRenameDidFail:(id)a3 proposedName:(id)a4
{
  void *v5;
  id v6;

  +[_UIONavigationBarTitleRenamerRemoteSessionAction fileRenameDidFailInSession:withError:proposedName:responseHandler:](_UIONavigationBarTitleRenamerRemoteSessionAction, "fileRenameDidFailInSession:withError:proposedName:responseHandler:", self, a3, a4, &__block_literal_global_51_0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarTitleRenamerRemoteSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendAction:", v6);

}

- (void)_server_fileRenameDidEnd:(id)a3
{
  void *v4;
  id v5;

  +[_UIONavigationBarTitleRenamerRemoteSessionAction fileRenameDidEndInSession:withFinalURL:responseHandler:](_UIONavigationBarTitleRenamerRemoteSessionAction, "fileRenameDidEndInSession:withFinalURL:responseHandler:", self, a3, &__block_literal_global_52_1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarTitleRenamerRemoteSession connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAction:", v5);

}

- (FPSandboxingURLWrapper)urlWrapper
{
  return self->_urlWrapper;
}

- (FBSSceneIdentityToken)sceneOriginIdentityToken
{
  return self->_sceneOriginIdentityToken;
}

- (_UIOverlayService)overlayService
{
  return self->_overlayService;
}

- (_UIOServiceConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_overlayService, 0);
  objc_storeStrong((id *)&self->_sceneOriginIdentityToken, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
}

@end

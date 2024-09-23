@implementation _UIONavigationBarTitleRenamerConnectionAction

- (_UIONavigationBarTitleRenamerConnectionAction)initWithSession:(id)a3 action:(int64_t)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _UIONavigationBarTitleRenamerConnectionAction *v16;
  objc_super v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forSetting:", v11, 0);

  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (!a4)
      objc_msgSend(v10, "setObject:forSetting:", v8, 1);
  }
  else
  {
    objc_msgSend(v8, "sessionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forSetting:", v12, 2);

  }
  v13 = (void *)MEMORY[0x1E0D016A0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88___UIONavigationBarTitleRenamerConnectionAction_initWithSession_action_responseHandler___block_invoke;
  v19[3] = &unk_1E16C6A58;
  v20 = v9;
  v14 = v9;
  objc_msgSend(v13, "responderWithHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)_UIONavigationBarTitleRenamerConnectionAction;
  v16 = -[_UIOServerAction initWithOriginContext:info:responder:](&v18, sel_initWithOriginContext_info_responder_, 0, v10, v15);

  return v16;
}

- (BOOL)isPermitted
{
  return 1;
}

- (void)_setupKeyboardEventDeferralForConnection:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90___UIONavigationBarTitleRenamerConnectionAction__setupKeyboardEventDeferralForConnection___block_invoke;
  v5[3] = &unk_1E16DA818;
  v5[4] = self;
  objc_msgSend(v4, "awaitDisplayDelegateForAction:sceneType:timeout:completion:", self, 2, v5, 1.0);

}

- (void)_teardownKeyboardEventDeferralForConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayDelegateForAction:sceneType:", self, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIONavigationBarTitleRenamerConnectionAction kfService](self, "kfService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeKeyboardFocusFromSceneIdentity:processID:", v8, getpid());

  -[_UIONavigationBarTitleRenamerConnectionAction setKfService:](self, "setKfService:", 0);
}

- (void)_addViewToHierarchyForConnection:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "renamerContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v6, "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __90___UIONavigationBarTitleRenamerConnectionAction__addViewToHierarchyForConnection_session___block_invoke;
    v11[3] = &unk_1E16E9878;
    v11[4] = self;
    v12 = v7;
    v13 = v8;
    objc_msgSend(v10, "awaitDisplayDelegateForAction:sceneType:timeout:completion:", self, 2, v11, 1.0);

  }
}

- (void)_removeViewFromHierarchyForConnection:(id)a3 session:(id)a4
{
  id v4;

  objc_msgSend(a4, "existingRenamerContentView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)performActionFromConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIONavigationBarTitleRenamerConnectionAction canSendResponse](self, "canSendResponse"))
  {
    -[_UIONavigationBarTitleRenamerConnectionAction info](self, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForSetting:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (int)objc_msgSend(v6, "intValue");

    +[_UINavigationBarTitleRenamer renameServer](_UINavigationBarTitleRenamer, "renameServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == 2)
    {
      -[_UIONavigationBarTitleRenamerConnectionAction info](self, "info");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForSetting:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v8, "sessionWithIdentifier:", v10);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject cancelSessionAndNotify:](v16, "cancelSessionAndNotify:", 0);
LABEL_16:
            -[_UIONavigationBarTitleRenamerConnectionAction _removeViewFromHierarchyForConnection:session:](self, "_removeViewFromHierarchyForConnection:session:", v4, v16);
            -[_UIONavigationBarTitleRenamerConnectionAction _teardownKeyboardEventDeferralForConnection:](self, "_teardownKeyboardEventDeferralForConnection:", v4);
            goto LABEL_17;
          }
        }
LABEL_19:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E17342E0, 1, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016A8]), "initWithInfo:error:", 0, v18);
        -[_UIONavigationBarTitleRenamerConnectionAction sendResponse:](self, "sendResponse:", v19);

        goto LABEL_20;
      }
    }
    else
    {
      if (v7 != 1)
      {
        if (v7)
        {
LABEL_30:
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016A8]), "initWithInfo:error:", 0, 0);
          -[_UIONavigationBarTitleRenamerConnectionAction sendResponse:](self, "sendResponse:", v10);
          goto LABEL_31;
        }
        -[_UIONavigationBarTitleRenamerConnectionAction info](self, "info");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForSetting:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v4, "connection");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "remoteProcess");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "auditToken");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "realToken");
          }
          else
          {
            v25 = 0u;
            v26 = 0u;
          }

          objc_msgSend(v10, "fileURL");
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v21 = objc_msgSend(v20, "fileSystemRepresentation");

          *(_OWORD *)buf = v25;
          v28 = v26;
          if (!sandbox_check_by_audit_token())
          {
            -[_UIONavigationBarTitleRenamerConnectionAction _setupKeyboardEventDeferralForConnection:](self, "_setupKeyboardEventDeferralForConnection:", v4, v21);
            objc_msgSend(v10, "setConnection:", v4);
            objc_msgSend(v8, "startSession:", v10);
            -[_UIONavigationBarTitleRenamerConnectionAction _addViewToHierarchyForConnection:session:](self, "_addViewToHierarchyForConnection:session:", v4, v10);
            goto LABEL_29;
          }
          v22 = performActionFromConnection____s_category;
          if (!performActionFromConnection____s_category)
          {
            v22 = __UILogCategoryGetNode("OOPRename", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v22, (unint64_t *)&performActionFromConnection____s_category);
          }
          if ((*(_BYTE *)v22 & 1) == 0)
            goto LABEL_29;
          v23 = *(NSObject **)(v22 + 8);
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            goto LABEL_29;
          v16 = v23;
          objc_msgSend(v10, "sessionIdentifier", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v24;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "[%@] Dropping connection due to failed sandbox validation.", buf, 0xCu);

LABEL_17:
LABEL_29:

          goto LABEL_30;
        }
        goto LABEL_18;
      }
      -[_UIONavigationBarTitleRenamerConnectionAction info](self, "info");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForSetting:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v8, "sessionWithIdentifier:", v10);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "endSession:", v16);
            goto LABEL_16;
          }
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E17342E0, -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016A8]), "initWithInfo:error:", 0, v10);
    -[_UIONavigationBarTitleRenamerConnectionAction sendResponse:](self, "sendResponse:", v16);
LABEL_20:

LABEL_31:
  }

}

- (SBSKeyboardFocusService)kfService
{
  return self->_kfService;
}

- (void)setKfService:(id)a3
{
  objc_storeStrong((id *)&self->_kfService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kfService, 0);
}

@end

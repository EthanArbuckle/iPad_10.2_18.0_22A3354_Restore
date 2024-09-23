@implementation _UIONavigationBarTitleRenamerRemoteSessionAction

+ (id)_actionWithSettings:(id)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D016A0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88___UIONavigationBarTitleRenamerRemoteSessionAction__actionWithSettings_responseHandler___block_invoke;
  v13[3] = &unk_1E16C6A58;
  v14 = v6;
  v8 = v6;
  v9 = a3;
  objc_msgSend(v7, "responderWithHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v9, v10);

  return v11;
}

+ (id)willBeginRenamingActionWithSession:(id)a3 text:(id)a4 selectedRange:(_NSRange)a5 responseHandler:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  length = a5.length;
  location = a5.location;
  v11 = (objc_class *)MEMORY[0x1E0D017D0];
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v11);
  objc_msgSend(v15, "setObject:forSetting:", &unk_1E1A9AA40, 0);
  objc_msgSend(v14, "sessionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forSetting:", v16, 1);
  objc_msgSend(v15, "setObject:forSetting:", v13, 2);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forSetting:", v17, 3);

  objc_msgSend(a1, "_actionWithSettings:responseHandler:", v15, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)shouldEndEditingActionWithSession:(id)a3 text:(id)a4 responseHandler:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v8 = (objc_class *)MEMORY[0x1E0D017D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  objc_msgSend(v12, "setObject:forSetting:", &unk_1E1A9AA58, 0);
  objc_msgSend(v11, "sessionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forSetting:", v13, 1);
  objc_msgSend(v12, "setObject:forSetting:", v10, 2);

  objc_msgSend(a1, "_actionWithSettings:responseHandler:", v12, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)didEndEditingActionWithSession:(id)a3 text:(id)a4 responseHandler:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v8 = (objc_class *)MEMORY[0x1E0D017D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  objc_msgSend(v12, "setObject:forSetting:", &unk_1E1A9AA70, 0);
  objc_msgSend(v11, "sessionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forSetting:", v13, 1);
  objc_msgSend(v12, "setObject:forSetting:", v10, 2);

  objc_msgSend(a1, "_actionWithSettings:responseHandler:", v12, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)didCancelSession:(id)a3 responseHandler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x1E0D017D0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setObject:forSetting:", &unk_1E1A9AA88, 0);
  objc_msgSend(v8, "sessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forSetting:", v10, 1);
  objc_msgSend(a1, "_actionWithSettings:responseHandler:", v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fileRenameDidFailInSession:(id)a3 withError:(id)a4 proposedName:(id)a5 responseHandler:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = (objc_class *)MEMORY[0x1E0D017D0];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v10);
  objc_msgSend(v15, "setObject:forSetting:", &unk_1E1A9AAA0, 0);
  objc_msgSend(v14, "sessionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forSetting:", v16, 1);
  objc_msgSend(v13, "bs_secureEncoded");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forSetting:", v17, 5);
  objc_msgSend(v15, "setObject:forSetting:", v12, 2);

  objc_msgSend(a1, "_actionWithSettings:responseHandler:", v15, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)fileRenameDidEndInSession:(id)a3 withFinalURL:(id)a4 responseHandler:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v8 = (objc_class *)MEMORY[0x1E0D017D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  objc_msgSend(v12, "setObject:forSetting:", &unk_1E1A9AAB8, 0);
  objc_msgSend(v11, "sessionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forSetting:", v13, 1);
  objc_msgSend(v12, "setObject:forSetting:", v10, 4);

  objc_msgSend(a1, "_actionWithSettings:responseHandler:", v12, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int)_action
{
  void *v2;
  void *v3;
  int v4;

  -[_UIONavigationBarTitleRenamerRemoteSessionAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (id)text
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  if (-[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action") == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIONavigationBarTitleRenamerRemoteSessionAction.m"), 154, CFSTR("%@ is not supported for action of kind %d"), v8, -[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action"));

  }
  -[_UIONavigationBarTitleRenamerRemoteSessionAction info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_NSRange)selectedRange
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  _NSRange result;

  if (-[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIONavigationBarTitleRenamerRemoteSessionAction.m"), 160, CFSTR("%@ is not supported for action of kind %d"), v12, -[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action"));

  }
  -[_UIONavigationBarTitleRenamerRemoteSessionAction info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeValue");
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)error
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  if (-[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIONavigationBarTitleRenamerRemoteSessionAction.m"), 166, CFSTR("%@ is not supported for action of kind %d"), v10, -[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action"));

  }
  v4 = (void *)MEMORY[0x1E0CB35C8];
  -[_UIONavigationBarTitleRenamerRemoteSessionAction info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_secureDecodedFromData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)finalURL
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  if (-[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action") != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIONavigationBarTitleRenamerRemoteSessionAction.m"), 172, CFSTR("%@ is not supported for action of kind %d"), v8, -[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action"));

  }
  -[_UIONavigationBarTitleRenamerRemoteSessionAction info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)handleClientActionToOverlayService:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  if (-[_UIONavigationBarTitleRenamerRemoteSessionAction canSendResponse](self, "canSendResponse"))
  {
    -[_UIONavigationBarTitleRenamerRemoteSessionAction info](self, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForSetting:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIONavigationBarTitleRenamerRemoteSessionAction info](self, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForSetting:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIONavigationBarTitleRenamerRemoteSessionAction.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[session isKindOfClass:[_UINavigationBarTitleRenamerRemoteSession class]]"));

    }
    objc_msgSend(v10, "sessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v7);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIONavigationBarTitleRenamerRemoteSessionAction.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[session.sessionIdentifier isEqual:sessionID]"));

    }
    switch(-[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action"))
    {
      case 0:
        v28 = -[_UIONavigationBarTitleRenamerRemoteSessionAction selectedRange](self, "selectedRange");
        v29 = v13;
        -[_UIONavigationBarTitleRenamerRemoteSessionAction text](self, "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_willBeginRenamingWithText:selectedRange:", v14, &v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[_UIONavigationBarTitleRenamerRemoteSessionResponse willBeginRenamingResponseWithText:selectedRange:](_UIONavigationBarTitleRenamerRemoteSessionResponse, "willBeginRenamingResponseWithText:selectedRange:", v15, v28, v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIONavigationBarTitleRenamerRemoteSessionAction sendResponse:](self, "sendResponse:", v16);

        break;
      case 1:
        -[_UIONavigationBarTitleRenamerRemoteSessionAction text](self, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v10, "_textFieldShouldEndEditingWithText:", v17);

        +[_UIONavigationBarTitleRenamerRemoteSessionResponse shouldEndEditingResponse:](_UIONavigationBarTitleRenamerRemoteSessionResponse, "shouldEndEditingResponse:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 2:
        -[_UIONavigationBarTitleRenamerRemoteSessionAction text](self, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_textFieldDidEndEditingWithText:", v20);

        v21 = 2;
        goto LABEL_13;
      case 3:
        objc_msgSend(v10, "cancelSessionAndNotify:", 0);
        v21 = 3;
        goto LABEL_13;
      case 4:
        -[_UIONavigationBarTitleRenamerRemoteSessionAction error](self, "error");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIONavigationBarTitleRenamerRemoteSessionAction text](self, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fileRenameDidFail:proposedName:", v22, v23);

        v21 = 4;
        goto LABEL_13;
      case 5:
        -[_UIONavigationBarTitleRenamerRemoteSessionAction finalURL](self, "finalURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fileRenameDidEnd:", v24);

        v21 = 5;
LABEL_13:
        +[_UIONavigationBarTitleRenamerRemoteSessionResponse successResponseForAction:](_UIONavigationBarTitleRenamerRemoteSessionResponse, "successResponseForAction:", v21);
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v25 = (void *)v19;
        -[_UIONavigationBarTitleRenamerRemoteSessionAction sendResponse:](self, "sendResponse:", v19);

        break;
      default:
        break;
    }

  }
}

@end

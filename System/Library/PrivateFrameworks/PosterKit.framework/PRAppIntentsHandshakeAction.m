@implementation PRAppIntentsHandshakeAction

- (PRAppIntentsHandshakeAction)initWithHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  PRAppIntentsHandshakeAction *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v6 = (void *)MEMORY[0x1E0D016A0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__PRAppIntentsHandshakeAction_initWithHandler___block_invoke;
  v12[3] = &unk_1E2186460;
  v13 = v4;
  v7 = v4;
  objc_msgSend(v6, "responderWithHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PRAppIntentsHandshakeAction;
  v9 = -[PRAppIntentsHandshakeAction initWithInfo:responder:](&v11, sel_initWithInfo_responder_, v5, v8);

  return v9;
}

void __47__PRAppIntentsHandshakeAction_initWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v11, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "objectForSetting:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *))(v8 + 16))(v8, v9, v10, v7);

}

- (void)respondWithListenerEndpoint:(id)a3 error:(id)a4
{
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v11 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (!(v11 | v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRAppIntentsHandshakeAction.m"), 31, CFSTR("One of either an endpoint or an error is required"));

  }
  if (-[PRAppIntentsHandshakeAction isValid](self, "isValid")
    && -[PRAppIntentsHandshakeAction canSendResponse](self, "canSendResponse"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
    objc_msgSend(v8, "setObject:forSetting:", v11, 2);
    objc_msgSend(v8, "setObject:forSetting:", v7, 1);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016A8]), "initWithInfo:error:", v8, 0);
    -[PRAppIntentsHandshakeAction sendResponse:](self, "sendResponse:", v9);

  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("endpoint");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("error");
  else
    return (id)v3;
}

@end

@implementation _UIOMenuLeafPerformAction

- (_UIOMenuLeafPerformAction)initWithMenuElement:(id)a3 pasteAuthenticationMesage:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _UIOMenuLeafPerformAction *v15;
  objc_super v17;
  _QWORD v18[4];
  id v19;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "_internalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setObject:forSetting:", v10, 0);
  if (v8)
    objc_msgSend(v11, "setObject:forSetting:", v8, 1);
  v12 = (void *)MEMORY[0x1E0D016A0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91___UIOMenuLeafPerformAction_initWithMenuElement_pasteAuthenticationMesage_responseHandler___block_invoke;
  v18[3] = &unk_1E16C6A58;
  v19 = v9;
  v13 = v9;
  objc_msgSend(v12, "responderWithHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)_UIOMenuLeafPerformAction;
  v15 = -[_UIOMenuLeafPerformAction initWithInfo:responder:](&v17, sel_initWithInfo_responder_, v11, v14);

  return v15;
}

- (BKSHIDEventAuthenticationMessage)pasteAuthenticationMessage
{
  void *v2;
  void *v3;

  -[_UIOMenuLeafPerformAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BKSHIDEventAuthenticationMessage *)v3;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[_UIOMenuLeafPerformAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)handleClientActionToOverlayService:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64___UIOMenuLeafPerformAction_handleClientActionToOverlayService___block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  objc_msgSend(v4, "performMenuLeafAction:completionHandler:", self, v5);

}

@end

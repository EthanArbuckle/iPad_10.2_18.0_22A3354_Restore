@implementation ISO18013Handler

- (id)activateWithHandoffToken:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler activateWithHandoffToken:]", 194, self, &stru_24D3A78C0, v5, v6, v8);
  -[STSHandler setHandoffToken:](self, "setHandoffToken:", v4);

  return 0;
}

- (BOOL)activateChildSessionOnSetActiveCredential
{
  return 0;
}

- (id)stopTransaction
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  void *v6;
  objc_super v8;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler stopTransaction]", 231, self, &stru_24D3A78C0, v2, v3, (uint64_t)v8.receiver);
  v8.receiver = self;
  v8.super_class = (Class)ISO18013Handler;
  v5 = -[STSTransactionHandler stopTransaction](&v8, sel_stopTransaction);
  if (self && self->_transactionState - 1 <= 1)
  {
    -[STSTransactionHandler parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fireSessionDidEndUnexpectedlyEventWithStatus:", 3);

  }
  sub_2158BA0AC((os_unfair_lock_s *)self, 0);
  return 0;
}

- (void)tearDownWithCompletion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013Handler tearDownWithCompletion:]", 246, self, &stru_24D3A78C0, v4, v5, v6);
  sub_2158BA0AC((os_unfair_lock_s *)self, v7);

}

- (unsigned)supportedCredentialType
{
  return 2;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  char *v31;
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler startTransactionWithAuthorization:options:]", 287, self, CFSTR("options = 0x%04x"), v4, v5, a4);
  if ((a4 & 4) != 0)
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013Handler startTransactionWithAuthorization:options:]", 289, self, CFSTR("QRCodeHandoff"), v9, v10, a4);
    return 0;
  }
  else
  {
    -[STSHandler handoffToken](self, "handoffToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (self)
        self->_startTransactionOption = a4;
      -[STSHandler handoffToken](self, "handoffToken");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (self)
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = sub_2158B9700;
        v29[3] = &unk_24D3A72E0;
        v29[4] = self;
        v31 = sel__start18013TransactionWithToken_;
        v30 = v12;
        os_unfair_lock_lock(&self->_handoverSessionMutex);
        sub_2158B9700((uint64_t)v29, v14, v15, v16, v17, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(&self->_handoverSessionMutex);

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v25;
      v33[1] = &unk_24D3B2ED0;
      v32[1] = CFSTR("Line");
      v32[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v26;
      v32[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 294);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 9, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    return v21;
  }
}

- (void)transactionStarted:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t transactionState;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionStarted:]", 303, self, CFSTR("status=%lu"), v3, v4, a3);
  if (self)
  {
    transactionState = self->_transactionState;
    if (transactionState && transactionState != 3)
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionStarted:]", 307, self, CFSTR("Unexpected transaction state=%d"), v7, v8, self->_transactionState);
  }
  -[STSTransactionHandler parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 9)
  {
    v17 = v11;
    objc_msgSend(v11, "fireRequestHandoverConfirmation");
LABEL_16:
    v11 = v17;
    goto LABEL_17;
  }
  if (!a3)
  {
    v17 = v11;
    if (self && self->_transactionState)
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionStarted:]", 318, self, CFSTR("Unexpected state, dropping start event"), v12, v13, v16);
    }
    else
    {
      v14 = (void *)objc_opt_new();
      -[STSHandler activeSTSCredential](self, "activeSTSCredential");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCredential:", v15);

      objc_msgSend(v14, "setTransactionMode:", 4);
      objc_msgSend(v17, "fireTransactionStartEvent:", v14);
      if (self)
        self->_transactionState = 1;

    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  STSCredential *v9;
  STSCredential *v10;
  STSCredential *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  STSTransactionEndEvent *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  if (!self)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionEndedWithIdentifier:error:]", 341, 0, CFSTR("keyIdentifier: %@, error: %@"), v6, v7, (uint64_t)v22);
    goto LABEL_8;
  }
  if (self->_transactionState - 3 <= 1)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionEndedWithIdentifier:error:]", 337, self, CFSTR("Dropping transaction end event, keyIdentifier: %@, error: %@"), v6, v7, (uint64_t)v22);
    goto LABEL_22;
  }
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionEndedWithIdentifier:error:]", 341, self, CFSTR("keyIdentifier: %@, error: %@"), v6, v7, (uint64_t)v22);
  v9 = self->_releasedCredential;
  if (!v9)
  {
LABEL_8:
    -[STSHandler activeSTSCredential](self, "activeSTSCredential");
    v11 = (STSCredential *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_6;
LABEL_9:
    +[STSCredential credentialWithType:identifier:subIdentifier:](STSCredential, "credentialWithType:identifier:subIdentifier:", 2, 0x24D3A8800, v22);
    v11 = (STSCredential *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler transactionEndedWithIdentifier:error:]", 351, self, CFSTR("A credential is not available.  Creating a credential for event - credential=%@"), v13, v14, (uint64_t)v11);
    v12 = 5;
    goto LABEL_10;
  }
  v10 = v9;
  v11 = self->_releasedCredential;

  if (!v11)
    goto LABEL_9;
LABEL_6:
  v12 = 0;
LABEL_10:
  v15 = objc_alloc_init(STSTransactionEndEvent);
  -[STSTransactionEndEvent setCredential:](v15, "setCredential:", v11);
  -[STSTransactionEndEvent setStatus:](v15, "setStatus:", v12);
  if (v8)
  {
    objc_msgSend(v8, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", CFSTR("STSXPCHelperErrorDomain"));

    if (v17)
    {
      v18 = objc_msgSend(v8, "code");
      v19 = 3;
      if (v18 == 14)
        v19 = 4;
      if (v18 == 15)
        v20 = 6;
      else
        v20 = v19;
    }
    else
    {
      v20 = 2;
    }
    -[STSTransactionEndEvent setStatus:](v15, "setStatus:", v20);
  }
  -[STSTransactionHandler parent](self, "parent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fireTransactionEndEvent:", v15);

  if (self)
    self->_transactionState = 3;

LABEL_22:
}

- (void)notificationClientConnected
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler notificationClientConnected]", 380, self, &stru_24D3A78C0, v2, v3, v7);
  if (self && (self->_startTransactionOption & 2) != 0)
    v5 = -[STSXPCClientNotificationListener setRequestHandoverConfirmation:](self->_stsNotificationListener, "setRequestHandoverConfirmation:", 1);
  sub_2158BADC0((id *)&self->super.super.super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[STSTransactionHandler parent](self, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stsSessionNotificationListenerStarted:", v6);

}

- (void)alternativeCarrierReceived:(id)a3 dataPending:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierReceived:dataPending:]", 389, self, CFSTR("dataPending=%d"), v7, v8, v4);
  -[STSTransactionHandler parent](self, "parent");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  sub_2158BADC0((id *)&self->super.super.super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stsSession:receivedFromAlternativeCarrier:dataPending:", v10, v6, v4);

}

- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierConnectedWithStatus:]", 398, self, CFSTR("status=%lu"), v3, v4, a3);
  if (a3)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = &unk_24D3B2EE8;
    v18[1] = CFSTR("Line");
    v18[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v11;
    v18[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 402);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  -[STSTransactionHandler parent](self, "parent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2158BADC0((id *)&self->super.super.super.isa);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stsSession:connectedAlternativeCarrierWithStatus:", v15, v14);

  if (a3)
  {
    if (a3 == 3)
      v17 = 1;
    else
      v17 = 2;
    objc_msgSend(v15, "fireSessionDidEndUnexpectedlyEventWithStatus:", v17);
    sub_2158BA0AC((os_unfair_lock_s *)self, 0);
  }

}

- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  STSTransactionEndEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierDisconnectedWithStatus:]", 420, self, CFSTR("status=%d, transactionState=%lu"), v3, v4, a3);
  -[STSTransactionHandler parent](self, "parent");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  sub_2158BADC0((id *)&self->super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stsSessionAlternativeCarrierDisconnected:", v20);

  if (self && self->_transactionState - 1 <= 1)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierDisconnectedWithStatus:]", 426, self, CFSTR("Transaction end unexpectedly"), v8, v9, v18);
    switch(a3)
    {
      case 0uLL:
        v10 = 0;
        v11 = 7;
        break;
      case 1uLL:
      case 2uLL:
      case 4uLL:
      case 5uLL:
      case 9uLL:
        v10 = 0;
        v11 = 2;
        break;
      case 3uLL:
        v10 = 0;
        v11 = 1;
        break;
      case 6uLL:
      case 7uLL:
        v10 = 0;
        v11 = 12;
        break;
      case 8uLL:
        v10 = 0;
        v11 = 6;
        break;
      default:
        v11 = 0;
        v10 = 1;
        break;
    }
    v12 = objc_alloc_init(STSTransactionEndEvent);
    -[STSTransactionEndEvent setStatus:](v12, "setStatus:", v11);
    if (self->_releasedCredential)
    {
      -[STSTransactionEndEvent setCredential:](v12, "setCredential:");
    }
    else
    {
      -[STSHandler activeSTSCredential](self, "activeSTSCredential");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[STSHandler activeSTSCredential](self, "activeSTSCredential");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[STSTransactionEndEvent setCredential:](v12, "setCredential:", v14);

      }
      else
      {
        +[STSCredential credentialWithType:identifier:subIdentifier:](STSCredential, "credentialWithType:identifier:subIdentifier:", 2, 0x24D3A8800, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[STSTransactionEndEvent setCredential:](v12, "setCredential:", v15);

        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierDisconnectedWithStatus:]", 462, self, CFSTR("Neither an active nor a released credential are set."), v16, v17, v19);
        if (v10)
          -[STSTransactionEndEvent setStatus:](v12, "setStatus:", 5);
      }
    }
    objc_msgSend(v20, "fireTransactionEndEvent:", v12);

  }
  sub_2158BA0AC((os_unfair_lock_s *)self, 0);

}

- (void)processISO18013CredentialProposals:(id)a3 readerAuthInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;

  v6 = a4;
  v7 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler processISO18013CredentialProposals:readerAuthInfo:]", 477, self, &stru_24D3A78C0, v8, v9, v12);
  sub_2158CE0B8();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessCredentialProposals", (const char *)&unk_2158E2973, (uint8_t *)&v12, 2u);
  }

  if (self)
    self->_transactionState = 2;
  -[STSTransactionHandler parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fireDidReceive18013Requests:readerAuthInfo:", v7, v6);

}

- (void)xpcInvalidated
{
  void *v3;

  if (!self || self->_transactionState != 4)
  {
    -[STSTransactionHandler parent](self, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fireSessionDidEndUnexpectedlyEventWithStatus:", 2);

    sub_2158BA0AC((os_unfair_lock_s *)self, 0);
  }
}

- (void)xpcInterrupted
{
  void *v3;

  if (!self || self->_transactionState != 4)
  {
    -[STSTransactionHandler parent](self, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fireSessionDidEndUnexpectedlyEventWithStatus:", 2);

    sub_2158BA0AC((os_unfair_lock_s *)self, 0);
  }
}

- (void)session:(id)a3 fieldChange:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const char *v7;
  STSXPCClientNotificationListener *stsNotificationListener;
  int v9;
  const char *v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x24BDAC8D0];
  sub_2158CE0B8();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    v7 = "no";
    if (v4)
      v7 = "yes";
    v9 = 136315138;
    v10 = v7;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_FieldChange", "fieldPresent=%s", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
  {
    if (self)
      stsNotificationListener = self->_stsNotificationListener;
    else
      stsNotificationListener = 0;
    -[STSXPCClientNotificationListener sendConnectionHandoverStarted](stsNotificationListener, "sendConnectionHandoverStarted");
  }
}

- (void)session:(id)a3 fieldNotification:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler session:fieldNotification:]", 533, self, CFSTR("field=%@"), v6, v7, (uint64_t)v5);
  sub_2158CE0B8();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_FieldDetect", "field=%@", buf, 0xCu);
  }

  sub_2158CEFF0(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSTransactionHandler parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireFieldNotificationEvent:", v9);

}

- (void)session:(id)a3 tnepService:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sub_2158CE0B8();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_TnepService_Selected", "service=%@", buf, 0xCu);
  }

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler session:tnepService:]", 543, self, CFSTR("service=%@"), v7, v8, (uint64_t)v5);
}

- (void)session:(id)a3 connectionHandoverProcessFailure:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sub_2158CE0B8();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_HandoverFailure", "error=%@", buf, 0xCu);
  }

  if (objc_msgSend(v5, "code") != 2 && objc_msgSend(v5, "code") != 8)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler session:connectionHandoverProcessFailure:]", 556, self, CFSTR("error=%@"), v7, v8, (uint64_t)v5);
    if (objc_msgSend(v5, "code") == 6)
    {
      v9 = 4;
LABEL_20:
      sub_2158BB49C((os_unfair_lock_s *)self);
      -[STSTransactionHandler parent](self, "parent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fireSessionDidEndUnexpectedlyEventWithStatus:", v9);

      goto LABEL_21;
    }
    if (objc_msgSend(v5, "code") != 12)
    {
      v9 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v5, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("WifiDomain")))
    {
      v13 = objc_msgSend(v11, "code");

      if (v13 == 3)
      {
        v9 = 5;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(v11, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("BluetoothDomain")))
    {
      v15 = objc_msgSend(v11, "code");

      if (v15)
        v9 = 0;
      else
        v9 = 6;
    }
    else
    {

      v9 = 0;
    }
    goto LABEL_19;
  }
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler session:connectionHandoverProcessFailure:]", 553, self, CFSTR("Allows reader to retry"), v7, v8, v17);
LABEL_21:

}

- (void)connectionHandoverCompleted:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t buf[16];

  sub_2158CE0B8();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_HandoverCompleted", (const char *)&unk_2158E2973, buf, 2u);
  }

  if (self)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler connectionHandoverCompleted:]", 578, self, CFSTR("transactionState=%lu"), v5, v6, self->_transactionState);
    -[STSXPCClientNotificationListener sendConnectionHandoverCompleted](self->_stsNotificationListener, "sendConnectionHandoverCompleted");
    if (self->_transactionState)
      sub_2158BB49C((os_unfair_lock_s *)self);
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler connectionHandoverCompleted:]", 578, 0, CFSTR("transactionState=%lu"), v5, v6, 0);
    objc_msgSend(0, "sendConnectionHandoverCompleted");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releasedCredential, 0);
  objc_storeStrong((id *)&self->_handoverSession, 0);
  objc_destroyWeak((id *)&self->_notificationTesterDelegate);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_stsNotificationListener, 0);
}

@end

@implementation SBKPushValueTransaction

- (SBKPushValueTransaction)initWithStoreBagContext:(id)a3 clientItemPayloadPair:(id)a4 clientItemVersionAnchor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SBKPushValueTransaction *v14;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushKeyValueRequestURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)SBKPushValueTransaction;
  v14 = -[SBKTransaction initWithDomain:requestURL:](&v16, sel_initWithDomain_requestURL_, v12, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_clientItemPayloadPair, a4);
    objc_storeStrong((id *)&v14->_clientItemVersionAnchor, a5);
    objc_storeStrong((id *)&v14->_requestItemPayloadPair, a4);
    objc_storeStrong((id *)&v14->_requestItemVersionAnchor, a5);
    v14->_isRechedulable = 1;
  }

  return v14;
}

- (id)description
{
  const __CFString *clientItemVersionAnchor;
  void *v4;
  const __CFString *resultItemVersionAnchor;
  void *v6;
  const __CFString *requestItemVersionAnchor;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  clientItemVersionAnchor = (const __CFString *)self->_clientItemVersionAnchor;
  if (!clientItemVersionAnchor)
    clientItemVersionAnchor = CFSTR("*unversioned*");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[client: payload-pair=%@, anchor=%@]"), self->_clientItemPayloadPair, clientItemVersionAnchor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  resultItemVersionAnchor = (const __CFString *)self->_resultItemVersionAnchor;
  if (!resultItemVersionAnchor)
    resultItemVersionAnchor = CFSTR("*unversioned*");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[result: payload-pair=%@, anchor=%@]"), self->_resultItemPayloadPair, resultItemVersionAnchor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  requestItemVersionAnchor = (const __CFString *)self->_requestItemVersionAnchor;
  if (!requestItemVersionAnchor)
    requestItemVersionAnchor = CFSTR("*unversioned*");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[request: payload-pair=%@, anchor=%@]"), self->_requestItemPayloadPair, requestItemVersionAnchor);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  v14.receiver = self;
  v14.super_class = (Class)SBKPushValueTransaction;
  -[SBKPushValueTransaction description](&v14, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKTransaction domain](self, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ domain = %@, PUT: %@, %@, %@"), v10, v11, v4, v8, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)clampsKey
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKKeyValuePayloadPair kvsKey](self->_clientItemPayloadPair, "kvsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)newRequest
{
  +[SBKPushValueRequest requestForTransaction:](SBKPushValueRequest, "requestForTransaction:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  _BOOL4 isRechedulable;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SBKKeyValuePayloadPair *v15;
  SBKKeyValuePayloadPair *requestItemPayloadPair;
  NSString *v17;
  NSString *requestItemVersionAnchor;
  NSString *v19;
  NSString *resultDomainVersion;
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  isRechedulable = self->_isRechedulable;
  self->_isRechedulable = 0;
  v21 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v21, "conflictItemValuePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    self->_success = objc_msgSend(v21, "isSuccess");
    objc_storeStrong((id *)&self->_resultItemPayloadPair, self->_requestItemPayloadPair);
    objc_storeStrong((id *)&self->_resultItemVersionAnchor, self->_requestItemVersionAnchor);
    objc_msgSend(v21, "domainVersion");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    resultDomainVersion = self->_resultDomainVersion;
    self->_resultDomainVersion = v19;

LABEL_5:
    v7[2](v7, 0);
    goto LABEL_6;
  }
  v10 = isRechedulable;
  v11 = (void *)objc_opt_class();
  objc_msgSend(v21, "conflictItemKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "conflictItemValuePayload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SBKKeyValuePayloadPairWithPreferredClass(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBKPushValueTransaction _resolveConflictBetweenClientPayloadPair:andServerPayloadPair:](self, "_resolveConflictBetweenClientPayloadPair:andServerPayloadPair:", self->_clientItemPayloadPair, v14);
  v15 = (SBKKeyValuePayloadPair *)objc_claimAutoreleasedReturnValue();
  requestItemPayloadPair = self->_requestItemPayloadPair;
  self->_requestItemPayloadPair = v15;

  objc_msgSend(v21, "conflictItemVersionAnchor");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestItemVersionAnchor = self->_requestItemVersionAnchor;
  self->_requestItemVersionAnchor = v17;

  v7[2](v7, v10);
LABEL_6:

}

- (id)_resolveConflictBetweenClientPayloadPair:(id)a3 andServerPayloadPair:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "timestamp");
  v8 = v7;
  objc_msgSend(v5, "timestamp");
  if (v8 >= v9)
    v10 = v6;
  else
    v10 = v5;
  v11 = v10;

  return v11;
}

- (SBKKeyValuePayloadPair)clientItemPayloadPair
{
  return self->_clientItemPayloadPair;
}

- (NSString)clientItemVersionAnchor
{
  return self->_clientItemVersionAnchor;
}

- (SBKKeyValuePayloadPair)requestItemPayloadPair
{
  return self->_requestItemPayloadPair;
}

- (NSString)requestItemVersionAnchor
{
  return self->_requestItemVersionAnchor;
}

- (BOOL)success
{
  return self->_success;
}

- (SBKKeyValuePayloadPair)resultItemPayloadPair
{
  return self->_resultItemPayloadPair;
}

- (NSString)resultItemVersionAnchor
{
  return self->_resultItemVersionAnchor;
}

- (NSString)resultDomainVersion
{
  return self->_resultDomainVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDomainVersion, 0);
  objc_storeStrong((id *)&self->_resultItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_resultItemPayloadPair, 0);
  objc_storeStrong((id *)&self->_requestItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_requestItemPayloadPair, 0);
  objc_storeStrong((id *)&self->_clientItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_clientItemPayloadPair, 0);
}

@end

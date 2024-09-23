@implementation SBKPullValueTransaction

- (SBKPullValueTransaction)initWithStoreBagContext:(id)a3 requestedKey:(id)a4 clientItemPayloadPair:(id)a5 clientItemVersionAnchor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  SBKPullValueTransaction *v17;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a3;
  objc_msgSend(v14, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pullKeyValueRequestURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19.receiver = self;
  v19.super_class = (Class)SBKPullValueTransaction;
  v17 = -[SBKTransaction initWithDomain:requestURL:](&v19, sel_initWithDomain_requestURL_, v15, v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_requestedKey, a4);
    objc_storeStrong((id *)&v17->_clientItemPayloadPair, a5);
    objc_storeStrong((id *)&v17->_clientItemVersionAnchor, a6);
  }

  return v17;
}

- (id)description
{
  const __CFString *clientItemVersionAnchor;
  void *v4;
  const __CFString *resultItemVersionAnchor;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

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
  v7 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)SBKPullValueTransaction;
  -[SBKPullValueTransaction description](&v12, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKTransaction domain](self, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ domain = %@, GET: key='%@', %@, %@"), v8, v9, self->_requestedKey, v4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)clampsKey
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, self->_requestedKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)newRequest
{
  +[SBKPullValueRequest requestForTransaction:](SBKPullValueRequest, "requestForTransaction:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBKKeyValuePayloadPair *v11;
  SBKKeyValuePayloadPair *resultItemPayloadPair;
  NSString *v13;
  NSString *resultItemVersionAnchor;
  NSString *v15;
  NSString *resultDomainVersion;
  id v17;

  v17 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v17, "itemValuePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_opt_class();
      objc_msgSend(v17, "itemKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "itemValuePayload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SBKKeyValuePayloadPairWithPreferredClass(v8, v9, v10);
      v11 = (SBKKeyValuePayloadPair *)objc_claimAutoreleasedReturnValue();
      resultItemPayloadPair = self->_resultItemPayloadPair;
      self->_resultItemPayloadPair = v11;

      objc_msgSend(v17, "itemVersion");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_storeStrong((id *)&self->_resultItemPayloadPair, self->_clientItemPayloadPair);
      v13 = self->_clientItemVersionAnchor;
    }
    resultItemVersionAnchor = self->_resultItemVersionAnchor;
    self->_resultItemVersionAnchor = v13;

    self->_success = objc_msgSend(v17, "isSuccess");
    objc_msgSend(v17, "domainVersion");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    resultDomainVersion = self->_resultDomainVersion;
    self->_resultDomainVersion = v15;

  }
  v6[2](v6, 0);

}

- (NSString)requestedKey
{
  return self->_requestedKey;
}

- (SBKKeyValuePayloadPair)clientItemPayloadPair
{
  return self->_clientItemPayloadPair;
}

- (NSString)clientItemVersionAnchor
{
  return self->_clientItemVersionAnchor;
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
  objc_storeStrong((id *)&self->_clientItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_clientItemPayloadPair, 0);
  objc_storeStrong((id *)&self->_requestedKey, 0);
}

@end

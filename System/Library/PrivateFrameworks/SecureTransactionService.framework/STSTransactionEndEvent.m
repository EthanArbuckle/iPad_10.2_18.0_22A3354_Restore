@implementation STSTransactionEndEvent

- (STSTransactionEndEvent)initWithCredential:(id)a3 andNearFieldEndEvent:(id)a4
{
  id v6;
  id v7;
  STSTransactionEndEvent *v8;
  STSTransactionEndEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned __int16 v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)STSTransactionEndEvent;
  v8 = -[STSTransactionEndEvent init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    -[STSTransactionEndEvent setCredential:](v8, "setCredential:", v6);
    -[STSTransactionEndEvent setBackground:](v9, "setBackground:", objc_msgSend(v7, "background"));
    objc_msgSend(v7, "parsedInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSTransactionEndEvent setParsedInfo:](v9, "setParsedInfo:", v10);

    objc_msgSend(v7, "readerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSTransactionEndEvent setReaderIdentifier:](v9, "setReaderIdentifier:", v11);

    objc_msgSend(v7, "keyIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSTransactionEndEvent setKeyIdentifier:](v9, "setKeyIdentifier:", v12);

    objc_msgSend(v7, "transactionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSTransactionEndEvent setTransactionIdentifier:](v9, "setTransactionIdentifier:", v13);

    if (objc_msgSend(v7, "didError"))
      v14 = 2;
    else
      v14 = 0;
    -[STSTransactionEndEvent setStatus:](v9, "setStatus:", v14);
    v15 = objc_msgSend(v7, "result") + 4092;
    if (v15 <= 2u)
      -[STSTransactionEndEvent setStatus:](v9, "setStatus:", v15 + 8);
  }

  return v9;
}

- (STSTransactionEndEvent)initWithCredential:(id)a3 andDigitalCarKeyEndEvent:(id)a4
{
  id v6;
  id v7;
  STSTransactionEndEvent *v8;
  STSTransactionEndEvent *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STSTransactionEndEvent;
  v8 = -[STSTransactionEndEvent init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[STSTransactionEndEvent setBackground:](v8, "setBackground:", 0);
    -[STSTransactionEndEvent setReaderIdentifier:](v9, "setReaderIdentifier:", 0);
    -[STSTransactionEndEvent setTransactionIdentifier:](v9, "setTransactionIdentifier:", 0);
    -[STSTransactionEndEvent setParsedInfo:](v9, "setParsedInfo:", 0);
    -[STSTransactionEndEvent setCredential:](v9, "setCredential:", v6);
    objc_msgSend(v7, "keyIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSTransactionEndEvent setKeyIdentifier:](v9, "setKeyIdentifier:", v10);

    if (objc_msgSend(v7, "didError"))
      v11 = 2;
    else
      v11 = 0;
    -[STSTransactionEndEvent setStatus:](v9, "setStatus:", v11);
    v12 = objc_msgSend(v7, "result") - 61444;
    if (v12 <= 2)
      -[STSTransactionEndEvent setStatus:](v9, "setStatus:", v12 + 8);
  }

  return v9;
}

- (STSCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (NSDictionary)parsedInfo
{
  return self->_parsedInfo;
}

- (void)setParsedInfo:(id)a3
{
  objc_storeStrong((id *)&self->_parsedInfo, a3);
}

- (BOOL)background
{
  return self->_background;
}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (NSString)readerIdentifier
{
  return self->_readerIdentifier;
}

- (void)setReaderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_readerIdentifier, a3);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transactionIdentifier, a3);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_parsedInfo, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end

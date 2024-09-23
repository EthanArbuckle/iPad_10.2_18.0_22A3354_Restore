@implementation SSPurchaseResponse

- (id)downloadMetadataForItemIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__61;
  v14 = __Block_byref_object_dispose__61;
  v15 = 0;
  -[SSURLConnectionResponse bodyData](self->_response, "bodyData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("items"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("songList"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __56__SSPurchaseResponse_downloadMetadataForItemIdentifier___block_invoke;
        v9[3] = &unk_1E47BEEC8;
        v9[4] = &v10;
        v9[5] = a3;
        objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
      }

    }
  }
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __56__SSPurchaseResponse_downloadMetadataForItemIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  SSDownloadMetadata *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SSDownloadMetadata initWithDictionary:]([SSDownloadMetadata alloc], "initWithDictionary:", v7);
    if (-[SSDownloadMetadata itemIdentifier](v6, "itemIdentifier") == *(_QWORD *)(a1 + 40))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
      *a4 = 1;
    }

  }
}

- (id)downloadsMetadata
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[SSURLConnectionResponse bodyData](self->_response, "bodyData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__61;
  v12 = __Block_byref_object_dispose__61;
  v13 = (id)objc_opt_new();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("items"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(v3, "objectForKey:", CFSTR("songList"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __39__SSPurchaseResponse_downloadsMetadata__block_invoke;
        v7[3] = &unk_1E47BEEF0;
        v7[4] = &v8;
        objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
      }

    }
  }
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__SSPurchaseResponse_downloadsMetadata__block_invoke(uint64_t a1, void *a2)
{
  SSDownloadMetadata *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[SSDownloadMetadata initWithDictionary:]([SSDownloadMetadata alloc], "initWithDictionary:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

  }
}

- (id)transactionIdentifierForItemIdentifier:(int64_t)a3
{
  NSMutableDictionary *transactionIdentifiers;
  unint64_t v5;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _UNKNOWN **v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  _UNKNOWN **v28;
  NSMutableDictionary *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  transactionIdentifiers = self->_transactionIdentifiers;
  v5 = 0x1E0CB3000;
  if (!transactionIdentifiers)
  {
    -[SSURLConnectionResponse bodyData](self->_response, "bodyData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0x1E0C99000uLL;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("items"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("songList"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v36 = v8;
          v37 = v7;
          v38 = a3;
          v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v12 = self->_transactionIdentifiers;
          self->_transactionIdentifiers = v11;

          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v35 = v10;
          v13 = v10;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v41;
            v17 = &off_1E47B6000;
            do
            {
              v18 = 0;
              v39 = v15;
              do
              {
                if (*(_QWORD *)v41 != v16)
                  objc_enumerationMutation(v13);
                v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v18);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v20 = (void *)objc_msgSend(objc_alloc((Class)v17[352]), "initWithDictionary:", v19);
                  v21 = objc_msgSend(v20, "itemIdentifier");
                  objc_msgSend(v20, "transactionIdentifier");
                  v22 = objc_claimAutoreleasedReturnValue();
                  v23 = (void *)v22;
                  if (v21)
                    v24 = v22 == 0;
                  else
                    v24 = 1;
                  if (!v24)
                  {
                    v25 = v16;
                    v26 = v13;
                    v27 = v9;
                    v28 = v17;
                    v29 = self->_transactionIdentifiers;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v21);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = v29;
                    v17 = v28;
                    v9 = v27;
                    v13 = v26;
                    v16 = v25;
                    v15 = v39;
                    -[NSMutableDictionary setObject:forKey:](v31, "setObject:forKey:", v23, v30);

                  }
                }
                ++v18;
              }
              while (v15 != v18);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            }
            while (v15);
          }

          v7 = v37;
          a3 = v38;
          v5 = 0x1E0CB3000uLL;
          v10 = v35;
          v8 = v36;
        }

      }
    }

    transactionIdentifiers = self->_transactionIdentifiers;
  }
  objc_msgSend(*(id *)(v5 + 2024), "numberWithLongLong:", a3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](transactionIdentifiers, "objectForKey:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)responseMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SSPurchaseResponse URLResponse](self, "URLResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bodyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForData:response:error:", v3, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v6 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("metrics"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v6 = 0;
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SSPurchaseResponse)initWithCoder:(id)a3
{
  id v4;
  SSPurchaseResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *downloadIdentifiers;
  uint64_t v11;
  NSError *error;
  uint64_t v13;
  SSPurchase *purchase;
  double v15;
  SSURLConnectionResponse *v16;
  void *v17;
  uint64_t v18;
  SSURLConnectionResponse *response;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *tidHeaders;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SSPurchaseResponse;
  v5 = -[SSPurchaseResponse init](&v28, sel_init);
  if (v5)
  {
    v5->_cancelsPurchaseBatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("0"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("4"));
    v9 = objc_claimAutoreleasedReturnValue();
    downloadIdentifiers = v5->_downloadIdentifiers;
    v5->_downloadIdentifiers = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("1"));
    v11 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("2"));
    v13 = objc_claimAutoreleasedReturnValue();
    purchase = v5->_purchase;
    v5->_purchase = (SSPurchase *)v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("5"));
    v5->_requestStartTime = v15;
    v16 = [SSURLConnectionResponse alloc];
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("3"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SSURLConnectionResponse initWithDatabaseEncoding:](v16, "initWithDatabaseEncoding:", v17);
    response = v5->_response;
    v5->_response = (SSURLConnectionResponse *)v18;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("6"));
    v5->_responseEndTime = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("7"));
    v5->_responseStartTime = v21;
    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("8"));
    v25 = objc_claimAutoreleasedReturnValue();
    tidHeaders = v5->_tidHeaders;
    v5->_tidHeaders = (NSDictionary *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 cancelsPurchaseBatch;
  void *v5;
  id v6;

  cancelsPurchaseBatch = self->_cancelsPurchaseBatch;
  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", cancelsPurchaseBatch, CFSTR("0"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_downloadIdentifiers, CFSTR("4"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_error, CFSTR("1"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_purchase, CFSTR("2"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("5"), self->_requestStartTime);
  -[SSURLConnectionResponse databaseEncoding](self->_response, "databaseEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("3"));

  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("6"), self->_responseEndTime);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("7"), self->_responseStartTime);
  objc_msgSend(v6, "encodeObject:forKey:", self->_tidHeaders, CFSTR("8"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSPurchaseResponse)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSPurchaseResponse *v6;
  CFArrayRef v8;
  NSArray *downloadIdentifiers;
  id v10;
  void *v11;
  uint64_t v12;
  NSError *error;
  SSPurchase *v14;
  void *v15;
  uint64_t v16;
  SSPurchase *purchase;
  SSURLConnectionResponse *v18;
  void *v19;
  uint64_t v20;
  SSURLConnectionResponse *response;
  CFArrayRef v22;
  NSDictionary *tidHeaders;
  objc_super v24;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v24.receiver = self;
    v24.super_class = (Class)SSPurchaseResponse;
    v6 = -[SSPurchaseResponse init](&v24, sel_init);
    if (v6)
    {
      v6->_cancelsPurchaseBatch = xpc_dictionary_get_BOOL(v5, "0");
      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "4");
      downloadIdentifiers = v6->_downloadIdentifiers;
      v6->_downloadIdentifiers = (NSArray *)v8;

      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v5, "1");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithXPCEncoding:", v11);
      error = v6->_error;
      v6->_error = (NSError *)v12;

      v14 = [SSPurchase alloc];
      xpc_dictionary_get_value(v5, "2");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SSPurchase initWithXPCEncoding:](v14, "initWithXPCEncoding:", v15);
      purchase = v6->_purchase;
      v6->_purchase = (SSPurchase *)v16;

      v6->_requestStartTime = xpc_dictionary_get_double(v5, "5");
      v18 = [SSURLConnectionResponse alloc];
      xpc_dictionary_get_value(v5, "3");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SSURLConnectionResponse initWithXPCEncoding:](v18, "initWithXPCEncoding:", v19);
      response = v6->_response;
      v6->_response = (SSURLConnectionResponse *)v20;

      v6->_responseEndTime = xpc_dictionary_get_double(v5, "6");
      v6->_responseStartTime = xpc_dictionary_get_double(v5, "7");
      objc_opt_class();
      v22 = SSXPCDictionaryCopyCFObjectWithClass(v5, "8");
      tidHeaders = v6->_tidHeaders;
      v6->_tidHeaders = (NSDictionary *)v22;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "0", self->_cancelsPurchaseBatch);
  SSXPCDictionarySetCFObject(v3, "4", (__CFString *)self->_downloadIdentifiers);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_error);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_purchase);
  xpc_dictionary_set_double(v3, "5", self->_requestStartTime);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)self->_response);
  xpc_dictionary_set_double(v3, "6", self->_responseEndTime);
  xpc_dictionary_set_double(v3, "7", self->_responseStartTime);
  SSXPCDictionarySetCFObject(v3, "8", (__CFString *)self->_tidHeaders);
  return v3;
}

- (BOOL)cancelsPurchaseBatch
{
  return self->_cancelsPurchaseBatch;
}

- (void)setCancelsPurchaseBatch:(BOOL)a3
{
  self->_cancelsPurchaseBatch = a3;
}

- (NSArray)downloadIdentifiers
{
  return self->_downloadIdentifiers;
}

- (void)setDownloadIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SSPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(double)a3
{
  self->_requestStartTime = a3;
}

- (double)responseEndTime
{
  return self->_responseEndTime;
}

- (void)setResponseEndTime:(double)a3
{
  self->_responseEndTime = a3;
}

- (double)responseStartTime
{
  return self->_responseStartTime;
}

- (void)setResponseStartTime:(double)a3
{
  self->_responseStartTime = a3;
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_tidHeaders, a3);
}

- (SSURLConnectionResponse)URLResponse
{
  return self->_response;
}

- (void)setURLResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifiers, 0);
  objc_storeStrong((id *)&self->_tidHeaders, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadIdentifiers, 0);
}

@end

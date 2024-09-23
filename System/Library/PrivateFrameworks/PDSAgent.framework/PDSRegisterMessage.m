@implementation PDSRegisterMessage

- (id)messageBodyDataOverride
{
  void *v2;
  void *v3;

  -[PDSRegisterMessage protoRequest](self, "protoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bagKey
{
  return CFSTR("id-batchRegister");
}

- (BOOL)wantsIDSProtocolVersion
{
  return 0;
}

- (id)overrideContentType
{
  return CFSTR("application/x-protobuf");
}

- (void)handleResponseBody:(id)a3
{
  id v4;
  PDSProtoBatchRegisterResp *v5;

  v4 = a3;
  v5 = -[PDSProtoBatchRegisterResp initWithData:]([PDSProtoBatchRegisterResp alloc], "initWithData:", v4);

  NSLog(CFSTR("%@"), v5);
  -[PDSRegisterMessage setProtoResponse:](self, "setProtoResponse:", v5);

}

- (id)parsedIDSMessageResult
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[PDSRegisterMessage protoResponse](self, "protoResponse");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[PDSRegisterMessage protoResponse](self, "protoResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasMessage");

    if (v5)
    {
      -[PDSRegisterMessage protoResponse](self, "protoResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "message");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("message"));

    }
    -[PDSRegisterMessage protoResponse](self, "protoResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasRetryInterval");

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      -[PDSRegisterMessage protoResponse](self, "protoResponse");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v11, "retryInterval"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("retry-interval"));

    }
    -[PDSRegisterMessage protoResponse](self, "protoResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasServerTimestamp");

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD16E0];
      -[PDSRegisterMessage protoResponse](self, "protoResponse");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "serverTimestamp"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("current-timestamp-ms"));

    }
    v18 = (void *)MEMORY[0x24BDD16E0];
    -[PDSRegisterMessage protoResponse](self, "protoResponse");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "status"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("status"));

  }
  return v3;
}

- (BOOL)wantsUDID
{
  return 1;
}

- (BOOL)wantsClientInfo
{
  return 1;
}

- (id)additionalMessageHeaders
{
  void *v3;
  __CFDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PDSRegisterMessage;
  -[FTIDSMessage additionalMessageHeaders](&v16, sel_additionalMessageHeaders);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFDictionary *)objc_msgSend(v3, "mutableCopy");

  PDSProtocolVersionNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PDSClientVersionNumber();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    CFDictionarySetValue(v4, CFSTR("x-pds-client-version"), v8);
  if (v6)
    CFDictionarySetValue(v4, CFSTR("x-protocol-version"), v6);
  CFDictionarySetValue(v4, CFSTR("x-pds-client-type"), CFSTR("PDSKit"));
  -[FTIDSMessage pushToken](self, "pushToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_FTStringFromBaseData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    CFDictionarySetValue(v4, CFSTR("x-push-token"), v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PDSRegisterMessage regReason](self, "regReason"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    CFDictionarySetValue(v4, CFSTR("x-registration-reason"), v12);

  -[IDSBaseMessage retryCount](self, "retryCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    CFDictionarySetValue(v4, CFSTR("x-retry-count"), v14);

  return v4;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDSRegisterMessage;
  return -[IDSBaseMessage hasRequiredKeys:](&v4, sel_hasRequiredKeys_, a3);
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (PDSProtoBatchRegisterReq)protoRequest
{
  return self->_protoRequest;
}

- (void)setProtoRequest:(id)a3
{
  objc_storeStrong((id *)&self->_protoRequest, a3);
}

- (PDSProtoBatchRegisterResp)protoResponse
{
  return self->_protoResponse;
}

- (void)setProtoResponse:(id)a3
{
  objc_storeStrong((id *)&self->_protoResponse, a3);
}

- (unint64_t)regReason
{
  return self->_regReason;
}

- (void)setRegReason:(unint64_t)a3
{
  self->_regReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoResponse, 0);
  objc_storeStrong((id *)&self->_protoRequest, 0);
}

@end

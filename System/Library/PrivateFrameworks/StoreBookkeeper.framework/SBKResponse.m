@implementation SBKResponse

- (SBKResponse)initWithURLResponse:(id)a3 responseDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SBKResponse *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "allHeaderFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "statusCode");
  objc_msgSend(v7, "MIMEType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SBKResponse initWithCode:headerFields:responseDictionary:MIMEType:error:]([SBKResponse alloc], "initWithCode:headerFields:responseDictionary:MIMEType:error:", v9, v8, v6, v10, 0);
  return v11;
}

- (SBKResponse)initWithCode:(unint64_t)a3 headerFields:(id)a4 responseDictionary:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SBKResponse *v16;
  SBKResponse *v17;
  uint64_t v18;
  NSString *MIMEType;
  uint64_t v20;
  NSDictionary *responseHeaderFields;
  uint64_t v22;
  NSDictionary *responseDictionary;
  void *v24;
  uint64_t v25;
  SBKResponseStatus *responseStatus;
  uint64_t v27;
  SBKResponseStatus *v28;
  objc_super v30;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)SBKResponse;
  v16 = -[SBKResponse init](&v30, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_error, a7);
    v18 = objc_msgSend(v14, "copy");
    MIMEType = v17->_MIMEType;
    v17->_MIMEType = (NSString *)v18;

    v17->_responseCode = a3;
    v20 = objc_msgSend(v12, "copy");
    responseHeaderFields = v17->_responseHeaderFields;
    v17->_responseHeaderFields = (NSDictionary *)v20;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = objc_msgSend(v13, "copy");
      responseDictionary = v17->_responseDictionary;
      v17->_responseDictionary = (NSDictionary *)v22;

      -[NSDictionary objectForKey:](v17->_responseDictionary, "objectForKey:", CFSTR("status"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKResponseStatus responseStatusForStatusCodeNumber:](SBKResponseStatus, "responseStatusForStatusCodeNumber:", v24);
      v25 = objc_claimAutoreleasedReturnValue();
      responseStatus = v17->_responseStatus;
      v17->_responseStatus = (SBKResponseStatus *)v25;

      if (-[SBKResponseStatus isPuntedError](v17->_responseStatus, "isPuntedError"))
        v17->_retrySeconds = 30.0;
    }
    else
    {
      +[SBKResponseStatus responseStatusForStatusCodeNumber:](SBKResponseStatus, "responseStatusForStatusCodeNumber:", &unk_24E2AFF48);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v17->_responseStatus;
      v17->_responseStatus = (SBKResponseStatus *)v27;

    }
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBKResponse;
  -[SBKResponse description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%ld]: responseDictionary = %@, (%@)\n%@"), self->_responseCode, objc_opt_class(), self->_MIMEType, self->_responseHeaderFields);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)statusCode
{
  return -[SBKResponseStatus statusCode](self->_responseStatus, "statusCode");
}

- (NSString)consoleDescription
{
  return -[SBKResponseStatus consoleDescription](self->_responseStatus, "consoleDescription");
}

- (NSError)requestError
{
  return -[SBKResponseStatus requestError](self->_responseStatus, "requestError");
}

- (BOOL)isSuccess
{
  return -[SBKResponseStatus isSuccess](self->_responseStatus, "isSuccess");
}

- (BOOL)isRecoverable
{
  return -[SBKResponseStatus isRecoverable](self->_responseStatus, "isRecoverable");
}

- (BOOL)isError
{
  return -[SBKResponseStatus isError](self->_responseStatus, "isError");
}

- (BOOL)shouldFileRadar
{
  return -[SBKResponseStatus shouldFileRadar](self->_responseStatus, "shouldFileRadar");
}

- (BOOL)isGenericError
{
  return -[SBKResponseStatus isGenericError](self->_responseStatus, "isGenericError");
}

- (BOOL)isUnsupportedClient
{
  return -[SBKResponseStatus isUnsupportedClient](self->_responseStatus, "isUnsupportedClient");
}

- (BOOL)isAuthenticationError
{
  return -[SBKResponseStatus isAuthenticationError](self->_responseStatus, "isAuthenticationError");
}

- (BOOL)isValidationError
{
  return -[SBKResponseStatus isValidationError](self->_responseStatus, "isValidationError");
}

- (BOOL)isPuntedError
{
  return -[SBKResponseStatus isPuntedError](self->_responseStatus, "isPuntedError");
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (unint64_t)responseCode
{
  return self->_responseCode;
}

- (NSDictionary)responseHeaderFields
{
  return self->_responseHeaderFields;
}

- (NSError)error
{
  return self->_error;
}

- (double)retrySeconds
{
  return self->_retrySeconds;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (SBKResponseStatus)responseStatus
{
  return self->_responseStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responseHeaderFields, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

+ (id)responseWithURLResponse:(id)a3 responseDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURLResponse:responseDictionary:", v7, v6);

  return v8;
}

+ (id)responseWithCode:(unint64_t)a3 headerFields:(id)a4 responseDictionary:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCode:headerFields:responseDictionary:MIMEType:error:", a3, v14, v13, v12, v11);

  return v15;
}

+ (id)responseWithResponse:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v5 = objc_msgSend(v3, "responseCode");
  objc_msgSend(v3, "responseHeaderFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MIMEType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v4, "initWithCode:headerFields:responseDictionary:MIMEType:error:", v5, v6, v7, v8, v9);
  return v10;
}

@end

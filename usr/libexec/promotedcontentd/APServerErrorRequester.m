@implementation APServerErrorRequester

- (APServerErrorRequester)initWithMetric:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6 error:(id)a7
{
  id v12;
  APServerErrorRequester *v13;
  void *v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  NSString *errorDetails;
  APServerErrorRequester *v19;
  objc_super v21;

  v12 = a7;
  v21.receiver = self;
  v21.super_class = (Class)APServerErrorRequester;
  v13 = -[APLegacyMetricRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:](&v21, "initWithMetric:internalContent:andContext:clientInfo:idAccount:", a3, a4, a5, 0, a6);
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ap.AdValidationErrorDomain"));

    if (!v15)
    {
      v19 = 0;
      goto LABEL_9;
    }
    if (objc_msgSend(v12, "code") == (id)4512)
      v16 = 3;
    else
      v16 = 10;
    v13->_legacyServerErrorCode = v16;
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
    errorDetails = v13->_errorDetails;
    v13->_errorDetails = (NSString *)v17;

  }
  v19 = v13;
LABEL_9:

  return v19;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBServerErrorResponse, a2);
}

- (BOOL)isAllowedEmptyResponse
{
  return 1;
}

- (id)protoBuffer
{
  APPBServerErrorRequest *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(APPBServerErrorRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester logMetadata](self, "logMetadata"));
  -[APPBServerErrorRequest setMetaData:](v3, "setMetaData:", v4);

  -[APPBServerErrorRequest setErrorCode:](v3, "setErrorCode:", -[APServerErrorRequester legacyServerErrorCode](self, "legacyServerErrorCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APServerErrorRequester errorDetails](self, "errorDetails"));
  -[APPBServerErrorRequest setErrorDetails:](v3, "setErrorDetails:", v5);

  return v3;
}

- (int)legacyServerErrorCode
{
  return self->_legacyServerErrorCode;
}

- (void)setLegacyServerErrorCode:(int)a3
{
  self->_legacyServerErrorCode = a3;
}

- (NSString)errorDetails
{
  return self->_errorDetails;
}

- (void)setErrorDetails:(id)a3
{
  objc_storeStrong((id *)&self->_errorDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDetails, 0);
}

@end

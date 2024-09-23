@implementation WFRemoteExecutionStopRequest

+ (int64_t)version
{
  return 1;
}

- (WFRemoteExecutionStopRequest)initWithRequestIdentifier:(id)a3
{
  id v6;
  WFRemoteExecutionStopRequest *v7;
  WFRemoteExecutionStopRequest *v8;
  WFRemoteExecutionStopRequest *v9;
  void *v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionStopRequest.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestIdentifier"));

  }
  v7 = -[WFRemoteExecutionRequest init](self, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_requestIdentifier, a3);
    v9 = v8;
  }

  return v8;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  WFREPBStopRequest *v9;
  BOOL v10;
  id v11;
  NSString *v12;
  NSString *requestIdentifier;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D82B90];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithData:", v7);

  v9 = objc_alloc_init(WFREPBStopRequest);
  v16 = 0;
  v10 = -[PBCodable readFrom:error:](v9, "readFrom:error:", v8, &v16);
  v11 = v16;
  if (v10)
  {
    -[WFREPBStopRequest requestIdentifier](v9, "requestIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v12;

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFRemoteExecutionStopRequest readMessageFromData:error:]";
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_FAULT, "%s Failed to read stop request protobuf, %{public}@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v10;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v5;
  WFREPBStopRequest *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc_init(WFREPBStopRequest);
  -[WFRemoteExecutionStopRequest requestIdentifier](self, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBStopRequest setRequestIdentifier:](v6, "setRequestIdentifier:", v7);

  -[WFREPBStopRequest writeTo:](v6, "writeTo:", v5);
  objc_msgSend(v5, "immutableData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end

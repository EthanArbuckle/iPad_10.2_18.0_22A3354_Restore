@implementation WFRemoteExecutionRequest

- (WFRemoteExecutionRequest)init
{
  WFRemoteExecutionRequest *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  WFRemoteExecutionRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFRemoteExecutionRequest;
  v2 = -[WFRemoteExecutionRequest init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v6 = v2;
  }

  return v2;
}

- (WFRemoteExecutionRequest)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  WFRemoteExecutionRequest *v7;
  void *v8;
  WFRemoteExecutionRequest *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFRemoteExecutionRequest;
  v7 = -[WFRemoteExecutionRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v6);
    if (-[WFRemoteExecutionRequest readFrom:error:](v7, "readFrom:error:", v8, a4))
      v9 = v7;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFRemoteExecutionRequest readMessageFromData:error:] must be subclassed"));
  return 0;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFRemoteExecutionRequest writeMessageToWriter:error:] must be subclassed"));
  return 0;
}

- (BOOL)readFrom:(id)a3 error:(id *)a4
{
  id v6;
  WFREPBRequest *v7;
  BOOL v8;
  NSString *v9;
  NSString *identifier;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(WFREPBRequest);
  v8 = -[PBCodable readFrom:error:](v7, "readFrom:error:", v6, a4);

  if (!v8)
  {
    getWFRemoteExecutionLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFRemoteExecutionRequest readFrom:error:]";
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_FAULT, "%s Failed to read base request protobuf", buf, 0xCu);
    }

LABEL_12:
    v12 = 0;
    goto LABEL_17;
  }
  -[WFREPBRequest identifier](v7, "identifier");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v9;

  self->_version = -[WFREPBRequest version](v7, "version");
  if ((objc_msgSend((id)objc_opt_class(), "supportsVersion:", self->_version) & 1) == 0)
  {
    getWFRemoteExecutionLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFRemoteExecutionRequest readFrom:error:]";
      _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_FAULT, "%s Unsupported version of request", buf, 0xCu);
    }

    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "unsupportedVersionError");
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  -[WFREPBRequest message](v7, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v12 = -[WFRemoteExecutionRequest readMessageFromData:error:](self, "readMessageFromData:error:", v11, &v18);
  v13 = v18;
  if (!v12)
  {
    getWFRemoteExecutionLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFRemoteExecutionRequest readFrom:error:]";
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_FAULT, "%s Reading message from request failed with error: %{public}@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }

LABEL_17:
  return v12;
}

- (BOOL)writeTo:(id)a3 error:(id *)a4
{
  id v6;
  WFREPBRequest *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(WFREPBRequest);
  -[WFRemoteExecutionRequest identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBRequest setIdentifier:](v7, "setIdentifier:", v8);

  -[WFREPBRequest setVersion:](v7, "setVersion:", objc_msgSend((id)objc_opt_class(), "version"));
  v9 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  v14 = 0;
  -[WFRemoteExecutionRequest writeMessageToWriter:error:](self, "writeMessageToWriter:error:", v9, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (v10)
  {
    -[WFREPBRequest setMessage:](v7, "setMessage:", v10);
    -[WFREPBRequest writeTo:](v7, "writeTo:", v6);
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFRemoteExecutionRequest writeTo:error:]";
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s Writing message from request failed with error: %{public}@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v10 != 0;
}

- (id)emptyProtobufError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Attempted to write protobuf for message but resulting data was empty.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFRemoteExecutionRequestErrorDomain"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)identifierFromData:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  WFREPBRequest *v8;
  BOOL v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D82B90];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

  v8 = objc_alloc_init(WFREPBRequest);
  v14 = 0;
  v9 = -[PBCodable readFrom:error:](v8, "readFrom:error:", v7, &v14);
  v10 = v14;
  if (v9)
  {
    -[WFREPBRequest identifier](v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "+[WFRemoteExecutionRequest identifierFromData:error:]";
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s Failed to read base request protobuf: %{public}@", buf, 0x16u);
    }

    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v11;
}

+ (BOOL)isUnsupportedVersionError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(a1, "unsupportedVersionError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    v8 = objc_msgSend(v5, "code");
    v9 = v8 == objc_msgSend(v4, "code");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)unsupportedVersionError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v8[0] = *MEMORY[0x1E0CB2D68];
  WFLocalizedString(CFSTR("Could Not Run Remotely"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("This remote execution request is unsupported in this version of Shortcuts. Please update your device."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFRemoteExecutionRequestErrorDomain"), 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsVersion:(int64_t)a3
{
  return objc_msgSend(a1, "version") == a3;
}

+ (int64_t)version
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFRemoteExecutionRequest version] must be subclassed"));
  return 1;
}

@end

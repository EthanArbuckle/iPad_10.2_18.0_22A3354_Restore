@implementation TRIPushChannelId

- (TRIPushChannelId)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6;
  TRIPushChannelId *v7;
  NSObject *v8;
  TRIPushChannelId *v9;
  uint64_t v10;
  NSString *rawIdentifier;
  void *v12;
  uint64_t v13;
  NSString *base64ChannelId;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRIPushChannelId;
  v7 = -[TRIPushChannelId init](&v16, sel_init);
  if (!v7)
    goto LABEL_10;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("TRI-TEST-")))
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Channel generation being skipped for test identifier: %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "copy");
  rawIdentifier = v7->_rawIdentifier;
  v7->_rawIdentifier = (NSString *)v10;

  v7->_type = a4;
  if (a4 != 1)
  {
LABEL_10:
    v9 = v7;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_populationType = objc_msgSend(v12, "populationType");

  objc_msgSend((id)objc_opt_class(), "_base64ChannelIdForIdentifier:populationType:", v7->_rawIdentifier, -[TRIPushChannelId populationType](v7, "populationType"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    base64ChannelId = v7->_base64ChannelId;
    v7->_base64ChannelId = (NSString *)v13;

    goto LABEL_10;
  }
LABEL_6:
  v9 = 0;
LABEL_11:

  return v9;
}

- (TRIPushChannelId)initWithRolloutDeployment:(id)a3
{
  void *v4;
  TRIPushChannelId *v5;

  objc_msgSend(a3, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TRIPushChannelId initWithIdentifier:type:](self, "initWithIdentifier:type:", v4, 1);

  return v5;
}

- (TRIPushChannelId)initWithExperimentId:(id)a3
{
  return -[TRIPushChannelId initWithIdentifier:type:](self, "initWithIdentifier:type:", a3, 1);
}

- (TRIPushChannelId)initWithPushChannelId:(id)a3
{
  return -[TRIPushChannelId initWithIdentifier:type:](self, "initWithIdentifier:type:", a3, 0);
}

- (NSString)identifier
{
  uint64_t v2;

  v2 = 8;
  if (self->_type == 1)
    v2 = 16;
  return (NSString *)*(id *)((char *)&self->super.isa + v2);
}

+ (id)_base64ChannelIdForIdentifier:(id)a3 populationType:(int)a4
{
  char v4;
  id v6;
  const char *v7;
  size_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  size_t v12;
  NSObject *v13;
  void *v14;
  char v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  if (v7)
  {
    v8 = strlen(v7);
    if ((v8 & 1) != 0)
    {
      TRILogCategory_Server();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v6;
        _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Received an unexpected odd length identifier: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", (v8 >> 1) + 1);
      if (v9)
      {
        if (v8 < 2)
        {
LABEL_8:
          v16 = v4;
          -[NSObject appendBytes:length:](v9, "appendBytes:length:", &v16, 1);
          if ((unint64_t)-[NSObject length](v9, "length") < 0x11)
          {
            -[NSObject base64EncodedStringWithOptions:](v9, "base64EncodedStringWithOptions:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
          TRILogCategory_Server();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v18 = v6;
            _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unexpectedly long channel id for identifier %{public}@", buf, 0xCu);
          }

        }
        else
        {
          v10 = 0;
          while (1)
          {
            objc_msgSend(v6, "substringWithRange:", v10, 2);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            buf[0] = 0;
            if (!objc_msgSend(a1, "_writeToByte:fromHexByteString:", buf, v11))
              break;
            -[NSObject appendBytes:length:](v9, "appendBytes:length:", buf, 1);

            v12 = v10 + 3;
            v10 += 2;
            if (v12 >= v8)
              goto LABEL_8;
          }

        }
      }
    }
    v14 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

+ (BOOL)_writeToByte:(char *)a3 fromHexByteString:(id)a4
{
  id v7;
  BOOL v8;
  void *v10;
  unint64_t v11;

  v7 = a4;
  if (objc_msgSend(v7, "length") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIPushChannelId.m"), 119, CFSTR("Unexpected byte string length"));

  }
  v11 = 0;
  if (objc_msgSend(MEMORY[0x1E0DC0AD0], "convertFromString:usingBase:toI64:", v7, 16, &v11)
    && v11 <= 0xFF)
  {
    *a3 = v11;
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIPushChannelId | uncomputed identifier:%@ base64String:%@ type:%lu>"), self->_rawIdentifier, self->_base64ChannelId, self->_type);
}

- (BOOL)isEqual:(id)a3
{
  TRIPushChannelId *v4;
  TRIPushChannelId *v5;
  BOOL v6;

  v4 = (TRIPushChannelId *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIPushChannelId isEqualToPushChannelId:](self, "isEqualToPushChannelId:", v5);

  return v6;
}

- (BOOL)isEqualToPushChannelId:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == -[TRIPushChannelId type](self, "type"))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIPushChannelId identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TRIPushChannelId identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int)populationType
{
  return self->_populationType;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base64ChannelId, 0);
  objc_storeStrong((id *)&self->_rawIdentifier, 0);
}

@end

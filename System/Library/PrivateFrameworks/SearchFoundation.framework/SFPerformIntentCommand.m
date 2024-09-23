@implementation SFPerformIntentCommand

- (void)setIsRunnableWorkflow:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isRunnableWorkflow = a3;
}

- (BOOL)hasIsRunnableWorkflow
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFPerformIntentCommand)initWithCoder:(id)a3
{
  id v4;
  SFPerformIntentCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = -[SFPerformIntentCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand intentMessageName](v8, "intentMessageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformIntentCommand setIntentMessageName:](v5, "setIntentMessageName:", v9);

    -[SFCommand applicationBundleIdentifier](v8, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformIntentCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v10);

    -[SFCommand intentMessageData](v8, "intentMessageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformIntentCommand setIntentMessageData:](v5, "setIntentMessageData:", v11);

    -[SFPerformIntentCommand setIsRunnableWorkflow:](v5, "setIsRunnableWorkflow:", -[SFCommand isRunnableWorkflow](v8, "isRunnableWorkflow"));
    -[SFCommand biomeStreamIdentifier](v8, "biomeStreamIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformIntentCommand setBiomeStreamIdentifier:](v5, "setBiomeStreamIdentifier:", v12);

    -[SFCommand commandDetail](v8, "commandDetail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v13);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v14);

    -[SFCommand backendData](v8, "backendData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v15);

    -[SFCommand commandReference](v8, "commandReference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFPerformIntentCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPerformIntentCommand *v2;
  void *v3;

  v2 = -[_SFPBPerformIntentCommand initWithFacade:]([_SFPBPerformIntentCommand alloc], "initWithFacade:", self);
  -[_SFPBPerformIntentCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPerformIntentCommand *v2;
  void *v3;

  v2 = -[_SFPBPerformIntentCommand initWithFacade:]([_SFPBPerformIntentCommand alloc], "initWithFacade:", self);
  -[_SFPBPerformIntentCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFPerformIntentCommand;
  v4 = -[SFCommand copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[SFPerformIntentCommand intentMessageName](self, "intentMessageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIntentMessageName:", v6);

  -[SFPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v8);

  -[SFPerformIntentCommand intentMessageData](self, "intentMessageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setIntentMessageData:", v10);

  objc_msgSend(v4, "setIsRunnableWorkflow:", -[SFPerformIntentCommand isRunnableWorkflow](self, "isRunnableWorkflow"));
  -[SFPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setBiomeStreamIdentifier:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFPerformIntentCommand *v5;
  SFPerformIntentCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

  v5 = (SFPerformIntentCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFPerformIntentCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v44.receiver = self;
      v44.super_class = (Class)SFPerformIntentCommand;
      if (-[SFCommand isEqual:](&v44, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFPerformIntentCommand intentMessageName](self, "intentMessageName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPerformIntentCommand intentMessageName](v6, "intentMessageName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_40:

          goto LABEL_41;
        }
        -[SFPerformIntentCommand intentMessageName](self, "intentMessageName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFPerformIntentCommand intentMessageName](self, "intentMessageName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPerformIntentCommand intentMessageName](v6, "intentMessageName");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_38;
          }
          v43 = v10;
        }
        -[SFPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPerformIntentCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_37;
        }
        -[SFPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v36 = v9;
          v16 = v14;
          v17 = v12;
          -[SFPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPerformIntentCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            v11 = 0;
            v12 = v17;
            v14 = v16;
            v9 = v36;
            goto LABEL_35;
          }
          v40 = v3;
          v42 = v15;
          v12 = v17;
          v14 = v16;
          v9 = v36;
        }
        else
        {
          v40 = v3;
          v42 = 0;
        }
        -[SFPerformIntentCommand intentMessageData](self, "intentMessageData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPerformIntentCommand intentMessageData](v6, "intentMessageData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) == (v20 != 0))
        {

          v11 = 0;
          v3 = v40;
          v15 = v42;
          if (!v42)
            goto LABEL_36;
          goto LABEL_35;
        }
        v34 = v20;
        v35 = v19;
        -[SFPerformIntentCommand intentMessageData](self, "intentMessageData");
        v15 = v42;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          -[SFPerformIntentCommand intentMessageData](self, "intentMessageData");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPerformIntentCommand intentMessageData](v6, "intentMessageData");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v21;
          v22 = objc_msgSend(v21, "isEqual:");
          v3 = v40;
          if (!v22)
          {
            v11 = 0;
LABEL_33:

LABEL_34:
            if (!v15)
            {
LABEL_36:

LABEL_37:
              v10 = v43;
              if (!v9)
              {
LABEL_39:

                goto LABEL_40;
              }
LABEL_38:

              goto LABEL_39;
            }
LABEL_35:

            goto LABEL_36;
          }
        }
        else
        {
          v3 = v40;
        }
        v23 = -[SFPerformIntentCommand isRunnableWorkflow](self, "isRunnableWorkflow");
        if (v23 == -[SFPerformIntentCommand isRunnableWorkflow](v6, "isRunnableWorkflow"))
        {
          -[SFPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPerformIntentCommand biomeStreamIdentifier](v6, "biomeStreamIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v24 == 0) != (v25 != 0))
          {
            v31 = v25;
            v41 = v24;
            -[SFPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
            v26 = objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v30 = (void *)v26;
              -[SFPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFPerformIntentCommand biomeStreamIdentifier](v6, "biomeStreamIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v29, "isEqual:", v27);

            }
            else
            {

              v11 = 1;
            }
LABEL_32:
            v15 = v42;
            if (!v37)
              goto LABEL_34;
            goto LABEL_33;
          }

        }
        v11 = 0;
        goto LABEL_32;
      }
    }
    v11 = 0;
  }
LABEL_41:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFPerformIntentCommand;
  v3 = -[SFCommand hash](&v14, sel_hash);
  -[SFPerformIntentCommand intentMessageName](self, "intentMessageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFPerformIntentCommand intentMessageData](self, "intentMessageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SFPerformIntentCommand isRunnableWorkflow](self, "isRunnableWorkflow");
  -[SFPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v3;

  return v12;
}

- (NSString)intentMessageName
{
  return self->_intentMessageName;
}

- (void)setIntentMessageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)intentMessageData
{
  return self->_intentMessageData;
}

- (void)setIntentMessageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isRunnableWorkflow
{
  return self->_isRunnableWorkflow;
}

- (NSString)biomeStreamIdentifier
{
  return self->_biomeStreamIdentifier;
}

- (void)setBiomeStreamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMessageData, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMessageName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPerformIntentCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFPerformIntentCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFPerformIntentCommand *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPerformIntentCommand;
  v5 = -[SFPerformIntentCommand init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "intentMessageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "intentMessageName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerformIntentCommand setIntentMessageName:](v5, "setIntentMessageName:", v7);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerformIntentCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    objc_msgSend(v4, "intentMessageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "intentMessageData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerformIntentCommand setIntentMessageData:](v5, "setIntentMessageData:", v11);

    }
    if (objc_msgSend(v4, "isRunnableWorkflow"))
      -[SFPerformIntentCommand setIsRunnableWorkflow:](v5, "setIsRunnableWorkflow:", objc_msgSend(v4, "isRunnableWorkflow"));
    objc_msgSend(v4, "biomeStreamIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "biomeStreamIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerformIntentCommand setBiomeStreamIdentifier:](v5, "setBiomeStreamIdentifier:", v13);

    }
    v14 = v5;
  }

  return v5;
}

@end

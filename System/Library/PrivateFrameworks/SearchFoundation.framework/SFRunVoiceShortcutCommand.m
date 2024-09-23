@implementation SFRunVoiceShortcutCommand

- (SFRunVoiceShortcutCommand)initWithCoder:(id)a3
{
  id v4;
  SFRunVoiceShortcutCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[SFRunVoiceShortcutCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand voiceShortcutIdentifier](v8, "voiceShortcutIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRunVoiceShortcutCommand setVoiceShortcutIdentifier:](v5, "setVoiceShortcutIdentifier:", v9);

    -[SFCommand applicationBundleIdentifier](v8, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRunVoiceShortcutCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v10);

    -[SFCommand commandDetail](v8, "commandDetail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v11);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v12);

    -[SFCommand backendData](v8, "backendData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v13);

    -[SFCommand commandReference](v8, "commandReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v14);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFRunVoiceShortcutCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRunVoiceShortcutCommand *v2;
  void *v3;

  v2 = -[_SFPBRunVoiceShortcutCommand initWithFacade:]([_SFPBRunVoiceShortcutCommand alloc], "initWithFacade:", self);
  -[_SFPBRunVoiceShortcutCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRunVoiceShortcutCommand *v2;
  void *v3;

  v2 = -[_SFPBRunVoiceShortcutCommand initWithFacade:]([_SFPBRunVoiceShortcutCommand alloc], "initWithFacade:", self);
  -[_SFPBRunVoiceShortcutCommand jsonData](v2, "jsonData");
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFRunVoiceShortcutCommand;
  v4 = -[SFCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setVoiceShortcutIdentifier:", v6);

  -[SFRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFRunVoiceShortcutCommand *v5;
  SFRunVoiceShortcutCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v5 = (SFRunVoiceShortcutCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFRunVoiceShortcutCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)SFRunVoiceShortcutCommand;
      if (-[SFCommand isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFRunVoiceShortcutCommand voiceShortcutIdentifier](v6, "voiceShortcutIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFRunVoiceShortcutCommand voiceShortcutIdentifier](v6, "voiceShortcutIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        -[SFRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFRunVoiceShortcutCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            -[SFRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFRunVoiceShortcutCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
            v20 = v3;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v19, "isEqual:", v17);

            v3 = v20;
          }
          else
          {

            v11 = 1;
          }
        }
        v10 = v21;
        if (!v9)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    v11 = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFRunVoiceShortcutCommand;
  v3 = -[SFCommand hash](&v9, sel_hash);
  -[SFRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (NSString)voiceShortcutIdentifier
{
  return self->_voiceShortcutIdentifier;
}

- (void)setVoiceShortcutIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceShortcutIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRunVoiceShortcutCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFRunVoiceShortcutCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFRunVoiceShortcutCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFRunVoiceShortcutCommand;
  v5 = -[SFRunVoiceShortcutCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "voiceShortcutIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "voiceShortcutIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRunVoiceShortcutCommand setVoiceShortcutIdentifier:](v5, "setVoiceShortcutIdentifier:", v7);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRunVoiceShortcutCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    v10 = v5;
  }

  return v5;
}

@end

@implementation SFToggleAudioCommand

- (void)setMediaEntityType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mediaEntityType = a3;
}

- (BOOL)hasMediaEntityType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFToggleAudioCommand)initWithCoder:(id)a3
{
  id v4;
  SFToggleAudioCommand *v5;
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

  v4 = a3;
  v5 = -[SFToggleAudioCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand localMediaIdentifier](v8, "localMediaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFToggleAudioCommand setLocalMediaIdentifier:](v5, "setLocalMediaIdentifier:", v9);

    -[SFCommand persistentIdentifier](v8, "persistentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFToggleAudioCommand setPersistentIdentifier:](v5, "setPersistentIdentifier:", v10);

    -[SFToggleAudioCommand setMediaEntityType:](v5, "setMediaEntityType:", -[SFCommand mediaEntityType](v8, "mediaEntityType"));
    -[SFCommand universalLibraryIdentifier](v8, "universalLibraryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFToggleAudioCommand setUniversalLibraryIdentifier:](v5, "setUniversalLibraryIdentifier:", v11);

    -[SFCommand commandDetail](v8, "commandDetail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v12);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v13);

    -[SFCommand backendData](v8, "backendData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v14);

    -[SFCommand commandReference](v8, "commandReference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFToggleAudioCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBToggleAudioCommand *v2;
  void *v3;

  v2 = -[_SFPBToggleAudioCommand initWithFacade:]([_SFPBToggleAudioCommand alloc], "initWithFacade:", self);
  -[_SFPBToggleAudioCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBToggleAudioCommand *v2;
  void *v3;

  v2 = -[_SFPBToggleAudioCommand initWithFacade:]([_SFPBToggleAudioCommand alloc], "initWithFacade:", self);
  -[_SFPBToggleAudioCommand jsonData](v2, "jsonData");
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFToggleAudioCommand;
  v4 = -[SFCommand copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLocalMediaIdentifier:", v6);

  -[SFToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPersistentIdentifier:", v8);

  objc_msgSend(v4, "setMediaEntityType:", -[SFToggleAudioCommand mediaEntityType](self, "mediaEntityType"));
  -[SFToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setUniversalLibraryIdentifier:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFToggleAudioCommand *v5;
  SFToggleAudioCommand *v6;
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
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v5 = (SFToggleAudioCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFToggleAudioCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v32.receiver = self;
      v32.super_class = (Class)SFToggleAudioCommand;
      if (-[SFCommand isEqual:](&v32, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFToggleAudioCommand localMediaIdentifier](v6, "localMediaIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        -[SFToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFToggleAudioCommand localMediaIdentifier](v6, "localMediaIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        -[SFToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFToggleAudioCommand persistentIdentifier](v6, "persistentIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_28;
        }
        -[SFToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v26 = v3;
          -[SFToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFToggleAudioCommand persistentIdentifier](v6, "persistentIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v3 = v26;
            goto LABEL_26;
          }
          v28 = v15;
          v3 = v26;
        }
        else
        {
          v28 = 0;
        }
        v17 = -[SFToggleAudioCommand mediaEntityType](self, "mediaEntityType");
        if (v17 == -[SFToggleAudioCommand mediaEntityType](v6, "mediaEntityType"))
        {
          -[SFToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFToggleAudioCommand universalLibraryIdentifier](v6, "universalLibraryIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v18 == 0) != (v19 != 0))
          {
            v25 = v19;
            v27 = v18;
            -[SFToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
            v20 = objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v24 = (void *)v20;
              -[SFToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFToggleAudioCommand universalLibraryIdentifier](v6, "universalLibraryIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v23, "isEqual:", v21);

            }
            else
            {

              v11 = 1;
            }
LABEL_25:
            v15 = v28;
            if (!v28)
            {
LABEL_27:

LABEL_28:
              v10 = v31;
              if (!v9)
              {
LABEL_30:

                goto LABEL_31;
              }
LABEL_29:

              goto LABEL_30;
            }
LABEL_26:

            goto LABEL_27;
          }

        }
        v11 = 0;
        goto LABEL_25;
      }
    }
    v11 = 0;
  }
LABEL_32:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFToggleAudioCommand;
  v3 = -[SFCommand hash](&v12, sel_hash);
  -[SFToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFToggleAudioCommand mediaEntityType](self, "mediaEntityType");
  -[SFToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v3;

  return v10;
}

- (NSString)localMediaIdentifier
{
  return self->_localMediaIdentifier;
}

- (void)setLocalMediaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (NSString)universalLibraryIdentifier
{
  return self->_universalLibraryIdentifier;
}

- (void)setUniversalLibraryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalLibraryIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_localMediaIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFToggleAudioCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFToggleAudioCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFToggleAudioCommand *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFToggleAudioCommand;
  v5 = -[SFToggleAudioCommand init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "localMediaIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "localMediaIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFToggleAudioCommand setLocalMediaIdentifier:](v5, "setLocalMediaIdentifier:", v7);

    }
    objc_msgSend(v4, "persistentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "persistentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFToggleAudioCommand setPersistentIdentifier:](v5, "setPersistentIdentifier:", v9);

    }
    if (objc_msgSend(v4, "mediaEntityType"))
      -[SFToggleAudioCommand setMediaEntityType:](v5, "setMediaEntityType:", objc_msgSend(v4, "mediaEntityType"));
    objc_msgSend(v4, "universalLibraryIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "universalLibraryIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFToggleAudioCommand setUniversalLibraryIdentifier:](v5, "setUniversalLibraryIdentifier:", v11);

    }
    v12 = v5;
  }

  return v5;
}

@end

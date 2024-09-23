@implementation SFPlayAudioButtonItem

- (SFPlayAudioButtonItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPlayAudioButtonItem *v6;
  SFPlayAudioButtonItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBPlayAudioButtonItem initWithData:]([_SFPBPlayAudioButtonItem alloc], "initWithData:", v5);
  v7 = -[SFPlayAudioButtonItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPlayAudioButtonItem *v6;

  v4 = a3;
  v6 = -[_SFPBPlayAudioButtonItem initWithFacade:]([_SFPBPlayAudioButtonItem alloc], "initWithFacade:", self);
  -[_SFPBPlayAudioButtonItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPlayAudioButtonItem *v2;
  void *v3;

  v2 = -[_SFPBPlayAudioButtonItem initWithFacade:]([_SFPBPlayAudioButtonItem alloc], "initWithFacade:", self);
  -[_SFPBPlayAudioButtonItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPlayAudioButtonItem *v2;
  void *v3;

  v2 = -[_SFPBPlayAudioButtonItem initWithFacade:]([_SFPBPlayAudioButtonItem alloc], "initWithFacade:", self);
  -[_SFPBPlayAudioButtonItem jsonData](v2, "jsonData");
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
  v12.super_class = (Class)SFPlayAudioButtonItem;
  v4 = -[SFButtonItem copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMediaMetadata:", v6);

  -[SFPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setToggleButtonConfiguration:", v8);

  -[SFPlayAudioButtonItem audioData](self, "audioData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setAudioData:", v10);

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFPlayAudioButtonItem *v5;
  SFPlayAudioButtonItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v5 = (SFPlayAudioButtonItem *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFPlayAudioButtonItem isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v33.receiver = self;
      v33.super_class = (Class)SFPlayAudioButtonItem;
      if (-[SFButtonItem isEqual:](&v33, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPlayAudioButtonItem mediaMetadata](v6, "mediaMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
        -[SFPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPlayAudioButtonItem mediaMetadata](v6, "mediaMetadata");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        -[SFPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPlayAudioButtonItem toggleButtonConfiguration](v6, "toggleButtonConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_30;
        }
        -[SFPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v26 = v12;
          -[SFPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPlayAudioButtonItem toggleButtonConfiguration](v6, "toggleButtonConfiguration");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        -[SFPlayAudioButtonItem audioData](self, "audioData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPlayAudioButtonItem audioData](v6, "audioData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {

          v11 = 0;
          v15 = v31;
          v3 = v28;
          if (!v31)
            goto LABEL_29;
          goto LABEL_28;
        }
        v24 = v18;
        v25 = v17;
        -[SFPlayAudioButtonItem audioData](self, "audioData");
        v15 = v31;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27
          || (-[SFPlayAudioButtonItem audioData](self, "audioData"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFPlayAudioButtonItem audioData](v6, "audioData"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          v3 = v28;
          v20 = -[SFButtonItem uniqueId](self, "uniqueId");
          v11 = v20 == -[SFButtonItem uniqueId](v6, "uniqueId");
          if (!v27)
            goto LABEL_27;
        }
        else
        {
          v11 = 0;
          v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    v11 = 0;
  }
LABEL_34:

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
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFPlayAudioButtonItem;
  v3 = -[SFButtonItem hash](&v12, sel_hash);
  -[SFPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFPlayAudioButtonItem audioData](self, "audioData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SFButtonItem uniqueId](self, "uniqueId") ^ v3;

  return v10;
}

- (SFMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (void)setMediaMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_mediaMetadata, a3);
}

- (SFToggleButtonConfiguration)toggleButtonConfiguration
{
  return self->_toggleButtonConfiguration;
}

- (void)setToggleButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, a3);
}

- (SFAudioData)audioData
{
  return self->_audioData;
}

- (void)setAudioData:(id)a3
{
  objc_storeStrong((id *)&self->_audioData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPlayAudioButtonItem)initWithProtobuf:(id)a3
{
  id v4;
  SFPlayAudioButtonItem *v5;
  void *v6;
  SFMediaMetadata *v7;
  void *v8;
  SFMediaMetadata *v9;
  void *v10;
  SFToggleButtonConfiguration *v11;
  void *v12;
  SFToggleButtonConfiguration *v13;
  void *v14;
  SFAudioData *v15;
  void *v16;
  SFAudioData *v17;
  SFPlayAudioButtonItem *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFPlayAudioButtonItem;
  v5 = -[SFPlayAudioButtonItem init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mediaMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFMediaMetadata alloc];
      objc_msgSend(v4, "mediaMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFMediaMetadata initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFPlayAudioButtonItem setMediaMetadata:](v5, "setMediaMetadata:", v9);

    }
    objc_msgSend(v4, "toggleButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFToggleButtonConfiguration alloc];
      objc_msgSend(v4, "toggleButtonConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFToggleButtonConfiguration initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFPlayAudioButtonItem setToggleButtonConfiguration:](v5, "setToggleButtonConfiguration:", v13);

    }
    objc_msgSend(v4, "audioData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SFAudioData alloc];
      objc_msgSend(v4, "audioData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SFAudioData initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[SFPlayAudioButtonItem setAudioData:](v5, "setAudioData:", v17);

    }
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v18 = v5;
  }

  return v5;
}

@end

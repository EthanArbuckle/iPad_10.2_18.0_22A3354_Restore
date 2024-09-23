@implementation _SFPBPlayAudioButtonItem

- (_SFPBPlayAudioButtonItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBPlayAudioButtonItem *v5;
  void *v6;
  _SFPBMediaMetadata *v7;
  void *v8;
  _SFPBMediaMetadata *v9;
  void *v10;
  _SFPBToggleButtonConfiguration *v11;
  void *v12;
  _SFPBToggleButtonConfiguration *v13;
  void *v14;
  _SFPBAudioData *v15;
  void *v16;
  _SFPBAudioData *v17;
  _SFPBPlayAudioButtonItem *v18;

  v4 = a3;
  v5 = -[_SFPBPlayAudioButtonItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "mediaMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBMediaMetadata alloc];
      objc_msgSend(v4, "mediaMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBMediaMetadata initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBPlayAudioButtonItem setMediaMetadata:](v5, "setMediaMetadata:", v9);

    }
    objc_msgSend(v4, "toggleButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBToggleButtonConfiguration alloc];
      objc_msgSend(v4, "toggleButtonConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBToggleButtonConfiguration initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBPlayAudioButtonItem setToggleButtonConfiguration:](v5, "setToggleButtonConfiguration:", v13);

    }
    objc_msgSend(v4, "audioData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBAudioData alloc];
      objc_msgSend(v4, "audioData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBAudioData initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBPlayAudioButtonItem setAudioData:](v5, "setAudioData:", v17);

    }
    if (objc_msgSend(v4, "hasUniqueId"))
      -[_SFPBPlayAudioButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v18 = v5;
  }

  return v5;
}

- (void)setMediaMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_mediaMetadata, a3);
}

- (void)setToggleButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, a3);
}

- (void)setAudioData:(id)a3
{
  objc_storeStrong((id *)&self->_audioData, a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPlayAudioButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFPBPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBPlayAudioButtonItem audioData](self, "audioData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  v7 = -[_SFPBPlayAudioButtonItem uniqueId](self, "uniqueId");
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteUint64Field();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  unint64_t uniqueId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleButtonConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBPlayAudioButtonItem audioData](self, "audioData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBPlayAudioButtonItem audioData](self, "audioData");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      uniqueId = self->_uniqueId;
      v22 = uniqueId == objc_msgSend(v4, "uniqueId");
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBPlayAudioButtonItem audioData](self, "audioData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_SFPBMediaMetadata hash](self->_mediaMetadata, "hash");
  v4 = -[_SFPBToggleButtonConfiguration hash](self->_toggleButtonConfiguration, "hash");
  return v4 ^ v3 ^ -[_SFPBAudioData hash](self->_audioData, "hash") ^ (2654435761u * self->_uniqueId);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioData)
  {
    -[_SFPBPlayAudioButtonItem audioData](self, "audioData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioData"));

    }
  }
  if (self->_mediaMetadata)
  {
    -[_SFPBPlayAudioButtonItem mediaMetadata](self, "mediaMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mediaMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mediaMetadata"));

    }
  }
  if (self->_toggleButtonConfiguration)
  {
    -[_SFPBPlayAudioButtonItem toggleButtonConfiguration](self, "toggleButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("toggleButtonConfiguration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("toggleButtonConfiguration"));

    }
  }
  if (self->_uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBPlayAudioButtonItem uniqueId](self, "uniqueId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("uniqueId"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPlayAudioButtonItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBPlayAudioButtonItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPlayAudioButtonItem *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBPlayAudioButtonItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPlayAudioButtonItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPlayAudioButtonItem *v5;
  void *v6;
  _SFPBMediaMetadata *v7;
  void *v8;
  _SFPBToggleButtonConfiguration *v9;
  void *v10;
  _SFPBAudioData *v11;
  void *v12;
  _SFPBPlayAudioButtonItem *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBPlayAudioButtonItem;
  v5 = -[_SFPBPlayAudioButtonItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBMediaMetadata initWithDictionary:]([_SFPBMediaMetadata alloc], "initWithDictionary:", v6);
      -[_SFPBPlayAudioButtonItem setMediaMetadata:](v5, "setMediaMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toggleButtonConfiguration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBToggleButtonConfiguration initWithDictionary:]([_SFPBToggleButtonConfiguration alloc], "initWithDictionary:", v8);
      -[_SFPBPlayAudioButtonItem setToggleButtonConfiguration:](v5, "setToggleButtonConfiguration:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBAudioData initWithDictionary:]([_SFPBAudioData alloc], "initWithDictionary:", v10);
      -[_SFPBPlayAudioButtonItem setAudioData:](v5, "setAudioData:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPlayAudioButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v12, "unsignedLongLongValue"));
    v13 = v5;

  }
  return v5;
}

- (_SFPBMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (_SFPBToggleButtonConfiguration)toggleButtonConfiguration
{
  return self->_toggleButtonConfiguration;
}

- (_SFPBAudioData)audioData
{
  return self->_audioData;
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

@end

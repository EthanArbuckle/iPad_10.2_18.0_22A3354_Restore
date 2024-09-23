@implementation _SFPBNamedProtobufMessage

- (_SFPBNamedProtobufMessage)initWithFacade:(id)a3
{
  id v4;
  _SFPBNamedProtobufMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBNamedProtobufMessage *v10;

  v4 = a3;
  v5 = -[_SFPBNamedProtobufMessage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "protobufMessageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "protobufMessageData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBNamedProtobufMessage setProtobufMessageData:](v5, "setProtobufMessageData:", v7);

    }
    objc_msgSend(v4, "protobufMessageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "protobufMessageName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBNamedProtobufMessage setProtobufMessageName:](v5, "setProtobufMessageName:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setProtobufMessageData:(id)a3
{
  NSData *v4;
  NSData *protobufMessageData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  protobufMessageData = self->_protobufMessageData;
  self->_protobufMessageData = v4;

}

- (void)setProtobufMessageName:(id)a3
{
  NSString *v4;
  NSString *protobufMessageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  protobufMessageName = self->_protobufMessageName;
  self->_protobufMessageName = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBNamedProtobufMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBNamedProtobufMessage protobufMessageData](self, "protobufMessageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteDataField();

  -[_SFPBNamedProtobufMessage protobufMessageName](self, "protobufMessageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBNamedProtobufMessage protobufMessageData](self, "protobufMessageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobufMessageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBNamedProtobufMessage protobufMessageData](self, "protobufMessageData");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBNamedProtobufMessage protobufMessageData](self, "protobufMessageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "protobufMessageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBNamedProtobufMessage protobufMessageName](self, "protobufMessageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobufMessageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBNamedProtobufMessage protobufMessageName](self, "protobufMessageName");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBNamedProtobufMessage protobufMessageName](self, "protobufMessageName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "protobufMessageName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_protobufMessageData, "hash");
  return -[NSString hash](self->_protobufMessageName, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_protobufMessageData)
  {
    -[_SFPBNamedProtobufMessage protobufMessageData](self, "protobufMessageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("protobufMessageData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("protobufMessageData"));

    }
  }
  if (self->_protobufMessageName)
  {
    -[_SFPBNamedProtobufMessage protobufMessageName](self, "protobufMessageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("protobufMessageName"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBNamedProtobufMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBNamedProtobufMessage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBNamedProtobufMessage *v5;
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
    self = -[_SFPBNamedProtobufMessage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBNamedProtobufMessage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBNamedProtobufMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBNamedProtobufMessage *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBNamedProtobufMessage;
  v5 = -[_SFPBNamedProtobufMessage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protobufMessageData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      -[_SFPBNamedProtobufMessage setProtobufMessageData:](v5, "setProtobufMessageData:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protobufMessageName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBNamedProtobufMessage setProtobufMessageName:](v5, "setProtobufMessageName:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSData)protobufMessageData
{
  return self->_protobufMessageData;
}

- (NSString)protobufMessageName
{
  return self->_protobufMessageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protobufMessageName, 0);
  objc_storeStrong((id *)&self->_protobufMessageData, 0);
}

@end

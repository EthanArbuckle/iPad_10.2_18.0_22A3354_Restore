@implementation _SFPBRFMapMarkerIdentifier

- (_SFPBRFMapMarkerIdentifier)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFMapMarkerIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBRFMapMarkerIdentifier *v10;

  v4 = a3;
  v5 = -[_SFPBRFMapMarkerIdentifier init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "muid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "muid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFMapMarkerIdentifier setMuid:](v5, "setMuid:", v7);

    }
    objc_msgSend(v4, "resultProviderID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "resultProviderID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFMapMarkerIdentifier setResultProviderID:](v5, "setResultProviderID:", v9);

    }
    if (objc_msgSend(v4, "hasIsForCameraPositionOnly"))
      -[_SFPBRFMapMarkerIdentifier setIsForCameraPositionOnly:](v5, "setIsForCameraPositionOnly:", objc_msgSend(v4, "isForCameraPositionOnly"));
    v10 = v5;
  }

  return v5;
}

- (void)setMuid:(id)a3
{
  NSString *v4;
  NSString *muid;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  muid = self->_muid;
  self->_muid = v4;

}

- (void)setResultProviderID:(id)a3
{
  NSString *v4;
  NSString *resultProviderID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  resultProviderID = self->_resultProviderID;
  self->_resultProviderID = v4;

}

- (void)setIsForCameraPositionOnly:(BOOL)a3
{
  self->_isForCameraPositionOnly = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapMarkerIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRFMapMarkerIdentifier muid](self, "muid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBRFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBRFMapMarkerIdentifier isForCameraPositionOnly](self, "isForCameraPositionOnly"))
    PBDataWriterWriteBOOLField();

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
  BOOL v17;
  int isForCameraPositionOnly;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBRFMapMarkerIdentifier muid](self, "muid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "muid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRFMapMarkerIdentifier muid](self, "muid");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFMapMarkerIdentifier muid](self, "muid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "muid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBRFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultProviderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      isForCameraPositionOnly = self->_isForCameraPositionOnly;
      v17 = isForCameraPositionOnly == objc_msgSend(v4, "isForCameraPositionOnly");
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBRFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultProviderID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
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
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_muid, "hash");
  v4 = -[NSString hash](self->_resultProviderID, "hash");
  v5 = 2654435761;
  if (!self->_isForCameraPositionOnly)
    v5 = 0;
  return v4 ^ v3 ^ v5;
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
  if (self->_isForCameraPositionOnly)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFMapMarkerIdentifier isForCameraPositionOnly](self, "isForCameraPositionOnly"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isForCameraPositionOnly"));

  }
  if (self->_muid)
  {
    -[_SFPBRFMapMarkerIdentifier muid](self, "muid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("muid"));

  }
  if (self->_resultProviderID)
  {
    -[_SFPBRFMapMarkerIdentifier resultProviderID](self, "resultProviderID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("resultProviderID"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFMapMarkerIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFMapMarkerIdentifier)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFMapMarkerIdentifier *v5;
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
    self = -[_SFPBRFMapMarkerIdentifier initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFMapMarkerIdentifier)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFMapMarkerIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBRFMapMarkerIdentifier *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBRFMapMarkerIdentifier;
  v5 = -[_SFPBRFMapMarkerIdentifier init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("muid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBRFMapMarkerIdentifier setMuid:](v5, "setMuid:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultProviderID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBRFMapMarkerIdentifier setResultProviderID:](v5, "setResultProviderID:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isForCameraPositionOnly"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFMapMarkerIdentifier setIsForCameraPositionOnly:](v5, "setIsForCameraPositionOnly:", objc_msgSend(v10, "BOOLValue"));
    v11 = v5;

  }
  return v5;
}

- (NSString)muid
{
  return self->_muid;
}

- (NSString)resultProviderID
{
  return self->_resultProviderID;
}

- (BOOL)isForCameraPositionOnly
{
  return self->_isForCameraPositionOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultProviderID, 0);
  objc_storeStrong((id *)&self->_muid, 0);
}

@end

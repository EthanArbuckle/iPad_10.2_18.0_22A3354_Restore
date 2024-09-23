@implementation _SFPBResultEntity

- (_SFPBResultEntity)initWithFacade:(id)a3
{
  id v4;
  _SFPBResultEntity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBLocationTypeInfo *v11;
  void *v12;
  _SFPBLocationTypeInfo *v13;
  _SFPBResultEntity *v14;

  v4 = a3;
  v5 = -[_SFPBResultEntity init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBResultEntity setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "maps_encrypted_muid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "maps_encrypted_muid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBResultEntity setMaps_encrypted_muid:](v5, "setMaps_encrypted_muid:", v9);

    }
    objc_msgSend(v4, "location_type_info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBLocationTypeInfo alloc];
      objc_msgSend(v4, "location_type_info");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBLocationTypeInfo initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBResultEntity setLocation_type_info:](v5, "setLocation_type_info:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (void)setMaps_encrypted_muid:(id)a3
{
  NSString *v4;
  NSString *maps_encrypted_muid;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  maps_encrypted_muid = self->_maps_encrypted_muid;
  self->_maps_encrypted_muid = v4;

}

- (void)setLocation_type_info:(id)a3
{
  objc_storeStrong((id *)&self->_location_type_info, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBResultEntityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBResultEntity name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBResultEntity location_type_info](self, "location_type_info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBResultEntity name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBResultEntity name](self, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBResultEntity name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maps_encrypted_muid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maps_encrypted_muid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBResultEntity location_type_info](self, "location_type_info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location_type_info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBResultEntity location_type_info](self, "location_type_info");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBResultEntity location_type_info](self, "location_type_info");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location_type_info");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
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
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_maps_encrypted_muid, "hash") ^ v3;
  return v4 ^ -[_SFPBLocationTypeInfo hash](self->_location_type_info, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_location_type_info)
  {
    -[_SFPBResultEntity location_type_info](self, "location_type_info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("locationTypeInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("locationTypeInfo"));

    }
  }
  if (self->_maps_encrypted_muid)
  {
    -[_SFPBResultEntity maps_encrypted_muid](self, "maps_encrypted_muid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mapsEncryptedMuid"));

  }
  if (self->_name)
  {
    -[_SFPBResultEntity name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBResultEntity dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBResultEntity)initWithJSON:(id)a3
{
  void *v4;
  _SFPBResultEntity *v5;
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
    self = -[_SFPBResultEntity initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBResultEntity)initWithDictionary:(id)a3
{
  id v4;
  _SFPBResultEntity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBLocationTypeInfo *v11;
  _SFPBResultEntity *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBResultEntity;
  v5 = -[_SFPBResultEntity init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBResultEntity setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsEncryptedMuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBResultEntity setMaps_encrypted_muid:](v5, "setMaps_encrypted_muid:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationTypeInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBLocationTypeInfo initWithDictionary:]([_SFPBLocationTypeInfo alloc], "initWithDictionary:", v10);
      -[_SFPBResultEntity setLocation_type_info:](v5, "setLocation_type_info:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)maps_encrypted_muid
{
  return self->_maps_encrypted_muid;
}

- (_SFPBLocationTypeInfo)location_type_info
{
  return self->_location_type_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location_type_info, 0);
  objc_storeStrong((id *)&self->_maps_encrypted_muid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

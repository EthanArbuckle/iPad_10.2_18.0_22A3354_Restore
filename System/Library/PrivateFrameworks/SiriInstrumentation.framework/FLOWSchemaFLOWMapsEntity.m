@implementation FLOWSchemaFLOWMapsEntity

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FLOWSchemaFLOWMapsEntity;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[FLOWSchemaFLOWMapsEntity deleteMuid](self, "deleteMuid");
    -[FLOWSchemaFLOWMapsEntity deleteMapsFeatureId](self, "deleteMapsFeatureId");
    -[FLOWSchemaFLOWMapsEntity deleteAddressId](self, "deleteAddressId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[FLOWSchemaFLOWMapsEntity deleteMuid](self, "deleteMuid");
    -[FLOWSchemaFLOWMapsEntity deleteMapsFeatureId](self, "deleteMapsFeatureId");
    -[FLOWSchemaFLOWMapsEntity deleteAddressId](self, "deleteAddressId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[FLOWSchemaFLOWMapsEntity deleteMuid](self, "deleteMuid");
    -[FLOWSchemaFLOWMapsEntity deleteMapsFeatureId](self, "deleteMapsFeatureId");
    -[FLOWSchemaFLOWMapsEntity deleteAddressId](self, "deleteAddressId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[FLOWSchemaFLOWMapsEntity deleteMuid](self, "deleteMuid");
    -[FLOWSchemaFLOWMapsEntity deleteMapsFeatureId](self, "deleteMapsFeatureId");
    -[FLOWSchemaFLOWMapsEntity deleteAddressId](self, "deleteAddressId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[FLOWSchemaFLOWMapsEntity deleteMuid](self, "deleteMuid");
    -[FLOWSchemaFLOWMapsEntity deleteMapsFeatureId](self, "deleteMapsFeatureId");
    -[FLOWSchemaFLOWMapsEntity deleteAddressId](self, "deleteAddressId");
  }

  return v5;
}

- (void)setMuid:(unint64_t)a3
{
  NSString *addressId;

  self->_mapsFeatureId = 0;
  addressId = self->_addressId;
  self->_addressId = 0;

  self->_whichEntityid = 1;
  self->_muid = a3;
}

- (unint64_t)muid
{
  if (self->_whichEntityid == 1)
    return self->_muid;
  else
    return 0;
}

- (void)deleteMuid
{
  if (self->_whichEntityid == 1)
  {
    self->_whichEntityid = 0;
    self->_muid = 0;
  }
}

- (void)setMapsFeatureId:(unint64_t)a3
{
  NSString *addressId;

  self->_muid = 0;
  addressId = self->_addressId;
  self->_addressId = 0;

  self->_whichEntityid = 2;
  self->_mapsFeatureId = a3;
}

- (unint64_t)mapsFeatureId
{
  if (self->_whichEntityid == 2)
    return self->_mapsFeatureId;
  else
    return 0;
}

- (void)deleteMapsFeatureId
{
  if (self->_whichEntityid == 2)
  {
    self->_whichEntityid = 0;
    self->_mapsFeatureId = 0;
  }
}

- (void)setAddressId:(id)a3
{
  unint64_t v4;
  NSString *v5;
  NSString *addressId;
  id v7;

  self->_muid = 0;
  self->_mapsFeatureId = 0;
  v4 = 3;
  if (!a3)
    v4 = 0;
  self->_whichEntityid = v4;
  v7 = a3;
  v5 = (NSString *)objc_msgSend(v7, "copy");
  addressId = self->_addressId;
  self->_addressId = v5;

}

- (NSString)addressId
{
  if (self->_whichEntityid == 3)
    return self->_addressId;
  else
    return (NSString *)0;
}

- (void)deleteAddressId
{
  NSString *addressId;

  if (self->_whichEntityid == 3)
  {
    self->_whichEntityid = 0;
    addressId = self->_addressId;
    self->_addressId = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMapsEntityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t whichEntityid;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  whichEntityid = self->_whichEntityid;
  if (whichEntityid == 1)
  {
    PBDataWriterWriteUint64Field();
    whichEntityid = self->_whichEntityid;
  }
  if (whichEntityid == 2)
    PBDataWriterWriteUint64Field();
  -[FLOWSchemaFLOWMapsEntity addressId](self, "addressId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEntityid;
  unint64_t muid;
  unint64_t mapsFeatureId;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichEntityid = self->_whichEntityid;
    if (whichEntityid == objc_msgSend(v4, "whichEntityid"))
    {
      muid = self->_muid;
      if (muid == objc_msgSend(v4, "muid"))
      {
        mapsFeatureId = self->_mapsFeatureId;
        if (mapsFeatureId == objc_msgSend(v4, "mapsFeatureId"))
        {
          -[FLOWSchemaFLOWMapsEntity addressId](self, "addressId");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addressId");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if ((v8 == 0) != (v9 != 0))
          {
            -[FLOWSchemaFLOWMapsEntity addressId](self, "addressId");
            v11 = objc_claimAutoreleasedReturnValue();
            if (!v11)
            {

LABEL_13:
              v16 = 1;
              goto LABEL_11;
            }
            v12 = (void *)v11;
            -[FLOWSchemaFLOWMapsEntity addressId](self, "addressId");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addressId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqual:", v14);

            if ((v15 & 1) != 0)
              goto LABEL_13;
          }
          else
          {

          }
        }
      }
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (unint64_t)hash
{
  unint64_t whichEntityid;
  int *v3;
  uint64_t v4;

  whichEntityid = self->_whichEntityid;
  if (whichEntityid == 1)
  {
    v3 = &OBJC_IVAR___FLOWSchemaFLOWMapsEntity__muid;
  }
  else
  {
    if (whichEntityid != 2)
    {
      v4 = 0;
      return -[NSString hash](self->_addressId, "hash") ^ v4;
    }
    v3 = &OBJC_IVAR___FLOWSchemaFLOWMapsEntity__mapsFeatureId;
  }
  v4 = 2654435761 * *(uint64_t *)((char *)&self->super.super.super.isa + *v3);
  return -[NSString hash](self->_addressId, "hash") ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t whichEntityid;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_addressId)
  {
    -[FLOWSchemaFLOWMapsEntity addressId](self, "addressId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("addressId"));

  }
  whichEntityid = self->_whichEntityid;
  if (whichEntityid == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[FLOWSchemaFLOWMapsEntity mapsFeatureId](self, "mapsFeatureId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mapsFeatureId"));

    whichEntityid = self->_whichEntityid;
  }
  if (whichEntityid == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[FLOWSchemaFLOWMapsEntity muid](self, "muid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("muid"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWMapsEntity dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWMapsEntity)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWMapsEntity *v5;
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
    self = -[FLOWSchemaFLOWMapsEntity initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWMapsEntity)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWMapsEntity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FLOWSchemaFLOWMapsEntity *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWSchemaFLOWMapsEntity;
  v5 = -[FLOWSchemaFLOWMapsEntity init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("muid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMapsEntity setMuid:](v5, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsFeatureId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMapsEntity setMapsFeatureId:](v5, "setMapsFeatureId:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("addressId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[FLOWSchemaFLOWMapsEntity setAddressId:](v5, "setAddressId:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEntityid
{
  return self->_whichEntityid;
}

- (BOOL)hasMuid
{
  return self->_hasMuid;
}

- (void)setHasMuid:(BOOL)a3
{
  self->_hasMuid = a3;
}

- (BOOL)hasMapsFeatureId
{
  return self->_hasMapsFeatureId;
}

- (void)setHasMapsFeatureId:(BOOL)a3
{
  self->_hasMapsFeatureId = a3;
}

- (BOOL)hasAddressId
{
  return self->_hasAddressId;
}

- (void)setHasAddressId:(BOOL)a3
{
  self->_hasAddressId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressId, 0);
}

@end

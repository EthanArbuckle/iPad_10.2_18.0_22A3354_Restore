@implementation SISchemaCarBluetoothHeadUnit

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasHeadUnitVendorId
{
  return self->_headUnitVendorId != 0;
}

- (void)deleteHeadUnitVendorId
{
  -[SISchemaCarBluetoothHeadUnit setHeadUnitVendorId:](self, "setHeadUnitVendorId:", 0);
}

- (BOOL)hasHeadUnitProductId
{
  return self->_headUnitProductId != 0;
}

- (void)deleteHeadUnitProductId
{
  -[SISchemaCarBluetoothHeadUnit setHeadUnitProductId:](self, "setHeadUnitProductId:", 0);
}

- (BOOL)hasCarMake
{
  return self->_carMake != 0;
}

- (void)deleteCarMake
{
  -[SISchemaCarBluetoothHeadUnit setCarMake:](self, "setCarMake:", 0);
}

- (BOOL)hasCarModel
{
  return self->_carModel != 0;
}

- (void)deleteCarModel
{
  -[SISchemaCarBluetoothHeadUnit setCarModel:](self, "setCarModel:", 0);
}

- (void)setCarYear:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_carYear = a3;
}

- (BOOL)hasCarYear
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCarYear:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCarYear
{
  -[SISchemaCarBluetoothHeadUnit setCarYear:](self, "setCarYear:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasOrganizationallyUniqueId
{
  return self->_organizationallyUniqueId != 0;
}

- (void)deleteOrganizationallyUniqueId
{
  -[SISchemaCarBluetoothHeadUnit setOrganizationallyUniqueId:](self, "setOrganizationallyUniqueId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCarBluetoothHeadUnitReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SISchemaCarBluetoothHeadUnit headUnitVendorId](self, "headUnitVendorId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaCarBluetoothHeadUnit headUnitProductId](self, "headUnitProductId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaCarBluetoothHeadUnit carMake](self, "carMake");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[SISchemaCarBluetoothHeadUnit carModel](self, "carModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[SISchemaCarBluetoothHeadUnit organizationallyUniqueId](self, "organizationallyUniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  unsigned int carYear;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[SISchemaCarBluetoothHeadUnit headUnitVendorId](self, "headUnitVendorId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headUnitVendorId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[SISchemaCarBluetoothHeadUnit headUnitVendorId](self, "headUnitVendorId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaCarBluetoothHeadUnit headUnitVendorId](self, "headUnitVendorId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headUnitVendorId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[SISchemaCarBluetoothHeadUnit headUnitProductId](self, "headUnitProductId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headUnitProductId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[SISchemaCarBluetoothHeadUnit headUnitProductId](self, "headUnitProductId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaCarBluetoothHeadUnit headUnitProductId](self, "headUnitProductId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headUnitProductId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  -[SISchemaCarBluetoothHeadUnit carMake](self, "carMake");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carMake");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[SISchemaCarBluetoothHeadUnit carMake](self, "carMake");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaCarBluetoothHeadUnit carMake](self, "carMake");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carMake");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_30;
  }
  else
  {

  }
  -[SISchemaCarBluetoothHeadUnit carModel](self, "carModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[SISchemaCarBluetoothHeadUnit carModel](self, "carModel");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[SISchemaCarBluetoothHeadUnit carModel](self, "carModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_30;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    carYear = self->_carYear;
    if (carYear != objc_msgSend(v4, "carYear"))
      goto LABEL_30;
  }
  -[SISchemaCarBluetoothHeadUnit organizationallyUniqueId](self, "organizationallyUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationallyUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaCarBluetoothHeadUnit organizationallyUniqueId](self, "organizationallyUniqueId");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_33:
      v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    -[SISchemaCarBluetoothHeadUnit organizationallyUniqueId](self, "organizationallyUniqueId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organizationallyUniqueId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
LABEL_29:

  }
LABEL_30:
  v33 = 0;
LABEL_31:

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_headUnitVendorId, "hash");
  v4 = -[NSString hash](self->_headUnitProductId, "hash");
  v5 = -[NSString hash](self->_carMake, "hash");
  v6 = -[NSString hash](self->_carModel, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_carYear;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_organizationallyUniqueId, "hash");
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
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_carMake)
  {
    -[SISchemaCarBluetoothHeadUnit carMake](self, "carMake");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("carMake"));

  }
  if (self->_carModel)
  {
    -[SISchemaCarBluetoothHeadUnit carModel](self, "carModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("carModel"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaCarBluetoothHeadUnit carYear](self, "carYear"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("carYear"));

  }
  if (self->_headUnitProductId)
  {
    -[SISchemaCarBluetoothHeadUnit headUnitProductId](self, "headUnitProductId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("headUnitProductId"));

  }
  if (self->_headUnitVendorId)
  {
    -[SISchemaCarBluetoothHeadUnit headUnitVendorId](self, "headUnitVendorId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("headUnitVendorId"));

  }
  if (self->_organizationallyUniqueId)
  {
    -[SISchemaCarBluetoothHeadUnit organizationallyUniqueId](self, "organizationallyUniqueId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("organizationallyUniqueId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaCarBluetoothHeadUnit dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaCarBluetoothHeadUnit)initWithJSON:(id)a3
{
  void *v4;
  SISchemaCarBluetoothHeadUnit *v5;
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
    self = -[SISchemaCarBluetoothHeadUnit initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaCarBluetoothHeadUnit)initWithDictionary:(id)a3
{
  id v4;
  SISchemaCarBluetoothHeadUnit *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SISchemaCarBluetoothHeadUnit *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SISchemaCarBluetoothHeadUnit;
  v5 = -[SISchemaCarBluetoothHeadUnit init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headUnitVendorId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaCarBluetoothHeadUnit setHeadUnitVendorId:](v5, "setHeadUnitVendorId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headUnitProductId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaCarBluetoothHeadUnit setHeadUnitProductId:](v5, "setHeadUnitProductId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carMake"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[SISchemaCarBluetoothHeadUnit setCarMake:](v5, "setCarMake:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[SISchemaCarBluetoothHeadUnit setCarModel:](v5, "setCarModel:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carYear"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaCarBluetoothHeadUnit setCarYear:](v5, "setCarYear:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("organizationallyUniqueId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[SISchemaCarBluetoothHeadUnit setOrganizationallyUniqueId:](v5, "setOrganizationallyUniqueId:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (NSString)headUnitVendorId
{
  return self->_headUnitVendorId;
}

- (void)setHeadUnitVendorId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)headUnitProductId
{
  return self->_headUnitProductId;
}

- (void)setHeadUnitProductId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)carMake
{
  return self->_carMake;
}

- (void)setCarMake:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)carModel
{
  return self->_carModel;
}

- (void)setCarModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)carYear
{
  return self->_carYear;
}

- (NSString)organizationallyUniqueId
{
  return self->_organizationallyUniqueId;
}

- (void)setOrganizationallyUniqueId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasHeadUnitVendorId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasHeadUnitProductId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasCarMake:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasCarModel:(BOOL)a3
{
  self->_hasHeadUnitVendorId = a3;
}

- (void)setHasOrganizationallyUniqueId:(BOOL)a3
{
  self->_hasHeadUnitProductId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationallyUniqueId, 0);
  objc_storeStrong((id *)&self->_carModel, 0);
  objc_storeStrong((id *)&self->_carMake, 0);
  objc_storeStrong((id *)&self->_headUnitProductId, 0);
  objc_storeStrong((id *)&self->_headUnitVendorId, 0);
}

@end

@implementation USOSchemaUSOSpanPropertyTier1

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
  v7.super_class = (Class)USOSchemaUSOSpanPropertyTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[USOSchemaUSOSpanPropertyTier1 deleteValueString](self, "deleteValueString");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueInt](self, "deleteValueInt");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueFloat](self, "deleteValueFloat");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[USOSchemaUSOSpanPropertyTier1 deleteValueString](self, "deleteValueString");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueInt](self, "deleteValueInt");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueFloat](self, "deleteValueFloat");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[USOSchemaUSOSpanPropertyTier1 deleteValueString](self, "deleteValueString");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueInt](self, "deleteValueInt");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueFloat](self, "deleteValueFloat");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[USOSchemaUSOSpanPropertyTier1 deleteValueString](self, "deleteValueString");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueInt](self, "deleteValueInt");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueFloat](self, "deleteValueFloat");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[USOSchemaUSOSpanPropertyTier1 deleteValueString](self, "deleteValueString");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueInt](self, "deleteValueInt");
    -[USOSchemaUSOSpanPropertyTier1 deleteValueFloat](self, "deleteValueFloat");
  }

  return v5;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)deleteKey
{
  -[USOSchemaUSOSpanPropertyTier1 setKey:](self, "setKey:", 0);
}

- (BOOL)hasValueString
{
  return self->_valueString != 0;
}

- (void)deleteValueString
{
  -[USOSchemaUSOSpanPropertyTier1 setValueString:](self, "setValueString:", 0);
}

- (void)setValueInt:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_valueInt = a3;
}

- (BOOL)hasValueInt
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasValueInt:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteValueInt
{
  -[USOSchemaUSOSpanPropertyTier1 setValueInt:](self, "setValueInt:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setValueFloat:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_valueFloat = a3;
}

- (BOOL)hasValueFloat
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasValueFloat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteValueFloat
{
  double v2;

  LODWORD(v2) = 0;
  -[USOSchemaUSOSpanPropertyTier1 setValueFloat:](self, "setValueFloat:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return USOSchemaUSOSpanPropertyTier1ReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[USOSchemaUSOSpanPropertyTier1 key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[USOSchemaUSOSpanPropertyTier1 valueString](self, "valueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v7 = v8;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  $2C7C400D7A7DEC554C218CAFA26C2673 has;
  unsigned int v20;
  int valueInt;
  int v22;
  float valueFloat;
  float v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[USOSchemaUSOSpanPropertyTier1 key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[USOSchemaUSOSpanPropertyTier1 key](self, "key");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[USOSchemaUSOSpanPropertyTier1 key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[USOSchemaUSOSpanPropertyTier1 valueString](self, "valueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[USOSchemaUSOSpanPropertyTier1 valueString](self, "valueString");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[USOSchemaUSOSpanPropertyTier1 valueString](self, "valueString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[32];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      valueInt = self->_valueInt;
      if (valueInt != objc_msgSend(v4, "valueInt"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[32];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22 || (valueFloat = self->_valueFloat, objc_msgSend(v4, "valueFloat"), valueFloat == v24))
      {
        v17 = 1;
        goto LABEL_13;
      }
    }
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
  float valueFloat;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_valueString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_valueInt;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  valueFloat = self->_valueFloat;
  v7 = valueFloat;
  if (valueFloat < 0.0)
    v7 = -valueFloat;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_key)
  {
    -[USOSchemaUSOSpanPropertyTier1 key](self, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("key"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[USOSchemaUSOSpanPropertyTier1 valueFloat](self, "valueFloat");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("valueFloat"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[USOSchemaUSOSpanPropertyTier1 valueInt](self, "valueInt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("valueInt"));

  }
  if (self->_valueString)
  {
    -[USOSchemaUSOSpanPropertyTier1 valueString](self, "valueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("valueString"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOSpanPropertyTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOSpanPropertyTier1)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOSpanPropertyTier1 *v5;
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
    self = -[USOSchemaUSOSpanPropertyTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOSpanPropertyTier1)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOSpanPropertyTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  USOSchemaUSOSpanPropertyTier1 *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSchemaUSOSpanPropertyTier1;
  v5 = -[USOSchemaUSOSpanPropertyTier1 init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[USOSchemaUSOSpanPropertyTier1 setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[USOSchemaUSOSpanPropertyTier1 setValueString:](v5, "setValueString:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueInt"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOSpanPropertyTier1 setValueInt:](v5, "setValueInt:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueFloat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[USOSchemaUSOSpanPropertyTier1 setValueFloat:](v5, "setValueFloat:");
    }
    v12 = v5;

  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)valueInt
{
  return self->_valueInt;
}

- (float)valueFloat
{
  return self->_valueFloat;
}

- (void)setHasKey:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasValueString:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end

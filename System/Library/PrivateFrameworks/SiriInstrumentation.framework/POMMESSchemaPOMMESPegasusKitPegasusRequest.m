@implementation POMMESSchemaPOMMESPegasusKitPegasusRequest

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
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESPegasusKitPegasusRequest;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESPegasusKitPegasusRequest pegasusRequestArguments](self, "pegasusRequestArguments", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[POMMESSchemaPOMMESPegasusKitPegasusRequest deletePegasusRequestArguments](self, "deletePegasusRequestArguments");
  return v5;
}

- (void)setRawRequestSizeInKB:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rawRequestSizeInKB = a3;
}

- (BOOL)hasRawRequestSizeInKB
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRawRequestSizeInKB:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRawRequestSizeInKB
{
  -[POMMESSchemaPOMMESPegasusKitPegasusRequest setRawRequestSizeInKB:](self, "setRawRequestSizeInKB:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCompressedRequestSizeInKB:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_compressedRequestSizeInKB = a3;
}

- (BOOL)hasCompressedRequestSizeInKB
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCompressedRequestSizeInKB:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCompressedRequestSizeInKB
{
  -[POMMESSchemaPOMMESPegasusKitPegasusRequest setCompressedRequestSizeInKB:](self, "setCompressedRequestSizeInKB:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasPegasusRequestArguments
{
  return self->_pegasusRequestArguments != 0;
}

- (void)deletePegasusRequestArguments
{
  -[POMMESSchemaPOMMESPegasusKitPegasusRequest setPegasusRequestArguments:](self, "setPegasusRequestArguments:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusKitPegasusRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[POMMESSchemaPOMMESPegasusKitPegasusRequest pegasusRequestArguments](self, "pegasusRequestArguments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[POMMESSchemaPOMMESPegasusKitPegasusRequest pegasusRequestArguments](self, "pegasusRequestArguments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $0934A36C49BD2C92444CDDEB5AC35318 has;
  unsigned int v6;
  unsigned int rawRequestSizeInKB;
  int v8;
  unsigned int compressedRequestSizeInKB;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    rawRequestSizeInKB = self->_rawRequestSizeInKB;
    if (rawRequestSizeInKB != objc_msgSend(v4, "rawRequestSizeInKB"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (compressedRequestSizeInKB = self->_compressedRequestSizeInKB,
          compressedRequestSizeInKB == objc_msgSend(v4, "compressedRequestSizeInKB")))
    {
      -[POMMESSchemaPOMMESPegasusKitPegasusRequest pegasusRequestArguments](self, "pegasusRequestArguments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pegasusRequestArguments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[POMMESSchemaPOMMESPegasusKitPegasusRequest pegasusRequestArguments](self, "pegasusRequestArguments");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[POMMESSchemaPOMMESPegasusKitPegasusRequest pegasusRequestArguments](self, "pegasusRequestArguments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "pegasusRequestArguments");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_rawRequestSizeInKB;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[POMMESSchemaPOMMESPegasusRequestArguments hash](self->_pegasusRequestArguments, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_compressedRequestSizeInKB;
  return v3 ^ v2 ^ -[POMMESSchemaPOMMESPegasusRequestArguments hash](self->_pegasusRequestArguments, "hash");
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitPegasusRequest compressedRequestSizeInKB](self, "compressedRequestSizeInKB"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("compressedRequestSizeInKB"));

  }
  if (self->_pegasusRequestArguments)
  {
    -[POMMESSchemaPOMMESPegasusKitPegasusRequest pegasusRequestArguments](self, "pegasusRequestArguments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("pegasusRequestArguments"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("pegasusRequestArguments"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitPegasusRequest rawRequestSizeInKB](self, "rawRequestSizeInKB"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("rawRequestSizeInKB"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESPegasusKitPegasusRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESPegasusKitPegasusRequest)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESPegasusKitPegasusRequest *v5;
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
    self = -[POMMESSchemaPOMMESPegasusKitPegasusRequest initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESPegasusKitPegasusRequest)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESPegasusKitPegasusRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  POMMESSchemaPOMMESPegasusRequestArguments *v9;
  POMMESSchemaPOMMESPegasusKitPegasusRequest *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESPegasusKitPegasusRequest;
  v5 = -[POMMESSchemaPOMMESPegasusKitPegasusRequest init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawRequestSizeInKB"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusKitPegasusRequest setRawRequestSizeInKB:](v5, "setRawRequestSizeInKB:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compressedRequestSizeInKB"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusKitPegasusRequest setCompressedRequestSizeInKB:](v5, "setCompressedRequestSizeInKB:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusRequestArguments"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[POMMESSchemaPOMMESPegasusRequestArguments initWithDictionary:]([POMMESSchemaPOMMESPegasusRequestArguments alloc], "initWithDictionary:", v8);
      -[POMMESSchemaPOMMESPegasusKitPegasusRequest setPegasusRequestArguments:](v5, "setPegasusRequestArguments:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unsigned)rawRequestSizeInKB
{
  return self->_rawRequestSizeInKB;
}

- (unsigned)compressedRequestSizeInKB
{
  return self->_compressedRequestSizeInKB;
}

- (POMMESSchemaPOMMESPegasusRequestArguments)pegasusRequestArguments
{
  return self->_pegasusRequestArguments;
}

- (void)setPegasusRequestArguments:(id)a3
{
  objc_storeStrong((id *)&self->_pegasusRequestArguments, a3);
}

- (void)setHasPegasusRequestArguments:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusRequestArguments, 0);
}

@end

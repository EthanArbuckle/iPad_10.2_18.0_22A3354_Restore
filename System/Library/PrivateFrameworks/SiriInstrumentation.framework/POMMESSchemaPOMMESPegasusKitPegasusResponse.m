@implementation POMMESSchemaPOMMESPegasusKitPegasusResponse

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
  v9.super_class = (Class)POMMESSchemaPOMMESPegasusKitPegasusResponse;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESPegasusKitPegasusResponse timingData](self, "timingData", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[POMMESSchemaPOMMESPegasusKitPegasusResponse deleteTimingData](self, "deleteTimingData");
  return v5;
}

- (void)setRawResponseSizeInKB:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rawResponseSizeInKB = a3;
}

- (BOOL)hasRawResponseSizeInKB
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRawResponseSizeInKB:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRawResponseSizeInKB
{
  -[POMMESSchemaPOMMESPegasusKitPegasusResponse setRawResponseSizeInKB:](self, "setRawResponseSizeInKB:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCompressedResponseSizeInKB:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_compressedResponseSizeInKB = a3;
}

- (BOOL)hasCompressedResponseSizeInKB
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCompressedResponseSizeInKB:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCompressedResponseSizeInKB
{
  -[POMMESSchemaPOMMESPegasusKitPegasusResponse setCompressedResponseSizeInKB:](self, "setCompressedResponseSizeInKB:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasTimingData
{
  return self->_timingData != 0;
}

- (void)deleteTimingData
{
  -[POMMESSchemaPOMMESPegasusKitPegasusResponse setTimingData:](self, "setTimingData:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusKitPegasusResponseReadFrom(self, (uint64_t)a3);
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
  -[POMMESSchemaPOMMESPegasusKitPegasusResponse timingData](self, "timingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[POMMESSchemaPOMMESPegasusKitPegasusResponse timingData](self, "timingData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $073D67A95A343EB9167FDA1C687F0DF0 has;
  unsigned int v6;
  unsigned int rawResponseSizeInKB;
  int v8;
  unsigned int compressedResponseSizeInKB;
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
    rawResponseSizeInKB = self->_rawResponseSizeInKB;
    if (rawResponseSizeInKB != objc_msgSend(v4, "rawResponseSizeInKB"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (compressedResponseSizeInKB = self->_compressedResponseSizeInKB,
          compressedResponseSizeInKB == objc_msgSend(v4, "compressedResponseSizeInKB")))
    {
      -[POMMESSchemaPOMMESPegasusKitPegasusResponse timingData](self, "timingData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timingData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[POMMESSchemaPOMMESPegasusKitPegasusResponse timingData](self, "timingData");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[POMMESSchemaPOMMESPegasusKitPegasusResponse timingData](self, "timingData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "timingData");
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
    v2 = 2654435761 * self->_rawResponseSizeInKB;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[POMMESSchemaPOMMESPegasusKitNetworkTimingData hash](self->_timingData, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_compressedResponseSizeInKB;
  return v3 ^ v2 ^ -[POMMESSchemaPOMMESPegasusKitNetworkTimingData hash](self->_timingData, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitPegasusResponse compressedResponseSizeInKB](self, "compressedResponseSizeInKB"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("compressedResponseSizeInKB"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitPegasusResponse rawResponseSizeInKB](self, "rawResponseSizeInKB"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("rawResponseSizeInKB"));

  }
  if (self->_timingData)
  {
    -[POMMESSchemaPOMMESPegasusKitPegasusResponse timingData](self, "timingData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("timingData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("timingData"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESPegasusKitPegasusResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESPegasusKitPegasusResponse)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESPegasusKitPegasusResponse *v5;
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
    self = -[POMMESSchemaPOMMESPegasusKitPegasusResponse initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESPegasusKitPegasusResponse)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESPegasusKitPegasusResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  POMMESSchemaPOMMESPegasusKitNetworkTimingData *v9;
  POMMESSchemaPOMMESPegasusKitPegasusResponse *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESPegasusKitPegasusResponse;
  v5 = -[POMMESSchemaPOMMESPegasusKitPegasusResponse init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawResponseSizeInKB"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusKitPegasusResponse setRawResponseSizeInKB:](v5, "setRawResponseSizeInKB:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compressedResponseSizeInKB"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusKitPegasusResponse setCompressedResponseSizeInKB:](v5, "setCompressedResponseSizeInKB:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timingData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[POMMESSchemaPOMMESPegasusKitNetworkTimingData initWithDictionary:]([POMMESSchemaPOMMESPegasusKitNetworkTimingData alloc], "initWithDictionary:", v8);
      -[POMMESSchemaPOMMESPegasusKitPegasusResponse setTimingData:](v5, "setTimingData:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unsigned)rawResponseSizeInKB
{
  return self->_rawResponseSizeInKB;
}

- (unsigned)compressedResponseSizeInKB
{
  return self->_compressedResponseSizeInKB;
}

- (POMMESSchemaPOMMESPegasusKitNetworkTimingData)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
  objc_storeStrong((id *)&self->_timingData, a3);
}

- (void)setHasTimingData:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingData, 0);
}

@end

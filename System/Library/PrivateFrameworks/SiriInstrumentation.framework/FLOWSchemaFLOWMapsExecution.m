@implementation FLOWSchemaFLOWMapsExecution

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMapsFeature:(int)a3
{
  *(&self->_isSpellCorrected + 1) |= 1u;
  self->_mapsFeature = a3;
}

- (BOOL)hasMapsFeature
{
  return *(&self->_isSpellCorrected + 1);
}

- (void)setHasMapsFeature:(BOOL)a3
{
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xFE | a3;
}

- (void)deleteMapsFeature
{
  -[FLOWSchemaFLOWMapsExecution setMapsFeature:](self, "setMapsFeature:", 0);
  *(&self->_isSpellCorrected + 1) &= ~1u;
}

- (void)setMapsQueryLabel:(int)a3
{
  *(&self->_isSpellCorrected + 1) |= 2u;
  self->_mapsQueryLabel = a3;
}

- (BOOL)hasMapsQueryLabel
{
  return (*((unsigned __int8 *)&self->_isSpellCorrected + 1) >> 1) & 1;
}

- (void)setHasMapsQueryLabel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xFD | v3;
}

- (void)deleteMapsQueryLabel
{
  -[FLOWSchemaFLOWMapsExecution setMapsQueryLabel:](self, "setMapsQueryLabel:", 0);
  *(&self->_isSpellCorrected + 1) &= ~2u;
}

- (void)setIsSearchAlongRouteRequest:(BOOL)a3
{
  *(&self->_isSpellCorrected + 1) |= 4u;
  self->_isSearchAlongRouteRequest = a3;
}

- (BOOL)hasIsSearchAlongRouteRequest
{
  return (*((unsigned __int8 *)&self->_isSpellCorrected + 1) >> 2) & 1;
}

- (void)setHasIsSearchAlongRouteRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xFB | v3;
}

- (void)deleteIsSearchAlongRouteRequest
{
  -[FLOWSchemaFLOWMapsExecution setIsSearchAlongRouteRequest:](self, "setIsSearchAlongRouteRequest:", 0);
  *(&self->_isSpellCorrected + 1) &= ~4u;
}

- (void)setIsProxySearchResult:(BOOL)a3
{
  *(&self->_isSpellCorrected + 1) |= 8u;
  self->_isProxySearchResult = a3;
}

- (BOOL)hasIsProxySearchResult
{
  return (*((unsigned __int8 *)&self->_isSpellCorrected + 1) >> 3) & 1;
}

- (void)setHasIsProxySearchResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xF7 | v3;
}

- (void)deleteIsProxySearchResult
{
  -[FLOWSchemaFLOWMapsExecution setIsProxySearchResult:](self, "setIsProxySearchResult:", 0);
  *(&self->_isSpellCorrected + 1) &= ~8u;
}

- (void)setIsSpellCorrected:(BOOL)a3
{
  *(&self->_isSpellCorrected + 1) |= 0x10u;
  self->_isSpellCorrected = a3;
}

- (BOOL)hasIsSpellCorrected
{
  return (*((unsigned __int8 *)&self->_isSpellCorrected + 1) >> 4) & 1;
}

- (void)setHasIsSpellCorrected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xEF | v3;
}

- (void)deleteIsSpellCorrected
{
  -[FLOWSchemaFLOWMapsExecution setIsSpellCorrected:](self, "setIsSpellCorrected:", 0);
  *(&self->_isSpellCorrected + 1) &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMapsExecutionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = *(&self->_isSpellCorrected + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(&self->_isSpellCorrected + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isSpellCorrected + 1) & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int mapsFeature;
  int v8;
  int mapsQueryLabel;
  int v10;
  int isSearchAlongRouteRequest;
  int v12;
  int isProxySearchResult;
  int v14;
  int isSpellCorrected;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
  v6 = v4[19];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_22;
  if ((v5 & 1) != 0)
  {
    mapsFeature = self->_mapsFeature;
    if (mapsFeature != objc_msgSend(v4, "mapsFeature"))
      goto LABEL_22;
    v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
    v6 = v4[19];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v8)
  {
    mapsQueryLabel = self->_mapsQueryLabel;
    if (mapsQueryLabel != objc_msgSend(v4, "mapsQueryLabel"))
      goto LABEL_22;
    v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
    v6 = v4[19];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_22;
  if (v10)
  {
    isSearchAlongRouteRequest = self->_isSearchAlongRouteRequest;
    if (isSearchAlongRouteRequest != objc_msgSend(v4, "isSearchAlongRouteRequest"))
      goto LABEL_22;
    v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
    v6 = v4[19];
  }
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_22;
  if (v12)
  {
    isProxySearchResult = self->_isProxySearchResult;
    if (isProxySearchResult == objc_msgSend(v4, "isProxySearchResult"))
    {
      v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
      v6 = v4[19];
      goto LABEL_18;
    }
LABEL_22:
    v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_22;
  if (v14)
  {
    isSpellCorrected = self->_isSpellCorrected;
    if (isSpellCorrected != objc_msgSend(v4, "isSpellCorrected"))
      goto LABEL_22;
  }
  v16 = 1;
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(&self->_isSpellCorrected + 1))
  {
    v2 = 2654435761 * self->_mapsFeature;
    if ((*(&self->_isSpellCorrected + 1) & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_mapsQueryLabel;
      if ((*(&self->_isSpellCorrected + 1) & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(&self->_isSpellCorrected + 1) & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(&self->_isSpellCorrected + 1) & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_isSearchAlongRouteRequest;
    if ((*(&self->_isSpellCorrected + 1) & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(&self->_isSpellCorrected + 1) & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(&self->_isSpellCorrected + 1) & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_isProxySearchResult;
  if ((*(&self->_isSpellCorrected + 1) & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_isSpellCorrected;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWMapsExecution isProxySearchResult](self, "isProxySearchResult"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isProxySearchResult"));

    v4 = *(&self->_isSpellCorrected + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(&self->_isSpellCorrected + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWMapsExecution isSearchAlongRouteRequest](self, "isSearchAlongRouteRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isSearchAlongRouteRequest"));

  v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWMapsExecution isSpellCorrected](self, "isSpellCorrected"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSpellCorrected"));

  v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 1) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      goto LABEL_18;
    goto LABEL_14;
  }
LABEL_10:
  v8 = -[FLOWSchemaFLOWMapsExecution mapsFeature](self, "mapsFeature") - 1;
  if (v8 > 0xB)
    v9 = CFSTR("FLOWMAPSFEATURE_UNKNOWN");
  else
    v9 = off_1E5638A28[v8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mapsFeature"));
  if ((*(&self->_isSpellCorrected + 1) & 2) != 0)
  {
LABEL_14:
    v10 = -[FLOWSchemaFLOWMapsExecution mapsQueryLabel](self, "mapsQueryLabel") - 1;
    if (v10 > 0xA)
      v11 = CFSTR("FLOWMAPSQUERYLABEL_UNKNOWN");
    else
      v11 = off_1E5638A88[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mapsQueryLabel"));
  }
LABEL_18:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWMapsExecution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWMapsExecution)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWMapsExecution *v5;
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
    self = -[FLOWSchemaFLOWMapsExecution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWMapsExecution)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWMapsExecution *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FLOWSchemaFLOWMapsExecution *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWMapsExecution;
  v5 = -[FLOWSchemaFLOWMapsExecution init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsFeature"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMapsExecution setMapsFeature:](v5, "setMapsFeature:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsQueryLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMapsExecution setMapsQueryLabel:](v5, "setMapsQueryLabel:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSearchAlongRouteRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMapsExecution setIsSearchAlongRouteRequest:](v5, "setIsSearchAlongRouteRequest:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isProxySearchResult"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMapsExecution setIsProxySearchResult:](v5, "setIsProxySearchResult:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSpellCorrected"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMapsExecution setIsSpellCorrected:](v5, "setIsSpellCorrected:", objc_msgSend(v10, "BOOLValue"));
    v11 = v5;

  }
  return v5;
}

- (int)mapsFeature
{
  return self->_mapsFeature;
}

- (int)mapsQueryLabel
{
  return self->_mapsQueryLabel;
}

- (BOOL)isSearchAlongRouteRequest
{
  return self->_isSearchAlongRouteRequest;
}

- (BOOL)isProxySearchResult
{
  return self->_isProxySearchResult;
}

- (BOOL)isSpellCorrected
{
  return self->_isSpellCorrected;
}

@end

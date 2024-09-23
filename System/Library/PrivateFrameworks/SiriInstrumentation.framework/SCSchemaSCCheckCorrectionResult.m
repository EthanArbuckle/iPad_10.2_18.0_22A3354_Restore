@implementation SCSchemaSCCheckCorrectionResult

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasCorrectedAttribute
{
  return self->_correctedAttribute != 0;
}

- (void)deleteCorrectedAttribute
{
  -[SCSchemaSCCheckCorrectionResult setCorrectedAttribute:](self, "setCorrectedAttribute:", 0);
}

- (void)setCorrectionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_correctionType = a3;
}

- (BOOL)hasCorrectionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCorrectionType
{
  -[SCSchemaSCCheckCorrectionResult setCorrectionType:](self, "setCorrectionType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearReferredEntities
{
  -[NSArray removeAllObjects](self->_referredEntities, "removeAllObjects");
}

- (void)addReferredEntities:(id)a3
{
  id v4;
  NSArray *referredEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  referredEntities = self->_referredEntities;
  v8 = v4;
  if (!referredEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_referredEntities;
    self->_referredEntities = v6;

    v4 = v8;
    referredEntities = self->_referredEntities;
  }
  -[NSArray addObject:](referredEntities, "addObject:", v4);

}

- (unint64_t)referredEntitiesCount
{
  return -[NSArray count](self->_referredEntities, "count");
}

- (id)referredEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_referredEntities, "objectAtIndexedSubscript:", a3);
}

- (void)clearIncomingEntities
{
  -[NSArray removeAllObjects](self->_incomingEntities, "removeAllObjects");
}

- (void)addIncomingEntities:(id)a3
{
  id v4;
  NSArray *incomingEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  incomingEntities = self->_incomingEntities;
  v8 = v4;
  if (!incomingEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_incomingEntities;
    self->_incomingEntities = v6;

    v4 = v8;
    incomingEntities = self->_incomingEntities;
  }
  -[NSArray addObject:](incomingEntities, "addObject:", v4);

}

- (unint64_t)incomingEntitiesCount
{
  return -[NSArray count](self->_incomingEntities, "count");
}

- (id)incomingEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_incomingEntities, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return SCSchemaSCCheckCorrectionResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SCSchemaSCCheckCorrectionResult correctedAttribute](self, "correctedAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_referredEntities;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_incomingEntities;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
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
  int correctionType;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[SCSchemaSCCheckCorrectionResult correctedAttribute](self, "correctedAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctedAttribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[SCSchemaSCCheckCorrectionResult correctedAttribute](self, "correctedAttribute");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SCSchemaSCCheckCorrectionResult correctedAttribute](self, "correctedAttribute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctedAttribute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    correctionType = self->_correctionType;
    if (correctionType != objc_msgSend(v4, "correctionType"))
      goto LABEL_20;
  }
  -[SCSchemaSCCheckCorrectionResult referredEntities](self, "referredEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referredEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[SCSchemaSCCheckCorrectionResult referredEntities](self, "referredEntities");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SCSchemaSCCheckCorrectionResult referredEntities](self, "referredEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referredEntities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[SCSchemaSCCheckCorrectionResult incomingEntities](self, "incomingEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incomingEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SCSchemaSCCheckCorrectionResult incomingEntities](self, "incomingEntities");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[SCSchemaSCCheckCorrectionResult incomingEntities](self, "incomingEntities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "incomingEntities");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_correctedAttribute, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_correctionType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSArray hash](self->_referredEntities, "hash");
  return v5 ^ v6 ^ -[NSArray hash](self->_incomingEntities, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_correctedAttribute)
  {
    -[SCSchemaSCCheckCorrectionResult correctedAttribute](self, "correctedAttribute");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("correctedAttribute"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = -[SCSchemaSCCheckCorrectionResult correctionType](self, "correctionType") - 1;
    if (v6 > 5)
      v7 = CFSTR("SCCORRECTIONTYPE_UNKNOWN");
    else
      v7 = off_1E5638158[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("correctionType"));
  }
  if (self->_incomingEntities)
  {
    -[SCSchemaSCCheckCorrectionResult incomingEntities](self, "incomingEntities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("incomingEntities"));

  }
  if (self->_referredEntities)
  {
    -[SCSchemaSCCheckCorrectionResult referredEntities](self, "referredEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("referredEntities"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SCSchemaSCCheckCorrectionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SCSchemaSCCheckCorrectionResult)initWithJSON:(id)a3
{
  void *v4;
  SCSchemaSCCheckCorrectionResult *v5;
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
    self = -[SCSchemaSCCheckCorrectionResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SCSchemaSCCheckCorrectionResult)initWithDictionary:(id)a3
{
  id v4;
  SCSchemaSCCheckCorrectionResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  SCSchemaSCCheckCorrectionResult *v26;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SCSchemaSCCheckCorrectionResult;
  v5 = -[SCSchemaSCCheckCorrectionResult init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctedAttribute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SCSchemaSCCheckCorrectionResult setCorrectedAttribute:](v5, "setCorrectedAttribute:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SCSchemaSCCheckCorrectionResult setCorrectionType:](v5, "setCorrectionType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referredEntities"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v6;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v35;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v35 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = (void *)objc_msgSend(v16, "copy");
              -[SCSchemaSCCheckCorrectionResult addReferredEntities:](v5, "addReferredEntities:", v17);

            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v13);
      }

      v6 = v10;
      v8 = v29;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("incomingEntities"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v6;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v31;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v23);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = (void *)objc_msgSend(v24, "copy");
              -[SCSchemaSCCheckCorrectionResult addIncomingEntities:](v5, "addIncomingEntities:", v25);

            }
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v21);
      }

      v6 = v28;
      v8 = v29;
    }
    v26 = v5;

  }
  return v5;
}

- (NSString)correctedAttribute
{
  return self->_correctedAttribute;
}

- (void)setCorrectedAttribute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)correctionType
{
  return self->_correctionType;
}

- (NSArray)referredEntities
{
  return self->_referredEntities;
}

- (void)setReferredEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)incomingEntities
{
  return self->_incomingEntities;
}

- (void)setIncomingEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasCorrectedAttribute:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingEntities, 0);
  objc_storeStrong((id *)&self->_referredEntities, 0);
  objc_storeStrong((id *)&self->_correctedAttribute, 0);
}

@end

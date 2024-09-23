@implementation INFERENCESchemaINFERENCEBackgroundContactSignalSet

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
  v9.super_class = (Class)INFERENCESchemaINFERENCEBackgroundContactSignalSet;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEBackgroundContactSignalSet handlesWithBgPrivacySignals](self, "handlesWithBgPrivacySignals", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[INFERENCESchemaINFERENCEBackgroundContactSignalSet setHandlesWithBgPrivacySignals:](self, "setHandlesWithBgPrivacySignals:", v7);
  return v5;
}

- (void)setIsMatchWithRelationName:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isMatchWithRelationName = a3;
}

- (BOOL)hasIsMatchWithRelationName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsMatchWithRelationName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsMatchWithRelationName
{
  -[INFERENCESchemaINFERENCEBackgroundContactSignalSet setIsMatchWithRelationName:](self, "setIsMatchWithRelationName:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPeopleSuggesterScoreSumForContact:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_peopleSuggesterScoreSumForContact = a3;
}

- (BOOL)hasPeopleSuggesterScoreSumForContact
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPeopleSuggesterScoreSumForContact:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePeopleSuggesterScoreSumForContact
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEBackgroundContactSignalSet setPeopleSuggesterScoreSumForContact:](self, "setPeopleSuggesterScoreSumForContact:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearHandlesWithBgPrivacySignals
{
  -[NSArray removeAllObjects](self->_handlesWithBgPrivacySignals, "removeAllObjects");
}

- (void)addHandlesWithBgPrivacySignals:(id)a3
{
  id v4;
  NSArray *handlesWithBgPrivacySignals;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  handlesWithBgPrivacySignals = self->_handlesWithBgPrivacySignals;
  v8 = v4;
  if (!handlesWithBgPrivacySignals)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_handlesWithBgPrivacySignals;
    self->_handlesWithBgPrivacySignals = v6;

    v4 = v8;
    handlesWithBgPrivacySignals = self->_handlesWithBgPrivacySignals;
  }
  -[NSArray addObject:](handlesWithBgPrivacySignals, "addObject:", v4);

}

- (unint64_t)handlesWithBgPrivacySignalsCount
{
  return -[NSArray count](self->_handlesWithBgPrivacySignals, "count");
}

- (id)handlesWithBgPrivacySignalsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_handlesWithBgPrivacySignals, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCEBackgroundContactSignalSetReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_handlesWithBgPrivacySignals;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $CCF596CA2586E4D98D1E38A503F5F173 has;
  unsigned int v6;
  int isMatchWithRelationName;
  int v8;
  float peopleSuggesterScoreSumForContact;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isMatchWithRelationName = self->_isMatchWithRelationName;
    if (isMatchWithRelationName != objc_msgSend(v4, "isMatchWithRelationName"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (peopleSuggesterScoreSumForContact = self->_peopleSuggesterScoreSumForContact,
          objc_msgSend(v4, "peopleSuggesterScoreSumForContact"),
          peopleSuggesterScoreSumForContact == v10))
    {
      -[INFERENCESchemaINFERENCEBackgroundContactSignalSet handlesWithBgPrivacySignals](self, "handlesWithBgPrivacySignals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handlesWithBgPrivacySignals");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if ((v11 == 0) != (v12 != 0))
      {
        -[INFERENCESchemaINFERENCEBackgroundContactSignalSet handlesWithBgPrivacySignals](self, "handlesWithBgPrivacySignals");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

LABEL_17:
          v19 = 1;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        -[INFERENCESchemaINFERENCEBackgroundContactSignalSet handlesWithBgPrivacySignals](self, "handlesWithBgPrivacySignals");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handlesWithBgPrivacySignals");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if ((v18 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  float peopleSuggesterScoreSumForContact;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_isMatchWithRelationName;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8 ^ v3 ^ -[NSArray hash](self->_handlesWithBgPrivacySignals, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  peopleSuggesterScoreSumForContact = self->_peopleSuggesterScoreSumForContact;
  v5 = peopleSuggesterScoreSumForContact;
  if (peopleSuggesterScoreSumForContact < 0.0)
    v5 = -peopleSuggesterScoreSumForContact;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ -[NSArray hash](self->_handlesWithBgPrivacySignals, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char has;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_handlesWithBgPrivacySignals, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_handlesWithBgPrivacySignals;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("handlesWithBgPrivacySignals"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEBackgroundContactSignalSet isMatchWithRelationName](self, "isMatchWithRelationName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isMatchWithRelationName"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEBackgroundContactSignalSet peopleSuggesterScoreSumForContact](self, "peopleSuggesterScoreSumForContact");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("peopleSuggesterScoreSumForContact"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v17);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEBackgroundContactSignalSet dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEBackgroundContactSignalSet)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEBackgroundContactSignalSet *v5;
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
    self = -[INFERENCESchemaINFERENCEBackgroundContactSignalSet initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEBackgroundContactSignalSet)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEBackgroundContactSignalSet *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  INFERENCESchemaINFERENCEBackgroundContactHandleSignalSet *v15;
  INFERENCESchemaINFERENCEBackgroundContactSignalSet *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INFERENCESchemaINFERENCEBackgroundContactSignalSet;
  v5 = -[INFERENCESchemaINFERENCEBackgroundContactSignalSet init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMatchWithRelationName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEBackgroundContactSignalSet setIsMatchWithRelationName:](v5, "setIsMatchWithRelationName:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peopleSuggesterScoreSumForContact"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[INFERENCESchemaINFERENCEBackgroundContactSignalSet setPeopleSuggesterScoreSumForContact:](v5, "setPeopleSuggesterScoreSumForContact:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handlesWithBgPrivacySignals"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v7;
      v19 = v6;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[INFERENCESchemaINFERENCEBackgroundContactHandleSignalSet initWithDictionary:]([INFERENCESchemaINFERENCEBackgroundContactHandleSignalSet alloc], "initWithDictionary:", v14);
              -[INFERENCESchemaINFERENCEBackgroundContactSignalSet addHandlesWithBgPrivacySignals:](v5, "addHandlesWithBgPrivacySignals:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v11);
      }

      v7 = v18;
      v6 = v19;
    }
    v16 = v5;

  }
  return v5;
}

- (BOOL)isMatchWithRelationName
{
  return self->_isMatchWithRelationName;
}

- (float)peopleSuggesterScoreSumForContact
{
  return self->_peopleSuggesterScoreSumForContact;
}

- (NSArray)handlesWithBgPrivacySignals
{
  return self->_handlesWithBgPrivacySignals;
}

- (void)setHandlesWithBgPrivacySignals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlesWithBgPrivacySignals, 0);
}

@end

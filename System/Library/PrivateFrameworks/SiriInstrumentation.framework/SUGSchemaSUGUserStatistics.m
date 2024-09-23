@implementation SUGSchemaSUGUserStatistics

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUGSchemaSUGUserStatistics;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUGSchemaSUGUserStatistics totalSiriRequests](self, "totalSiriRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SUGSchemaSUGUserStatistics deleteTotalSiriRequests](self, "deleteTotalSiriRequests");
  -[SUGSchemaSUGUserStatistics totalPreviousSuggestionsShown](self, "totalPreviousSuggestionsShown");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SUGSchemaSUGUserStatistics deleteTotalPreviousSuggestionsShown](self, "deleteTotalPreviousSuggestionsShown");
  -[SUGSchemaSUGUserStatistics totalSiriHelpRequests](self, "totalSiriHelpRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SUGSchemaSUGUserStatistics deleteTotalSiriHelpRequests](self, "deleteTotalSiriHelpRequests");
  -[SUGSchemaSUGUserStatistics totalUniqueSiriEventTypes](self, "totalUniqueSiriEventTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SUGSchemaSUGUserStatistics deleteTotalUniqueSiriEventTypes](self, "deleteTotalUniqueSiriEventTypes");

  return v5;
}

- (BOOL)hasTotalSiriRequests
{
  return self->_totalSiriRequests != 0;
}

- (void)deleteTotalSiriRequests
{
  -[SUGSchemaSUGUserStatistics setTotalSiriRequests:](self, "setTotalSiriRequests:", 0);
}

- (BOOL)hasTotalPreviousSuggestionsShown
{
  return self->_totalPreviousSuggestionsShown != 0;
}

- (void)deleteTotalPreviousSuggestionsShown
{
  -[SUGSchemaSUGUserStatistics setTotalPreviousSuggestionsShown:](self, "setTotalPreviousSuggestionsShown:", 0);
}

- (BOOL)hasTotalSiriHelpRequests
{
  return self->_totalSiriHelpRequests != 0;
}

- (void)deleteTotalSiriHelpRequests
{
  -[SUGSchemaSUGUserStatistics setTotalSiriHelpRequests:](self, "setTotalSiriHelpRequests:", 0);
}

- (BOOL)hasTotalUniqueSiriEventTypes
{
  return self->_totalUniqueSiriEventTypes != 0;
}

- (void)deleteTotalUniqueSiriEventTypes
{
  -[SUGSchemaSUGUserStatistics setTotalUniqueSiriEventTypes:](self, "setTotalUniqueSiriEventTypes:", 0);
}

- (void)setIsTwoByThreeUser:(BOOL)a3
{
  *(&self->_isTwoByThreeUser + 1) |= 1u;
  self->_isTwoByThreeUser = a3;
}

- (BOOL)hasIsTwoByThreeUser
{
  return *(&self->_isTwoByThreeUser + 1);
}

- (void)setHasIsTwoByThreeUser:(BOOL)a3
{
  *(&self->_isTwoByThreeUser + 1) = *(&self->_isTwoByThreeUser + 1) & 0xFE | a3;
}

- (void)deleteIsTwoByThreeUser
{
  -[SUGSchemaSUGUserStatistics setIsTwoByThreeUser:](self, "setIsTwoByThreeUser:", 0);
  *(&self->_isTwoByThreeUser + 1) &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGUserStatisticsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SUGSchemaSUGUserStatistics totalSiriRequests](self, "totalSiriRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUGSchemaSUGUserStatistics totalSiriRequests](self, "totalSiriRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGUserStatistics totalPreviousSuggestionsShown](self, "totalPreviousSuggestionsShown");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUGSchemaSUGUserStatistics totalPreviousSuggestionsShown](self, "totalPreviousSuggestionsShown");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGUserStatistics totalSiriHelpRequests](self, "totalSiriHelpRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUGSchemaSUGUserStatistics totalSiriHelpRequests](self, "totalSiriHelpRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGUserStatistics totalUniqueSiriEventTypes](self, "totalUniqueSiriEventTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUGSchemaSUGUserStatistics totalUniqueSiriEventTypes](self, "totalUniqueSiriEventTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (*(&self->_isTwoByThreeUser + 1))
    PBDataWriterWriteBOOLField();

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
  BOOL v27;
  int isTwoByThreeUser;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[SUGSchemaSUGUserStatistics totalSiriRequests](self, "totalSiriRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalSiriRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[SUGSchemaSUGUserStatistics totalSiriRequests](self, "totalSiriRequests");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SUGSchemaSUGUserStatistics totalSiriRequests](self, "totalSiriRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "totalSiriRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[SUGSchemaSUGUserStatistics totalPreviousSuggestionsShown](self, "totalPreviousSuggestionsShown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalPreviousSuggestionsShown");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[SUGSchemaSUGUserStatistics totalPreviousSuggestionsShown](self, "totalPreviousSuggestionsShown");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SUGSchemaSUGUserStatistics totalPreviousSuggestionsShown](self, "totalPreviousSuggestionsShown");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "totalPreviousSuggestionsShown");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[SUGSchemaSUGUserStatistics totalSiriHelpRequests](self, "totalSiriHelpRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalSiriHelpRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[SUGSchemaSUGUserStatistics totalSiriHelpRequests](self, "totalSiriHelpRequests");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SUGSchemaSUGUserStatistics totalSiriHelpRequests](self, "totalSiriHelpRequests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "totalSiriHelpRequests");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[SUGSchemaSUGUserStatistics totalUniqueSiriEventTypes](self, "totalUniqueSiriEventTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalUniqueSiriEventTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[SUGSchemaSUGUserStatistics totalUniqueSiriEventTypes](self, "totalUniqueSiriEventTypes");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[SUGSchemaSUGUserStatistics totalUniqueSiriEventTypes](self, "totalUniqueSiriEventTypes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "totalUniqueSiriEventTypes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  if (*(&self->_isTwoByThreeUser + 1) == (v4[41] & 1))
  {
    if (!*(&self->_isTwoByThreeUser + 1)
      || (isTwoByThreeUser = self->_isTwoByThreeUser,
          isTwoByThreeUser == objc_msgSend(v4, "isTwoByThreeUser")))
    {
      v27 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[SUGSchemaSUGAggregateCounts hash](self->_totalSiriRequests, "hash");
  v4 = -[SUGSchemaSUGAggregateCounts hash](self->_totalPreviousSuggestionsShown, "hash");
  v5 = -[SUGSchemaSUGAggregateCounts hash](self->_totalSiriHelpRequests, "hash");
  v6 = -[SUGSchemaSUGAggregateCounts hash](self->_totalUniqueSiriEventTypes, "hash");
  if (*(&self->_isTwoByThreeUser + 1))
    v7 = 2654435761 * self->_isTwoByThreeUser;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(&self->_isTwoByThreeUser + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SUGSchemaSUGUserStatistics isTwoByThreeUser](self, "isTwoByThreeUser"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isTwoByThreeUser"));

  }
  if (self->_totalPreviousSuggestionsShown)
  {
    -[SUGSchemaSUGUserStatistics totalPreviousSuggestionsShown](self, "totalPreviousSuggestionsShown");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("totalPreviousSuggestionsShown"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("totalPreviousSuggestionsShown"));

    }
  }
  if (self->_totalSiriHelpRequests)
  {
    -[SUGSchemaSUGUserStatistics totalSiriHelpRequests](self, "totalSiriHelpRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("totalSiriHelpRequests"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("totalSiriHelpRequests"));

    }
  }
  if (self->_totalSiriRequests)
  {
    -[SUGSchemaSUGUserStatistics totalSiriRequests](self, "totalSiriRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("totalSiriRequests"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("totalSiriRequests"));

    }
  }
  if (self->_totalUniqueSiriEventTypes)
  {
    -[SUGSchemaSUGUserStatistics totalUniqueSiriEventTypes](self, "totalUniqueSiriEventTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("totalUniqueSiriEventTypes"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("totalUniqueSiriEventTypes"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGUserStatistics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGUserStatistics)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGUserStatistics *v5;
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
    self = -[SUGSchemaSUGUserStatistics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGUserStatistics)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGUserStatistics *v5;
  void *v6;
  SUGSchemaSUGAggregateCounts *v7;
  void *v8;
  SUGSchemaSUGAggregateCounts *v9;
  void *v10;
  SUGSchemaSUGAggregateCounts *v11;
  void *v12;
  SUGSchemaSUGAggregateCounts *v13;
  void *v14;
  SUGSchemaSUGUserStatistics *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUGSchemaSUGUserStatistics;
  v5 = -[SUGSchemaSUGUserStatistics init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSiriRequests"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SUGSchemaSUGAggregateCounts initWithDictionary:]([SUGSchemaSUGAggregateCounts alloc], "initWithDictionary:", v6);
      -[SUGSchemaSUGUserStatistics setTotalSiriRequests:](v5, "setTotalSiriRequests:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalPreviousSuggestionsShown"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SUGSchemaSUGAggregateCounts initWithDictionary:]([SUGSchemaSUGAggregateCounts alloc], "initWithDictionary:", v8);
      -[SUGSchemaSUGUserStatistics setTotalPreviousSuggestionsShown:](v5, "setTotalPreviousSuggestionsShown:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSiriHelpRequests"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SUGSchemaSUGAggregateCounts initWithDictionary:]([SUGSchemaSUGAggregateCounts alloc], "initWithDictionary:", v10);
      -[SUGSchemaSUGUserStatistics setTotalSiriHelpRequests:](v5, "setTotalSiriHelpRequests:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalUniqueSiriEventTypes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SUGSchemaSUGAggregateCounts initWithDictionary:]([SUGSchemaSUGAggregateCounts alloc], "initWithDictionary:", v12);
      -[SUGSchemaSUGUserStatistics setTotalUniqueSiriEventTypes:](v5, "setTotalUniqueSiriEventTypes:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTwoByThreeUser"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGUserStatistics setIsTwoByThreeUser:](v5, "setIsTwoByThreeUser:", objc_msgSend(v14, "BOOLValue"));
    v15 = v5;

  }
  return v5;
}

- (SUGSchemaSUGAggregateCounts)totalSiriRequests
{
  return self->_totalSiriRequests;
}

- (void)setTotalSiriRequests:(id)a3
{
  objc_storeStrong((id *)&self->_totalSiriRequests, a3);
}

- (SUGSchemaSUGAggregateCounts)totalPreviousSuggestionsShown
{
  return self->_totalPreviousSuggestionsShown;
}

- (void)setTotalPreviousSuggestionsShown:(id)a3
{
  objc_storeStrong((id *)&self->_totalPreviousSuggestionsShown, a3);
}

- (SUGSchemaSUGAggregateCounts)totalSiriHelpRequests
{
  return self->_totalSiriHelpRequests;
}

- (void)setTotalSiriHelpRequests:(id)a3
{
  objc_storeStrong((id *)&self->_totalSiriHelpRequests, a3);
}

- (SUGSchemaSUGAggregateCounts)totalUniqueSiriEventTypes
{
  return self->_totalUniqueSiriEventTypes;
}

- (void)setTotalUniqueSiriEventTypes:(id)a3
{
  objc_storeStrong((id *)&self->_totalUniqueSiriEventTypes, a3);
}

- (BOOL)isTwoByThreeUser
{
  return self->_isTwoByThreeUser;
}

- (void)setHasTotalSiriRequests:(BOOL)a3
{
  *(&self->_isTwoByThreeUser + 2) = a3;
}

- (void)setHasTotalPreviousSuggestionsShown:(BOOL)a3
{
  *(&self->_isTwoByThreeUser + 3) = a3;
}

- (void)setHasTotalSiriHelpRequests:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasTotalUniqueSiriEventTypes:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalUniqueSiriEventTypes, 0);
  objc_storeStrong((id *)&self->_totalSiriHelpRequests, 0);
  objc_storeStrong((id *)&self->_totalPreviousSuggestionsShown, 0);
  objc_storeStrong((id *)&self->_totalSiriRequests, 0);
}

@end

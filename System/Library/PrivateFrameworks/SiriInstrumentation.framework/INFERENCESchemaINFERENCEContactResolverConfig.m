@implementation INFERENCESchemaINFERENCEContactResolverConfig

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsSearchingFirstPartyContacts:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSearchingFirstPartyContacts = a3;
}

- (BOOL)hasIsSearchingFirstPartyContacts
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsSearchingFirstPartyContacts:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsSearchingFirstPartyContacts
{
  -[INFERENCESchemaINFERENCEContactResolverConfig setIsSearchingFirstPartyContacts:](self, "setIsSearchingFirstPartyContacts:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setContactSearchSuggestedType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_contactSearchSuggestedType = a3;
}

- (BOOL)hasContactSearchSuggestedType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasContactSearchSuggestedType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteContactSearchSuggestedType
{
  -[INFERENCESchemaINFERENCEContactResolverConfig setContactSearchSuggestedType:](self, "setContactSearchSuggestedType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setDomainsToSearchForHistory:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_domainsToSearchForHistory = a3;
}

- (BOOL)hasDomainsToSearchForHistory
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasDomainsToSearchForHistory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteDomainsToSearchForHistory
{
  -[INFERENCESchemaINFERENCEContactResolverConfig setDomainsToSearchForHistory:](self, "setDomainsToSearchForHistory:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setActionType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_actionType = a3;
}

- (BOOL)hasActionType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasActionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteActionType
{
  -[INFERENCESchemaINFERENCEContactResolverConfig setActionType:](self, "setActionType:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)clearAppBundleIds
{
  -[NSArray removeAllObjects](self->_appBundleIds, "removeAllObjects");
}

- (void)addAppBundleIds:(id)a3
{
  id v4;
  NSArray *appBundleIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  appBundleIds = self->_appBundleIds;
  v8 = v4;
  if (!appBundleIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_appBundleIds;
    self->_appBundleIds = v6;

    v4 = v8;
    appBundleIds = self->_appBundleIds;
  }
  -[NSArray addObject:](appBundleIds, "addObject:", v4);

}

- (unint64_t)appBundleIdsCount
{
  return -[NSArray count](self->_appBundleIds, "count");
}

- (id)appBundleIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_appBundleIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactResolverConfigReadFrom(self, (uint64_t)a3);
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_appBundleIds;
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
        PBDataWriterWriteStringField();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $9D597AAFD6F3F9600E35DFB3DDD0CBD1 has;
  unsigned int v6;
  int isSearchingFirstPartyContacts;
  int v8;
  int contactSearchSuggestedType;
  int v10;
  int domainsToSearchForHistory;
  int v12;
  int actionType;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isSearchingFirstPartyContacts = self->_isSearchingFirstPartyContacts;
    if (isSearchingFirstPartyContacts != objc_msgSend(v4, "isSearchingFirstPartyContacts"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      contactSearchSuggestedType = self->_contactSearchSuggestedType;
      if (contactSearchSuggestedType != objc_msgSend(v4, "contactSearchSuggestedType"))
        goto LABEL_22;
      has = self->_has;
      v6 = v4[32];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        domainsToSearchForHistory = self->_domainsToSearchForHistory;
        if (domainsToSearchForHistory != objc_msgSend(v4, "domainsToSearchForHistory"))
          goto LABEL_22;
        has = self->_has;
        v6 = v4[32];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (!v12 || (actionType = self->_actionType, actionType == objc_msgSend(v4, "actionType")))
        {
          -[INFERENCESchemaINFERENCEContactResolverConfig appBundleIds](self, "appBundleIds");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appBundleIds");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if ((v14 == 0) != (v15 != 0))
          {
            -[INFERENCESchemaINFERENCEContactResolverConfig appBundleIds](self, "appBundleIds");
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
            {

LABEL_25:
              v22 = 1;
              goto LABEL_23;
            }
            v18 = (void *)v17;
            -[INFERENCESchemaINFERENCEContactResolverConfig appBundleIds](self, "appBundleIds");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appBundleIds");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if ((v21 & 1) != 0)
              goto LABEL_25;
          }
          else
          {

          }
        }
      }
    }
  }
LABEL_22:
  v22 = 0;
LABEL_23:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_isSearchingFirstPartyContacts;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_contactSearchSuggestedType;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ -[NSArray hash](self->_appBundleIds, "hash");
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_domainsToSearchForHistory;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_actionType;
  return v3 ^ v2 ^ v4 ^ v5 ^ -[NSArray hash](self->_appBundleIds, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  unsigned int v11;
  const __CFString *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = -[INFERENCESchemaINFERENCEContactResolverConfig actionType](self, "actionType") - 1;
    if (v4 > 4)
      v5 = CFSTR("INFERENCECONTACTACTIONTYPE_UNKNOWN");
    else
      v5 = off_1E562FC00[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionType"));
  }
  if (self->_appBundleIds)
  {
    -[INFERENCESchemaINFERENCEContactResolverConfig appBundleIds](self, "appBundleIds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appBundleIds"));

  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_10;
LABEL_17:
    v13 = -[INFERENCESchemaINFERENCEContactResolverConfig domainsToSearchForHistory](self, "domainsToSearchForHistory")
        - 1;
    if (v13 > 2)
      v14 = CFSTR("INFERENCECONTACTRESOLUTIONDOMAIN_UNKNOWN");
    else
      v14 = off_1E562FC40[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("domainsToSearchForHistory"));
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_11;
    goto LABEL_12;
  }
  v11 = -[INFERENCESchemaINFERENCEContactResolverConfig contactSearchSuggestedType](self, "contactSearchSuggestedType")
      - 1;
  if (v11 > 2)
    v12 = CFSTR("INFERENCECONTACTSEARCHSUGGESTEDTYPE_UNKNOWN");
  else
    v12 = off_1E562FC28[v11];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("contactSearchSuggestedType"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_10:
  if ((has & 1) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactResolverConfig isSearchingFirstPartyContacts](self, "isSearchingFirstPartyContacts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isSearchingFirstPartyContacts"));

  }
LABEL_12:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEContactResolverConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEContactResolverConfig)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEContactResolverConfig *v5;
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
    self = -[INFERENCESchemaINFERENCEContactResolverConfig initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEContactResolverConfig)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEContactResolverConfig *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  INFERENCESchemaINFERENCEContactResolverConfig *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)INFERENCESchemaINFERENCEContactResolverConfig;
  v5 = -[INFERENCESchemaINFERENCEContactResolverConfig init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSearchingFirstPartyContacts"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactResolverConfig setIsSearchingFirstPartyContacts:](v5, "setIsSearchingFirstPartyContacts:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSearchSuggestedType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactResolverConfig setContactSearchSuggestedType:](v5, "setContactSearchSuggestedType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainsToSearchForHistory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactResolverConfig setDomainsToSearchForHistory:](v5, "setDomainsToSearchForHistory:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactResolverConfig setActionType:](v5, "setActionType:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleIds"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v8;
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = (void *)objc_msgSend(v16, "copy");
              -[INFERENCESchemaINFERENCEContactResolverConfig addAppBundleIds:](v5, "addAppBundleIds:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      v6 = v21;
      v8 = v20;
    }
    v18 = v5;

  }
  return v5;
}

- (BOOL)isSearchingFirstPartyContacts
{
  return self->_isSearchingFirstPartyContacts;
}

- (int)contactSearchSuggestedType
{
  return self->_contactSearchSuggestedType;
}

- (int)domainsToSearchForHistory
{
  return self->_domainsToSearchForHistory;
}

- (int)actionType
{
  return self->_actionType;
}

- (NSArray)appBundleIds
{
  return self->_appBundleIds;
}

- (void)setAppBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIds, 0);
}

@end

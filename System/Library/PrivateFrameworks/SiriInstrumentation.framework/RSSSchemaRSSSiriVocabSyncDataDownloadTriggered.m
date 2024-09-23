@implementation RSSSchemaRSSSiriVocabSyncDataDownloadTriggered

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setTrigger:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_trigger = a3;
}

- (BOOL)hasTrigger
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTrigger:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTrigger
{
  -[RSSSchemaRSSSiriVocabSyncDataDownloadTriggered setTrigger:](self, "setTrigger:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSyncData:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_syncData = a3;
}

- (BOOL)hasSyncData
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSyncData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSyncData
{
  -[RSSSchemaRSSSiriVocabSyncDataDownloadTriggered setSyncData:](self, "setSyncData:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return RSSSchemaRSSSiriVocabSyncDataDownloadTriggeredReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $80AE6B48C795B849683B4F4A30E137BD has;
  unsigned int v6;
  int trigger;
  int v8;
  int syncData;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    trigger = self->_trigger;
    if (trigger != objc_msgSend(v4, "trigger"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    syncData = self->_syncData;
    if (syncData != objc_msgSend(v4, "syncData"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_trigger;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_syncData;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[RSSSchemaRSSSiriVocabSyncDataDownloadTriggered syncData](self, "syncData") - 1;
    if (v5 > 2)
      v6 = CFSTR("RSSSIRIVOCABSYNCDATA_UNKNOWN");
    else
      v6 = off_1E56338C0[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("syncData"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v7 = -[RSSSchemaRSSSiriVocabSyncDataDownloadTriggered trigger](self, "trigger") - 1;
    if (v7 > 5)
      v8 = CFSTR("RSSSIRIVOCABSYNCDATADOWNLOADTRIGGER_UNKNOWN");
    else
      v8 = off_1E56338D8[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("trigger"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RSSSchemaRSSSiriVocabSyncDataDownloadTriggered dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RSSSchemaRSSSiriVocabSyncDataDownloadTriggered)initWithJSON:(id)a3
{
  void *v4;
  RSSSchemaRSSSiriVocabSyncDataDownloadTriggered *v5;
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
    self = -[RSSSchemaRSSSiriVocabSyncDataDownloadTriggered initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RSSSchemaRSSSiriVocabSyncDataDownloadTriggered)initWithDictionary:(id)a3
{
  id v4;
  RSSSchemaRSSSiriVocabSyncDataDownloadTriggered *v5;
  void *v6;
  void *v7;
  RSSSchemaRSSSiriVocabSyncDataDownloadTriggered *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RSSSchemaRSSSiriVocabSyncDataDownloadTriggered;
  v5 = -[RSSSchemaRSSSiriVocabSyncDataDownloadTriggered init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RSSSchemaRSSSiriVocabSyncDataDownloadTriggered setTrigger:](v5, "setTrigger:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RSSSchemaRSSSiriVocabSyncDataDownloadTriggered setSyncData:](v5, "setSyncData:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (int)trigger
{
  return self->_trigger;
}

- (int)syncData
{
  return self->_syncData;
}

@end

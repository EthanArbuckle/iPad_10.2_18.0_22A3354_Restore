@implementation FLOWSchemaFLOWMediaPlayerPlaybackContext

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
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FLOWSchemaFLOWMediaPlayerPlaybackContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext deleteLinkId](self, "deleteLinkId");
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext radioStationContext](self, "radioStationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext deleteRadioStationContext](self, "deleteRadioStationContext");
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext playlistContext](self, "playlistContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext deletePlaylistContext](self, "deletePlaylistContext");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext setLinkId:](self, "setLinkId:", 0);
}

- (void)setExecutionSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_executionSource = a3;
}

- (BOOL)hasExecutionSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExecutionSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExecutionSource
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext setExecutionSource:](self, "setExecutionSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEndpoint:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endpoint = a3;
}

- (BOOL)hasEndpoint
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEndpoint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEndpoint
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext setEndpoint:](self, "setEndpoint:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setContentSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_contentSource = a3;
}

- (BOOL)hasContentSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasContentSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteContentSource
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext setContentSource:](self, "setContentSource:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setRadioStationContext:(id)a3
{
  FLOWSchemaFLOWMediaPlayerRadioStationContext *v4;
  FLOWSchemaFLOWMediaPlayerPlaylistContext *playlistContext;
  unint64_t v6;
  FLOWSchemaFLOWMediaPlayerRadioStationContext *radioStationContext;

  v4 = (FLOWSchemaFLOWMediaPlayerRadioStationContext *)a3;
  playlistContext = self->_playlistContext;
  self->_playlistContext = 0;

  v6 = 5;
  if (!v4)
    v6 = 0;
  self->_whichContenttype = v6;
  radioStationContext = self->_radioStationContext;
  self->_radioStationContext = v4;

}

- (FLOWSchemaFLOWMediaPlayerRadioStationContext)radioStationContext
{
  if (self->_whichContenttype == 5)
    return self->_radioStationContext;
  else
    return (FLOWSchemaFLOWMediaPlayerRadioStationContext *)0;
}

- (void)deleteRadioStationContext
{
  FLOWSchemaFLOWMediaPlayerRadioStationContext *radioStationContext;

  if (self->_whichContenttype == 5)
  {
    self->_whichContenttype = 0;
    radioStationContext = self->_radioStationContext;
    self->_radioStationContext = 0;

  }
}

- (void)setPlaylistContext:(id)a3
{
  FLOWSchemaFLOWMediaPlayerPlaylistContext *v4;
  FLOWSchemaFLOWMediaPlayerRadioStationContext *radioStationContext;
  unint64_t v6;
  FLOWSchemaFLOWMediaPlayerPlaylistContext *playlistContext;

  v4 = (FLOWSchemaFLOWMediaPlayerPlaylistContext *)a3;
  radioStationContext = self->_radioStationContext;
  self->_radioStationContext = 0;

  v6 = 6;
  if (!v4)
    v6 = 0;
  self->_whichContenttype = v6;
  playlistContext = self->_playlistContext;
  self->_playlistContext = v4;

}

- (FLOWSchemaFLOWMediaPlayerPlaylistContext)playlistContext
{
  if (self->_whichContenttype == 6)
    return self->_playlistContext;
  else
    return (FLOWSchemaFLOWMediaPlayerPlaylistContext *)0;
}

- (void)deletePlaylistContext
{
  FLOWSchemaFLOWMediaPlayerPlaylistContext *playlistContext;

  if (self->_whichContenttype == 6)
  {
    self->_whichContenttype = 0;
    playlistContext = self->_playlistContext;
    self->_playlistContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMediaPlayerPlaybackContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext radioStationContext](self, "radioStationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext radioStationContext](self, "radioStationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext playlistContext](self, "playlistContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v9)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext playlistContext](self, "playlistContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unint64_t whichContenttype;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $4C2FACFD8AC9B4E7D7283709BAE8166B has;
  unsigned int v14;
  int executionSource;
  int v16;
  int endpoint;
  int v18;
  int contentSource;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  BOOL v30;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  whichContenttype = self->_whichContenttype;
  if (whichContenttype != objc_msgSend(v4, "whichContenttype"))
    goto LABEL_29;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_28;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext linkId](self, "linkId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext linkId](self, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_29;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
    goto LABEL_29;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    executionSource = self->_executionSource;
    if (executionSource != objc_msgSend(v4, "executionSource"))
      goto LABEL_29;
    has = self->_has;
    v14 = v4[48];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_29;
  if (v16)
  {
    endpoint = self->_endpoint;
    if (endpoint != objc_msgSend(v4, "endpoint"))
      goto LABEL_29;
    has = self->_has;
    v14 = v4[48];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_29;
  if (v18)
  {
    contentSource = self->_contentSource;
    if (contentSource != objc_msgSend(v4, "contentSource"))
      goto LABEL_29;
  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext radioStationContext](self, "radioStationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "radioStationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_28;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext radioStationContext](self, "radioStationContext");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext radioStationContext](self, "radioStationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "radioStationContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_29;
  }
  else
  {

  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext playlistContext](self, "playlistContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playlistContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext playlistContext](self, "playlistContext");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {

LABEL_32:
    v30 = 1;
    goto LABEL_30;
  }
  v26 = (void *)v25;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContext playlistContext](self, "playlistContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playlistContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqual:", v28);

  if ((v29 & 1) != 0)
    goto LABEL_32;
LABEL_29:
  v30 = 0;
LABEL_30:

  return v30;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v4 = 2654435761 * self->_executionSource;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_endpoint;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_contentSource;
LABEL_8:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[FLOWSchemaFLOWMediaPlayerRadioStationContext hash](self->_radioStationContext, "hash");
  return v7 ^ -[FLOWSchemaFLOWMediaPlayerPlaylistContext hash](self->_playlistContext, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = -[FLOWSchemaFLOWMediaPlayerPlaybackContext contentSource](self, "contentSource");
    v6 = CFSTR("FLOWMEDIAPLAYERCONTENTSOURCE_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("FLOWMEDIAPLAYERCONTENTSOURCE_LIBRARY");
    if (v5 == 2)
      v7 = CFSTR("FLOWMEDIAPLAYERCONTENTSOURCE_CATALOG");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("contentSource"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_19;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = -[FLOWSchemaFLOWMediaPlayerPlaybackContext endpoint](self, "endpoint") - 1;
  if (v8 > 6)
    v9 = CFSTR("FLOWMEDIAPLAYERENDPOINT_UNKNOWN");
  else
    v9 = off_1E562E5C8[v8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("endpoint"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_15:
    v10 = -[FLOWSchemaFLOWMediaPlayerPlaybackContext executionSource](self, "executionSource") - 1;
    if (v10 > 3)
      v11 = CFSTR("FLOWMEDIAPLAYERCHOSENEXECUTIONSOURCE_UNKNOWN");
    else
      v11 = off_1E562E600[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("executionSource"));
  }
LABEL_19:
  if (self->_linkId)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext linkId](self, "linkId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("linkId"));

    }
  }
  if (self->_playlistContext)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext playlistContext](self, "playlistContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("playlistContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("playlistContext"));

    }
  }
  if (self->_radioStationContext)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContext radioStationContext](self, "radioStationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("radioStationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("radioStationContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWMediaPlayerPlaybackContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWMediaPlayerPlaybackContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWMediaPlayerPlaybackContext *v5;
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
    self = -[FLOWSchemaFLOWMediaPlayerPlaybackContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWMediaPlayerPlaybackContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWMediaPlayerPlaybackContext *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FLOWSchemaFLOWMediaPlayerRadioStationContext *v12;
  void *v13;
  FLOWSchemaFLOWMediaPlayerPlaylistContext *v14;
  FLOWSchemaFLOWMediaPlayerPlaybackContext *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FLOWSchemaFLOWMediaPlayerPlaybackContext;
  v5 = -[FLOWSchemaFLOWMediaPlayerPlaybackContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWMediaPlayerPlaybackContext setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerPlaybackContext setExecutionSource:](v5, "setExecutionSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpoint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerPlaybackContext setEndpoint:](v5, "setEndpoint:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerPlaybackContext setContentSource:](v5, "setContentSource:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("radioStationContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[FLOWSchemaFLOWMediaPlayerRadioStationContext initWithDictionary:]([FLOWSchemaFLOWMediaPlayerRadioStationContext alloc], "initWithDictionary:", v11);
      -[FLOWSchemaFLOWMediaPlayerPlaybackContext setRadioStationContext:](v5, "setRadioStationContext:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playlistContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[FLOWSchemaFLOWMediaPlayerPlaylistContext initWithDictionary:]([FLOWSchemaFLOWMediaPlayerPlaylistContext alloc], "initWithDictionary:", v13);
      -[FLOWSchemaFLOWMediaPlayerPlaybackContext setPlaylistContext:](v5, "setPlaylistContext:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (unint64_t)whichContenttype
{
  return self->_whichContenttype;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (int)executionSource
{
  return self->_executionSource;
}

- (int)endpoint
{
  return self->_endpoint;
}

- (int)contentSource
{
  return self->_contentSource;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasRadioStationContext
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasRadioStationContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasPlaylistContext
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasPlaylistContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistContext, 0);
  objc_storeStrong((id *)&self->_radioStationContext, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end

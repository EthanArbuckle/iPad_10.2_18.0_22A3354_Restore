@implementation PEGASUSSchemaPEGASUSRequestEnded

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
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PEGASUSSchemaPEGASUSRequestEnded;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v34, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSRequestEnded linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSRequestEnded deleteLinkId](self, "deleteLinkId");
  -[PEGASUSSchemaPEGASUSRequestEnded intent](self, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PEGASUSSchemaPEGASUSRequestEnded deleteIntent](self, "deleteIntent");
  -[PEGASUSSchemaPEGASUSRequestEnded crossIntentRankerResponse](self, "crossIntentRankerResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PEGASUSSchemaPEGASUSRequestEnded deleteCrossIntentRankerResponse](self, "deleteCrossIntentRankerResponse");
  -[PEGASUSSchemaPEGASUSRequestEnded kgQAExecution](self, "kgQAExecution");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PEGASUSSchemaPEGASUSRequestEnded deleteKgQAExecution](self, "deleteKgQAExecution");
  -[PEGASUSSchemaPEGASUSRequestEnded webAnswerExecution](self, "webAnswerExecution");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PEGASUSSchemaPEGASUSRequestEnded deleteWebAnswerExecution](self, "deleteWebAnswerExecution");
  -[PEGASUSSchemaPEGASUSRequestEnded sportsExecution](self, "sportsExecution");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PEGASUSSchemaPEGASUSRequestEnded deleteSportsExecution](self, "deleteSportsExecution");
  -[PEGASUSSchemaPEGASUSRequestEnded mapsExecution](self, "mapsExecution");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PEGASUSSchemaPEGASUSRequestEnded deleteMapsExecution](self, "deleteMapsExecution");
  -[PEGASUSSchemaPEGASUSRequestEnded audioExecution](self, "audioExecution");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PEGASUSSchemaPEGASUSRequestEnded deleteAudioExecution](self, "deleteAudioExecution");
  -[PEGASUSSchemaPEGASUSRequestEnded videoExecution](self, "videoExecution");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[PEGASUSSchemaPEGASUSRequestEnded deleteVideoExecution](self, "deleteVideoExecution");

  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[PEGASUSSchemaPEGASUSRequestEnded setExists:](self, "setExists:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[PEGASUSSchemaPEGASUSRequestEnded setLinkId:](self, "setLinkId:", 0);
}

- (void)setProductArea:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_productArea = a3;
}

- (BOOL)hasProductArea
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasProductArea:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteProductArea
{
  -[PEGASUSSchemaPEGASUSRequestEnded setProductArea:](self, "setProductArea:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPrimaryProvider:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_primaryProvider = a3;
}

- (BOOL)hasPrimaryProvider
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPrimaryProvider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePrimaryProvider
{
  -[PEGASUSSchemaPEGASUSRequestEnded setPrimaryProvider:](self, "setPrimaryProvider:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)clearOtherProviders
{
  -[NSArray removeAllObjects](self->_otherProviders, "removeAllObjects");
}

- (void)addOtherProviders:(int)a3
{
  uint64_t v3;
  NSArray *otherProviders;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  otherProviders = self->_otherProviders;
  if (!otherProviders)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_otherProviders;
    self->_otherProviders = v6;

    otherProviders = self->_otherProviders;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](otherProviders, "addObject:", v8);

}

- (unint64_t)otherProvidersCount
{
  return -[NSArray count](self->_otherProviders, "count");
}

- (int)otherProvidersAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_otherProviders, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)hasIntent
{
  return self->_intent != 0;
}

- (void)deleteIntent
{
  -[PEGASUSSchemaPEGASUSRequestEnded setIntent:](self, "setIntent:", 0);
}

- (void)setQueryConfidenceScore:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_queryConfidenceScore = a3;
}

- (BOOL)hasQueryConfidenceScore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasQueryConfidenceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteQueryConfidenceScore
{
  double v2;

  LODWORD(v2) = 0;
  -[PEGASUSSchemaPEGASUSRequestEnded setQueryConfidenceScore:](self, "setQueryConfidenceScore:", v2);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setIsFollowupResponse:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isFollowupResponse = a3;
}

- (BOOL)hasIsFollowupResponse
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsFollowupResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIsFollowupResponse
{
  -[PEGASUSSchemaPEGASUSRequestEnded setIsFollowupResponse:](self, "setIsFollowupResponse:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIsHandOffExecution:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isHandOffExecution = a3;
}

- (BOOL)hasIsHandOffExecution
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsHandOffExecution:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsHandOffExecution
{
  -[PEGASUSSchemaPEGASUSRequestEnded setIsHandOffExecution:](self, "setIsHandOffExecution:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)hasCrossIntentRankerResponse
{
  return self->_crossIntentRankerResponse != 0;
}

- (void)deleteCrossIntentRankerResponse
{
  -[PEGASUSSchemaPEGASUSRequestEnded setCrossIntentRankerResponse:](self, "setCrossIntentRankerResponse:", 0);
}

- (BOOL)hasKgQAExecution
{
  return self->_kgQAExecution != 0;
}

- (void)deleteKgQAExecution
{
  -[PEGASUSSchemaPEGASUSRequestEnded setKgQAExecution:](self, "setKgQAExecution:", 0);
}

- (BOOL)hasWebAnswerExecution
{
  return self->_webAnswerExecution != 0;
}

- (void)deleteWebAnswerExecution
{
  -[PEGASUSSchemaPEGASUSRequestEnded setWebAnswerExecution:](self, "setWebAnswerExecution:", 0);
}

- (BOOL)hasSportsExecution
{
  return self->_sportsExecution != 0;
}

- (void)deleteSportsExecution
{
  -[PEGASUSSchemaPEGASUSRequestEnded setSportsExecution:](self, "setSportsExecution:", 0);
}

- (BOOL)hasMapsExecution
{
  return self->_mapsExecution != 0;
}

- (void)deleteMapsExecution
{
  -[PEGASUSSchemaPEGASUSRequestEnded setMapsExecution:](self, "setMapsExecution:", 0);
}

- (BOOL)hasAudioExecution
{
  return self->_audioExecution != 0;
}

- (void)deleteAudioExecution
{
  -[PEGASUSSchemaPEGASUSRequestEnded setAudioExecution:](self, "setAudioExecution:", 0);
}

- (BOOL)hasVideoExecution
{
  return self->_videoExecution != 0;
}

- (void)deleteVideoExecution
{
  -[PEGASUSSchemaPEGASUSRequestEnded setVideoExecution:](self, "setVideoExecution:", 0);
}

- (BOOL)hasEdge
{
  return self->_edge != 0;
}

- (void)deleteEdge
{
  -[PEGASUSSchemaPEGASUSRequestEnded setEdge:](self, "setEdge:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return PEGASUSSchemaPEGASUSRequestEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char has;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[PEGASUSSchemaPEGASUSRequestEnded linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_otherProviders;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "intValue", (_QWORD)v31);
        PBDataWriterWriteInt32Field();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }

  -[PEGASUSSchemaPEGASUSRequestEnded intent](self, "intent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded intent](self, "intent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    v15 = (char)self->_has;
    if ((v15 & 0x10) == 0)
    {
LABEL_20:
      if ((v15 & 0x20) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_21:
    PBDataWriterWriteBOOLField();
LABEL_22:
  -[PEGASUSSchemaPEGASUSRequestEnded crossIntentRankerResponse](self, "crossIntentRankerResponse", (_QWORD)v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded crossIntentRankerResponse](self, "crossIntentRankerResponse");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEnded kgQAExecution](self, "kgQAExecution");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded kgQAExecution](self, "kgQAExecution");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEnded webAnswerExecution](self, "webAnswerExecution");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded webAnswerExecution](self, "webAnswerExecution");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEnded sportsExecution](self, "sportsExecution");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded sportsExecution](self, "sportsExecution");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEnded mapsExecution](self, "mapsExecution");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded mapsExecution](self, "mapsExecution");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEnded audioExecution](self, "audioExecution");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded audioExecution](self, "audioExecution");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEnded videoExecution](self, "videoExecution");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded videoExecution](self, "videoExecution");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEnded edge](self, "edge");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int exists;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $285E0531C3214886A99F6AD27F2CA4D6 has;
  int v14;
  unsigned int v15;
  int productArea;
  int v17;
  int primaryProvider;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  $285E0531C3214886A99F6AD27F2CA4D6 v29;
  int v30;
  unsigned int v31;
  float queryConfidenceScore;
  float v33;
  int v34;
  int isFollowupResponse;
  int v36;
  int isHandOffExecution;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  BOOL v78;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_78;
  if ((*(_BYTE *)&self->_has & 1) != (v4[120] & 1))
    goto LABEL_78;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_78;
  }
  -[PEGASUSSchemaPEGASUSRequestEnded linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded linkId](self, "linkId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PEGASUSSchemaPEGASUSRequestEnded linkId](self, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_78;
  }
  else
  {

  }
  has = self->_has;
  v14 = (*(unsigned int *)&has >> 1) & 1;
  v15 = v4[120];
  if (v14 != ((v15 >> 1) & 1))
    goto LABEL_78;
  if (v14)
  {
    productArea = self->_productArea;
    if (productArea != objc_msgSend(v4, "productArea"))
      goto LABEL_78;
    has = self->_has;
    v15 = v4[120];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v15 >> 2) & 1))
    goto LABEL_78;
  if (v17)
  {
    primaryProvider = self->_primaryProvider;
    if (primaryProvider != objc_msgSend(v4, "primaryProvider"))
      goto LABEL_78;
  }
  -[PEGASUSSchemaPEGASUSRequestEnded otherProviders](self, "otherProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded otherProviders](self, "otherProviders");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[PEGASUSSchemaPEGASUSRequestEnded otherProviders](self, "otherProviders");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "otherProviders");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_78;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEnded intent](self, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded intent](self, "intent");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[PEGASUSSchemaPEGASUSRequestEnded intent](self, "intent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_78;
  }
  else
  {

  }
  v29 = self->_has;
  v30 = (*(unsigned int *)&v29 >> 3) & 1;
  v31 = v4[120];
  if (v30 != ((v31 >> 3) & 1))
    goto LABEL_78;
  if (v30)
  {
    queryConfidenceScore = self->_queryConfidenceScore;
    objc_msgSend(v4, "queryConfidenceScore");
    if (queryConfidenceScore != v33)
      goto LABEL_78;
    v29 = self->_has;
    v31 = v4[120];
  }
  v34 = (*(unsigned int *)&v29 >> 4) & 1;
  if (v34 != ((v31 >> 4) & 1))
    goto LABEL_78;
  if (v34)
  {
    isFollowupResponse = self->_isFollowupResponse;
    if (isFollowupResponse != objc_msgSend(v4, "isFollowupResponse"))
      goto LABEL_78;
    v29 = self->_has;
    v31 = v4[120];
  }
  v36 = (*(unsigned int *)&v29 >> 5) & 1;
  if (v36 != ((v31 >> 5) & 1))
    goto LABEL_78;
  if (v36)
  {
    isHandOffExecution = self->_isHandOffExecution;
    if (isHandOffExecution != objc_msgSend(v4, "isHandOffExecution"))
      goto LABEL_78;
  }
  -[PEGASUSSchemaPEGASUSRequestEnded crossIntentRankerResponse](self, "crossIntentRankerResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crossIntentRankerResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded crossIntentRankerResponse](self, "crossIntentRankerResponse");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[PEGASUSSchemaPEGASUSRequestEnded crossIntentRankerResponse](self, "crossIntentRankerResponse");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crossIntentRankerResponse");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_78;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEnded kgQAExecution](self, "kgQAExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kgQAExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded kgQAExecution](self, "kgQAExecution");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[PEGASUSSchemaPEGASUSRequestEnded kgQAExecution](self, "kgQAExecution");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kgQAExecution");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_78;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEnded webAnswerExecution](self, "webAnswerExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webAnswerExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded webAnswerExecution](self, "webAnswerExecution");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[PEGASUSSchemaPEGASUSRequestEnded webAnswerExecution](self, "webAnswerExecution");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webAnswerExecution");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_78;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEnded sportsExecution](self, "sportsExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sportsExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded sportsExecution](self, "sportsExecution");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[PEGASUSSchemaPEGASUSRequestEnded sportsExecution](self, "sportsExecution");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sportsExecution");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_78;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEnded mapsExecution](self, "mapsExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded mapsExecution](self, "mapsExecution");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[PEGASUSSchemaPEGASUSRequestEnded mapsExecution](self, "mapsExecution");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsExecution");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_78;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEnded audioExecution](self, "audioExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded audioExecution](self, "audioExecution");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[PEGASUSSchemaPEGASUSRequestEnded audioExecution](self, "audioExecution");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioExecution");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_78;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEnded videoExecution](self, "videoExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_77;
  -[PEGASUSSchemaPEGASUSRequestEnded videoExecution](self, "videoExecution");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[PEGASUSSchemaPEGASUSRequestEnded videoExecution](self, "videoExecution");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoExecution");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_78;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEnded edge](self, "edge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "edge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_77:

    goto LABEL_78;
  }
  -[PEGASUSSchemaPEGASUSRequestEnded edge](self, "edge");
  v73 = objc_claimAutoreleasedReturnValue();
  if (!v73)
  {

LABEL_81:
    v78 = 1;
    goto LABEL_79;
  }
  v74 = (void *)v73;
  -[PEGASUSSchemaPEGASUSRequestEnded edge](self, "edge");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "edge");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v75, "isEqual:", v76);

  if ((v77 & 1) != 0)
    goto LABEL_81;
LABEL_78:
  v78 = 0;
LABEL_79:

  return v78;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char has;
  unint64_t v10;
  float queryConfidenceScore;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  v4 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_productArea;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_primaryProvider;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  v7 = -[NSArray hash](self->_otherProviders, "hash");
  v8 = -[PEGASUSSchemaPEGASUSIntent hash](self->_intent, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    queryConfidenceScore = self->_queryConfidenceScore;
    v12 = queryConfidenceScore;
    if (queryConfidenceScore < 0.0)
      v12 = -queryConfidenceScore;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 0x10) != 0)
  {
    v15 = 2654435761 * self->_isFollowupResponse;
    if ((has & 0x20) != 0)
      goto LABEL_19;
LABEL_21:
    v16 = 0;
    goto LABEL_22;
  }
  v15 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_21;
LABEL_19:
  v16 = 2654435761 * self->_isHandOffExecution;
LABEL_22:
  v17 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15;
  v18 = v16 ^ -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse hash](self->_crossIntentRankerResponse, "hash");
  v19 = v18 ^ -[PEGASUSSchemaPEGASUSKGQAExecution hash](self->_kgQAExecution, "hash");
  v20 = v17 ^ v19 ^ -[PEGASUSSchemaPEGASUSWebAnswerExecution hash](self->_webAnswerExecution, "hash");
  v21 = -[PEGASUSSchemaPEGASUSSportsExecution hash](self->_sportsExecution, "hash");
  v22 = v21 ^ -[PEGASUSSchemaPEGASUSMapsExecution hash](self->_mapsExecution, "hash");
  v23 = v22 ^ -[PEGASUSSchemaPEGASUSAudioExecution hash](self->_audioExecution, "hash");
  v24 = v23 ^ -[PEGASUSSchemaPEGASUSVideoExecution hash](self->_videoExecution, "hash");
  return v20 ^ v24 ^ -[NSString hash](self->_edge, "hash");
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
  char has;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioExecution)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded audioExecution](self, "audioExecution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioExecution"));

    }
  }
  if (self->_crossIntentRankerResponse)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded crossIntentRankerResponse](self, "crossIntentRankerResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("crossIntentRankerResponse"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("crossIntentRankerResponse"));

    }
  }
  if (self->_edge)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded edge](self, "edge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("edge"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSRequestEnded exists](self, "exists"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("exists"));

  }
  if (self->_intent)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded intent](self, "intent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("intent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("intent"));

    }
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSRequestEnded isFollowupResponse](self, "isFollowupResponse"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isFollowupResponse"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSRequestEnded isHandOffExecution](self, "isHandOffExecution"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isHandOffExecution"));

  }
  if (self->_kgQAExecution)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded kgQAExecution](self, "kgQAExecution");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("kgQAExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("kgQAExecution"));

    }
  }
  if (self->_linkId)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded linkId](self, "linkId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("linkId"));

    }
  }
  if (self->_mapsExecution)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded mapsExecution](self, "mapsExecution");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("mapsExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("mapsExecution"));

    }
  }
  if (-[NSArray count](self->_otherProviders, "count"))
  {
    -[PEGASUSSchemaPEGASUSRequestEnded otherProviders](self, "otherProviders");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("otherProviders"));

  }
  v30 = (char)self->_has;
  if ((v30 & 4) != 0)
  {
    v35 = -[PEGASUSSchemaPEGASUSRequestEnded primaryProvider](self, "primaryProvider") - 1;
    if (v35 > 0xF)
      v36 = CFSTR("PEGASUSPROVIDER_UNKNOWN");
    else
      v36 = off_1E5632908[v35];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("primaryProvider"));
    v30 = (char)self->_has;
    if ((v30 & 2) == 0)
    {
LABEL_43:
      if ((v30 & 8) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_43;
  }
  v40 = -[PEGASUSSchemaPEGASUSRequestEnded productArea](self, "productArea") - 1;
  if (v40 > 0xE)
    v41 = CFSTR("PEGASUSPRODUCTAREA_UNKNOWN");
  else
    v41 = off_1E5632988[v40];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("productArea"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_44:
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[PEGASUSSchemaPEGASUSRequestEnded queryConfidenceScore](self, "queryConfidenceScore");
    objc_msgSend(v31, "numberWithFloat:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("queryConfidenceScore"));

  }
LABEL_45:
  if (self->_sportsExecution)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded sportsExecution](self, "sportsExecution");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("sportsExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("sportsExecution"));

    }
  }
  if (self->_videoExecution)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded videoExecution](self, "videoExecution");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("videoExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("videoExecution"));

    }
  }
  if (self->_webAnswerExecution)
  {
    -[PEGASUSSchemaPEGASUSRequestEnded webAnswerExecution](self, "webAnswerExecution");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("webAnswerExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("webAnswerExecution"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSRequestEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSRequestEnded)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSRequestEnded *v5;
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
    self = -[PEGASUSSchemaPEGASUSRequestEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSRequestEnded)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSRequestEnded *v5;
  void *v6;
  void *v7;
  SISchemaUUID *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  PEGASUSSchemaPEGASUSIntent *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PEGASUSSchemaPEGASUSCrossIntentRankerResponse *v26;
  uint64_t v27;
  PEGASUSSchemaPEGASUSKGQAExecution *v28;
  uint64_t v29;
  PEGASUSSchemaPEGASUSWebAnswerExecution *v30;
  void *v31;
  PEGASUSSchemaPEGASUSSportsExecution *v32;
  void *v33;
  PEGASUSSchemaPEGASUSMapsExecution *v34;
  void *v35;
  PEGASUSSchemaPEGASUSAudioExecution *v36;
  void *v37;
  PEGASUSSchemaPEGASUSVideoExecution *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  PEGASUSSchemaPEGASUSRequestEnded *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PEGASUSSchemaPEGASUSRequestEnded;
  v5 = -[PEGASUSSchemaPEGASUSRequestEnded init](&v59, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSRequestEnded setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v7);
      -[PEGASUSSchemaPEGASUSRequestEnded setLinkId:](v5, "setLinkId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productArea"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSRequestEnded setProductArea:](v5, "setProductArea:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSRequestEnded setPrimaryProvider:](v5, "setPrimaryProvider:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("otherProviders"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v7;
      v13 = v6;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v56 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[PEGASUSSchemaPEGASUSRequestEnded addOtherProviders:](v5, "addOtherProviders:", objc_msgSend(v19, "intValue"));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        }
        while (v16);
      }

      v6 = v13;
      v7 = v12;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intent"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PEGASUSSchemaPEGASUSIntent initWithDictionary:]([PEGASUSSchemaPEGASUSIntent alloc], "initWithDictionary:", v20);
      -[PEGASUSSchemaPEGASUSRequestEnded setIntent:](v5, "setIntent:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryConfidenceScore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "floatValue");
      -[PEGASUSSchemaPEGASUSRequestEnded setQueryConfidenceScore:](v5, "setQueryConfidenceScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFollowupResponse"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSRequestEnded setIsFollowupResponse:](v5, "setIsFollowupResponse:", objc_msgSend(v23, "BOOLValue"));
    v50 = v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHandOffExecution"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSRequestEnded setIsHandOffExecution:](v5, "setIsHandOffExecution:", objc_msgSend(v24, "BOOLValue"));
    v48 = v24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crossIntentRankerResponse"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse initWithDictionary:]([PEGASUSSchemaPEGASUSCrossIntentRankerResponse alloc], "initWithDictionary:", v25);
      -[PEGASUSSchemaPEGASUSRequestEnded setCrossIntentRankerResponse:](v5, "setCrossIntentRankerResponse:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kgQAExecution"));
    v27 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[PEGASUSSchemaPEGASUSKGQAExecution initWithDictionary:]([PEGASUSSchemaPEGASUSKGQAExecution alloc], "initWithDictionary:", v27);
      -[PEGASUSSchemaPEGASUSRequestEnded setKgQAExecution:](v5, "setKgQAExecution:", v28);

    }
    v51 = (void *)v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("webAnswerExecution"));
    v29 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[PEGASUSSchemaPEGASUSWebAnswerExecution initWithDictionary:]([PEGASUSSchemaPEGASUSWebAnswerExecution alloc], "initWithDictionary:", v29);
      -[PEGASUSSchemaPEGASUSRequestEnded setWebAnswerExecution:](v5, "setWebAnswerExecution:", v30);

    }
    v49 = v23;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsExecution"), v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[PEGASUSSchemaPEGASUSSportsExecution initWithDictionary:]([PEGASUSSchemaPEGASUSSportsExecution alloc], "initWithDictionary:", v31);
      -[PEGASUSSchemaPEGASUSRequestEnded setSportsExecution:](v5, "setSportsExecution:", v32);

    }
    v46 = (void *)v27;
    v47 = (void *)v25;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsExecution"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[PEGASUSSchemaPEGASUSMapsExecution initWithDictionary:]([PEGASUSSchemaPEGASUSMapsExecution alloc], "initWithDictionary:", v33);
      -[PEGASUSSchemaPEGASUSRequestEnded setMapsExecution:](v5, "setMapsExecution:", v34);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioExecution"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = -[PEGASUSSchemaPEGASUSAudioExecution initWithDictionary:]([PEGASUSSchemaPEGASUSAudioExecution alloc], "initWithDictionary:", v35);
      -[PEGASUSSchemaPEGASUSRequestEnded setAudioExecution:](v5, "setAudioExecution:", v36);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoExecution"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[PEGASUSSchemaPEGASUSVideoExecution initWithDictionary:]([PEGASUSSchemaPEGASUSVideoExecution alloc], "initWithDictionary:", v37);
      -[PEGASUSSchemaPEGASUSRequestEnded setVideoExecution:](v5, "setVideoExecution:", v38);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("edge"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v7;
      v41 = v6;
      v42 = (void *)objc_msgSend(v39, "copy");
      -[PEGASUSSchemaPEGASUSRequestEnded setEdge:](v5, "setEdge:", v42);

      v6 = v41;
      v7 = v40;
    }
    v43 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (int)productArea
{
  return self->_productArea;
}

- (int)primaryProvider
{
  return self->_primaryProvider;
}

- (NSArray)otherProviders
{
  return self->_otherProviders;
}

- (void)setOtherProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PEGASUSSchemaPEGASUSIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (float)queryConfidenceScore
{
  return self->_queryConfidenceScore;
}

- (BOOL)isFollowupResponse
{
  return self->_isFollowupResponse;
}

- (BOOL)isHandOffExecution
{
  return self->_isHandOffExecution;
}

- (PEGASUSSchemaPEGASUSCrossIntentRankerResponse)crossIntentRankerResponse
{
  return self->_crossIntentRankerResponse;
}

- (void)setCrossIntentRankerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_crossIntentRankerResponse, a3);
}

- (PEGASUSSchemaPEGASUSKGQAExecution)kgQAExecution
{
  return self->_kgQAExecution;
}

- (void)setKgQAExecution:(id)a3
{
  objc_storeStrong((id *)&self->_kgQAExecution, a3);
}

- (PEGASUSSchemaPEGASUSWebAnswerExecution)webAnswerExecution
{
  return self->_webAnswerExecution;
}

- (void)setWebAnswerExecution:(id)a3
{
  objc_storeStrong((id *)&self->_webAnswerExecution, a3);
}

- (PEGASUSSchemaPEGASUSSportsExecution)sportsExecution
{
  return self->_sportsExecution;
}

- (void)setSportsExecution:(id)a3
{
  objc_storeStrong((id *)&self->_sportsExecution, a3);
}

- (PEGASUSSchemaPEGASUSMapsExecution)mapsExecution
{
  return self->_mapsExecution;
}

- (void)setMapsExecution:(id)a3
{
  objc_storeStrong((id *)&self->_mapsExecution, a3);
}

- (PEGASUSSchemaPEGASUSAudioExecution)audioExecution
{
  return self->_audioExecution;
}

- (void)setAudioExecution:(id)a3
{
  objc_storeStrong((id *)&self->_audioExecution, a3);
}

- (PEGASUSSchemaPEGASUSVideoExecution)videoExecution
{
  return self->_videoExecution;
}

- (void)setVideoExecution:(id)a3
{
  objc_storeStrong((id *)&self->_videoExecution, a3);
}

- (NSString)edge
{
  return self->_edge;
}

- (void)setEdge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasIntent:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasCrossIntentRankerResponse:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasKgQAExecution:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasWebAnswerExecution:(BOOL)a3
{
  self->_hasIntent = a3;
}

- (void)setHasSportsExecution:(BOOL)a3
{
  self->_hasCrossIntentRankerResponse = a3;
}

- (void)setHasMapsExecution:(BOOL)a3
{
  self->_hasKgQAExecution = a3;
}

- (void)setHasAudioExecution:(BOOL)a3
{
  self->_hasWebAnswerExecution = a3;
}

- (void)setHasVideoExecution:(BOOL)a3
{
  self->_hasSportsExecution = a3;
}

- (void)setHasEdge:(BOOL)a3
{
  self->_hasMapsExecution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edge, 0);
  objc_storeStrong((id *)&self->_videoExecution, 0);
  objc_storeStrong((id *)&self->_audioExecution, 0);
  objc_storeStrong((id *)&self->_mapsExecution, 0);
  objc_storeStrong((id *)&self->_sportsExecution, 0);
  objc_storeStrong((id *)&self->_webAnswerExecution, 0);
  objc_storeStrong((id *)&self->_kgQAExecution, 0);
  objc_storeStrong((id *)&self->_crossIntentRankerResponse, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_otherProviders, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end

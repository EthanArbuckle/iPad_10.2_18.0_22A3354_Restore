@implementation FLOWSchemaFLOWPegasusContext

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
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)FLOWSchemaFLOWPegasusContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v28, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWPegasusContext linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWPegasusContext deleteLinkId](self, "deleteLinkId");
  -[FLOWSchemaFLOWPegasusContext intent](self, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWPegasusContext deleteIntent](self, "deleteIntent");
  -[FLOWSchemaFLOWPegasusContext kgQAExecution](self, "kgQAExecution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLOWSchemaFLOWPegasusContext deleteKgQAExecution](self, "deleteKgQAExecution");
  -[FLOWSchemaFLOWPegasusContext webAnswerExecution](self, "webAnswerExecution");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[FLOWSchemaFLOWPegasusContext deleteWebAnswerExecution](self, "deleteWebAnswerExecution");
  -[FLOWSchemaFLOWPegasusContext sportsExecution](self, "sportsExecution");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[FLOWSchemaFLOWPegasusContext deleteSportsExecution](self, "deleteSportsExecution");
  -[FLOWSchemaFLOWPegasusContext crossIntentRankerResponse](self, "crossIntentRankerResponse");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[FLOWSchemaFLOWPegasusContext deleteCrossIntentRankerResponse](self, "deleteCrossIntentRankerResponse");
  -[FLOWSchemaFLOWPegasusContext mapsExecution](self, "mapsExecution");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[FLOWSchemaFLOWPegasusContext deleteMapsExecution](self, "deleteMapsExecution");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[FLOWSchemaFLOWPegasusContext setLinkId:](self, "setLinkId:", 0);
}

- (void)setProductArea:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_productArea = a3;
}

- (BOOL)hasProductArea
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProductArea:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProductArea
{
  -[FLOWSchemaFLOWPegasusContext setProductArea:](self, "setProductArea:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPrimaryProvider:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_primaryProvider = a3;
}

- (BOOL)hasPrimaryProvider
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPrimaryProvider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePrimaryProvider
{
  -[FLOWSchemaFLOWPegasusContext setPrimaryProvider:](self, "setPrimaryProvider:", 0);
  *(_BYTE *)&self->_has &= ~2u;
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
  -[FLOWSchemaFLOWPegasusContext setIntent:](self, "setIntent:", 0);
}

- (void)setIsHandOffExecution:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isHandOffExecution = a3;
}

- (BOOL)hasIsHandOffExecution
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsHandOffExecution:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsHandOffExecution
{
  -[FLOWSchemaFLOWPegasusContext setIsHandOffExecution:](self, "setIsHandOffExecution:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasKgQAExecution
{
  return self->_kgQAExecution != 0;
}

- (void)deleteKgQAExecution
{
  -[FLOWSchemaFLOWPegasusContext setKgQAExecution:](self, "setKgQAExecution:", 0);
}

- (BOOL)hasWebAnswerExecution
{
  return self->_webAnswerExecution != 0;
}

- (void)deleteWebAnswerExecution
{
  -[FLOWSchemaFLOWPegasusContext setWebAnswerExecution:](self, "setWebAnswerExecution:", 0);
}

- (BOOL)hasSportsExecution
{
  return self->_sportsExecution != 0;
}

- (void)deleteSportsExecution
{
  -[FLOWSchemaFLOWPegasusContext setSportsExecution:](self, "setSportsExecution:", 0);
}

- (BOOL)hasCrossIntentRankerResponse
{
  return self->_crossIntentRankerResponse != 0;
}

- (void)deleteCrossIntentRankerResponse
{
  -[FLOWSchemaFLOWPegasusContext setCrossIntentRankerResponse:](self, "setCrossIntentRankerResponse:", 0);
}

- (BOOL)hasMapsExecution
{
  return self->_mapsExecution != 0;
}

- (void)deleteMapsExecution
{
  -[FLOWSchemaFLOWPegasusContext setMapsExecution:](self, "setMapsExecution:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWPegasusContextReadFrom(self, (uint64_t)a3);
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FLOWSchemaFLOWPegasusContext linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FLOWSchemaFLOWPegasusContext linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_otherProviders;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "intValue", (_QWORD)v25);
        PBDataWriterWriteInt32Field();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  -[FLOWSchemaFLOWPegasusContext intent](self, "intent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[FLOWSchemaFLOWPegasusContext intent](self, "intent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  -[FLOWSchemaFLOWPegasusContext kgQAExecution](self, "kgQAExecution", (_QWORD)v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[FLOWSchemaFLOWPegasusContext kgQAExecution](self, "kgQAExecution");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPegasusContext webAnswerExecution](self, "webAnswerExecution");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[FLOWSchemaFLOWPegasusContext webAnswerExecution](self, "webAnswerExecution");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPegasusContext sportsExecution](self, "sportsExecution");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[FLOWSchemaFLOWPegasusContext sportsExecution](self, "sportsExecution");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPegasusContext crossIntentRankerResponse](self, "crossIntentRankerResponse");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[FLOWSchemaFLOWPegasusContext crossIntentRankerResponse](self, "crossIntentRankerResponse");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPegasusContext mapsExecution](self, "mapsExecution");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[FLOWSchemaFLOWPegasusContext mapsExecution](self, "mapsExecution");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $8397A9CCDF3DD6ADE4DE49315199B15E has;
  unsigned int v13;
  int productArea;
  int v15;
  int primaryProvider;
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
  int v27;
  int isHandOffExecution;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  BOOL v54;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[FLOWSchemaFLOWPegasusContext linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[FLOWSchemaFLOWPegasusContext linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWPegasusContext linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_52;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[88];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_52;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    productArea = self->_productArea;
    if (productArea != objc_msgSend(v4, "productArea"))
      goto LABEL_52;
    has = self->_has;
    v13 = v4[88];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_52;
  if (v15)
  {
    primaryProvider = self->_primaryProvider;
    if (primaryProvider != objc_msgSend(v4, "primaryProvider"))
      goto LABEL_52;
  }
  -[FLOWSchemaFLOWPegasusContext otherProviders](self, "otherProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[FLOWSchemaFLOWPegasusContext otherProviders](self, "otherProviders");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[FLOWSchemaFLOWPegasusContext otherProviders](self, "otherProviders");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "otherProviders");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_52;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContext intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[FLOWSchemaFLOWPegasusContext intent](self, "intent");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[FLOWSchemaFLOWPegasusContext intent](self, "intent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_52;
  }
  else
  {

  }
  v27 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v27 != ((v4[88] >> 2) & 1))
    goto LABEL_52;
  if (v27)
  {
    isHandOffExecution = self->_isHandOffExecution;
    if (isHandOffExecution != objc_msgSend(v4, "isHandOffExecution"))
      goto LABEL_52;
  }
  -[FLOWSchemaFLOWPegasusContext kgQAExecution](self, "kgQAExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kgQAExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[FLOWSchemaFLOWPegasusContext kgQAExecution](self, "kgQAExecution");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[FLOWSchemaFLOWPegasusContext kgQAExecution](self, "kgQAExecution");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kgQAExecution");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_52;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContext webAnswerExecution](self, "webAnswerExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webAnswerExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[FLOWSchemaFLOWPegasusContext webAnswerExecution](self, "webAnswerExecution");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[FLOWSchemaFLOWPegasusContext webAnswerExecution](self, "webAnswerExecution");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webAnswerExecution");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_52;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContext sportsExecution](self, "sportsExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sportsExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[FLOWSchemaFLOWPegasusContext sportsExecution](self, "sportsExecution");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[FLOWSchemaFLOWPegasusContext sportsExecution](self, "sportsExecution");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sportsExecution");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if (!v43)
      goto LABEL_52;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContext crossIntentRankerResponse](self, "crossIntentRankerResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crossIntentRankerResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[FLOWSchemaFLOWPegasusContext crossIntentRankerResponse](self, "crossIntentRankerResponse");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[FLOWSchemaFLOWPegasusContext crossIntentRankerResponse](self, "crossIntentRankerResponse");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crossIntentRankerResponse");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_52;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContext mapsExecution](self, "mapsExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  -[FLOWSchemaFLOWPegasusContext mapsExecution](self, "mapsExecution");
  v49 = objc_claimAutoreleasedReturnValue();
  if (!v49)
  {

LABEL_55:
    v54 = 1;
    goto LABEL_53;
  }
  v50 = (void *)v49;
  -[FLOWSchemaFLOWPegasusContext mapsExecution](self, "mapsExecution");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsExecution");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v51, "isEqual:", v52);

  if ((v53 & 1) != 0)
    goto LABEL_55;
LABEL_52:
  v54 = 0;
LABEL_53:

  return v54;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_productArea;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_primaryProvider;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSArray hash](self->_otherProviders, "hash");
  v7 = -[PEGASUSSchemaPEGASUSIntent hash](self->_intent, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_isHandOffExecution;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[FLOWSchemaFLOWKGQAExecution hash](self->_kgQAExecution, "hash");
  v10 = -[FLOWSchemaFLOWWebAnswerExecution hash](self->_webAnswerExecution, "hash");
  v11 = v10 ^ -[FLOWSchemaFLOWSPORTSExecution hash](self->_sportsExecution, "hash");
  v12 = v11 ^ -[FLOWSchemaFLOWCrossIntentRankerResponse hash](self->_crossIntentRankerResponse, "hash");
  return v9 ^ v12 ^ -[FLOWSchemaFLOWMapsExecution hash](self->_mapsExecution, "hash");
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char has;
  unsigned int v23;
  const __CFString *v24;
  unsigned int v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_crossIntentRankerResponse)
  {
    -[FLOWSchemaFLOWPegasusContext crossIntentRankerResponse](self, "crossIntentRankerResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("crossIntentRankerResponse"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("crossIntentRankerResponse"));

    }
  }
  if (self->_intent)
  {
    -[FLOWSchemaFLOWPegasusContext intent](self, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("intent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intent"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWPegasusContext isHandOffExecution](self, "isHandOffExecution"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isHandOffExecution"));

  }
  if (self->_kgQAExecution)
  {
    -[FLOWSchemaFLOWPegasusContext kgQAExecution](self, "kgQAExecution");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("kgQAExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("kgQAExecution"));

    }
  }
  if (self->_linkId)
  {
    -[FLOWSchemaFLOWPegasusContext linkId](self, "linkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("linkId"));

    }
  }
  if (self->_mapsExecution)
  {
    -[FLOWSchemaFLOWPegasusContext mapsExecution](self, "mapsExecution");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("mapsExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("mapsExecution"));

    }
  }
  if (-[NSArray count](self->_otherProviders, "count"))
  {
    -[FLOWSchemaFLOWPegasusContext otherProviders](self, "otherProviders");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("otherProviders"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v23 = -[FLOWSchemaFLOWPegasusContext primaryProvider](self, "primaryProvider") - 1;
    if (v23 > 0xF)
      v24 = CFSTR("FLOWPEGASUSPROVIDER_UNKNOWN");
    else
      v24 = off_1E562E660[v23];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("primaryProvider"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v25 = -[FLOWSchemaFLOWPegasusContext productArea](self, "productArea") - 1;
    if (v25 > 0xE)
      v26 = CFSTR("FLOWPEGASUSPRODUCTAREA_UNKNOWN");
    else
      v26 = off_1E562E6E0[v25];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("productArea"));
  }
  if (self->_sportsExecution)
  {
    -[FLOWSchemaFLOWPegasusContext sportsExecution](self, "sportsExecution");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("sportsExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("sportsExecution"));

    }
  }
  if (self->_webAnswerExecution)
  {
    -[FLOWSchemaFLOWPegasusContext webAnswerExecution](self, "webAnswerExecution");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("webAnswerExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("webAnswerExecution"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWPegasusContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWPegasusContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWPegasusContext *v5;
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
    self = -[FLOWSchemaFLOWPegasusContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWPegasusContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWPegasusContext *v5;
  uint64_t v6;
  SISchemaUUID *v7;
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
  PEGASUSSchemaPEGASUSIntent *v18;
  void *v19;
  void *v20;
  FLOWSchemaFLOWKGQAExecution *v21;
  void *v22;
  FLOWSchemaFLOWWebAnswerExecution *v23;
  void *v24;
  FLOWSchemaFLOWSPORTSExecution *v25;
  void *v26;
  FLOWSchemaFLOWCrossIntentRankerResponse *v27;
  void *v28;
  FLOWSchemaFLOWMapsExecution *v29;
  FLOWSchemaFLOWPegasusContext *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FLOWSchemaFLOWPegasusContext;
  v5 = -[FLOWSchemaFLOWPegasusContext init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWPegasusContext setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productArea"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWPegasusContext setProductArea:](v5, "setProductArea:", objc_msgSend(v8, "intValue"));
    v35 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWPegasusContext setPrimaryProvider:](v5, "setPrimaryProvider:", objc_msgSend(v9, "intValue"));
    v33 = v9;
    v34 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("otherProviders"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v37;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v37 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWPegasusContext addOtherProviders:](v5, "addOtherProviders:", objc_msgSend(v16, "intValue"));
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v13);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[PEGASUSSchemaPEGASUSIntent initWithDictionary:]([PEGASUSSchemaPEGASUSIntent alloc], "initWithDictionary:", v17);
      -[FLOWSchemaFLOWPegasusContext setIntent:](v5, "setIntent:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHandOffExecution"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWPegasusContext setIsHandOffExecution:](v5, "setIsHandOffExecution:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kgQAExecution"), v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[FLOWSchemaFLOWKGQAExecution initWithDictionary:]([FLOWSchemaFLOWKGQAExecution alloc], "initWithDictionary:", v20);
      -[FLOWSchemaFLOWPegasusContext setKgQAExecution:](v5, "setKgQAExecution:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("webAnswerExecution"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[FLOWSchemaFLOWWebAnswerExecution initWithDictionary:]([FLOWSchemaFLOWWebAnswerExecution alloc], "initWithDictionary:", v22);
      -[FLOWSchemaFLOWPegasusContext setWebAnswerExecution:](v5, "setWebAnswerExecution:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsExecution"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[FLOWSchemaFLOWSPORTSExecution initWithDictionary:]([FLOWSchemaFLOWSPORTSExecution alloc], "initWithDictionary:", v24);
      -[FLOWSchemaFLOWPegasusContext setSportsExecution:](v5, "setSportsExecution:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crossIntentRankerResponse"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[FLOWSchemaFLOWCrossIntentRankerResponse initWithDictionary:]([FLOWSchemaFLOWCrossIntentRankerResponse alloc], "initWithDictionary:", v26);
      -[FLOWSchemaFLOWPegasusContext setCrossIntentRankerResponse:](v5, "setCrossIntentRankerResponse:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsExecution"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[FLOWSchemaFLOWMapsExecution initWithDictionary:]([FLOWSchemaFLOWMapsExecution alloc], "initWithDictionary:", v28);
      -[FLOWSchemaFLOWPegasusContext setMapsExecution:](v5, "setMapsExecution:", v29);

    }
    v30 = v5;

  }
  return v5;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PEGASUSSchemaPEGASUSIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (BOOL)isHandOffExecution
{
  return self->_isHandOffExecution;
}

- (FLOWSchemaFLOWKGQAExecution)kgQAExecution
{
  return self->_kgQAExecution;
}

- (void)setKgQAExecution:(id)a3
{
  objc_storeStrong((id *)&self->_kgQAExecution, a3);
}

- (FLOWSchemaFLOWWebAnswerExecution)webAnswerExecution
{
  return self->_webAnswerExecution;
}

- (void)setWebAnswerExecution:(id)a3
{
  objc_storeStrong((id *)&self->_webAnswerExecution, a3);
}

- (FLOWSchemaFLOWSPORTSExecution)sportsExecution
{
  return self->_sportsExecution;
}

- (void)setSportsExecution:(id)a3
{
  objc_storeStrong((id *)&self->_sportsExecution, a3);
}

- (FLOWSchemaFLOWCrossIntentRankerResponse)crossIntentRankerResponse
{
  return self->_crossIntentRankerResponse;
}

- (void)setCrossIntentRankerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_crossIntentRankerResponse, a3);
}

- (FLOWSchemaFLOWMapsExecution)mapsExecution
{
  return self->_mapsExecution;
}

- (void)setMapsExecution:(id)a3
{
  objc_storeStrong((id *)&self->_mapsExecution, a3);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasIntent:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasKgQAExecution:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasWebAnswerExecution:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasSportsExecution:(BOOL)a3
{
  self->_hasIntent = a3;
}

- (void)setHasCrossIntentRankerResponse:(BOOL)a3
{
  self->_hasKgQAExecution = a3;
}

- (void)setHasMapsExecution:(BOOL)a3
{
  self->_hasWebAnswerExecution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsExecution, 0);
  objc_storeStrong((id *)&self->_crossIntentRankerResponse, 0);
  objc_storeStrong((id *)&self->_sportsExecution, 0);
  objc_storeStrong((id *)&self->_webAnswerExecution, 0);
  objc_storeStrong((id *)&self->_kgQAExecution, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_otherProviders, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end

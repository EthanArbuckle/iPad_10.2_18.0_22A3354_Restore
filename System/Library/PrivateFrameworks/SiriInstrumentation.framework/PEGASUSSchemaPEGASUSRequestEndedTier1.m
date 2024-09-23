@implementation PEGASUSSchemaPEGASUSRequestEndedTier1

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
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PEGASUSSchemaPEGASUSRequestEndedTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v31, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 deleteLinkId](self, "deleteLinkId");
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 intentTier1](self, "intentTier1");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 deleteIntentTier1](self, "deleteIntentTier1");
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 deleteKgQAExecutionTier1](self, "deleteKgQAExecutionTier1");
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 deleteWebAnswerExecutionTier1](self, "deleteWebAnswerExecutionTier1");
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 deleteSportsExecutionTier1](self, "deleteSportsExecutionTier1");
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 deleteMapsExecutionTier1](self, "deleteMapsExecutionTier1");
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 audioExecutionTier1](self, "audioExecutionTier1");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 deleteAudioExecutionTier1](self, "deleteAudioExecutionTier1");
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 videoExecutionTier1](self, "videoExecutionTier1");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 deleteVideoExecutionTier1](self, "deleteVideoExecutionTier1");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasIntentTier1
{
  return self->_intentTier1 != 0;
}

- (void)deleteIntentTier1
{
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 setIntentTier1:](self, "setIntentTier1:", 0);
}

- (BOOL)hasKgQAExecutionTier1
{
  return self->_kgQAExecutionTier1 != 0;
}

- (void)deleteKgQAExecutionTier1
{
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 setKgQAExecutionTier1:](self, "setKgQAExecutionTier1:", 0);
}

- (BOOL)hasWebAnswerExecutionTier1
{
  return self->_webAnswerExecutionTier1 != 0;
}

- (void)deleteWebAnswerExecutionTier1
{
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 setWebAnswerExecutionTier1:](self, "setWebAnswerExecutionTier1:", 0);
}

- (BOOL)hasSportsExecutionTier1
{
  return self->_sportsExecutionTier1 != 0;
}

- (void)deleteSportsExecutionTier1
{
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 setSportsExecutionTier1:](self, "setSportsExecutionTier1:", 0);
}

- (BOOL)hasMapsExecutionTier1
{
  return self->_mapsExecutionTier1 != 0;
}

- (void)deleteMapsExecutionTier1
{
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 setMapsExecutionTier1:](self, "setMapsExecutionTier1:", 0);
}

- (BOOL)hasAudioExecutionTier1
{
  return self->_audioExecutionTier1 != 0;
}

- (void)deleteAudioExecutionTier1
{
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 setAudioExecutionTier1:](self, "setAudioExecutionTier1:", 0);
}

- (BOOL)hasVideoExecutionTier1
{
  return self->_videoExecutionTier1 != 0;
}

- (void)deleteVideoExecutionTier1
{
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 setVideoExecutionTier1:](self, "setVideoExecutionTier1:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSRequestEndedTier1ReadFrom(self, (uint64_t)a3);
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 intentTier1](self, "intentTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 intentTier1](self, "intentTier1");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 audioExecutionTier1](self, "audioExecutionTier1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 audioExecutionTier1](self, "audioExecutionTier1");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 videoExecutionTier1](self, "videoExecutionTier1");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 videoExecutionTier1](self, "videoExecutionTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  BOOL v47;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_42;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 intentTier1](self, "intentTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 intentTier1](self, "intentTier1");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 intentTier1](self, "intentTier1");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_42;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kgQAExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kgQAExecutionTier1");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_42;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webAnswerExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webAnswerExecutionTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_42;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sportsExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sportsExecutionTier1");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_42;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsExecutionTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_42;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 audioExecutionTier1](self, "audioExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 audioExecutionTier1](self, "audioExecutionTier1");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 audioExecutionTier1](self, "audioExecutionTier1");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioExecutionTier1");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_42;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSRequestEndedTier1 videoExecutionTier1](self, "videoExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 videoExecutionTier1](self, "videoExecutionTier1");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {

LABEL_45:
      v47 = 1;
      goto LABEL_43;
    }
    v43 = (void *)v42;
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 videoExecutionTier1](self, "videoExecutionTier1");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoExecutionTier1");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if ((v46 & 1) != 0)
      goto LABEL_45;
  }
  else
  {
LABEL_41:

  }
LABEL_42:
  v47 = 0;
LABEL_43:

  return v47;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[PEGASUSSchemaPEGASUSIntentTier1 hash](self->_intentTier1, "hash") ^ v3;
  v5 = -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 hash](self->_kgQAExecutionTier1, "hash");
  v6 = v4 ^ v5 ^ -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 hash](self->_webAnswerExecutionTier1, "hash");
  v7 = -[PEGASUSSchemaPEGASUSSportsExecutionTier1 hash](self->_sportsExecutionTier1, "hash");
  v8 = v7 ^ -[PEGASUSSchemaPEGASUSMapsExecutionTier1 hash](self->_mapsExecutionTier1, "hash");
  v9 = v6 ^ v8 ^ -[PEGASUSSchemaPEGASUSAudioExecutionTier1 hash](self->_audioExecutionTier1, "hash");
  return v9 ^ -[PEGASUSSchemaPEGASUSVideoExecutionTier1 hash](self->_videoExecutionTier1, "hash");
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioExecutionTier1)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 audioExecutionTier1](self, "audioExecutionTier1");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioExecutionTier1"));

    }
  }
  if (self->_intentTier1)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 intentTier1](self, "intentTier1");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("intentTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentTier1"));

    }
  }
  if (self->_kgQAExecutionTier1)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("kgQAExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("kgQAExecutionTier1"));

    }
  }
  if (self->_linkId)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 linkId](self, "linkId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("linkId"));

    }
  }
  if (self->_mapsExecutionTier1)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("mapsExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("mapsExecutionTier1"));

    }
  }
  if (self->_sportsExecutionTier1)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("sportsExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("sportsExecutionTier1"));

    }
  }
  if (self->_videoExecutionTier1)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 videoExecutionTier1](self, "videoExecutionTier1");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("videoExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("videoExecutionTier1"));

    }
  }
  if (self->_webAnswerExecutionTier1)
  {
    -[PEGASUSSchemaPEGASUSRequestEndedTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("webAnswerExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("webAnswerExecutionTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSRequestEndedTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSRequestEndedTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSRequestEndedTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSRequestEndedTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  void *v8;
  PEGASUSSchemaPEGASUSIntentTier1 *v9;
  void *v10;
  PEGASUSSchemaPEGASUSKGQAExecutionTier1 *v11;
  void *v12;
  PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *v13;
  void *v14;
  PEGASUSSchemaPEGASUSSportsExecutionTier1 *v15;
  void *v16;
  PEGASUSSchemaPEGASUSMapsExecutionTier1 *v17;
  void *v18;
  PEGASUSSchemaPEGASUSAudioExecutionTier1 *v19;
  void *v20;
  PEGASUSSchemaPEGASUSVideoExecutionTier1 *v21;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *v22;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PEGASUSSchemaPEGASUSRequestEndedTier1;
  v5 = -[PEGASUSSchemaPEGASUSRequestEndedTier1 init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PEGASUSSchemaPEGASUSRequestEndedTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    v24 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentTier1"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PEGASUSSchemaPEGASUSIntentTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSIntentTier1 alloc], "initWithDictionary:", v8);
      -[PEGASUSSchemaPEGASUSRequestEndedTier1 setIntentTier1:](v5, "setIntentTier1:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kgQAExecutionTier1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSKGQAExecutionTier1 alloc], "initWithDictionary:", v10);
      -[PEGASUSSchemaPEGASUSRequestEndedTier1 setKgQAExecutionTier1:](v5, "setKgQAExecutionTier1:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("webAnswerExecutionTier1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 alloc], "initWithDictionary:", v12);
      -[PEGASUSSchemaPEGASUSRequestEndedTier1 setWebAnswerExecutionTier1:](v5, "setWebAnswerExecutionTier1:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsExecutionTier1"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PEGASUSSchemaPEGASUSSportsExecutionTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSSportsExecutionTier1 alloc], "initWithDictionary:", v14);
      -[PEGASUSSchemaPEGASUSRequestEndedTier1 setSportsExecutionTier1:](v5, "setSportsExecutionTier1:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsExecutionTier1"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PEGASUSSchemaPEGASUSMapsExecutionTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSMapsExecutionTier1 alloc], "initWithDictionary:", v16);
      -[PEGASUSSchemaPEGASUSRequestEndedTier1 setMapsExecutionTier1:](v5, "setMapsExecutionTier1:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioExecutionTier1"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PEGASUSSchemaPEGASUSAudioExecutionTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSAudioExecutionTier1 alloc], "initWithDictionary:", v18);
      -[PEGASUSSchemaPEGASUSRequestEndedTier1 setAudioExecutionTier1:](v5, "setAudioExecutionTier1:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoExecutionTier1"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PEGASUSSchemaPEGASUSVideoExecutionTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSVideoExecutionTier1 alloc], "initWithDictionary:", v20);
      -[PEGASUSSchemaPEGASUSRequestEndedTier1 setVideoExecutionTier1:](v5, "setVideoExecutionTier1:", v21);

    }
    v22 = v5;

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

- (PEGASUSSchemaPEGASUSIntentTier1)intentTier1
{
  return self->_intentTier1;
}

- (void)setIntentTier1:(id)a3
{
  objc_storeStrong((id *)&self->_intentTier1, a3);
}

- (PEGASUSSchemaPEGASUSKGQAExecutionTier1)kgQAExecutionTier1
{
  return self->_kgQAExecutionTier1;
}

- (void)setKgQAExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_kgQAExecutionTier1, a3);
}

- (PEGASUSSchemaPEGASUSWebAnswerExecutionTier1)webAnswerExecutionTier1
{
  return self->_webAnswerExecutionTier1;
}

- (void)setWebAnswerExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_webAnswerExecutionTier1, a3);
}

- (PEGASUSSchemaPEGASUSSportsExecutionTier1)sportsExecutionTier1
{
  return self->_sportsExecutionTier1;
}

- (void)setSportsExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_sportsExecutionTier1, a3);
}

- (PEGASUSSchemaPEGASUSMapsExecutionTier1)mapsExecutionTier1
{
  return self->_mapsExecutionTier1;
}

- (void)setMapsExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_mapsExecutionTier1, a3);
}

- (PEGASUSSchemaPEGASUSAudioExecutionTier1)audioExecutionTier1
{
  return self->_audioExecutionTier1;
}

- (void)setAudioExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_audioExecutionTier1, a3);
}

- (PEGASUSSchemaPEGASUSVideoExecutionTier1)videoExecutionTier1
{
  return self->_videoExecutionTier1;
}

- (void)setVideoExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_videoExecutionTier1, a3);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasIntentTier1:(BOOL)a3
{
  self->_hasIntentTier1 = a3;
}

- (void)setHasKgQAExecutionTier1:(BOOL)a3
{
  self->_hasKgQAExecutionTier1 = a3;
}

- (void)setHasWebAnswerExecutionTier1:(BOOL)a3
{
  self->_hasWebAnswerExecutionTier1 = a3;
}

- (void)setHasSportsExecutionTier1:(BOOL)a3
{
  self->_hasSportsExecutionTier1 = a3;
}

- (void)setHasMapsExecutionTier1:(BOOL)a3
{
  self->_hasMapsExecutionTier1 = a3;
}

- (void)setHasAudioExecutionTier1:(BOOL)a3
{
  self->_hasAudioExecutionTier1 = a3;
}

- (void)setHasVideoExecutionTier1:(BOOL)a3
{
  self->_hasVideoExecutionTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoExecutionTier1, 0);
  objc_storeStrong((id *)&self->_audioExecutionTier1, 0);
  objc_storeStrong((id *)&self->_mapsExecutionTier1, 0);
  objc_storeStrong((id *)&self->_sportsExecutionTier1, 0);
  objc_storeStrong((id *)&self->_webAnswerExecutionTier1, 0);
  objc_storeStrong((id *)&self->_kgQAExecutionTier1, 0);
  objc_storeStrong((id *)&self->_intentTier1, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end

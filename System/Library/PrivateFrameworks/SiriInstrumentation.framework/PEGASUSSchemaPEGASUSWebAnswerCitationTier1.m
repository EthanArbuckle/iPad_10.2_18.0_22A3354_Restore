@implementation PEGASUSSchemaPEGASUSWebAnswerCitationTier1

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerCitationTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteUrl](self, "deleteUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteSourceDomain](self, "deleteSourceDomain");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteReadableAttribution](self, "deleteReadableAttribution");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteCitedText](self, "deleteCitedText");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteEnrichedUrl](self, "deleteEnrichedUrl");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteUrl](self, "deleteUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteSourceDomain](self, "deleteSourceDomain");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteReadableAttribution](self, "deleteReadableAttribution");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteCitedText](self, "deleteCitedText");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteEnrichedUrl](self, "deleteEnrichedUrl");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteUrl](self, "deleteUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteSourceDomain](self, "deleteSourceDomain");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteReadableAttribution](self, "deleteReadableAttribution");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteCitedText](self, "deleteCitedText");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteEnrichedUrl](self, "deleteEnrichedUrl");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteUrl](self, "deleteUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteSourceDomain](self, "deleteSourceDomain");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteReadableAttribution](self, "deleteReadableAttribution");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteCitedText](self, "deleteCitedText");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteEnrichedUrl](self, "deleteEnrichedUrl");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteUrl](self, "deleteUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteSourceDomain](self, "deleteSourceDomain");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteReadableAttribution](self, "deleteReadableAttribution");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteCitedText](self, "deleteCitedText");
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteEnrichedUrl](self, "deleteEnrichedUrl");
  }
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 thumbnail](self, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 deleteThumbnail](self, "deleteThumbnail");

  return v5;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)deleteUrl
{
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setUrl:](self, "setUrl:", 0);
}

- (BOOL)hasSourceDomain
{
  return self->_sourceDomain != 0;
}

- (void)deleteSourceDomain
{
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setSourceDomain:](self, "setSourceDomain:", 0);
}

- (BOOL)hasReadableAttribution
{
  return self->_readableAttribution != 0;
}

- (void)deleteReadableAttribution
{
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setReadableAttribution:](self, "setReadableAttribution:", 0);
}

- (BOOL)hasCitedText
{
  return self->_citedText != 0;
}

- (void)deleteCitedText
{
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setCitedText:](self, "setCitedText:", 0);
}

- (BOOL)hasEnrichedUrl
{
  return self->_enrichedUrl != 0;
}

- (void)deleteEnrichedUrl
{
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setEnrichedUrl:](self, "setEnrichedUrl:", 0);
}

- (BOOL)hasThumbnail
{
  return self->_thumbnail != 0;
}

- (void)deleteThumbnail
{
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setThumbnail:](self, "setThumbnail:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerCitationTier1ReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 sourceDomain](self, "sourceDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 readableAttribution](self, "readableAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 citedText](self, "citedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 enrichedUrl](self, "enrichedUrl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 thumbnail](self, "thumbnail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 thumbnail](self, "thumbnail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 url](self, "url");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 sourceDomain](self, "sourceDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 sourceDomain](self, "sourceDomain");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 sourceDomain](self, "sourceDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceDomain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 readableAttribution](self, "readableAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readableAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 readableAttribution](self, "readableAttribution");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 readableAttribution](self, "readableAttribution");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readableAttribution");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 citedText](self, "citedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "citedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 citedText](self, "citedText");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 citedText](self, "citedText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "citedText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 enrichedUrl](self, "enrichedUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrichedUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 enrichedUrl](self, "enrichedUrl");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 enrichedUrl](self, "enrichedUrl");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enrichedUrl");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 thumbnail](self, "thumbnail");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 thumbnail](self, "thumbnail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_url, "hash");
  v4 = -[NSString hash](self->_sourceDomain, "hash") ^ v3;
  v5 = -[NSString hash](self->_readableAttribution, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_citedText, "hash");
  v7 = -[NSString hash](self->_enrichedUrl, "hash");
  return v6 ^ v7 ^ -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 hash](self->_thumbnail, "hash");
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
  if (self->_citedText)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 citedText](self, "citedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("citedText"));

  }
  if (self->_enrichedUrl)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 enrichedUrl](self, "enrichedUrl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("enrichedUrl"));

  }
  if (self->_readableAttribution)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 readableAttribution](self, "readableAttribution");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("readableAttribution"));

  }
  if (self->_sourceDomain)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 sourceDomain](self, "sourceDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sourceDomain"));

  }
  if (self->_thumbnail)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 thumbnail](self, "thumbnail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("thumbnail"));

    }
  }
  if (self->_url)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 url](self, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("url"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSWebAnswerCitationTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerCitationTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *v5;
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
  PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *v17;
  PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerCitationTier1;
  v5 = -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setUrl:](v5, "setUrl:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceDomain"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setSourceDomain:](v5, "setSourceDomain:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readableAttribution"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setReadableAttribution:](v5, "setReadableAttribution:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("citedText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setCitedText:](v5, "setCitedText:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrichedUrl"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setEnrichedUrl:](v5, "setEnrichedUrl:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 alloc], "initWithDictionary:", v16);
      -[PEGASUSSchemaPEGASUSWebAnswerCitationTier1 setThumbnail:](v5, "setThumbnail:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sourceDomain
{
  return self->_sourceDomain;
}

- (void)setSourceDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)readableAttribution
{
  return self->_readableAttribution;
}

- (void)setReadableAttribution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)citedText
{
  return self->_citedText;
}

- (void)setCitedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)enrichedUrl
{
  return self->_enrichedUrl;
}

- (void)setEnrichedUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void)setHasUrl:(BOOL)a3
{
  self->_hasUrl = a3;
}

- (void)setHasSourceDomain:(BOOL)a3
{
  self->_hasSourceDomain = a3;
}

- (void)setHasReadableAttribution:(BOOL)a3
{
  self->_hasReadableAttribution = a3;
}

- (void)setHasCitedText:(BOOL)a3
{
  self->_hasCitedText = a3;
}

- (void)setHasEnrichedUrl:(BOOL)a3
{
  self->_hasEnrichedUrl = a3;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_enrichedUrl, 0);
  objc_storeStrong((id *)&self->_citedText, 0);
  objc_storeStrong((id *)&self->_readableAttribution, 0);
  objc_storeStrong((id *)&self->_sourceDomain, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end

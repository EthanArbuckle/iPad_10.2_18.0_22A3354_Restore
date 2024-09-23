@implementation PLUSSchemaPLUSSuggesterDomainSuggestionMetadata

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
  v9.super_class = (Class)PLUSSchemaPLUSSuggesterDomainSuggestionMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata mediaMetadata](self, "mediaMetadata", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata deleteMediaMetadata](self, "deleteMediaMetadata");
  return v5;
}

- (void)setMediaMetadata:(id)a3
{
  unint64_t v3;

  v3 = 100;
  if (!a3)
    v3 = 0;
  self->_whichDomainsuggestionmetadata = v3;
  objc_storeStrong((id *)&self->_mediaMetadata, a3);
}

- (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata)mediaMetadata
{
  if (self->_whichDomainsuggestionmetadata == 100)
    return self->_mediaMetadata;
  else
    return (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *)0;
}

- (void)deleteMediaMetadata
{
  PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *mediaMetadata;

  if (self->_whichDomainsuggestionmetadata == 100)
  {
    self->_whichDomainsuggestionmetadata = 0;
    mediaMetadata = self->_mediaMetadata;
    self->_mediaMetadata = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterDomainSuggestionMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata mediaMetadata](self, "mediaMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata mediaMetadata](self, "mediaMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichDomainsuggestionmetadata;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichDomainsuggestionmetadata = self->_whichDomainsuggestionmetadata;
    if (whichDomainsuggestionmetadata == objc_msgSend(v4, "whichDomainsuggestionmetadata"))
    {
      -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata mediaMetadata](self, "mediaMetadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata mediaMetadata](self, "mediaMetadata");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata mediaMetadata](self, "mediaMetadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mediaMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  return -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata hash](self->_mediaMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mediaMetadata)
  {
    -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata mediaMetadata](self, "mediaMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mediaMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mediaMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggesterDomainSuggestionMetadata)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *v5;
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
    self = -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggesterDomainSuggestionMetadata)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *v5;
  void *v6;
  PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *v7;
  PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSSuggesterDomainSuggestionMetadata;
  v5 = -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata initWithDictionary:]([PLUSSchemaPLUSSuggesterMediaSuggestionMetadata alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata setMediaMetadata:](v5, "setMediaMetadata:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichDomainsuggestionmetadata
{
  return self->_whichDomainsuggestionmetadata;
}

- (BOOL)hasMediaMetadata
{
  return self->_hasMediaMetadata;
}

- (void)setHasMediaMetadata:(BOOL)a3
{
  self->_hasMediaMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

@end

@implementation PSESchemaPSEMediaEntitySimilarity

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsSameMediaTitle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSameMediaTitle = a3;
}

- (BOOL)hasIsSameMediaTitle
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsSameMediaTitle:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsSameMediaTitle
{
  -[PSESchemaPSEMediaEntitySimilarity setIsSameMediaTitle:](self, "setIsSameMediaTitle:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsSameMediaArtist:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isSameMediaArtist = a3;
}

- (BOOL)hasIsSameMediaArtist
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsSameMediaArtist:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsSameMediaArtist
{
  -[PSESchemaPSEMediaEntitySimilarity setIsSameMediaArtist:](self, "setIsSameMediaArtist:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsSameMediaAlbum:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isSameMediaAlbum = a3;
}

- (BOOL)hasIsSameMediaAlbum
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsSameMediaAlbum:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsSameMediaAlbum
{
  -[PSESchemaPSEMediaEntitySimilarity setIsSameMediaAlbum:](self, "setIsSameMediaAlbum:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsSameMediaItem:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isSameMediaItem = a3;
}

- (BOOL)hasIsSameMediaItem
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsSameMediaItem:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsSameMediaItem
{
  -[PSESchemaPSEMediaEntitySimilarity setIsSameMediaItem:](self, "setIsSameMediaItem:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMediaEntitySimilarityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
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
LABEL_9:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $24811BC63647D0A419F0F6D69D3E169A has;
  unsigned int v6;
  int isSameMediaTitle;
  int v8;
  int isSameMediaArtist;
  int v10;
  int isSameMediaAlbum;
  int v12;
  int isSameMediaItem;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[12];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isSameMediaTitle = self->_isSameMediaTitle;
    if (isSameMediaTitle != objc_msgSend(v4, "isSameMediaTitle"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[12];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    isSameMediaArtist = self->_isSameMediaArtist;
    if (isSameMediaArtist != objc_msgSend(v4, "isSameMediaArtist"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[12];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    isSameMediaAlbum = self->_isSameMediaAlbum;
    if (isSameMediaAlbum == objc_msgSend(v4, "isSameMediaAlbum"))
    {
      has = self->_has;
      v6 = v4[12];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    isSameMediaItem = self->_isSameMediaItem;
    if (isSameMediaItem != objc_msgSend(v4, "isSameMediaItem"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_isSameMediaTitle;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isSameMediaArtist;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
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
  v4 = 2654435761 * self->_isSameMediaAlbum;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_isSameMediaItem;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEMediaEntitySimilarity isSameMediaAlbum](self, "isSameMediaAlbum"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSameMediaAlbum"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEMediaEntitySimilarity isSameMediaItem](self, "isSameMediaItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isSameMediaItem"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEMediaEntitySimilarity isSameMediaArtist](self, "isSameMediaArtist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isSameMediaArtist"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEMediaEntitySimilarity isSameMediaTitle](self, "isSameMediaTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isSameMediaTitle"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEMediaEntitySimilarity dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEMediaEntitySimilarity)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEMediaEntitySimilarity *v5;
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
    self = -[PSESchemaPSEMediaEntitySimilarity initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEMediaEntitySimilarity)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEMediaEntitySimilarity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSESchemaPSEMediaEntitySimilarity *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSESchemaPSEMediaEntitySimilarity;
  v5 = -[PSESchemaPSEMediaEntitySimilarity init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSameMediaTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaEntitySimilarity setIsSameMediaTitle:](v5, "setIsSameMediaTitle:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSameMediaArtist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaEntitySimilarity setIsSameMediaArtist:](v5, "setIsSameMediaArtist:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSameMediaAlbum"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaEntitySimilarity setIsSameMediaAlbum:](v5, "setIsSameMediaAlbum:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSameMediaItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaEntitySimilarity setIsSameMediaItem:](v5, "setIsSameMediaItem:", objc_msgSend(v9, "BOOLValue"));
    v10 = v5;

  }
  return v5;
}

- (BOOL)isSameMediaTitle
{
  return self->_isSameMediaTitle;
}

- (BOOL)isSameMediaArtist
{
  return self->_isSameMediaArtist;
}

- (BOOL)isSameMediaAlbum
{
  return self->_isSameMediaAlbum;
}

- (BOOL)isSameMediaItem
{
  return self->_isSameMediaItem;
}

@end

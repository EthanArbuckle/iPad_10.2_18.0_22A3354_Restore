@implementation SIRINLUINTERNALNLv4EmbeddingTensor

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUINTERNALNLv4EmbeddingTensor;
  -[SIRINLUINTERNALNLv4EmbeddingTensor dealloc](&v3, sel_dealloc);
}

- (unint64_t)valuesCount
{
  return self->_values.count;
}

- (float)values
{
  return self->_values.list;
}

- (void)clearValues
{
  PBRepeatedFloatClear();
}

- (void)addValues:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)valuesAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_values;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_values = &self->_values;
  count = self->_values.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_values->list[a3];
}

- (void)setValues:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (void)setNumToken:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numToken = a3;
}

- (void)setHasNumToken:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumToken
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumLayer:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numLayer = a3;
}

- (void)setHasNumLayer:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumLayer
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEmbeddingDim:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_embeddingDim = a3;
}

- (void)setHasEmbeddingDim:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEmbeddingDim
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEmbedderId
{
  return self->_embedderId != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALNLv4EmbeddingTensor;
  -[SIRINLUINTERNALNLv4EmbeddingTensor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALNLv4EmbeddingTensor dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  char has;
  void *v6;
  NSString *embedderId;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedFloatNSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("values"));

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numToken);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("num_token"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numLayer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("num_layer"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_embeddingDim);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("embedding_dim"));

  }
LABEL_5:
  embedderId = self->_embedderId;
  if (embedderId)
    objc_msgSend(v3, "setObject:forKey:", embedderId, CFSTR("embedder_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALNLv4EmbeddingTensorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  char has;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_values.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_values.count);
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_6:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint64Field();
    v4 = v7;
  }
LABEL_8:
  if (self->_embedderId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  char has;
  void *v8;
  id v9;

  v9 = a3;
  if (-[SIRINLUINTERNALNLv4EmbeddingTensor valuesCount](self, "valuesCount"))
  {
    objc_msgSend(v9, "clearValues");
    v4 = -[SIRINLUINTERNALNLv4EmbeddingTensor valuesCount](self, "valuesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALNLv4EmbeddingTensor valuesAtIndex:](self, "valuesAtIndex:", i);
        objc_msgSend(v9, "addValues:");
      }
    }
  }
  has = (char)self->_has;
  v8 = v9;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v9 + 6) = self->_numToken;
    *((_BYTE *)v9 + 64) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v9 + 5) = self->_numLayer;
  *((_BYTE *)v9 + 64) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    *((_QWORD *)v9 + 4) = self->_embeddingDim;
    *((_BYTE *)v9 + 64) |= 1u;
  }
LABEL_9:
  if (self->_embedderId)
  {
    objc_msgSend(v9, "setEmbedderId:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedFloatCopy();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 40) = self->_numLayer;
    *(_BYTE *)(v5 + 64) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 48) = self->_numToken;
  *(_BYTE *)(v5 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 32) = self->_embeddingDim;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
LABEL_5:
  v7 = -[NSString copyWithZone:](self->_embedderId, "copyWithZone:", a3);
  v8 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v7;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *embedderId;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedFloatIsEqual())
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_numToken != *((_QWORD *)v4 + 6))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
LABEL_20:
    v6 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_numLayer != *((_QWORD *)v4 + 5))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_embeddingDim != *((_QWORD *)v4 + 4))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_20;
  }
  embedderId = self->_embedderId;
  if ((unint64_t)embedderId | *((_QWORD *)v4 + 7))
    v6 = -[NSString isEqual:](embedderId, "isEqual:");
  else
    v6 = 1;
LABEL_21:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = PBRepeatedFloatHash();
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_embedderId, "hash");
  }
  v4 = 2654435761u * self->_numToken;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761u * self->_numLayer;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761u * self->_embeddingDim;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_embedderId, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  unint64_t *v7;
  char v8;
  unint64_t *v9;

  v9 = (unint64_t *)a3;
  v4 = objc_msgSend(v9, "valuesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v9, "valuesAtIndex:", i);
      -[SIRINLUINTERNALNLv4EmbeddingTensor addValues:](self, "addValues:");
    }
  }
  v7 = v9;
  v8 = *((_BYTE *)v9 + 64);
  if ((v8 & 4) != 0)
  {
    self->_numToken = v9[6];
    *(_BYTE *)&self->_has |= 4u;
    v8 = *((_BYTE *)v9 + 64);
    if ((v8 & 2) == 0)
    {
LABEL_6:
      if ((v8 & 1) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((v9[8] & 2) == 0)
  {
    goto LABEL_6;
  }
  self->_numLayer = v9[5];
  *(_BYTE *)&self->_has |= 2u;
  if ((v9[8] & 1) != 0)
  {
LABEL_7:
    self->_embeddingDim = v9[4];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_8:
  if (v9[7])
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor setEmbedderId:](self, "setEmbedderId:");
    v7 = v9;
  }

}

- (unint64_t)numToken
{
  return self->_numToken;
}

- (unint64_t)numLayer
{
  return self->_numLayer;
}

- (unint64_t)embeddingDim
{
  return self->_embeddingDim;
}

- (NSString)embedderId
{
  return self->_embedderId;
}

- (void)setEmbedderId:(id)a3
{
  objc_storeStrong((id *)&self->_embedderId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedderId, 0);
}

@end

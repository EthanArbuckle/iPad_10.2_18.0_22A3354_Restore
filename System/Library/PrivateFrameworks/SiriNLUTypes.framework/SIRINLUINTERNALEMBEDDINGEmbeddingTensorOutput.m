@implementation SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput

- (BOOL)hasEmbeddingVersion
{
  return self->_embeddingVersion != 0;
}

- (BOOL)hasEmbeddingTensor
{
  return self->_embeddingTensor != 0;
}

- (BOOL)hasSentenceEmbeddingTensor
{
  return self->_sentenceEmbeddingTensor != 0;
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

- (void)setIsStableEmbeddingsVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isStableEmbeddingsVersion = a3;
}

- (void)setHasIsStableEmbeddingsVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsStableEmbeddingsVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput;
  -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *embeddingVersion;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  void *v7;
  SIRINLUINTERNALNLv4EmbeddingTensor *sentenceEmbeddingTensor;
  void *v9;
  char has;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  embeddingVersion = self->_embeddingVersion;
  if (embeddingVersion)
    objc_msgSend(v3, "setObject:forKey:", embeddingVersion, CFSTR("embedding_version"));
  embeddingTensor = self->_embeddingTensor;
  if (embeddingTensor)
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor dictionaryRepresentation](embeddingTensor, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("embedding_tensor"));

  }
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  if (sentenceEmbeddingTensor)
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor dictionaryRepresentation](sentenceEmbeddingTensor, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("sentence_embedding_tensor"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_embeddingDim);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("embedding_dim"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStableEmbeddingsVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("is_stable_embeddings_version"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutputReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_embeddingVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_embeddingTensor)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sentenceEmbeddingTensor)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_embeddingVersion)
  {
    objc_msgSend(v4, "setEmbeddingVersion:");
    v4 = v6;
  }
  if (self->_embeddingTensor)
  {
    objc_msgSend(v6, "setEmbeddingTensor:");
    v4 = v6;
  }
  if (self->_sentenceEmbeddingTensor)
  {
    objc_msgSend(v6, "setSentenceEmbeddingTensor:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_embeddingDim;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_isStableEmbeddingsVersion;
    *((_BYTE *)v4 + 44) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_embeddingVersion, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[SIRINLUINTERNALNLv4EmbeddingTensor copyWithZone:](self->_embeddingTensor, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[SIRINLUINTERNALNLv4EmbeddingTensor copyWithZone:](self->_sentenceEmbeddingTensor, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_embeddingDim;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_isStableEmbeddingsVersion;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *embeddingVersion;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  SIRINLUINTERNALNLv4EmbeddingTensor *sentenceEmbeddingTensor;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  embeddingVersion = self->_embeddingVersion;
  if ((unint64_t)embeddingVersion | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](embeddingVersion, "isEqual:"))
      goto LABEL_15;
  }
  embeddingTensor = self->_embeddingTensor;
  if ((unint64_t)embeddingTensor | *((_QWORD *)v4 + 2))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddingTensor, "isEqual:"))
      goto LABEL_15;
  }
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  if ((unint64_t)sentenceEmbeddingTensor | *((_QWORD *)v4 + 4))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](sentenceEmbeddingTensor, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_embeddingDim != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_15;
  }
  v8 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
    {
LABEL_15:
      v8 = 0;
      goto LABEL_16;
    }
    if (self->_isStableEmbeddingsVersion)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_15;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_15;
    }
    v8 = 1;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_embeddingVersion, "hash");
  v4 = -[SIRINLUINTERNALNLv4EmbeddingTensor hash](self->_embeddingTensor, "hash");
  v5 = -[SIRINLUINTERNALNLv4EmbeddingTensor hash](self->_sentenceEmbeddingTensor, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761u * self->_embeddingDim;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_isStableEmbeddingsVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  uint64_t v6;
  SIRINLUINTERNALNLv4EmbeddingTensor *sentenceEmbeddingTensor;
  uint64_t v8;
  char v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput setEmbeddingVersion:](self, "setEmbeddingVersion:");
    v4 = v10;
  }
  embeddingTensor = self->_embeddingTensor;
  v6 = *((_QWORD *)v4 + 2);
  if (embeddingTensor)
  {
    if (!v6)
      goto LABEL_9;
    -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddingTensor, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput setEmbeddingTensor:](self, "setEmbeddingTensor:");
  }
  v4 = v10;
LABEL_9:
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  v8 = *((_QWORD *)v4 + 4);
  if (sentenceEmbeddingTensor)
  {
    if (!v8)
      goto LABEL_15;
    -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](sentenceEmbeddingTensor, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput setSentenceEmbeddingTensor:](self, "setSentenceEmbeddingTensor:");
  }
  v4 = v10;
LABEL_15:
  v9 = *((_BYTE *)v4 + 44);
  if ((v9 & 1) != 0)
  {
    self->_embeddingDim = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v9 = *((_BYTE *)v4 + 44);
  }
  if ((v9 & 2) != 0)
  {
    self->_isStableEmbeddingsVersion = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)embeddingVersion
{
  return self->_embeddingVersion;
}

- (void)setEmbeddingVersion:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingVersion, a3);
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (void)setEmbeddingTensor:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingTensor, a3);
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)sentenceEmbeddingTensor
{
  return self->_sentenceEmbeddingTensor;
}

- (void)setSentenceEmbeddingTensor:(id)a3
{
  objc_storeStrong((id *)&self->_sentenceEmbeddingTensor, a3);
}

- (unint64_t)embeddingDim
{
  return self->_embeddingDim;
}

- (BOOL)isStableEmbeddingsVersion
{
  return self->_isStableEmbeddingsVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentenceEmbeddingTensor, 0);
  objc_storeStrong((id *)&self->_embeddingVersion, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
}

@end

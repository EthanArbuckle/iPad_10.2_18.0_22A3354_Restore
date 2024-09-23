@implementation SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse

- (BOOL)hasSubwordTokenChain
{
  return self->_subwordTokenChain != 0;
}

- (BOOL)hasSubwordTokenEmbedding
{
  return self->_subwordTokenEmbedding != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse;
  -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALSubwordTokenChain *subwordTokenChain;
  void *v5;
  SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *subwordTokenEmbedding;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  subwordTokenChain = self->_subwordTokenChain;
  if (subwordTokenChain)
  {
    -[SIRINLUINTERNALSubwordTokenChain dictionaryRepresentation](subwordTokenChain, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subword_token_chain"));

  }
  subwordTokenEmbedding = self->_subwordTokenEmbedding;
  if (subwordTokenEmbedding)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput dictionaryRepresentation](subwordTokenEmbedding, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("subword_token_embedding"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_subwordTokenChain)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subwordTokenEmbedding)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_subwordTokenChain)
  {
    objc_msgSend(v4, "setSubwordTokenChain:");
    v4 = v5;
  }
  if (self->_subwordTokenEmbedding)
  {
    objc_msgSend(v5, "setSubwordTokenEmbedding:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALSubwordTokenChain copyWithZone:](self->_subwordTokenChain, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput copyWithZone:](self->_subwordTokenEmbedding, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSubwordTokenChain *subwordTokenChain;
  SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *subwordTokenEmbedding;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((subwordTokenChain = self->_subwordTokenChain, !((unint64_t)subwordTokenChain | v4[1]))
     || -[SIRINLUINTERNALSubwordTokenChain isEqual:](subwordTokenChain, "isEqual:")))
  {
    subwordTokenEmbedding = self->_subwordTokenEmbedding;
    if ((unint64_t)subwordTokenEmbedding | v4[2])
      v7 = -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput isEqual:](subwordTokenEmbedding, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SIRINLUINTERNALSubwordTokenChain hash](self->_subwordTokenChain, "hash");
  return -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput hash](self->_subwordTokenEmbedding, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSubwordTokenChain *subwordTokenChain;
  uint64_t v6;
  SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *subwordTokenEmbedding;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  subwordTokenChain = self->_subwordTokenChain;
  v6 = v4[1];
  v9 = v4;
  if (subwordTokenChain)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALSubwordTokenChain mergeFrom:](subwordTokenChain, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse setSubwordTokenChain:](self, "setSubwordTokenChain:");
  }
  v4 = v9;
LABEL_7:
  subwordTokenEmbedding = self->_subwordTokenEmbedding;
  v8 = v4[2];
  if (subwordTokenEmbedding)
  {
    if (v8)
    {
      -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput mergeFrom:](subwordTokenEmbedding, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse setSubwordTokenEmbedding:](self, "setSubwordTokenEmbedding:");
    goto LABEL_12;
  }

}

- (SIRINLUINTERNALSubwordTokenChain)subwordTokenChain
{
  return self->_subwordTokenChain;
}

- (void)setSubwordTokenChain:(id)a3
{
  objc_storeStrong((id *)&self->_subwordTokenChain, a3);
}

- (SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput)subwordTokenEmbedding
{
  return self->_subwordTokenEmbedding;
}

- (void)setSubwordTokenEmbedding:(id)a3
{
  objc_storeStrong((id *)&self->_subwordTokenEmbedding, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subwordTokenEmbedding, 0);
  objc_storeStrong((id *)&self->_subwordTokenChain, 0);
}

@end

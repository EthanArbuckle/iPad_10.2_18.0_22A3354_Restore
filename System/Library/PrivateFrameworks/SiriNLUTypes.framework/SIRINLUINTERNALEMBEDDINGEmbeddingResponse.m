@implementation SIRINLUINTERNALEMBEDDINGEmbeddingResponse

- (BOOL)hasEmbeddingTensor
{
  return self->_embeddingTensor != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (void)setNumToken:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numToken = a3;
}

- (void)setHasNumToken:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumToken
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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

- (BOOL)hasSentenceEmbeddingTensor
{
  return self->_sentenceEmbeddingTensor != 0;
}

- (void)clearEmbeddingTensorOutputs
{
  -[NSMutableArray removeAllObjects](self->_embeddingTensorOutputs, "removeAllObjects");
}

- (void)addEmbeddingTensorOutputs:(id)a3
{
  id v4;
  NSMutableArray *embeddingTensorOutputs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  embeddingTensorOutputs = self->_embeddingTensorOutputs;
  v8 = v4;
  if (!embeddingTensorOutputs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_embeddingTensorOutputs;
    self->_embeddingTensorOutputs = v6;

    v4 = v8;
    embeddingTensorOutputs = self->_embeddingTensorOutputs;
  }
  -[NSMutableArray addObject:](embeddingTensorOutputs, "addObject:", v4);

}

- (unint64_t)embeddingTensorOutputsCount
{
  return -[NSMutableArray count](self->_embeddingTensorOutputs, "count");
}

- (id)embeddingTensorOutputsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_embeddingTensorOutputs, "objectAtIndex:", a3);
}

- (BOOL)hasSubwordTokenChain
{
  return self->_subwordTokenChain != 0;
}

- (void)setNumSubwordToken:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numSubwordToken = a3;
}

- (void)setHasNumSubwordToken:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSubwordToken
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearSubwordEmbeddingTensorOutputs
{
  -[NSMutableArray removeAllObjects](self->_subwordEmbeddingTensorOutputs, "removeAllObjects");
}

- (void)addSubwordEmbeddingTensorOutputs:(id)a3
{
  id v4;
  NSMutableArray *subwordEmbeddingTensorOutputs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subwordEmbeddingTensorOutputs = self->_subwordEmbeddingTensorOutputs;
  v8 = v4;
  if (!subwordEmbeddingTensorOutputs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_subwordEmbeddingTensorOutputs;
    self->_subwordEmbeddingTensorOutputs = v6;

    v4 = v8;
    subwordEmbeddingTensorOutputs = self->_subwordEmbeddingTensorOutputs;
  }
  -[NSMutableArray addObject:](subwordEmbeddingTensorOutputs, "addObject:", v4);

}

- (unint64_t)subwordEmbeddingTensorOutputsCount
{
  return -[NSMutableArray count](self->_subwordEmbeddingTensorOutputs, "count");
}

- (id)subwordEmbeddingTensorOutputsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subwordEmbeddingTensorOutputs, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALEMBEDDINGEmbeddingResponse;
  -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  void *v5;
  SIRINLUINTERNALTokenChain *tokenChain;
  void *v7;
  char has;
  void *v9;
  SIRINLUINTERNALNLv4EmbeddingTensor *sentenceEmbeddingTensor;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  SIRINLUINTERNALSubwordTokenChain *subwordTokenChain;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  embeddingTensor = self->_embeddingTensor;
  if (embeddingTensor)
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor dictionaryRepresentation](embeddingTensor, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("embedding_tensor"));

  }
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    -[SIRINLUINTERNALTokenChain dictionaryRepresentation](tokenChain, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("token_chain"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numToken);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("num_token"));

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numLayer);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("num_layer"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_embeddingDim);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("embedding_dim"));

  }
LABEL_9:
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  if (sentenceEmbeddingTensor)
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor dictionaryRepresentation](sentenceEmbeddingTensor, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("sentence_embedding_tensor"));

  }
  if (-[NSMutableArray count](self->_embeddingTensorOutputs, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_embeddingTensorOutputs, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v13 = self->_embeddingTensorOutputs;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("embedding_tensor_outputs"));
  }
  subwordTokenChain = self->_subwordTokenChain;
  if (subwordTokenChain)
  {
    -[SIRINLUINTERNALSubwordTokenChain dictionaryRepresentation](subwordTokenChain, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("subword_token_chain"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numSubwordToken);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("num_subword_token"));

  }
  if (-[NSMutableArray count](self->_subwordEmbeddingTensorOutputs, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_subwordEmbeddingTensorOutputs, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = self->_subwordEmbeddingTensorOutputs;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v32);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("subword_embedding_tensor_outputs"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALEMBEDDINGEmbeddingResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_embeddingTensor)
    PBDataWriterWriteSubmessage();
  if (self->_tokenChain)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
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
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_8:
    PBDataWriterWriteUint64Field();
LABEL_9:
  if (self->_sentenceEmbeddingTensor)
    PBDataWriterWriteSubmessage();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_embeddingTensorOutputs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  if (self->_subwordTokenChain)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_subwordEmbeddingTensorOutputs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (self->_embeddingTensor)
  {
    objc_msgSend(v4, "setEmbeddingTensor:");
    v4 = v14;
  }
  if (self->_tokenChain)
  {
    objc_msgSend(v14, "setTokenChain:");
    v4 = v14;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_numToken;
    *((_BYTE *)v4 + 88) |= 8u;
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
  *((_QWORD *)v4 + 2) = self->_numLayer;
  *((_BYTE *)v4 + 88) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 1) = self->_embeddingDim;
    *((_BYTE *)v4 + 88) |= 1u;
  }
LABEL_9:
  if (self->_sentenceEmbeddingTensor)
    objc_msgSend(v14, "setSentenceEmbeddingTensor:");
  if (-[SIRINLUINTERNALEMBEDDINGEmbeddingResponse embeddingTensorOutputsCount](self, "embeddingTensorOutputsCount"))
  {
    objc_msgSend(v14, "clearEmbeddingTensorOutputs");
    v6 = -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse embeddingTensorOutputsCount](self, "embeddingTensorOutputsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse embeddingTensorOutputsAtIndex:](self, "embeddingTensorOutputsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addEmbeddingTensorOutputs:", v9);

      }
    }
  }
  if (self->_subwordTokenChain)
    objc_msgSend(v14, "setSubwordTokenChain:");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v14 + 3) = self->_numSubwordToken;
    *((_BYTE *)v14 + 88) |= 4u;
  }
  if (-[SIRINLUINTERNALEMBEDDINGEmbeddingResponse subwordEmbeddingTensorOutputsCount](self, "subwordEmbeddingTensorOutputsCount"))
  {
    objc_msgSend(v14, "clearSubwordEmbeddingTensorOutputs");
    v10 = -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse subwordEmbeddingTensorOutputsCount](self, "subwordEmbeddingTensorOutputsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse subwordEmbeddingTensorOutputsAtIndex:](self, "subwordEmbeddingTensorOutputsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubwordEmbeddingTensorOutputs:", v13);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALNLv4EmbeddingTensor copyWithZone:](self->_embeddingTensor, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[SIRINLUINTERNALTokenChain copyWithZone:](self->_tokenChain, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_numToken;
    *(_BYTE *)(v5 + 88) |= 8u;
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
  *(_QWORD *)(v5 + 16) = self->_numLayer;
  *(_BYTE *)(v5 + 88) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_embeddingDim;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
LABEL_5:
  v11 = -[SIRINLUINTERNALNLv4EmbeddingTensor copyWithZone:](self->_sentenceEmbeddingTensor, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = self->_embeddingTensorOutputs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEmbeddingTensorOutputs:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v15);
  }

  v19 = -[SIRINLUINTERNALSubwordTokenChain copyWithZone:](self->_subwordTokenChain, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v19;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_numSubwordToken;
    *(_BYTE *)(v5 + 88) |= 4u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self->_subwordEmbeddingTensorOutputs;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v5, "addSubwordEmbeddingTensorOutputs:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v23);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  SIRINLUINTERNALTokenChain *tokenChain;
  SIRINLUINTERNALNLv4EmbeddingTensor *sentenceEmbeddingTensor;
  NSMutableArray *embeddingTensorOutputs;
  SIRINLUINTERNALSubwordTokenChain *subwordTokenChain;
  NSMutableArray *subwordEmbeddingTensorOutputs;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  embeddingTensor = self->_embeddingTensor;
  if ((unint64_t)embeddingTensor | *((_QWORD *)v4 + 5))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddingTensor, "isEqual:"))
      goto LABEL_34;
  }
  tokenChain = self->_tokenChain;
  if ((unint64_t)tokenChain | *((_QWORD *)v4 + 10))
  {
    if (!-[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
      goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0 || self->_numToken != *((_QWORD *)v4 + 4))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
LABEL_34:
    v11 = 0;
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_numLayer != *((_QWORD *)v4 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_embeddingDim != *((_QWORD *)v4 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_34;
  }
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  if ((unint64_t)sentenceEmbeddingTensor | *((_QWORD *)v4 + 7)
    && !-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](sentenceEmbeddingTensor, "isEqual:"))
  {
    goto LABEL_34;
  }
  embeddingTensorOutputs = self->_embeddingTensorOutputs;
  if ((unint64_t)embeddingTensorOutputs | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](embeddingTensorOutputs, "isEqual:"))
      goto LABEL_34;
  }
  subwordTokenChain = self->_subwordTokenChain;
  if ((unint64_t)subwordTokenChain | *((_QWORD *)v4 + 9))
  {
    if (!-[SIRINLUINTERNALSubwordTokenChain isEqual:](subwordTokenChain, "isEqual:"))
      goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_numSubwordToken != *((_QWORD *)v4 + 3))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_34;
  }
  subwordEmbeddingTensorOutputs = self->_subwordEmbeddingTensorOutputs;
  if ((unint64_t)subwordEmbeddingTensorOutputs | *((_QWORD *)v4 + 8))
    v11 = -[NSMutableArray isEqual:](subwordEmbeddingTensorOutputs, "isEqual:");
  else
    v11 = 1;
LABEL_35:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = -[SIRINLUINTERNALNLv4EmbeddingTensor hash](self->_embeddingTensor, "hash");
  v4 = -[SIRINLUINTERNALTokenChain hash](self->_tokenChain, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v5 = 2654435761u * self->_numToken;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761u * self->_numLayer;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v7 = 2654435761u * self->_embeddingDim;
    goto LABEL_8;
  }
LABEL_7:
  v7 = 0;
LABEL_8:
  v8 = -[SIRINLUINTERNALNLv4EmbeddingTensor hash](self->_sentenceEmbeddingTensor, "hash");
  v9 = -[NSMutableArray hash](self->_embeddingTensorOutputs, "hash");
  v10 = -[SIRINLUINTERNALSubwordTokenChain hash](self->_subwordTokenChain, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761u * self->_numSubwordToken;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSMutableArray hash](self->_subwordEmbeddingTensorOutputs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  uint64_t v6;
  SIRINLUINTERNALTokenChain *tokenChain;
  uint64_t v8;
  char v9;
  SIRINLUINTERNALNLv4EmbeddingTensor *sentenceEmbeddingTensor;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  SIRINLUINTERNALSubwordTokenChain *subwordTokenChain;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  embeddingTensor = self->_embeddingTensor;
  v6 = *((_QWORD *)v4 + 5);
  if (embeddingTensor)
  {
    if (v6)
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddingTensor, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse setEmbeddingTensor:](self, "setEmbeddingTensor:");
  }
  tokenChain = self->_tokenChain;
  v8 = *((_QWORD *)v4 + 10);
  if (tokenChain)
  {
    if (v8)
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse setTokenChain:](self, "setTokenChain:");
  }
  v9 = *((_BYTE *)v4 + 88);
  if ((v9 & 8) != 0)
  {
    self->_numToken = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v9 = *((_BYTE *)v4 + 88);
    if ((v9 & 2) == 0)
    {
LABEL_13:
      if ((v9 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_numLayer = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_14:
    self->_embeddingDim = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_15:
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  v11 = *((_QWORD *)v4 + 7);
  if (sentenceEmbeddingTensor)
  {
    if (v11)
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](sentenceEmbeddingTensor, "mergeFrom:");
  }
  else if (v11)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse setSentenceEmbeddingTensor:](self, "setSentenceEmbeddingTensor:");
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = *((id *)v4 + 6);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse addEmbeddingTensorOutputs:](self, "addEmbeddingTensorOutputs:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v14);
  }

  subwordTokenChain = self->_subwordTokenChain;
  v18 = *((_QWORD *)v4 + 9);
  if (subwordTokenChain)
  {
    if (v18)
      -[SIRINLUINTERNALSubwordTokenChain mergeFrom:](subwordTokenChain, "mergeFrom:");
  }
  else if (v18)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse setSubwordTokenChain:](self, "setSubwordTokenChain:");
  }
  if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    self->_numSubwordToken = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = *((id *)v4 + 8);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse addSubwordEmbeddingTensorOutputs:](self, "addSubwordEmbeddingTensorOutputs:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), (_QWORD)v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v21);
  }

}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (void)setEmbeddingTensor:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingTensor, a3);
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setTokenChain:(id)a3
{
  objc_storeStrong((id *)&self->_tokenChain, a3);
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

- (SIRINLUINTERNALNLv4EmbeddingTensor)sentenceEmbeddingTensor
{
  return self->_sentenceEmbeddingTensor;
}

- (void)setSentenceEmbeddingTensor:(id)a3
{
  objc_storeStrong((id *)&self->_sentenceEmbeddingTensor, a3);
}

- (NSMutableArray)embeddingTensorOutputs
{
  return self->_embeddingTensorOutputs;
}

- (void)setEmbeddingTensorOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingTensorOutputs, a3);
}

- (SIRINLUINTERNALSubwordTokenChain)subwordTokenChain
{
  return self->_subwordTokenChain;
}

- (void)setSubwordTokenChain:(id)a3
{
  objc_storeStrong((id *)&self->_subwordTokenChain, a3);
}

- (unint64_t)numSubwordToken
{
  return self->_numSubwordToken;
}

- (NSMutableArray)subwordEmbeddingTensorOutputs
{
  return self->_subwordEmbeddingTensorOutputs;
}

- (void)setSubwordEmbeddingTensorOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_subwordEmbeddingTensorOutputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_subwordTokenChain, 0);
  objc_storeStrong((id *)&self->_subwordEmbeddingTensorOutputs, 0);
  objc_storeStrong((id *)&self->_sentenceEmbeddingTensor, 0);
  objc_storeStrong((id *)&self->_embeddingTensorOutputs, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
}

+ (Class)embeddingTensorOutputsType
{
  return (Class)objc_opt_class();
}

+ (Class)subwordEmbeddingTensorOutputsType
{
  return (Class)objc_opt_class();
}

@end

@implementation SIRINLUINTERNALQUERYREWRITEQRUtterance

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (void)clearUtteranceTokens
{
  -[NSMutableArray removeAllObjects](self->_utteranceTokens, "removeAllObjects");
}

- (void)addUtteranceTokens:(id)a3
{
  id v4;
  NSMutableArray *utteranceTokens;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  utteranceTokens = self->_utteranceTokens;
  v8 = v4;
  if (!utteranceTokens)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_utteranceTokens;
    self->_utteranceTokens = v6;

    v4 = v8;
    utteranceTokens = self->_utteranceTokens;
  }
  -[NSMutableArray addObject:](utteranceTokens, "addObject:", v4);

}

- (unint64_t)utteranceTokensCount
{
  return -[NSMutableArray count](self->_utteranceTokens, "count");
}

- (id)utteranceTokensAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_utteranceTokens, "objectAtIndex:", a3);
}

- (void)clearAsrUtteranceTokens
{
  -[NSMutableArray removeAllObjects](self->_asrUtteranceTokens, "removeAllObjects");
}

- (void)addAsrUtteranceTokens:(id)a3
{
  id v4;
  NSMutableArray *asrUtteranceTokens;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  asrUtteranceTokens = self->_asrUtteranceTokens;
  v8 = v4;
  if (!asrUtteranceTokens)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_asrUtteranceTokens;
    self->_asrUtteranceTokens = v6;

    v4 = v8;
    asrUtteranceTokens = self->_asrUtteranceTokens;
  }
  -[NSMutableArray addObject:](asrUtteranceTokens, "addObject:", v4);

}

- (unint64_t)asrUtteranceTokensCount
{
  return -[NSMutableArray count](self->_asrUtteranceTokens, "count");
}

- (id)asrUtteranceTokensAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_asrUtteranceTokens, "objectAtIndex:", a3);
}

- (void)setConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)SIRINLUINTERNALQUERYREWRITEQRUtterance;
  -[SIRINLUINTERNALQUERYREWRITEQRUtterance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALQUERYREWRITEQRUtterance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUUID *asrId;
  void *v5;
  NSString *utterance;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  asrId = self->_asrId;
  if (asrId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](asrId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("asr_id"));

  }
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v3, "setObject:forKey:", utterance, CFSTR("utterance"));
  if (-[NSMutableArray count](self->_utteranceTokens, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_utteranceTokens, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = self->_utteranceTokens;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("utterance_tokens"));
  }
  if (-[NSMutableArray count](self->_asrUtteranceTokens, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_asrUtteranceTokens, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = self->_asrUtteranceTokens;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v23);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("asr_utterance_tokens"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("confidence"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALQUERYREWRITEQRUtteranceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_asrId)
    PBDataWriterWriteSubmessage();
  if (self->_utterance)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_utteranceTokens;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_asrUtteranceTokens;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_asrId)
    objc_msgSend(v12, "setAsrId:");
  if (self->_utterance)
    objc_msgSend(v12, "setUtterance:");
  if (-[SIRINLUINTERNALQUERYREWRITEQRUtterance utteranceTokensCount](self, "utteranceTokensCount"))
  {
    objc_msgSend(v12, "clearUtteranceTokens");
    v4 = -[SIRINLUINTERNALQUERYREWRITEQRUtterance utteranceTokensCount](self, "utteranceTokensCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALQUERYREWRITEQRUtterance utteranceTokensAtIndex:](self, "utteranceTokensAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addUtteranceTokens:", v7);

      }
    }
  }
  if (-[SIRINLUINTERNALQUERYREWRITEQRUtterance asrUtteranceTokensCount](self, "asrUtteranceTokensCount"))
  {
    objc_msgSend(v12, "clearAsrUtteranceTokens");
    v8 = -[SIRINLUINTERNALQUERYREWRITEQRUtterance asrUtteranceTokensCount](self, "asrUtteranceTokensCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUINTERNALQUERYREWRITEQRUtterance asrUtteranceTokensAtIndex:](self, "asrUtteranceTokensAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAsrUtteranceTokens:", v11);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v12 + 1) = *(_QWORD *)&self->_confidence;
    *((_BYTE *)v12 + 48) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_asrId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_utteranceTokens;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addUtteranceTokens:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_asrUtteranceTokens;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v5, "addAsrUtteranceTokens:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *asrId;
  NSString *utterance;
  NSMutableArray *utteranceTokens;
  NSMutableArray *asrUtteranceTokens;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  asrId = self->_asrId;
  if ((unint64_t)asrId | *((_QWORD *)v4 + 2))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:"))
      goto LABEL_14;
  }
  utterance = self->_utterance;
  if ((unint64_t)utterance | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](utterance, "isEqual:"))
      goto LABEL_14;
  }
  utteranceTokens = self->_utteranceTokens;
  if ((unint64_t)utteranceTokens | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](utteranceTokens, "isEqual:"))
      goto LABEL_14;
  }
  asrUtteranceTokens = self->_asrUtteranceTokens;
  if ((unint64_t)asrUtteranceTokens | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](asrUtteranceTokens, "isEqual:"))
      goto LABEL_14;
  }
  v9 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0 && self->_confidence == *((double *)v4 + 1))
    {
      v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double confidence;
  double v9;
  long double v10;
  double v11;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_asrId, "hash");
  v4 = -[NSString hash](self->_utterance, "hash");
  v5 = -[NSMutableArray hash](self->_utteranceTokens, "hash");
  v6 = -[NSMutableArray hash](self->_asrUtteranceTokens, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    confidence = self->_confidence;
    v9 = -confidence;
    if (confidence >= 0.0)
      v9 = self->_confidence;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *asrId;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  asrId = self->_asrId;
  v6 = *((_QWORD *)v4 + 2);
  if (asrId)
  {
    if (v6)
      -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALQUERYREWRITEQRUtterance setAsrId:](self, "setAsrId:");
  }
  if (*((_QWORD *)v4 + 4))
    -[SIRINLUINTERNALQUERYREWRITEQRUtterance setUtterance:](self, "setUtterance:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUINTERNALQUERYREWRITEQRUtterance addUtteranceTokens:](self, "addUtteranceTokens:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUINTERNALQUERYREWRITEQRUtterance addAsrUtteranceTokens:](self, "addAsrUtteranceTokens:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_confidence = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)setAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_asrId, a3);
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (NSMutableArray)utteranceTokens
{
  return self->_utteranceTokens;
}

- (void)setUtteranceTokens:(id)a3
{
  objc_storeStrong((id *)&self->_utteranceTokens, a3);
}

- (NSMutableArray)asrUtteranceTokens
{
  return self->_asrUtteranceTokens;
}

- (void)setAsrUtteranceTokens:(id)a3
{
  objc_storeStrong((id *)&self->_asrUtteranceTokens, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceTokens, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_asrUtteranceTokens, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

+ (id)options
{
  if (options_once != -1)
    dispatch_once(&options_once, &__block_literal_global);
  return (id)options_sOptions;
}

+ (Class)utteranceTokensType
{
  return (Class)objc_opt_class();
}

+ (Class)asrUtteranceTokensType
{
  return (Class)objc_opt_class();
}

void __49__SIRINLUINTERNALQUERYREWRITEQRUtterance_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions;
  options_sOptions = (uint64_t)&unk_1E7BD2BE8;

}

@end

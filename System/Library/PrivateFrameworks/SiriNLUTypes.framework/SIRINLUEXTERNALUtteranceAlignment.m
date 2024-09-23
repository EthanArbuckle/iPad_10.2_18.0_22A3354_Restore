@implementation SIRINLUEXTERNALUtteranceAlignment

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_asrHypothesisIndex = a3;
}

- (void)setHasAsrHypothesisIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAsrHypothesisIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearSpans
{
  -[NSMutableArray removeAllObjects](self->_spans, "removeAllObjects");
}

- (void)addSpans:(id)a3
{
  id v4;
  NSMutableArray *spans;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  spans = self->_spans;
  v8 = v4;
  if (!spans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_spans;
    self->_spans = v6;

    v4 = v8;
    spans = self->_spans;
  }
  -[NSMutableArray addObject:](spans, "addObject:", v4);

}

- (unint64_t)spansCount
{
  return -[NSMutableArray count](self->_spans, "count");
}

- (id)spansAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_spans, "objectAtIndex:", a3);
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nodeIndex = a3;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNodeIndex
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
  v8.super_class = (Class)SIRINLUEXTERNALUtteranceAlignment;
  -[SIRINLUEXTERNALUtteranceAlignment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUtteranceAlignment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_asrHypothesisIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("asr_hypothesis_index"));

  }
  if (-[NSMutableArray count](self->_spans, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_spans, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_spans;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "dictionaryRepresentation", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("spans"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nodeIndex);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("node_index"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUtteranceAlignmentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_spans;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_asrHypothesisIndex;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  v9 = v4;
  if (-[SIRINLUEXTERNALUtteranceAlignment spansCount](self, "spansCount"))
  {
    objc_msgSend(v9, "clearSpans");
    v5 = -[SIRINLUEXTERNALUtteranceAlignment spansCount](self, "spansCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[SIRINLUEXTERNALUtteranceAlignment spansAtIndex:](self, "spansAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSpans:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v9 + 3) = self->_nodeIndex;
    *((_BYTE *)v9 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_asrHypothesisIndex;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_spans;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend((id)v6, "addSpans:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_nodeIndex;
    *(_BYTE *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *spans;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 24);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_asrHypothesisIndex != *((_DWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  spans = self->_spans;
  if ((unint64_t)spans | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](spans, "isEqual:"))
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 24);
  }
  v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_nodeIndex != *((_DWORD *)v4 + 3))
      goto LABEL_14;
    v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_asrHypothesisIndex;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_spans, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_nodeIndex;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _DWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_asrHypothesisIndex = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SIRINLUEXTERNALUtteranceAlignment addSpans:](self, "addSpans:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((v5[6] & 2) != 0)
  {
    self->_nodeIndex = v5[3];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (NSMutableArray)spans
{
  return self->_spans;
}

- (void)setSpans:(id)a3
{
  objc_storeStrong((id *)&self->_spans, a3);
}

- (unsigned)nodeIndex
{
  return self->_nodeIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spans, 0);
}

+ (Class)spansType
{
  return (Class)objc_opt_class();
}

@end

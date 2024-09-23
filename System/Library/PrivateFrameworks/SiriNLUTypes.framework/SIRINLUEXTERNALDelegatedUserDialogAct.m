@implementation SIRINLUEXTERNALDelegatedUserDialogAct

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

- (BOOL)hasRewrittenUtterance
{
  return self->_rewrittenUtterance != 0;
}

- (BOOL)hasExternalParserId
{
  return self->_externalParserId != 0;
}

- (void)clearMatchingSpans
{
  -[NSMutableArray removeAllObjects](self->_matchingSpans, "removeAllObjects");
}

- (void)addMatchingSpans:(id)a3
{
  id v4;
  NSMutableArray *matchingSpans;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  matchingSpans = self->_matchingSpans;
  v8 = v4;
  if (!matchingSpans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_matchingSpans;
    self->_matchingSpans = v6;

    v4 = v8;
    matchingSpans = self->_matchingSpans;
  }
  -[NSMutableArray addObject:](matchingSpans, "addObject:", v4);

}

- (unint64_t)matchingSpansCount
{
  return -[NSMutableArray count](self->_matchingSpans, "count");
}

- (id)matchingSpansAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_matchingSpans, "objectAtIndex:", a3);
}

- (BOOL)hasRewrite
{
  return self->_rewrite != 0;
}

- (BOOL)hasReferenceContext
{
  return self->_referenceContext != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALDelegatedUserDialogAct;
  -[SIRINLUEXTERNALDelegatedUserDialogAct description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALDelegatedUserDialogAct dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  SIRICOMMONStringValue *rewrittenUtterance;
  void *v6;
  NSString *externalParserId;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  SIRINLUEXTERNALRewriteMessage *rewrite;
  void *v16;
  SIRINLUEXTERNALReferenceContext *referenceContext;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_asrHypothesisIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("asr_hypothesis_index"));

  }
  rewrittenUtterance = self->_rewrittenUtterance;
  if (rewrittenUtterance)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](rewrittenUtterance, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("rewritten_utterance"));

  }
  externalParserId = self->_externalParserId;
  if (externalParserId)
    objc_msgSend(v3, "setObject:forKey:", externalParserId, CFSTR("external_parser_id"));
  if (-[NSMutableArray count](self->_matchingSpans, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = self->_matchingSpans;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("matching_spans"));
  }
  rewrite = self->_rewrite;
  if (rewrite)
  {
    -[SIRINLUEXTERNALRewriteMessage dictionaryRepresentation](rewrite, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("rewrite"));

  }
  referenceContext = self->_referenceContext;
  if (referenceContext)
  {
    -[SIRINLUEXTERNALReferenceContext dictionaryRepresentation](referenceContext, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("reference_context"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALDelegatedUserDialogActReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_rewrittenUtterance)
    PBDataWriterWriteSubmessage();
  if (self->_externalParserId)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_matchingSpans;
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

  if (self->_rewrite)
    PBDataWriterWriteSubmessage();
  if (self->_referenceContext)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_asrHypothesisIndex;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v10 = v4;
  if (self->_rewrittenUtterance)
    objc_msgSend(v4, "setRewrittenUtterance:");
  if (self->_externalParserId)
    objc_msgSend(v10, "setExternalParserId:");
  if (-[SIRINLUEXTERNALDelegatedUserDialogAct matchingSpansCount](self, "matchingSpansCount"))
  {
    objc_msgSend(v10, "clearMatchingSpans");
    v5 = -[SIRINLUEXTERNALDelegatedUserDialogAct matchingSpansCount](self, "matchingSpansCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[SIRINLUEXTERNALDelegatedUserDialogAct matchingSpansAtIndex:](self, "matchingSpansAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addMatchingSpans:", v8);

      }
    }
  }
  if (self->_rewrite)
    objc_msgSend(v10, "setRewrite:");
  v9 = v10;
  if (self->_referenceContext)
  {
    objc_msgSend(v10, "setReferenceContext:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_asrHypothesisIndex;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[SIRICOMMONStringValue copyWithZone:](self->_rewrittenUtterance, "copyWithZone:", a3);
  v8 = (void *)v6[6];
  v6[6] = v7;

  v9 = -[NSString copyWithZone:](self->_externalParserId, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = self->_matchingSpans;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend(v6, "addMatchingSpans:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  v17 = -[SIRINLUEXTERNALRewriteMessage copyWithZone:](self->_rewrite, "copyWithZone:", a3);
  v18 = (void *)v6[5];
  v6[5] = v17;

  v19 = -[SIRINLUEXTERNALReferenceContext copyWithZone:](self->_referenceContext, "copyWithZone:", a3);
  v20 = (void *)v6[4];
  v6[4] = v19;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRICOMMONStringValue *rewrittenUtterance;
  NSString *externalParserId;
  NSMutableArray *matchingSpans;
  SIRINLUEXTERNALRewriteMessage *rewrite;
  SIRINLUEXTERNALReferenceContext *referenceContext;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_asrHypothesisIndex != *((_DWORD *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  rewrittenUtterance = self->_rewrittenUtterance;
  if ((unint64_t)rewrittenUtterance | *((_QWORD *)v4 + 6)
    && !-[SIRICOMMONStringValue isEqual:](rewrittenUtterance, "isEqual:"))
  {
    goto LABEL_17;
  }
  externalParserId = self->_externalParserId;
  if ((unint64_t)externalParserId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](externalParserId, "isEqual:"))
      goto LABEL_17;
  }
  matchingSpans = self->_matchingSpans;
  if ((unint64_t)matchingSpans | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
      goto LABEL_17;
  }
  rewrite = self->_rewrite;
  if ((unint64_t)rewrite | *((_QWORD *)v4 + 5))
  {
    if (!-[SIRINLUEXTERNALRewriteMessage isEqual:](rewrite, "isEqual:"))
      goto LABEL_17;
  }
  referenceContext = self->_referenceContext;
  if ((unint64_t)referenceContext | *((_QWORD *)v4 + 4))
    v10 = -[SIRINLUEXTERNALReferenceContext isEqual:](referenceContext, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_asrHypothesisIndex;
  else
    v3 = 0;
  v4 = -[SIRICOMMONStringValue hash](self->_rewrittenUtterance, "hash") ^ v3;
  v5 = -[NSString hash](self->_externalParserId, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_matchingSpans, "hash");
  v7 = -[SIRINLUEXTERNALRewriteMessage hash](self->_rewrite, "hash");
  return v6 ^ v7 ^ -[SIRINLUEXTERNALReferenceContext hash](self->_referenceContext, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  SIRICOMMONStringValue *rewrittenUtterance;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SIRINLUEXTERNALRewriteMessage *rewrite;
  uint64_t v14;
  SIRINLUEXTERNALReferenceContext *referenceContext;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[14] & 1) != 0)
  {
    self->_asrHypothesisIndex = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  rewrittenUtterance = self->_rewrittenUtterance;
  v7 = *((_QWORD *)v5 + 6);
  if (rewrittenUtterance)
  {
    if (v7)
      -[SIRICOMMONStringValue mergeFrom:](rewrittenUtterance, "mergeFrom:");
  }
  else if (v7)
  {
    -[SIRINLUEXTERNALDelegatedUserDialogAct setRewrittenUtterance:](self, "setRewrittenUtterance:");
  }
  if (*((_QWORD *)v5 + 2))
    -[SIRINLUEXTERNALDelegatedUserDialogAct setExternalParserId:](self, "setExternalParserId:");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = *((id *)v5 + 3);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        -[SIRINLUEXTERNALDelegatedUserDialogAct addMatchingSpans:](self, "addMatchingSpans:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  rewrite = self->_rewrite;
  v14 = *((_QWORD *)v5 + 5);
  if (rewrite)
  {
    if (v14)
      -[SIRINLUEXTERNALRewriteMessage mergeFrom:](rewrite, "mergeFrom:");
  }
  else if (v14)
  {
    -[SIRINLUEXTERNALDelegatedUserDialogAct setRewrite:](self, "setRewrite:");
  }
  referenceContext = self->_referenceContext;
  v16 = *((_QWORD *)v5 + 4);
  if (referenceContext)
  {
    if (v16)
      -[SIRINLUEXTERNALReferenceContext mergeFrom:](referenceContext, "mergeFrom:");
  }
  else if (v16)
  {
    -[SIRINLUEXTERNALDelegatedUserDialogAct setReferenceContext:](self, "setReferenceContext:");
  }

}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (SIRICOMMONStringValue)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void)setRewrittenUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, a3);
}

- (NSString)externalParserId
{
  return self->_externalParserId;
}

- (void)setExternalParserId:(id)a3
{
  objc_storeStrong((id *)&self->_externalParserId, a3);
}

- (NSMutableArray)matchingSpans
{
  return self->_matchingSpans;
}

- (void)setMatchingSpans:(id)a3
{
  objc_storeStrong((id *)&self->_matchingSpans, a3);
}

- (SIRINLUEXTERNALRewriteMessage)rewrite
{
  return self->_rewrite;
}

- (void)setRewrite:(id)a3
{
  objc_storeStrong((id *)&self->_rewrite, a3);
}

- (SIRINLUEXTERNALReferenceContext)referenceContext
{
  return self->_referenceContext;
}

- (void)setReferenceContext:(id)a3
{
  objc_storeStrong((id *)&self->_referenceContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, 0);
  objc_storeStrong((id *)&self->_rewrite, 0);
  objc_storeStrong((id *)&self->_referenceContext, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_externalParserId, 0);
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end

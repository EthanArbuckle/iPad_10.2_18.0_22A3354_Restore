@implementation SIRINLUEXTERNALNLUSupplementaryOutput

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

- (BOOL)hasCorrectionOutcome
{
  return self->_correctionOutcome != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALNLUSupplementaryOutput;
  -[SIRINLUEXTERNALNLUSupplementaryOutput description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLUSupplementaryOutput dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  SIRINLUEXTERNALRewriteMessage *rewrite;
  void *v12;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_matchingSpans, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_matchingSpans;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("matching_spans"));
  }
  rewrite = self->_rewrite;
  if (rewrite)
  {
    -[SIRINLUEXTERNALRewriteMessage dictionaryRepresentation](rewrite, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("rewrite"));

  }
  correctionOutcome = self->_correctionOutcome;
  if (correctionOutcome)
  {
    -[SIRINLUEXTERNALCorrectionOutcome dictionaryRepresentation](correctionOutcome, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("correction_outcome"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLUSupplementaryOutputReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
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
  if (self->_correctionOutcome)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[SIRINLUEXTERNALNLUSupplementaryOutput matchingSpansCount](self, "matchingSpansCount"))
  {
    objc_msgSend(v9, "clearMatchingSpans");
    v4 = -[SIRINLUEXTERNALNLUSupplementaryOutput matchingSpansCount](self, "matchingSpansCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALNLUSupplementaryOutput matchingSpansAtIndex:](self, "matchingSpansAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addMatchingSpans:", v7);

      }
    }
  }
  if (self->_rewrite)
    objc_msgSend(v9, "setRewrite:");
  v8 = v9;
  if (self->_correctionOutcome)
  {
    objc_msgSend(v9, "setCorrectionOutcome:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_matchingSpans;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addMatchingSpans:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = -[SIRINLUEXTERNALRewriteMessage copyWithZone:](self->_rewrite, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[SIRINLUEXTERNALCorrectionOutcome copyWithZone:](self->_correctionOutcome, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *matchingSpans;
  SIRINLUEXTERNALRewriteMessage *rewrite;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((matchingSpans = self->_matchingSpans, !((unint64_t)matchingSpans | v4[2]))
     || -[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
    && ((rewrite = self->_rewrite, !((unint64_t)rewrite | v4[3]))
     || -[SIRINLUEXTERNALRewriteMessage isEqual:](rewrite, "isEqual:")))
  {
    correctionOutcome = self->_correctionOutcome;
    if ((unint64_t)correctionOutcome | v4[1])
      v8 = -[SIRINLUEXTERNALCorrectionOutcome isEqual:](correctionOutcome, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSMutableArray hash](self->_matchingSpans, "hash");
  v4 = -[SIRINLUEXTERNALRewriteMessage hash](self->_rewrite, "hash") ^ v3;
  return v4 ^ -[SIRINLUEXTERNALCorrectionOutcome hash](self->_correctionOutcome, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  SIRINLUEXTERNALRewriteMessage *rewrite;
  id v11;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4[2];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[SIRINLUEXTERNALNLUSupplementaryOutput addMatchingSpans:](self, "addMatchingSpans:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  rewrite = self->_rewrite;
  v11 = v4[3];
  if (rewrite)
  {
    if (v11)
      -[SIRINLUEXTERNALRewriteMessage mergeFrom:](rewrite, "mergeFrom:");
  }
  else if (v11)
  {
    -[SIRINLUEXTERNALNLUSupplementaryOutput setRewrite:](self, "setRewrite:");
  }
  correctionOutcome = self->_correctionOutcome;
  v13 = v4[1];
  if (correctionOutcome)
  {
    if (v13)
      -[SIRINLUEXTERNALCorrectionOutcome mergeFrom:](correctionOutcome, "mergeFrom:");
  }
  else if (v13)
  {
    -[SIRINLUEXTERNALNLUSupplementaryOutput setCorrectionOutcome:](self, "setCorrectionOutcome:");
  }

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

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
}

- (void)setCorrectionOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_correctionOutcome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrite, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end

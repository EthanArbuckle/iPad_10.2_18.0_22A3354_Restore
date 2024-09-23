@implementation SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput

- (void)clearRequiredContexts
{
  -[NSMutableArray removeAllObjects](self->_requiredContexts, "removeAllObjects");
}

- (void)addRequiredContext:(id)a3
{
  id v4;
  NSMutableArray *requiredContexts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requiredContexts = self->_requiredContexts;
  v8 = v4;
  if (!requiredContexts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_requiredContexts;
    self->_requiredContexts = v6;

    v4 = v8;
    requiredContexts = self->_requiredContexts;
  }
  -[NSMutableArray addObject:](requiredContexts, "addObject:", v4);

}

- (unint64_t)requiredContextsCount
{
  return -[NSMutableArray count](self->_requiredContexts, "count");
}

- (id)requiredContextAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requiredContexts, "objectAtIndex:", a3);
}

- (void)clearOriginalRankedTools
{
  -[NSMutableArray removeAllObjects](self->_originalRankedTools, "removeAllObjects");
}

- (void)addOriginalRankedTools:(id)a3
{
  id v4;
  NSMutableArray *originalRankedTools;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  originalRankedTools = self->_originalRankedTools;
  v8 = v4;
  if (!originalRankedTools)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_originalRankedTools;
    self->_originalRankedTools = v6;

    v4 = v8;
    originalRankedTools = self->_originalRankedTools;
  }
  -[NSMutableArray addObject:](originalRankedTools, "addObject:", v4);

}

- (unint64_t)originalRankedToolsCount
{
  return -[NSMutableArray count](self->_originalRankedTools, "count");
}

- (id)originalRankedToolsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_originalRankedTools, "objectAtIndex:", a3);
}

- (void)clearAdjustedRankedTools
{
  -[NSMutableArray removeAllObjects](self->_adjustedRankedTools, "removeAllObjects");
}

- (void)addAdjustedRankedTools:(id)a3
{
  id v4;
  NSMutableArray *adjustedRankedTools;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  adjustedRankedTools = self->_adjustedRankedTools;
  v8 = v4;
  if (!adjustedRankedTools)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_adjustedRankedTools;
    self->_adjustedRankedTools = v6;

    v4 = v8;
    adjustedRankedTools = self->_adjustedRankedTools;
  }
  -[NSMutableArray addObject:](adjustedRankedTools, "addObject:", v4);

}

- (unint64_t)adjustedRankedToolsCount
{
  return -[NSMutableArray count](self->_adjustedRankedTools, "count");
}

- (id)adjustedRankedToolsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_adjustedRankedTools, "objectAtIndex:", a3);
}

- (void)clearOriginalRankedSpans
{
  -[NSMutableArray removeAllObjects](self->_originalRankedSpans, "removeAllObjects");
}

- (void)addOriginalRankedSpans:(id)a3
{
  id v4;
  NSMutableArray *originalRankedSpans;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  originalRankedSpans = self->_originalRankedSpans;
  v8 = v4;
  if (!originalRankedSpans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_originalRankedSpans;
    self->_originalRankedSpans = v6;

    v4 = v8;
    originalRankedSpans = self->_originalRankedSpans;
  }
  -[NSMutableArray addObject:](originalRankedSpans, "addObject:", v4);

}

- (unint64_t)originalRankedSpansCount
{
  return -[NSMutableArray count](self->_originalRankedSpans, "count");
}

- (id)originalRankedSpansAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_originalRankedSpans, "objectAtIndex:", a3);
}

- (void)clearAdjustedRankedSpans
{
  -[NSMutableArray removeAllObjects](self->_adjustedRankedSpans, "removeAllObjects");
}

- (void)addAdjustedRankedSpans:(id)a3
{
  id v4;
  NSMutableArray *adjustedRankedSpans;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  adjustedRankedSpans = self->_adjustedRankedSpans;
  v8 = v4;
  if (!adjustedRankedSpans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_adjustedRankedSpans;
    self->_adjustedRankedSpans = v6;

    v4 = v8;
    adjustedRankedSpans = self->_adjustedRankedSpans;
  }
  -[NSMutableArray addObject:](adjustedRankedSpans, "addObject:", v4);

}

- (unint64_t)adjustedRankedSpansCount
{
  return -[NSMutableArray count](self->_adjustedRankedSpans, "count");
}

- (id)adjustedRankedSpansAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_adjustedRankedSpans, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput;
  -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *originalRankedTools;
  NSMutableArray *adjustedRankedTools;
  NSMutableArray *originalRankedSpans;
  NSMutableArray *adjustedRankedSpans;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_requiredContexts, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_requiredContexts, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_requiredContexts;
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

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("required_context"));
  }
  originalRankedTools = self->_originalRankedTools;
  if (originalRankedTools)
    objc_msgSend(v3, "setObject:forKey:", originalRankedTools, CFSTR("original_ranked_tools"));
  adjustedRankedTools = self->_adjustedRankedTools;
  if (adjustedRankedTools)
    objc_msgSend(v3, "setObject:forKey:", adjustedRankedTools, CFSTR("adjusted_ranked_tools"));
  originalRankedSpans = self->_originalRankedSpans;
  if (originalRankedSpans)
    objc_msgSend(v3, "setObject:forKey:", originalRankedSpans, CFSTR("original_ranked_spans"));
  adjustedRankedSpans = self->_adjustedRankedSpans;
  if (adjustedRankedSpans)
    objc_msgSend(v3, "setObject:forKey:", adjustedRankedSpans, CFSTR("adjusted_ranked_spans"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutputReadFrom(self, (uint64_t)a3);
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = self->_requiredContexts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = self->_originalRankedTools;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_adjustedRankedTools;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_originalRankedSpans;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self->_adjustedRankedSpans;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  id v24;

  v24 = a3;
  if (-[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput requiredContextsCount](self, "requiredContextsCount"))
  {
    objc_msgSend(v24, "clearRequiredContexts");
    v4 = -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput requiredContextsCount](self, "requiredContextsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput requiredContextAtIndex:](self, "requiredContextAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addRequiredContext:", v7);

      }
    }
  }
  if (-[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput originalRankedToolsCount](self, "originalRankedToolsCount"))
  {
    objc_msgSend(v24, "clearOriginalRankedTools");
    v8 = -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput originalRankedToolsCount](self, "originalRankedToolsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput originalRankedToolsAtIndex:](self, "originalRankedToolsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addOriginalRankedTools:", v11);

      }
    }
  }
  if (-[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput adjustedRankedToolsCount](self, "adjustedRankedToolsCount"))
  {
    objc_msgSend(v24, "clearAdjustedRankedTools");
    v12 = -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput adjustedRankedToolsCount](self, "adjustedRankedToolsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput adjustedRankedToolsAtIndex:](self, "adjustedRankedToolsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addAdjustedRankedTools:", v15);

      }
    }
  }
  if (-[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput originalRankedSpansCount](self, "originalRankedSpansCount"))
  {
    objc_msgSend(v24, "clearOriginalRankedSpans");
    v16 = -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput originalRankedSpansCount](self, "originalRankedSpansCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput originalRankedSpansAtIndex:](self, "originalRankedSpansAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addOriginalRankedSpans:", v19);

      }
    }
  }
  if (-[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput adjustedRankedSpansCount](self, "adjustedRankedSpansCount"))
  {
    objc_msgSend(v24, "clearAdjustedRankedSpans");
    v20 = -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput adjustedRankedSpansCount](self, "adjustedRankedSpansCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput adjustedRankedSpansAtIndex:](self, "adjustedRankedSpansAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addAdjustedRankedSpans:", v23);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v6 = self->_requiredContexts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v54;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v54 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addRequiredContext:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v8);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v12 = self->_originalRankedTools;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v50;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addOriginalRankedTools:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v14);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v18 = self->_adjustedRankedTools;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v46;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend(v5, "addAdjustedRankedTools:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v20);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v24 = self->_originalRankedSpans;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v42;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v28), "copyWithZone:", a3);
        objc_msgSend(v5, "addOriginalRankedSpans:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v26);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = self->_adjustedRankedSpans;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v38;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(v30);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v34), "copyWithZone:", a3, (_QWORD)v37);
        objc_msgSend(v5, "addAdjustedRankedSpans:", v35);

        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
    }
    while (v32);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *requiredContexts;
  NSMutableArray *originalRankedTools;
  NSMutableArray *adjustedRankedTools;
  NSMutableArray *originalRankedSpans;
  NSMutableArray *adjustedRankedSpans;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requiredContexts = self->_requiredContexts, !((unint64_t)requiredContexts | v4[5]))
     || -[NSMutableArray isEqual:](requiredContexts, "isEqual:"))
    && ((originalRankedTools = self->_originalRankedTools, !((unint64_t)originalRankedTools | v4[4]))
     || -[NSMutableArray isEqual:](originalRankedTools, "isEqual:"))
    && ((adjustedRankedTools = self->_adjustedRankedTools, !((unint64_t)adjustedRankedTools | v4[2]))
     || -[NSMutableArray isEqual:](adjustedRankedTools, "isEqual:"))
    && ((originalRankedSpans = self->_originalRankedSpans, !((unint64_t)originalRankedSpans | v4[3]))
     || -[NSMutableArray isEqual:](originalRankedSpans, "isEqual:")))
  {
    adjustedRankedSpans = self->_adjustedRankedSpans;
    if ((unint64_t)adjustedRankedSpans | v4[1])
      v10 = -[NSMutableArray isEqual:](adjustedRankedSpans, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSMutableArray hash](self->_requiredContexts, "hash");
  v4 = -[NSMutableArray hash](self->_originalRankedTools, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_adjustedRankedTools, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_originalRankedSpans, "hash");
  return v6 ^ -[NSMutableArray hash](self->_adjustedRankedSpans, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = v4[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput addRequiredContext:](self, "addRequiredContext:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v4[4];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput addOriginalRankedTools:](self, "addOriginalRankedTools:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = v4[2];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput addAdjustedRankedTools:](self, "addAdjustedRankedTools:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = v4[3];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput addOriginalRankedSpans:](self, "addOriginalRankedSpans:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v24++));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v4[1];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput addAdjustedRankedSpans:](self, "addAdjustedRankedSpans:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v29++), (_QWORD)v30);
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

}

- (NSMutableArray)requiredContexts
{
  return self->_requiredContexts;
}

- (void)setRequiredContexts:(id)a3
{
  objc_storeStrong((id *)&self->_requiredContexts, a3);
}

- (NSMutableArray)originalRankedTools
{
  return self->_originalRankedTools;
}

- (void)setOriginalRankedTools:(id)a3
{
  objc_storeStrong((id *)&self->_originalRankedTools, a3);
}

- (NSMutableArray)adjustedRankedTools
{
  return self->_adjustedRankedTools;
}

- (void)setAdjustedRankedTools:(id)a3
{
  objc_storeStrong((id *)&self->_adjustedRankedTools, a3);
}

- (NSMutableArray)originalRankedSpans
{
  return self->_originalRankedSpans;
}

- (void)setOriginalRankedSpans:(id)a3
{
  objc_storeStrong((id *)&self->_originalRankedSpans, a3);
}

- (NSMutableArray)adjustedRankedSpans
{
  return self->_adjustedRankedSpans;
}

- (void)setAdjustedRankedSpans:(id)a3
{
  objc_storeStrong((id *)&self->_adjustedRankedSpans, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredContexts, 0);
  objc_storeStrong((id *)&self->_originalRankedTools, 0);
  objc_storeStrong((id *)&self->_originalRankedSpans, 0);
  objc_storeStrong((id *)&self->_adjustedRankedTools, 0);
  objc_storeStrong((id *)&self->_adjustedRankedSpans, 0);
}

+ (Class)requiredContextType
{
  return (Class)objc_opt_class();
}

+ (Class)originalRankedToolsType
{
  return (Class)objc_opt_class();
}

+ (Class)adjustedRankedToolsType
{
  return (Class)objc_opt_class();
}

+ (Class)originalRankedSpansType
{
  return (Class)objc_opt_class();
}

+ (Class)adjustedRankedSpansType
{
  return (Class)objc_opt_class();
}

@end

@implementation SIRINLUINTERNALTurnInputRule

- (BOOL)hasUtteranceRule
{
  return self->_utteranceRule != 0;
}

- (void)clearPositiveContextRules
{
  -[NSMutableArray removeAllObjects](self->_positiveContextRules, "removeAllObjects");
}

- (void)addPositiveContextRules:(id)a3
{
  id v4;
  NSMutableArray *positiveContextRules;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  positiveContextRules = self->_positiveContextRules;
  v8 = v4;
  if (!positiveContextRules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_positiveContextRules;
    self->_positiveContextRules = v6;

    v4 = v8;
    positiveContextRules = self->_positiveContextRules;
  }
  -[NSMutableArray addObject:](positiveContextRules, "addObject:", v4);

}

- (unint64_t)positiveContextRulesCount
{
  return -[NSMutableArray count](self->_positiveContextRules, "count");
}

- (id)positiveContextRulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_positiveContextRules, "objectAtIndex:", a3);
}

- (void)clearNegativeContextRules
{
  -[NSMutableArray removeAllObjects](self->_negativeContextRules, "removeAllObjects");
}

- (void)addNegativeContextRules:(id)a3
{
  id v4;
  NSMutableArray *negativeContextRules;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  negativeContextRules = self->_negativeContextRules;
  v8 = v4;
  if (!negativeContextRules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_negativeContextRules;
    self->_negativeContextRules = v6;

    v4 = v8;
    negativeContextRules = self->_negativeContextRules;
  }
  -[NSMutableArray addObject:](negativeContextRules, "addObject:", v4);

}

- (unint64_t)negativeContextRulesCount
{
  return -[NSMutableArray count](self->_negativeContextRules, "count");
}

- (id)negativeContextRulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_negativeContextRules, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALTurnInputRule;
  -[SIRINLUINTERNALTurnInputRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALTurnInputRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALUtteranceRule *utteranceRule;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  utteranceRule = self->_utteranceRule;
  if (utteranceRule)
  {
    -[SIRINLUINTERNALUtteranceRule dictionaryRepresentation](utteranceRule, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("utterance_rule"));

  }
  if (-[NSMutableArray count](self->_positiveContextRules, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_positiveContextRules, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self->_positiveContextRules;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("positive_context_rules"));
  }
  if (-[NSMutableArray count](self->_negativeContextRules, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_negativeContextRules, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_negativeContextRules;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("negative_context_rules"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALTurnInputRuleReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_utteranceRule)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_positiveContextRules;
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
  v10 = self->_negativeContextRules;
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
  if (self->_utteranceRule)
    objc_msgSend(v12, "setUtteranceRule:");
  if (-[SIRINLUINTERNALTurnInputRule positiveContextRulesCount](self, "positiveContextRulesCount"))
  {
    objc_msgSend(v12, "clearPositiveContextRules");
    v4 = -[SIRINLUINTERNALTurnInputRule positiveContextRulesCount](self, "positiveContextRulesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALTurnInputRule positiveContextRulesAtIndex:](self, "positiveContextRulesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addPositiveContextRules:", v7);

      }
    }
  }
  if (-[SIRINLUINTERNALTurnInputRule negativeContextRulesCount](self, "negativeContextRulesCount"))
  {
    objc_msgSend(v12, "clearNegativeContextRules");
    v8 = -[SIRINLUINTERNALTurnInputRule negativeContextRulesCount](self, "negativeContextRulesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUINTERNALTurnInputRule negativeContextRulesAtIndex:](self, "negativeContextRulesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addNegativeContextRules:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALUtteranceRule copyWithZone:](self->_utteranceRule, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_positiveContextRules;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addPositiveContextRules:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_negativeContextRules;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addNegativeContextRules:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALUtteranceRule *utteranceRule;
  NSMutableArray *positiveContextRules;
  NSMutableArray *negativeContextRules;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((utteranceRule = self->_utteranceRule, !((unint64_t)utteranceRule | v4[3]))
     || -[SIRINLUINTERNALUtteranceRule isEqual:](utteranceRule, "isEqual:"))
    && ((positiveContextRules = self->_positiveContextRules, !((unint64_t)positiveContextRules | v4[2]))
     || -[NSMutableArray isEqual:](positiveContextRules, "isEqual:")))
  {
    negativeContextRules = self->_negativeContextRules;
    if ((unint64_t)negativeContextRules | v4[1])
      v8 = -[NSMutableArray isEqual:](negativeContextRules, "isEqual:");
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
  unint64_t v3;
  uint64_t v4;

  v3 = -[SIRINLUINTERNALUtteranceRule hash](self->_utteranceRule, "hash");
  v4 = -[NSMutableArray hash](self->_positiveContextRules, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_negativeContextRules, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUINTERNALUtteranceRule *utteranceRule;
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
  utteranceRule = self->_utteranceRule;
  v6 = *((_QWORD *)v4 + 3);
  if (utteranceRule)
  {
    if (v6)
      -[SIRINLUINTERNALUtteranceRule mergeFrom:](utteranceRule, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALTurnInputRule setUtteranceRule:](self, "setUtteranceRule:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v4 + 2);
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
        -[SIRINLUINTERNALTurnInputRule addPositiveContextRules:](self, "addPositiveContextRules:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 1);
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
        -[SIRINLUINTERNALTurnInputRule addNegativeContextRules:](self, "addNegativeContextRules:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (SIRINLUINTERNALUtteranceRule)utteranceRule
{
  return self->_utteranceRule;
}

- (void)setUtteranceRule:(id)a3
{
  objc_storeStrong((id *)&self->_utteranceRule, a3);
}

- (NSMutableArray)positiveContextRules
{
  return self->_positiveContextRules;
}

- (void)setPositiveContextRules:(id)a3
{
  objc_storeStrong((id *)&self->_positiveContextRules, a3);
}

- (NSMutableArray)negativeContextRules
{
  return self->_negativeContextRules;
}

- (void)setNegativeContextRules:(id)a3
{
  objc_storeStrong((id *)&self->_negativeContextRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceRule, 0);
  objc_storeStrong((id *)&self->_positiveContextRules, 0);
  objc_storeStrong((id *)&self->_negativeContextRules, 0);
}

+ (Class)positiveContextRulesType
{
  return (Class)objc_opt_class();
}

+ (Class)negativeContextRulesType
{
  return (Class)objc_opt_class();
}

@end

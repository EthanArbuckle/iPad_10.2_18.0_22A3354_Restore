@implementation TPPBDictionaryMatchingRule

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 8)
    return off_1EA8BF5E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AND_RULE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OR_RULE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_RULE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MATCH_RULE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_EXISTS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRUE_RULE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FALSE_RULE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearAnds
{
  -[NSMutableArray removeAllObjects](self->_ands, "removeAllObjects");
}

- (void)addAnd:(id)a3
{
  id v4;
  NSMutableArray *ands;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ands = self->_ands;
  v8 = v4;
  if (!ands)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_ands;
    self->_ands = v6;

    v4 = v8;
    ands = self->_ands;
  }
  -[NSMutableArray addObject:](ands, "addObject:", v4);

}

- (unint64_t)andsCount
{
  return -[NSMutableArray count](self->_ands, "count");
}

- (id)andAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ands, "objectAtIndex:", a3);
}

- (void)clearOrs
{
  -[NSMutableArray removeAllObjects](self->_ors, "removeAllObjects");
}

- (void)addOr:(id)a3
{
  id v4;
  NSMutableArray *ors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ors = self->_ors;
  v8 = v4;
  if (!ors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_ors;
    self->_ors = v6;

    v4 = v8;
    ors = self->_ors;
  }
  -[NSMutableArray addObject:](ors, "addObject:", v4);

}

- (unint64_t)orsCount
{
  return -[NSMutableArray count](self->_ors, "count");
}

- (id)orAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ors, "objectAtIndex:", a3);
}

- (BOOL)hasNot
{
  return self->_not != 0;
}

- (BOOL)hasMatch
{
  return self->_match != 0;
}

- (BOOL)hasExists
{
  return self->_exists != 0;
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
  v8.super_class = (Class)TPPBDictionaryMatchingRule;
  -[TPPBDictionaryMatchingRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBDictionaryMatchingRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  __CFString *v5;
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
  TPPBDictionaryMatchingRule *not;
  void *v21;
  TPPBDictionaryMatchingRuleFieldRegexMatch *match;
  void *v23;
  TPPBDictionaryMatchingRuleFieldExists *exists;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1EA8BF5E0[type];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  if (-[NSMutableArray count](self->_ands, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_ands, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = self->_ands;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("and"));
  }
  if (-[NSMutableArray count](self->_ors, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_ors, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = self->_ors;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("or"));
  }
  not = self->_not;
  if (not)
  {
    -[TPPBDictionaryMatchingRule dictionaryRepresentation](not, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("not"));

  }
  match = self->_match;
  if (match)
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch dictionaryRepresentation](match, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("match"));

  }
  exists = self->_exists;
  if (exists)
  {
    -[TPPBDictionaryMatchingRuleFieldExists dictionaryRepresentation](exists, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("exists"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDictionaryMatchingRuleReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_ands;
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
  v10 = self->_ors;
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

  if (self->_not)
    PBDataWriterWriteSubmessage();
  if (self->_match)
    PBDataWriterWriteSubmessage();
  if (self->_exists)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_type;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  v14 = v4;
  if (-[TPPBDictionaryMatchingRule andsCount](self, "andsCount"))
  {
    objc_msgSend(v14, "clearAnds");
    v5 = -[TPPBDictionaryMatchingRule andsCount](self, "andsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[TPPBDictionaryMatchingRule andAtIndex:](self, "andAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAnd:", v8);

      }
    }
  }
  if (-[TPPBDictionaryMatchingRule orsCount](self, "orsCount"))
  {
    objc_msgSend(v14, "clearOrs");
    v9 = -[TPPBDictionaryMatchingRule orsCount](self, "orsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[TPPBDictionaryMatchingRule orAtIndex:](self, "orAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addOr:", v12);

      }
    }
  }
  if (self->_not)
    objc_msgSend(v14, "setNot:");
  v13 = v14;
  if (self->_match)
  {
    objc_msgSend(v14, "setMatch:");
    v13 = v14;
  }
  if (self->_exists)
  {
    objc_msgSend(v14, "setExists:");
    v13 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = self->_ands;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addAnd:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v9);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = self->_ors;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend(v6, "addOr:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v15);
  }

  v19 = -[TPPBDictionaryMatchingRule copyWithZone:](self->_not, "copyWithZone:", a3);
  v20 = (void *)v6[4];
  v6[4] = v19;

  v21 = -[TPPBDictionaryMatchingRuleFieldRegexMatch copyWithZone:](self->_match, "copyWithZone:", a3);
  v22 = (void *)v6[3];
  v6[3] = v21;

  v23 = -[TPPBDictionaryMatchingRuleFieldExists copyWithZone:](self->_exists, "copyWithZone:", a3);
  v24 = (void *)v6[2];
  v6[2] = v23;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *ands;
  NSMutableArray *ors;
  TPPBDictionaryMatchingRule *not;
  TPPBDictionaryMatchingRuleFieldRegexMatch *match;
  TPPBDictionaryMatchingRuleFieldExists *exists;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_type != *((_DWORD *)v4 + 12))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  ands = self->_ands;
  if ((unint64_t)ands | *((_QWORD *)v4 + 1) && !-[NSMutableArray isEqual:](ands, "isEqual:"))
    goto LABEL_17;
  ors = self->_ors;
  if ((unint64_t)ors | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](ors, "isEqual:"))
      goto LABEL_17;
  }
  not = self->_not;
  if ((unint64_t)not | *((_QWORD *)v4 + 4))
  {
    if (!-[TPPBDictionaryMatchingRule isEqual:](not, "isEqual:"))
      goto LABEL_17;
  }
  match = self->_match;
  if ((unint64_t)match | *((_QWORD *)v4 + 3))
  {
    if (!-[TPPBDictionaryMatchingRuleFieldRegexMatch isEqual:](match, "isEqual:"))
      goto LABEL_17;
  }
  exists = self->_exists;
  if ((unint64_t)exists | *((_QWORD *)v4 + 2))
    v10 = -[TPPBDictionaryMatchingRuleFieldExists isEqual:](exists, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_ands, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_ors, "hash");
  v6 = v4 ^ v5 ^ -[TPPBDictionaryMatchingRule hash](self->_not, "hash");
  v7 = -[TPPBDictionaryMatchingRuleFieldRegexMatch hash](self->_match, "hash");
  return v6 ^ v7 ^ -[TPPBDictionaryMatchingRuleFieldExists hash](self->_exists, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  TPPBDictionaryMatchingRule *not;
  id v17;
  TPPBDictionaryMatchingRuleFieldRegexMatch *match;
  id v19;
  TPPBDictionaryMatchingRuleFieldExists *exists;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        -[TPPBDictionaryMatchingRule addAnd:](self, "addAnd:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v5[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        -[TPPBDictionaryMatchingRule addOr:](self, "addOr:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v13);
  }

  not = self->_not;
  v17 = v5[4];
  if (not)
  {
    if (v17)
      -[TPPBDictionaryMatchingRule mergeFrom:](not, "mergeFrom:");
  }
  else if (v17)
  {
    -[TPPBDictionaryMatchingRule setNot:](self, "setNot:");
  }
  match = self->_match;
  v19 = v5[3];
  if (match)
  {
    if (v19)
      -[TPPBDictionaryMatchingRuleFieldRegexMatch mergeFrom:](match, "mergeFrom:");
  }
  else if (v19)
  {
    -[TPPBDictionaryMatchingRule setMatch:](self, "setMatch:");
  }
  exists = self->_exists;
  v21 = v5[2];
  if (exists)
  {
    if (v21)
      -[TPPBDictionaryMatchingRuleFieldExists mergeFrom:](exists, "mergeFrom:");
  }
  else if (v21)
  {
    -[TPPBDictionaryMatchingRule setExists:](self, "setExists:");
  }

}

- (NSMutableArray)ands
{
  return self->_ands;
}

- (void)setAnds:(id)a3
{
  objc_storeStrong((id *)&self->_ands, a3);
}

- (NSMutableArray)ors
{
  return self->_ors;
}

- (void)setOrs:(id)a3
{
  objc_storeStrong((id *)&self->_ors, a3);
}

- (TPPBDictionaryMatchingRule)not
{
  return self->_not;
}

- (void)setNot:(id)a3
{
  objc_storeStrong((id *)&self->_not, a3);
}

- (TPPBDictionaryMatchingRuleFieldRegexMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (TPPBDictionaryMatchingRuleFieldExists)exists
{
  return self->_exists;
}

- (void)setExists:(id)a3
{
  objc_storeStrong((id *)&self->_exists, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ors, 0);
  objc_storeStrong((id *)&self->_not, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_exists, 0);
  objc_storeStrong((id *)&self->_ands, 0);
}

+ (Class)andType
{
  return (Class)objc_opt_class();
}

+ (Class)orType
{
  return (Class)objc_opt_class();
}

- (BOOL)matches:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  BOOL v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  if (-[TPPBDictionaryMatchingRule hasType](self, "hasType"))
  {
    v7 = 1;
    switch(-[TPPBDictionaryMatchingRule type](self, "type"))
    {
      case 1:
        v8 = -[TPPBDictionaryMatchingRule performAndMatch:error:](self, "performAndMatch:error:", v6, a4);
        goto LABEL_12;
      case 2:
        v8 = -[TPPBDictionaryMatchingRule performOrMatch:error:](self, "performOrMatch:error:", v6, a4);
        goto LABEL_12;
      case 3:
        v8 = -[TPPBDictionaryMatchingRule invertMatch:error:](self, "invertMatch:error:", v6, a4);
LABEL_12:
        v7 = v8;
        goto LABEL_24;
      case 4:
        -[TPPBDictionaryMatchingRule match](self, "match");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[TPPBDictionaryMatchingRule match](self, "match");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        if (!a4)
          goto LABEL_23;
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = CFSTR("No 'match' subrule present");
        goto LABEL_22;
      case 5:
        -[TPPBDictionaryMatchingRule exists](self, "exists");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[TPPBDictionaryMatchingRule exists](self, "exists");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
          v15 = v13;
          v7 = objc_msgSend(v13, "matches:error:", v6, a4);

          goto LABEL_24;
        }
        if (!a4)
          goto LABEL_23;
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = CFSTR("No 'exists' subrule present");
LABEL_22:
        v11 = 2;
        break;
      case 6:
        goto LABEL_24;
      case 7:
        goto LABEL_23;
      default:
        if (!a4)
          goto LABEL_23;
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = CFSTR("Rule type is unknown");
        goto LABEL_6;
    }
  }
  else
  {
    if (!a4)
    {
LABEL_23:
      v7 = 0;
      goto LABEL_24;
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = CFSTR("Rule has no type");
LABEL_6:
    v11 = 0;
  }
  objc_msgSend(v9, "errorWithDomain:code:description:", CFSTR("CKKSMatcherError"), v11, v10);
  v7 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v7;
}

- (BOOL)performAndMatch:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  id v18;
  BOOL v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TPPBDictionaryMatchingRule ands](self, "ands");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[TPPBDictionaryMatchingRule ands](self, "ands"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8,
        v10))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[TPPBDictionaryMatchingRule ands](self, "ands");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v22 = 0;
          v17 = objc_msgSend(v16, "matches:error:", v6, &v22);
          v18 = v22;
          if (v18)
          {
            v20 = v18;
            if (a4)
              *a4 = objc_retainAutorelease(v18);

LABEL_20:
            v19 = 0;
            goto LABEL_21;
          }
          if (!v17)
            goto LABEL_20;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v19 = 1;
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v19 = 1;
    }
LABEL_21:

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("CKKSMatcherError"), 2, CFSTR("No 'and' subrules present"));
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)performOrMatch:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  id v18;
  BOOL v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TPPBDictionaryMatchingRule ors](self, "ors");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TPPBDictionaryMatchingRule ors](self, "ors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[TPPBDictionaryMatchingRule ors](self, "ors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v22 = 0;
            v17 = objc_msgSend(v16, "matches:error:", v6, &v22);
            v18 = v22;
            v19 = v18 == 0;
            if (v18)
            {
              v20 = v18;
              if (a4)
                *a4 = objc_retainAutorelease(v18);

LABEL_19:
              goto LABEL_20;
            }
            if ((v17 & 1) != 0)
              goto LABEL_19;
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v13)
            continue;
          break;
        }
      }

      goto LABEL_15;
    }
  }
  if (!a4)
  {
LABEL_15:
    v19 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("CKKSMatcherError"), 2, CFSTR("No 'or' subrules present"));
  v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v19;
}

- (BOOL)invertMatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  char v11;
  id v13;

  v6 = a3;
  -[TPPBDictionaryMatchingRule not](self, "not");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TPPBDictionaryMatchingRule not](self, "not");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = objc_msgSend(v8, "matches:error:", v6, &v13);
    v10 = v13;

    if (v10)
    {
      v11 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v10);
    }
    else
    {
      v11 = v9 ^ 1;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("CKKSMatcherError"), 2, CFSTR("No 'not' subrule present"));
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end

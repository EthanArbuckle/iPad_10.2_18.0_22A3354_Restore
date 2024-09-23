@implementation PLAggregateEntry

- (void)setAggregateValue:(double)a3
{
  self->_aggregateValue = a3;
}

- (void)setMatchingKeyToValue:(id)a3
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *matchingKeyToValue;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableDictionary *)a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  matchingKeyToValue = self->_matchingKeyToValue;
  self->_matchingKeyToValue = v3;

}

- (NSString)entryKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)aggregateKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)matchingKeyToValue
{
  return self->_matchingKeyToValue;
}

- (void)setOtherAggregateKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setAggregateKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setAggregateFunction:(signed __int16)a3
{
  self->_aggregateFunction = a3;
}

- (void)setEntryKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)updateWithValue:(double)a3
{
  double v5;
  double v6;

  if (-[PLAggregateEntry aggregateFunction](self, "aggregateFunction"))
  {
    if (-[PLAggregateEntry aggregateFunction](self, "aggregateFunction") == 2)
    {
      -[PLAggregateEntry aggregateValue](self, "aggregateValue");
      if (v5 >= a3)
        v5 = a3;
    }
    else
    {
      if (-[PLAggregateEntry aggregateFunction](self, "aggregateFunction") != 3)
        return;
      -[PLAggregateEntry aggregateValue](self, "aggregateValue");
      if (v5 < a3)
        v5 = a3;
    }
  }
  else
  {
    -[PLAggregateEntry aggregateValue](self, "aggregateValue");
    v5 = v6 + a3;
  }
  -[PLAggregateEntry setAggregateValue:](self, "setAggregateValue:", v5);
}

- (double)aggregateValue
{
  return self->_aggregateValue;
}

- (signed)aggregateFunction
{
  return self->_aggregateFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateKey, 0);
  objc_storeStrong((id *)&self->_otherAggregateKeys, 0);
  objc_storeStrong((id *)&self->_matchingKeyToValue, 0);
  objc_storeStrong((id *)&self->_entryKey, 0);
}

- (id)query
{
  PLAggregateEntry *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  PLAggregateEntry *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v2 = self;
  v52 = *MEMORY[0x1E0C80C00];
  -[PLAggregateEntry matchingPairs](self, "matchingPairs");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", CFSTR("ID"));
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PLAggregateEntry entryKey](v2, "entryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("(SELECT ID FROM '%@' WHERE %@)"), v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  -[PLAggregateEntry matchingKeyToValue](v2, "matchingKeyToValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

  -[PLAggregateEntry matchingKeyToValue](v2, "matchingKeyToValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);

  -[PLAggregateEntry otherAggregateKeys](v2, "otherAggregateKeys");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[PLAggregateEntry otherAggregateKeys](v2, "otherAggregateKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v44 = v5;
      -[PLAggregateEntry otherAggregateKeys](v2, "otherAggregateKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v4;
      objc_msgSend(v4, "addObject:", v20);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      -[PLAggregateEntry otherAggregateKeys](v2, "otherAggregateKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v48;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v48 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v26);
            v28 = (void *)MEMORY[0x1E0CB3940];
            -[PLAggregateEntry entryKey](v2, "entryKey");
            v29 = v2;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stringWithFormat:", CFSTR("COALESCE((SELECT %@ FROM '%@' WHERE %@),0)"), v27, v30, v46);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v31);

            v2 = v29;
            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v24);
      }

      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v44;
      objc_msgSend(v44, "addObject:", v32);

      v4 = v45;
    }
  }
  -[PLAggregateEntry aggregateKey](v2, "aggregateKey");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v33);

  v34 = (void *)MEMORY[0x1E0CB3940];
  -[PLAggregateEntry aggregateOperationWithMatchingPairs:](v2, "aggregateOperationWithMatchingPairs:", v46);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateEntry aggregateValue](v2, "aggregateValue");
  objc_msgSend(v34, "stringWithFormat:", CFSTR("COALESCE(%@,%f)"), v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v37);

  v38 = (void *)MEMORY[0x1E0CB3940];
  -[PLAggregateEntry entryKey](v2, "entryKey");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("            INSERT OR REPLACE INTO '%@'             (%@)             VALUES (%@);"),
    v39,
    v40,
    v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)matchingPairs
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PLAggregateEntry matchingKeyToValue](self, "matchingKeyToValue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1E0CB3940];
        -[PLAggregateEntry matchingKeyToValue](self, "matchingKeyToValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@=%@"), v8, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" AND "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)aggregateOperationWithMatchingPairs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[PLAggregateEntry aggregateKey](self, "aggregateKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateEntry entryKey](self, "entryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT %@ FROM '%@' WHERE %@"), v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PLAggregateEntry aggregateFunction](self, "aggregateFunction"))
  {
    if (-[PLAggregateEntry aggregateFunction](self, "aggregateFunction") == 2)
    {
      v9 = CFSTR("MIN(%f,%@)");
    }
    else
    {
      if (-[PLAggregateEntry aggregateFunction](self, "aggregateFunction") != 3)
      {
        v12 = 0;
        goto LABEL_8;
      }
      v9 = CFSTR("MAX(%f,%@)");
    }
  }
  else
  {
    v9 = CFSTR("%f+(%@)");
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[PLAggregateEntry aggregateValue](self, "aggregateValue");
  objc_msgSend(v10, "stringWithFormat:", v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLAggregateEntry entryKey](self, "entryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateEntry matchingPairs](self, "matchingPairs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateEntry aggregateKey](self, "aggregateKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateEntry aggregateValue](self, "aggregateValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("entryKey=%@, matchingPairs=%@, aggregateKey=%@, aggregateValue=%f"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)otherAggregateKeys
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

@end

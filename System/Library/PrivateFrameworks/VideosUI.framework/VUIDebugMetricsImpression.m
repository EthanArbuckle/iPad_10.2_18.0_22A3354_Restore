@implementation VUIDebugMetricsImpression

- (VUIDebugMetricsImpression)initWithDictionary:(id)a3
{
  id v4;
  VUIDebugMetricsImpression *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  NSDictionary *otherValues;
  NSDictionary *v24;
  NSArray *orderedOtherKeys;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)VUIDebugMetricsImpression;
  v5 = -[VUIDebugMetricsImpression init](&v35, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = objc_msgSend(&unk_1EA0BBBB0, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(&unk_1EA0BBBB0);
          v11 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

        }
        v8 = objc_msgSend(&unk_1EA0BBBB0, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v8);
    }
    objc_storeStrong((id *)&v5->_mainValues, v6);
    objc_msgSend(v4, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "removeObjectsInArray:", &unk_1EA0BBBB0);
    v15 = (NSDictionary *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v14;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v4, "objectForKeyedSubscript:", v21, (_QWORD)v27);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v22, v21);

        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v18);
    }

    otherValues = v5->_otherValues;
    v5->_otherValues = v15;
    v24 = v15;

    -[NSArray sortUsingSelector:](v16, "sortUsingSelector:", sel_compare_);
    orderedOtherKeys = v5->_orderedOtherKeys;
    v5->_orderedOtherKeys = v16;

  }
  return v5;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_mainValues, "objectForKeyedSubscript:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)type
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_mainValues, "objectForKeyedSubscript:", CFSTR("impressionType"));
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_mainValues, "objectForKeyedSubscript:", CFSTR("id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)impressionId
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_mainValues, "objectForKeyedSubscript:", CFSTR("impressionId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)impressionIndex
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_mainValues, "objectForKeyedSubscript:", CFSTR("impressionIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)parentId
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_mainValues, "objectForKeyedSubscript:", CFSTR("impressionParentId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_otherValues, "objectForKeyedSubscript:", a3);
}

- (NSString)idType
{
  return self->_idType;
}

- (NSArray)orderedOtherKeys
{
  return self->_orderedOtherKeys;
}

- (void)setOrderedOtherKeys:(id)a3
{
  objc_storeStrong((id *)&self->_orderedOtherKeys, a3);
}

- (NSDictionary)mainValues
{
  return self->_mainValues;
}

- (void)setMainValues:(id)a3
{
  objc_storeStrong((id *)&self->_mainValues, a3);
}

- (NSDictionary)otherValues
{
  return self->_otherValues;
}

- (void)setOtherValues:(id)a3
{
  objc_storeStrong((id *)&self->_otherValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherValues, 0);
  objc_storeStrong((id *)&self->_mainValues, 0);
  objc_storeStrong((id *)&self->_orderedOtherKeys, 0);
  objc_storeStrong((id *)&self->_idType, 0);
}

@end

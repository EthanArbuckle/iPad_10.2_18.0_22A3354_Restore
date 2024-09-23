@implementation ATXCategoricalAttributeBreakdown

- (ATXCategoricalAttributeBreakdown)init
{
  ATXCategoricalAttributeBreakdown *v2;
  uint64_t v3;
  NSMutableDictionary *counts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXCategoricalAttributeBreakdown;
  v2 = -[ATXCategoricalAttributeBreakdown init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    counts = v2->_counts;
    v2->_counts = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)allCategories
{
  return (id)-[NSMutableDictionary allKeys](self->_counts, "allKeys");
}

- (unint64_t)countForCategory:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_counts, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (double)normalizedCountForCategory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_counts, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v9 = v9 + (double)(unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);

    v11 = 0.0;
    if (v9 != 0.0)
      v11 = (double)-[ATXCategoricalAttributeBreakdown countForCategory:](self, "countForCategory:", v4) / v9;
  }
  else
  {

    v11 = 0.0;
  }

  return v11;
}

- (void)incrementCountForCategory:(id)a3 by:(unint64_t)a4
{
  NSMutableDictionary *counts;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  counts = self->_counts;
  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](counts, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v11 = v8;
  if (v8)
    a4 += objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(v9, "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_counts, "setObject:forKeyedSubscript:", v10, v7);

}

- (BOOL)isEqual:(id)a3
{
  ATXCategoricalAttributeBreakdown *v4;
  ATXCategoricalAttributeBreakdown *v5;
  BOOL v6;

  v4 = (ATXCategoricalAttributeBreakdown *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXCategoricalAttributeBreakdown isEqualToATXDeviceLevelMetricsCategoricalAttributeBreakdown:](self, "isEqualToATXDeviceLevelMetricsCategoricalAttributeBreakdown:", v5);

  return v6;
}

- (BOOL)isEqualToATXDeviceLevelMetricsCategoricalAttributeBreakdown:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  char v6;

  v4 = self->_counts;
  v5 = v4;
  if (v4 == *((NSMutableDictionary **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSMutableDictionary isEqual:](v4, "isEqual:");

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_counts, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counts, 0);
}

@end

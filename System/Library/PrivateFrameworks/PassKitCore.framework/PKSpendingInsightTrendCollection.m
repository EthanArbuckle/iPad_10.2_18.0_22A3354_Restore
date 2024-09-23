@implementation PKSpendingInsightTrendCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSpendingInsightTrendCollection)initWithFHFeatureInsights:(id)a3
{
  id v4;
  PKSpendingInsightTrendCollection *v5;
  void *v6;
  PKSpendingInsightTrend *v7;
  PKSpendingInsightTrend *overallSpendingTrend;
  void *v9;
  int v10;
  NSDictionary *v11;
  NSDictionary *categoryInsights;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  PKSpendingInsightTrend *v21;
  PKSpendingInsightTrend *v22;
  void *v23;
  BOOL v24;
  char v25;
  uint64_t v26;
  NSDictionary *v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKSpendingInsightTrendCollection;
  v5 = -[PKSpendingInsightTrendCollection init](&v35, sel_init);
  if (!v5)
    goto LABEL_24;
  objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_105);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKSpendingInsightTrend initWithFHFeatureInsight:]([PKSpendingInsightTrend alloc], "initWithFHFeatureInsight:", v6);
  overallSpendingTrend = v5->_overallSpendingTrend;
  v5->_overallSpendingTrend = v7;

  objc_msgSend(v6, "averageAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pk_isZeroNumber");

  if (v10)
  {
    v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    categoryInsights = v5->_categoryInsights;
    v5->_categoryInsights = v11;
    goto LABEL_23;
  }
  v29 = v6;
  categoryInsights = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = v4;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v14)
    goto LABEL_22;
  v15 = v14;
  v16 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v32 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      objc_msgSend(v18, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      getFHInsightTypeCategorySpend[0]();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      if (v21 == v22)
      {

LABEL_18:
        v21 = -[PKSpendingInsightTrend initWithFHFeatureInsight:]([PKSpendingInsightTrend alloc], "initWithFHFeatureInsight:", v18);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "merchantCategory"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](categoryInsights, "setObject:forKeyedSubscript:", v21, v23);
LABEL_19:

        continue;
      }
      v23 = v22;
      if (v21)
        v24 = v22 == 0;
      else
        v24 = 1;
      if (v24)
      {

        goto LABEL_19;
      }
      v25 = -[PKSpendingInsightTrend isEqualToString:](v21, "isEqualToString:", v22);

      if ((v25 & 1) != 0)
        goto LABEL_18;
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v15);
LABEL_22:

  v26 = -[NSDictionary copy](categoryInsights, "copy");
  v27 = v5->_categoryInsights;
  v5->_categoryInsights = (NSDictionary *)v26;

  v4 = v30;
  v6 = v29;
LABEL_23:

LABEL_24:
  return v5;
}

uint64_t __62__PKSpendingInsightTrendCollection_initWithFHFeatureInsights___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getFHInsightTypeOverallSpend[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (v4 && v5)
      v7 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v7;
}

- (BOOL)hasCategoryInsights
{
  return -[NSDictionary count](self->_categoryInsights, "count") != 0;
}

- (id)spendingTrendForMerchantCategory:(int64_t)a3
{
  NSDictionary *categoryInsights;
  void *v4;
  void *v5;

  categoryInsights = self->_categoryInsights;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](categoryInsights, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("overallSpendingTrend: '%@'; "), self->_overallSpendingTrend);
  objc_msgSend(v3, "appendFormat:", CFSTR("categoryInsights: '%@'; "), self->_categoryInsights);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (PKSpendingInsightTrendCollection)initWithCoder:(id)a3
{
  id v4;
  PKSpendingInsightTrendCollection *v5;
  uint64_t v6;
  PKSpendingInsightTrend *overallSpendingTrend;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *categoryInsights;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKSpendingInsightTrendCollection;
  v5 = -[PKSpendingInsightTrendCollection init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overallSpendingTrend"));
    v6 = objc_claimAutoreleasedReturnValue();
    overallSpendingTrend = v5->_overallSpendingTrend;
    v5->_overallSpendingTrend = (PKSpendingInsightTrend *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("overallSpendingTrend"));
    v12 = objc_claimAutoreleasedReturnValue();
    categoryInsights = v5->_categoryInsights;
    v5->_categoryInsights = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKSpendingInsightTrend *overallSpendingTrend;
  id v5;

  overallSpendingTrend = self->_overallSpendingTrend;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", overallSpendingTrend, CFSTR("overallSpendingTrend"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryInsights, CFSTR("categoryInsights"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKSpendingInsightTrend *overallSpendingTrend;
  PKSpendingInsightTrend *v6;
  NSDictionary *categoryInsights;
  NSDictionary *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  overallSpendingTrend = self->_overallSpendingTrend;
  v6 = (PKSpendingInsightTrend *)v4[2];
  if (!overallSpendingTrend || !v6)
  {
    if (overallSpendingTrend == v6)
      goto LABEL_5;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (!-[PKSpendingInsightTrend isEqual:](overallSpendingTrend, "isEqual:"))
    goto LABEL_9;
LABEL_5:
  categoryInsights = self->_categoryInsights;
  v8 = (NSDictionary *)v4[1];
  if (categoryInsights && v8)
    v9 = -[NSDictionary isEqual:](categoryInsights, "isEqual:");
  else
    v9 = categoryInsights == v8;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_overallSpendingTrend);
  objc_msgSend(v3, "safelyAddObject:", self->_categoryInsights);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (PKSpendingInsightTrend)overallSpendingTrend
{
  return self->_overallSpendingTrend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overallSpendingTrend, 0);
  objc_storeStrong((id *)&self->_categoryInsights, 0);
}

@end

@implementation WBSHistoryVisitsWithItemsPredicate

- (WBSHistoryVisitsWithItemsPredicate)initWithHistoryItems:(id)a3 ignoreVisits:(id)a4
{
  id v6;
  id v7;
  WBSHistoryVisitsWithItemsPredicate *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  WBSSetInt64 *v17;
  WBSSetInt64 *itemIdentifiers;
  WBSSetInt64 *v19;
  WBSSetInt64 *ignoredVisitIdentifiers;
  WBSHistoryVisitsWithItemsPredicate *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];
  int v33;
  _OWORD v34[2];
  int v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WBSHistoryVisitsWithItemsPredicate;
  v8 = -[WBSHistoryVisitsWithItemsPredicate init](&v36, sel_init);
  if (v8)
  {
    memset(v34, 0, sizeof(v34));
    v35 = 1065353216;
    memset(v32, 0, sizeof(v32));
    v33 = 1065353216;
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v34, vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v6, "count") / 1.0));
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v32, vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v7, "count") / 1.0));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v29;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v9);
          v27 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "databaseID");
          std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v34, (unint64_t *)&v27, &v27);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v10);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v13);
          v27 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "databaseID", (_QWORD)v23);
          std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v32, (unint64_t *)&v27, &v27);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
      }
      while (v14);
    }

    v17 = -[WBSSetInt64 initWithMovableSet:]([WBSSetInt64 alloc], "initWithMovableSet:", v34);
    itemIdentifiers = v8->_itemIdentifiers;
    v8->_itemIdentifiers = v17;

    v19 = -[WBSSetInt64 initWithMovableSet:]([WBSSetInt64 alloc], "initWithMovableSet:", v32);
    ignoredVisitIdentifiers = v8->_ignoredVisitIdentifiers;
    v8->_ignoredVisitIdentifiers = v19;

    v21 = v8;
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v32);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v34);
  }

  return v8;
}

- (WBSHistoryVisitsWithItemsPredicate)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryVisitsWithItemsPredicate *v5;
  uint64_t v6;
  WBSSetInt64 *itemIdentifiers;
  uint64_t v8;
  WBSSetInt64 *ignoredVisitIdentifiers;
  WBSHistoryVisitsWithItemsPredicate *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryVisitsWithItemsPredicate;
  v5 = -[WBSHistoryVisitsWithItemsPredicate init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("items"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifiers = v5->_itemIdentifiers;
    v5->_itemIdentifiers = (WBSSetInt64 *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ignoredVisits"));
    v8 = objc_claimAutoreleasedReturnValue();
    ignoredVisitIdentifiers = v5->_ignoredVisitIdentifiers;
    v5->_ignoredVisitIdentifiers = (WBSSetInt64 *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemIdentifiers, CFSTR("items"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ignoredVisitIdentifiers, CFSTR("ignoredVisits"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6
{
  char v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v7 = a5;
  v9 = a3;
  v10 = (void *)MEMORY[0x1E0CB37A0];
  -[WBSSetInt64 commaSeparatedValues](self->_itemIdentifiers, "commaSeparatedValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SELECT history_visits.* FROM history_visits WHERE history_item IN (%@)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WBSSetInt64 count](self->_ignoredVisitIdentifiers, "count"))
  {
    -[WBSSetInt64 commaSeparatedValues](self->_ignoredVisitIdentifiers, "commaSeparatedValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(" AND history_visits.id NOT IN (%@)"), v13);

    if ((v7 & 8) != 0)
    {
      -[WBSSetInt64 commaSeparatedValues](self->_ignoredVisitIdentifiers, "commaSeparatedValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendFormat:", CFSTR("AND NOT EXISTS (SELECT * FROM history_visits v2 WHERE id NOT IN (%@) AND history_visits.history_item = v2.history_item AND (v2.visit_time > history_visits.visit_time OR     (v2.visit_time = history_visits.visit_time AND (v2.synthesized < history_visits.synthesized OR                                                    (v2.synthesized = history_visits.synthesized AND v2.id > history_visits.id)))))"), v14);

    }
  }
  else if ((v7 & 8) != 0)
  {
    objc_msgSend(v12, "appendString:", CFSTR(" AND history_visits.id = safari_latest_visit_for (history_item)"));
  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", v9, v12);
  v16 = (void *)v15;
  if (a6 && !v15)
  {
    objc_msgSend(v9, "lastErrorWithMethodName:", "-[WBSHistoryVisitsWithItemsPredicate statementForDatabase:cache:fetchOptions:error:]");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (BOOL)evaluateVisit:(id)a3
{
  id v4;
  WBSSetInt64 *itemIdentifiers;
  void *v6;
  _BOOL4 v7;

  v4 = a3;
  itemIdentifiers = self->_itemIdentifiers;
  objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(itemIdentifiers) = -[WBSSetInt64 contains:](itemIdentifiers, "contains:", objc_msgSend(v6, "databaseID"));

  if ((itemIdentifiers & 1) != 0)
    v7 = !-[WBSSetInt64 contains:](self->_ignoredVisitIdentifiers, "contains:", objc_msgSend(v4, "databaseID"));
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)evaluateServiceVisit:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (-[WBSSetInt64 contains:](self->_itemIdentifiers, "contains:", objc_msgSend(v4, "itemID")))
    v5 = !-[WBSSetInt64 contains:](self->_ignoredVisitIdentifiers, "contains:", objc_msgSend(v4, "databaseID"));
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; itemIdentifiers.count = %zu; ignoredVisitIdentifiers.count = %zu>"),
                       objc_opt_class(),
                       self,
                       -[WBSSetInt64 count](self->_itemIdentifiers, "count"),
                       -[WBSSetInt64 count](self->_ignoredVisitIdentifiers, "count"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredVisitIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

@end

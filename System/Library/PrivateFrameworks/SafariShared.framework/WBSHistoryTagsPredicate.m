@implementation WBSHistoryTagsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryTagsPredicate)initWithStartDate:(id)a3 endDate:(id)a4 tagType:(unint64_t)a5
{
  id v9;
  id v10;
  WBSHistoryTagsPredicate *v11;
  WBSHistoryTagsPredicate *v12;
  WBSHistoryTagsPredicate *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryTagsPredicate;
  v11 = -[WBSHistoryTagsPredicate init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
    v12->_tagType = a5;
    v13 = v12;
  }

  return v12;
}

- (WBSHistoryTagsPredicate)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryTagsPredicate *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  WBSHistoryTagsPredicate *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSHistoryTagsPredicate;
  v5 = -[WBSHistoryTagsPredicate init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v5->_tagType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tagType"));
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
    v5->_minimumItemCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumItemCount"));
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sortOrder"));
    if (v10 >= 3)
      v11 = 0;
    else
      v11 = v10;
    v5->_sortOrder = v11;
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("identifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_storeStrong((id *)&v5->_identifiers, v15);
    v16 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *identifiers;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tagType, CFSTR("tagType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minimumItemCount, CFSTR("minimumItemCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sortOrder, CFSTR("sortOrder"));
  identifiers = self->_identifiers;
  if (identifiers)
    objc_msgSend(v5, "encodeObject:forKey:", identifiers, CFSTR("identifiers"));

}

- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  int64_t sortOrder;
  const __CFString *v12;
  void *v13;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t limit;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_msgSend(CFSTR("SELECT * FROM history_tags"), "mutableCopy");
  objc_msgSend(v9, "appendString:", CFSTR(" WHERE type & ? AND modification_timestamp > ? AND modification_timestamp < ? AND item_count >= ?"));
  if (-[NSSet count](self->_identifiers, "count"))
  {
    objc_msgSend(v9, "appendString:", CFSTR(" AND identifier IN ("));
    objc_msgSend(CFSTR("?"), "safari_stringByRepeatingWithCount:joinedByString:", -[NSSet count](self->_identifiers, "count"), CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v10);

    objc_msgSend(v9, "appendString:", CFSTR(")"));
  }
  sortOrder = self->_sortOrder;
  if (sortOrder == 1)
  {
    v12 = CFSTR(" ORDER BY modification_timestamp DESC");
  }
  else
  {
    if (sortOrder != 2)
      goto LABEL_8;
    v12 = CFSTR(" ORDER BY safari_history_tag_compute_frecency_score(item_count, modification_timestamp) DESC");
  }
  objc_msgSend(v9, "appendString:", v12);
LABEL_8:
  if (self->_limit)
    objc_msgSend(v9, "appendString:", CFSTR(" LIMIT ?"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", v8, v9);
  objc_msgSend(v13, "bindInt64:atParameterIndex:", self->_tagType, 1);
  -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "bindDouble:atParameterIndex:", 2);
  -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "bindDouble:atParameterIndex:", 3);
  objc_msgSend(v13, "bindInt64:atParameterIndex:", self->_minimumItemCount, 4);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = self->_identifiers;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    v18 = 4;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19++);
        objc_msgSend(v13, "bindString:atParameterIndex:", v20, v19 + v18, (_QWORD)v25);
      }
      while (v16 != v19);
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v18 += v19;
    }
    while (v16);
    v21 = v18 + 1;
  }
  else
  {
    v21 = 5;
  }

  limit = self->_limit;
  if (limit)
    objc_msgSend(v13, "bindInt64:atParameterIndex:", limit, v21);
  if (!a6 || v13)
  {
    v23 = v13;
  }
  else
  {
    objc_msgSend(v8, "lastErrorWithMethodName:", "-[WBSHistoryTagsPredicate statementForDatabase:cache:fetchOptions:error:]");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)tagType
{
  return self->_tagType;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (unint64_t)minimumItemCount
{
  return self->_minimumItemCount;
}

- (void)setMinimumItemCount:(unint64_t)a3
{
  self->_minimumItemCount = a3;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int64_t)a3
{
  self->_sortOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

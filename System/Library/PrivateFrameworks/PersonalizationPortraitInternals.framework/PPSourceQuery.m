@implementation PPSourceQuery

- (PPSourceQuery)init
{
  PPSourceQuery *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPSourceQuery;
  result = -[PPSourceQuery init](&v3, sel_init);
  if (result)
    result->_limit = -1;
  return result;
}

- (PPSourceQuery)initWithCoder:(id)a3
{
  id v4;
  PPSourceQuery *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDate *fromDate;
  uint64_t v12;
  NSDate *toDate;
  uint64_t v14;
  NSSet *matchingBundleIds;
  uint64_t v16;
  NSSet *matchingDocumentIds;
  uint64_t v18;
  NSString *matchingContactHandle;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PPSourceQuery;
  v5 = -[PPSourceQuery init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3BD6630]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lmt"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fdt"));
    v10 = objc_claimAutoreleasedReturnValue();
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tdt"));
    v12 = objc_claimAutoreleasedReturnValue();
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("mbdl"));
    v14 = objc_claimAutoreleasedReturnValue();
    matchingBundleIds = v5->_matchingBundleIds;
    v5->_matchingBundleIds = (NSSet *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("mdids"));
    v16 = objc_claimAutoreleasedReturnValue();
    matchingDocumentIds = v5->_matchingDocumentIds;
    v5->_matchingDocumentIds = (NSSet *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mch"));
    v18 = objc_claimAutoreleasedReturnValue();
    matchingContactHandle = v5->_matchingContactHandle;
    v5->_matchingContactHandle = (NSString *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t limit;
  id v5;

  limit = self->_limit;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", limit, CFSTR("lmt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fromDate, CFSTR("fdt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_toDate, CFSTR("tdt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingBundleIds, CFSTR("mbdl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingDocumentIds, CFSTR("mdids"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingContactHandle, CFSTR("mch"));

}

- (unint64_t)hash
{
  unint64_t limit;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  limit = self->_limit;
  v4 = -[NSDate hash](self->_fromDate, "hash") - limit + 32 * limit;
  v5 = -[NSDate hash](self->_toDate, "hash") - v4 + 32 * v4;
  v6 = -[NSSet hash](self->_matchingBundleIds, "hash") - v5 + 32 * v5;
  v7 = -[NSSet hash](self->_matchingDocumentIds, "hash") - v6 + 32 * v6;
  return -[NSString hash](self->_matchingContactHandle, "hash") - v7 + 32 * v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setLimit:", self->_limit);
    objc_msgSend(v5, "setFromDate:", self->_fromDate);
    objc_msgSend(v5, "setToDate:", self->_toDate);
    objc_msgSend(v5, "setMatchingBundleIds:", self->_matchingBundleIds);
    objc_msgSend(v5, "setMatchingDocumentIds:", self->_matchingDocumentIds);
    objc_msgSend(v5, "setMatchingContactHandle:", self->_matchingContactHandle);
  }
  return v5;
}

- (BOOL)isEqualToSourceQuery:(id)a3
{
  PPSourceQuery *v4;
  PPSourceQuery *v5;
  unint64_t limit;
  NSDate *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (PPSourceQuery *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else if (v4 && (limit = self->_limit, limit == -[PPSourceQuery limit](v4, "limit")))
  {
    v7 = self->_fromDate;
    -[PPSourceQuery fromDate](v5, "fromDate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!((unint64_t)v7 | v8))
      goto LABEL_8;
    v9 = (void *)v8;
    LOBYTE(v10) = 0;
    if (!v7 || !v8)
      goto LABEL_30;
    v10 = -[NSDate isEqualToDate:](v7, "isEqualToDate:", v8);

    if (v10)
    {
LABEL_8:
      v7 = self->_toDate;
      -[PPSourceQuery toDate](v5, "toDate");
      v11 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)v7 | v11)
      {
        v9 = (void *)v11;
        LOBYTE(v10) = 0;
        if (!v7 || !v11)
          goto LABEL_30;
        v10 = -[NSDate isEqualToDate:](v7, "isEqualToDate:", v11);

        if (!v10)
          goto LABEL_31;
      }
      v7 = self->_matchingBundleIds;
      -[PPSourceQuery matchingBundleIds](v5, "matchingBundleIds");
      v12 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)v7 | v12)
      {
        v9 = (void *)v12;
        LOBYTE(v10) = 0;
        if (!v7 || !v12)
          goto LABEL_30;
        v10 = -[NSDate isEqualToSet:](v7, "isEqualToSet:", v12);

        if (!v10)
          goto LABEL_31;
      }
      v7 = self->_matchingDocumentIds;
      -[PPSourceQuery matchingDocumentIds](v5, "matchingDocumentIds");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!((unint64_t)v7 | v13))
      {
LABEL_11:
        v7 = self->_matchingContactHandle;
        -[PPSourceQuery matchingContactHandle](v5, "matchingContactHandle");
        v14 = objc_claimAutoreleasedReturnValue();
        if ((unint64_t)v7 | v14)
        {
          v9 = (void *)v14;
          LOBYTE(v10) = 0;
          if (v7 && v14)
            LOBYTE(v10) = -[NSDate isEqualToString:](v7, "isEqualToString:", v14);
        }
        else
        {
          v9 = 0;
          v7 = 0;
          LOBYTE(v10) = 1;
        }
        goto LABEL_30;
      }
      v9 = (void *)v13;
      LOBYTE(v10) = 0;
      if (v7 && v13)
      {
        v10 = -[NSDate isEqualToSet:](v7, "isEqualToSet:", v13);

        if (!v10)
          goto LABEL_31;
        goto LABEL_11;
      }
LABEL_30:

    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
LABEL_31:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PPSourceQuery *v4;
  BOOL v5;

  v4 = (PPSourceQuery *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PPSourceQuery isEqualToSourceQuery:](self, "isEqualToSourceQuery:", v4);
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPSourceQuery l:%tu d:%@-%@ mid:%@ mui:%@ mch:%@"), self->_limit, self->_fromDate, self->_toDate, self->_matchingBundleIds, self->_matchingDocumentIds, self->_matchingContactHandle);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setFromDate:(id)a3
{
  objc_storeStrong((id *)&self->_fromDate, a3);
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
  objc_storeStrong((id *)&self->_toDate, a3);
}

- (NSSet)matchingBundleIds
{
  return self->_matchingBundleIds;
}

- (void)setMatchingBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_matchingBundleIds, a3);
}

- (NSSet)matchingDocumentIds
{
  return self->_matchingDocumentIds;
}

- (void)setMatchingDocumentIds:(id)a3
{
  objc_storeStrong((id *)&self->_matchingDocumentIds, a3);
}

- (NSString)matchingContactHandle
{
  return self->_matchingContactHandle;
}

- (void)setMatchingContactHandle:(id)a3
{
  objc_storeStrong((id *)&self->_matchingContactHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingContactHandle, 0);
  objc_storeStrong((id *)&self->_matchingDocumentIds, 0);
  objc_storeStrong((id *)&self->_matchingBundleIds, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

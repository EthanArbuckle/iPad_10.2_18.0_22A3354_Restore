@implementation PKAccountEntityOrdering

- (PKAccountEntityOrdering)initWithType:(unint64_t)a3 dictionary:(id)a4
{
  id v6;
  void *v7;
  PKAccountEntityOrdering *v8;
  PKAccountEntityOrdering *v9;
  PKAccountEntityOrdering *v10;
  void *v11;
  void *v12;
  NSArray *ordering;
  objc_super v15;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)PKAccountEntityOrdering;
    v9 = -[PKAccountEntityOrdering init](&v15, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_type = a3;
      objc_msgSend(v7, "PKStringForKey:", CFSTR("key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_context = PKAccountEntityOrderingContextFromString(v11, a3);

      objc_msgSend(v7, "objectForKey:", CFSTR("ordering"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&v10->_ordering, v12);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[PKAccountEntityOrdering setOrderingFromJSONString:](v10, "setOrderingFromJSONString:", v12);
        }
        else
        {
          ordering = v10->_ordering;
          v10->_ordering = 0;

        }
      }

    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (void)setOrderingFromJSONString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  NSArray *ordering;
  char isKindOfClass;
  NSArray *v12;
  NSArray *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    ordering = self->_ordering;
    self->_ordering = 0;

    return;
  }
  v4 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "JSONObjectWithData:options:error:", v5, 0, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if (v7)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error parsing JSON: %@", buf, 0xCu);
    }

    goto LABEL_13;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
LABEL_13:
    v13 = self->_ordering;
    self->_ordering = 0;
    goto LABEL_14;
  }
  v12 = v6;
  v13 = self->_ordering;
  self->_ordering = v12;
LABEL_14:

}

- (id)orderingAsJSONString
{
  NSArray *ordering;
  void *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ordering = self->_ordering;
  if (!ordering)
    return 0;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", ordering, 0, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error serializing to JSON: %@", buf, 0xCu);
    }

    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  int64_t context;
  const __CFString *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  v4 = v3;
  type = self->_type;
  if (type > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD1F40[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  context = self->_context;
  if (context > 1)
  {
    if (context == 100)
    {
      v8 = CFSTR("rewardsHubList");
      goto LABEL_12;
    }
    if (context == 2)
    {
      v8 = CFSTR("detailList");
      goto LABEL_12;
    }
LABEL_10:
    v8 = CFSTR("unknown");
    goto LABEL_12;
  }
  if (context != 1)
    goto LABEL_10;
  v8 = CFSTR("carousel");
LABEL_12:
  objc_msgSend(v4, "appendFormat:", CFSTR("context: '%@'; "), v8);
  objc_msgSend(v4, "appendFormat:", CFSTR("ordering: '%@'; "), self->_ordering);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountEntityOrdering *v4;
  PKAccountEntityOrdering *v5;
  BOOL v6;

  v4 = (PKAccountEntityOrdering *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountEntityOrdering isEqualToAccountEntityOrdering:](self, "isEqualToAccountEntityOrdering:", v5);

  return v6;
}

- (BOOL)isEqualToAccountEntityOrdering:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSArray *ordering;
  NSArray *v7;
  char v8;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_context == v4[2] && self->_type == v4[1])
  {
    ordering = self->_ordering;
    v7 = (NSArray *)v5[3];
    if (ordering && v7)
      v8 = -[NSArray isEqual:](ordering, "isEqual:");
    else
      v8 = ordering == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_ordering);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_context - v4 + 32 * v4;
  v6 = self->_type - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountEntityOrdering)initWithCoder:(id)a3
{
  id v4;
  PKAccountEntityOrdering *v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *ordering;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountEntityOrdering;
  v5 = -[PKAccountEntityOrdering init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 != CFSTR("promotions"))
    {
      if (v6)
      {
        v8 = objc_msgSend(CFSTR("promotions"), "isEqualToString:", v6);

        if ((v8 & 1) != 0)
          goto LABEL_5;
        v10 = v7;
        if (v10 == CFSTR("enhancedMerchants")
          || (v11 = v10, v12 = objc_msgSend(CFSTR("enhancedMerchants"), "isEqualToString:", v10), v11, v12))
        {
          v9 = 1;
          goto LABEL_10;
        }
      }
      v9 = 0;
      goto LABEL_10;
    }
LABEL_5:
    v9 = 2;
LABEL_10:

    v5->_type = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_context = PKAccountEntityOrderingContextFromString(v13, v5->_type);

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("ordering"));
    v18 = objc_claimAutoreleasedReturnValue();
    ordering = v5->_ordering;
    v5->_ordering = (NSArray *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  const __CFString *v5;
  int64_t context;
  const __CFString *v7;
  id v8;

  type = self->_type;
  if (type > 2)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD1F40[type];
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("type"));
  context = self->_context;
  if (context > 1)
  {
    if (context == 100)
    {
      v7 = CFSTR("rewardsHubList");
      goto LABEL_12;
    }
    if (context == 2)
    {
      v7 = CFSTR("detailList");
      goto LABEL_12;
    }
LABEL_10:
    v7 = CFSTR("unknown");
    goto LABEL_12;
  }
  if (context != 1)
    goto LABEL_10;
  v7 = CFSTR("carousel");
LABEL_12:
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("key"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_ordering, CFSTR("ordering"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSArray *ordering;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_type;
  v5[2] = self->_context;
  ordering = self->_ordering;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__PKAccountEntityOrdering_copyWithZone___block_invoke;
  v10[3] = &__block_descriptor_40_e8__16__0_8l;
  v10[4] = a3;
  -[NSArray pk_arrayBySafelyApplyingBlock:](ordering, "pk_arrayBySafelyApplyingBlock:", v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v5[3];
  v5[3] = v7;

  return v5;
}

id __40__PKAccountEntityOrdering_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (NSArray)ordering
{
  return self->_ordering;
}

- (void)setOrdering:(id)a3
{
  objc_storeStrong((id *)&self->_ordering, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ordering, 0);
}

@end

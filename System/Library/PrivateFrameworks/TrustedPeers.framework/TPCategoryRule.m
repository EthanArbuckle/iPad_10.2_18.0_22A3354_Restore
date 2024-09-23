@implementation TPCategoryRule

- (BOOL)isEqualToCategoryRule:(id)a3
{
  TPCategoryRule *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (TPCategoryRule *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    -[TPCategoryRule prefix](self, "prefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPCategoryRule prefix](v4, "prefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[TPCategoryRule category](self, "category");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPCategoryRule category](v4, "category");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  TPCategoryRule *v4;
  BOOL v5;

  v4 = (TPCategoryRule *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPCategoryRule isEqualToCategoryRule:](self, "isEqualToCategoryRule:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TPCategoryRule prefix](self, "prefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TPCategoryRule category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TPCategoryRule prefix](self, "prefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPCategoryRule category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<TPCategoryRule: %@:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPCategoryRule prefix](self, "prefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("prefix"));

  -[TPCategoryRule category](self, "category");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("category"));

}

- (TPCategoryRule)initWithCoder:(id)a3
{
  id v4;
  TPCategoryRule *v5;
  uint64_t v6;
  NSString *prefix;
  uint64_t v8;
  NSString *category;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPCategoryRule;
  v5 = -[TPCategoryRule init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prefix"));
    v6 = objc_claimAutoreleasedReturnValue();
    prefix = v5->_prefix;
    v5->_prefix = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v8 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v8;

  }
  return v5;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

+ (id)ruleWithPrefix:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  TPCategoryRule *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(TPCategoryRule);
  -[TPCategoryRule setPrefix:](v7, "setPrefix:", v6);

  -[TPCategoryRule setCategory:](v7, "setCategory:", v5);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

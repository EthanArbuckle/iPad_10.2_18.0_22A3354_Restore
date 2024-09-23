@implementation UASharedPasteboardItemInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UASharedPasteboardItemInfo)initWithCoder:(id)a3
{
  id v4;
  UASharedPasteboardItemInfo *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[UASharedPasteboardItemInfo init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("UASharedPasteboardItemInfoTypesKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardItemInfo setTypes:](v5, "setTypes:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UASharedPasteboardItemInfo types](self, "types");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UASharedPasteboardItemInfoTypesKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[UASharedPasteboardItemInfo types](self, "types");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "types");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UASharedPasteboardItemInfo *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(UASharedPasteboardItemInfo);
  -[UASharedPasteboardItemInfo types](self, "types");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[UASharedPasteboardItemInfo setTypes:](v5, "setTypes:", v7);

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UASharedPasteboardItemInfo types](self, "types");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __41__UASharedPasteboardItemInfo_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "index");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v5, "index");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "index");
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "index");
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v11;
      v7 = (void *)v12;
    }
  }
  v13 = objc_msgSend(v6, "compare:", v7);

  return v13;
}

- (NSDictionary)types
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
}

@end

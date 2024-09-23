@implementation PGGraphPublicEventLocalizedCategoryNode

- (PGGraphPublicEventLocalizedCategoryNode)initWithLabel:(id)a3 level:(unint64_t)a4
{
  char v4;
  id v6;
  PGGraphPublicEventLocalizedCategoryNode *v7;
  uint64_t v8;
  NSString *label;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphPublicEventLocalizedCategoryNode;
  v7 = -[PGGraphNode init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    label = v7->_label;
    v7->_label = (NSString *)v8;

    *((_BYTE *)v7 + 32) = v4;
  }

  return v7;
}

- (PGGraphPublicEventLocalizedCategoryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  PGGraphPublicEventLocalizedCategoryNode *v10;

  v7 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("lvl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = -[PGGraphPublicEventLocalizedCategoryNode initWithLabel:level:](self, "initWithLabel:level:", v7, v9);
  return v10;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lvl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = !v6 || objc_msgSend(v6, "unsignedIntegerValue") == *((unsigned __int8 *)self + 32);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)propertyDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("lvl");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned __int8 *)self + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPublicEventLocalizedCategoryNode;
  -[PGGraphOptimizedNode description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (level = %d)"), v4, *((unsigned __int8 *)self + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)domain
{
  return 902;
}

- (id)label
{
  return self->_label;
}

- (unint64_t)level
{
  return *((unsigned __int8 *)self + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

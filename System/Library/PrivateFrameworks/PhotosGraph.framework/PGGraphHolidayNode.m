@implementation PGGraphHolidayNode

- (unint64_t)numberOfMomentNodes
{
  return -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", CFSTR("CELEBRATING"), 401);
}

- (PGGraphHolidayNode)initWithName:(id)a3 category:(unint64_t)a4
{
  char v4;
  id v7;
  PGGraphHolidayNode *v8;
  PGGraphHolidayNode *v9;
  objc_super v11;

  v4 = a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphHolidayNode;
  v8 = -[PGGraphNode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    *((_BYTE *)v9 + 32) = v4;
  }

  return v9;
}

- (PGGraphHolidayNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PGGraphHolidayNode *v10;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("holc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = -[PGGraphHolidayNode initWithName:category:](self, "initWithName:category:", v7, v9);

  return v10;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v9 = 0;
    if (!v6 || objc_msgSend(v6, "isEqual:", self->_name))
    {

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("holc"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (!v8 || objc_msgSend(v8, "unsignedIntegerValue") == *((unsigned __int8 *)self + 32))
        v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)propertyDictionary
{
  NSString *name;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  name = self->_name;
  v6[0] = CFSTR("name");
  v6[1] = CFSTR("holc");
  v7[0] = name;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned __int8 *)self + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v5 = self->_name;
LABEL_5:
    v6 = v5;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("holc")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned __int8 *)self + 32));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphHolidayNode.", (uint8_t *)&v8, 0xCu);
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphHolidayNode (%@, %d)"), self->_name, *((unsigned __int8 *)self + 32));
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Holiday");
  return CFSTR("Holiday");
}

- (unsigned)domain
{
  return 401;
}

- (void)enumerateCelebratingMomentNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("CELEBRATING"), 401, a3);
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[PGGraphHolidayNode name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "localizedNameForName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PGGraphHolidayNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphHolidayNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 15;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHolidayNode name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@|%lu"), v5, v6, -[PGGraphHolidayNode category](self, "category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)category
{
  return *((unsigned __int8 *)self + 32);
}

- (void)setCategory:(unint64_t)a3
{
  *((_BYTE *)self + 32) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Holiday"), 401);
}

+ (MARelation)datesOfCelebration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphCelebratingEdge filter](PGGraphCelebratingEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  +[PGGraphDateEdge filter](PGGraphDateEdge, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outRelation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  +[PGGraphDateNode filter](PGGraphDateNode, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v12;
}

+ (id)localizedNameForName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D4B170], "localizedNameForName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)holidayNodeFilterWithCategory:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D42A50]);
  v9 = CFSTR("holc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithLabel:domain:properties:", CFSTR("Holiday"), 401, v6);

  return v7;
}

+ (id)holidayNodeFilterWithNames:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = CFSTR("name");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithLabel:domain:properties:", CFSTR("Holiday"), 401, v6);
  return v7;
}

@end

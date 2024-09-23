@implementation PGGraphNode

- (PGGraphNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGGraphNode;
  return -[MANode init](&v3, sel_init);
}

- (PGGraphNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  double v11;
  PGGraphNode *v12;
  id v13;
  objc_super v14;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  LODWORD(v11) = *MEMORY[0x1E0D42A80];
  v14.receiver = self;
  v14.super_class = (Class)PGGraphNode;
  v12 = -[MANode initWithLabel:domain:weight:properties:](&v14, sel_initWithLabel_domain_weight_properties_, v9, v6, v10, v11);
  PGMethodNotImplentedException(v12, a2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v13);
}

- (PGGraphNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  double v12;
  void *v13;
  PGGraphNode *v14;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (*MEMORY[0x1E0D42A80] != a5)
    __assert_rtn("-[PGGraphNode initWithLabel:domain:weight:properties:]", "PGGraphNode.m", 304, "weight == kMAElementDefaultWeight");
  v13 = v11;
  LODWORD(v12) = *MEMORY[0x1E0D42A80];
  v14 = -[PGGraphNode initWithLabel:domain:properties:](self, "initWithLabel:domain:properties:", v10, v8, v11, v12);

  return v14;
}

- (MANodeFilter)entityFilter
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[MANode propertyDictionary](self, "propertyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(&unk_1E84E9550, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(&unk_1E84E9550);
      v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
      objc_msgSend(v3, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(&unk_1E84E9550, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    v20 = v8;
    objc_msgSend(v3, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_12;
  }
LABEL_11:
  v11 = v3;
LABEL_12:
  v12 = objc_alloc(MEMORY[0x1E0D42A50]);
  -[PGGraphNode label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithLabel:domain:properties:", v13, -[PGGraphNode domain](self, "domain"), v11);

  return (MANodeFilter *)v14;
}

- (id)name
{
  return 0;
}

- (id)UUID
{
  return 0;
}

- (id)keywordDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  -[PGGraphNode label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[PGGraphNode UUID](self, "UUID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), v3, v5);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), v3, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (float)weight
{
  return *MEMORY[0x1E0D42A80];
}

- (void)setWeight:(float)a3
{
  id v3;

  PGMethodNotImplentedException(self, a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)isEqualToNode:(id)a3
{
  PGGraphNode *v4;
  PGGraphNode *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (PGGraphNode *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_11;
  }
  v6 = -[PGGraphNode domain](self, "domain");
  if (v6 == -[PGGraphNode domain](v5, "domain"))
  {
    -[PGGraphNode label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphNode label](v5, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (v7 == v8 || objc_msgSend(v7, "isEqualToString:", v8))
      && -[MANode hasEqualPropertiesToNode:](self, "hasEqualPropertiesToNode:", v5);

  }
  else
  {
LABEL_7:
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[MANode identifier](self, "identifier");
  -[PGGraphNode label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ %p] id:[%lu] label:[%@]"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ edgesCount:[%ld] inEdgesCount:[%ld] outEdgesCount:[%ld]"), v7, -[MANode edgesCount](self, "edgesCount"), -[MANode inEdgesCount](self, "inEdgesCount"), -[MANode outEdgesCount](self, "outEdgesCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = objc_opt_class();
  }

  v9.receiver = self;
  v9.super_class = (Class)PGGraphNode;
  -[MANode propertyForKey:](&v9, sel_propertyForKey_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)propertiesCount
{
  id v2;

  PGMethodNotImplentedException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (MANodeFilter)filter
{
  return (MANodeFilter *)objc_msgSend(MEMORY[0x1E0D42A50], "any");
}

@end

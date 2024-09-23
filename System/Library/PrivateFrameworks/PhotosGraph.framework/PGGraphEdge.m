@implementation PGGraphEdge

- (PGGraphEdge)initWithSourceNode:(id)a3 targetNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphEdge;
  return -[MAEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  PGGraphEdge *v18;
  id v19;
  objc_super v20;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  LODWORD(v17) = *MEMORY[0x1E0D42A80];
  v20.receiver = self;
  v20.super_class = (Class)PGGraphEdge;
  v18 = -[MAEdge initWithLabel:sourceNode:targetNode:domain:weight:properties:](&v20, sel_initWithLabel_sourceNode_targetNode_domain_weight_properties_, v13, v14, v15, v8, v16, v17);
  PGMethodNotImplentedException(v18, a2);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v19);
}

- (PGGraphEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  void *v19;
  PGGraphEdge *v20;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (*MEMORY[0x1E0D42A80] != a7)
    __assert_rtn("-[PGGraphEdge initWithLabel:sourceNode:targetNode:domain:weight:properties:]", "PGGraphEdge.m", 154, "weight == kMAElementDefaultWeight");
  v19 = v17;
  LODWORD(v18) = *MEMORY[0x1E0D42A80];
  v20 = -[PGGraphEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v17, v18);

  return v20;
}

- (id)keywordDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphEdge label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphEdge propertyForKey:](self, "propertyForKey:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

- (BOOL)isEqualToEdge:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  if (v4 && (v5 = -[PGGraphEdge domain](self, "domain"), v5 == objc_msgSend(v4, "domain")))
  {
    -[PGGraphEdge label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == v7 || objc_msgSend(v6, "isEqualToString:", v7))
      && -[MAEdge hasEqualPropertiesToEdge:](self, "hasEqualPropertiesToEdge:", v4))
    {
      -[MAEdge sourceNode](self, "sourceNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAEdge targetNode](self, "targetNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetNode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (v8 == v10 || objc_msgSend(v8, "isEqualToNode:", v10))
         && (v9 == v11 || (objc_msgSend(v9, "isEqualToNode:", v11) & 1) != 0);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  v9.super_class = (Class)PGGraphEdge;
  -[MAEdge propertyForKey:](&v9, sel_propertyForKey_, v4);
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

+ (MAEdgeFilter)filter
{
  return (MAEdgeFilter *)objc_msgSend(MEMORY[0x1E0D42A00], "any");
}

@end

@implementation PGGraphPerformerNode

- (PGGraphPerformerNode)initWithName:(id)a3 uuid:(id)a4
{
  id v7;
  id v8;
  PGGraphPerformerNode *v9;
  PGGraphPerformerNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPerformerNode;
  v9 = -[PGGraphNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_uuid, a4);
  }

  return v10;
}

- (PGGraphPerformerNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  PGGraphPerformerNode *v9;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PGGraphPerformerNode initWithName:uuid:](self, "initWithName:uuid:", v7, v8);
  return v9;
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

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (!v8 || objc_msgSend(v8, "isEqual:", self->_uuid))
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
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_uuid, CFSTR("id"));
  return v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphPerformerNode (%@, %@)"), self->_name, self->_uuid);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Performer");
  return CFSTR("Performer");
}

- (unsigned)domain
{
  return 900;
}

- (PGGraphPerformerNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphPerformerNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 26;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@|%@"), v5, self->_name, self->_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Performer"), 900);
}

- (PPNamedEntity)pg_namedEntity
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[PGGraphPerformerNode name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    if (-[PGGraphPerformerNode domain](self, "domain") == 900)
    {
      -[PGGraphPerformerNode label](self, "label");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Performer"));

      if (v6)
        v7 = 7;
      else
        v7 = 2;
    }
    else
    {
      v7 = 2;
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v4, v7, v10);
  }
  else
  {
    v8 = 0;
  }

  return (PPNamedEntity *)v8;
}

@end

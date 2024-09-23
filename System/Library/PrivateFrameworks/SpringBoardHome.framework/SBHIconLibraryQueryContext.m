@implementation SBHIconLibraryQueryContext

- (SBHIconLibraryQueryContext)initWithQuery:(id)a3
{
  id v4;
  SBHIconLibraryQueryContext *v5;
  uint64_t v6;
  SBHIconLibraryQuery *query;
  uint64_t v8;
  NSUUID *UUID;
  uint64_t v10;
  NSMutableDictionary *contextStorage;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBHIconLibraryQueryContext;
  v5 = -[SBHIconLibraryQueryContext init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    query = v5->_query;
    v5->_query = (SBHIconLibraryQuery *)v6;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    v10 = objc_opt_new();
    contextStorage = v5->_contextStorage;
    v5->_contextStorage = (NSMutableDictionary *)v10;

    v12 = _gQueryContextIdx++;
    v5->_queryContextIdx = v12;
  }

  return v5;
}

- (SBHIconLibraryQueryContext)init
{

  return 0;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_query, CFSTR("query"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_UUID, CFSTR("UUID"));
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", self->_contextStorage, CFSTR("contextStorage"), 1);
  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_queryContextIdx, CFSTR("queryContextIdx"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconLibraryQueryContext *v4;
  BOOL v5;

  v4 = (SBHIconLibraryQueryContext *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[SBHIconLibraryQueryContext isEqualToQueryContext:](self, "isEqualToQueryContext:", v4);
  }

  return v5;
}

- (BOOL)isEqualToQueryContext:(id)a3
{
  SBHIconLibraryQueryContext *v4;
  id *p_isa;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  char v12;

  v4 = (SBHIconLibraryQueryContext *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    -[SBHIconLibraryQueryContext UUID](v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconLibraryQueryContext UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8
      && (objc_msgSend(p_isa, "query"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SBHIconLibraryQueryContext query](self, "query"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "isEqual:", v10),
          v10,
          v9,
          v11))
    {
      v12 = objc_msgSend(p_isa[1], "isEqual:", self->_contextStorage);
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_contextStorage, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contextStorage, "setObject:forKeyedSubscript:", a3, a4);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (SBHIconLibraryQuery)query
{
  return self->_query;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_contextStorage, 0);
}

@end

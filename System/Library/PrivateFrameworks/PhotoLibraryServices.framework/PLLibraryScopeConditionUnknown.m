@implementation PLLibraryScopeConditionUnknown

+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:", v4);
  objc_msgSend(v7, "setUnknownSingleQueries:", v6);

  return v7;
}

+ (BOOL)supportsQueryKey:(int)a3
{
  return 1;
}

- (unsigned)type
{
  return 0;
}

- (id)conditionQuery
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D732A0]);
  objc_msgSend(v3, "setConjunction:", 0);
  v4 = (void *)-[NSArray mutableCopy](self->_unknownSingleQueries, "mutableCopy");
  objc_msgSend(v3, "setSingleQueries:", v4);

  return v3;
}

- (NSArray)unknownSingleQueries
{
  return self->_unknownSingleQueries;
}

- (void)setUnknownSingleQueries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownSingleQueries, 0);
}

@end

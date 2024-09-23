@implementation _UISelectorSet

- (_UISelectorSet)initWithHash:(id)a3
{
  id v5;
  _UISelectorSet *v6;
  _UISelectorSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISelectorSet;
  v6 = -[_UISelectorSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_hash, a3);

  return v7;
}

- (_UISelectorSet)init
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _UISelectorSet *v7;

  if (!init_pointerFunctions)
  {
    objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 256);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)init_pointerFunctions;
    init_pointerFunctions = v3;

    objc_msgSend((id)init_pointerFunctions, "setDescriptionFunction:", selectorDescription_0);
  }
  v5 = objc_alloc(MEMORY[0x1E0CB3690]);
  v6 = (void *)objc_msgSend(v5, "initWithPointerFunctions:capacity:", init_pointerFunctions, 0);
  v7 = -[_UISelectorSet initWithHash:](self, "initWithHash:", v6);

  return v7;
}

- (_UISelectorSet)initWithSelectors:(SEL)a3
{
  _UISelectorSet *v4;
  SEL *v5;
  SEL *v7;
  uint64_t v8;

  v4 = -[_UISelectorSet init](self, "init");
  if (v4)
  {
    v7 = (SEL *)&v8;
    if (a3)
    {
      do
      {
        NSHashInsert(v4->_hash, a3);
        v5 = v7++;
        a3 = *v5;
      }
      while (*v5);
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UISelectorSet *v5;
  void *v6;
  _UISelectorSet *v7;

  v5 = [_UISelectorSet alloc];
  v6 = (void *)-[NSHashTable copyWithZone:](self->_hash, "copyWithZone:", a3);
  v7 = -[_UISelectorSet initWithHash:](v5, "initWithHash:", v6);

  return v7;
}

- (unint64_t)count
{
  return -[NSHashTable count](self->_hash, "count");
}

- (BOOL)containsSelector:(SEL)a3
{
  return NSHashGet(self->_hash, a3) != 0;
}

- (void)addSelector:(SEL)a3
{
  NSHashInsert(self->_hash, a3);
}

- (void)removeSelector:(SEL)a3
{
  NSHashRemove(self->_hash, a3);
}

- (void)enumerateSelectorsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  char v6;
  NSHashEnumerator enumerator;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateHashTable(&enumerator, self->_hash);
  do
  {
    v5 = NSNextHashEnumeratorItem(&enumerator);
    if (!v5)
      break;
    v6 = 0;
    v4[2](v4, v5, &v6);
  }
  while (!v6);
  NSEndHashTableEnumeration(&enumerator);

}

- (BOOL)intersectsSet:(id)a3
{
  return -[NSHashTable intersectsHashTable:](self->_hash, "intersectsHashTable:", *((_QWORD *)a3 + 1));
}

- (BOOL)containsSet:(id)a3
{
  return objc_msgSend(*((id *)a3 + 1), "isSubsetOfHashTable:", self->_hash);
}

- (void)intersectSet:(id)a3
{
  -[NSHashTable intersectHashTable:](self->_hash, "intersectHashTable:", *((_QWORD *)a3 + 1));
}

- (void)minusSet:(id)a3
{
  -[NSHashTable minusHashTable:](self->_hash, "minusHashTable:", *((_QWORD *)a3 + 1));
}

- (void)unionSet:(id)a3
{
  -[NSHashTable unionHashTable:](self->_hash, "unionHashTable:", *((_QWORD *)a3 + 1));
}

- (BOOL)isEqual:(id)a3
{
  NSHashTable **v4;
  BOOL v5;

  v4 = (NSHashTable **)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && NSCompareHashTables(self->_hash, v4[1]);

  return v5;
}

- (unint64_t)hash
{
  return -[NSHashTable hash](self->_hash, "hash");
}

- (id)description
{
  return (id)-[NSHashTable description](self->_hash, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hash, 0);
}

@end

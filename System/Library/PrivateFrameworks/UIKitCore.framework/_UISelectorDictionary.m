@implementation _UISelectorDictionary

- (void)setObject:(id)a3 forSelector:(SEL)a4
{
  NSMapInsert(self->_map, a4, a3);
}

- (id)objectForSelector:(SEL)a3
{
  return NSMapGet(self->_map, a3);
}

- (_UISelectorDictionary)initWithMapping:(id)a3 objects:(id)a4
{
  uint64_t (**v6)(id, void *);
  id v7;
  _UISelectorDictionary *v8;
  id v9;
  void *v10;
  NSMapTable *map;
  const void *v12;
  id *v13;
  id v14;
  id *v16;
  uint64_t v17;

  v6 = (uint64_t (**)(id, void *))a3;
  v7 = a4;
  v8 = -[_UISelectorDictionary init](self, "init");
  if (v8)
  {
    v16 = (id *)&v17;
    v9 = v7;
    if (v9)
    {
      v10 = v9;
      do
      {
        map = v8->_map;
        v12 = (const void *)v6[2](v6, v10);
        NSMapInsert(map, v12, v10);
        v13 = v16++;
        v14 = *v13;

        v10 = v14;
      }
      while (v14);
    }
  }

  return v8;
}

- (_UISelectorDictionary)init
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _UISelectorDictionary *v9;

  if (!_MergedGlobals_1029)
  {
    objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 256);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_MergedGlobals_1029;
    _MergedGlobals_1029 = v3;

    objc_msgSend((id)_MergedGlobals_1029, "setDescriptionFunction:", selectorDescription);
  }
  if (!qword_1ECD7D8F0)
  {
    objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ECD7D8F0;
    qword_1ECD7D8F0 = v5;

  }
  v7 = objc_alloc(MEMORY[0x1E0CB3748]);
  v8 = (void *)objc_msgSend(v7, "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", _MergedGlobals_1029, qword_1ECD7D8F0, 0);
  v9 = -[_UISelectorDictionary initWithMap:](self, "initWithMap:", v8);

  return v9;
}

- (_UISelectorDictionary)initWithMap:(id)a3
{
  id v5;
  _UISelectorDictionary *v6;
  _UISelectorDictionary *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISelectorDictionary;
  v6 = -[_UISelectorDictionary init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_map, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UISelectorDictionary *v5;
  void *v6;
  _UISelectorDictionary *v7;

  v5 = [_UISelectorDictionary alloc];
  v6 = (void *)-[NSMapTable copyWithZone:](self->_map, "copyWithZone:", a3);
  v7 = -[_UISelectorDictionary initWithMap:](v5, "initWithMap:", v6);

  return v7;
}

- (unint64_t)count
{
  return -[NSMapTable count](self->_map, "count");
}

- (_UISelectorSet)allSelectors
{
  _UISelectorSet *v3;
  _UISelectorSet *v4;
  _QWORD v6[4];
  _UISelectorSet *v7;

  v3 = objc_alloc_init(_UISelectorSet);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37___UISelectorDictionary_allSelectors__block_invoke;
  v6[3] = &unk_1E16C54B8;
  v4 = v3;
  v7 = v4;
  -[_UISelectorDictionary enumerateSelectorsAndObjectsUsingBlock:](self, "enumerateSelectorsAndObjectsUsingBlock:", v6);

  return v4;
}

- (NSArray)allObjects
{
  return NSAllMapTableValues(self->_map);
}

- (void)removeObjectForSelector:(SEL)a3
{
  NSMapRemove(self->_map, a3);
}

- (void)addEntriesFromDictionary:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50___UISelectorDictionary_addEntriesFromDictionary___block_invoke;
  v3[3] = &unk_1E16C54B8;
  v3[4] = self;
  objc_msgSend(a3, "enumerateSelectorsAndObjectsUsingBlock:", v3);
}

- (void)removeObjectsForSelectors:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51___UISelectorDictionary_removeObjectsForSelectors___block_invoke;
  v3[3] = &unk_1E16C54E0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateSelectorsUsingBlock:", v3);
}

- (void)enumerateSelectorsAndObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  char v5;
  NSMapEnumerator enumerator;
  void *value;
  void *key;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  key = 0;
  value = 0;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, self->_map);
  do
  {
    if (!NSNextMapEnumeratorPair(&enumerator, &key, &value))
      break;
    v5 = 0;
    v4[2](v4, key, value, &v5);
  }
  while (!v5);
  NSEndMapTableEnumeration(&enumerator);

}

- (BOOL)isEqual:(id)a3
{
  NSMapTable **v4;
  BOOL v5;

  v4 = (NSMapTable **)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && NSCompareMapTables(self->_map, v4[1]);

  return v5;
}

- (unint64_t)hash
{
  return -[NSMapTable hash](self->_map, "hash");
}

- (id)description
{
  return (id)-[NSMapTable description](self->_map, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

@end

@implementation _UICompoundObjectMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapTable, 0);
}

- (_UICompoundObjectMap)init
{
  _UICompoundObjectMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mapTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICompoundObjectMap;
  v2 = -[_UICompoundObjectMap init](&v6, sel_init);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mapTable = v2->_mapTable;
  v2->_mapTable = v3;

  return v2;
}

- (void)addEntriesFromCompoundObjectMap:(id)a3 keepingCurrentValues:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77___UICompoundObjectMap_addEntriesFromCompoundObjectMap_keepingCurrentValues___block_invoke;
  v4[3] = &unk_1E16B43A8;
  v5 = a4;
  v4[4] = self;
  objc_msgSend(a3, "performWithEach:", v4);
}

- (void)performWithEach:(id)a3
{
  id v4;
  NSMutableDictionary *mapTable;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  mapTable = self->_mapTable;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40___UICompoundObjectMap_performWithEach___block_invoke;
  v7[3] = &unk_1E16B43D0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mapTable, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)removeAllMappings
{
  -[NSMutableDictionary removeAllObjects](self->_mapTable, "removeAllObjects");
}

- (id)valueForObject:(id)a3 andProperty:(id)a4
{
  NSMutableDictionary *mapTable;
  void *v5;
  void *v6;

  mapTable = self->_mapTable;
  +[_UICompoundObjectMapKey keyWithObject:andProperty:](_UICompoundObjectMapKey, "keyWithObject:andProperty:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mapTable, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forObject:(id)a4 andProperty:(id)a5
{
  NSMutableDictionary *mapTable;
  id v8;
  id v9;

  if (a3)
  {
    mapTable = self->_mapTable;
    v8 = a3;
    +[_UICompoundObjectMapKey keyWithObject:andProperty:](_UICompoundObjectMapKey, "keyWithObject:andProperty:", a4, a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](mapTable, "setObject:forKey:", v8, v9);

  }
}

+ (id)compoundObjectMap
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (id)deepCopy
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32___UICompoundObjectMap_deepCopy__block_invoke;
  v6[3] = &unk_1E16B43F8;
  v4 = v3;
  v7 = v4;
  -[_UICompoundObjectMap performWithEach:](self, "performWithEach:", v6);

  return v4;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_mapTable, "count");
}

- (id)description
{
  return (id)-[NSMutableDictionary description](self->_mapTable, "description");
}

@end

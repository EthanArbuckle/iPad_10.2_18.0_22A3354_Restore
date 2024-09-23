@implementation MTEntityUpdaterCache

- (MTEntityUpdaterCache)initWithPredicate:(id)a3 entityName:(id)a4 ctx:(id)a5 properties:(id)a6 fetchProperties:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MTEntityUpdaterCache *v17;
  MTEntityUpdaterCache *v18;
  MTEntityUpdaterCache *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)MTEntityUpdaterCache;
  v17 = -[MTEntityUpdaterCache init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_properties, a6);
    objc_storeStrong((id *)&v18->_propertiesToFetch, a7);
    objc_storeStrong((id *)&v18->_ctx, a5);
    objc_storeStrong((id *)&v18->_predicate, a3);
    objc_storeStrong((id *)&v18->_entityName, a4);
    v19 = v18;
  }

  return v18;
}

- (id)propertyDictionaryForSearchItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int (**allowKeyForValue)(id, void *, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v4 = a3;
  if (!self->_objectsByProperty)
    -[MTEntityUpdaterCache _buildMap](self, "_buildMap");
  v5 = -[NSArray count](self->_properties, "count");
  if (v5 < 1)
  {
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  v6 = v5;
  v7 = 0;
  while (1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_properties, "objectAtIndexedSubscript:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));
    allowKeyForValue = (unsigned int (**)(id, void *, void *))self->_allowKeyForValue;
    if (allowKeyForValue && !allowKeyForValue[2](allowKeyForValue, v8, v9))
      goto LABEL_10;
    if (v9)
      break;
LABEL_11:

    if (v6 == ++v7)
      goto LABEL_12;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_objectsByProperty, "objectAtIndexedSubscript:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));
  if (!v12)
  {

LABEL_10:
    goto LABEL_11;
  }
  v13 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("uuid")));
  if (v15)
    -[NSMutableSet removeObject:](self->_unvisited, "removeObject:", v15);

LABEL_13:
  return v13;
}

- (void)_buildMap
{
  void *v3;
  NSString *entityName;
  NSManagedObjectContext *ctx;
  NSPredicate *predicate;
  void *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *unvisited;
  NSMutableArray *v12;
  NSMutableArray *objectsByProperty;
  unint64_t v14;
  NSMutableArray *v15;
  NSMutableDictionary *v16;
  id v17;
  _QWORD v18[5];

  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", self->_properties));
  objc_msgSend(v17, "addObject:", CFSTR("uuid"));
  if (-[NSArray count](self->_propertiesToFetch, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", self->_propertiesToFetch));
    objc_msgSend(v17, "unionSet:", v3);

  }
  entityName = self->_entityName;
  ctx = self->_ctx;
  predicate = self->_predicate;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext objectsInEntity:predicate:propertiesToFetch:limit:](ctx, "objectsInEntity:predicate:propertiesToFetch:limit:", entityName, predicate, v7, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("uuid")));
  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v9));
  unvisited = self->_unvisited;
  self->_unvisited = v10;

  v12 = objc_opt_new(NSMutableArray);
  objectsByProperty = self->_objectsByProperty;
  self->_objectsByProperty = v12;

  if (-[NSArray count](self->_properties, "count"))
  {
    v14 = 0;
    do
    {
      v15 = self->_objectsByProperty;
      v16 = objc_opt_new(NSMutableDictionary);
      -[NSMutableArray addObject:](v15, "addObject:", v16);

      ++v14;
    }
    while (v14 < -[NSArray count](self->_properties, "count"));
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000B8E68;
  v18[3] = &unk_1004A9770;
  v18[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);

}

- (void)addEntityToCache:(id)a3
{
  void *v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dictionaryRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEntityUpdaterCache indexingBlock](self, "indexingBlock"));

  if (v5)
  {
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MTEntityUpdaterCache indexingBlock](self, "indexingBlock"));
    v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_dictionaryByAddingEntriesFromDictionary:", v8));

    v4 = (void *)v9;
  }
  -[MTEntityUpdaterCache _addDictionary:](self, "_addDictionary:", v4);

}

- (void)_addDictionary:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[NSArray count](self->_properties, "count"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_properties, "objectAtIndexedSubscript:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v5));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_objectsByProperty, "objectAtIndexedSubscript:", v4));
        objc_msgSend(v7, "setObject:forKey:", v8, v6);

      }
      ++v4;
    }
    while (v4 < -[NSArray count](self->_properties, "count"));
  }

}

- (void)enumerateUnvisitedItemUuids:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  NSMutableSet *unvisited;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void (**)(id, uint64_t, char *))a3;
  unvisited = self->_unvisited;
  if (!unvisited)
  {
    -[MTEntityUpdaterCache _buildMap](self, "_buildMap");
    unvisited = self->_unvisited;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = unvisited;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v12 = 0;
      v4[2](v4, v11, &v12);
      if (v12)
        break;
      if (v8 == (id)++v10)
      {
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (id)allowKeyForValue
{
  return self->_allowKeyForValue;
}

- (void)setAllowKeyForValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)indexingBlock
{
  return self->_indexingBlock;
}

- (void)setIndexingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_indexingBlock, 0);
  objc_storeStrong(&self->_allowKeyForValue, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_unvisited, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_propertiesToFetch, 0);
  objc_storeStrong((id *)&self->_objectsByProperty, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end

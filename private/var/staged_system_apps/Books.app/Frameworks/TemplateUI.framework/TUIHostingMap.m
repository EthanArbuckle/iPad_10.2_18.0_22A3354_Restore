@implementation TUIHostingMap

- (TUIHostingMap)initWithMap:(id)a3 order:(id)a4
{
  id v6;
  id v7;
  TUIHostingMap *v8;
  NSDictionary *v9;
  NSDictionary *map;
  NSArray *v11;
  NSArray *order;
  NSSet *v13;
  NSSet *identifiers;
  NSMutableDictionary *v15;
  NSArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  TUIHostingMap *v25;
  NSDictionary *v26;
  NSDictionary *groupMap;
  TUIHostingMap *v29;
  _QWORD v30[4];
  id v31;
  TUIHostingMap *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];

  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)TUIHostingMap;
  v8 = -[TUIHostingMap init](&v37, "init");
  if (v8)
  {
    v9 = (NSDictionary *)objc_msgSend(v6, "copy");
    map = v8->_map;
    v8->_map = v9;

    v11 = (NSArray *)objc_msgSend(v7, "copy");
    order = v8->_order;
    v8->_order = v11;

    if (v8->_order)
    {
      v13 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v8->_order);
      identifiers = v8->_identifiers;
      v8->_identifiers = v13;
    }
    else
    {
      identifiers = v8->_identifiers;
      v8->_identifiers = 0;
    }

    if (-[NSArray count](v8->_order, "count"))
    {
      v15 = objc_opt_new(NSMutableDictionary);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v29 = v8;
      v16 = v8->_order;
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v21, v29));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "groupIdentifier"));

            if (v23)
            {
              v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v23));
              if (!v24)
              {
                v24 = objc_opt_new(NSMutableArray);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v24, v23);
              }
              -[NSMutableArray addObject:](v24, "addObject:", v21);

            }
          }
          v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v18);
      }

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1B44C;
      v30[3] = &unk_23DB40;
      v31 = v6;
      v8 = v29;
      v25 = v29;
      v32 = v25;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v30);
      v26 = (NSDictionary *)-[NSMutableDictionary copy](v15, "copy");
      groupMap = v25->_groupMap;
      v25->_groupMap = v26;

    }
  }

  return v8;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v9;

  v4 = a3;
  v6 = objc_opt_class(v4, v5);
  if (v6 != objc_opt_class(TUIHostingMap, v7) || v4 == 0)
    v9 = 0;
  else
    v9 = -[TUIHostingMap isEqualToMap:](self, "isEqualToMap:", v4);

  return v9;
}

- (BOOL)isEqualToMap:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  NSDictionary *map;
  NSDictionary *v8;
  NSDictionary *v9;
  unsigned __int8 v10;
  NSArray *order;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  void *v15;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    map = self->_map;
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "map"));
    if (map == v8
      || (v9 = self->_map,
          v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "map")),
          -[NSDictionary isEqualToDictionary:](v9, "isEqualToDictionary:", v3)))
    {
      order = self->_order;
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "order"));
      if (order == (NSArray *)v12)
      {

        v10 = 1;
      }
      else
      {
        v13 = (void *)v12;
        v14 = self->_order;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "order"));
        v10 = -[NSArray isEqualToArray:](v14, "isEqualToArray:", v15);

      }
      if (map == v8)
        goto LABEL_11;
    }
    else
    {
      v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)reverseEnumeratorForGroup:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_groupMap, "objectForKeyedSubscript:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));

  return v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p map=%@ order=%@ groups=%@>"), v5, self, self->_map, self->_order, self->_groupMap));

  return v6;
}

- (NSArray)order
{
  return self->_order;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (NSDictionary)groupMap
{
  return self->_groupMap;
}

- (NSDictionary)map
{
  return self->_map;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_groupMap, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_order, 0);
}

@end

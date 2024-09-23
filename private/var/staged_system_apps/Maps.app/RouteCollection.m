@implementation RouteCollection

- (RouteCollection)initWithRoutes:(id)a3 currentRouteIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  RouteCollection *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  NSArray *v21;
  NSArray *routes;
  unint64_t v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  RouteCollection *v27;
  void *v29;
  unint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = v6;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)objc_msgSend(v6, "count") <= a4)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("currentRouteIndex is out of bounds"));
    v27 = 0;
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)RouteCollection;
    v8 = -[RouteCollection init](&v36, "init");
    if (v8)
    {
      v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
      v10 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
      v30 = a4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a4));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueRouteID"));

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v31 = v7;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueRouteID"));
            v19 = objc_msgSend(v10, "containsObject:", v18);

            if ((v19 & 1) == 0)
            {
              objc_msgSend(v9, "addObject:", v17);
              objc_msgSend(v17, "_maps_routeCollectionOnly_setRouteCollectionWhenNil:", v8);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueRouteID"));
              objc_msgSend(v10, "addObject:", v20);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v14);
      }

      v21 = (NSArray *)objc_msgSend(v9, "copy");
      routes = v8->_routes;
      v8->_routes = v21;

      v23 = v30;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v8->_routes, "objectAtIndexedSubscript:", v30));
      v25 = objc_msgSend(v29, "isEqual:", v24);

      if ((v25 & 1) == 0)
      {
        v26 = -[RouteCollection indexForUniqueRouteID:](v8, "indexForUniqueRouteID:", v29);
        if (v26 == (id)0x7FFFFFFFFFFFFFFFLL)
          v23 = 0;
        else
          v23 = (unint64_t)v26;
      }
      v8->_currentRouteIndex = v23;

      v7 = v31;
    }
    self = v8;
    v27 = self;
  }

  return v27;
}

- (unint64_t)shortestRouteIndex
{
  void *v2;
  unint64_t v3;
  _QWORD v5[6];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0x7FEFFFFFFFFFFFFFLL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007362EC;
  v5[3] = &unk_1011C50D8;
  v5[4] = v6;
  v5[5] = &v7;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (unint64_t)fastestRouteIndex
{
  void *v2;
  unint64_t v3;
  _QWORD v5[6];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0x7FEFFFFFFFFFFFFFLL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10073643C;
  v5[3] = &unk_1011C50D8;
  v5[4] = v6;
  v5[5] = &v7;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "_maps_routeCollectionOnly_Clear");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)RouteCollection;
  -[RouteCollection dealloc](&v8, "dealloc");
}

- (id)description
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = -[RouteCollection currentRouteIndex](self, "currentRouteIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p currentRouteIndex=%lu routes=%@>"), v3, self, v4, v5));

  return v6;
}

- (NSString)shortDescription
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = -[RouteCollection currentRouteIndex](self, "currentRouteIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p currentRouteIndex=%lu routes=%@>"), v3, self, v4, v5));

  return (NSString *)v6;
}

- (id)routeCollectionByChangingCurrentRouteIndex:(unint64_t)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_alloc((Class)objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v7 = objc_msgSend(v5, "initWithRoutes:currentRouteIndex:", v6, a3);

  return v7;
}

- (id)routeCollectionByReplacingAlternateRoutes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection currentRoute](self, "currentRoute"));
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(v5, "addObjectsFromArray:", v4);
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithRoutes:currentRouteIndex:", v5, 0);

  return v7;
}

- (id)routeCollectionByReplacingAlternateComposedRoutes:(id)a3 withTraffics:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection currentRoute](self, "currentRoute"));
  objc_msgSend(v6, "addObject:", v7);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueRouteID", (_QWORD)v18));
        v15 = (id)objc_claimAutoreleasedReturnValue(-[RouteCollection objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v14));

        if (!v15)
          v15 = v13;
        objc_msgSend(v6, "addObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithRoutes:currentRouteIndex:", v6, 0);
  return v16;
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (GEOComposedRoute)currentRoute
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", -[RouteCollection currentRouteIndex](self, "currentRouteIndex")));

  return (GEOComposedRoute *)v4;
}

- (NSArray)alternateRoutes
{
  NSArray *alternateRoutes;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  alternateRoutes = self->_alternateRoutes;
  if (!alternateRoutes)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
    v5 = (NSArray *)objc_msgSend(v4, "mutableCopy");

    -[NSArray removeObjectAtIndex:](v5, "removeObjectAtIndex:", -[RouteCollection currentRouteIndex](self, "currentRouteIndex"));
    v6 = self->_alternateRoutes;
    self->_alternateRoutes = v5;

    alternateRoutes = self->_alternateRoutes;
  }
  return alternateRoutes;
}

- (unint64_t)indexForUniqueRouteID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueRouteID"));
      v11 = objc_msgSend(v10, "isEqual:", v4);

      if ((v11 & 1) != 0)
        break;
      ++v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
      v13 = objc_msgSend(v12, "count");

      if (v7 >= (unint64_t)v13)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (unint64_t)indexOfRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100736BC8;
  v9[3] = &unk_1011B1A50;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return (unint64_t)v7;
}

- (NSArray)uniqueRouteIDs
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v3 = sub_10039DCD4(v2, &stru_1011C50F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSArray *)v4;
}

- (BOOL)isEqual:(id)a3
{
  RouteCollection *v4;
  RouteCollection *v5;
  uint64_t v6;
  RouteCollection *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = (RouteCollection *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = -[RouteCollection currentRouteIndex](v7, "currentRouteIndex");
    if (v8 == (id)-[RouteCollection currentRouteIndex](self, "currentRouteIndex"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](v7, "routes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[RouteCollection currentRouteIndex](self, "currentRouteIndex")));
  v6 = v4 ^ ((_QWORD)objc_msgSend(v5, "hash") << 8);

  return v6;
}

- (unint64_t)currentRouteIndex
{
  return self->_currentRouteIndex;
}

- (void)setCurrentRouteIndex:(unint64_t)a3
{
  self->_currentRouteIndex = a3;
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
}

- (id)objectForKey:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[RouteCollection indexForUniqueRouteID:](self, "indexForUniqueRouteID:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v4));
  return v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  return v5;
}

- (void)enumerateRoutesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void (**)(id, uint64_t, char *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  id v9;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self, "routes"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return (unint64_t)v9;
}

@end

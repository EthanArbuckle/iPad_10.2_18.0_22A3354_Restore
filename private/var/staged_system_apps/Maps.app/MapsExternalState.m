@implementation MapsExternalState

+ (NSArray)allKeys
{
  return 0;
}

- (BOOL)_isValue:(id)a3 equalTo:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 v14;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
    {
      v9 = objc_opt_class(v6);
      if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
      {
        v10 = objc_opt_class(NSArray);
        if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet setWithArray:](NSCountedSet, "setWithArray:", v5));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet setWithArray:](NSCountedSet, "setWithArray:", v7));
          v8 = objc_msgSend(v11, "isEqualToSet:", v12);

        }
        else
        {
          v13 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v5, v13) & 1) != 0)
            v14 = objc_msgSend((id)v5, "isEqualToDictionary:", v7);
          else
            v14 = objc_msgSend((id)v5, "isEqual:", v7);
          v8 = v14;
        }
      }
      else
      {
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)isEqualToState:(id)a3
{
  return -[MapsExternalState isEqualToState:changedKeys:](self, "isEqualToState:changedKeys:", a3, 0);
}

- (BOOL)isEqualToState:(id)a3 changedKeys:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  id *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = objc_opt_class(self);
  if (v7 == objc_opt_class(v6))
  {
    v20 = a4;
    if (a4)
      v9 = objc_alloc_init((Class)NSMutableSet);
    else
      v9 = 0;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = objc_msgSend((id)objc_opt_class(self), "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalState valueForKey:](self, "valueForKey:", v16));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", v16));
          if (!-[MapsExternalState _isValue:equalTo:](self, "_isValue:equalTo:", v17, v18))
          {
            if (!v9)
            {

              v8 = 0;
              goto LABEL_22;
            }
            objc_msgSend(v9, "addObject:", v16);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }

    if (v20)
      *v20 = objc_msgSend(v9, "copy");
    if (v9)
      v8 = objc_msgSend(v9, "count") == 0;
    else
      v8 = 1;
LABEL_22:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = -[MapsExternalState isEqualToState:](self, "isEqualToState:", v4);
  else
    v6 = 0;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  _QWORD v18[4];
  NSMutableDictionary *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = objc_opt_class(self);
  v5 = (void *)objc_opt_new(v4);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend((id)objc_opt_class(self), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalState valueForKey:](self, "valueForKey:", v12));
        v14 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = objc_opt_new(NSMutableDictionary);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1009299F4;
          v18[3] = &unk_1011BA738;
          v19 = v15;
          v16 = v15;
          objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
          objc_msgSend(v5, "setValue:forKey:", v16, v12);

        }
        else
        {
          objc_msgSend(v5, "setValue:forKey:", v13, v12);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)descriptionForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalState valueForKey:](self, "valueForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v4));

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v20.receiver = self;
  v20.super_class = (Class)MapsExternalState;
  v3 = -[MapsExternalState description](&v20, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", (char *)objc_msgSend(v4, "length") - 1));
  v6 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "appendFormat:", CFSTR(" hash=%lu"), -[MapsExternalState hash](self, "hash"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend((id)objc_opt_class(self), "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalState descriptionForKey:](self, "descriptionForKey:", v13));
        objc_msgSend(v6, "appendFormat:", CFSTR("\n    %@ = %@"), v13, v14, (_QWORD)v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (unint64_t)hashForKey:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalState valueForKey:](self, "valueForKey:", a3));
  v4 = objc_msgSend(v3, "hash");

  return (unint64_t)v4;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend((id)objc_opt_class(self), "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 ^= -[MapsExternalState hashForKey:](self, "hashForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end

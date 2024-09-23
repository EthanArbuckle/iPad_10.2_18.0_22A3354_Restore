@implementation NSManagedObject

- (BOOL)setDifferentValue:(id)a3 forKey:(id)a4 klass:(Class)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSManagedObject valueForKey:](self, "valueForKey:", v9));
  v11 = v10;
  if (v10 == v8 || (objc_msgSend(v10, "isEqual:", v8) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = BUDynamicCast(a5, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[NSManagedObject setValue:forKey:](self, "setValue:forKey:", v14, v9);

    v12 = 1;
  }

  return v12;
}

- (BOOL)setDifferentObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NSManagedObject valueForKey:](self, "valueForKey:", v7));
  if (v8 != v6)
    -[NSManagedObject setValue:forKey:](self, "setValue:forKey:", v6, v7);

  return v8 != v6;
}

- (BOOL)setDifferentString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  LOBYTE(self) = -[NSManagedObject setDifferentValue:forKey:klass:](self, "setDifferentValue:forKey:klass:", v7, v6, objc_opt_class(NSString));

  return (char)self;
}

- (BOOL)setDifferentNumber:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  LOBYTE(self) = -[NSManagedObject setDifferentValue:forKey:klass:](self, "setDifferentValue:forKey:klass:", v7, v6, objc_opt_class(NSNumber));

  return (char)self;
}

- (BOOL)setDifferentDate:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  LOBYTE(self) = -[NSManagedObject setDifferentValue:forKey:klass:](self, "setDifferentValue:forKey:klass:", v7, v6, objc_opt_class(NSDate));

  return (char)self;
}

- (id)propertiesForKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObject valueForKey:](self, "valueForKey:", v11, (_QWORD)v14));
        if (v12)
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

@end

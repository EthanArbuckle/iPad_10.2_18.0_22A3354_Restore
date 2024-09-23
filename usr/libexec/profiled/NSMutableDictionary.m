@implementation NSMutableDictionary

- (void)MCDeepCopyEntriesFromDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v9));
        v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v9));
        v12 = (void *)v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (!v13)
        {
          v14 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
          {
            v15 = objc_opt_class(NSMutableDictionary);
            if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
            {
              objc_msgSend(v12, "MCDeepCopyEntriesFromDictionary:", v10);
              goto LABEL_18;
            }
          }
        }
        v16 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v10, v16) & 1) != 0)
        {
          v17 = objc_msgSend(v10, "MCMutableDeepCopy");
        }
        else
        {
          if (!v10)
            goto LABEL_18;
          v17 = objc_msgSend(v10, "copy");
        }
        v18 = v17;
        -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", v17, v9);

LABEL_18:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

}

- (void)MCSetObjectIfNotNil:(id)a3 forKey:(id)a4
{
  if (a3)
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
}

- (void)MCDeepCopyMissingEntriesFromDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  char isKindOfClass;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v9));
        if (v11)
          v12 = v10 == 0;
        else
          v12 = 1;
        if (v12)
        {
          if (v10)
            goto LABEL_20;
          v13 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          {
            v14 = objc_msgSend(v11, "MCMutableDeepCopy");
          }
          else
          {
            if (!v11)
              goto LABEL_20;
            v14 = objc_msgSend(v11, "copy");
          }
          v18 = v14;
          -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", v14, v9);

        }
        else
        {
          v15 = objc_opt_class(NSDictionary);
          isKindOfClass = objc_opt_isKindOfClass(v11, v15);
          if ((isKindOfClass & 1) != 0)
          {
            v17 = objc_opt_class(NSMutableDictionary);
            if ((objc_opt_isKindOfClass(v10, v17) & 1) != 0)
              objc_msgSend(v10, "MCDeepCopyMissingEntriesFromDictionary:", v11);
          }
        }
LABEL_20:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

}

- (void)MCSetBoolRestriction:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultRestrictions"));

  v9 = MCRestrictedBoolKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", MCRestrictedBoolKey));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v6));
  v12 = MCRestrictedBoolPreferenceKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MCRestrictedBoolPreferenceKey));

  if (!v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is not a BOOL restriction."), v6));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v18, 0));

    objc_exception_throw(v19);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v9));
  v15 = objc_msgSend(v14, "mutableCopy");

  if (!v15)
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v20[0] = v12;
  v20[1] = MCRestrictedBoolValueKey;
  v21[0] = v13;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v21[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v15, v9);
}

- (void)MCDeleteBoolRestriction:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = MCRestrictedBoolKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCRestrictedBoolKey));
  v6 = objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    objc_msgSend(v6, "removeObjectForKey:", v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, v4);
  }

}

- (void)MCSetValueRestriction:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultRestrictions"));

    v10 = MCRestrictedValueKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", MCRestrictedValueKey));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));
    v13 = MCRestrictedValuePreferSmallerValuesKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", MCRestrictedValuePreferSmallerValuesKey));

    if (!v14)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is not a value restriction."), v6));
      v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v21, 0));

      objc_exception_throw(v22);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    v16 = objc_msgSend(v15, "mutableCopy");

    if (!v16)
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v23[0] = v13;
    v23[1] = MCRestrictedValueValueKey;
    v24[0] = v14;
    v24[1] = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v6);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v16, v10);
  }
  else
  {
    v18 = MCRestrictedValueKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCRestrictedValueKey));
    v20 = objc_msgSend(v19, "mutableCopy");

    if (v20)
    {
      objc_msgSend(v20, "removeObjectForKey:", v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v20, v18);
    }

  }
}

- (void)MCSetIntersectionRestriction:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultRestrictions"));

    v10 = MCIntersectionKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", MCIntersectionKey));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));

    if (!v12)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is not an intersection restriction."), v6));
      v20 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v19, 0));

      objc_exception_throw(v20);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    v14 = objc_msgSend(v13, "mutableCopy");

    if (!v14)
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v21 = MCIntersectionValuesKey;
    v22 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v6);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v10);
  }
  else
  {
    v16 = MCIntersectionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCIntersectionKey));
    v18 = objc_msgSend(v17, "mutableCopy");

    if (v18)
    {
      objc_msgSend(v18, "removeObjectForKey:", v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v16);
    }

  }
}

- (void)MCSetUnionRestriction:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultRestrictions"));

    v10 = MCUnionKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", MCUnionKey));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));

    if (!v12)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is not an union restriction."), v6));
      v20 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v19, 0));

      objc_exception_throw(v20);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    v14 = objc_msgSend(v13, "mutableCopy");

    if (!v14)
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v21 = MCUnionValuesKey;
    v22 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v6);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v10);
  }
  else
  {
    v16 = MCUnionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCUnionKey));
    v18 = objc_msgSend(v17, "mutableCopy");

    if (v18)
    {
      objc_msgSend(v18, "removeObjectForKey:", v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v16);
    }

  }
}

- (void)MCSetIntersectionSetting:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultSettings"));

    v10 = MCIntersectionKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", MCIntersectionKey));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));

    if (!v12)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is not an intersection setting."), v6));
      v20 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v19, 0));

      objc_exception_throw(v20);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    v14 = objc_msgSend(v13, "mutableCopy");

    if (!v14)
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v21 = MCIntersectionValuesKey;
    v22 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v6);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v10);
  }
  else
  {
    v16 = MCIntersectionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCIntersectionKey));
    v18 = objc_msgSend(v17, "mutableCopy");

    if (v18)
    {
      objc_msgSend(v18, "removeObjectForKey:", v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v16);
    }

  }
}

- (void)MCSetUnionSetting:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultSettings"));

    v10 = MCUnionKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", MCUnionKey));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));

    if (!v12)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is not an union setting."), v6));
      v20 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v19, 0));

      objc_exception_throw(v20);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    v14 = objc_msgSend(v13, "mutableCopy");

    if (!v14)
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v21 = MCUnionValuesKey;
    v22 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v6);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v10);
  }
  else
  {
    v16 = MCUnionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCUnionKey));
    v18 = objc_msgSend(v17, "mutableCopy");

    if (v18)
    {
      objc_msgSend(v18, "removeObjectForKey:", v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v16);
    }

  }
}

- (void)MCFilterRestrictionPayloadKeys:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100018684;
    v7[3] = &unk_1000E34D8;
    v7[4] = self;
    v8 = v4;
    v6 = objc_retainBlock(v7);
    ((void (*)(_QWORD *, _QWORD))v6[2])(v6, MCRestrictedBoolKey);
    ((void (*)(_QWORD *, _QWORD))v6[2])(v6, MCRestrictedValueKey);
    ((void (*)(_QWORD *, _QWORD))v6[2])(v6, MCIntersectionKey);
    ((void (*)(_QWORD *, _QWORD))v6[2])(v6, MCUnionKey);

  }
}

- (void)MCFixUpRestrictionsDictionaryForMDMReporting
{
  NSMutableDictionary *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  BOOL v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  uint64_t v41;
  id v42;
  NSMutableDictionary *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v2 = self;
  v3 = MCRestrictedValueKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", MCRestrictedValueKey));
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    v7 = MCFeaturePasscodeLockGraceTime;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", MCFeaturePasscodeLockGraceTime));
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "mutableCopy");
      v11 = MCRestrictedValueValueKey;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", MCRestrictedValueValueKey));
      v13 = v12;
      if (v12)
      {
        v14 = v2;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (uint64_t)objc_msgSend(v12, "longValue") / 60));
        objc_msgSend(v10, "setObject:forKey:", v15, v11);

        v2 = v14;
      }
      objc_msgSend(v6, "setObject:forKey:", v10, v7);

    }
    v16 = MCFeatureAutoLockTime;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", MCFeatureAutoLockTime));
    v18 = v17;
    if (v17)
    {
      v19 = objc_msgSend(v17, "mutableCopy");
      v20 = MCRestrictedValueValueKey;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForKey:", MCRestrictedValueValueKey));
      v22 = v21;
      if (v21)
      {
        v23 = v2;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (uint64_t)objc_msgSend(v21, "longValue") / 60));
        objc_msgSend(v19, "setObject:forKey:", v24, v20);

        v2 = v23;
      }
      objc_msgSend(v6, "setObject:forKey:", v19, v16);

    }
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v6, v3);

  }
  v25 = MCIntersectionKey;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2, "objectForKey:", MCIntersectionKey));
  if (v26)
  {
    v41 = v25;
    v42 = v26;
    v43 = v2;
    v44 = v5;
    v27 = objc_msgSend(v26, "mutableCopy");
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionUtilities intersectionFeaturesWithPayloadRestictionKeyAlias](MCRestrictionUtilities, "intersectionFeaturesWithPayloadRestictionKeyAlias"));
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v53;
      v45 = *(_QWORD *)v53;
      do
      {
        v31 = 0;
        v46 = v29;
        do
        {
          if (*(_QWORD *)v53 != v30)
            objc_enumerationMutation(obj);
          v32 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionUtilities intersectionPayloadRestrictionKeysForFeature:](MCRestrictionUtilities, "intersectionPayloadRestrictionKeysForFeature:", v32));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", v32));
          if (v34)
            v35 = v33 == 0;
          else
            v35 = 1;
          if (!v35)
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v36 = v33;
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v49;
              do
              {
                for (i = 0; i != v38; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v49 != v39)
                    objc_enumerationMutation(v36);
                  objc_msgSend(v27, "setObject:forKey:", v34, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i));
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
              }
              while (v38);
            }

            objc_msgSend(v27, "removeObjectForKey:", v32);
            v30 = v45;
            v29 = v46;
          }

          v31 = (char *)v31 + 1;
        }
        while (v31 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v29);
    }

    -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v27, v41);
    v5 = v44;
    v26 = v42;
  }

}

- (void)MCSanitizeRestrictions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *k;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *m;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultRestrictions"));

  v5 = MCRestrictedBoolKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCRestrictedBoolKey));
  v7 = objc_msgSend(v6, "mutableCopy");
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        if ((-[NSMutableDictionary MCValidateBoolRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateBoolRestriction:inRestrictions:defaultRestrictions:", v13, v8, v4) & 1) == 0)objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v10);
  }
  v47 = v8;

  v14 = objc_msgSend(v7, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v5);

  v15 = MCRestrictedValueKey;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCRestrictedValueKey));
  v17 = objc_msgSend(v16, "mutableCopy");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v58 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
        if ((-[NSMutableDictionary MCValidateValueRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateValueRestriction:inRestrictions:defaultRestrictions:", v23, v18, v4) & 1) == 0)objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v20);
  }
  v48 = v7;

  v46 = v17;
  v24 = objc_msgSend(v17, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v24, v15);

  v25 = MCIntersectionKey;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCIntersectionKey));
  v27 = objc_msgSend(v26, "mutableCopy");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v28 = v26;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(_QWORD *)v54 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)k);
        if ((-[NSMutableDictionary MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:", v33, v28, v4) & 1) == 0)objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, v33);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v30);
  }

  v45 = v27;
  v34 = objc_msgSend(v27, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v34, v25);

  v44 = MCUnionKey;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:"));
  v36 = objc_msgSend(v35, "mutableCopy");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v37 = v35;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v50;
    do
    {
      for (m = 0; m != v39; m = (char *)m + 1)
      {
        if (*(_QWORD *)v50 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)m);
        if ((-[NSMutableDictionary MCValidateUnionRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:", v42, v37, v4) & 1) == 0)objc_msgSend(v36, "setObject:forKeyedSubscript:", 0, v42);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    }
    while (v39);
  }

  v43 = objc_msgSend(v36, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v43, v44);

}

@end

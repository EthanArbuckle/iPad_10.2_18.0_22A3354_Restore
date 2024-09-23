@implementation NSDictionary

- (BOOL)fp_isContainer
{
  return 1;
}

- (id)fp_mergeAuxDatum:(id)a3 withDatum:(id)a4 forceAggregate:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  unsigned int v9;
  FPAuxData *v10;
  FPAuxData *v11;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = objc_msgSend(v7, "fp_isContainer");
    if (v9 != objc_msgSend(v8, "fp_isContainer"))
      __assert_rtn("-[NSDictionary(FPAuxData) fp_mergeAuxDatum:withDatum:forceAggregate:]", "FPAuxData.m", 18, "!datum2 || datum1.fp_isContainer == datum2.fp_isContainer");
  }
  if (objc_msgSend(v7, "fp_isContainer"))
  {
    v10 = (FPAuxData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fp_mergeWithData:forceAggregate:", v8, v5));
  }
  else
  {
    if (!v5 && !objc_msgSend(v7, "shouldAggregate"))
    {
      v11 = 0;
      goto LABEL_11;
    }
    if (v8)
      v10 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", (char *)objc_msgSend(v7, "value") + (_QWORD)objc_msgSend(v8, "value"), objc_msgSend(v7, "shouldAggregate"));
    else
      v10 = (FPAuxData *)v7;
  }
  v11 = v10;
LABEL_11:

  return v11;
}

- (id)fp_mergeWithData:(id)a3
{
  return -[NSDictionary fp_mergeWithData:forceAggregate:](self, "fp_mergeWithData:forceAggregate:", a3, 0);
}

- (id)fp_mergeWithData:(id)a3 forceAggregate:(BOOL)a4
{
  _BOOL8 v4;
  NSDictionary *v6;
  void *v7;
  NSDictionary *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v4 = a4;
  v27 = a3;
  if (v27 || !v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = self;
    v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v13));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v13));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary fp_mergeAuxDatum:withDatum:forceAggregate:](v8, "fp_mergeAuxDatum:withDatum:forceAggregate:", v14, v15, v4));
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v13);

        }
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v10);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v27;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v22));

          if (!v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v22));
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary fp_mergeAuxDatum:withDatum:forceAggregate:](v8, "fp_mergeAuxDatum:withDatum:forceAggregate:", v24, 0, v4));
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v22);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v7, "count"))
      v6 = v7;
    else
      v6 = 0;

  }
  else
  {
    v6 = self;
  }

  return v6;
}

- (id)fp_jsonRepresentation
{
  void *v3;
  NSDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v9, (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fp_jsonRepresentation"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

@end

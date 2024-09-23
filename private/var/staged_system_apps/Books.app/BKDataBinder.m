@implementation BKDataBinder

+ (id)bindings
{
  if (qword_1009F50C8 != -1)
    dispatch_once(&qword_1009F50C8, &stru_1008EBF00);
  return (id)qword_1009F50C0;
}

+ (void)unbind:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKDataBinder bindings](BKDataBinder, "bindings"));
  while (1)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[BKDataBinder findBindingFrom:key:to:key:](BKDataBinder, "findBindingFrom:key:to:key:", v3, 0, 0, 0));
    v6 = objc_claimAutoreleasedReturnValue(+[BKDataBinder findBindingFrom:key:to:key:](BKDataBinder, "findBindingFrom:key:to:key:", 0, 0, v3, 0));
    if (!(v5 | v6))
      break;
    v7 = (void *)v6;
    if (v5)
    {
      objc_msgSend((id)v5, "unbind");
      objc_msgSend(v4, "removeObject:", v5);
    }
    if (v7)
    {
      objc_msgSend(v7, "unbind");
      objc_msgSend(v4, "removeObject:", v7);
    }

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "srcObj"));
        if (v15)
        {
          v16 = (void *)v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dstObj"));

          if (v17)
            continue;
        }
        objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v9, "removeObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j), (_QWORD)v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v20);
  }

}

+ (void)bind:(id)a3 key:(id)a4 to:(id)a5 key:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BKDataBinding *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKDataBinder findBindingFrom:key:to:key:](BKDataBinder, "findBindingFrom:key:to:key:", v15, v9, v10, v11));

  if (!v12)
  {
    v13 = -[BKDataBinding initWithBinding:key:to:key:transmitInitialValue:]([BKDataBinding alloc], "initWithBinding:key:to:key:transmitInitialValue:", v15, v9, v10, v11, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKDataBinder bindings](BKDataBinder, "bindings"));
    objc_msgSend(v14, "addObject:", v13);

  }
}

+ (void)unbind:(id)a3 key:(id)a4 from:(id)a5 key:(id)a6
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKDataBinder findBindingFrom:key:to:key:](BKDataBinder, "findBindingFrom:key:to:key:", a3, a4, a5, a6));
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "unbind");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKDataBinder bindings](BKDataBinder, "bindings"));
    objc_msgSend(v7, "removeObject:", v8);

    v6 = v8;
  }

}

+ (void)bind:(id)a3 key:(id)a4 between:(id)a5 key:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "bind:key:to:key:", v13, v12, v11, v10);
  objc_msgSend(a1, "bind:key:to:key:", v11, v10, v13, v12);

}

+ (id)findBindingFrom:(id)a3 key:(id)a4 to:(id)a5 key:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  void *v24;
  id v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26 = a6;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[BKDataBinder bindings](BKDataBinder, "bindings"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v12)
    goto LABEL_34;
  v25 = v10;
  v13 = *(_QWORD *)v29;
  v14 = v10;
  while (2)
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v29 != v13)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
      if (v9)
      {
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "srcObj"));
        a6 = v9;
        if (v17 != v9)
        {
          a6 = v17;
          v18 = a5;
          goto LABEL_12;
        }
      }
      if (v11)
      {
        v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dstObj"));
        a5 = v11;
        if (v19 != v11)
        {
          v18 = v19;

          if (!v9)
          {
LABEL_13:
            a5 = v18;
            continue;
          }
LABEL_12:

          goto LABEL_13;
        }
      }
      if (v14)
      {
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "srcKey"));
        if (v20 != v14)
        {
          v24 = v20;

          v21 = 0;
          goto LABEL_24;
        }
        v24 = v14;
        if (!v26)
        {
          v21 = 1;
          v24 = v14;
LABEL_23:

          goto LABEL_24;
        }
      }
      else if (!v26)
      {
        v21 = 1;
        goto LABEL_24;
      }
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dstKey", v24));
      v21 = v22 == v26;

      if (v14)
        goto LABEL_23;
LABEL_24:
      if (v11)

      if (v9)
      if (v21)
      {
        v12 = v16;
        goto LABEL_33;
      }
    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
      continue;
    break;
  }
LABEL_33:
  v10 = v25;
LABEL_34:

  return v12;
}

@end

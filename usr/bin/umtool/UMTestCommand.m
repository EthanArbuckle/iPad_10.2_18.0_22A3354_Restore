@implementation UMTestCommand

+ (NSString)name
{
  return 0;
}

+ (NSString)description
{
  return 0;
}

+ (NSArray)examples
{
  return 0;
}

+ (id)_spaceForDepth:(unint64_t)a3
{
  void *i;

  for (i = (void *)objc_opt_new(NSMutableString, a2); a3; --a3)
    objc_msgSend(i, "appendString:", CFSTR("\t"));
  return i;
}

+ (id)helpDetailsForDepth:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v5 = (void *)objc_opt_new(NSMutableString, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_spaceForDepth:", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_spaceForDepth:", a3 + 1));
    v9 = a3 + 2;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_spaceForDepth:", a3 + 2));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
    objc_msgSend(v5, "appendFormat:", CFSTR("%@%@%@"), v7, v11, CFSTR("\n"));

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
    v13 = (void *)v12;
    if (v12)
      objc_msgSend(v5, "appendFormat:", CFSTR("%@Description: %@%@"), v8, v12, CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "examples"));
    v40 = v14;
    if (v14)
    {
      v15 = v14;
      if (objc_msgSend(v14, "count"))
      {
        v32 = v13;
        v34 = v8;
        v36 = v7;
        v38 = v6;
        objc_msgSend(v5, "appendFormat:", CFSTR("%@Examples:%@"), v8, CFSTR("\n"));
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(_QWORD *)v46 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(v5, "appendFormat:", CFSTR("%@%@%@"), v10, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), CFSTR("\n"));
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          }
          while (v18);
        }

        v7 = v36;
        v6 = v38;
        v13 = v32;
        v8 = v34;
      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subcommands"));
    v22 = v21;
    if (v21 && objc_msgSend(v21, "count"))
    {
      v33 = v13;
      v35 = v8;
      v37 = v7;
      v39 = v6;
      objc_msgSend(v5, "appendFormat:", CFSTR("%@%@Subcommands:%@"), CFSTR("\n"), v8, CFSTR("\n"));
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v31 = v22;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(_QWORD *)v42 != v26)
              objc_enumerationMutation(v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), "helpDetailsForDepth:", v9));
            objc_msgSend(v5, "appendFormat:", CFSTR("%@%@"), CFSTR("\n"), v28);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        }
        while (v25);
      }

      v7 = v37;
      v6 = v39;
      v13 = v33;
      v8 = v35;
      v22 = v31;
    }
    v29 = objc_msgSend(v5, "copy");

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (NSArray)subcommands
{
  return 0;
}

+ (BOOL)executeWithOutError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subcommands", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v13 = objc_msgSend(v12, "isEqualToString:", v5);

      if ((v13 & 1) != 0)
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = objc_msgSend(v11, "executeWithOutError:", a3);

    if ((v14 & 1) == 0)
      goto LABEL_12;
    v15 = 1;
  }
  else
  {
LABEL_9:

LABEL_12:
    +[UMTestArguments goToPreviousArgument](UMTestArguments, "goToPreviousArgument");
    v15 = 0;
  }

  return v15;
}

@end

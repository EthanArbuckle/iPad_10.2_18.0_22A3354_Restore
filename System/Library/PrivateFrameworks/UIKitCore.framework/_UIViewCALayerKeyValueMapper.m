@implementation _UIViewCALayerKeyValueMapper

+ (id)CALayerValueForUIViewValue:(id)a3 forUIViewKey:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (qword_1ECD82580 != -1)
    dispatch_once(&qword_1ECD82580, &__block_literal_global_24_8);
  objc_msgSend((id)qword_1ECD82578, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v5;
  }
  v10 = v9;

  return v10;
}

+ (id)CALayerKeyPathForUIViewKeyPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  if (v3)
  {
    if (qword_1ECD82570 != -1)
      dispatch_once(&qword_1ECD82570, &__block_literal_global_665);
    objc_msgSend((id)_MergedGlobals_1328, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)qword_1ECD82568;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v3;
      v10 = v9;
      if (v8)
      {
        if (objc_msgSend(v5, "count") != 1)
        {
          objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@"), v8, v14);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
        v11 = v8;
      }
      else
      {
        v4 = v9;
        if (!objc_msgSend(v9, "hasPrefix:", CFSTR("layer.")))
        {
LABEL_14:
          objc_msgSend((id)_MergedGlobals_1328, "setObject:forKeyedSubscript:", v4, v10);

          goto LABEL_15;
        }
        objc_msgSend(v10, "substringFromIndex:", 6);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v4 = v11;
      v12 = v10;
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_15:

  return v4;
}

@end

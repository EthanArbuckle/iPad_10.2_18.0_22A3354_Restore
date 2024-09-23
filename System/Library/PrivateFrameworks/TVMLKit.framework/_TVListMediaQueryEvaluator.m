@implementation _TVListMediaQueryEvaluator

- (BOOL)evaluteForMediaType:(id)a3 featureType:(id)a4 value:(id)a5 result:(BOOL *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  if (IsTemplateMediaType(a3) && objc_msgSend(v9, "isEqualToString:", CFSTR("-tv-header")))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[TVMediaQueryEvaluator templateElement](self, "templateElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "children");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "tv_elementType") == 22)
          {
            v12 = v15;
            goto LABEL_14;
          }
        }
        v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_14:

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v12, "children", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          if (objc_msgSend(v22, "tv_elementType") == 58 || objc_msgSend(v22, "tv_elementType") == 15)
          {
            *a6 = 1;
            goto LABEL_25;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_25:

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end

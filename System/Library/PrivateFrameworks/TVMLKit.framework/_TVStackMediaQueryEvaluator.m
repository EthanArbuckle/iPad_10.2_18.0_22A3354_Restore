@implementation _TVStackMediaQueryEvaluator

- (BOOL)evaluteForMediaType:(id)a3 featureType:(id)a4 value:(id)a5 result:(BOOL *)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  if (IsTemplateMediaType(a3) && objc_msgSend(v9, "isEqualToString:", CFSTR("-tv-banner")))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[TVMediaQueryEvaluator templateElement](self, "templateElement", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unfilteredChildren");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "tv_elementType");
          if (v16 != 4)
          {
            if (v16 != 10)
              *a6 = 1;
            goto LABEL_15;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_15:

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end

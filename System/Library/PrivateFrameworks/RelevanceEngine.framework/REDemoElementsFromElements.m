@implementation REDemoElementsFromElements

REElement *__REDemoElementsFromElements_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  REElement *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  REElement *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v2, "relevanceProviders", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v4, "interval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    REAbsoluteRelevanceProviderForDate(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [REElement alloc];
    objc_msgSend(v2, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "content");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[REElement initWithIdentifier:content:action:relevanceProviders:privacyBehavior:](v11, "initWithIdentifier:content:action:relevanceProviders:privacyBehavior:", v12, v13, v14, v15, objc_msgSend(v2, "privacyBehavior"));

  }
  else
  {
    v16 = (REElement *)v2;
  }

  return v16;
}

@end

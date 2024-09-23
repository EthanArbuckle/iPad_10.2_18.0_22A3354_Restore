@implementation SXLegacySupport

+ (id)deprecatedComponentForType:(void *)a3 andVersion:
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  +[SXLegacySupport deprecatedComponentsForVersion:](v6, v5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        -[SXFullscreenCaption text]((uint64_t)v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4, (_QWORD)v15);

        if (v13)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)deprecatedComponentsForVersion:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXLegacySupport deprecatedComponents]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__SXLegacySupport_deprecatedComponentsForVersion___block_invoke;
  v10[3] = &unk_24D68C0D0;
  v11 = v2;
  v5 = v3;
  v12 = v5;
  v6 = v2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = v12;
  v8 = v5;

  return v8;
}

+ (id)deprecatedComponents
{
  objc_opt_self();
  if (deprecatedComponents_onceToken != -1)
    dispatch_once(&deprecatedComponents_onceToken, &__block_literal_global_72);
  return (id)deprecatedComponents_deprecatedComponents;
}

void __50__SXLegacySupport_deprecatedComponentsForVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a2, "compare:options:", *(_QWORD *)(a1 + 32), 64) == 1)
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);

}

void __39__SXLegacySupport_deprecatedComponents__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("1.2");
  v0 = objc_opt_class();
  +[SXDeprecatedComponent deprecatedComponentWithType:withReplacementClassificationClass:]((uint64_t)SXDeprecatedComponent, CFSTR("twitter_embed"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  v2 = objc_opt_class();
  +[SXDeprecatedComponent deprecatedComponentWithType:withReplacementClassificationClass:]((uint64_t)SXDeprecatedComponent, CFSTR("instagram_embed"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("1.11");
  v13[0] = v4;
  v5 = objc_opt_class();
  +[SXDeprecatedComponent deprecatedComponentWithType:withReplacementClassificationClass:]((uint64_t)SXDeprecatedComponent, CFSTR("subscription_button"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)deprecatedComponents_deprecatedComponents;
  deprecatedComponents_deprecatedComponents = v8;

}

@end

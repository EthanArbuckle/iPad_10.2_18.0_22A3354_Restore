@implementation UAFTrialConversions

+ (id)assetTypeFromNamespaceName:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = &stru_24F1F9848;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("NL")))
        {
          -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v9);
          v10 = v7;
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v9, "capitalizedString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v10);
          v11 = objc_claimAutoreleasedReturnValue();

          v7 = (__CFString *)v11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_24F1F9848;
  }

  return v7;
}

+ (id)namespaceNameFromAssetType:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= objc_msgSend(CFSTR("com.apple.MobileAsset.Trial.Siri."), "length")
    && (objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.MobileAsset.Trial.Siri."), "length")),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (__CFString *)v5;
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v6, "length"))
    {
      v8 = &stru_24F1F9848;
      v9 = v6;
      while (1)
      {
        v10 = -[__CFString rangeOfCharacterFromSet:](v9, "rangeOfCharacterFromSet:", v7);
        if (!v10)
          break;
        v11 = v10;
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[__CFString substringToIndex:](v9, "substringToIndex:", v10);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString substringFromIndex:](v9, "substringFromIndex:", v11);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

          -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v13);
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
          v12 = (__CFString *)v15;
          v9 = v13;
          goto LABEL_14;
        }
        -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR("%@"), v9);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v6 = &stru_24F1F9848;
LABEL_14:

        v8 = v12;
        v9 = v6;
        if (!-[__CFString length](v6, "length"))
          goto LABEL_18;
      }
      -[__CFString substringToIndex:](v9, "substringToIndex:", 1);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString substringFromIndex:](v9, "substringFromIndex:", 1);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("N"))
        && -[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("L")))
      {

        -[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
        v14 = objc_claimAutoreleasedReturnValue();

        v6 = (__CFString *)v14;
        v13 = CFSTR("NL");
      }
      -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR("_%@"), v13);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v12 = &stru_24F1F9848;
LABEL_18:
    if (-[__CFString hasPrefix:](v12, "hasPrefix:", CFSTR("_")))
    {
      -[__CFString substringFromIndex:](v12, "substringFromIndex:", 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v17;
    }
    -[__CFString uppercaseString](v12, "uppercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)generateEntitledTrialNamespaces
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v2 = objc_msgSend(&unk_24F202EF0, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v2)
  {
    v4 = v2;
    v5 = 0;
    v6 = *(_QWORD *)v30;
    v7 = 0x24F1F6000uLL;
    *(_QWORD *)&v3 = 136315650;
    v23 = v3;
    while (1)
    {
      v8 = 0;
      v24 = v4;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(&unk_24F202EF0);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8);
        objc_msgSend(*(id *)(v7 + 1424), "valueForEntitlement:", v9, v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v5)
            v5 = (void *)objc_opt_new();
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v11 = v10;
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
          if (v12)
          {
            v13 = v12;
            v14 = v6;
            v15 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v26 != v15)
                  objc_enumerationMutation(v11);
                v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
                v18 = objc_msgSend(v17, "intValue");
                if ((_DWORD)v18)
                {
                  objc_msgSend(MEMORY[0x24BEBA990], "namespaceNameFromId:", v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v19);

                }
                else
                {
                  objc_msgSend(v5, "addObject:", v17);
                }
              }
              v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
            }
            while (v13);
            v6 = v14;
            v7 = 0x24F1F6000;
            v4 = v24;
          }
        }
        else
        {
          if (!v10)
            goto LABEL_24;
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v20 = (void *)objc_opt_class();
            *(_DWORD *)buf = v23;
            v34 = "+[UAFTrialConversions generateEntitledTrialNamespaces]";
            v35 = 2114;
            v36 = v9;
            v37 = 2112;
            v38 = v20;
            v21 = v20;
            _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, "%s %{public}@ is unexpected type: %@", buf, 0x20u);

          }
        }

LABEL_24:
        ++v8;
      }
      while (v8 != v4);
      v4 = objc_msgSend(&unk_24F202EF0, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      if (!v4)
        return v5;
    }
  }
  v5 = 0;
  return v5;
}

+ (id)entitledTrialNamespaceNames
{
  if (qword_2540B1C78 != -1)
    dispatch_once(&qword_2540B1C78, &__block_literal_global_5);
  return (id)_MergedGlobals_3;
}

void __50__UAFTrialConversions_entitledTrialNamespaceNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UAFTrialConversions generateEntitledTrialNamespaces](UAFTrialConversions, "generateEntitledTrialNamespaces");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = v0;

}

@end

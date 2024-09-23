@implementation NSPropertyListSerialization(TSUtility)

+ (id)tsu_propertyListWithContentsOfURL:()TSUtility options:error:
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithURL:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "open");
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithStream:options:format:error:", v8, a4, 0, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "close");
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_IOErrorWithCode:", 0);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)tsu_processLocalizedPropertyList:()TSUtility
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "objectForKey:", CFSTR("_LOCALIZABLE_"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("_LOCALIZABLE_"));
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __75__NSPropertyListSerialization_TSUtility__tsu_processLocalizedPropertyList___block_invoke;
      v21 = &__block_descriptor_40_e15_v32__0_8_16_B24l;
      v22 = a1;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v18);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSPropertyListSerialization(TSUtility) tsu_processLocalizedPropertyList:]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSPropertyListSerialization_TSUtility.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 52, CFSTR("Expected a dictionary as a child of %@"), CFSTR("_LOCALIZABLE_"));

      }
      objc_msgSend(v5, "addEntriesFromDictionary:", v6);
    }
    else
    {
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __75__NSPropertyListSerialization_TSUtility__tsu_processLocalizedPropertyList___block_invoke;
      v21 = &__block_descriptor_40_e15_v32__0_8_16_B24l;
      v22 = a1;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v18);
    }

LABEL_17:
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v5);
          objc_msgSend(a1, "tsu_processLocalizedPropertyList:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
      }
      while (v11);
    }
    goto LABEL_17;
  }
LABEL_18:

}

+ (id)tsu_localizedPropertyListWithContentsOfURL:()TSUtility options:error:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSPropertyListSerialization(TSUtility) tsu_localizedPropertyListWithContentsOfURL:options:error:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSPropertyListSerialization_TSUtility.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 73, CFSTR("Need mutable containers to process a localizable property list"));

  }
  objc_msgSend(a1, "tsu_propertyListWithContentsOfURL:options:error:", v8, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tsu_processLocalizedPropertyList:", v12);

  return v12;
}

@end

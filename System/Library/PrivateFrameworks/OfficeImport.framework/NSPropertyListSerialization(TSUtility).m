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
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __75__NSPropertyListSerialization_TSUtility__tsu_processLocalizedPropertyList___block_invoke;
      v20 = &__block_descriptor_40_e15_v32__0_8_16_B24l;
      v21 = a1;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSPropertyListSerialization(TSUtility) tsu_processLocalizedPropertyList:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSPropertyListSerialization_TSUtility.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 47, 0, "Expected a dictionary as a child of %{public}@", CFSTR("_LOCALIZABLE_"));

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      objc_msgSend(v5, "addEntriesFromDictionary:", v6);
    }
    else
    {
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __75__NSPropertyListSerialization_TSUtility__tsu_processLocalizedPropertyList___block_invoke;
      v20 = &__block_descriptor_40_e15_v32__0_8_16_B24l;
      v21 = a1;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v17);
    }

LABEL_17:
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v5);
          objc_msgSend(a1, "tsu_processLocalizedPropertyList:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
      }
      while (v10);
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

  v8 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSPropertyListSerialization(TSUtility) tsu_localizedPropertyListWithContentsOfURL:options:error:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSPropertyListSerialization_TSUtility.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 65, 0, "Need mutable containers to process a localizable property list");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(a1, "tsu_propertyListWithContentsOfURL:options:error:", v8, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tsu_processLocalizedPropertyList:", v11);

  return v11;
}

@end

@implementation NSObject(TVMLKitAdditions)

- (BOOL)tv_superOfClass:()TVMLKitAdditions respondsToSelector:
{
  objc_class *i;
  objc_class *Superclass;

  for (i = (objc_class *)objc_opt_class(); i != a3; i = class_getSuperclass(i))
    ;
  Superclass = class_getSuperclass(a3);
  return class_getInstanceMethod(Superclass, a4) != 0;
}

- (id)tv_associatedIKViewElement
{
  return objc_getAssociatedObject(a1, "_TVObjectKeyViewElement");
}

- (void)tv_setAssociatedIKViewElement:()TVMLKitAdditions
{
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_setAssociatedObject(a1, "_TVObjectKeyViewElement", a3, (void *)0x301);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 && (isKindOfClass & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(a1, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "tv_setAssociatedIKViewElement:", 0);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

+ (id)tv_allowedLiteralJSONObjects
{
  _QWORD v1[5];

  v1[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = objc_opt_class();
  v1[1] = objc_opt_class();
  v1[2] = objc_opt_class();
  v1[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tv_JSCompatibleValue
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v3 = a1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "tv_JSCompatibleValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "tv_JSCompatibleValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            v12 = v10 == 0;
          else
            v12 = 1;
          if (!v12)
            objc_msgSend(v2, "setObject:forKey:", v10, v11);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v5);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEDCDF0], "tv_allowedLiteralJSONObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "containsObject:", objc_opt_class()) & 1) != 0)
      {

      }
      else
      {
        v19 = objc_msgSend(a1, "conformsToProtocol:", &unk_2557DFE18);

        if ((v19 & 1) == 0)
        {
          v2 = 0;
          return v2;
        }
      }
      return a1;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v3 = a1;
    v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "tv_JSCompatibleValue", (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v2, "addObject:", v17);

        }
        v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v14);
    }
  }

  return v2;
}

- (id)tv_toPropertiesJSDictionary
{
  void *v2;
  objc_class *v3;
  objc_property_t *v4;
  objc_property_t *v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  unsigned int outCount;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = class_copyPropertyList(v3, &outCount);
  if (outCount)
  {
    v5 = v4;
    for (i = 0; i < outCount; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", property_getName(v5[i]), 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "valueForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tv_JSCompatibleValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v2, "setObject:forKey:", v9, v7);

    }
  }
  return v2;
}

@end

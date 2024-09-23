@implementation NSXPCConnection(StatusKitAgent)

- (id)sk_stringArrayValueForEntitlement:()StatusKitAgent
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "valueForEntitlement:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v1;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v2, "addObject:", v8);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

- (uint64_t)sk_BOOLeanValueForEntitlement:()StatusKitAgent
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (id)sk_stringValueForEntitlement:()StatusKitAgent
{
  void *v1;
  id v2;

  objc_msgSend(a1, "valueForEntitlement:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

@end

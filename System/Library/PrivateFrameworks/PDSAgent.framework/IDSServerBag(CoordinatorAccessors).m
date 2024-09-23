@implementation IDSServerBag(CoordinatorAccessors)

- (uint64_t)topicAvoidsCoalescing:()CoordinatorAccessors
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "nonCoalescingTopicsFromBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)ttlFromBag
{
  uint64_t v3;
  void *v4;
  double v5;

  if (objc_msgSend(a1, "ttlFromDefault"))
    return objc_msgSend(a1, "ttlFromDefault");
  v3 = 1296000;
  objc_msgSend(a1, "objectForKey:", CFSTR("pds-batch-register-ttl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a1, "allRequiredBagTTLValuesPresent"))
      {
        objc_msgSend(v4, "doubleValue");
        v3 = (uint64_t)v5;
      }
    }
  }

  return v3;
}

- (uint64_t)ttlWindowFromBag
{
  uint64_t v3;
  void *v4;
  double v5;

  if (objc_msgSend(a1, "ttlWindowFromDefault"))
    return objc_msgSend(a1, "ttlWindowFromDefault");
  v3 = 86400;
  objc_msgSend(a1, "objectForKey:", CFSTR("pds-batch-heartbeat-window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a1, "allRequiredBagTTLValuesPresent"))
      {
        objc_msgSend(v4, "doubleValue");
        v3 = (uint64_t)v5;
      }
    }
  }

  return v3;
}

- (uint64_t)ttlGracePeriodFromBag
{
  uint64_t v3;
  void *v4;
  double v5;

  if (objc_msgSend(a1, "ttlGracePeriodFromDefault"))
    return objc_msgSend(a1, "ttlGracePeriodFromDefault");
  v3 = 432000;
  objc_msgSend(a1, "objectForKey:", CFSTR("pds-batch-heartbeat-before-ttl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a1, "allRequiredBagTTLValuesPresent"))
      {
        objc_msgSend(v4, "doubleValue");
        v3 = (uint64_t)v5;
      }
    }
  }

  return v3;
}

- (double)coalesceDelayFromBag
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "objectForKey:", CFSTR("pds-batch-coalescing-delay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 20.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a1, "allRequiredBagCoalescingValuesPresent"))
      {
        objc_msgSend(v2, "doubleValue");
        v3 = v4;
      }
    }
  }

  return v3;
}

- (double)coalescePeriodFromBag
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "objectForKey:", CFSTR("pds-batch-coalescing-period"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 30.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a1, "allRequiredBagCoalescingValuesPresent"))
      {
        objc_msgSend(v2, "doubleValue");
        v3 = v4;
      }
    }
  }

  return v3;
}

- (double)coalesceMaxPeriodFromBag
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("pds-batch-max-coalescing-period"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v1, "doubleValue");
    v3 = v2;
  }
  else
  {
    v3 = 120.0;
  }

  return v3;
}

- (double)messageTimeoutFromBag
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("pds-message-timeout"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 36000.0;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "doubleValue");
      v2 = v3;
    }
  }

  return v2;
}

- (uint64_t)bagKillSwitchActive
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("pds-kit-enabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue") ^ 1;
  else
    v2 = 0;

  return v2;
}

- (id)minEnabledVersion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("pds-min-enabled-version"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v1, "intValue"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &unk_24D4AF1A0;
  }

  return v2;
}

- (uint64_t)allRequiredBagCoalescingValuesPresent
{
  void *v2;
  uint64_t v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("pds-batch-max-coalescing-period");
  v5[1] = CFSTR("pds-batch-coalescing-delay");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_valuesDefinedAsNumbersInBagForKeys:", v2);

  return v3;
}

- (uint64_t)allRequiredBagTTLValuesPresent
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("pds-batch-register-ttl");
  v5[1] = CFSTR("pds-batch-heartbeat-window");
  v5[2] = CFSTR("pds-batch-heartbeat-before-ttl");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_valuesDefinedAsNumbersInBagForKeys:", v2);

  return v3;
}

- (id)nonCoalescingTopicsFromBag
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "objectForKey:", CFSTR("pds-batch-non-coalescing-topics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v2, "addObject:", v9, (_QWORD)v11);
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }

    }
  }

  return v2;
}

- (uint64_t)ttlFromDefault
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BE508E0], "sharedDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appValueForKey:", CFSTR("pds-ttl"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v1, "intValue"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
LABEL_7:
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (uint64_t)ttlWindowFromDefault
{
  return objc_msgSend(a1, "ttlFromDefault") / 10;
}

- (uint64_t)ttlGracePeriodFromDefault
{
  return objc_msgSend(a1, "ttlFromDefault") / 5;
}

- (uint64_t)_valuesDefinedAsNumbersInBagForKeys:()CoordinatorAccessors
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          v8 = 0;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  return v8 & 1;
}

@end

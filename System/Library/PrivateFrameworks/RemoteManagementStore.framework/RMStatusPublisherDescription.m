@implementation RMStatusPublisherDescription

+ (id)descriptionWithEventsDictionary:(id)a3
{
  void *v3;
  char isKindOfClass;
  RMStatusPublisherDescription *v5;
  void *v6;
  RMStatusPublisherDescription *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StatusPublisher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = [RMStatusPublisherDescription alloc];
  if ((isKindOfClass & 1) != 0)
    v6 = v3;
  else
    v6 = (void *)MEMORY[0x24BDBD1B8];
  v7 = -[RMStatusPublisherDescription initWithDictionary:](v5, "initWithDictionary:", v6);

  return v7;
}

+ (id)descriptionWithServiceDictionary:(id)a3
{
  void *v3;
  char isKindOfClass;
  RMStatusPublisherDescription *v5;
  void *v6;
  RMStatusPublisherDescription *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StatusPublisher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = [RMStatusPublisherDescription alloc];
  if ((isKindOfClass & 1) != 0)
    v6 = v3;
  else
    v6 = (void *)MEMORY[0x24BDBD1B8];
  v7 = -[RMStatusPublisherDescription initWithDictionary:](v5, "initWithDictionary:", v6);

  return v7;
}

- (RMStatusPublisherDescription)initWithDictionary:(id)a3
{
  id v4;
  RMStatusPublisherDescription *v5;
  RMStatusPublisherDescription *v6;
  NSDictionary *statusKeysByXPCEvent;
  NSSet *statusKeys;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RMStatusPublisherDescription;
  v5 = -[RMStatusPublisherDescription init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    statusKeysByXPCEvent = v5->_statusKeysByXPCEvent;
    v5->_statusKeysByXPCEvent = 0;

    statusKeys = v6->_statusKeys;
    v6->_statusKeys = 0;

    -[RMStatusPublisherDescription _loadDescription:](v6, "_loadDescription:", v4);
  }

  return v6;
}

- (void)_loadDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StatusEvents"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StatusKeysByNotification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StatusKeysWithoutNotification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[RMStatusPublisherDescription _validateStatusEvents:](self, "_validateStatusEvents:", v7)
    && -[RMStatusPublisherDescription _validateStatusKeysByNotification:](self, "_validateStatusKeysByNotification:", v5)&& -[RMStatusPublisherDescription _validateStatusKeysWithoutNotification:](self, "_validateStatusKeysWithoutNotification:", v6))
  {
    -[RMStatusPublisherDescription _loadDescriptionFromStatusEvents:statusKeysByNotification:statusKeysWithoutNotification:](self, "_loadDescriptionFromStatusEvents:statusKeysByNotification:statusKeysWithoutNotification:", v7, v5, v6);
  }

}

- (void)_loadDescriptionFromStatusEvents:(id)a3 statusKeysByNotification:(id)a4 statusKeysWithoutNotification:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSDictionary *v23;
  NSDictionary *statusKeysByXPCEvent;
  NSSet *v25;
  NSSet *statusKeys;
  id v27;
  RMStatusPublisherDescription *v28;
  id v29;
  id v30;
  id obj;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  if (v8)
  {
    v27 = v10;
    v28 = self;
    v29 = v9;
    v30 = v8;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("XPCEvents"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("StatusItems"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setWithArray:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v35[0] = MEMORY[0x24BDAC760];
          v35[1] = 3221225472;
          v35[2] = __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke;
          v35[3] = &unk_25162FA10;
          v36 = v11;
          v37 = v21;
          v22 = v21;
          objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v35);
          objc_msgSend(v12, "unionSet:", v22);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v14);
    }

    v9 = v29;
    v8 = v30;
    v10 = v27;
    self = v28;
  }
  if (v9)
  {
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke_3;
    v32[3] = &unk_25162F5F0;
    v33 = v11;
    v34 = v12;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v32);

  }
  if (v10)
    objc_msgSend(v12, "addObjectsFromArray:", v10);
  if (objc_msgSend(v11, "count"))
  {
    v23 = (NSDictionary *)objc_msgSend(v11, "copy");
    statusKeysByXPCEvent = self->_statusKeysByXPCEvent;
    self->_statusKeysByXPCEvent = v23;

  }
  if (objc_msgSend(v12, "count"))
  {
    v25 = (NSSet *)objc_msgSend(v12, "copy");
    statusKeys = self->_statusKeys;
    self->_statusKeys = v25;

  }
}

void __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke_2;
  v7[3] = &unk_25162F9E8;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = (id)objc_msgSend(MEMORY[0x24BE7EB50], "newXPCEventForStream:notificationName:descriptor:", *(_QWORD *)(a1 + 32), a2, a3);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v4);

}

void __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE7EB50];
  v6 = a3;
  v8 = (id)objc_msgSend(v5, "newXPCEventForDarwinNotification:", a2);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);
}

- (BOOL)_validateStatusEvents:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v4 = v3;
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v53;
        v39 = v4;
        v34 = *(_QWORD *)v53;
        while (2)
        {
          v7 = 0;
          v35 = v5;
          do
          {
            if (*(_QWORD *)v53 != v6)
              objc_enumerationMutation(v4);
            v8 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v7);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
              v9 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                -[RMStatusPublisherDescription _validateStatusEvents:].cold.1();
              goto LABEL_50;
            }
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("XPCEvents"));
            v9 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                -[RMStatusPublisherDescription _validateStatusEvents:].cold.5();
LABEL_45:

              goto LABEL_50;
            }
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            -[NSObject allValues](v9, "allValues");
            v10 = objc_claimAutoreleasedReturnValue();
            v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
            v36 = v7;
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v49;
              v37 = v9;
              v38 = v10;
              v33 = *(_QWORD *)v49;
              while (2)
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v49 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
                    v16 = objc_claimAutoreleasedReturnValue();
                    v4 = v39;
                    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                      -[RMStatusPublisherDescription _validateStatusEvents:].cold.4();
                    v9 = v37;
LABEL_44:

                    goto LABEL_45;
                  }
                  v46 = 0u;
                  v47 = 0u;
                  v44 = 0u;
                  v45 = 0u;
                  objc_msgSend(v15, "allValues");
                  v16 = objc_claimAutoreleasedReturnValue();
                  v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
                  if (v17)
                  {
                    v18 = v17;
                    v19 = *(_QWORD *)v45;
                    while (2)
                    {
                      for (j = 0; j != v18; ++j)
                      {
                        if (*(_QWORD *)v45 != v19)
                          objc_enumerationMutation(v16);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
                          v29 = objc_claimAutoreleasedReturnValue();
                          v4 = v39;
                          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                            -[RMStatusPublisherDescription _validateStatusEvents:].cold.3();

                          v9 = v37;
                          v10 = v38;
                          goto LABEL_44;
                        }
                      }
                      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
                      if (v18)
                        continue;
                      break;
                    }
                  }

                  v10 = v38;
                  v13 = v33;
                }
                v12 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
                v9 = v37;
                if (v12)
                  continue;
                break;
              }
            }

            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StatusItems"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v4 = v39;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                -[RMStatusPublisherDescription _validateStatusEvents:].cold.2();

LABEL_50:
              goto LABEL_51;
            }
            v22 = v9;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v23 = v21;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v41;
              while (2)
              {
                for (k = 0; k != v25; ++k)
                {
                  if (*(_QWORD *)v41 != v26)
                    objc_enumerationMutation(v23);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
                    v30 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      -[RMStatusPublisherDescription _validateStatusEvents:].cold.1();

                    v9 = v22;
                    goto LABEL_50;
                  }
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
                if (v25)
                  continue;
                break;
              }
            }

            v7 = v36 + 1;
            v6 = v34;
          }
          while (v36 + 1 != v35);
          v5 = -[NSObject countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
          v28 = 1;
          if (v5)
            continue;
          break;
        }
      }
      else
      {
        v28 = 1;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[RMStatusPublisherDescription _validateStatusEvents:].cold.1();
LABEL_51:
      v28 = 0;
    }

  }
  else
  {
    v28 = 1;
  }

  return v28;
}

- (BOOL)_validateStatusKeysByNotification:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  BOOL v15;
  NSObject *v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v3, "allValues");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v24;
        v18 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v24 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                -[RMStatusPublisherDescription _validateStatusEvents:].cold.1();
LABEL_26:

              goto LABEL_27;
            }
            v21 = 0u;
            v22 = 0u;
            v19 = 0u;
            v20 = 0u;
            v10 = v9;
            v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v20;
              while (2)
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v20 != v13)
                    objc_enumerationMutation(v10);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
                    v16 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                      -[RMStatusPublisherDescription _validateStatusEvents:].cold.1();

                    goto LABEL_26;
                  }
                }
                v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
                if (v12)
                  continue;
                break;
              }
            }

            v7 = v18;
          }
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          v15 = 1;
          if (v6)
            continue;
          break;
        }
      }
      else
      {
        v15 = 1;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[RMStatusPublisherDescription _validateStatusEvents:].cold.1();
LABEL_27:
      v15 = 0;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)_validateStatusKeysWithoutNotification:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = v3;
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription", v12);
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                -[RMStatusPublisherDescription _validateStatusEvents:].cold.1();

              goto LABEL_18;
            }
          }
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          v9 = 1;
          if (v6)
            continue;
          break;
        }
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "statusPublisherDescription");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[RMStatusPublisherDescription _validateStatusEvents:].cold.1();
LABEL_18:
      v9 = 0;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (NSDictionary)statusKeysByXPCEvent
{
  return self->_statusKeysByXPCEvent;
}

- (NSSet)statusKeys
{
  return self->_statusKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusKeys, 0);
  objc_storeStrong((id *)&self->_statusKeysByXPCEvent, 0);
}

- (void)_validateStatusEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Invalid status publisher description: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validateStatusEvents:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Invalid status publisher Items description: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validateStatusEvents:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Invalid status publisher XPCEvent notification description: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validateStatusEvents:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Invalid status publisher XPCEvent item description: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validateStatusEvents:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Invalid status publisher XPCEvents description: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

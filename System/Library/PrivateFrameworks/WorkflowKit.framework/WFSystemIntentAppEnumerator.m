@implementation WFSystemIntentAppEnumerator

- (WFSystemIntentAppEnumerator)init
{
  WFSystemIntentAppEnumerator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  const char *v5;
  NSObject *v6;
  WFSystemIntentAppEnumerator *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFSystemIntentAppEnumerator;
  v2 = -[WFSystemIntentAppEnumerator init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.shortcuts.WFSystemIntentAppEnumerator", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    v5 = (const char *)objc_msgSend((id)*MEMORY[0x1E0CA57B8], "UTF8String");
    v6 = v2->_queue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__WFSystemIntentAppEnumerator_init__block_invoke;
    v9[3] = &unk_1E7AF5AF8;
    objc_copyWeak(&v10, &location);
    notify_register_dispatch(v5, &v2->_token, v6, v9);
    v7 = v2;
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)WFSystemIntentAppEnumerator;
  -[WFSystemIntentAppEnumerator dealloc](&v3, sel_dealloc);
}

- (void)enumerate
{
  NSDictionary *v2;
  NSDictionary *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  NSDictionary *identifiersByIntentName;
  NSDictionary *v46;
  NSDictionary *identifiersByUserActivityType;
  void *v48;
  id obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v2 = (NSDictionary *)objc_opt_new();
  v3 = (NSDictionary *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0CA58E0]);
  v48 = (void *)objc_msgSend(v4, "initWithIdentifier:error:", *MEMORY[0x1E0CBD4B8], 0);
  v95[0] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 1);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v86;
    v55 = *MEMORY[0x1E0CBD3F8];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v86 != v51)
          objc_enumerationMutation(obj);
        v53 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v5);
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithExtensionPointRecord:options:", v6, 0);
        v54 = (id)objc_claimAutoreleasedReturnValue();
        v59 = (id)objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
        if (v59)
        {
          v57 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v59; i = (char *)i + 1)
            {
              if (*(_QWORD *)v82 != v57)
                objc_enumerationMutation(v54);
              v8 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
              v9 = (void *)MEMORY[0x1C3BB3598]();
              objc_msgSend(v8, "if_extensionAttributesDictionary");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKeyedSubscript:", v55);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (v11)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v12 = v11;
                else
                  v12 = 0;
              }
              else
              {
                v12 = 0;
              }
              v13 = v12;

              if (objc_msgSend(v13, "count"))
              {
                objc_msgSend(v8, "containingBundleRecord");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if (!objc_msgSend(v14, "wf_isAvailableInContext:", 0))
                  {
LABEL_33:

                    goto LABEL_34;
                  }
                }
                else
                {

                  v14 = 0;
                }
                objc_msgSend(v14, "bundleIdentifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = v15;
                v63 = v9;
                if (v15)
                {
                  v17 = v15;
                }
                else
                {
                  objc_msgSend(v8, "bundleIdentifier");
                  v17 = (id)objc_claimAutoreleasedReturnValue();
                }
                v18 = v17;

                v79 = 0u;
                v80 = 0u;
                v77 = 0u;
                v78 = 0u;
                v61 = v13;
                v19 = v13;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v78;
                  do
                  {
                    for (j = 0; j != v21; ++j)
                    {
                      if (*(_QWORD *)v78 != v22)
                        objc_enumerationMutation(v19);
                      v24 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
                      WFInsertIdentifierForKey(v2, v24, v18);
                      WFInsertIdentifierForKey(v3, v24, v18);
                    }
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
                  }
                  while (v21);
                }

                v13 = v61;
                v9 = v63;
                goto LABEL_33;
              }
LABEL_34:

              objc_autoreleasePoolPop(v9);
            }
            v59 = (id)objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
          }
          while (v59);
        }

        v5 = v53 + 1;
      }
      while (v53 + 1 != v52);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    }
    while (v52);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  WFInstalledAppsEnumerator();
  v60 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v74;
    v56 = *(_QWORD *)v74;
    do
    {
      v28 = 0;
      v58 = v26;
      do
      {
        if (*(_QWORD *)v74 != v27)
          objc_enumerationMutation(v60);
        v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v28);
        v30 = (void *)MEMORY[0x1C3BB3598]();
        objc_msgSend(v29, "supportedIntents");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "if_userActivityTypes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v31, "count") || objc_msgSend(v32, "count"))
          && objc_msgSend(v29, "wf_isAvailableInContext:", 0))
        {
          v62 = v32;
          v64 = v30;
          objc_msgSend(v29, "bundleIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v34 = v31;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v70;
            do
            {
              for (k = 0; k != v36; ++k)
              {
                if (*(_QWORD *)v70 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
                WFInsertIdentifierForKey(v2, v39, v33);
                WFInsertIdentifierForKey(v3, v39, v33);
              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
            }
            while (v36);
          }

          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v32 = v62;
          v40 = v62;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v66;
            do
            {
              for (m = 0; m != v42; ++m)
              {
                if (*(_QWORD *)v66 != v43)
                  objc_enumerationMutation(v40);
                WFInsertIdentifierForKey(v3, *(void **)(*((_QWORD *)&v65 + 1) + 8 * m), v33);
              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
            }
            while (v42);
          }

          v27 = v56;
          v26 = v58;
          v30 = v64;
        }

        objc_autoreleasePoolPop(v30);
        ++v28;
      }
      while (v28 != v26);
      v26 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
    }
    while (v26);
  }

  identifiersByIntentName = self->_identifiersByIntentName;
  self->_identifiersByIntentName = v2;
  v46 = v2;

  identifiersByUserActivityType = self->_identifiersByUserActivityType;
  self->_identifiersByUserActivityType = v3;

}

- (id)supportedIdentifiersForIntentClassName:(id)a3 includingUserActivityBasedApps:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8855;
  v19 = __Block_byref_object_dispose__8856;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__WFSystemIntentAppEnumerator_supportedIdentifiersForIntentClassName_includingUserActivityBasedApps___block_invoke;
  v11[3] = &unk_1E7AECFE8;
  v14 = a4;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersByUserActivityType, 0);
  objc_storeStrong((id *)&self->_identifiersByIntentName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __101__WFSystemIntentAppEnumerator_supportedIdentifiersForIntentClassName_includingUserActivityBasedApps___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3] || !v2[4])
  {
    objc_msgSend(v2, "enumerate");
    v2 = *(_QWORD **)(a1 + 32);
  }
  if (*(_BYTE *)(a1 + 56))
    v3 = (void *)v2[4];
  else
    v3 = (void *)v2[3];
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __35__WFSystemIntentAppEnumerator_init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[3];
  WeakRetained[3] = 0;

  v2 = (void *)WeakRetained[4];
  WeakRetained[4] = 0;

}

@end

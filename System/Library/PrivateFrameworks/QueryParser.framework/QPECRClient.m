@implementation QPECRClient

uint64_t __26__QPECRClient_warmUpAsync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "warmUpSync");
}

- (void)warmUpAsync
{
  qos_class_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = qos_class_self();
  dispatch_get_global_queue(v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__QPECRClient_warmUpAsync__block_invoke;
  block[3] = &unk_24DA268C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)visualIdentifierViewWithError:(id *)a3
{
  os_unfair_lock_s *p_viewLock;
  GDVisualIdentifierView **p_view;
  GDVisualIdentifierView *view;
  GDVisualIdentifierView *v8;
  void *v9;
  id v10;
  id v12;

  p_viewLock = &self->_viewLock;
  os_unfair_lock_lock(&self->_viewLock);
  view = self->_view;
  p_view = &self->_view;
  v8 = view;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE58538], "defaultService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v9, "visualIdentifierViewWithError:", &v12);
    v8 = (GDVisualIdentifierView *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    objc_storeStrong((id *)p_view, v8);
    if (a3)
      *a3 = objc_retainAutorelease(v10);

  }
  os_unfair_lock_unlock(p_viewLock);
  return v8;
}

- (void)warmUpSync
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_218E10000, v4, v5, "Unable to warmup %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

+ (id)sharedClient
{
  return +[QPXPCECRClient sharedClient](QPXPCECRClient, "sharedClient");
}

- (QPECRClient)init
{
  QPECRClient *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QPECRClient;
  result = -[QPECRClient init](&v3, sel_init);
  if (result)
    result->_viewLock._os_unfair_lock_opaque = 0;
  return result;
}

- (BOOL)warmUpECRClientSyncWithError:(id *)a3
{
  return 0;
}

- (BOOL)coolDownECRClientSyncWithError:(id *)a3
{
  return 0;
}

- (id)resolveEntitiesWithRequest:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)visualIdentifiersWithQuery:(id)a3 entityFilterType:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id obj;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95[2];
  _QWORD v96[2];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_alloc(MEMORY[0x24BE584E0]);
  v10 = &unk_24DA34C50;
  if (a4 == 2)
    v10 = &unk_24DA34C68;
  if (a4 == 1)
    v11 = &unk_24DA34C80;
  else
    v11 = v10;
  v67 = v8;
  v95[1] = 0;
  v66 = (void *)objc_msgSend(v9, "initWithText:entityClassFilter:spans:mode:constraint:includeInferredNames:", v8, v11, 0, 0, 0, 1);
  -[QPECRClient resolveEntitiesWithRequest:error:](self, "resolveEntitiesWithRequest:error:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    objc_msgSend(v12, "rankedResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      v95[0] = 0;
      -[QPECRClient visualIdentifierViewWithError:](self, "visualIdentifierViewWithError:", v95);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v95[0];
      if (v18)
      {
        v19 = v18;
        v15 = 0;
        *a5 = objc_retainAutorelease(v18);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        objc_msgSend(v12, "rankedResults");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v92;
          v69 = v15;
          v70 = v12;
          v68 = *(_QWORD *)v92;
          do
          {
            v23 = 0;
            v71 = v21;
            do
            {
              if (*(_QWORD *)v92 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v23);
              objc_msgSend(v24, "span");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "text");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "span");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "range");
              v29 = v28;

              if (objc_msgSend(v26, "length"))
                v30 = v29 == 0;
              else
                v30 = 1;
              if (!v30)
              {
                v74 = v23;
                objc_msgSend(v24, "span");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "range");
                objc_msgSend(v26, "substringWithRange:", v32, v33);
                v34 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v15, "objectForKeyedSubscript:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v35)
                {
                  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", v36, v34);

                }
                v73 = (void *)v34;
                objc_msgSend(v15, "objectForKeyedSubscript:", v34);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = 0u;
                v88 = 0u;
                v89 = 0u;
                v90 = 0u;
                objc_msgSend(v24, "rankedItems");
                v75 = (id)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
                if (v78)
                {
                  v77 = *(_QWORD *)v88;
                  do
                  {
                    v37 = 0;
                    do
                    {
                      if (*(_QWORD *)v88 != v77)
                        objc_enumerationMutation(v75);
                      v80 = v37;
                      v38 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v37);
                      objc_msgSend(v38, "entityID");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "stringValue");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v76, "personForIdentifier:", v40);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();

                      v85 = 0u;
                      v86 = 0u;
                      v83 = 0u;
                      v84 = 0u;
                      v79 = v41;
                      objc_msgSend(v41, "visualIdentifiers");
                      v81 = (id)objc_claimAutoreleasedReturnValue();
                      v42 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
                      if (v42)
                      {
                        v43 = v42;
                        v44 = *(_QWORD *)v84;
                        do
                        {
                          for (i = 0; i != v43; ++i)
                          {
                            if (*(_QWORD *)v84 != v44)
                              objc_enumerationMutation(v81);
                            objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("/"));
                            v46 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v46, "firstObject");
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            v48 = objc_msgSend(v47, "length");

                            if (v48)
                            {
                              objc_msgSend(v46, "firstObject");
                              v49 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v82, "objectForKeyedSubscript:", v49);
                              v50 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend(v50, "firstObject");
                              v51 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v51, "doubleValue");
                              v53 = v52;

                              objc_msgSend(v50, "lastObject");
                              v54 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v54, "doubleValue");
                              v56 = v55;

                              objc_msgSend(v38, "nameScore");
                              if (v57 > v53)
                              {
                                objc_msgSend(v38, "nameScore");
                                v53 = v58;
                              }
                              objc_msgSend(v38, "confirmationConfidence");
                              if (v59 > v56)
                              {
                                objc_msgSend(v38, "confirmationConfidence");
                                v56 = v60;
                              }
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v53);
                              v61 = (void *)objc_claimAutoreleasedReturnValue();
                              v96[0] = v61;
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v56);
                              v62 = (void *)objc_claimAutoreleasedReturnValue();
                              v96[1] = v62;
                              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 2);
                              v63 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v46, "firstObject");
                              v64 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v82, "setObject:forKeyedSubscript:", v63, v64);

                            }
                          }
                          v43 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
                        }
                        while (v43);
                      }

                      v37 = v80 + 1;
                    }
                    while (v80 + 1 != v78);
                    v78 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
                  }
                  while (v78);
                }

                v15 = v69;
                v12 = v70;
                v22 = v68;
                v21 = v71;
                v26 = v73;
                v23 = v74;
              }

              ++v23;
            }
            while (v23 != v21);
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
          }
          while (v21);
        }

        v19 = 0;
      }

    }
    else
    {
      v15 = (void *)MEMORY[0x24BDBD1B8];
    }
    v14 = 0;
  }

  return v15;
}

- (id)visualIdentifiersWithText:(id)a3 allowPrefixSearch:(BOOL)a4 entityFilterType:(int64_t)a5 includeInferredNames:(BOOL)a6 allowGroundingToNamesAndEmails:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  id v114;
  _QWORD v115[3];
  _QWORD v116[3];
  _BYTE v117[128];
  _BYTE v118[128];
  _QWORD v119[2];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v86 = a7;
  v9 = a6;
  v123 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = v13;
  if (!a4)
  {
    objc_msgSend(v13, "stringByAppendingString:", CFSTR(" "));
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  v16 = objc_alloc(MEMORY[0x24BE584E0]);
  v17 = &unk_24DA34C50;
  if (a5 == 2)
    v17 = &unk_24DA34C68;
  if (a5 == 1)
    v18 = &unk_24DA34C80;
  else
    v18 = v17;
  v19 = (void *)objc_msgSend(v16, "initWithText:entityClassFilter:spans:mode:constraint:includeInferredNames:", v14, v18, 0, 3, 0, v9);
  v114 = 0;
  -[QPECRClient resolveEntitiesWithRequest:error:](self, "resolveEntitiesWithRequest:error:", v19, &v114);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v114;
  v22 = v21;
  if (v21)
  {
    v23 = 0;
    *a8 = objc_retainAutorelease(v21);
  }
  else
  {
    v75 = v19;
    v76 = v14;
    objc_msgSend(v20, "rankedResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      v113 = 0;
      -[QPECRClient visualIdentifierViewWithError:](self, "visualIdentifierViewWithError:", &v113);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v113;
      v27 = v26;
      if (v26)
      {
        v23 = 0;
        *a8 = objc_retainAutorelease(v26);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        objc_msgSend(v20, "rankedResults");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        if (v79)
        {
          v78 = *(_QWORD *)v110;
          v83 = v28;
          v84 = v20;
          v82 = v29;
          do
          {
            v30 = 0;
            do
            {
              if (*(_QWORD *)v110 != v78)
              {
                v31 = v30;
                objc_enumerationMutation(obj);
                v30 = v31;
              }
              v80 = v30;
              v32 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v30);
              v105 = 0u;
              v106 = 0u;
              v107 = 0u;
              v108 = 0u;
              objc_msgSend(v32, "rankedItems");
              v81 = (id)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
              if (v88)
              {
                v87 = *(_QWORD *)v106;
                do
                {
                  v33 = 0;
                  do
                  {
                    if (*(_QWORD *)v106 != v87)
                      objc_enumerationMutation(v81);
                    v90 = v33;
                    v34 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v33);
                    objc_msgSend(v34, "entityID");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "stringValue");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "personForIdentifier:", v36);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();

                    v103 = 0u;
                    v104 = 0u;
                    v101 = 0u;
                    v102 = 0u;
                    v89 = v37;
                    objc_msgSend(v37, "visualIdentifiers");
                    v91 = (id)objc_claimAutoreleasedReturnValue();
                    v38 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
                    if (v38)
                    {
                      v39 = v38;
                      v40 = *(_QWORD *)v102;
                      do
                      {
                        for (i = 0; i != v39; ++i)
                        {
                          if (*(_QWORD *)v102 != v40)
                            objc_enumerationMutation(v91);
                          objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("/"));
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v42, "firstObject");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          v44 = objc_msgSend(v43, "length");

                          if (v44)
                          {
                            objc_msgSend(v42, "firstObject");
                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v92, "objectForKeyedSubscript:", v45);
                            v46 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v46, "firstObject");
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v47, "doubleValue");
                            v49 = v48;

                            objc_msgSend(v46, "lastObject");
                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v50, "doubleValue");
                            v52 = v51;

                            objc_msgSend(v34, "nameScore");
                            if (v53 > v49)
                            {
                              objc_msgSend(v34, "nameScore");
                              v49 = v54;
                            }
                            objc_msgSend(v34, "confirmationConfidence");
                            if (v55 > v52)
                            {
                              objc_msgSend(v34, "confirmationConfidence");
                              v52 = v56;
                            }
                            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v49);
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            v119[0] = v57;
                            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v52);
                            v58 = (void *)objc_claimAutoreleasedReturnValue();
                            v119[1] = v58;
                            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 2);
                            v59 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v42, "firstObject");
                            v60 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v92, "setObject:forKeyedSubscript:", v59, v60);

                          }
                        }
                        v39 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
                      }
                      while (v39);
                    }

                    v28 = v83;
                    v20 = v84;
                    v29 = v82;
                    if (v86)
                    {
                      v99 = 0u;
                      v100 = 0u;
                      v97 = 0u;
                      v98 = 0u;
                      objc_msgSend(v89, "names");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
                      if (v62)
                      {
                        v63 = v62;
                        v64 = *(_QWORD *)v98;
                        do
                        {
                          for (j = 0; j != v63; ++j)
                          {
                            if (*(_QWORD *)v98 != v64)
                              objc_enumerationMutation(v61);
                            objc_msgSend(v83, "addObject:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * j));
                          }
                          v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
                        }
                        while (v63);
                      }

                      v95 = 0u;
                      v96 = 0u;
                      v93 = 0u;
                      v94 = 0u;
                      objc_msgSend(v89, "emails");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
                      if (v67)
                      {
                        v68 = v67;
                        v69 = *(_QWORD *)v94;
                        do
                        {
                          for (k = 0; k != v68; ++k)
                          {
                            if (*(_QWORD *)v94 != v69)
                              objc_enumerationMutation(v66);
                            objc_msgSend(v82, "addObject:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * k));
                          }
                          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
                        }
                        while (v68);
                      }

                    }
                    v33 = v90 + 1;
                  }
                  while (v90 + 1 != v88);
                  v88 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
                }
                while (v88);
              }

              v30 = v80 + 1;
            }
            while (v80 + 1 != v79);
            v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
          }
          while (v79);
        }

        v115[0] = CFSTR("visualIdentifier");
        v71 = (void *)objc_msgSend(v92, "copy");
        v116[0] = v71;
        v115[1] = CFSTR("personNames");
        v72 = (void *)objc_msgSend(v28, "copy");
        v116[1] = v72;
        v115[2] = CFSTR("personEmails");
        v73 = (void *)objc_msgSend(v29, "copy");
        v116[2] = v73;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, v115, 3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0;
      }

    }
    else
    {
      v23 = (void *)MEMORY[0x24BDBD1B8];
    }
    v19 = v75;
    v14 = v76;
    v22 = 0;
  }

  return v23;
}

- (void)cooldownSync
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_218E10000, v4, v5, "Unable to cooldown %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)cooldownAsync
{
  qos_class_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = qos_class_self();
  dispatch_get_global_queue(v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__QPECRClient_cooldownAsync__block_invoke;
  block[3] = &unk_24DA268C0;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __28__QPECRClient_cooldownAsync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cooldownSync");
}

- (void)clearVisualIdentifierView
{
  os_unfair_lock_s *p_viewLock;
  GDVisualIdentifierView *view;

  p_viewLock = &self->_viewLock;
  os_unfair_lock_lock(&self->_viewLock);
  view = self->_view;
  self->_view = 0;

  os_unfair_lock_unlock(p_viewLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end

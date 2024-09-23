@implementation PLLegacyChangeEventBuilder

+ (id)createXPCDictionaryFromChangedObjectIDs:(id)a3 redundantDeletes:(id)a4 uuidsForCloudDeletion:(id)a5 updatedAttributesByObjectID:(id)a6 updatedRelationshipsByObjectID:(id)a7 updatedOrderKeys:(id)a8 changeSource:(int)a9 syncChangeMarker:(BOOL)a10
{
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  xpc_object_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t m;
  uint64_t v31;
  id v32;
  int v33;
  _BOOL4 v34;
  void *v35;
  BOOL v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char v47;
  const __CFURL *v48;
  int64_t v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t ii;
  void *v55;
  void *v56;
  uint64_t v57;
  const __CFURL *v58;
  int64_t v59;
  NSObject *v60;
  id v61;
  id obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  void (**v70)(void);
  uint64_t k;
  id v72;
  id v73;
  xpc_object_t v74;
  xpc_object_t value;
  id v76;
  id v77;
  id v78;
  xpc_object_t xarray;
  xpc_object_t xarraya;
  id v81;
  uint64_t v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[16];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
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
  _QWORD v109[5];
  int v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  UInt8 v117[128];
  UInt8 buffer[160];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _QWORD v124[5];

  v124[3] = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v81 = a4;
  v72 = a5;
  v78 = a6;
  v77 = a7;
  v67 = a8;
  v111 = 0;
  v112 = &v111;
  v113 = 0x3032000000;
  v114 = __Block_byref_object_copy__16661;
  v115 = __Block_byref_object_dispose__16662;
  v116 = 0;
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __215__PLLegacyChangeEventBuilder_createXPCDictionaryFromChangedObjectIDs_redundantDeletes_uuidsForCloudDeletion_updatedAttributesByObjectID_updatedRelationshipsByObjectID_updatedOrderKeys_changeSource_syncChangeMarker___block_invoke;
  v109[3] = &unk_1E366C498;
  v109[4] = &v111;
  v110 = a9;
  v70 = (void (**)(void))MEMORY[0x19AEC174C](v109);
  v15 = *MEMORY[0x1E0C97A18];
  v124[0] = *MEMORY[0x1E0C97870];
  v124[1] = v15;
  v65 = v15;
  v66 = *MEMORY[0x1E0C97838];
  v124[2] = *MEMORY[0x1E0C97838];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 3);
  xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend(v72, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
  if (v82)
  {
    v17 = *(_QWORD *)v106;
    v18 = v82;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v106 != v17)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        objc_msgSend(v72, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v70[2]();
          v22 = xpc_array_create(0, 0);
          xpc_dictionary_set_value((xpc_object_t)v112[5], (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"), v22);
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v23 = v21;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v101, v122, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v102;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v102 != v25)
                  objc_enumerationMutation(v23);
                xpc_array_set_string(v22, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v101 + 1) + 8 * j)), "UTF8String"));
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v101, v122, 16);
            }
            while (v24);
          }

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
    }
    while (v18);
  }

  if (v82 != 0 || a10)
  {
    v70[2]();
    xpc_dictionary_set_BOOL((xpc_object_t)v112[5], "syncChangeMarker", 1);
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = xarray;
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
  if (v69)
  {
    v64 = *(_QWORD *)v98;
    do
    {
      for (k = 0; k != v69; ++k)
      {
        if (*(_QWORD *)v98 != v64)
          objc_enumerationMutation(obj);
        v73 = *(id *)(*((_QWORD *)&v97 + 1) + 8 * k);
        objc_msgSend(v68, "objectForKeyedSubscript:");
        v76 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v73, "isEqualToString:", v66) && objc_msgSend(v81, "count"))
        {
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v76 = v76;
          v27 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v93, v120, 16);
          if (!v27)
          {
            v32 = v76;
            goto LABEL_40;
          }
          v28 = 0;
          v29 = *(_QWORD *)v94;
          do
          {
            for (m = 0; m != v27; ++m)
            {
              if (*(_QWORD *)v94 != v29)
                objc_enumerationMutation(v76);
              v31 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * m);
              if (objc_msgSend(v81, "containsObject:", v31))
              {
                if (!v28)
                  v28 = (void *)objc_msgSend(v76, "mutableCopy");
                objc_msgSend(v28, "removeObject:", v31);
              }
            }
            v27 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v93, v120, 16);
          }
          while (v27);

          if (v28)
          {
            v32 = v28;

LABEL_40:
            v76 = v32;

          }
        }
        v33 = objc_msgSend(v73, "isEqualToString:", v65);
        if (v33)
          v34 = objc_msgSend(v67, "count") != 0;
        else
          v34 = 0;
        v35 = v76;
        if (v76)
          v36 = 0;
        else
          v36 = !v34;
        if (!v36)
        {
          xarraya = xpc_array_create(0, 0);
          if (v33)
          {
            value = xpc_array_create(0, 0);
            v74 = xpc_array_create(0, 0);
          }
          else
          {
            v74 = 0;
            value = 0;
          }
          v83 = (void *)objc_msgSend(v67, "mutableCopy");
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v37 = v76;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
          if (v38)
          {
            v39 = *(_QWORD *)v90;
            do
            {
              for (n = 0; n != v38; ++n)
              {
                if (*(_QWORD *)v90 != v39)
                  objc_enumerationMutation(v37);
                v41 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * n);
                if (!v33)
                {
                  v43 = 0;
                  v45 = 0;
                  if (!v41)
                    continue;
LABEL_62:
                  if (v43)
                    v47 = 1;
                  else
                    v47 = v33 ^ 1;
                  if ((v47 & 1) != 0 || v45)
                  {
                    objc_msgSend(v41, "URIRepresentation");
                    v48 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
                    v49 = CFURLGetBytes(v48, buffer, 160);
                    if (v49 < 1)
                    {
                      PLChangeHandlingGetLog();
                      v50 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_ERROR, "Unable to get data from object URI.", buf, 2u);
                      }

                    }
                    else
                    {
                      xpc_array_set_data(xarraya, 0xFFFFFFFFFFFFFFFFLL, buffer, v49);
                      if (v33)
                      {
                        xpc_array_set_uint64(value, 0xFFFFFFFFFFFFFFFFLL, v43);
                        xpc_array_set_uint64(v74, 0xFFFFFFFFFFFFFFFFLL, v45);
                      }
                    }

                  }
                  continue;
                }
                objc_msgSend(v78, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * n));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "unsignedLongLongValue");

                objc_msgSend(v77, "objectForKey:", v41);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "unsignedLongLongValue");

                objc_msgSend(v83, "objectForKey:", v41);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                if (v46)
                {
                  objc_msgSend(v83, "removeObjectForKey:", v41);
                  v45 |= objc_msgSend(v46, "unsignedLongLongValue");
                }

                if (v41)
                  goto LABEL_62;
              }
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
            }
            while (v38);
          }

          if (v33)
          {
            v86 = 0u;
            v87 = 0u;
            v84 = 0u;
            v85 = 0u;
            v51 = v83;
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v84, v117, 16);
            if (v52)
            {
              v53 = *(_QWORD *)v85;
              do
              {
                for (ii = 0; ii != v52; ++ii)
                {
                  if (*(_QWORD *)v85 != v53)
                    objc_enumerationMutation(v51);
                  v55 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * ii);
                  objc_msgSend(v51, "objectForKey:", v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = objc_msgSend(v56, "unsignedLongLongValue");

                  objc_msgSend(v55, "URIRepresentation");
                  v58 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
                  v59 = CFURLGetBytes(v58, buffer, 160);
                  if (v59 < 1)
                  {
                    PLChangeHandlingGetLog();
                    v60 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_ERROR, "Unable to get data from object URI.", buf, 2u);
                    }

                  }
                  else
                  {
                    xpc_array_set_data(xarraya, 0xFFFFFFFFFFFFFFFFLL, buffer, v59);
                    xpc_array_set_uint64(value, 0xFFFFFFFFFFFFFFFFLL, 0);
                    xpc_array_set_uint64(v74, 0xFFFFFFFFFFFFFFFFLL, v57);
                  }

                }
                v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v84, v117, 16);
              }
              while (v52);
            }

            if (xpc_array_get_count(value))
            {
              v70[2]();
              xpc_dictionary_set_value((xpc_object_t)v112[5], "PLUpdatedAttributesKey", value);
            }
            if (xpc_array_get_count(v74))
            {
              v70[2]();
              xpc_dictionary_set_value((xpc_object_t)v112[5], "PLUpdatedRelationshipsKey", v74);
            }
          }
          if (xpc_array_get_count(xarraya))
          {
            v70[2]();
            xpc_dictionary_set_value((xpc_object_t)v112[5], (const char *)objc_msgSend(objc_retainAutorelease(v73), "UTF8String"), xarraya);
          }

          v35 = v76;
        }

      }
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
    }
    while (v69);
  }

  v61 = (id)v112[5];
  _Block_object_dispose(&v111, 8);

  return v61;
}

void __215__PLLegacyChangeEventBuilder_createXPCDictionaryFromChangedObjectIDs_redundantDeletes_uuidsForCloudDeletion_updatedAttributesByObjectID_updatedRelationshipsByObjectID_updatedOrderKeys_changeSource_syncChangeMarker___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    xpc_dictionary_set_uint64(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventKind", 1uLL);
    xpc_dictionary_set_int64(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "changeSource", *(int *)(a1 + 40));
  }
}

@end

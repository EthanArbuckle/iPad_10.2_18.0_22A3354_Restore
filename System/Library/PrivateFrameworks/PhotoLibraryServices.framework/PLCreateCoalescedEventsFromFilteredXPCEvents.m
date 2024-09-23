@implementation PLCreateCoalescedEventsFromFilteredXPCEvents

uint64_t __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  xpc_object_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  NSObject *oslog;
  void *v47;
  void *v48;
  id obj;
  uint64_t v50;
  void *v51;
  xpc_object_t xdict;
  _QWORD applier[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  void *v64;
  void *v65;
  id v66;
  _QWORD v67[4];
  id v68;
  xpc_object_t objects;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint8_t v81[128];
  _BYTE buf[24];
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objects = v5;
  if (xpc_dictionary_get_uint64(v5, "eventKind") == 1)
  {
    v6 = a1;
    v7 = *(_DWORD *)(a1 + 80);
    if (v7 != xpc_dictionary_get_int64(v5, "changeSource"))
    {
      v42 = a2;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 64) + 8) + 24);
      v8 = (void *)*MEMORY[0x1E0C97870];
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke_2;
      v67[3] = &unk_1E366B2A8;
      v50 = v6;
      v68 = *(id *)(v6 + 32);
      xdict = v5;
      enumerateURIs(v5, v8, v67);
      xpc_dictionary_get_value(v5, "PLUpdatedAttributesKey");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_get_value(v5, "PLUpdatedRelationshipsKey");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)*MEMORY[0x1E0C97A18];
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke_3;
      v62[3] = &unk_1E366B2D0;
      v63 = *(id *)(v6 + 32);
      v64 = v48;
      v65 = v47;
      v66 = *(id *)(v6 + 40);
      enumerateURIs(v5, v9, v62);
      v10 = (void *)*MEMORY[0x1E0C97838];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke_4;
      v58[3] = &unk_1E366B2F8;
      v59 = *(id *)(v6 + 32);
      v60 = *(id *)(v6 + 40);
      v61 = *(id *)(v6 + 48);
      enumerateURIs(v5, v10, v58);
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      PLAllCloudDeletionKeys();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v81, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v55 != v13)
              objc_enumerationMutation(v11);
            v15 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i));
            xpc_dictionary_get_value(xdict, (const char *)objc_msgSend(v15, "UTF8String"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              v83 = __Block_byref_object_copy__48065;
              v84 = __Block_byref_object_dispose__48066;
              v85 = 0;
              applier[0] = MEMORY[0x1E0C809B0];
              applier[1] = 3221225472;
              applier[2] = __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke_5;
              applier[3] = &unk_1E366B320;
              applier[4] = buf;
              xpc_array_apply(v16, applier);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v50 + 72) + 8) + 40), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v15);
              _Block_object_dispose(buf, 8);

            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v81, 16);
        }
        while (v12);
      }

      PLChangeHandlingGetLog();
      oslog = objc_claimAutoreleasedReturnValue();
      v18 = oslog;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(void **)(v50 + 40);
        v20 = *(void **)(v50 + 48);
        v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(v50 + 72) + 8) + 40);
        v45 = *(id *)(v50 + 32);
        v44 = v19;
        v43 = v20;
        v22 = v21;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inserts: {%@}"), v45);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v23);

        }
        if (objc_msgSend(v44, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updates: {%@}"), v44);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v24);

        }
        if (objc_msgSend(v43, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deletes: {%@}"), v43);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v25);

        }
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        objc_msgSend(v22, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v71;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v71 != v27)
                objc_enumerationMutation(obj);
              v29 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
              objc_msgSend(v22, "objectForKey:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v30;
              if (v30)
              {
                v32 = (void *)MEMORY[0x1E0CB3940];
                v33 = v30;
                v75 = 0;
                v76 = &v75;
                v77 = 0x3032000000;
                v78 = __Block_byref_object_copy__48065;
                v79 = __Block_byref_object_dispose__48066;
                v80 = 0;
                v74[0] = MEMORY[0x1E0C809B0];
                v74[1] = 3221225472;
                v74[2] = __descriptionForStringArray_block_invoke;
                v74[3] = &unk_1E366B320;
                v74[4] = &v75;
                xpc_array_apply(v33, v74);
                v34 = (id)v76[5];
                _Block_object_dispose(&v75, 8);

                objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: {%@}"), v29, v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v51, "addObject:", v35);
              }

            }
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
          }
          while (v26);
        }

        objc_msgSend(v51, "componentsJoinedByString:", CFSTR(", "));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v36;
        _os_log_impl(&dword_199541000, oslog, OS_LOG_TYPE_DEBUG, "Coalesced {%zu}: %@", buf, 0x16u);

        v18 = oslog;
      }

      v5 = xdict;
    }
  }
  else
  {
    v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v37)
    {
      xpc_array_append_value(v37, v5);
    }
    else
    {
      v38 = xpc_array_create(&objects, 1uLL);
      v39 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v40 = *(void **)(v39 + 40);
      *(_QWORD *)(v39 + 40) = v38;

      v5 = objects;
    }
  }

  return 1;
}

uint64_t __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke_61(uint64_t a1, int a2, xpc_object_t value)
{
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), value);
  return 1;
}

void __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke_2(uint64_t a1, void *a2)
{
  insertURIWithHash(*(void **)(a1 + 32), a2, 0, 0);
}

void __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke_3(uint64_t a1, void *a2, size_t a3)
{
  void *v5;
  uint64_t uint64;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (indexInURIWithHash(*(void **)(a1 + 32), v9) == -1)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
      uint64 = xpc_array_get_uint64(v5, a3);
    else
      uint64 = 0;
    v7 = *(void **)(a1 + 48);
    if (v7)
      v8 = xpc_array_get_uint64(v7, a3);
    else
      v8 = 0;
    insertURIWithHash(*(void **)(a1 + 56), v9, uint64, v8);
  }

}

void __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke_4(void **a1, void *a2)
{
  BOOL v3;
  id v4;

  v4 = a2;
  v3 = removeURIWithHash(a1[4], v4);
  removeURIWithHash(a1[5], v4);
  if (!v3)
    insertURIWithHash(a1[6], v4, 0, 0);

}

uint64_t __PLCreateCoalescedEventsFromFilteredXPCEvents_block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  xpc_object_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v5)
  {
    v6 = xpc_array_create(0, 0);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  xpc_array_append_value(v5, v4);

  return 1;
}

@end

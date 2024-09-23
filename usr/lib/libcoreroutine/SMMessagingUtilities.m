@implementation SMMessagingUtilities

+ (void)queryChatWithGroupID:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD *v13;
  void (*IMSPIQueryChatWithGroupIDSymbolLoc)(id, uint64_t, id, _QWORD *);
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!_MergedGlobals_99)
  {
    *(_OWORD *)buf = xmmword_1E929EE38;
    v19 = 0;
    _MergedGlobals_99 = _sl_dlopen();
  }
  if (_MergedGlobals_99 && getIMSPIQueryChatWithGroupIDSymbolLoc())
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[SMMessagingUtilities queryChatWithGroupID:queue:handler:]";
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%s, IMCoreIMSPIQueryChatWithGroupID available", buf, 0xCu);
    }

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__SMMessagingUtilities_queryChatWithGroupID_queue_handler___block_invoke;
    v16[3] = &unk_1E929EE18;
    v17 = v9;
    v11 = v7;
    v12 = v8;
    v13 = v16;
    IMSPIQueryChatWithGroupIDSymbolLoc = (void (*)(id, uint64_t, id, _QWORD *))getIMSPIQueryChatWithGroupIDSymbolLoc();
    if (!IMSPIQueryChatWithGroupIDSymbolLoc)
    {
      dlerror();
      abort_report_np();
    }
    IMSPIQueryChatWithGroupIDSymbolLoc(v11, 25, v12, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[SMMessagingUtilities queryChatWithGroupID:queue:handler:]";
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, IMCoreIMSPIQueryChatWithGroupID not available", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __59__SMMessagingUtilities_queryChatWithGroupID_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v11 = 136315394;
      v12 = "+[SMMessagingUtilities queryChatWithGroupID:queue:handler:]_block_invoke";
      v13 = 2112;
      v14 = v3;
      v6 = "%s, found chat %@";
      v7 = v4;
      v8 = 22;
LABEL_6:
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    v11 = 136315138;
    v12 = "+[SMMessagingUtilities queryChatWithGroupID:queue:handler:]_block_invoke";
    v6 = "%s, no chat found";
    v7 = v4;
    v8 = 12;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3, v9, v10);
}

+ (id)_canonicalizeHandles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  __int128 v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v22;
    *(_QWORD *)&v8 = 138413058;
    v19 = v8;
    v20 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(a1, "canonicalIDSIDsForAddress:", v12, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v19;
          v26 = v16;
          v27 = 2080;
          v28 = "+[SMMessagingUtilities _canonicalizeHandles:]";
          v29 = 2112;
          v30 = v12;
          v31 = 2112;
          v32 = v13;
          _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@, %s, raw handle, %@, canonicalized handle, %@", buf, 0x2Au);

          v6 = v20;
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(v5, "copy");
  return v17;
}

+ (id)_canonicalHandleMapFromHandles:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(a1, "canonicalIDSIDsForAddress:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v10, 0);
        objc_msgSend(v5, "setObject:forKey:", v13, v11);

        if (v12)
        {
          objc_msgSend(v12, "arrayByAddingObject:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v26 = v17;
            v27 = 2080;
            v28 = "+[SMMessagingUtilities _canonicalHandleMapFromHandles:]";
            v29 = 2112;
            v30 = v14;
            v31 = 2112;
            v32 = v11;
            _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "%@, %s, found multiple handles, %@, for the same canonical handle, %@", buf, 0x2Au);

          }
        }
        else
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v10, 0);
          objc_msgSend(v5, "setObject:forKey:", v14, v11);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v7);
  }

  v18 = (void *)objc_msgSend(v5, "copy");
  return v18;
}

+ (BOOL)handlesInConversation1:(id)a3 canonicallyEqualsHandlesInConversation2:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char v17;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v6, "receiverPrimaryHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_canonicalizeHandles:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithArray:", v10);

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v7, "receiverPrimaryHandles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_canonicalizeHandles:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithArray:", v14);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "receiverPrimaryHandles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "receiverPrimaryHandles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413570;
    v24 = v20;
    v25 = 2080;
    v26 = "+[SMMessagingUtilities handlesInConversation1:canonicallyEqualsHandlesInConversation2:]";
    v27 = 2112;
    v28 = v21;
    v29 = 2112;
    v30 = v22;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v15;
    _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%@, %s, conversation 1 handles, %@, conversation 2 handles, %@, conversation 1 canonical handles, %@, conversation 2 canonical handles, %@", (uint8_t *)&v23, 0x3Eu);

  }
  v17 = objc_msgSend(v11, "isEqualToSet:", v15);

  return v17;
}

+ (id)conversationFromHandlesInConversation1:(id)a3 canonicallyMappedToHandlesInConversation2:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v45 = v6;
  objc_msgSend(v6, "receiverPrimaryHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_canonicalHandleMapFromHandles:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v7;
  objc_msgSend(v7, "receiverPrimaryHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_canonicalHandleMapFromHandles:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v47 = v9;
  objc_msgSend(v9, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
  v46 = v12;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19 && objc_msgSend(v19, "count"))
        {
          v21 = objc_alloc(MEMORY[0x1E0D8B960]);
          objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "initWithPrimaryHandle:secondaryHandles:", v22, MEMORY[0x1E0C9AA60]);
          objc_msgSend(v12, "addObject:", v23);
        }
        else
        {
          objc_msgSend(v47, "objectForKey:", v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v24;
          if (v24 && objc_msgSend(v24, "count"))
          {
            v25 = objc_alloc(MEMORY[0x1E0D8B960]);
            objc_msgSend(v47, "objectForKey:", v18);
            v23 = objc_claimAutoreleasedReturnValue();
            -[NSObject objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v25, "initWithPrimaryHandle:secondaryHandles:", v26, MEMORY[0x1E0C9AA60]);
            objc_msgSend(v46, "addObject:", v27);

            v12 = v46;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v28 = (objc_class *)objc_opt_class();
              NSStringFromClass(v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v53 = v29;
              v54 = 2080;
              v55 = "+[SMMessagingUtilities conversationFromHandlesInConversation1:canonicallyMappedToHandlesInConversation2:]";
              v56 = 2112;
              v57 = v45;
              v58 = 2112;
              v59 = v18;
              _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, %s, missing handle in conversation, %@, for key, %@", buf, 0x2Au);

              v12 = v46;
            }
          }
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
    }
    while (v15);
  }

  v30 = objc_alloc(MEMORY[0x1E0D8B918]);
  v31 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v45, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "displayName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v30, "initWithReceiverHandles:identifier:displayName:", v31, v32, v33);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "receiverPrimaryHandles");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "allKeys");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "receiverPrimaryHandles");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "receiverPrimaryHandles");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v53 = v44;
    v54 = 2080;
    v55 = "+[SMMessagingUtilities conversationFromHandlesInConversation1:canonicallyMappedToHandlesInConversation2:]";
    v56 = 2112;
    v57 = v38;
    v58 = 2112;
    v59 = v43;
    v60 = 2112;
    v61 = v41;
    v62 = 2112;
    v63 = v39;
    v64 = 2112;
    v65 = v40;
    _os_log_debug_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEBUG, "%@, %s, original handles in conversation, %@, canonical handles in conversation, %@, handles in reference conversation, %@, canonical handles in reference conversation, %@, final handles in conversation, %@", buf, 0x48u);

    v12 = v46;
  }

  return v34;
}

+ (id)conversationFromHandlesInConversation1:(id)a3 canonicallyIntersectedWithHandlesInConversation2:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v41 = v6;
  objc_msgSend(v6, "receiverPrimaryHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_canonicalHandleMapFromHandles:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v7;
  objc_msgSend(v7, "receiverPrimaryHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_canonicalHandleMapFromHandles:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v9, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v38 = v11;
  objc_msgSend(v11, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v17;
  objc_msgSend(v14, "intersectSet:", v17);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v43;
    v40 = v18;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25 && objc_msgSend(v25, "count"))
        {
          v27 = objc_alloc(MEMORY[0x1E0D8B960]);
          objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v27, "initWithPrimaryHandle:secondaryHandles:", v28, MEMORY[0x1E0C9AA60]);
          objc_msgSend(v18, "addObject:", v29);

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v47 = v31;
            v48 = 2080;
            v49 = "+[SMMessagingUtilities conversationFromHandlesInConversation1:canonicallyIntersectedWithHandlesInConversation2:]";
            v50 = 2112;
            v51 = v41;
            v52 = 2112;
            v53 = v24;
            _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, %s, missing handle in conversation, %@, for key, %@", buf, 0x2Au);

            v18 = v40;
          }
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v21);
  }

  v32 = objc_alloc(MEMORY[0x1E0D8B918]);
  objc_msgSend(v41, "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "displayName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v32, "initWithReceiverHandles:identifier:displayName:", v18, v33, v34);

  return v35;
}

+ (id)canonicalIDSIDsForAddress:(id)a3
{
  return (id)IMChatCanonicalIDSIDsForAddress();
}

@end

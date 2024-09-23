uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t _ICQBooleanForServerObjectDefault(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a1;
  if (_ICQBooleanForServerObjectDefault_onceToken != -1)
    dispatch_once(&_ICQBooleanForServerObjectDefault_onceToken, &__block_literal_global_24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a2 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (void *)_ICQBooleanForServerObjectDefault_sBoolDict;
      objc_msgSend(v3, "uppercaseString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        a2 = objc_msgSend(v6, "BOOLValue");

    }
  }

  return a2;
}

id _ICQStringFromDictionaryKey(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_opt_class();
  _ICQObjectForKey(v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id _ICQObjectForKey(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;

  }
  else
  {
    v8 = v6;
    if (v7)
    {
      _ICQGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412546;
        v12 = v5;
        v13 = 2112;
        v14 = v7;
        _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "persisted offer(s) bad %@: %@", (uint8_t *)&v11, 0x16u);
      }

      v8 = v6;
    }
  }

  return v8;
}

void sub_1CDEC124C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _ICQGetLogSystem()
{
  if (_ICQGetLogSystem_onceToken != -1)
    dispatch_once(&_ICQGetLogSystem_onceToken, &__block_literal_global_23);
  return (id)_ICQGetLogSystem_log;
}

void sub_1CDEC197C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _ICQDictionaryForKey(void *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _ICQGetLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v3;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "expected NSDictionary from key %@ but got %@", (uint8_t *)&v9, 0x16u);

      }
      v4 = 0;
    }
  }

  return v4;
}

id _ICQLinkForServerMessageParameterWithOptions(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("display"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("actParams"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v7 = v5;
      }
      else
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("params"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v7;

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("display"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("link"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      v18 = v14;
      v19 = v12;
      v20 = v15;
      v21 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("btnTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("btnTitle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("btnAction"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("btnActParams"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("actParams"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("btnId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQLinkForServerValues(v12, v13, v15, 0, v16, a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_20;
      goto LABEL_19;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BtnTitle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BtnTitle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BtnAction"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BtnActParams"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BtnId"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      v18 = v13;
      v19 = v14;
      v20 = 0;
      v21 = v15;
LABEL_18:
      _ICQLinkForServerValues(v17, v18, v19, v20, v21, a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("btnActParams"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("actParams"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      _ICQLinkForServerValues(0, v12, v14, 0, 0, a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_21;
      goto LABEL_20;
    }
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v25 = 138412290;
    v26 = v3;
    v9 = "Invalid link: %@";
    goto LABEL_8;
  }
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v3;
    v9 = "link: expected dict: invalid server message parameter:%@";
LABEL_8:
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v25, 0xCu);
  }
LABEL_9:

LABEL_10:
  v10 = 0;
LABEL_22:

  return v10;
}

id _ICQServerDictionaryForBundleIdentifier(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t k;
  void *v50;
  void *v51;
  int v52;
  id v53;
  NSObject *v54;
  objc_class *v55;
  const char *Name;
  NSObject *v57;
  objc_class *v58;
  const char *v59;
  NSObject *v60;
  objc_class *v61;
  const char *v62;
  NSObject *v63;
  objc_class *v64;
  const char *v65;
  id v67;
  id obj;
  id v69;
  char *v70;
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
  _BYTE v87[128];
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  void *v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v69 = a2;
  v70 = a3;
  if (!objc_msgSend(v69, "isEqualToString:", CFSTR("__WILDCARD__")))
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v67 = v7;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v76 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v25)
            {
              _ICQGetLogSystem();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                v55 = (objc_class *)objc_opt_class();
                Name = class_getName(v55);
                *(_DWORD *)buf = 136315394;
                v91 = Name;
                v92 = 2112;
                v93 = v25;
                _os_log_impl(&dword_1CDEBD000, v54, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
              }

            }
            v53 = 0;
LABEL_64:

LABEL_73:
            v33 = v69;
            v7 = v67;
            goto LABEL_90;
          }
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("appId"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", v69);

          if (v27)
          {
            if (!v70
              || (objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("reason")),
                  v28 = (void *)objc_claimAutoreleasedReturnValue(),
                  v29 = objc_msgSend(v28, "isEqualToString:", v70),
                  v28,
                  v29))
            {
              v53 = v25;
              goto LABEL_64;
            }
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
      }
      while (v22);
    }

    _ICQGetLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v91 = (const char *)v69;
      _os_log_impl(&dword_1CDEBD000, v30, OS_LOG_TYPE_DEFAULT, "app specific spec for %@ not found in appId array; using workaround",
        buf,
        0xCu);
    }

    _ICQGetLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      _ICQServerDictionaryForBundleIdentifier_cold_1((uint64_t)v20, v31, v32);

    _ICQContainerIDForKnownBundleID(v69);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      _ICQBundleIDForKnownContainerID(v69);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v34 = v20;
    v35 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v72 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v39)
            {
              _ICQGetLogSystem();
              v63 = objc_claimAutoreleasedReturnValue();
              v7 = v67;
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                v64 = (objc_class *)objc_opt_class();
                v65 = class_getName(v64);
                *(_DWORD *)buf = 136315394;
                v91 = v65;
                v92 = 2112;
                v93 = v39;
                _os_log_impl(&dword_1CDEBD000, v63, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
              }

              v53 = 0;
              goto LABEL_86;
            }
LABEL_84:
            v53 = 0;
LABEL_85:
            v7 = v67;
LABEL_86:

            goto LABEL_90;
          }
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("appId"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "isEqualToString:", v33);

          if (!v41)
          {
            if (!objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.icloud.docs")))
              continue;
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("appId"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.icloud.drive"));

            if (!v43)
              continue;
          }
          v53 = v39;
          goto LABEL_85;
        }
        v36 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
      }
      while (v36);
    }

    _ICQGetLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v34, OS_LOG_TYPE_DEFAULT, "app specific spec still not found using workaround", buf, 2u);
    }
    goto LABEL_84;
  }
  if (a4)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (!v8)
      goto LABEL_12;
    v9 = v8;
    v10 = *(_QWORD *)v84;
    v67 = v7;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v84 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mesg"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("format"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("%@"));

      if (v15)
      {
        v53 = v12;
LABEL_72:

        goto LABEL_73;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
        v7 = v67;
        if (v9)
          goto LABEL_5;
LABEL_12:

        _ICQGetLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v17 = "warning: missing appBannerInfo that could be considered a button";
          v18 = v16;
          v19 = 2;
          goto LABEL_56;
        }
        goto LABEL_57;
      }
    }
    if (v12)
    {
      _ICQGetLogSystem();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = (objc_class *)objc_opt_class();
        v59 = class_getName(v58);
        *(_DWORD *)buf = 136315394;
        v91 = v59;
        v92 = 2112;
        v93 = v12;
        _os_log_impl(&dword_1CDEBD000, v57, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }

    }
    v53 = 0;
    goto LABEL_72;
  }
  if (!v70)
  {
    objc_msgSend(v7, "firstObject");
    v53 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v44 = v7;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
  if (!v45)
    goto LABEL_54;
  v46 = v45;
  v47 = *(_QWORD *)v80;
  while (2)
  {
    v48 = v7;
    for (k = 0; k != v46; ++k)
    {
      if (*(_QWORD *)v80 != v47)
        objc_enumerationMutation(v44);
      v50 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = v48;
        if (v50)
        {
          _ICQGetLogSystem();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = (objc_class *)objc_opt_class();
            v62 = class_getName(v61);
            *(_DWORD *)buf = 136315394;
            v91 = v62;
            v92 = 2112;
            v93 = v50;
            _os_log_impl(&dword_1CDEBD000, v60, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
          }

        }
        v53 = 0;
        goto LABEL_88;
      }
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("reason"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "isEqualToString:", v70);

      if (v52)
      {
        v53 = v50;
        v7 = v48;
LABEL_88:

        goto LABEL_89;
      }
    }
    v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    v7 = v48;
    if (v46)
      continue;
    break;
  }
LABEL_54:

  _ICQGetLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v91 = v70;
    v17 = "warning: missing appBannerInfo for reason %@";
    v18 = v16;
    v19 = 12;
LABEL_56:
    _os_log_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
  }
LABEL_57:

  v53 = 0;
LABEL_89:
  v33 = v69;
LABEL_90:

  return v53;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1CDF32A00();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

unint64_t _ICQSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (_ICQSignpostGetNanoseconds_onceToken != -1)
    dispatch_once(&_ICQSignpostGetNanoseconds_onceToken, &__block_literal_global_53_0);
  v3 = mach_continuous_time();
  LODWORD(v4) = _ICQSignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_1ED2B9D8C;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

os_signpost_id_t _ICQSignpostCreateWithObject(NSObject *a1, const void *a2)
{
  os_signpost_id_t v2;

  v2 = os_signpost_id_make_with_pointer(a1, a2);
  mach_continuous_time();
  return v2;
}

uint64_t ICQCreateError(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.quota"), a1, 0);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17BBBE8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17BBBF4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_1CDEC535C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1CDEC5514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _ICQSignpostLogSystem()
{
  if (_ICQSignpostLogSystem_onceToken != -1)
    dispatch_once(&_ICQSignpostLogSystem_onceToken, &__block_literal_global_3_0);
  return (id)_ICQSignpostLogSystem_log;
}

id getINDaemonConnectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getINDaemonConnectionClass_softClass_0;
  v7 = getINDaemonConnectionClass_softClass_0;
  if (!getINDaemonConnectionClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getINDaemonConnectionClass_block_invoke_0;
    v3[3] = &unk_1E8B384E8;
    v3[4] = &v4;
    __getINDaemonConnectionClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1CDEC6824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getINDaemonConnectionClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getINDaemonConnectionClass_softClass_1;
  v7 = getINDaemonConnectionClass_softClass_1;
  if (!getINDaemonConnectionClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getINDaemonConnectionClass_block_invoke_1;
    v3[3] = &unk_1E8B384E8;
    v3[4] = &v4;
    __getINDaemonConnectionClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1CDEC68DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!iCloudNotificationLibraryCore_frameworkLibrary)
  {
    iCloudNotificationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!iCloudNotificationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("INDaemonConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getINDaemonConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getINDaemonConnectionClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!iCloudNotificationLibraryCore_frameworkLibrary_0)
  {
    iCloudNotificationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!iCloudNotificationLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("INDaemonConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getINDaemonConnectionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getINDaemonConnectionClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!iCloudNotificationLibraryCore_frameworkLibrary_1)
  {
    iCloudNotificationLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!iCloudNotificationLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("INDaemonConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getINDaemonConnectionClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getINDaemonConnectionClass_block_invoke_2(uint64_t a1)
{
  Class result;
  void *v3;

  if (!iCloudNotificationLibraryCore_frameworkLibrary_2)
  {
    iCloudNotificationLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!iCloudNotificationLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("INDaemonConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getINDaemonConnectionClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getINDaemonConnectionClass_block_invoke_3(uint64_t a1)
{
  Class result;
  void *v3;

  if (!iCloudNotificationLibraryCore_frameworkLibrary_3)
  {
    iCloudNotificationLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!iCloudNotificationLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("INDaemonConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getINDaemonConnectionClass_softClass_3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCKContainerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CloudKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CKContainer");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCKContainerClass_block_invoke_cold_1();
    free(v3);
  }
  getCKContainerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1CDEC7488(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id _ICQStringForKey(void *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _ICQGetLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v3;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "expected NSString from key %@ but got %@", (uint8_t *)&v9, 0x16u);

      }
      v4 = 0;
    }
  }

  return v4;
}

void _ICQServerHeaderGetFormatAndLinks(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v6;
    }
  }
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        _ICQAppendServerMessageFormatAndLinks(*(void **)(*((_QWORD *)&v14 + 1) + 8 * v13++), v7, v8);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if (a2)
    *a2 = (id)objc_msgSend(v7, "copy", (_QWORD)v14);
  if (a3)
    *a3 = (id)objc_msgSend(v8, "copy");

}

void _ICQServerDictToOfferTypeAndLevel(void *a1, unint64_t *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v5 = a1;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offerType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _ICQOfferTypeForServerString(v6);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = _ICQLevelForString(v8);
  if (v7 - 2 < 7)
  {
    v10 = qword_1CDF39168[v7 - 2];
    if (!a2)
      goto LABEL_20;
LABEL_19:
    *a2 = v7;
    goto LABEL_20;
  }
  v11 = v9 - 1;
  if (v7 <= 1)
    v12 = 1;
  else
    v12 = v7;
  if (v9)
    v13 = v9;
  else
    v13 = 0;
  if (v9)
    v12 = v7;
  v14 = v11 >= 3;
  if (v11 >= 3)
    v10 = v13;
  else
    v10 = v9;
  if (v14)
    v7 = v12;
  else
    v7 = 1;
  if (a2)
    goto LABEL_19;
LABEL_20:
  if (a3)
    *a3 = v10;
}

uint64_t _ICQOfferTypeForServerString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (_ICQOfferTypeForServerString_onceToken != -1)
  {
    dispatch_once(&_ICQOfferTypeForServerString_onceToken, &__block_literal_global_28);
    if (v2)
      goto LABEL_3;
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  if (!v1)
    goto LABEL_10;
LABEL_3:
  objc_msgSend((id)_ICQOfferTypeForServerString_sOfferTypeForServerString, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v2;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "_ICQOfferTypeForServerString - illegal server offer type %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

LABEL_11:
  return v5;
}

id _ICQLinksForServerMessageParametersWithOptions(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("cancel")))
          {
            _ICQGetLogSystem();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v9;
              _os_log_debug_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEBUG, "Main links array excludes dismiss link: %@", buf, 0xCu);
            }
          }
          else
          {
            _ICQLinkForServerMessageParameterWithOptions(v9, a2);
            v11 = objc_claimAutoreleasedReturnValue();
            if (v11)
              -[NSObject addObject:](v16, "addObject:", v11);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v12 = v16;
    v13 = -[NSObject copy](v16, "copy");
    v3 = v15;
  }
  else
  {
    if (!v3)
    {
      v13 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_20;
    }
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "links: expected array: invalid server message parameters:%@", buf, 0xCu);
    }
    v13 = (id)MEMORY[0x1E0C9AA60];
  }

LABEL_20:
  return v13;
}

id _ICQLinksForServerMessageParameters(void *a1)
{
  return _ICQLinksForServerMessageParametersWithOptions(a1, 0);
}

id _ICQLinkVisibleKeyForServerMessageParameter(void *a1)
{
  return _ICQBindingsKeyForServerMessageParameterKey(a1, CFSTR("btnVisible"));
}

id _ICQLinkForServerValues(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = v15;
  if (v12 && v14)
  {
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138413058;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "link overrides action in text:%@ action:%@ params:%@ link:%@", (uint8_t *)&v26, 0x2Au);
    }

    goto LABEL_7;
  }
  if (v14)
  {
LABEL_7:
    v18 = 6;
    goto LABEL_8;
  }
  if (_ICQActionForServerActionString(v12))
    v15 = (id)_ICQActionForServerActionString(v12);
  else
    v15 = (id)_ICQActionForString(v12);
  v18 = (uint64_t)v15;
LABEL_8:
  _ICQActionParametersForServerActionParameters((uint64_t)v15, v13, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v16)
  {
    if (v19)
      v21 = (void *)objc_msgSend(v19, "mutableCopy");
    else
      v21 = (void *)objc_opt_new();
    v22 = v21;
    objc_msgSend(v21, "setObject:forKey:", v16, CFSTR("ServerLinkId"));
    v23 = objc_msgSend(v22, "copy");

    v20 = (void *)v23;
  }
  +[ICQLink linkWithText:options:action:parameters:](ICQLink, "linkWithText:options:action:parameters:", v11, a6, v18, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t _ICQLevelForString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (_ICQLevelForString_onceToken != -1)
    dispatch_once(&_ICQLevelForString_onceToken, &__block_literal_global_13);
  objc_msgSend((id)_ICQLevelForString_sLevelForString, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

uint64_t _ICQIsPremiumOfferDictionary(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("isPremiumOffer"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = _ICQBooleanForServerObjectDefault(v2, 0);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t _ICQIsDefaultOfferDictionary(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("isDefaultOffer"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = _ICQBooleanForServerObjectDefault(v2, 0);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t _ICQIsBuddyOfferDictionary(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("isBuddyOffer"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = _ICQBooleanForServerObjectDefault(v2, 0);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t _ICQIntegerFromDictionaryKey(void *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  v7 = a1;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  _ICQObjectForKey(v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  return v10;
}

id _ICQDictionaryForOneOfKeys(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        _ICQDictionaryForKey(v3, *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

id _ICQContainerIDForKnownBundleID(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _ICQInitKnownBundleContainerMappings_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_ICQInitKnownBundleContainerMappings_onceToken, &__block_literal_global_171);
  objc_msgSend((id)sContainerIDForKnownBundleID, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _ICQBundleIDForKnownContainerID(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _ICQInitKnownBundleContainerMappings_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_ICQInitKnownBundleContainerMappings_onceToken, &__block_literal_global_171);
  objc_msgSend((id)sBundleIDForKnownContainerID, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

_ICQBannerSpecification *_ICQBubbleBannerSpecificationForServerDict(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _ICQBannerSpecification *v6;
  objc_class *v7;
  NSObject *v8;
  objc_class *v9;
  int v11;
  const char *Name;
  __int16 v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("bubbleBannerInfo"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v4)
    {
      v6 = 0;
      goto LABEL_13;
    }
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      v11 = 136315394;
      Name = class_getName(v7);
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_11;
  }
  _ICQServerDictionaryForBundleIdentifier(v4, v3, 0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5)
    {
      _ICQGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        v11 = 136315394;
        Name = class_getName(v9);
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v11, 0x16u);
      }

    }
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v6 = -[_ICQBannerSpecification initWithDetailBannerInfo:source:]([_ICQBannerSpecification alloc], "initWithDetailBannerInfo:source:", v5, CFSTR("ICQBannerSourceBubbleBannerInfo"));
LABEL_12:

LABEL_13:
  return v6;
}

id _ICQBindingsKeyForServerMessageParameterKey(void *a1, void *a2)
{
  void *v2;
  void *v3;

  _ICQStringForKey(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("%$")))
  {
    objc_msgSend(v2, "substringFromIndex:", objc_msgSend(CFSTR("%$"), "length"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void _ICQAppendServerMessageFormatAndLinks(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (__CFString *)v5;
LABEL_10:
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "expected message; bad plist object:%@",
        (uint8_t *)&v15,
        0xCu);
    }

    v8 = &stru_1E8B3C468;
    goto LABEL_10;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("format"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_1E8B3C468;
  if (v9)
    v11 = (__CFString *)v9;
  v8 = v11;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("params"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQLinksForServerMessageParametersWithOptions(v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v6, "appendString:", CFSTR("\u2029"));
  objc_msgSend(v6, "appendString:", v8);
  objc_msgSend(v7, "addObjectsFromArray:", v13);

}

id _ICQAlertSpecificationForServerDict(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("alertInfo"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      _ICQAlertSpecificationForServerDict_cold_1(v3);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v1;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "alertInfo: expected NSDictionary, got %@", (uint8_t *)&v5, 0xCu);
    }
LABEL_8:

    v2 = 0;
    goto LABEL_9;
  }
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setServerDict:", v1);
LABEL_9:

  return v2;
}

id _ICQActionParametersForServerActionParameters(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("URL"));
  v24 = v5;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(__CFString **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("buyQueryParams")))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = v7;
          v16 = v14;
          v17 = CFSTR("URLQueryParameters");
          goto LABEL_14;
        }
        if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("linkURL")))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = v7;
          v16 = v14;
          v17 = CFSTR("URL");
          goto LABEL_14;
        }
        if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("openUrl")))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = v7;
          v16 = v14;
          v17 = CFSTR("openURL");
LABEL_14:
          objc_msgSend(v15, "setObject:forKey:", v16, v17);
LABEL_15:

          goto LABEL_16;
        }
        if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("route")))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v18 = v7;
          v19 = v14;
          v20 = CFSTR("route");
LABEL_30:
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v20);
          goto LABEL_15;
        }
        if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("purchaseAttribution")))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v18 = v7;
          v19 = v14;
          v20 = CFSTR("purchaseAttribution");
          goto LABEL_30;
        }
        if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("skipCFU")) & 1) != 0
          || (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("dismissLockScreen")) & 1) != 0
          || -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("zeroCFUAction")))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[__CFString BOOLValue](v14, "BOOLValue"))
            v19 = CFSTR("true");
          else
            v19 = CFSTR("false");
          v18 = v7;
LABEL_29:
          v20 = v13;
          goto LABEL_30;
        }
        if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("amsParams")) & 1) != 0
          || (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("buyParams")) & 1) != 0
          || (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("interruptedBuyErrorCodes")) & 1) != 0
          || (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("userAgentSuffix")) & 1) != 0
          || (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("actionOnActionCompleteURL")) & 1) != 0
          || -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("actionOnActionComplete")))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v18 = v7;
          v19 = v14;
          goto LABEL_29;
        }
LABEL_16:
        ++v12;
      }
      while (v10 != v12);
      v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v10 = v21;
    }
    while (v21);
  }

  v22 = (void *)objc_msgSend(v7, "copy");
  return v22;
}

uint64_t _ICQActionForServerActionString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  if (_ICQActionForServerActionString_onceToken != -1)
    dispatch_once(&_ICQActionForServerActionString_onceToken, &__block_literal_global_38);
  objc_msgSend((id)_ICQActionForServerActionString_actionForServerActionString, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = _ICQActionForString(v1);
  v5 = v4;

  return v5;
}

void sub_1CDECA82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *_ICQStringForAction(uint64_t a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 'd':
      result = CFSTR("ICQActionPresentManageStorage");
      break;
    case 'e':
      result = CFSTR("ICQActionCancel");
      break;
    case 'f':
      result = CFSTR("ICQActionShowInlineAlert");
      break;
    case 'g':
      result = CFSTR("ICQActionOpenPaymentUpdate");
      break;
    case 'h':
      result = CFSTR("ICQActionOpenCloudBackup");
      break;
    case 'i':
      result = CFSTR("ICQActionCloudUpgrade");
      break;
    case 'j':
      result = CFSTR("ICQActionPhotosOptimize");
      break;
    case 'k':
      result = CFSTR("ICQActionPhotosCloudEnable");
      break;
    case 'l':
      result = CFSTR("ICQActionPhotosCloudUpgradeEnable");
      break;
    case 'm':
      result = CFSTR("ICQActionFamilySetup");
      break;
    case 'n':
      result = CFSTR("ICQActionFamilyUsageWithRUI");
      break;
    case 'o':
      result = CFSTR("ICQActionStartFamilySharing");
      break;
    case 'p':
      result = CFSTR("ICQActionLaunchRemoteUI");
      break;
    case 'q':
      result = CFSTR("ICQActionLaunchJITAppKitUI");
      break;
    case 'r':
      result = CFSTR("ICQActionLaunchAMSDynamicUI");
      break;
    case 's':
      result = CFSTR("ICQActionLaunchLiftUI");
      break;
    case 't':
      result = CFSTR("ICQActionCloudUpgradeOslo");
      break;
    case 'u':
      result = CFSTR("ICQActionPhotosCloudUpgradeEnableOslo");
      break;
    case 'v':
      result = CFSTR("ICQActionDirectToOslo");
      break;
    case 'w':
      result = CFSTR("ICQActionLaunchLegacyPurchase");
      break;
    case 'x':
      result = CFSTR("ICQActionLaunchUpgradeFlowWithRUI");
      break;
    case 'y':
      result = CFSTR("ICQActionLaunchUpgradeFlowWithLiftUI");
      break;
    case 'z':
      result = CFSTR("ICQActionLaunchAppleOne");
      break;
    case '{':
      result = CFSTR("ICQActionHTTPCall");
      break;
    case '|':
      result = CFSTR("ICQActionHTTPGETCall");
      break;
    case '}':
      result = CFSTR("ICQActionDismissBanner");
      break;
    case '~':
      result = CFSTR("ICQActionLaunchNativeView");
      break;
    case '\x7F':
      result = CFSTR("ICQActionUpgradeOslo");
      break;
    default:
      switch(a1)
      {
        case 1:
          result = CFSTR("ICQActionDismiss");
          break;
        case 2:
          result = CFSTR("ICQActionRejectOffer");
          break;
        case 3:
          result = CFSTR("ICQActionPresentPurchaseFlow");
          break;
        case 4:
          result = CFSTR("ICQActionPurchaseBuy");
          break;
        case 5:
          result = CFSTR("ICQActionPurchaseComplete");
          break;
        case 6:
          result = CFSTR("ICQActionOpenURL");
          break;
        default:
          result = CFSTR("ICQActionNone");
          break;
      }
      break;
  }
  return result;
}

uint64_t _ICQActionForString(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;

  v1 = a1;
  if (_ICQActionForString_onceToken != -1)
    dispatch_once(&_ICQActionForString_onceToken, &__block_literal_global);
  objc_msgSend((id)_ICQActionForString_sActionForString, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _ICQActionForString_cold_1((uint64_t)v1, v3);

    v2 = &unk_1E8B512E8;
  }
  v4 = objc_msgSend(v2, "integerValue");

  return v4;
}

void sub_1CDECF25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  id *v30;
  uint64_t v31;

  _Block_object_dispose(&a24, 8);
  objc_destroyWeak(v30);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v31 - 184), 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
  objc_destroyWeak((id *)(v31 - 104));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ___isWAPIDevice_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _isWAPIDevice_sIsWAPIDevice = result;
  return result;
}

uint64_t ICQUsedDiskSpaceForVolume(void *a1)
{
  int v1;
  int v2;
  NSObject *v3;
  _QWORD v5[3];
  _QWORD v6[2];

  v5[2] = 0;
  memset(v6, 0, 12);
  v5[0] = 5;
  v5[1] = 2155872256;
  v1 = getattrlist((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), v5, v6, 0xCuLL, 0);
  if (!v1)
    return *(_QWORD *)((char *)v6 + 4);
  v2 = v1;
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    ICQUsedDiskSpaceForVolume_cold_1(v2, v3);

  return 0;
}

void sub_1CDED1F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void *__Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id _ICQUpgradeNowSampleLink()
{
  if (_ICQUpgradeNowSampleLink_onceToken != -1)
    dispatch_once(&_ICQUpgradeNowSampleLink_onceToken, &__block_literal_global_3);
  return (id)_ICQUpgradeNowSampleLink_sUpgradeNowSampleLink;
}

void sub_1CDED70C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void ICQOpenURL(void *a1)
{
  id v1;
  NSObject *v2;
  objc_class *v3;
  __CFString *v4;
  int v5;
  id v6;
  __int16 v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = objc_claimAutoreleasedReturnValue();
    -[NSObject openSensitiveURL:withOptions:](v2, "openSensitiveURL:withOptions:", v1, 0);
  }
  else
  {
    _ICQGetLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (v1)
      {
        v3 = (objc_class *)objc_opt_class();
        NSStringFromClass(v3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = CFSTR("Nil");
      }
      v5 = 138412546;
      v6 = v1;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1CDEBD000, v2, OS_LOG_TYPE_DEFAULT, "attempt to open URL %@ of class %@", (uint8_t *)&v5, 0x16u);
      if (v1)

    }
  }

}

void _ICQOpenPurchaseFlowInSettings()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/STORAGE_UPGRADE"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);

}

void _ICQOpenManageStorageInSettings()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/MANAGE_STORAGE"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);

}

void _ICQOpenFamilySetupInSettings()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=setupFamily&clientAppContext=iCloudStorage"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);

}

void _ICQOpenPrimaryPaymentInSettings()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=PAYMENT_AND_SHIPPING/PRIMARY_PAYMENT"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);

}

void _ICQOpenCloudBackupInSettings()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/BACKUP"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);

}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_2_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1CDEDC700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void _handlePushReceivedDarwinNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___handlePushReceivedDarwinNotification_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void sub_1CDEDD470(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ___handlePushReceivedDarwinNotification_block_invoke(uint64_t a1)
{
  uint64_t *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t *)(a1 + 32);
  v2 = *(id *)(a1 + 32);
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *v1;
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "received push received darwin notification %@", (uint8_t *)&v9, 0xCu);
  }

  if (objc_msgSend(v2, "isEqualToString:", CFSTR("ICQDaemonOfferChangedDueToPushDarwinNotificationRegular")))
  {
    +[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 3;
LABEL_9:
    -[NSObject _handlePushReceivedDarwinNotificationRequestType:](v5, "_handlePushReceivedDarwinNotificationRequestType:", v7);
    goto LABEL_10;
  }
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("ICQDaemonOfferChangedDueToPushDarwinNotificationPremium")))
  {
    +[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 2;
    goto LABEL_9;
  }
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("ICQDaemonOfferChangedDueToPushDarwinNotificationDefault")))
  {
    +[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
    goto LABEL_9;
  }
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    ___handlePushReceivedDarwinNotification_block_invoke_cold_1(v1, v6, v8);
LABEL_10:

}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1CDEDE9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1CDEDF354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

id _ICQModelSpecificLocalizedStringKeyForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v1 = a1;
  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasSuffix:", CFSTR("_SIMULATOR")))
  {
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "rangeOfString:", CFSTR("_SIMULATOR")));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1CDEE055C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CDEE1A20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1CDEE26DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1CDEE33B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDEE5044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1CDEE9D7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *_ICQStringForOfferType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return CFSTR("ICQOfferTypeUnknown");
  else
    return off_1E8B39930[a1 - 1];
}

uint64_t _ICQOfferTypeForString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (_ICQOfferTypeForString_onceToken != -1)
  {
    dispatch_once(&_ICQOfferTypeForString_onceToken, &__block_literal_global_12);
    if (v2)
      goto LABEL_3;
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  if (!v1)
    goto LABEL_10;
LABEL_3:
  objc_msgSend((id)_ICQOfferTypeForString_sOfferTypeForString, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v2;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "_ICQOfferTypeForString - illegal offer type %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

LABEL_11:
  return v5;
}

const __CFString *_ICQStringForLevel(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("None");
  else
    return off_1E8B399E8[a1 - 1];
}

void sub_1CDEF0BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1CDEF2A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

id ICQCreateErrorWithMessage(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = a2;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.quota"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1CDEF44E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1CDEF4770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CDEF4A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CDEF4B6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t PhotoLibraryServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
    PhotoLibraryServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PhotoLibraryServicesLibraryCore_frameworkLibrary;
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getPLPhotoLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PhotoLibraryServicesLibrary();
  result = objc_getClass("PLPhotoLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPLPhotoLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPLPhotoLibraryClass_block_invoke_cold_1();
    return (Class)__getPLGatekeeperClientClass_block_invoke(v3);
  }
  return result;
}

Class __getPLGatekeeperClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
  {
    PhotoLibraryServicesCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PLGatekeeperClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPLGatekeeperClientClass_block_invoke_cold_1();
    free(v3);
  }
  getPLGatekeeperClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_8_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1CDEFCF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CDEFE910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDF00204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _ICQDoesCriterionValueEqualBOOL(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "BOOLValue") ^ a2 ^ 1;
  }
  else
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "criterion: expected BOOL value, got %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  }
  else
  {
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (!SetupAssistantLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1CDF0602C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id _ICQBannerLogSystem()
{
  if (_ICQBannerLogSystem_onceToken != -1)
    dispatch_once(&_ICQBannerLogSystem_onceToken, &__block_literal_global_5);
  return (id)_ICQBannerLogSystem_log;
}

void ICQLogOfferDetailsForServerDictionary(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  id v18;
  char v19;
  NSObject *v20;
  _BOOL4 v21;
  int v22;
  void *v23;
  id v24;
  char v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  id v30;
  char v31;
  NSObject *v32;
  _BOOL4 v33;
  int v34;
  void *v35;
  id v36;
  NSObject *v37;
  _BOOL4 v38;
  const char *v39;
  char v40;
  NSObject *v41;
  _BOOL4 v42;
  int v43;
  void *v44;
  id v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  const char *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  NSObject *v64;
  _BOOL4 v65;
  const char *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t v87[128];
  uint8_t buf[4];
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("offerType"));
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("type"));
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("notificationInfo"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("iTunesAccountExists"));
      v73 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("callbackInterval"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("quotaInfo"));
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("showAlert"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("alertInfo"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("showBanner"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("appBannerInfo"));
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("appContextInfo"));
      v72 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("followUpInfo"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("offerInfo"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("planDetails"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("container"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v89 = (uint64_t)v2;
        _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "offerType: %{public}@", buf, 0xCu);
      }

      _ICQGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v89 = v3;
        _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "type: %{public}@", buf, 0xCu);
      }
      v74 = (void *)v3;

      _ICQGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      v11 = (void *)v6;
      v12 = (void *)v5;
      if (v4)
      {
        v13 = (void *)v73;
        if (!v10)
          goto LABEL_17;
        *(_DWORD *)buf = 138412290;
        v89 = (uint64_t)v4;
        v14 = "notificationInfo: present %@";
        v15 = v9;
        v16 = 12;
      }
      else
      {
        v13 = (void *)v73;
        if (!v10)
          goto LABEL_17;
        *(_WORD *)buf = 0;
        v14 = "notificationInfo: missing";
        v15 = v9;
        v16 = 2;
      }
      _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
LABEL_17:

      if (v13)
      {
        v19 = objc_opt_respondsToSelector();
        _ICQGetLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if ((v19 & 1) != 0)
        {
          if (v21)
          {
            v22 = objc_msgSend(v13, "BOOLValue");
            *(_DWORD *)buf = 67109120;
            LODWORD(v89) = v22;
            _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "iTunesAccountExists: %d", buf, 8u);
          }
        }
        else if (v21)
        {
          v23 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v89 = (uint64_t)v23;
          v24 = v23;
          _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "iTunesAccountExists: unexpected class %@", buf, 0xCu);

        }
      }
      if (v82)
      {
        v25 = objc_opt_respondsToSelector();
        _ICQGetLogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if ((v25 & 1) != 0)
        {
          if (v27)
          {
            objc_msgSend(v82, "doubleValue");
            *(_DWORD *)buf = 134217984;
            v89 = v28;
            _os_log_impl(&dword_1CDEBD000, v26, OS_LOG_TYPE_DEFAULT, "callbackInterval: %g", buf, 0xCu);
          }
        }
        else if (v27)
        {
          v29 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v89 = (uint64_t)v29;
          v30 = v29;
          _os_log_impl(&dword_1CDEBD000, v26, OS_LOG_TYPE_DEFAULT, "callbackInterval: unexpected class %@", buf, 0xCu);

        }
      }
      if (v81)
      {
        v31 = objc_opt_respondsToSelector();
        _ICQGetLogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        if ((v31 & 1) != 0)
        {
          if (v33)
          {
            v34 = objc_msgSend(v81, "BOOLValue");
            *(_DWORD *)buf = 67109120;
            LODWORD(v89) = v34;
            _os_log_impl(&dword_1CDEBD000, v32, OS_LOG_TYPE_DEFAULT, "showAlert: %d", buf, 8u);
          }
        }
        else if (v33)
        {
          v35 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v89 = (uint64_t)v35;
          v36 = v35;
          _os_log_impl(&dword_1CDEBD000, v32, OS_LOG_TYPE_DEFAULT, "showAlert: unexpected class %@", buf, 0xCu);

        }
      }
      _ICQGetLogSystem();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v78)
      {
        if (!v38)
          goto LABEL_44;
        *(_WORD *)buf = 0;
        v39 = "alertInfo: present";
      }
      else
      {
        if (!v38)
          goto LABEL_44;
        *(_WORD *)buf = 0;
        v39 = "alertInfo: missing";
      }
      _os_log_impl(&dword_1CDEBD000, v37, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
LABEL_44:

      if (v80)
      {
        v40 = objc_opt_respondsToSelector();
        _ICQGetLogSystem();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        if ((v40 & 1) != 0)
        {
          if (v42)
          {
            v43 = objc_msgSend(v80, "BOOLValue");
            *(_DWORD *)buf = 67109120;
            LODWORD(v89) = v43;
            _os_log_impl(&dword_1CDEBD000, v41, OS_LOG_TYPE_DEFAULT, "showBanner: %d", buf, 8u);
          }
        }
        else if (v42)
        {
          v44 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v89 = (uint64_t)v44;
          v45 = v44;
          _os_log_impl(&dword_1CDEBD000, v41, OS_LOG_TYPE_DEFAULT, "showBanner: unexpected class %@", buf, 0xCu);

        }
      }
      _ICQGetLogSystem();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      v48 = v12;
      if (v6)
      {
        v49 = (void *)v72;
        if (!v47)
          goto LABEL_57;
        *(_WORD *)buf = 0;
        v50 = "appBannerInfo: present";
      }
      else
      {
        v49 = (void *)v72;
        if (!v47)
          goto LABEL_57;
        *(_WORD *)buf = 0;
        v50 = "appBannerInfo: missing";
      }
      _os_log_impl(&dword_1CDEBD000, v46, OS_LOG_TYPE_DEFAULT, v50, buf, 2u);
LABEL_57:

      v51 = v74;
      if (v49)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v68 = v11;
          v69 = v48;
          v70 = v4;
          v71 = v1;
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v52 = v49;
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v84;
            do
            {
              for (i = 0; i != v54; ++i)
              {
                if (*(_QWORD *)v84 != v55)
                  objc_enumerationMutation(v52);
                v57 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v58 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("appId"));
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "stringWithFormat:", CFSTR("appContextInfo: appId:%@ offerInfo: "), v59);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("offerInfo"));
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  ICQLogDictKeys(v60, v61);

                }
              }
              v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
            }
            while (v54);
          }

          v1 = v71;
          v13 = (void *)v73;
          v51 = v74;
          v48 = v69;
          v4 = v70;
          v11 = v68;
          v49 = (void *)v72;
        }
        _ICQGetLogSystem();
        v62 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
LABEL_74:

          _ICQGetLogSystem();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
          if (v77)
          {
            if (v65)
            {
              *(_WORD *)buf = 0;
              v66 = "followUpInfo: present";
LABEL_79:
              _os_log_impl(&dword_1CDEBD000, v64, OS_LOG_TYPE_DEFAULT, v66, buf, 2u);
            }
          }
          else if (v65)
          {
            *(_WORD *)buf = 0;
            v66 = "followUpInfo: missing";
            goto LABEL_79;
          }

          ICQLogDictKeys(CFSTR("app-independent offerInfo: "), v76);
          ICQLogDictKeys(CFSTR("planDetails: "), v75);
          ICQLogDictKeys(CFSTR("quotaInfo: "), v48);
          if (v79)
          {
            _ICQGetLogSystem();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v89 = (uint64_t)v79;
              _os_log_impl(&dword_1CDEBD000, v67, OS_LOG_TYPE_DEFAULT, "container: %@", buf, 0xCu);
            }

          }
          goto LABEL_85;
        }
        *(_WORD *)buf = 0;
        v63 = "appContextInfo: present";
      }
      else
      {
        _ICQGetLogSystem();
        v62 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          goto LABEL_74;
        *(_WORD *)buf = 0;
        v63 = "appContextInfo: missing";
      }
      _os_log_impl(&dword_1CDEBD000, v62, OS_LOG_TYPE_DEFAULT, v63, buf, 2u);
      goto LABEL_74;
    }
    _ICQGetLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v89 = (uint64_t)v17;
      v18 = v17;
      _os_log_impl(&dword_1CDEBD000, v2, OS_LOG_TYPE_DEFAULT, "event details: unexpected class %@", buf, 0xCu);

    }
  }
  else
  {
    _ICQGetLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v2, OS_LOG_TYPE_DEFAULT, "event details: nil", buf, 2u);
    }
  }
LABEL_85:

}

void ICQLogDictKeys(void *a1, void *a2)
{
  id v3;
  id v4;
  __CFString *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "allKeys");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("missing");
  }
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v7, 0x16u);
  }

}

__CFString *StringFromResponseData(void *a1)
{
  id v1;
  __CFString *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v7;

  v1 = a1;
  if (v1)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v1, 0, &v7);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v1, 4);

      v2 = (__CFString *)v5;
    }
  }
  else
  {
    v2 = CFSTR("<no data>");
  }

  return v2;
}

void ICQLogDataTaskComplete(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    StringFromResponseData(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v7;
    v15 = 2114;
    v16 = v12;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ request completed with data: %{public}@\n\nwith response: %{public}@\n\t\nwith error: %{public}@", (uint8_t *)&v13, 0x2Au);

  }
}

os_signpost_id_t _ICQSignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1;

  v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

id _ICQStringForOneOfKeys(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        _ICQStringForKey(v3, *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

id _ICQArrayForKey(void *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _ICQGetLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v3;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "expected NSDictionary from key %@ but got %@", (uint8_t *)&v9, 0x16u);

      }
      v4 = 0;
    }
  }

  return v4;
}

id _ICQLinkForServerMessageParameter(void *a1)
{
  return _ICQLinkForServerMessageParameterWithOptions(a1, 0);
}

id _ICQLinksForServerActionBasedUniversalLink(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = v1;
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v4)
    {
      v5 = v4;
      v13 = v1;
      v6 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              _ICQLinkForServerMessageParameterWithOptions(v9, 0);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8);

            }
          }
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v5);
      v1 = v13;
    }
  }
  else
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v1;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "universal links: invalid server parameters:%@", buf, 0xCu);
    }
  }

  v11 = (void *)objc_msgSend(v2, "copy");
  return v11;
}

id _ICQMessageWithFormat(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v27;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "length");
  v6 = (void *)objc_opt_new();
  v27 = v5;
  v7 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("%@"), 2, 0, v5);
  v9 = v8;
  v10 = objc_msgSend(v4, "count");
  if (v10)
    v11 = v9;
  else
    v11 = 0;
  if (v10)
    v12 = v7;
  else
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0;
  if (v11)
  {
    v14 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "substringWithRange:", v13, v12 - v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v16);

      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v19);

      if ((objc_msgSend(v15, "options") & 1) != 0)
        objc_msgSend(v6, "appendString:", CFSTR(" >"));
      v13 = v12 + v11;
      ++v14;

      v20 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("%@"), 2, v12 + v11, v27 - (v12 + v11));
      v22 = v21;
      v23 = objc_msgSend(v4, "count");
      if (v14 >= v23)
        v11 = 0;
      else
        v11 = v22;
      if (v14 >= v23)
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v12 = v20;
    }
    while (v11);
  }
  objc_msgSend(v3, "substringFromIndex:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v24);

  v25 = (void *)objc_msgSend(v6, "copy");
  return v25;
}

id _ICQLinkButtonForServerMessage(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("format"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("%@"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 >= 3)
      {
        _ICQGetLogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412290;
          v14 = v5;
          _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "format is \"%@\"; button may not contain more than one \"%%@\"",
            (uint8_t *)&v13,
            0xCu);
        }

      }
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("params"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQLinksForServerMessageParametersWithOptions(v9, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id _ICQMessageForServerHeader(void *a1)
{
  __CFString *v1;
  id v2;
  void *v3;
  id v5;
  __CFString *v6;

  v6 = &stru_1E8B3C468;
  v5 = (id)MEMORY[0x1E0C9AA60];
  _ICQServerHeaderGetFormatAndLinks(a1, &v6, &v5);
  v1 = v6;
  v2 = v5;
  _ICQMessageWithFormat(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t _ICQIsEventOfferDictionary(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("isEventOffer"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = _ICQBooleanForServerObjectDefault(v2, 0);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1CDF093C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CDF0BAFC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A4F8);
  return sub_1CDF32C40();
}

uint64_t sub_1CDF0BB40@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 120))();
  *a2 = result;
  return result;
}

uint64_t sub_1CDF0BB70(id *a1, uint64_t a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))(**(_QWORD **)a2 + 128);
  v4 = *a1;
  return v3(v2);
}

uint64_t sub_1CDF0BBAC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CDF32C70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1CDF0BC1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1CDF32C7C();
}

uint64_t (*sub_1CDF0BC88(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1CDF32C64();
  return sub_1CDF0BD00;
}

uint64_t sub_1CDF0BD04()
{
  return 0;
}

uint64_t sub_1CDF0BD0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 144))();
}

uint64_t sub_1CDF0BD34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A508);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 152))(v5);
}

uint64_t sub_1CDF0BDC0()
{
  return sub_1CDF0C568((uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps, &qword_1EFA5A500);
}

uint64_t sub_1CDF0BDD4(uint64_t a1)
{
  return sub_1CDF0C5E8(a1, &qword_1EFA5A508, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps, &qword_1EFA5A500);
}

uint64_t (*sub_1CDF0BDF0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A508);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A500);
  sub_1CDF32C4C();
  swift_endAccess();
  return sub_1CDF0BEB8;
}

uint64_t sub_1CDF0BEBC()
{
  return sub_1CDF32C40();
}

uint64_t sub_1CDF0BEE8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 168))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1CDF0BF1C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 176))(*a1);
}

uint64_t sub_1CDF0BF48()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CDF32C70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1CDF0BFB8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1CDF32C7C();
}

uint64_t (*sub_1CDF0C024(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1CDF32C64();
  return sub_1CDF0BD00;
}

uint64_t sub_1CDF0C09C()
{
  return 0;
}

uint64_t sub_1CDF0C0A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 192))();
}

uint64_t sub_1CDF0C0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A518);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 200))(v5);
}

uint64_t sub_1CDF0C158()
{
  return sub_1CDF0C568((uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError, &qword_1EFA5A510);
}

uint64_t sub_1CDF0C16C(uint64_t a1)
{
  return sub_1CDF0C5E8(a1, &qword_1EFA5A518, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError, &qword_1EFA5A510);
}

uint64_t (*sub_1CDF0C188(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A518);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A510);
  sub_1CDF32C4C();
  swift_endAccess();
  return sub_1CDF0BEB8;
}

uint64_t sub_1CDF0C250()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A520);
  return sub_1CDF32C40();
}

uint64_t sub_1CDF0C294@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 216))();
  *a2 = result;
  return result;
}

uint64_t sub_1CDF0C2C4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 224);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1CDF0C2F4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CDF32C70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1CDF0C364()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1CDF32C7C();
}

uint64_t (*sub_1CDF0C3D0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1CDF32C64();
  return sub_1CDF0BD00;
}

void sub_1CDF0C448(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_1CDF0C494()
{
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1CDF0C4A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 240))();
}

uint64_t sub_1CDF0C4C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A530);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 248))(v5);
}

uint64_t sub_1CDF0C554()
{
  return sub_1CDF0C568((uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath, &qword_1EFA5A528);
}

uint64_t sub_1CDF0C568(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_1CDF32C4C();
  return swift_endAccess();
}

uint64_t sub_1CDF0C5CC(uint64_t a1)
{
  return sub_1CDF0C5E8(a1, &qword_1EFA5A530, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath, &qword_1EFA5A528);
}

uint64_t sub_1CDF0C5E8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_1CDF32C58();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_1CDF0C6C0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A530);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A528);
  sub_1CDF32C4C();
  swift_endAccess();
  return sub_1CDF0BEB8;
}

void sub_1CDF0C788(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1CDF32C58();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_1CDF32C58();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

id StorageAppsModel.account.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_account);
}

uint64_t sub_1CDF0C8B0()
{
  return 0;
}

char *StorageAppsModel.__allocating_init(account:)(void *a1)
{
  char *v2;

  swift_allocObject();
  v2 = sub_1CDF0DC8C(a1);

  return v2;
}

char *StorageAppsModel.init(account:)(void *a1)
{
  char *v2;

  v2 = sub_1CDF0DC8C(a1);

  return v2;
}

char *StorageAppsModel.deinit()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v1 = v0;
  type metadata accessor for DarwinRegistrar();
  type metadata accessor for StorageAppsModel();
  sub_1CDF16F98(v0);
  v2 = &v0[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A500);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = &v1[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A510);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = &v1[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A528);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

  swift_bridgeObjectRelease();
  return v1;
}

uint64_t StorageAppsModel.__deallocating_deinit()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v1 = v0;
  type metadata accessor for DarwinRegistrar();
  type metadata accessor for StorageAppsModel();
  sub_1CDF16F98(v0);
  v2 = &v0[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A500);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = &v1[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A510);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = &v1[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A528);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1CDF0CB08()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)v0 + 304))(0, 0);
}

void sub_1CDF0CB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[6];

  (*(void (**)(_QWORD))(*(_QWORD *)v2 + 176))(0);
  v5 = objc_msgSend(objc_allocWithZone((Class)ICQCloudStorageDataController), sel_initWithAccount_, *(_QWORD *)(v2 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_account));
  v6 = swift_allocObject();
  swift_weakInit();
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  v9[4] = sub_1CDF0DF54;
  v9[5] = v7;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1CDF0CE8C;
  v9[3] = &block_descriptor;
  v8 = _Block_copy(v9);
  sub_1CDF0DF60(a1);
  swift_release();
  objc_msgSend(v5, sel_fetchStorageAppsWithCompletion_, v8);
  _Block_release(v8);

}

uint64_t sub_1CDF0CC4C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v10 = sub_1CDF32C94();
  v25 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1CDF32CAC();
  v23 = *(_QWORD *)(v13 - 8);
  v24 = v13;
  MEMORY[0x1E0C80A78]();
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CDF0E874(0, &qword_1EFA5A700);
  v22 = sub_1CDF32E68();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a1;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = a5;
  aBlock[4] = sub_1CDF0E8F0;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CDF0CE60;
  aBlock[3] = &block_descriptor_19;
  v17 = _Block_copy(aBlock);
  v18 = a2;
  v19 = a1;
  swift_retain();
  sub_1CDF0DF60(a4);
  swift_release();
  sub_1CDF32CA0();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1CDF0EA74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A710);
  sub_1CDF0EABC();
  sub_1CDF32EEC();
  v20 = (void *)v22;
  MEMORY[0x1D17BB144](0, v15, v12, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v15, v24);
}

uint64_t sub_1CDF0CE60(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1CDF0CE8C(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_1CDF0CF00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *);
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t *);
  void (*v36)(uint64_t *, _QWORD);
  id v37;
  unint64_t v38;
  void *v39;
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  id v44;
  void (*v45)(uint64_t *, _QWORD);
  _QWORD *v46;
  _QWORD *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  _QWORD *v51;
  uint64_t v52;
  char *v53;
  void (*v54)(char *);
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[4];

  v3 = v2;
  v6 = sub_1CDF32C1C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v57 = (char *)&v52 - v12;
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v52 - v13;
  v15 = sub_1CDF27238();
  v16 = *(void (**)(char *))(v7 + 16);
  v58 = v15;
  v16(v14);
  swift_bridgeObjectRetain_n();
  v17 = sub_1CDF32C10();
  v18 = sub_1CDF32E5C();
  v19 = os_log_type_enabled(v17, v18);
  v59 = a1;
  if (v19)
  {
    v52 = v7;
    v20 = swift_slowAlloc();
    v56 = v3;
    v54 = v16;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc();
    v53 = v10;
    v23 = v22;
    v61[0] = v22;
    *(_DWORD *)v21 = 136315138;
    if (!a2)
      a1 = 7104878;
    v55 = v6;
    if (a2)
      v24 = a2;
    else
      v24 = 0xE300000000000000;
    swift_bridgeObjectRetain();
    v60 = sub_1CDF0D64C(a1, v24, v61);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease_n();
    v6 = v55;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CDEBD000, v17, v18, "Manage Storage navigation to bundleId: %s!", v21, 0xCu);
    swift_arrayDestroy();
    v25 = v23;
    v10 = v53;
    MEMORY[0x1D17BBC9C](v25, -1, -1);
    v26 = v21;
    v16 = v54;
    v3 = v56;
    MEMORY[0x1D17BBC9C](v26, -1, -1);

    v27 = *(uint64_t (**)(char *, uint64_t))(v52 + 8);
    v28 = v27(v14, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v27 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    v28 = v27(v14, v6);
  }
  v29 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 120))(v28);
  if (v29)
  {
    v30 = (void *)v29;
    v31 = (_QWORD *)(v3 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId);
    *v31 = 0;
    v31[1] = 0;
    v32 = swift_bridgeObjectRelease();
    v33 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 216))(v32);
    if (v33 >> 62)
      v34 = sub_1CDF32F4C();
    else
      v34 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
    v35 = *(uint64_t (**)(uint64_t *))(*(_QWORD *)v3 + 232);
    v36 = (void (*)(uint64_t *, _QWORD))v35(v61);
    sub_1CDF0D44C(v34);
    v36(v61, 0);
    if (!a2)
      goto LABEL_19;
    v37 = objc_msgSend(v30, sel_apps);
    sub_1CDF0E874(0, &qword_1EFA5A538);
    v38 = sub_1CDF32D78();

    swift_bridgeObjectRetain();
    v39 = sub_1CDF0E278(v38, v59, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v39)
    {
      v40 = v57;
      ((void (*)(char *, uint64_t, uint64_t))v16)(v57, v58, v6);
      v41 = sub_1CDF32C10();
      v42 = sub_1CDF32E5C();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1CDEBD000, v41, v42, "Manage Storage navigation found matching bundleId", v43, 2u);
        MEMORY[0x1D17BBC9C](v43, -1, -1);
      }

      v27(v40, v6);
      v44 = objc_msgSend(v39, sel_action);
      v45 = (void (*)(uint64_t *, _QWORD))v35(v61);
      v47 = v46;
      MEMORY[0x1D17BB030]();
      if (*(_QWORD *)((*v47 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v47 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1CDF32D9C();
      sub_1CDF32DA8();
      sub_1CDF32D90();
      v45(v61, 0);

    }
    else
    {
LABEL_19:

    }
  }
  else
  {
    ((void (*)(char *, uint64_t, uint64_t))v16)(v10, v58, v6);
    v48 = sub_1CDF32C10();
    v49 = sub_1CDF32E5C();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_1CDEBD000, v48, v49, "No storage apps, delaying navigation until request returns", v50, 2u);
      MEMORY[0x1D17BBC9C](v50, -1, -1);
    }

    v27(v10, v6);
    v51 = (_QWORD *)(v3 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId);
    *v51 = v59;
    v51[1] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1CDF0D44C(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    if (result < 0)
    {
      __break(1u);
    }
    else if (!(*v1 >> 62))
    {
      v3 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      v4 = -v3;
      if (!__OFSUB__(0, v3))
        goto LABEL_5;
      goto LABEL_17;
    }
    swift_bridgeObjectRetain();
    v3 = sub_1CDF32F4C();
    result = swift_bridgeObjectRelease();
    v4 = -v3;
    if (!__OFSUB__(0, v3))
    {
LABEL_5:
      v5 = -v2;
      if (v4 <= 0 && v4 > v5)
        goto LABEL_20;
      result = v3 - v2;
      if (!__OFADD__(v3, v5))
      {
        if (v3 >= result)
          return sub_1CDF0DF70(result, v3);
        goto LABEL_19;
      }
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      return result;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  return result;
}

uint64_t sub_1CDF0D50C()
{
  uint64_t v0;
  void (*v1)(_BYTE *, _QWORD);
  _QWORD *v2;
  _QWORD *v3;
  _BYTE v5[32];

  v1 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v0 + 232))(v5);
  *v2 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
  v1(v5, 0);
  v3 = (_QWORD *)(v0 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId);
  *v3 = 0;
  v3[1] = 0;
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)v0 + 128))(0);
}

void *sub_1CDF0D588(void *result, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  void (*v7)(uint64_t);
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  if (a2)
  {
    v7 = *(void (**)(uint64_t))(*(_QWORD *)a2 + 296);
    v8 = result;
    v9 = a3;
    v10 = a5;
    v11 = swift_retain();
    v7(v11);

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1CDF0D604@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StorageAppsModel();
  result = sub_1CDF32C34();
  *a1 = result;
  return result;
}

uint64_t sub_1CDF0D640(uint64_t *a1, uint64_t *a2)
{
  return _s11iCloudQuota16StorageAppsModelC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_1CDF0D64C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1CDF0D71C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1CDF0E834((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1CDF0E834((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1CDF0D71C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1CDF32ED4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1CDF0D8D4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1CDF32F34();
  if (!v8)
  {
    sub_1CDF32F40();
    __break(1u);
LABEL_17:
    result = sub_1CDF32F7C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1CDF0D8D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1CDF0D968(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CDF0DB40(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1CDF0DB40(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1CDF0D968(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1CDF0DADC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1CDF32F10();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1CDF32F40();
      __break(1u);
LABEL_10:
      v2 = sub_1CDF32D3C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1CDF32F7C();
    __break(1u);
LABEL_14:
    result = sub_1CDF32F40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1CDF0DADC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFA5B1A0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1CDF0DB40(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFA5B1A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1CDF32F7C();
  __break(1u);
  return result;
}

char *sub_1CDF0DC8C(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  v2 = v1;
  v26 = a1;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A528);
  v3 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A510);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A500);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78]();
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = &v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps];
  v27 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A4F8);
  sub_1CDF32C40();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  v15 = &v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError];
  LOBYTE(v27) = 0;
  sub_1CDF32C40();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v9, v6);
  v16 = &v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath];
  v27 = MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A520);
  sub_1CDF32C40();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v16, v5, v25);
  v17 = &v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v18 = v26;
  *(_QWORD *)&v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_account] = v26;
  type metadata accessor for DarwinRegistrar();
  v19 = v18;
  v20 = (uint64_t *)sub_1CDF16D30();
  v21 = *v20;
  v22 = v20[1];
  type metadata accessor for StorageAppsModel();
  swift_bridgeObjectRetain();
  sub_1CDF16D58(v2, v21, v22, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_1CDF0D588);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t type metadata accessor for StorageAppsModel()
{
  uint64_t result;

  result = qword_1EFA5B640;
  if (!qword_1EFA5B640)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CDF0DEFC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CDF0DF20()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF0DF54(void *a1, void *a2)
{
  uint64_t *v2;

  return sub_1CDF0CC4C(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_1CDF0DF60(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1CDF0DF70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_1CDF32F4C();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_1CDF32F4C();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_1CDF32F4C();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x1D17BB1F8](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_1CDF0E874(0, &qword_1EFA5A6F8);
  swift_arrayDestroy();
  if (!v5)
    return sub_1CDF32D90();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_1CDF32F4C();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_1CDF32D90();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_1CDF32F4C();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_1CDF32F7C();
  __break(1u);
  return result;
}

void *sub_1CDF0E278(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char **v9;
  id v10;
  void *v11;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v5 = a1;
  if (a1 >> 62)
    goto LABEL_30;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_1CDF32F4C())
  {
    v7 = 0;
    v8 = v5 & 0xC000000000000001;
    v21 = v5 + 32;
    v9 = &selRef_setRequestedServerUIURL_;
    v22 = v5 & 0xC000000000000001;
    v23 = v5;
    while (1)
    {
      v10 = v8 ? (id)MEMORY[0x1D17BB1EC](v7, v5) : *(id *)(v21 + 8 * v7);
      v11 = v10;
      if (__OFADD__(v7++, 1))
        break;
      v13 = objc_msgSend(v10, v9[494]);
      v14 = (_QWORD *)sub_1CDF32D78();

      v15 = v14[2];
      if (v15)
      {
        v16 = v14[4] == a2 && v14[5] == a3;
        if (v16 || (sub_1CDF32FF4() & 1) != 0)
        {
LABEL_27:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v11;
        }
        if (v15 != 1)
        {
          v17 = v14 + 7;
          v18 = 1;
          while (1)
          {
            v5 = v18 + 1;
            if (__OFADD__(v18, 1))
              break;
            v19 = *(v17 - 1) == a2 && *v17 == a3;
            if (v19 || (sub_1CDF32FF4() & 1) != 0)
              goto LABEL_27;
            v17 += 2;
            ++v18;
            if (v5 == v15)
              goto LABEL_4;
          }
          __break(1u);
          break;
        }
LABEL_4:

        swift_bridgeObjectRelease();
        v8 = v22;
        v5 = v23;
        v9 = &selRef_setRequestedServerUIURL_;
        if (v7 == v6)
          goto LABEL_31;
      }
      else
      {

        swift_bridgeObjectRelease();
        if (v7 == v6)
          goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t _s11iCloudQuota16StorageAppsModelC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;

  v3 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)a1 + 120))();
  v4 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)a2 + 120))();
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      sub_1CDF0E874(0, &qword_1EFA5A6F0);
      v6 = v3;
      v7 = sub_1CDF32E98();

      if ((v7 & 1) == 0)
        return 0;
LABEL_7:
      sub_1CDF0E874(0, (unint64_t *)&qword_1EFA5A6E8);
      return sub_1CDF32E98() & 1;
    }

  }
  else
  {
    if (!v4)
      goto LABEL_7;

  }
  return 0;
}

uint64_t sub_1CDF0E56C()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_1CDF0E578()
{
  return type metadata accessor for StorageAppsModel();
}

void sub_1CDF0E580()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1CDF0E7C8(319, &qword_1EFA5A568, &qword_1EFA5A4F8);
  if (v0 <= 0x3F)
  {
    sub_1CDF0E774();
    if (v1 <= 0x3F)
    {
      sub_1CDF0E7C8(319, qword_1EFA5A578, &qword_1EFA5A520);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for StorageAppsModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StorageAppsModel.storageApps.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of StorageAppsModel.storageApps.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of StorageAppsModel.storageApps.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of StorageAppsModel.$storageApps.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of StorageAppsModel.$storageApps.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of StorageAppsModel.$storageApps.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of StorageAppsModel.didError.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of StorageAppsModel.didError.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of StorageAppsModel.didError.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of StorageAppsModel.$didError.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of StorageAppsModel.$didError.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of StorageAppsModel.$didError.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of StorageAppsModel.navigationPath.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of StorageAppsModel.navigationPath.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of StorageAppsModel.navigationPath.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of StorageAppsModel.$navigationPath.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of StorageAppsModel.$navigationPath.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of StorageAppsModel.$navigationPath.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of StorageAppsModel.__allocating_init(account:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of StorageAppsModel.fetchCloudStorageApps()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of StorageAppsModel.fetchCloudStorageApps(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of StorageAppsModel.navigateTo(bundleId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of StorageAppsModel.reset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

void sub_1CDF0E774()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EFA5A570)
  {
    v0 = sub_1CDF32C88();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EFA5A570);
  }
}

void sub_1CDF0E7C8(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_1CDF32C88();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1CDF0E834(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CDF0E874(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1CDF0E8AC()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 40))
    swift_release();
  return swift_deallocObject();
}

void sub_1CDF0E8F0()
{
  _QWORD *v0;
  void *v1;
  BOOL v2;
  uint64_t Strong;
  void (*v4)(uint64_t);
  uint64_t v5;
  void (*v6)(void *);
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = (void *)v0[3];
  if (v0[2])
    v2 = 1;
  else
    v2 = v1 == 0;
  if (v2)
  {
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)Strong + 176))(1);
      swift_release();
    }
  }
  else
  {
    v4 = (void (*)(uint64_t))v0[5];
    swift_beginAccess();
    v5 = swift_weakLoadStrong();
    if (v5)
    {
      v6 = *(void (**)(void *))(*(_QWORD *)v5 + 128);
      v7 = v1;
      v6(v1);
      swift_release();
    }
    else
    {
      v8 = v1;
    }
    swift_beginAccess();
    v9 = swift_weakLoadStrong();
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId);
      v11 = *(_QWORD *)(v9 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId + 8);
      swift_bridgeObjectRetain();
      v9 = swift_release();
      if (v11)
      {
        swift_beginAccess();
        v12 = swift_weakLoadStrong();
        if (v12)
        {
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 312))(v10, v11);
          swift_release();
        }
        v9 = swift_bridgeObjectRelease();
      }
    }
    if (v4)
      v4(v9);

  }
}

unint64_t sub_1CDF0EA74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFA5A708;
  if (!qword_1EFA5A708)
  {
    v1 = sub_1CDF32C94();
    result = MEMORY[0x1D17BBC00](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EFA5A708);
  }
  return result;
}

unint64_t sub_1CDF0EABC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFA5A718;
  if (!qword_1EFA5A718)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFA5A710);
    result = MEMORY[0x1D17BBC00](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, &qword_1EFA5A718);
  }
  return result;
}

void sub_1CDF0EB08()
{
  swift_deletedMethodError();
  __break(1u);
}

BOOL static RecommendationsDataFetcher.FetchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RecommendationsDataFetcher.FetchError.hash(into:)()
{
  return sub_1CDF33054();
}

uint64_t RecommendationsDataFetcher.FetchError.hashValue.getter()
{
  sub_1CDF33048();
  sub_1CDF33054();
  return sub_1CDF33060();
}

BOOL sub_1CDF0EBA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1CDF0EBBC()
{
  sub_1CDF33048();
  sub_1CDF33054();
  return sub_1CDF33060();
}

uint64_t sub_1CDF0EC00()
{
  return sub_1CDF33054();
}

uint64_t sub_1CDF0EC28()
{
  sub_1CDF33048();
  sub_1CDF33054();
  return sub_1CDF33060();
}

id sub_1CDF0EC78()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for RecommendationsDataFetcher()), sel_init);
  qword_1EFA5B658 = (uint64_t)result;
  return result;
}

id RecommendationsDataFetcher.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t *sub_1CDF0ECC4()
{
  if (qword_1EFA5B650 != -1)
    swift_once();
  return &qword_1EFA5B658;
}

id static RecommendationsDataFetcher.shared.getter()
{
  if (qword_1EFA5B650 != -1)
    swift_once();
  return (id)qword_1EFA5B658;
}

uint64_t sub_1CDF0ED84()
{
  uint64_t v0;

  type metadata accessor for DataFetchers();
  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = sub_1CDF11264(MEMORY[0x1E0DEE9D8]);
  return v0;
}

uint64_t type metadata accessor for DataFetchers()
{
  return objc_opt_self();
}

uint64_t sub_1CDF0EDE8(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  _DWORD v13[4];

  v3 = sub_1CDF32C1C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_aa_isPrimaryAccount)
    && !objc_msgSend(a1, sel_aa_isManagedAppleID))
  {
    return (*(uint64_t (**)(void *, _QWORD, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x60))(a1, 0, 0);
  }
  v7 = sub_1CDF27238();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = a1;
  v9 = sub_1CDF32C10();
  v10 = sub_1CDF32E44();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    *(_DWORD *)v11 = 67109376;
    v13[3] = -[NSObject aa_isPrimaryAccount](v8, sel_aa_isPrimaryAccount);
    sub_1CDF32EC8();
    *(_WORD *)(v11 + 8) = 1024;
    v13[2] = -[NSObject aa_isManagedAppleID](v8, sel_aa_isManagedAppleID);
    sub_1CDF32EC8();

    _os_log_impl(&dword_1CDEBD000, v9, v10, "Recommendations for account type isPrimary: %{BOOL}d isMAID: %{BOOL}d, is not supported. Bailing.", (uint8_t *)v11, 0xEu);
    MEMORY[0x1D17BBC9C](v11, -1, -1);
  }
  else
  {

    v9 = v8;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1CDF0F038(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint8_t *v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  id v27;
  uint64_t v29;
  void *v30;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CDF32C1C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1CDF27238();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  v16 = sub_1CDF32C10();
  v17 = sub_1CDF32E44();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v30 = v4;
    v19 = a1;
    v20 = a2;
    v21 = a3;
    v22 = v18;
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1CDEBD000, v16, v17, "Clearing recommendations cache", v18, 2u);
    v23 = v22;
    a3 = v21;
    a2 = v20;
    a1 = v19;
    v4 = v30;
    MEMORY[0x1D17BBC9C](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v24 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v10, 1, 1, v24);
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = v4;
  v25[5] = a1;
  v25[6] = a2;
  v25[7] = a3;
  v26 = v4;
  v27 = a1;
  sub_1CDF0DF60(a2);
  sub_1CDF1009C((uint64_t)v10, (uint64_t)&unk_1EFA5A728, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_1CDF0F220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[334] = a7;
  v7[333] = a6;
  v7[332] = a5;
  v7[331] = a4;
  return swift_task_switch();
}

uint64_t sub_1CDF0F244()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 2680) = *(_QWORD *)(*(_QWORD *)(v0 + 2648)
                                     + OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers);
  return swift_task_switch();
}

id sub_1CDF0F268()
{
  uint64_t v0;
  id v1;
  id result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(v0 + 2656), sel_aa_altDSID);
  if (v1
    || (result = objc_msgSend(*(id *)(v0 + 2656), sel_aa_personID),
        (v1 = result) != 0))
  {
    v3 = sub_1CDF32D24();
    v5 = v4;

    swift_beginAccess();
    sub_1CDF16020(v3, v5);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_release();
    return (id)swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CDF0F34C()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v16;

  v16 = v0[333];
  v1 = (void *)v0[332];
  v2 = (void *)v0[331];
  v3 = swift_allocObject();
  v0[336] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = v2;
  v5 = v1;
  swift_retain();
  sub_1CDF0E874(255, &qword_1EFA5AB00);
  swift_asyncLet_begin();
  v6 = swift_allocObject();
  v0[337] = v6;
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = v4;
  v8 = v5;
  swift_retain();
  swift_asyncLet_begin();
  v9 = swift_allocObject();
  v0[338] = v9;
  *(_QWORD *)(v9 + 16) = v7;
  *(_QWORD *)(v9 + 24) = v8;
  v10 = v7;
  v11 = v8;
  swift_retain();
  sub_1CDF0E874(255, &qword_1EFA5AB18);
  swift_asyncLet_begin();
  v12 = swift_allocObject();
  v0[339] = v12;
  *(_QWORD *)(v12 + 16) = v10;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = v10;
  v14 = v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFA5AAA0);
  swift_asyncLet_begin();
  if (v16)
    return swift_asyncLet_get_throwing();
  else
    return swift_asyncLet_finish();
}

uint64_t sub_1CDF0F5B8()
{
  uint64_t v0;
  _QWORD *v1;
  void *v3;
  id v4;

  v1[340] = v0;
  if (v0)
    return swift_asyncLet_finish();
  v3 = (void *)v1[329];
  v1[341] = v3;
  v4 = v3;
  return swift_asyncLet_get_throwing();
}

uint64_t sub_1CDF0F640()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 2736) = v0;
  return swift_task_switch();
}

uint64_t sub_1CDF0F668()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(void *, void *, _QWORD);
  void *v3;
  id v4;

  v1 = (void *)v0[341];
  v2 = (void (*)(void *, void *, _QWORD))v0[333];
  v3 = (void *)v0[330];
  v4 = v3;
  v2(v1, v3, 0);

  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0F6F4()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0F708()
{
  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0F720()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0F734()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0F788()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0F79C()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0F7F0()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0F804()
{
  uint64_t v0;

  swift_release_n();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF0F864()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0F878()
{
  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0F890()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0F8A4()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0F8F8()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0F90C()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0F960()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0F974()
{
  uint64_t v0;
  void *v1;
  void (*v2)(_QWORD, _QWORD, void *);
  id v3;

  v1 = *(void **)(v0 + 2720);
  v2 = *(void (**)(_QWORD, _QWORD, void *))(v0 + 2664);
  swift_release();
  v3 = v1;
  v2(0, 0, v1);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF0FA20()
{
  uint64_t v0;

  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0FA74()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0FA88()
{
  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0FAA0()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0FAB4()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0FB08()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0FB1C()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_1CDF0FB70()
{
  return swift_task_switch();
}

uint64_t sub_1CDF0FB84()
{
  uint64_t v0;
  void *v1;
  void (*v2)(_QWORD, _QWORD, void *);
  id v3;

  v1 = *(void **)(v0 + 2736);
  v2 = *(void (**)(_QWORD, _QWORD, void *))(v0 + 2664);
  swift_release();
  v3 = v1;
  v2(0, 0, v1);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF0FC30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF0FC4C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_1CDF0FC70()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = sub_1CDF11494(*(void **)(v0 + 32));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_1CDF0FCE0;
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = 0;
  return swift_task_switch();
}

uint64_t sub_1CDF0FCE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF0FD54()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF0FD90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF0FDAC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_1CDF0FDD0()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = sub_1CDF11494(*(void **)(v0 + 32));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_1CDF0FE40;
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = 0;
  return swift_task_switch();
}

uint64_t sub_1CDF0FE40(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF0FEB4()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF0FEF0()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 72);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF0FF08()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF0FF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF0FF58()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_1CDF0FF7C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = sub_1CDF11494(*(void **)(v0 + 32));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_1CDF0FCE0;
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = 0;
  return swift_task_switch();
}

uint64_t sub_1CDF0FFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF10008()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_1CDF1002C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = sub_1CDF11494(*(void **)(v0 + 32));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_1CDF0FCE0;
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = 0;
  return swift_task_switch();
}

uint64_t sub_1CDF1009C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1CDF32DF0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1CDF32DE4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1CDF16A0C(a1, &qword_1ED2B9B68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CDF32DC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_1CDF10288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  if (a3)
    v7 = sub_1CDF32994();
  else
    v7 = 0;
  v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);

}

uint64_t sub_1CDF102F0(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_1CDF10BDC(a1, a2, a3, a4, (uint64_t)&unk_1E8B3A6B8, (void (*)(uint64_t, uint64_t))sub_1CDF16CEC, (uint64_t)&unk_1EFA5A738);
}

uint64_t sub_1CDF1030C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = a8;
  *(_BYTE *)(v8 + 88) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1CDF1032C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_1CDF10350()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_1CDF11494(*(void **)(v0 + 24));
  *(_QWORD *)(v0 + 56) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_1CDF103C8;
  v3 = *(_BYTE *)(v0 + 88);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_1CDF103C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CDF10434()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF10470()
{
  uint64_t v0;
  void (*v1)(void *, _QWORD);
  void *v2;
  id v3;

  v1 = *(void (**)(void *, _QWORD))(v0 + 32);
  v2 = *(void **)(v0 + 72);
  if (v1)
  {
    v3 = v2;
    v1(v2, 0);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF104CC()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF10660(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_1CDF10BDC(a1, a2, a3, a4, (uint64_t)&unk_1E8B3A6E0, (void (*)(uint64_t, uint64_t))sub_1CDF16CEC, (uint64_t)&unk_1EFA5A748);
}

uint64_t sub_1CDF1067C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = a8;
  *(_BYTE *)(v8 + 88) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1CDF1069C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_1CDF106C0()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_1CDF11494(*(void **)(v0 + 24));
  *(_QWORD *)(v0 + 56) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_1CDF10738;
  v3 = *(_BYTE *)(v0 + 88);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_1CDF10738(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CDF107A4()
{
  swift_release();
  return swift_task_switch();
}

void sub_1CDF10938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1CDF32994();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_1CDF10990(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_1CDF10BDC(a1, a2, a3, a4, (uint64_t)&unk_1E8B3A708, (void (*)(uint64_t, uint64_t))sub_1CDF16CEC, (uint64_t)&unk_1EFA5A758);
}

uint64_t sub_1CDF109AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = a8;
  *(_BYTE *)(v8 + 88) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1CDF109CC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_1CDF109F0()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_1CDF11494(*(void **)(v0 + 24));
  *(_QWORD *)(v0 + 56) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_1CDF10738;
  v3 = *(_BYTE *)(v0 + 88);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_1CDF10BC0(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_1CDF10BDC(a1, a2, a3, a4, (uint64_t)&unk_1E8B3A730, (void (*)(uint64_t, uint64_t))sub_1CDF0DF60, (uint64_t)&unk_1EFA5A768);
}

uint64_t sub_1CDF10BDC(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t), uint64_t a7)
{
  void *v7;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v22;

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  *(_QWORD *)(v18 + 32) = v7;
  *(_QWORD *)(v18 + 40) = a1;
  *(_BYTE *)(v18 + 48) = a2;
  *(_QWORD *)(v18 + 56) = a3;
  *(_QWORD *)(v18 + 64) = a4;
  v19 = v7;
  v20 = a1;
  a6(a3, a4);
  sub_1CDF1009C((uint64_t)v16, a7, v18);
  return swift_release();
}

uint64_t sub_1CDF10CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = a8;
  *(_BYTE *)(v8 + 88) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1CDF10CFC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_1CDF10D20()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_1CDF11494(*(void **)(v0 + 24));
  *(_QWORD *)(v0 + 56) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_1CDF10D98;
  v3 = *(_BYTE *)(v0 + 88);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_1CDF10D98(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CDF10E04()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF10E40()
{
  uint64_t v0;
  void (*v1)(_QWORD, _QWORD);

  v1 = *(void (**)(_QWORD, _QWORD))(v0 + 32);
  if (v1)
    v1(*(_QWORD *)(v0 + 72), 0);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF10E8C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF10EC8()
{
  uint64_t v0;
  void (*v1)(_QWORD, void *);
  void *v2;
  id v3;

  v1 = *(void (**)(_QWORD, void *))(v0 + 32);
  v2 = *(void **)(v0 + 80);
  if (v1)
  {
    v3 = v2;
    v1(0, v2);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1CDF11084(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = a1;
  if (a1)
  {
    sub_1CDF0E874(0, &qword_1EFA5AAA8);
    v5 = (void *)sub_1CDF32D6C();
  }
  if (a2)
    v6 = sub_1CDF32994();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

id RecommendationsDataFetcher.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers;
  type metadata accessor for DataFetchers();
  v2 = swift_allocObject();
  v3 = v0;
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = sub_1CDF11264(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)&v0[v1] = v2;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for RecommendationsDataFetcher();
  return objc_msgSendSuper2(&v5, sel_init);
}

id RecommendationsDataFetcher.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RecommendationsDataFetcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1CDF11264(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AB30);
  v2 = (_QWORD *)sub_1CDF32F70();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    result = sub_1CDF15BB0(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CDF1137C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAC8);
  v2 = (_QWORD *)sub_1CDF32F70();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_1CDF15BB0(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_1CDF11494(void *a1)
{
  uint64_t v1;
  id v3;
  id result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v24;

  v3 = objc_msgSend(a1, sel_aa_altDSID);
  if (v3 || (result = objc_msgSend(a1, sel_aa_personID), (v3 = result) != 0))
  {
    v5 = sub_1CDF32D24();
    v7 = v6;

    v8 = (uint64_t *)(v1 + 112);
    swift_beginAccess();
    v9 = *(_QWORD *)(v1 + 112);
    if (*(_QWORD *)(v9 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v10 = sub_1CDF15BB0(v5, v7);
      if ((v11 & 1) != 0)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v10);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        return (id)v12;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    type metadata accessor for DataFetcher();
    v12 = swift_allocObject();
    v13 = a1;
    swift_defaultActor_initialize();
    v14 = v12 + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedRecommendations;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A908);
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
    v16(v14, 1, 1, v15);
    v17 = v12
        + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedClientRecommendations;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A918);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
    v16(v12+ OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedCompletedRecommendations, 1, 1, v15);
    v19 = v12 + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedRuleset;
    v20 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFA5A928);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
    v21 = OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_taskLimiters;
    type metadata accessor for TaskLimiters();
    *(_QWORD *)(v12 + v21) = sub_1CDF1B8B4();
    *(_QWORD *)(v12 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D11650]), sel_initWithAccount_, v13);
    v22 = objc_allocWithZone((Class)sub_1CDF32B8C());
    *(_QWORD *)(v12 + 120) = sub_1CDF32B80();
    swift_beginAccess();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = *v8;
    *v8 = 0x8000000000000000;
    sub_1CDF165D4(v12, v5, v7, isUniquelyReferenced_nonNull_native);
    *v8 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return (id)v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CDF1174C()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_1CDF11770(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF1178C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_taskLimiters);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CDF117DC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = sub_1CDF1A658(0xD000000000000014, 0x80000001CDF3FF30);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF1183C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t (*v8)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_BYTE *)(v0 + 72);
  v3 = swift_allocObject();
  swift_weakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = v2;
  v8 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v5;
  v6 = sub_1CDF0E874(0, &qword_1EFA5AB00);
  *v5 = v0;
  v5[1] = sub_1CDF11948;
  return v8(v0 + 16, 0xD000000000000014, 0x80000001CDF3FF30, &unk_1EFA5AB28, v4, v6);
}

uint64_t sub_1CDF11948()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_1CDF119C4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 88) = a3;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_1CDF119E0()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  _BYTE *v4;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_1CDF11AA8;
    return sub_1CDF124F8(*(_BYTE *)(v0 + 88));
  }
  else
  {
    sub_1CDF15B6C();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CDF11AA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF11B1C(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF11B38()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_taskLimiters);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CDF11B88()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = sub_1CDF1A658(0x6C75526863746566, 0xEC00000074657365);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF11BEC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t (*v8)(uint64_t, uint64_t, unint64_t, void *, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_BYTE *)(v0 + 72);
  v3 = swift_allocObject();
  swift_weakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = v2;
  v8 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void *, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v1 + 120)
                                                                                            + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v5;
  v6 = sub_1CDF0E874(0, &qword_1EFA5AB18);
  *v5 = v0;
  v5[1] = sub_1CDF11CFC;
  return v8(v0 + 16, 0x6C75526863746566, 0xEC00000074657365, &unk_1EFA5AB10, v4, v6);
}

uint64_t sub_1CDF11CFC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_1CDF11D78()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1CDF11D84()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF11DC0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 88) = a3;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_1CDF11DDC()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  _BYTE *v4;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_1CDF11EA4;
    return sub_1CDF12C10(*(_BYTE *)(v0 + 88));
  }
  else
  {
    sub_1CDF15B6C();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CDF11EA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF11F18()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD **)(v0 + 40);
  swift_release();
  *v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF11F58()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF11F8C(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF11FA8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_taskLimiters);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CDF11FF8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = sub_1CDF1A658(0xD00000000000001DLL, 0x80000001CDF3FF10);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF12058()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t (*v8)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_BYTE *)(v0 + 72);
  v3 = swift_allocObject();
  swift_weakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = v2;
  v8 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v5;
  v6 = sub_1CDF0E874(0, &qword_1EFA5AB00);
  *v5 = v0;
  v5[1] = sub_1CDF11948;
  return v8(v0 + 16, 0xD00000000000001DLL, 0x80000001CDF3FF10, &unk_1EFA5AAF8, v4, v6);
}

uint64_t sub_1CDF12164(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 88) = a3;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_1CDF12180()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  _BYTE *v4;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_1CDF11AA8;
    return sub_1CDF13454(*(_BYTE *)(v0 + 88));
  }
  else
  {
    sub_1CDF15B6C();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CDF12248(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF12264()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_taskLimiters);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CDF122B4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = sub_1CDF1A658(0xD00000000000001ALL, 0x80000001CDF3FEF0);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF12314()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t (*v8)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_BYTE *)(v0 + 72);
  v3 = swift_allocObject();
  swift_weakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = v2;
  v8 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAA0);
  *v5 = v0;
  v5[1] = sub_1CDF11948;
  return v8(v0 + 16, 0xD00000000000001ALL, 0x80000001CDF3FEF0, &unk_1EFA5AAE8, v4, v6);
}

uint64_t sub_1CDF12414(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 88) = a3;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_1CDF12430()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  _BYTE *v4;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_1CDF11AA8;
    return sub_1CDF13D9C(*(_BYTE *)(v0 + 88));
  }
  else
  {
    sub_1CDF15B6C();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CDF124F8(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 184) = v1;
  *(_BYTE *)(v2 + 320) = a1;
  v3 = sub_1CDF32C1C();
  *(_QWORD *)(v2 + 192) = v3;
  *(_QWORD *)(v2 + 200) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  *(_QWORD *)(v2 + 216) = swift_task_alloc();
  v4 = sub_1CDF32A78();
  *(_QWORD *)(v2 + 224) = v4;
  *(_QWORD *)(v2 + 232) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 240) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAD0);
  *(_QWORD *)(v2 + 248) = swift_task_alloc();
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  *(_QWORD *)(v2 + 264) = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A908);
  *(_QWORD *)(v2 + 272) = v5;
  *(_QWORD *)(v2 + 280) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 288) = swift_task_alloc();
  *(_QWORD *)(v2 + 296) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF12610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  _QWORD *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 264);
  v5 = OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedRecommendations;
  *(_QWORD *)(v0 + 304) = OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedRecommendations;
  v6 = v1 + v5;
  swift_beginAccess();
  sub_1CDF15D7C(v6, v4, &qword_1EFA5AAD0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    v7 = *(_QWORD *)(v0 + 264);
    v8 = &qword_1EFA5AAD0;
LABEL_7:
    sub_1CDF16A0C(v7, v8);
    v17 = *(_QWORD *)(v0 + 200);
    v16 = *(_QWORD *)(v0 + 208);
    v18 = *(_QWORD *)(v0 + 192);
    v19 = sub_1CDF27238();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v19, v18);
    v20 = sub_1CDF32C10();
    v21 = sub_1CDF32E44();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1CDEBD000, v20, v21, "Fetching fresh recommendations", v22, 2u);
      MEMORY[0x1D17BBC9C](v22, -1, -1);
    }
    v24 = *(_QWORD *)(v0 + 200);
    v23 = *(_QWORD *)(v0 + 208);
    v26 = *(_QWORD *)(v0 + 184);
    v25 = *(_QWORD *)(v0 + 192);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    v27 = *(void **)(v26 + 112);
    *(_QWORD *)(v0 + 56) = v0 + 168;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1CDF12A74;
    v28 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
    v29 = (_QWORD *)(v0 + 80);
    v29[1] = 0x40000000;
    v29[2] = sub_1CDF12C0C;
    v29[3] = &block_descriptor_27;
    v29[4] = v28;
    objc_msgSend(v27, sel_fetchRecommendationsWithCompletion_, v29);
    return swift_continuation_await();
  }
  v9 = *(double **)(v0 + 296);
  v11 = *(_QWORD *)(v0 + 232);
  v10 = *(_QWORD *)(v0 + 240);
  v12 = *(_QWORD *)(v0 + 224);
  sub_1CDF15D38(*(_QWORD *)(v0 + 264), (uint64_t)v9, &qword_1EFA5A908);
  sub_1CDF32A6C();
  sub_1CDF32A30();
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (v14 >= *v9)
  {
    v7 = *(_QWORD *)(v0 + 296);
    v8 = &qword_1EFA5A908;
    goto LABEL_7;
  }
  v15 = *(_QWORD *)(v0 + 296);
  if ((*(_BYTE *)(v0 + 320) & 1) != 0)
  {
    v8 = &qword_1EFA5A908;
    v7 = *(_QWORD *)(v0 + 296);
    goto LABEL_7;
  }
  v31 = *(_QWORD *)(v0 + 288);
  v32 = *(_QWORD *)(v0 + 216);
  v33 = *(_QWORD *)(v0 + 192);
  v34 = *(_QWORD *)(v0 + 200);
  v35 = sub_1CDF27238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v32, v35, v33);
  sub_1CDF15D7C(v15, v31, &qword_1EFA5A908);
  v36 = sub_1CDF32C10();
  v37 = sub_1CDF32E44();
  v38 = os_log_type_enabled(v36, v37);
  v39 = *(_QWORD *)(v0 + 288);
  if (v38)
  {
    v40 = *(_QWORD *)(v0 + 272);
    v41 = (uint8_t *)swift_slowAlloc();
    v42 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v41 = 138412290;
    v43 = *(void **)(v39 + *(int *)(v40 + 32));
    *(_QWORD *)(v0 + 176) = v43;
    v44 = v43;
    sub_1CDF32EC8();
    *v42 = v43;
    sub_1CDF16A0C(v39, &qword_1EFA5A908);
    _os_log_impl(&dword_1CDEBD000, v36, v37, "Reusing cached recommendations %@", v41, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAC0);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v42, -1, -1);
    MEMORY[0x1D17BBC9C](v41, -1, -1);
  }
  else
  {
    sub_1CDF16A0C(*(_QWORD *)(v0 + 288), &qword_1EFA5A908);
  }
  v45 = *(_QWORD *)(v0 + 296);
  v46 = *(_QWORD *)(v0 + 272);
  v47 = *(_QWORD *)(v0 + 216);
  v48 = *(_QWORD *)(v0 + 192);
  v49 = *(_QWORD *)(v0 + 200);

  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v48);
  v50 = *(id *)(v45 + *(int *)(v46 + 32));
  sub_1CDF16A0C(v45, &qword_1EFA5A908);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v50);
}

uint64_t sub_1CDF12A74()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 312) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CDF12AD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD **)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 184) + *(_QWORD *)(v0 + 304);
  v6 = *(void **)(v0 + 168);
  *(_QWORD *)((char *)v3 + *(int *)(v1 + 32)) = v6;
  *v3 = 0x40F5180000000000;
  v7 = v6;
  sub_1CDF32A6C();
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  sub_1CDF15D38((uint64_t)v3, v4, &qword_1EFA5AAD0);
  swift_beginAccess();
  sub_1CDF15CF4(v4, v5, &qword_1EFA5AAD0);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v7);
}

uint64_t sub_1CDF12C10(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 184) = v1;
  *(_BYTE *)(v2 + 320) = a1;
  v3 = sub_1CDF32C1C();
  *(_QWORD *)(v2 + 192) = v3;
  *(_QWORD *)(v2 + 200) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  *(_QWORD *)(v2 + 216) = swift_task_alloc();
  v4 = sub_1CDF32A78();
  *(_QWORD *)(v2 + 224) = v4;
  *(_QWORD *)(v2 + 232) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 240) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAD8);
  *(_QWORD *)(v2 + 248) = swift_task_alloc();
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  *(_QWORD *)(v2 + 264) = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFA5A928);
  *(_QWORD *)(v2 + 272) = v5;
  *(_QWORD *)(v2 + 280) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 288) = swift_task_alloc();
  *(_QWORD *)(v2 + 296) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF12D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  _QWORD *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 264);
  v5 = OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedRuleset;
  *(_QWORD *)(v0 + 304) = OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedRuleset;
  v6 = v1 + v5;
  swift_beginAccess();
  sub_1CDF15D7C(v6, v4, &qword_1EFA5AAD8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    v7 = *(_QWORD *)(v0 + 264);
    v8 = &qword_1EFA5AAD8;
LABEL_7:
    sub_1CDF16A0C(v7, v8);
    v17 = *(_QWORD *)(v0 + 200);
    v16 = *(_QWORD *)(v0 + 208);
    v18 = *(_QWORD *)(v0 + 192);
    v19 = sub_1CDF27238();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v19, v18);
    v20 = sub_1CDF32C10();
    v21 = sub_1CDF32E44();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1CDEBD000, v20, v21, "Fetching fresh rulesets", v22, 2u);
      MEMORY[0x1D17BBC9C](v22, -1, -1);
    }
    v24 = *(_QWORD *)(v0 + 200);
    v23 = *(_QWORD *)(v0 + 208);
    v26 = *(_QWORD *)(v0 + 184);
    v25 = *(_QWORD *)(v0 + 192);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    v27 = *(void **)(v26 + 112);
    *(_QWORD *)(v0 + 56) = v0 + 168;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1CDF1318C;
    v28 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
    v29 = (_QWORD *)(v0 + 80);
    v29[1] = 0x40000000;
    v29[2] = sub_1CDF12C0C;
    v29[3] = &block_descriptor_25;
    v29[4] = v28;
    objc_msgSend(v27, sel_fetchRecommendationsRulesetWithCompletion_, v29);
    return swift_continuation_await();
  }
  v9 = *(double **)(v0 + 296);
  v11 = *(_QWORD *)(v0 + 232);
  v10 = *(_QWORD *)(v0 + 240);
  v12 = *(_QWORD *)(v0 + 224);
  sub_1CDF15D38(*(_QWORD *)(v0 + 264), (uint64_t)v9, qword_1EFA5A928);
  sub_1CDF32A6C();
  sub_1CDF32A30();
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (v14 >= *v9)
  {
    v7 = *(_QWORD *)(v0 + 296);
    v8 = qword_1EFA5A928;
    goto LABEL_7;
  }
  v15 = *(_QWORD *)(v0 + 296);
  if ((*(_BYTE *)(v0 + 320) & 1) != 0)
  {
    v8 = qword_1EFA5A928;
    v7 = *(_QWORD *)(v0 + 296);
    goto LABEL_7;
  }
  v31 = *(_QWORD *)(v0 + 288);
  v32 = *(_QWORD *)(v0 + 216);
  v33 = *(_QWORD *)(v0 + 192);
  v34 = *(_QWORD *)(v0 + 200);
  v35 = sub_1CDF27238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v32, v35, v33);
  sub_1CDF15D7C(v15, v31, qword_1EFA5A928);
  v36 = sub_1CDF32C10();
  v37 = sub_1CDF32E44();
  v38 = os_log_type_enabled(v36, v37);
  v39 = *(_QWORD *)(v0 + 288);
  if (v38)
  {
    v40 = *(_QWORD *)(v0 + 272);
    v41 = (uint8_t *)swift_slowAlloc();
    v42 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v41 = 138412290;
    v43 = *(void **)(v39 + *(int *)(v40 + 32));
    *(_QWORD *)(v0 + 176) = v43;
    v44 = v43;
    sub_1CDF32EC8();
    *v42 = v43;
    sub_1CDF16A0C(v39, qword_1EFA5A928);
    _os_log_impl(&dword_1CDEBD000, v36, v37, "Reusing cached rulesets %@", v41, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAC0);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v42, -1, -1);
    MEMORY[0x1D17BBC9C](v41, -1, -1);
  }
  else
  {
    sub_1CDF16A0C(*(_QWORD *)(v0 + 288), qword_1EFA5A928);
  }
  v45 = *(_QWORD *)(v0 + 296);
  v46 = *(_QWORD *)(v0 + 272);
  v47 = *(_QWORD *)(v0 + 216);
  v48 = *(_QWORD *)(v0 + 192);
  v49 = *(_QWORD *)(v0 + 200);

  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v48);
  v50 = *(id *)(v45 + *(int *)(v46 + 32));
  sub_1CDF16A0C(v45, qword_1EFA5A928);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v50);
}

uint64_t sub_1CDF1318C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 312) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CDF131EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD **)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 184) + *(_QWORD *)(v0 + 304);
  v6 = *(void **)(v0 + 168);
  *(_QWORD *)((char *)v3 + *(int *)(v1 + 32)) = v6;
  *v3 = 0x40F5180000000000;
  v7 = v6;
  sub_1CDF32A6C();
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  sub_1CDF15D38((uint64_t)v3, v4, &qword_1EFA5AAD8);
  swift_beginAccess();
  sub_1CDF15CF4(v4, v5, &qword_1EFA5AAD8);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v7);
}

uint64_t sub_1CDF13324()
{
  uint64_t v0;

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF133C8(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B88);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CDF13454(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 184) = v1;
  *(_BYTE *)(v2 + 344) = a1;
  v3 = sub_1CDF32C1C();
  *(_QWORD *)(v2 + 192) = v3;
  *(_QWORD *)(v2 + 200) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  *(_QWORD *)(v2 + 216) = swift_task_alloc();
  v4 = sub_1CDF32A78();
  *(_QWORD *)(v2 + 224) = v4;
  *(_QWORD *)(v2 + 232) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 240) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAD0);
  *(_QWORD *)(v2 + 248) = swift_task_alloc();
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  *(_QWORD *)(v2 + 264) = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A908);
  *(_QWORD *)(v2 + 272) = v5;
  *(_QWORD *)(v2 + 280) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 288) = swift_task_alloc();
  *(_QWORD *)(v2 + 296) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF1356C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 264);
  v5 = OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedCompletedRecommendations;
  *(_QWORD *)(v0 + 304) = OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedCompletedRecommendations;
  v6 = v1 + v5;
  swift_beginAccess();
  sub_1CDF15D7C(v6, v4, &qword_1EFA5AAD0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    v7 = *(_QWORD *)(v0 + 264);
    v8 = &qword_1EFA5AAD0;
LABEL_7:
    sub_1CDF16A0C(v7, v8);
    v16 = swift_task_alloc();
    *(_QWORD *)(v0 + 312) = v16;
    *(_QWORD *)v16 = v0;
    *(_QWORD *)(v16 + 8) = sub_1CDF138F8;
    *(_QWORD *)(v16 + 24) = *(_QWORD *)(v0 + 184);
    *(_BYTE *)(v16 + 72) = 0;
    return swift_task_switch();
  }
  v9 = *(double **)(v0 + 296);
  v11 = *(_QWORD *)(v0 + 232);
  v10 = *(_QWORD *)(v0 + 240);
  v12 = *(_QWORD *)(v0 + 224);
  sub_1CDF15D38(*(_QWORD *)(v0 + 264), (uint64_t)v9, &qword_1EFA5A908);
  sub_1CDF32A6C();
  sub_1CDF32A30();
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (v14 >= *v9)
  {
    v7 = *(_QWORD *)(v0 + 296);
    v8 = &qword_1EFA5A908;
    goto LABEL_7;
  }
  v15 = *(_QWORD *)(v0 + 296);
  if ((*(_BYTE *)(v0 + 344) & 1) != 0)
  {
    v8 = &qword_1EFA5A908;
    v7 = *(_QWORD *)(v0 + 296);
    goto LABEL_7;
  }
  v18 = *(_QWORD *)(v0 + 288);
  v19 = *(_QWORD *)(v0 + 216);
  v20 = *(_QWORD *)(v0 + 192);
  v21 = *(_QWORD *)(v0 + 200);
  v22 = sub_1CDF27238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v22, v20);
  sub_1CDF15D7C(v15, v18, &qword_1EFA5A908);
  v23 = sub_1CDF32C10();
  v24 = sub_1CDF32E44();
  v25 = os_log_type_enabled(v23, v24);
  v26 = *(_QWORD *)(v0 + 288);
  if (v25)
  {
    v27 = *(_QWORD *)(v0 + 272);
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v28 = 138412290;
    v30 = *(void **)(v26 + *(int *)(v27 + 32));
    *(_QWORD *)(v0 + 176) = v30;
    v31 = v30;
    sub_1CDF32EC8();
    *v29 = v30;
    sub_1CDF16A0C(v26, &qword_1EFA5A908);
    _os_log_impl(&dword_1CDEBD000, v23, v24, "Reusing cached completed recommendations %@", v28, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAC0);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v29, -1, -1);
    MEMORY[0x1D17BBC9C](v28, -1, -1);
  }
  else
  {
    sub_1CDF16A0C(*(_QWORD *)(v0 + 288), &qword_1EFA5A908);
  }
  v32 = *(_QWORD *)(v0 + 296);
  v33 = *(_QWORD *)(v0 + 272);
  v34 = *(_QWORD *)(v0 + 216);
  v35 = *(_QWORD *)(v0 + 192);
  v36 = *(_QWORD *)(v0 + 200);

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
  v37 = *(id *)(v32 + *(int *)(v33 + 32));
  sub_1CDF16A0C(v32, &qword_1EFA5A908);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v37);
}

uint64_t sub_1CDF138F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 320) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_1CDF139DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;

  v2 = v0[25];
  v1 = v0[26];
  v3 = v0[24];
  v4 = CERuleConfiguration.urlsConfigObject()();
  v0[41] = v4;
  v5 = sub_1CDF27238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  v6 = sub_1CDF32C10();
  v7 = sub_1CDF32E44();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CDEBD000, v6, v7, "Fetching fresh completed recommendations", v8, 2u);
    MEMORY[0x1D17BBC9C](v8, -1, -1);
  }
  v10 = v0[25];
  v9 = v0[26];
  v12 = v0[23];
  v11 = v0[24];

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  v13 = *(void **)(v12 + 112);
  v0[7] = v0 + 21;
  v0[2] = v0;
  v0[3] = sub_1CDF13B44;
  v14 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v15 = v0 + 10;
  v15[1] = 0x40000000;
  v15[2] = sub_1CDF12C0C;
  v15[3] = &block_descriptor_0;
  v15[4] = v14;
  objc_msgSend(v13, sel_fetchCompletedRecommendations_completion_, v4, v15);
  return swift_continuation_await();
}

uint64_t sub_1CDF13B44()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 336) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CDF13BA4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v10;

  v2 = *(void **)(v0 + 320);
  v1 = *(void **)(v0 + 328);
  v4 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD **)(v0 + 256);
  v7 = *(_QWORD *)(v0 + 184) + *(_QWORD *)(v0 + 304);
  v8 = *(void **)(v0 + 168);
  *(_QWORD *)((char *)v5 + *(int *)(v4 + 32)) = v8;
  *v5 = 0x40F5180000000000;
  v10 = v8;
  sub_1CDF32A6C();

  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v5, 0, 1, v4);
  sub_1CDF15D38((uint64_t)v5, v6, &qword_1EFA5AAD0);
  swift_beginAccess();
  sub_1CDF15CF4(v6, v7, &qword_1EFA5AAD0);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v10);
}

uint64_t sub_1CDF13CF0()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 328);
  v2 = *(void **)(v0 + 320);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF13D9C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 56) = v1;
  *(_BYTE *)(v2 + 168) = a1;
  v3 = sub_1CDF32C1C();
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 72) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 80) = swift_task_alloc();
  v4 = sub_1CDF32A78();
  *(_QWORD *)(v2 + 88) = v4;
  *(_QWORD *)(v2 + 96) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 104) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AA98);
  *(_QWORD *)(v2 + 112) = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A918);
  *(_QWORD *)(v2 + 120) = v5;
  *(_QWORD *)(v2 + 128) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 136) = swift_task_alloc();
  *(_QWORD *)(v2 + 144) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF13E88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 56)
     + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedClientRecommendations;
  swift_beginAccess();
  sub_1CDF15D7C(v4, v3, &qword_1EFA5AA98);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v5 = *(_QWORD *)(v0 + 112);
    v6 = &qword_1EFA5AA98;
LABEL_7:
    sub_1CDF16A0C(v5, v6);
    sub_1CDF15A40();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAA0);
    *v14 = v0;
    v14[1] = sub_1CDF142A4;
    return sub_1CDF33000();
  }
  v7 = *(double **)(v0 + 144);
  v9 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 88);
  sub_1CDF15D38(*(_QWORD *)(v0 + 112), (uint64_t)v7, &qword_1EFA5A918);
  sub_1CDF32A6C();
  sub_1CDF32A30();
  v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  if (v12 >= *v7)
  {
    v5 = *(_QWORD *)(v0 + 144);
    v6 = &qword_1EFA5A918;
    goto LABEL_7;
  }
  v13 = *(_QWORD *)(v0 + 144);
  if ((*(_BYTE *)(v0 + 168) & 1) != 0)
  {
    v6 = &qword_1EFA5A918;
    v5 = *(_QWORD *)(v0 + 144);
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(v0 + 136);
  v18 = *(_QWORD *)(v0 + 72);
  v17 = *(_QWORD *)(v0 + 80);
  v19 = *(_QWORD *)(v0 + 64);
  v20 = sub_1CDF27238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v20, v19);
  sub_1CDF15D7C(v13, v16, &qword_1EFA5A918);
  v21 = sub_1CDF32C10();
  v22 = sub_1CDF32E44();
  v23 = os_log_type_enabled(v21, v22);
  v24 = *(_QWORD *)(v0 + 136);
  if (v23)
  {
    v37 = *(_QWORD *)(v0 + 72);
    v38 = *(_QWORD *)(v0 + 64);
    v39 = *(_QWORD *)(v0 + 80);
    v25 = (uint8_t *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    *(_DWORD *)v25 = 136315138;
    v40 = v36;
    v26 = sub_1CDF0E874(0, &qword_1EFA5AAA8);
    v27 = swift_bridgeObjectRetain();
    v28 = MEMORY[0x1D17BB054](v27, v26);
    v30 = v29;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 48) = sub_1CDF0D64C(v28, v30, &v40);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    sub_1CDF16A0C(v24, &qword_1EFA5A918);
    _os_log_impl(&dword_1CDEBD000, v21, v22, "Reusing cached client recommendations %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v36, -1, -1);
    MEMORY[0x1D17BBC9C](v25, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v39, v38);
  }
  else
  {
    v32 = *(_QWORD *)(v0 + 72);
    v31 = *(_QWORD *)(v0 + 80);
    v33 = *(_QWORD *)(v0 + 64);
    sub_1CDF16A0C(*(_QWORD *)(v0 + 136), &qword_1EFA5A918);

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
  }
  v34 = *(_QWORD *)(v0 + 144);
  v35 = *(_QWORD *)(v34 + *(int *)(*(_QWORD *)(v0 + 120) + 32));
  swift_bridgeObjectRetain();
  sub_1CDF16A0C(v34, &qword_1EFA5A918);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v35);
}

uint64_t sub_1CDF142A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CDF14308()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_1CDF1437C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF143E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint8_t *v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAB0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v6 = sub_1CDF32C1C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CDF27238();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = sub_1CDF32C10();
  v12 = sub_1CDF32E44();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v21 = v3;
    v14 = a2;
    v15 = v13;
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1CDEBD000, v11, v12, "Fetching fresh client recommendations", v13, 2u);
    v16 = v15;
    a2 = v14;
    v3 = v21;
    MEMORY[0x1D17BBC9C](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v17 = MEMORY[0x1E0DEE9D8];
  sub_1CDF1137C(MEMORY[0x1E0DEE9D8]);
  sub_1CDF1137C(v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v22, v3);
  v18 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v19 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v19 + v18, (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  *(_QWORD *)(v19 + ((v5 + v18 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  swift_retain();
  sub_1CDF32B74();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1CDF14600(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v8 = sub_1CDF32C1C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AA98);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (uint64_t *)((char *)&v32 - v16);
  if (a2)
  {
    v18 = sub_1CDF27238();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v18, v8);
    v19 = a2;
    v20 = a2;
    v21 = sub_1CDF32C10();
    v22 = sub_1CDF32E50();
    if (os_log_type_enabled(v21, v22))
    {
      v34 = a3;
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = (_QWORD *)swift_slowAlloc();
      v33 = v8;
      *(_DWORD *)v23 = 138412290;
      v25 = a2;
      v26 = _swift_stdlib_bridgeErrorToNSError();
      v35 = v26;
      v8 = v33;
      sub_1CDF32EC8();
      *v24 = v26;

      _os_log_impl(&dword_1CDEBD000, v21, v22, "Error fetching client recommendations: %@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAC0);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v24, -1, -1);
      MEMORY[0x1D17BBC9C](v23, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_1CDF15B6C();
    v30 = swift_allocError();
    *v31 = 1;
    v35 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAB0);
    return sub_1CDF32DCC();
  }
  else
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A918);
    *(_QWORD *)((char *)v17 + *(int *)(v27 + 32)) = a1;
    *v17 = 0x40F5180000000000;
    swift_bridgeObjectRetain();
    sub_1CDF32A6C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v17, 0, 1, v27);
    sub_1CDF15D38((uint64_t)v17, (uint64_t)v15, &qword_1EFA5AA98);
    v28 = a4
        + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedClientRecommendations;
    swift_beginAccess();
    sub_1CDF15CF4((uint64_t)v15, v28, &qword_1EFA5AA98);
    swift_endAccess();
    v35 = a1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAB0);
    return sub_1CDF32DD8();
  }
}

uint64_t sub_1CDF14954()
{
  uint64_t v0;

  sub_1CDF16A0C(v0 + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedRecommendations, &qword_1EFA5AAD0);
  sub_1CDF16A0C(v0 + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedClientRecommendations, &qword_1EFA5AA98);
  sub_1CDF16A0C(v0 + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedCompletedRecommendations, &qword_1EFA5AAD0);
  sub_1CDF16A0C(v0 + OBJC_IVAR____TtC11iCloudQuotaP33_40BFB62DD900A11E515CA1C029EAD21A11DataFetcher_cachedRuleset, &qword_1EFA5AAD8);
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_1CDF149F8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1CDF14A04(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CDF14A68;
  return v6(a1);
}

uint64_t sub_1CDF14A68()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CDF14AB4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  if (*(_QWORD *)(v0 + 48))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF14AF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_1CDF16CFC;
  *(_QWORD *)(v4 + 2672) = v3;
  *(_QWORD *)(v4 + 2664) = v2;
  *(_OWORD *)(v4 + 2648) = v5;
  return swift_task_switch();
}

uint64_t sub_1CDF14B74()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1CDF16CFC;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t sub_1CDF14BF0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1CDF16CFC;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t sub_1CDF14C6C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1CDF16CFC;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t sub_1CDF14CE8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1CDF16CFC;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t type metadata accessor for RecommendationsDataFetcher()
{
  return objc_opt_self();
}

unint64_t sub_1CDF14D84()
{
  unint64_t result;

  result = qword_1EFA5A778;
  if (!qword_1EFA5A778)
  {
    result = MEMORY[0x1D17BBC00](&protocol conformance descriptor for RecommendationsDataFetcher.FetchError, &type metadata for RecommendationsDataFetcher.FetchError);
    atomic_store(result, (unint64_t *)&qword_1EFA5A778);
  }
  return result;
}

uint64_t method lookup function for RecommendationsDataFetcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RecommendationsDataFetcher.refreshCache(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of RecommendationsDataFetcher.refreshCache(for:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of RecommendationsDataFetcher.fetchServerRecommendations(for:shouldIgnoreCache:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of RecommendationsDataFetcher.fetchRulesets(for:shouldIgnoreCache:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of RecommendationsDataFetcher.fetchCompletedRecommendations(for:shouldIgnoreCache:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of RecommendationsDataFetcher.fetchClientRecommendations(for:shouldIgnoreCache:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecommendationsDataFetcher.FetchError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RecommendationsDataFetcher.FetchError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1CDF14F68 + 4 * byte_1CDF39355[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CDF14F9C + 4 * byte_1CDF39350[v4]))();
}

uint64_t sub_1CDF14F9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CDF14FA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CDF14FACLL);
  return result;
}

uint64_t sub_1CDF14FB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CDF14FC0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CDF14FC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CDF14FCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CDF14FD8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1CDF14FE4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RecommendationsDataFetcher.FetchError()
{
  return &type metadata for RecommendationsDataFetcher.FetchError;
}

uint64_t sub_1CDF15000()
{
  return type metadata accessor for DataFetcher();
}

uint64_t type metadata accessor for DataFetcher()
{
  uint64_t result;

  result = qword_1EFA5B808;
  if (!qword_1EFA5B808)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1CDF15044()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1CDF1513C(319, &qword_1EFA5A900, &qword_1EFA5A908);
  if (v0 <= 0x3F)
  {
    sub_1CDF1513C(319, &qword_1EFA5A910, &qword_1EFA5A918);
    if (v1 <= 0x3F)
    {
      sub_1CDF1513C(319, &qword_1EFA5A920, qword_1EFA5A928);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_1CDF1513C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_1CDF32EBC();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1CDF15188()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1CDF15190()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1CDF32A78();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1CDF15228(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_1CDF32A78();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  if ((v12 | v8) > 7
    || ((*(_DWORD *)(v11 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || ((v9 + ((v8 + 8) & ~v8) + v12) & ~v12) + *(_QWORD *)(v11 + 64) > 0x18)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + (((v12 | v8) & 0xF8 ^ 0x1F8) & ((v12 | v8) + 16)));
    swift_retain();
  }
  else
  {
    v16 = ~v8;
    *a1 = *a2;
    v17 = (char *)a1 + v8;
    v18 = (char *)a2 + v8;
    v19 = (unint64_t)(v17 + 8) & v16;
    v20 = (unint64_t)(v18 + 8) & v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v19, v20, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))((v19 + v9 + v12) & ~v12, (v20 + v9 + v12) & ~v12, v10);
  }
  return a1;
}

uint64_t sub_1CDF1534C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = sub_1CDF32A78();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((v6 + *(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_1CDF153C0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = sub_1CDF32A78();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 16))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

_QWORD *sub_1CDF15464(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = sub_1CDF32A78();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v9, v10, v6);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 24))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

_QWORD *sub_1CDF15508(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = sub_1CDF32A78();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v9, v10, v6);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 32))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

_QWORD *sub_1CDF155AC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = sub_1CDF32A78();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(v9, v10, v6);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 40))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

uint64_t sub_1CDF15650(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  uint64_t v23;

  v6 = sub_1CDF32A78();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v8)
    v12 = *(_DWORD *)(v7 + 84);
  else
    v12 = *(_DWORD *)(v10 + 84);
  if (!a2)
    return 0;
  v13 = v6;
  v14 = *(unsigned __int8 *)(v7 + 80);
  v15 = *(_QWORD *)(v7 + 64);
  v16 = *(unsigned __int8 *)(v10 + 80);
  if (a2 <= v12)
    goto LABEL_23;
  v17 = ((v15 + ((v14 + 8) & ~v14) + v16) & ~v16) + *(_QWORD *)(v10 + 64);
  v18 = 8 * v17;
  if (v17 <= 3)
  {
    v20 = ((a2 - v12 + ~(-1 << v18)) >> v18) + 1;
    if (HIWORD(v20))
    {
      v19 = *(_DWORD *)(a1 + v17);
      if (!v19)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v20 > 0xFF)
    {
      v19 = *(unsigned __int16 *)(a1 + v17);
      if (!*(_WORD *)(a1 + v17))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v20 < 2)
    {
LABEL_23:
      if (v12)
      {
        v23 = (a1 + v14 + 8) & ~v14;
        if (v8 >= v11)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v23, v8, v13);
        else
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))((v23 + v15 + v16) & ~v16, *(unsigned int *)(v10 + 84), v9);
      }
      return 0;
    }
  }
  v19 = *(unsigned __int8 *)(a1 + v17);
  if (!*(_BYTE *)(a1 + v17))
    goto LABEL_23;
LABEL_14:
  v21 = (v19 - 1) << v18;
  if (v17 > 3)
    v21 = 0;
  if ((_DWORD)v17)
  {
    if (v17 <= 3)
      v22 = ((v15 + ((v14 + 8) & ~(_DWORD)v14) + v16) & ~(_DWORD)v16) + *(_DWORD *)(v10 + 64);
    else
      v22 = 4;
    __asm { BR              X12 }
  }
  return v12 + v21 + 1;
}

void sub_1CDF15800(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v8 = *(_QWORD *)(sub_1CDF32A78() - 8);
  v9 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84))
    v10 = *(_DWORD *)(v8 + 84);
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = *(unsigned __int8 *)(v8 + 80);
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = ((*(_QWORD *)(v8 + 64) + ((v11 + 8) & ~v11) + v12) & ~v12) + *(_QWORD *)(v9 + 64);
  if (a3 <= v10)
  {
    v14 = 0u;
  }
  else if (v13 <= 3)
  {
    v16 = ((a3 - v10 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v16))
    {
      v14 = 4u;
    }
    else if (v16 >= 0x100)
    {
      v14 = 2;
    }
    else
    {
      v14 = v16 > 1;
    }
  }
  else
  {
    v14 = 1u;
  }
  if (v10 < a2)
  {
    v15 = ~v10 + a2;
    if (v13 < 4)
    {
      if ((_DWORD)v13)
      {
        v17 = v15 & ~(-1 << (8 * v13));
        bzero(a1, ((*(_QWORD *)(v8 + 64) + ((v11 + 8) & ~v11) + v12) & ~v12) + *(_QWORD *)(v9 + 64));
        if ((_DWORD)v13 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if ((_DWORD)v13 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, ((*(_QWORD *)(v8 + 64) + ((v11 + 8) & ~v11) + v12) & ~v12) + *(_QWORD *)(v9 + 64));
      *(_DWORD *)a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X1 }
}

uint64_t type metadata accessor for CacheBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CacheBox);
}

unint64_t sub_1CDF15A40()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFA5B9A0;
  if (!qword_1EFA5B9A0)
  {
    v1 = type metadata accessor for DataFetcher();
    result = MEMORY[0x1D17BBC00](&unk_1CDF394D8, v1);
    atomic_store(result, (unint64_t *)&qword_1EFA5B9A0);
  }
  return result;
}

uint64_t sub_1CDF15A88(uint64_t a1)
{
  uint64_t v1;

  return sub_1CDF143E0(a1, v1);
}

uint64_t sub_1CDF15A90()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAB0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF15B08(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAB0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_1CDF14600(a1, a2, v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_1CDF15B6C()
{
  unint64_t result;

  result = qword_1EFA5AAB8;
  if (!qword_1EFA5AAB8)
  {
    result = MEMORY[0x1D17BBC00](&protocol conformance descriptor for RecommendationsDataFetcher.FetchError, &type metadata for RecommendationsDataFetcher.FetchError);
    atomic_store(result, (unint64_t *)&qword_1EFA5AAB8);
  }
  return result;
}

unint64_t sub_1CDF15BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1CDF33048();
  sub_1CDF32D30();
  v4 = sub_1CDF33060();
  return sub_1CDF15C14(a1, a2, v4);
}

unint64_t sub_1CDF15C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1CDF32FF4() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1CDF32FF4() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1CDF15CF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1CDF15D38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1CDF15D7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1CDF15DC0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CDF15DE4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF15E08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_1CDF16CFC;
  *(_BYTE *)(v6 + 88) = v5;
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = v4;
  return swift_task_switch();
}

uint64_t sub_1CDF15E7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_1CDF16CFC;
  *(_BYTE *)(v6 + 88) = v5;
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = v4;
  return swift_task_switch();
}

uint64_t sub_1CDF15EF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_1CDF15F64;
  *(_BYTE *)(v6 + 88) = v5;
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = v4;
  return swift_task_switch();
}

uint64_t sub_1CDF15F64()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CDF15FAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_1CDF16CFC;
  *(_BYTE *)(v6 + 88) = v5;
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = v4;
  return swift_task_switch();
}

uint64_t sub_1CDF16020(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1CDF15BB0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1CDF16730();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1CDF16400(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1CDF160EC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AB30);
  v36 = a2;
  v6 = sub_1CDF32F64();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1CDF33048();
    sub_1CDF32D30();
    result = sub_1CDF33060();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1CDF16400(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CDF32EF8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1CDF33048();
        swift_bridgeObjectRetain();
        sub_1CDF32D30();
        v9 = sub_1CDF33060();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1CDF165D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CDF15BB0(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1CDF16730();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CDF160EC(v15, a4 & 1);
  v21 = sub_1CDF15BB0(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CDF3300C();
  __break(1u);
  return result;
}

void *sub_1CDF16730()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AB30);
  v2 = *v0;
  v3 = sub_1CDF32F58();
  v4 = v3;
  v5 = *(_QWORD *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    v5 = *(_QWORD *)(v2 + 16);
  }
  v10 = 0;
  *(_QWORD *)(v4 + 16) = v5;
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1CDF168E8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1CDF15F64;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t sub_1CDF16960(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_1CDF16970(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CDF11084(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_1CDF16980(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CDF10938(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t objectdestroy_3Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  if (*(_QWORD *)(v0 + 56))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF169E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1CDF16A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1CDF10288(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_1CDF16A0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1CDF16A48()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF16A6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CDF16CFC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFA5AB58 + dword_1EFA5AB58))(a1, v4);
}

uint64_t sub_1CDF16ADC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1CDF16B08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1CDF16CFC;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF16B70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1CDF16CFC;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF16BD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1CDF16CFC;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF16C40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1CDF16CFC;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1D17BBBA0](a1, v6, a5);
}

void *sub_1CDF16D30()
{
  return &unk_1E8B3AC10;
}

unint64_t sub_1CDF16D3C()
{
  return 0xD000000000000037;
}

void sub_1CDF16D58(const void *a1, uint64_t a2, unint64_t a3, void (__cdecl *a4)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  __CFNotificationCenter *v12;
  __CFNotificationCenter *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = sub_1CDF32C1C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = CFNotificationCenterGetDarwinNotifyCenter();
  if (v12)
  {
    v13 = v12;
    v20 = (__CFString *)sub_1CDF32D00();
    CFNotificationCenterAddObserver(v13, a1, a4, v20, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  else
  {
    v14 = sub_1CDF27238();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
    swift_bridgeObjectRetain_n();
    v15 = sub_1CDF32C10();
    v16 = sub_1CDF32E50();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v22 = v18;
      *(_DWORD *)v17 = 136315138;
      v20 = (__CFString *)(v17 + 4);
      swift_bridgeObjectRetain();
      v21 = sub_1CDF0D64C(a2, a3, &v22);
      sub_1CDF32EC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CDEBD000, v15, v16, "Could not get darwin notification center, failed to register object for notification %s", (uint8_t *)v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v18, -1, -1);
      MEMORY[0x1D17BBC9C](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

void sub_1CDF16F98(const void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __CFNotificationCenter *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  __CFNotificationCenter *v12;

  v2 = sub_1CDF32C1C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  if (v6)
  {
    v12 = v6;
    CFNotificationCenterRemoveEveryObserver(v6, a1);

  }
  else
  {
    v7 = sub_1CDF27238();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
    v8 = sub_1CDF32C10();
    v9 = sub_1CDF32E50();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1CDEBD000, v8, v9, "Could not get darwin notification center, failed to unregister object.", v10, 2u);
      MEMORY[0x1D17BBC9C](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_1CDF170D0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1CDF170D8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1CDF170E8()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for DarwinRegistrar()
{
  return objc_opt_self();
}

uint64_t sub_1CDF17118(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad) = 0;
  v3 = v2 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_signposter;
  v4 = sub_1CDF32BC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t sub_1CDF1718C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad) = 0;
  v3 = v1 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_signposter;
  v4 = sub_1CDF32BC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t sub_1CDF171EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_signpost_type_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint8_t *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = v0;
  v2 = sub_1CDF32BB0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v16 - v7;
  sub_1CDF32BA4();
  v9 = sub_1CDF32BBC();
  v10 = sub_1CDF32E8C();
  if ((sub_1CDF32EA4() & 1) != 0)
  {
    v11 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    v11(v6, v8, v2);
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    v13 = sub_1CDF32B98();
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v9, v10, v13, "ManageStorageDrilldown", "", v12, 2u);
    MEMORY[0x1D17BBC9C](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {

    v11 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  }
  v11(v6, v8, v2);
  sub_1CDF32BF8();
  swift_allocObject();
  v14 = sub_1CDF32BEC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad) = v14;
  return swift_release();
}

uint64_t sub_1CDF1739C(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  char v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  os_signpost_id_t v24;
  os_log_t v25;
  void (*v26)(_BYTE *, uint64_t);
  _BYTE v27[12];
  int v28;
  os_log_t v29;
  _BYTE *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;

  v2 = v1;
  v4 = sub_1CDF32BD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v27[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_1CDF32BB0();
  v9 = MEMORY[0x1E0C80A78](v8);
  result = MEMORY[0x1E0C80A78](v9);
  v14 = &v27[-v13];
  v15 = OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad;
  if (*(_QWORD *)(v2 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad))
  {
    v32 = result;
    v33 = v11;
    v30 = v12;
    v31 = a1;
    swift_retain();
    v16 = sub_1CDF32BBC();
    sub_1CDF32BE0();
    v17 = sub_1CDF32E80();
    if ((sub_1CDF32EA4() & 1) != 0)
    {
      v28 = v17;
      v29 = v16;
      swift_retain();
      sub_1CDF32C04();
      swift_release();
      if ((*(unsigned int (**)(_BYTE *, uint64_t))(v5 + 88))(v7, v4) == *MEMORY[0x1E0DF2190])
      {
        v18 = 0;
        v19 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
        v19 = "success: %{BOOL}d";
        v18 = 1;
      }
      v20 = v32;
      v21 = v33;
      v22 = v30;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v33 + 16))(v30, v14, v32);
      v23 = swift_slowAlloc();
      *(_BYTE *)v23 = 0;
      *(_BYTE *)(v23 + 1) = v18;
      *(_WORD *)(v23 + 2) = 1024;
      v34 = v31 & 1;
      sub_1CDF32EC8();
      v24 = sub_1CDF32B98();
      v25 = v29;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v29, (os_signpost_type_t)v28, v24, "ManageStorageDrilldown", v19, (uint8_t *)v23, 8u);
      MEMORY[0x1D17BBC9C](v23, -1, -1);

      v26 = *(void (**)(_BYTE *, uint64_t))(v21 + 8);
      v26(v14, v20);
      swift_release();
      v26(v22, v20);
    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v33 + 8))(v14, v32);
      swift_release();
    }
    *(_QWORD *)(v2 + v15) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_1CDF17634()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  _BYTE *v20;
  uint8_t *v21;
  uint64_t v22;
  os_signpost_id_t v23;
  os_log_t v24;
  void (*v25)(_BYTE *, uint64_t);
  _BYTE v26[12];
  int v27;
  os_log_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;

  v1 = v0;
  v2 = sub_1CDF32BD4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v26[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_1CDF32BB0();
  v7 = MEMORY[0x1E0C80A78](v6);
  result = MEMORY[0x1E0C80A78](v7);
  v12 = &v26[-v11];
  v13 = OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad))
  {
    v29 = v10;
    v30 = result;
    v31 = v9;
    swift_retain();
    v14 = sub_1CDF32BBC();
    sub_1CDF32BE0();
    v15 = sub_1CDF32E80();
    if ((sub_1CDF32EA4() & 1) != 0)
    {
      v27 = v15;
      v28 = v14;
      swift_retain();
      sub_1CDF32C04();
      swift_release();
      v16 = (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 88))(v5, v2);
      v17 = v31;
      if (v16 == *MEMORY[0x1E0DF2190])
      {
        v18 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
        v18 = "didExitBeforeLoaded";
      }
      v20 = v29;
      v19 = v30;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v17 + 16))(v29, v12, v30);
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      v22 = v17;
      v23 = sub_1CDF32B98();
      v24 = v28;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v28, (os_signpost_type_t)v27, v23, "ManageStorageDrilldown", v18, v21, 2u);
      MEMORY[0x1D17BBC9C](v21, -1, -1);

      v25 = *(void (**)(_BYTE *, uint64_t))(v22 + 8);
      v25(v12, v19);
      swift_release();
      v25(v20, v19);
    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v31 + 8))(v12, v30);
      swift_release();
    }
    *(_QWORD *)(v1 + v13) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_1CDF17890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_signposter;
  v2 = sub_1CDF32BC8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t sub_1CDF178E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_signposter;
  v2 = sub_1CDF32BC8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1CDF17944()
{
  return type metadata accessor for ManageStorageAnalytics();
}

uint64_t type metadata accessor for ManageStorageAnalytics()
{
  uint64_t result;

  result = qword_1EFA5B9B8;
  if (!qword_1EFA5B9B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CDF17988()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CDF32BC8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1CDF179FC()
{
  type metadata accessor for TaskLimiters();
  return sub_1CDF1B8B4();
}

uint64_t sub_1CDF17A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1CDF18524(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1E8B3AC30, (uint64_t)&unk_1EFA5AD20, (void (*)(char *, uint64_t, _QWORD *))sub_1CDF1009C);
}

uint64_t sub_1CDF17A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;

  v8[29] = v10;
  v8[30] = v11;
  v8[27] = a7;
  v8[28] = a8;
  v8[25] = a5;
  v8[26] = a6;
  v8[24] = a4;
  return swift_task_switch();
}

uint64_t sub_1CDF17A88()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 248) = *(_QWORD *)(*(_QWORD *)(v0 + 192) + OBJC_IVAR____TtC11iCloudQuota15ICQTaskLimiters_taskLimiters);
  return swift_task_switch();
}

uint64_t sub_1CDF17AAC()
{
  uint64_t *v0;

  v0[32] = sub_1CDF1A658(v0[25], v0[26]);
  return swift_task_switch();
}

uint64_t sub_1CDF17AF0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  id v6;
  _QWORD *v7;
  uint64_t (*v9)(_QWORD *, _QWORD, _QWORD, void *, _QWORD *, uint64_t);

  v1 = v0[32];
  v3 = v0[27];
  v2 = v0[28];
  v4 = (void *)v0[24];
  v5 = (_QWORD *)swift_allocObject();
  v0[33] = v5;
  v5[2] = v4;
  v5[3] = v3;
  v5[4] = v2;
  v9 = (uint64_t (*)(_QWORD *, _QWORD, _QWORD, void *, _QWORD *, uint64_t))(**(int **)(*(_QWORD *)v1 + 120)
                                                                                   + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v6 = v4;
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[34] = v7;
  *v7 = v0;
  v7[1] = sub_1CDF17BC8;
  return v9(v0 + 12, v0[25], v0[26], &unk_1EFA5AD70, v5, MEMORY[0x1E0DEE9B8] + 8);
}

uint64_t sub_1CDF17BC8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 280) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF17C34()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD);

  v1 = *(void (**)(uint64_t, _QWORD))(v0 + 232);
  sub_1CDF0E834(v0 + 96, v0 + 160);
  v1(v0 + 160, 0);
  swift_release();
  sub_1CDF16A0C(v0 + 160, &qword_1ED2B9B90);
  __swift_destroy_boxed_opaque_existential_0(v0 + 96);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF17CB4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t inited;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void (*v16)(uint64_t, id);
  id v17;

  v17 = *(id *)(v0 + 280);
  v16 = *(void (**)(uint64_t, id))(v0 + 232);
  swift_release();
  v1 = (void *)sub_1CDF32994();
  v2 = objc_msgSend(v1, sel_domain);
  sub_1CDF32D24();

  v3 = objc_msgSend(v1, sel_code);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AD78);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CDF39590;
  *(_QWORD *)(inited + 32) = sub_1CDF32D24();
  *(_QWORD *)(inited + 40) = v5;
  v6 = objc_msgSend(v1, sel_localizedDescription);
  v7 = sub_1CDF32D24();
  v9 = v8;

  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = v9;
  sub_1CDF18098(inited);
  v10 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  v11 = (void *)sub_1CDF32D00();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1CDF32CB8();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_initWithDomain_code_userInfo_, v11, v3, v12);

  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  v14 = v13;
  v16(v0 + 128, v13);
  swift_release();

  sub_1CDF16A0C(v0 + 128, &qword_1ED2B9B90);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF17EB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 48);
  v7 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1CDF16CFC;
  *(_QWORD *)(v5 + 240) = v4;
  *(_OWORD *)(v5 + 208) = v6;
  *(_OWORD *)(v5 + 224) = v7;
  *(_QWORD *)(v5 + 192) = v2;
  *(_QWORD *)(v5 + 200) = v3;
  return swift_task_switch();
}

uint64_t sub_1CDF17F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF17F48()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *v2 = v0;
  v2[1] = sub_1CDF17FF0;
  return sub_1CDF33000();
}

uint64_t sub_1CDF17FF0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CDF18064()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1CDF18098(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AD80);
  v2 = sub_1CDF32F70();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1CDF15D7C(v6, (uint64_t)&v15, qword_1EFA5AD88);
    v7 = v15;
    v8 = v16;
    result = sub_1CDF15BB0(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1CDF192E8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1CDF18360(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(__int128 *, void *);
  id v6;
  __int128 v8;
  __int128 v9;

  v5 = *(void (**)(__int128 *, void *))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v9 + 1) = swift_getObjectType();
    *(_QWORD *)&v8 = a2;
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(&v8, a3);

  swift_release();
  return sub_1CDF16A0C((uint64_t)&v8, &qword_1ED2B9B90);
}

uint64_t sub_1CDF183F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t v13;

  sub_1CDF15D7C(a1, (uint64_t)v12, &qword_1ED2B9B90);
  v5 = v13;
  if (v13)
  {
    v6 = __swift_project_boxed_opaque_existential_0(v12, v13);
    v7 = *(_QWORD *)(v5 - 8);
    MEMORY[0x1E0C80A78](v6);
    v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = sub_1CDF32FE8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v10, a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_1CDF184EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1CDF18524(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1E8B3AC58, (uint64_t)&unk_1EFA5AD30, (void (*)(char *, uint64_t, _QWORD *))sub_1CDF18AE4);
}

uint64_t sub_1CDF18524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(char *, uint64_t, _QWORD *))
{
  void *v9;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;

  v24 = a8;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = v9;
  v20[5] = a1;
  v20[6] = a2;
  v20[7] = a3;
  v20[8] = a4;
  v20[9] = a5;
  v20[10] = a6;
  v21 = v9;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  a9(v18, v24, v20);
  return swift_release();
}

uint64_t sub_1CDF1863C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;

  v8[7] = v10;
  v8[8] = v11;
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return swift_task_switch();
}

uint64_t sub_1CDF18668()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 72) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC11iCloudQuota15ICQTaskLimiters_taskLimiters);
  return swift_task_switch();
}

uint64_t sub_1CDF1868C()
{
  uint64_t *v0;

  v0[10] = sub_1CDF1A658(v0[3], v0[4]);
  return swift_task_switch();
}

uint64_t sub_1CDF186D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v1 = v0[10];
  v3 = v0[5];
  v2 = v0[6];
  v4 = swift_allocObject();
  v0[11] = v4;
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  v7 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  swift_retain();
  v5 = (_QWORD *)swift_task_alloc();
  v0[12] = v5;
  *v5 = v0;
  v5[1] = sub_1CDF18788;
  return v7();
}

uint64_t sub_1CDF18788()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF187F4()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 56))();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF18834()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF18874()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 48);
  v7 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1CDF16CFC;
  *(_QWORD *)(v5 + 64) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v5 + 48) = v7;
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_1CDF188EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF18908()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *v2 = v0;
  v2[1] = sub_1CDF189A8;
  return sub_1CDF32FDC();
}

uint64_t sub_1CDF189A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CDF189FC(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  a2(a6, v13);
  return swift_release();
}

uint64_t sub_1CDF18AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1CDF32DF0();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1CDF32DE4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_1CDF16A0C(a1, &qword_1ED2B9B68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CDF32DC0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1CDF18DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  void (*v7)(uint64_t, void *);
  _QWORD v9[6];

  v9[4] = a1;
  v9[5] = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = a4;
  v9[3] = a5;
  v6 = _Block_copy(v9);
  v7 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v7(a3, v6);
  _Block_release(v6);
  return swift_release();
}

id ICQTaskLimiters.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ICQTaskLimiters.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  objc_super v4;

  v1 = OBJC_IVAR____TtC11iCloudQuota15ICQTaskLimiters_taskLimiters;
  type metadata accessor for TaskLimiters();
  v2 = v0;
  *(_QWORD *)&v0[v1] = sub_1CDF1B8B4();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for ICQTaskLimiters();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for ICQTaskLimiters()
{
  return objc_opt_self();
}

id ICQTaskLimiters.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ICQTaskLimiters();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ICQTaskLimiters()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ICQTaskLimiters.perform(identifier:task:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of ICQTaskLimiters.performClosureNoParams(identifier:task:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t sub_1CDF18FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CDF18DAC(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)sub_1CDF0CE60, (uint64_t)&block_descriptor_1);
}

uint64_t sub_1CDF18FF4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1CDF19018()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1CDF19028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 48);
  v7 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1CDF15F64;
  *(_QWORD *)(v5 + 64) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v5 + 48) = v7;
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_1CDF190A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CDF18DAC(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)sub_1CDF18360, (uint64_t)&block_descriptor_30);
}

uint64_t sub_1CDF190C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CDF183F4(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1CDF190D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 48);
  v7 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1CDF15F64;
  *(_QWORD *)(v5 + 240) = v4;
  *(_OWORD *)(v5 + 208) = v6;
  *(_OWORD *)(v5 + 224) = v7;
  *(_QWORD *)(v5 + 192) = v2;
  *(_QWORD *)(v5 + 200) = v3;
  return swift_task_switch();
}

uint64_t sub_1CDF1914C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF19170(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1CDF16CFC;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF191D8(uint64_t a1)
{
  uint64_t v1;

  return sub_1CDF189FC(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), &qword_1ED2B9B60, (uint64_t)&unk_1E8B3ADE8, (uint64_t)sub_1CDF19214);
}

uint64_t sub_1CDF19208()
{
  return objectdestroy_39Tm(&qword_1ED2B9B60);
}

uint64_t sub_1CDF19214()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B60);
  return sub_1CDF32DD8();
}

uint64_t sub_1CDF19254()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF19280(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 24);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1CDF16CFC;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

_OWORD *sub_1CDF192E8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1CDF192F8(uint64_t a1)
{
  uint64_t v1;

  return sub_1CDF189FC(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), &qword_1ED2B9B58, (uint64_t)&unk_1E8B3AE60, (uint64_t)sub_1CDF19390);
}

uint64_t sub_1CDF19328()
{
  return objectdestroy_39Tm(&qword_1ED2B9B58);
}

uint64_t objectdestroy_39Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_1CDF19390(uint64_t a1, void *a2)
{
  id v4;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B58);
  if (a2)
  {
    *(_QWORD *)&v8[0] = a2;
    v4 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B58);
    return sub_1CDF32DCC();
  }
  else
  {
    sub_1CDF15D7C(a1, (uint64_t)&v6, &qword_1ED2B9B90);
    if (v7)
    {
      sub_1CDF192E8(&v6, v8);
      sub_1CDF0E834((uint64_t)v8, (uint64_t)&v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B58);
      sub_1CDF32DD8();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
    }
    else
    {
      return sub_1CDF16A0C((uint64_t)&v6, &qword_1ED2B9B90);
    }
  }
}

void _swift_dead_method_stub()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_1CDF19498()
{
  return MEMORY[0x1E0DEE9E0];
}

uint64_t sub_1CDF194A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v7[33] = a6;
  v7[34] = v6;
  v7[31] = a4;
  v7[32] = a5;
  v7[29] = a2;
  v7[30] = a3;
  v7[28] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  v7[35] = swift_task_alloc();
  v8 = sub_1CDF32C1C();
  v7[36] = v8;
  v7[37] = *(_QWORD *)(v8 - 8);
  v7[38] = swift_task_alloc();
  v7[39] = swift_task_alloc();
  v7[40] = swift_task_alloc();
  v7[41] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF1955C()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85[5];

  v1 = (_OWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 272) + 112;
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  if (!*(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    *(_QWORD *)(v0 + 88) = 0;
    *v1 = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
LABEL_10:
    sub_1CDF16A0C(v0 + 56, &qword_1ED2B9B50);
    goto LABEL_12;
  }
  v5 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_1CDF15BB0(v5, v4);
  if ((v7 & 1) != 0)
  {
    sub_1CDF1A878(*(_QWORD *)(v3 + 56) + 40 * v6, v0 + 56);
  }
  else
  {
    *(_QWORD *)(v0 + 88) = 0;
    *v1 = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 80))
    goto LABEL_10;
  sub_1CDF1A860((__int128 *)(v0 + 56), v0 + 16);
  sub_1CDF1A878(v0 + 16, v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2B9BC0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED2B9B88);
  sub_1CDF32E08();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v8 = *(_QWORD *)(v0 + 328);
    v10 = *(_QWORD *)(v0 + 288);
    v9 = *(_QWORD *)(v0 + 296);
    *(_QWORD *)(v0 + 336) = *(_QWORD *)(v0 + 208);
    v11 = sub_1CDF27238();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
    swift_bridgeObjectRetain_n();
    v12 = sub_1CDF32C10();
    v13 = sub_1CDF32E44();
    v14 = os_log_type_enabled(v12, v13);
    v15 = *(_QWORD *)(v0 + 328);
    v16 = *(_QWORD *)(v0 + 288);
    v17 = *(_QWORD *)(v0 + 296);
    v18 = *(_QWORD *)(v0 + 240);
    if (v14)
    {
      v75 = *(_QWORD *)(v0 + 232);
      v82 = *(_QWORD *)(v0 + 296);
      v19 = (uint8_t *)swift_slowAlloc();
      v79 = v16;
      v20 = swift_slowAlloc();
      v85[0] = v20;
      *(_DWORD *)v19 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 216) = sub_1CDF0D64C(v75, v18, v85);
      sub_1CDF32EC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CDEBD000, v12, v13, "TaskLimiter: reusing existing task for identifier %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v20, -1, -1);
      MEMORY[0x1D17BBC9C](v19, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v15, v79);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    }
    v73 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 344) = v73;
    *v73 = v0;
    v73[1] = sub_1CDF19E64;
    return sub_1CDF32DFC();
  }
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
LABEL_12:
  v21 = *(_QWORD *)(v0 + 320);
  v22 = *(_QWORD *)(v0 + 288);
  v23 = *(_QWORD *)(v0 + 296);
  v24 = sub_1CDF27238();
  v78 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v78(v21, v24, v22);
  swift_bridgeObjectRetain_n();
  v25 = sub_1CDF32C10();
  v26 = sub_1CDF32E44();
  v27 = os_log_type_enabled(v25, v26);
  v28 = *(_QWORD *)(v0 + 320);
  v29 = *(_QWORD *)(v0 + 288);
  v30 = *(_QWORD *)(v0 + 240);
  v76 = v24;
  if (v27)
  {
    v31 = *(_QWORD *)(v0 + 232);
    v83 = *(_QWORD *)(v0 + 296);
    v32 = (uint8_t *)swift_slowAlloc();
    v80 = v28;
    v33 = swift_slowAlloc();
    v85[0] = v33;
    *(_DWORD *)v32 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 192) = sub_1CDF0D64C(v31, v30, v85);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CDEBD000, v25, v26, "TaskLimiter: creating new task for identifier %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v33, -1, -1);
    MEMORY[0x1D17BBC9C](v32, -1, -1);

    v34 = v80;
    v35 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
  }
  else
  {
    v36 = *(_QWORD *)(v0 + 296);
    swift_bridgeObjectRelease_n();

    v35 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v34 = v28;
  }
  v81 = v35;
  v35(v34, v29);
  v37 = v78;
  v38 = *(_QWORD *)(v0 + 312);
  v40 = *(_QWORD *)(v0 + 280);
  v39 = *(_QWORD *)(v0 + 288);
  v42 = *(_QWORD *)(v0 + 256);
  v41 = *(_QWORD *)(v0 + 264);
  v43 = *(_QWORD *)(v0 + 248);
  v44 = sub_1CDF32DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v40, 1, 1, v44);
  v45 = (_QWORD *)swift_allocObject();
  v45[2] = 0;
  v45[3] = 0;
  v45[4] = v41;
  v45[5] = v43;
  v45[6] = v42;
  swift_retain();
  v84 = sub_1CDF1A3C4(v40, (uint64_t)&unk_1EFA5ADA8, (uint64_t)v45);
  *(_QWORD *)(v0 + 360) = v84;
  v78(v38, v76, v39);
  swift_bridgeObjectRetain_n();
  v46 = sub_1CDF32C10();
  v47 = sub_1CDF32E44();
  v48 = os_log_type_enabled(v46, v47);
  v49 = *(_QWORD *)(v0 + 312);
  v50 = *(_QWORD *)(v0 + 288);
  v51 = *(_QWORD *)(v0 + 240);
  if (v48)
  {
    v52 = *(_QWORD *)(v0 + 232);
    v74 = *(_QWORD *)(v0 + 312);
    v53 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    v85[0] = v54;
    *(_DWORD *)v53 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 184) = sub_1CDF0D64C(v52, v51, v85);
    v37 = v78;
    sub_1CDF32EC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CDEBD000, v46, v47, "TaskLimiter: storing task for identifier %s", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v54, -1, -1);
    MEMORY[0x1D17BBC9C](v53, -1, -1);

    v56 = v50;
    v55 = v74;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    v55 = v49;
    v56 = v50;
  }
  v81(v55, v56);
  v57 = *(_QWORD *)(v0 + 304);
  v58 = *(_QWORD *)(v0 + 288);
  v60 = *(_QWORD *)(v0 + 232);
  v59 = *(_QWORD *)(v0 + 240);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED2B9B88);
  v85[3] = sub_1CDF32E08();
  v85[4] = (uint64_t)&off_1E8B3AEA8;
  v85[0] = v84;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1CDF1A4F4((uint64_t)v85, v60, v59);
  swift_endAccess();
  v37(v57, v76, v58);
  swift_bridgeObjectRetain_n();
  v61 = sub_1CDF32C10();
  v62 = sub_1CDF32E44();
  v63 = os_log_type_enabled(v61, v62);
  v64 = *(_QWORD *)(v0 + 304);
  v65 = *(_QWORD *)(v0 + 288);
  v66 = *(_QWORD *)(v0 + 240);
  if (v63)
  {
    v67 = *(_QWORD *)(v0 + 232);
    v77 = *(_QWORD *)(v0 + 304);
    v68 = (uint8_t *)swift_slowAlloc();
    v69 = swift_slowAlloc();
    v85[0] = v69;
    *(_DWORD *)v68 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 200) = sub_1CDF0D64C(v67, v66, v85);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CDEBD000, v61, v62, "TaskLimiter: performing task operation for identifier %s", v68, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v69, -1, -1);
    MEMORY[0x1D17BBC9C](v68, -1, -1);

    v70 = v77;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    v70 = v64;
  }
  v81(v70, v65);
  v71 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 368) = v71;
  *v71 = v0;
  v71[1] = sub_1CDF19F40;
  return sub_1CDF32DFC();
}

uint64_t sub_1CDF19E64()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 352) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CDF19EC8()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF19F40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 376) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CDF19FA4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  swift_release();
  sub_1CDF1A134(v3, v2, v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF1A028()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF1A0A8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  swift_release();
  sub_1CDF1A134(v3, v2, v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF1A134(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;

  v6 = sub_1CDF32C1C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CDF27238();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  v11 = sub_1CDF32C10();
  v12 = sub_1CDF32E44();
  if (os_log_type_enabled(v11, v12))
  {
    v19 = a3;
    v13 = swift_slowAlloc();
    v18 = v6;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc();
    *(_QWORD *)&v21[0] = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    v20 = sub_1CDF0D64C(a1, a2, (uint64_t *)v21);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CDEBD000, v11, v12, "TaskLimiter: cleaning up task for identifier %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v15, -1, -1);
    MEMORY[0x1D17BBC9C](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v18);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1CDF1A4F4((uint64_t)v21, a1, a2);
  return swift_endAccess();
}

uint64_t sub_1CDF1A360(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_1CDF15F64;
  return v8(a1);
}

uint64_t sub_1CDF1A3C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1CDF32DF0();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1CDF32DE4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_1CDF16A0C(a1, &qword_1ED2B9B68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CDF32DC0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1CDF1A4F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  __int128 v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1CDF1A860((__int128 *)a1, (uint64_t)v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_1CDF1B1F4(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CDF16A0C(a1, &qword_1ED2B9B50);
    sub_1CDF1A8DC(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_1CDF16A0C((uint64_t)v9, &qword_1ED2B9B50);
  }
}

uint64_t sub_1CDF1A5C8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1CDF1A5F0()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x1E0DEE9E0];
  return v0;
}

uint64_t sub_1CDF1A630()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x1E0DEE9E0];
  return v0;
}

uint64_t sub_1CDF1A658(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;

  v5 = (uint64_t *)(v2 + 112);
  swift_beginAccess();
  v6 = *(_QWORD *)(v2 + 112);
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  v7 = sub_1CDF15BB0(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    type metadata accessor for TaskLimiter();
    v9 = swift_allocObject();
    swift_defaultActor_initialize();
    *(_QWORD *)(v9 + 112) = MEMORY[0x1E0DEE9E0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v5;
    *v5 = 0x8000000000000000;
    sub_1CDF1B328(v9, a1, a2, isUniquelyReferenced_nonNull_native);
    *v5 = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return v9;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1CDF1A7A0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF1A7CC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[5];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1CDF15F64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EFA5ADA0 + dword_1EFA5ADA0))(a1, v4, v5, v6);
}

uint64_t sub_1CDF1A860(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1CDF1A878(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for TaskLimiter()
{
  return objc_opt_self();
}

double sub_1CDF1A8DC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1CDF15BB0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1CDF1B510();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1CDF1A860((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v8), a3);
    sub_1CDF1B00C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1CDF1A9D4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B80);
  v37 = a2;
  v6 = sub_1CDF32F64();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_1CDF1A860(v25, (uint64_t)v38);
    }
    else
    {
      sub_1CDF1A878((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_1CDF33048();
    sub_1CDF32D30();
    result = sub_1CDF33060();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = sub_1CDF1A860(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CDF1ACF8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B78);
  v36 = a2;
  v6 = sub_1CDF32F64();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1CDF33048();
    sub_1CDF32D30();
    result = sub_1CDF33060();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1CDF1B00C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CDF32EF8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1CDF33048();
        swift_bridgeObjectRetain();
        sub_1CDF32D30();
        v11 = sub_1CDF33060();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1CDF1B1F4(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1CDF15BB0(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7] + 40 * v12;
        __swift_destroy_boxed_opaque_existential_0(v19);
        return sub_1CDF1A860(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1CDF1B510();
      goto LABEL_7;
    }
    sub_1CDF1A9D4(v15, a4 & 1);
    v21 = sub_1CDF15BB0(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CDF1B4A4(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1CDF3300C();
  __break(1u);
  return result;
}

uint64_t sub_1CDF1B328(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CDF15BB0(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1CDF1B6F8();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CDF1ACF8(v15, a4 & 1);
  v21 = sub_1CDF15BB0(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CDF3300C();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for TaskLimiters()
{
  return objc_opt_self();
}

uint64_t sub_1CDF1B4A4(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1CDF1A860(a4, a5[7] + 40 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_1CDF1B510()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B80);
  v2 = *v0;
  v3 = sub_1CDF32F58();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 40 * v15;
    sub_1CDF1A878(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1CDF1A860(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1CDF1B6F8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B78);
  v2 = *v0;
  v3 = sub_1CDF32F58();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1CDF1B8B8()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_1CDF32F94();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_1CDF1B908(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7373696D736964;
  else
    return 0x79616C70736964;
}

uint64_t sub_1CDF1B938(char *a1, char *a2)
{
  return sub_1CDF1B944(*a1, *a2);
}

uint64_t sub_1CDF1B944(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x7373696D736964;
  else
    v2 = 0x79616C70736964;
  if ((a2 & 1) != 0)
    v3 = 0x7373696D736964;
  else
    v3 = 0x79616C70736964;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_1CDF32FF4();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_1CDF1B9C0()
{
  return sub_1CDF1B9C8();
}

uint64_t sub_1CDF1B9C8()
{
  sub_1CDF33048();
  sub_1CDF32D30();
  swift_bridgeObjectRelease();
  return sub_1CDF33060();
}

uint64_t sub_1CDF1BA3C()
{
  return sub_1CDF1BA44();
}

uint64_t sub_1CDF1BA44()
{
  sub_1CDF32D30();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CDF1BA88()
{
  return sub_1CDF1BA90();
}

uint64_t sub_1CDF1BA90()
{
  sub_1CDF33048();
  sub_1CDF32D30();
  swift_bridgeObjectRelease();
  return sub_1CDF33060();
}

uint64_t sub_1CDF1BB00@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1CDF32F94();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_1CDF1BB5C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1CDF1B908(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1CDF1BB84()
{
  sub_1CDF1F41C();
  return sub_1CDF32D54();
}

uint64_t sub_1CDF1BBE0()
{
  sub_1CDF1F41C();
  return sub_1CDF32D48();
}

unint64_t sub_1CDF1BC2C()
{
  return 0xD000000000000015;
}

unint64_t sub_1CDF1BC48()
{
  return 0xD000000000000015;
}

unint64_t sub_1CDF1BC64()
{
  return 0xD00000000000001CLL;
}

unint64_t sub_1CDF1BC80()
{
  return 0xD000000000000011;
}

unint64_t sub_1CDF1BC9C()
{
  return 0xD000000000000017;
}

id sub_1CDF1BCB8()
{
  objc_class *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  void *v7;
  char *v8;
  id v9;
  id result;
  objc_super v11;

  v0 = (objc_class *)type metadata accessor for BubbleBannerTracker();
  v1 = (char *)objc_allocWithZone(v0);
  v2 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey];
  *(_QWORD *)v2 = 0xD000000000000015;
  *((_QWORD *)v2 + 1) = 0x80000001CDF401B0;
  v3 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDisplayedKey];
  *(_QWORD *)v3 = 0xD000000000000015;
  *((_QWORD *)v3 + 1) = 0x80000001CDF401D0;
  v4 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerCAEventKey];
  *(_QWORD *)v4 = 0xD00000000000001CLL;
  *((_QWORD *)v4 + 1) = 0x80000001CDF401F0;
  v5 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kFullReason];
  *(_QWORD *)v5 = 0xD000000000000011;
  *((_QWORD *)v5 + 1) = 0x80000001CDF40210;
  v6 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kAlmostFullReason];
  *(_QWORD *)v6 = 0xD000000000000017;
  *((_QWORD *)v6 + 1) = 0x80000001CDF40230;
  v7 = (void *)objc_opt_self();
  v8 = v1;
  v9 = objc_msgSend(v7, sel_standardUserDefaults);
  *(_QWORD *)&v8[OBJC_IVAR___ICQBubbleBannerTracker_userDefaults] = v9;

  v11.receiver = v8;
  v11.super_class = v0;
  result = objc_msgSendSuper2(&v11, sel_init);
  qword_1EFA5BAD8 = (uint64_t)result;
  return result;
}

id sub_1CDF1BE00(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_1CDF1EC18(a1);

  return v4;
}

uint64_t *sub_1CDF1BE3C()
{
  if (qword_1EFA5BAD0 != -1)
    swift_once();
  return &qword_1EFA5BAD8;
}

id static BubbleBannerTracker.shared.getter()
{
  if (qword_1EFA5BAD0 != -1)
    swift_once();
  return (id)qword_1EFA5BAD8;
}

id sub_1CDF1BEFC(void *a1)
{
  id v2;

  v2 = sub_1CDF1EC18(a1);

  return v2;
}

id sub_1CDF1BF28(void *a1, uint64_t a2)
{
  return sub_1CDF1ED60(a1, a2, 0);
}

id sub_1CDF1BF38(void *a1, uint64_t a2)
{
  return sub_1CDF1ED60(a1, a2, 1);
}

uint64_t sub_1CDF1BF48(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v16;

  v9 = sub_1CDF32A78();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CDF32A54();
  v13 = a3;
  v14 = a1;
  sub_1CDF1ED60(v13, (uint64_t)v12, a6);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void sub_1CDF1C008(char a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v5;
  BOOL v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[6];

  v10 = *(_QWORD *)(v5 + OBJC_IVAR___ICQBubbleBannerTracker_kFullReason) == a2
     && *(_QWORD *)(v5 + OBJC_IVAR___ICQBubbleBannerTracker_kFullReason + 8) == a3;
  if (v10 || (sub_1CDF32FF4() & 1) != 0)
  {
    v12 = 0;
  }
  else if (*(_QWORD *)(v5 + OBJC_IVAR___ICQBubbleBannerTracker_kAlmostFullReason) == a2
         && *(_QWORD *)(v5 + OBJC_IVAR___ICQBubbleBannerTracker_kAlmostFullReason + 8) == a3)
  {
    v12 = 1;
  }
  else if ((sub_1CDF32FF4() & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v12 = -1;
  }
  v13 = (void *)sub_1CDF32D00();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  *(_BYTE *)(v14 + 24) = a1 & 1;
  *(double *)(v14 + 32) = a4;
  *(double *)(v14 + 40) = a5;
  v17[4] = sub_1CDF1F470;
  v17[5] = v14;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1CDF1C27C;
  v17[3] = &block_descriptor_2;
  v15 = _Block_copy(v17);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v15);

}

unint64_t sub_1CDF1C164(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_1EFA5AE38);
  v2 = (_QWORD *)sub_1CDF32F70();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_1CDF15BB0(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_1CDF1C27C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_1CDF1F58C();
    v4 = (void *)sub_1CDF32CB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_1CDF1C2F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  sub_1CDF32A60();
  v2 = sub_1CDF32A78();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

uint64_t sub_1CDF1C330(void *a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  char *v6;
  char *v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  unint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t result;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  unsigned int (*v71)(char *, uint64_t, uint64_t);
  void (*v72)(char *, char *, uint64_t);
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  id v92;
  NSObject *v93;
  os_log_type_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  char *v101;
  uint64_t v102;
  void (*v103)(uint64_t, char *, uint64_t);
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  void (*v114)(uint64_t, uint64_t);
  uint64_t v115;
  unint64_t v116;
  os_log_t v117;
  void (*v118)(char *, uint64_t);
  char *v119;
  NSObject *v120;
  os_log_type_t v121;
  uint8_t *v122;
  uint64_t v123;
  char *v124;
  double v125;
  uint64_t v126;
  char *v127;
  NSObject *v128;
  os_log_type_t v129;
  uint8_t *v130;
  uint64_t v131;
  char *v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  char *v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  char *v147;
  char *v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  Class isa;
  os_log_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  id v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;

  v7 = v6;
  v150 = a4;
  v151 = a5;
  v158 = a1;
  v10 = sub_1CDF32C1C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v135 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v135 - v16;
  v18 = MEMORY[0x1E0C80A78](v15);
  v148 = (char *)&v135 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v149 = (char *)&v135 - v21;
  v22 = MEMORY[0x1E0C80A78](v20);
  v147 = (char *)&v135 - v23;
  MEMORY[0x1E0C80A78](v22);
  v152 = (char *)&v135 - v24;
  v25 = sub_1CDF32B08();
  v155 = *(_QWORD *)(v25 - 8);
  v156 = v25;
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)&v135 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1CDF32B14();
  isa = v28[-1].isa;
  v154 = v28;
  MEMORY[0x1E0C80A78](v28);
  v30 = (char *)&v135 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5ADB0);
  v32 = MEMORY[0x1E0C80A78](v31);
  v34 = (char *)&v135 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v32);
  v36 = (char *)&v135 - v35;
  v37 = sub_1CDF32A78();
  v38 = MEMORY[0x1E0C80A78](v37);
  v39 = MEMORY[0x1E0C80A78](v38);
  v40 = MEMORY[0x1E0C80A78](v39);
  v41 = MEMORY[0x1E0C80A78](v40);
  v42 = MEMORY[0x1E0C80A78](v41);
  if ((a6 & 1) != 0)
  {
    v49 = sub_1CDF27368();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v49, v10);
    v50 = sub_1CDF32C10();
    v51 = sub_1CDF32E44();
    v52 = v10;
    if (os_log_type_enabled(v50, v51))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = swift_slowAlloc();
      *(_QWORD *)&v159 = v54;
      *(_DWORD *)v53 = 136315138;
      v161 = sub_1CDF0D64C(0xD00000000000003ALL, 0x80000001CDF40250, (uint64_t *)&v159);
      sub_1CDF32EC8();
      _os_log_impl(&dword_1CDEBD000, v50, v51, "%s Banner was dismissed in the same session returning false", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v54, -1, -1);
      MEMORY[0x1D17BBC9C](v53, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v52);
    return 0;
  }
  v136 = v44;
  v137 = v43;
  v143 = v48;
  v138 = v47;
  v139 = v46;
  v140 = (char *)&v135 - v45;
  v144 = v42;
  v145 = v7;
  v146 = v11;
  v157 = v10;
  v56 = *(void **)&v7[OBJC_IVAR___ICQBubbleBannerTracker_userDefaults];
  v57 = *(_QWORD *)&v7[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey + 8];
  v141 = *(_QWORD *)&v7[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey];
  v142 = v57;
  v58 = (void *)sub_1CDF32D00();
  v59 = objc_msgSend(v56, sel_dictionaryForKey_, v58);

  if (!v59)
  {
LABEL_22:
    v88 = sub_1CDF27368();
    v89 = v146;
    v90 = v17;
    v91 = v157;
    (*(void (**)(char *, uint64_t, uint64_t))(v146 + 16))(v17, v88, v157);
    v92 = v145;
    v93 = sub_1CDF32C10();
    v94 = sub_1CDF32E44();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = swift_slowAlloc();
      v96 = swift_slowAlloc();
      *(_QWORD *)&v159 = v96;
      *(_DWORD *)v95 = 136315394;
      v161 = sub_1CDF0D64C(0xD00000000000003ALL, 0x80000001CDF40250, (uint64_t *)&v159);
      sub_1CDF32EC8();
      *(_WORD *)(v95 + 12) = 2080;
      v97 = v142;
      swift_bridgeObjectRetain();
      v161 = sub_1CDF0D64C(v141, v97, (uint64_t *)&v159);
      sub_1CDF32EC8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CDEBD000, v93, v94, "%s No cached event found for, possibly first display of the banner %s returning true", (uint8_t *)v95, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v96, -1, -1);
      MEMORY[0x1D17BBC9C](v95, -1, -1);

      (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v157);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v89 + 8))(v17, v91);
    }
    return 1;
  }
  v60 = sub_1CDF32CC4();

  result = (uint64_t)objc_msgSend(v158, sel_aa_altDSID);
  if (result)
  {
    v62 = (void *)result;
    v63 = sub_1CDF32D24();
    v65 = v64;

    if (*(_QWORD *)(v60 + 16) && (v66 = sub_1CDF15BB0(v63, v65), (v67 & 1) != 0))
    {
      sub_1CDF0E834(*(_QWORD *)(v60 + 56) + 32 * v66, (uint64_t)&v159);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v160 + 1))
      {
        v68 = v144;
        v69 = swift_dynamicCast();
        v70 = v143;
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v143 + 56))(v36, v69 ^ 1u, 1, v68);
        v71 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48);
        if (v71(v36, 1, v68) != 1)
        {
          v72 = *(void (**)(char *, char *, uint64_t))(v70 + 32);
          v72(v140, v36, v68);
          result = sub_1CDF32A60();
          v73 = a2 / 1000.0;
          if ((~COERCE__INT64(a2 / 1000.0) & 0x7FF0000000000000) != 0)
          {
            if (v73 > -9.22337204e18)
            {
              v74 = v157;
              if (v73 < 9.22337204e18)
              {
                sub_1CDF32AFC();
                v76 = v155;
                v75 = v156;
                (*(void (**)(char *, _QWORD, uint64_t))(v155 + 104))(v27, *MEMORY[0x1E0CB1188], v156);
                v77 = v140;
                sub_1CDF32AF0();
                (*(void (**)(char *, uint64_t))(v76 + 8))(v27, v75);
                (*((void (**)(char *, os_log_t))isa + 1))(v30, v154);
                v78 = v144;
                if (v71(v34, 1, v144) == 1)
                {
                  sub_1CDF16A0C((uint64_t)v34, &qword_1EFA5ADB0);
                  v79 = sub_1CDF27368();
                  v80 = v146;
                  v81 = v148;
                  (*(void (**)(char *, uint64_t, uint64_t))(v146 + 16))(v148, v79, v74);
                  v82 = sub_1CDF32C10();
                  v83 = sub_1CDF32E44();
                  if (os_log_type_enabled(v82, v83))
                  {
                    v84 = (uint8_t *)swift_slowAlloc();
                    v85 = swift_slowAlloc();
                    *(_QWORD *)&v159 = v85;
                    *(_DWORD *)v84 = 136315138;
                    v161 = sub_1CDF0D64C(0xD00000000000003ALL, 0x80000001CDF40250, (uint64_t *)&v159);
                    sub_1CDF32EC8();
                    _os_log_impl(&dword_1CDEBD000, v82, v83, "%s Unable to compute endate from given info.", v84, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x1D17BBC9C](v85, -1, -1);
                    MEMORY[0x1D17BBC9C](v84, -1, -1);
                  }

                  (*(void (**)(char *, uint64_t))(v80 + 8))(v81, v74);
                  v86 = *(void (**)(uint64_t, uint64_t))(v143 + 8);
                  v87 = v144;
                  v86((uint64_t)v139, v144);
                  v86((uint64_t)v140, v87);
                }
                else
                {
                  v72(v138, v34, v78);
                  v98 = sub_1CDF27368();
                  v99 = v146;
                  v100 = *(void **)(v146 + 16);
                  v101 = v152;
                  v156 = v98;
                  v158 = v100;
                  ((void (*)(char *))v100)(v152);
                  v102 = v143;
                  v103 = *(void (**)(uint64_t, char *, uint64_t))(v143 + 16);
                  v104 = v136;
                  v103(v136, v77, v78);
                  v105 = v137;
                  v103(v137, v139, v78);
                  v106 = sub_1CDF32C10();
                  v107 = sub_1CDF32E44();
                  v108 = v107;
                  if (os_log_type_enabled(v106, v107))
                  {
                    v109 = swift_slowAlloc();
                    LODWORD(v155) = v108;
                    v110 = v109;
                    v111 = swift_slowAlloc();
                    *(_QWORD *)&v159 = v111;
                    *(_DWORD *)v110 = 136315906;
                    v154 = v106;
                    v161 = sub_1CDF0D64C(0xD00000000000003ALL, 0x80000001CDF40250, (uint64_t *)&v159);
                    sub_1CDF32EC8();
                    *(_WORD *)(v110 + 12) = 2080;
                    sub_1CDF1F22C(&qword_1EFA5ADD0, MEMORY[0x1E0CB08F0]);
                    v112 = sub_1CDF32FD0();
                    v161 = sub_1CDF0D64C(v112, v113, (uint64_t *)&v159);
                    sub_1CDF32EC8();
                    swift_bridgeObjectRelease();
                    v114 = *(void (**)(uint64_t, uint64_t))(v102 + 8);
                    v114(v104, v78);
                    *(_WORD *)(v110 + 22) = 2048;
                    v161 = *(_QWORD *)&a2;
                    sub_1CDF32EC8();
                    *(_WORD *)(v110 + 32) = 2080;
                    v74 = v157;
                    v115 = sub_1CDF32FD0();
                    v161 = sub_1CDF0D64C(v115, v116, (uint64_t *)&v159);
                    sub_1CDF32EC8();
                    swift_bridgeObjectRelease();
                    v114(v105, v78);
                    v117 = v154;
                    _os_log_impl(&dword_1CDEBD000, v154, (os_log_type_t)v155, "%s Checking Banner supression threshold lastDismissed: %s supressUntil: %f current: %s", (uint8_t *)v110, 0x2Au);
                    swift_arrayDestroy();
                    MEMORY[0x1D17BBC9C](v111, -1, -1);
                    MEMORY[0x1D17BBC9C](v110, -1, -1);

                    v118 = *(void (**)(char *, uint64_t))(v146 + 8);
                    v118(v152, v74);
                  }
                  else
                  {
                    v114 = *(void (**)(uint64_t, uint64_t))(v102 + 8);
                    v114(v104, v78);
                    v114(v105, v78);

                    v118 = *(void (**)(char *, uint64_t))(v99 + 8);
                    v118(v101, v74);
                  }
                  v119 = v149;
                  sub_1CDF1F22C(&qword_1EFA5ADC8, MEMORY[0x1E0CB08B0]);
                  if ((sub_1CDF32CE8() & 1) == 0)
                  {
                    v127 = v147;
                    ((void (*)(char *, uint64_t, uint64_t))v158)(v147, v156, v74);
                    v128 = sub_1CDF32C10();
                    v129 = sub_1CDF32E44();
                    if (os_log_type_enabled(v128, v129))
                    {
                      v130 = (uint8_t *)swift_slowAlloc();
                      v131 = swift_slowAlloc();
                      *(_QWORD *)&v159 = v131;
                      *(_DWORD *)v130 = 136315138;
                      v161 = sub_1CDF0D64C(0xD00000000000003ALL, 0x80000001CDF40250, (uint64_t *)&v159);
                      sub_1CDF32EC8();
                      _os_log_impl(&dword_1CDEBD000, v128, v129, "%s Supression threshold passed. Displaying banner", v130, 0xCu);
                      swift_arrayDestroy();
                      MEMORY[0x1D17BBC9C](v131, -1, -1);
                      MEMORY[0x1D17BBC9C](v130, -1, -1);
                    }

                    v118(v127, v74);
                    v132 = v140;
                    sub_1CDF32A48();
                    v55 = 1;
                    sub_1CDF1C008(1, v150, v151, v133, a2);
                    v134 = v144;
                    v114((uint64_t)v138, v144);
                    v114((uint64_t)v139, v134);
                    v114((uint64_t)v132, v134);
                    return v55;
                  }
                  ((void (*)(char *, uint64_t, uint64_t))v158)(v119, v156, v74);
                  v120 = sub_1CDF32C10();
                  v121 = sub_1CDF32E44();
                  if (os_log_type_enabled(v120, v121))
                  {
                    v122 = (uint8_t *)swift_slowAlloc();
                    v123 = swift_slowAlloc();
                    *(_QWORD *)&v159 = v123;
                    *(_DWORD *)v122 = 136315138;
                    v161 = sub_1CDF0D64C(0xD00000000000003ALL, 0x80000001CDF40250, (uint64_t *)&v159);
                    sub_1CDF32EC8();
                    _os_log_impl(&dword_1CDEBD000, v120, v121, "%s Supression threshold not passed. Supressing banner", v122, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x1D17BBC9C](v123, -1, -1);
                    MEMORY[0x1D17BBC9C](v122, -1, -1);
                  }

                  v118(v119, v74);
                  v124 = v140;
                  sub_1CDF32A48();
                  sub_1CDF1C008(0, v150, v151, v125, a2);
                  v126 = v144;
                  v114((uint64_t)v138, v144);
                  v114((uint64_t)v139, v126);
                  v114((uint64_t)v124, v126);
                }
                return 0;
              }
              goto LABEL_39;
            }
          }
          else
          {
            __break(1u);
          }
          __break(1u);
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
        goto LABEL_21;
      }
    }
    else
    {
      v159 = 0u;
      v160 = 0u;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    sub_1CDF16A0C((uint64_t)&v159, &qword_1ED2B9B90);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v143 + 56))(v36, 1, 1, v144);
LABEL_21:
    sub_1CDF16A0C((uint64_t)v36, &qword_1EFA5ADB0);
    goto LABEL_22;
  }
LABEL_40:
  __break(1u);
  return result;
}

id sub_1CDF1D434@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>, uint64_t a5@<D0>)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  id result;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  void (*v58)(char *, _QWORD, uint64_t, uint64_t);
  unsigned int (*v59)(char *, uint64_t, uint64_t);
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  uint64_t v62;
  double v63;
  _QWORD *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  char *v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(_QWORD);
  char *v90;
  uint64_t v91;
  char *v92;
  void (*v93)(char *, char *, uint64_t);
  char *v94;
  char *v95;
  char *v96;
  NSObject *v97;
  os_log_type_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  void (*v104)(char *, uint64_t);
  uint64_t v105;
  unint64_t v106;
  char *v107;
  uint64_t v108;
  unint64_t v109;
  os_log_t v110;
  uint64_t v111;
  void (*v112)(char *, uint64_t);
  char *v113;
  NSObject *v114;
  os_log_type_t v115;
  uint8_t *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  NSObject *v121;
  os_log_type_t v122;
  uint8_t *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  char *v127;
  char *v128;
  _QWORD *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  void (*v133)(char *, char *, uint64_t);
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  os_log_t v142;
  uint64_t v143;
  _QWORD *v144;
  char *v145;
  char *v146;
  char *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  _QWORD *v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;

  v149 = a2;
  v150 = a3;
  v152 = a4;
  v8 = sub_1CDF32C1C();
  v153 = *(_QWORD *)(v8 - 8);
  v154 = v8;
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v133 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v138 = (char *)&v133 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v139 = (char *)&v133 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v135 = (char *)&v133 - v17;
  MEMORY[0x1E0C80A78](v16);
  v141 = (char *)&v133 - v18;
  v144 = (_QWORD *)sub_1CDF32B08();
  v19 = *(v144 - 1);
  MEMORY[0x1E0C80A78](v144);
  v21 = (char *)&v133 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v143 = sub_1CDF32B14();
  v142 = *(os_log_t *)(v143 - 8);
  MEMORY[0x1E0C80A78](v143);
  v23 = (char *)&v133 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5ADB0);
  v25 = MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v133 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v25);
  v29 = (char *)&v133 - v28;
  v30 = sub_1CDF32A78();
  v155 = *(_QWORD *)(v30 - 8);
  v156 = v30;
  v31 = MEMORY[0x1E0C80A78](v30);
  v134 = (char *)&v133 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x1E0C80A78](v31);
  v140 = (char *)&v133 - v34;
  v35 = MEMORY[0x1E0C80A78](v33);
  v137 = (char *)&v133 - v36;
  v37 = MEMORY[0x1E0C80A78](v35);
  v136 = (char *)&v133 - v38;
  v39 = MEMORY[0x1E0C80A78](v37);
  v145 = (char *)&v133 - v40;
  v41 = MEMORY[0x1E0C80A78](v39);
  v147 = (char *)&v133 - v42;
  MEMORY[0x1E0C80A78](v41);
  v146 = (char *)&v133 - v43;
  v44 = *(void **)((char *)v5 + OBJC_IVAR___ICQBubbleBannerTracker_userDefaults);
  v151 = v5;
  v45 = (void *)sub_1CDF32D00();
  v46 = objc_msgSend(v44, sel_dictionaryForKey_, v45);

  if (!v46)
    goto LABEL_16;
  v47 = sub_1CDF32CC4();

  v148 = a1;
  result = objc_msgSend(a1, sel_aa_altDSID);
  if (result)
  {
    v49 = result;
    v50 = sub_1CDF32D24();
    v52 = v51;

    if (*(_QWORD *)(v47 + 16) && (v53 = sub_1CDF15BB0(v50, v52), (v54 & 1) != 0))
    {
      sub_1CDF0E834(*(_QWORD *)(v47 + 56) + 32 * v53, (uint64_t)&v157);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v158 + 1))
      {
        v55 = v156;
        v56 = swift_dynamicCast();
        v57 = v155;
        v58 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v155 + 56);
        v58(v29, v56 ^ 1u, 1, v55);
        v59 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48);
        if (v59(v29, 1, v55) != 1)
        {
          v60 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
          v61 = v146;
          v62 = v156;
          v133 = v60;
          v60(v146, v29, v156);
          result = (id)sub_1CDF32A60();
          v63 = *(double *)&a5 / 1000.0;
          if ((~COERCE__INT64(*(double *)&a5 / 1000.0) & 0x7FF0000000000000) != 0)
          {
            if (v63 > -9.22337204e18)
            {
              if (v63 < 9.22337204e18)
              {
                sub_1CDF32AFC();
                v64 = v144;
                (*(void (**)(char *, _QWORD, _QWORD *))(v19 + 104))(v21, *MEMORY[0x1E0CB1188], v144);
                v65 = v61;
                sub_1CDF32AF0();
                (*(void (**)(char *, _QWORD *))(v19 + 8))(v21, v64);
                ((void (*)(char *, uint64_t))v142[1].isa)(v23, v143);
                if (v59(v27, 1, v62) == 1)
                {
                  sub_1CDF16A0C((uint64_t)v27, &qword_1EFA5ADB0);
                  v66 = sub_1CDF27368();
                  v68 = v153;
                  v67 = v154;
                  v69 = v138;
                  (*(void (**)(char *, uint64_t, uint64_t))(v153 + 16))(v138, v66, v154);
                  v70 = sub_1CDF32C10();
                  v71 = sub_1CDF32E44();
                  if (os_log_type_enabled(v70, v71))
                  {
                    v72 = (uint8_t *)swift_slowAlloc();
                    v73 = v69;
                    v74 = swift_slowAlloc();
                    *(_QWORD *)&v157 = v74;
                    *(_DWORD *)v72 = 136315138;
                    v159 = sub_1CDF0D64C(0xD000000000000021, 0x80000001CDF40290, (uint64_t *)&v157);
                    sub_1CDF32EC8();
                    _os_log_impl(&dword_1CDEBD000, v70, v71, "%s Unable to compute endate from given info.", v72, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x1D17BBC9C](v74, -1, -1);
                    MEMORY[0x1D17BBC9C](v72, -1, -1);

                    (*(void (**)(char *, uint64_t))(v68 + 8))(v73, v154);
                  }
                  else
                  {

                    (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v67);
                  }
                  (*(void (**)(char *, uint64_t))(v155 + 8))(v147, v62);
                }
                else
                {
                  v86 = v145;
                  v133(v145, v27, v62);
                  v87 = sub_1CDF27368();
                  v88 = v154;
                  v89 = *(void (**)(_QWORD))(v153 + 16);
                  v90 = v141;
                  v143 = v87;
                  v144 = v89;
                  v89(v141);
                  v91 = v155;
                  v92 = v65;
                  v93 = *(void (**)(char *, char *, uint64_t))(v155 + 16);
                  v94 = v136;
                  v93(v136, v92, v62);
                  v95 = v137;
                  v93(v137, v147, v62);
                  v96 = v140;
                  v93(v140, v86, v62);
                  v97 = sub_1CDF32C10();
                  v98 = sub_1CDF32E44();
                  v99 = v98;
                  if (os_log_type_enabled(v97, v98))
                  {
                    v100 = swift_slowAlloc();
                    v101 = swift_slowAlloc();
                    *(_QWORD *)&v157 = v101;
                    *(_DWORD *)v100 = 136316162;
                    v142 = v97;
                    v159 = sub_1CDF0D64C(0xD000000000000021, 0x80000001CDF40290, (uint64_t *)&v157);
                    sub_1CDF32EC8();
                    *(_WORD *)(v100 + 12) = 2080;
                    sub_1CDF1F22C(&qword_1EFA5ADD0, MEMORY[0x1E0CB08F0]);
                    LODWORD(v138) = v99;
                    v102 = sub_1CDF32FD0();
                    v159 = sub_1CDF0D64C(v102, v103, (uint64_t *)&v157);
                    sub_1CDF32EC8();
                    swift_bridgeObjectRelease();
                    v104 = *(void (**)(char *, uint64_t))(v91 + 8);
                    v104(v94, v156);
                    *(_WORD *)(v100 + 22) = 2048;
                    v159 = a5;
                    sub_1CDF32EC8();
                    *(_WORD *)(v100 + 32) = 2080;
                    v105 = sub_1CDF32FD0();
                    v159 = sub_1CDF0D64C(v105, v106, (uint64_t *)&v157);
                    sub_1CDF32EC8();
                    swift_bridgeObjectRelease();
                    v104(v95, v156);
                    *(_WORD *)(v100 + 42) = 2080;
                    v107 = v140;
                    v62 = v156;
                    v108 = sub_1CDF32FD0();
                    v159 = sub_1CDF0D64C(v108, v109, (uint64_t *)&v157);
                    sub_1CDF32EC8();
                    swift_bridgeObjectRelease();
                    v104(v107, v62);
                    v110 = v142;
                    _os_log_impl(&dword_1CDEBD000, v142, (os_log_type_t)v138, "%s Checking Banner decay threshold lastDisplayed: %s decayUntil: %f current: %s end: %s", (uint8_t *)v100, 0x34u);
                    swift_arrayDestroy();
                    v111 = v101;
                    v88 = v154;
                    MEMORY[0x1D17BBC9C](v111, -1, -1);
                    MEMORY[0x1D17BBC9C](v100, -1, -1);

                    v112 = *(void (**)(char *, uint64_t))(v153 + 8);
                    v112(v141, v88);
                  }
                  else
                  {
                    v104 = *(void (**)(char *, uint64_t))(v91 + 8);
                    v104(v94, v62);
                    v104(v95, v62);
                    v104(v96, v62);

                    v112 = *(void (**)(char *, uint64_t))(v153 + 8);
                    v112(v90, v88);
                  }
                  v113 = v139;
                  sub_1CDF1F22C(&qword_1EFA5ADC8, MEMORY[0x1E0CB08B0]);
                  if ((sub_1CDF32CE8() & 1) == 0)
                  {
                    v120 = v135;
                    ((void (*)(char *, uint64_t, uint64_t))v144)(v135, v143, v88);
                    v121 = sub_1CDF32C10();
                    v122 = sub_1CDF32E44();
                    if (os_log_type_enabled(v121, v122))
                    {
                      v123 = (uint8_t *)swift_slowAlloc();
                      v124 = swift_slowAlloc();
                      *(_QWORD *)&v157 = v124;
                      *(_DWORD *)v123 = 136315138;
                      v159 = sub_1CDF0D64C(0xD000000000000021, 0x80000001CDF40290, (uint64_t *)&v157);
                      sub_1CDF32EC8();
                      _os_log_impl(&dword_1CDEBD000, v121, v122, "%s Decay threshold passed. Displaying banner at the top of the stack.", v123, 0xCu);
                      swift_arrayDestroy();
                      MEMORY[0x1D17BBC9C](v124, -1, -1);
                      MEMORY[0x1D17BBC9C](v123, -1, -1);

                      v125 = v135;
                      v126 = v154;
                    }
                    else
                    {

                      v125 = v120;
                      v126 = v88;
                    }
                    v112(v125, v126);
                    v129 = v151;
                    v82 = v152;
                    v131 = v149;
                    v130 = v150;
                    v132 = v134;
                    sub_1CDF32A60();
                    (*(void (**)(void *, char *, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v129) + 0x88))(v148, v132, v131, v130);
                    v104(v145, v62);
                    v104(v147, v62);
                    v104(v146, v62);
                    v128 = v82;
                    v127 = v132;
                    goto LABEL_35;
                  }
                  ((void (*)(char *, uint64_t, uint64_t))v144)(v113, v143, v88);
                  v114 = sub_1CDF32C10();
                  v115 = sub_1CDF32E44();
                  if (os_log_type_enabled(v114, v115))
                  {
                    v116 = (uint8_t *)swift_slowAlloc();
                    v117 = swift_slowAlloc();
                    *(_QWORD *)&v157 = v117;
                    *(_DWORD *)v116 = 136315138;
                    v159 = sub_1CDF0D64C(0xD000000000000021, 0x80000001CDF40290, (uint64_t *)&v157);
                    sub_1CDF32EC8();
                    _os_log_impl(&dword_1CDEBD000, v114, v115, "%s Decay threshold not passed. We will let the banner decay.", v116, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x1D17BBC9C](v117, -1, -1);
                    MEMORY[0x1D17BBC9C](v116, -1, -1);

                    v118 = v139;
                    v119 = v154;
                  }
                  else
                  {

                    v118 = v113;
                    v119 = v88;
                  }
                  v112(v118, v119);
                  v104(v145, v62);
                  v104(v147, v62);
                }
                v82 = v152;
                v127 = v146;
                v128 = v152;
LABEL_35:
                v133(v128, v127, v62);
                return (id)((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v58)(v82, 0, 1, v62);
              }
              goto LABEL_38;
            }
          }
          else
          {
            __break(1u);
          }
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        goto LABEL_15;
      }
    }
    else
    {
      v157 = 0u;
      v158 = 0u;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    sub_1CDF16A0C((uint64_t)&v157, &qword_1ED2B9B90);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v155 + 56))(v29, 1, 1, v156);
LABEL_15:
    sub_1CDF16A0C((uint64_t)v29, &qword_1EFA5ADB0);
    a1 = v148;
LABEL_16:
    v75 = sub_1CDF27368();
    v77 = v153;
    v76 = v154;
    (*(void (**)(char *, uint64_t, uint64_t))(v153 + 16))(v11, v75, v154);
    v78 = sub_1CDF32C10();
    v79 = sub_1CDF32E44();
    if (os_log_type_enabled(v78, v79))
    {
      v80 = (uint8_t *)swift_slowAlloc();
      v81 = swift_slowAlloc();
      *(_QWORD *)&v157 = v81;
      *(_DWORD *)v80 = 136315138;
      v159 = sub_1CDF0D64C(0xD000000000000021, 0x80000001CDF40290, (uint64_t *)&v157);
      sub_1CDF32EC8();
      _os_log_impl(&dword_1CDEBD000, v78, v79, "%s No cached events found, ignoring decay thresholds and displaying banner at the top.", v80, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v81, -1, -1);
      MEMORY[0x1D17BBC9C](v80, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v77 + 8))(v11, v76);
    v83 = v151;
    v82 = v152;
    v85 = v149;
    v84 = v150;
    sub_1CDF32A60();
    (*(void (**)(void *, char *, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v83) + 0x88))(a1, v82, v85, v84);
    v62 = v156;
    v58 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v155 + 56);
    return (id)((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v58)(v82, 0, 1, v62);
  }
LABEL_39:
  __break(1u);
  return result;
}

id BubbleBannerTracker.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BubbleBannerTracker.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BubbleBannerTracker.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BubbleBannerTracker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1CDF1E5A0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AD80);
  v6 = sub_1CDF32F64();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_1CDF192E8(v24, v35);
      }
      else
      {
        sub_1CDF0E834((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1CDF33048();
      sub_1CDF32D30();
      result = sub_1CDF33060();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_1CDF192E8(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_1CDF1E89C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1CDF15BB0(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_1CDF192E8(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1CDF1EA34();
      goto LABEL_7;
    }
    sub_1CDF1E5A0(v15, a4 & 1);
    v21 = sub_1CDF15BB0(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CDF1E9CC(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_1CDF3300C();
  __break(1u);
  return result;
}

_OWORD *sub_1CDF1E9CC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1CDF192E8(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_1CDF1EA34()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AD80);
  v2 = *v0;
  v3 = sub_1CDF32F58();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_1CDF0E834(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1CDF192E8(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1CDF1EC18(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  void *v10;
  char *v11;
  id v12;
  objc_super v14;

  v3 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey];
  *(_QWORD *)v3 = 0xD000000000000015;
  *((_QWORD *)v3 + 1) = 0x80000001CDF401B0;
  v4 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDisplayedKey];
  *(_QWORD *)v4 = 0xD000000000000015;
  *((_QWORD *)v4 + 1) = 0x80000001CDF401D0;
  v5 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerCAEventKey];
  *(_QWORD *)v5 = 0xD00000000000001CLL;
  *((_QWORD *)v5 + 1) = 0x80000001CDF401F0;
  v6 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kFullReason];
  *(_QWORD *)v6 = 0xD000000000000011;
  *((_QWORD *)v6 + 1) = 0x80000001CDF40210;
  v7 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kAlmostFullReason];
  *(_QWORD *)v7 = 0xD000000000000017;
  *((_QWORD *)v7 + 1) = 0x80000001CDF40230;
  if (a1)
  {
    v8 = v1;
    v9 = a1;
  }
  else
  {
    v10 = (void *)objc_opt_self();
    v11 = v1;
    v9 = objc_msgSend(v10, sel_standardUserDefaults);
  }
  *(_QWORD *)&v1[OBJC_IVAR___ICQBubbleBannerTracker_userDefaults] = v9;
  v12 = a1;

  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for BubbleBannerTracker();
  return objc_msgSendSuper2(&v14, sel_init);
}

id sub_1CDF1ED60(void *a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id result;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *boxed_opaque_existential_0;
  unint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _OWORD v47[2];
  __int128 v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v7 = sub_1CDF32C1C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12 = &OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey;
  }
  else
  {
    v11 = sub_1CDF32FF4();
    swift_bridgeObjectRelease();
    v12 = &OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDisplayedKey;
    if ((v11 & 1) != 0)
      v12 = &OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey;
  }
  v13 = (uint64_t *)(v3 + *v12);
  v14 = *v13;
  v15 = v13[1];
  swift_bridgeObjectRetain();
  v51 = v14;
  v52 = v15;
  v16 = *(void **)(v3 + OBJC_IVAR___ICQBubbleBannerTracker_userDefaults);
  swift_bridgeObjectRetain();
  v45 = v14;
  v17 = (void *)sub_1CDF32D00();
  v18 = objc_msgSend(v16, sel_dictionaryForKey_, v17);

  if (v18)
  {
    v19 = sub_1CDF32CC4();

  }
  else
  {
    v19 = MEMORY[0x1E0DEE9E0];
  }
  v50 = v19;
  result = objc_msgSend(a1, sel_aa_altDSID);
  if (result)
  {
    v21 = result;
    v22 = sub_1CDF32D24();
    v24 = v23;

    v25 = sub_1CDF32A78();
    v49 = v25;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v48);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(boxed_opaque_existential_0, a2, v25);
    sub_1CDF192E8(&v48, v47);
    v27 = v50;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v46 = v27;
    v50 = 0x8000000000000000;
    sub_1CDF1E89C(v47, v22, v24, isUniquelyReferenced_nonNull_native);
    v50 = v46;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v29 = sub_1CDF27368();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v29, v7);
    swift_bridgeObjectRetain();
    v30 = sub_1CDF32C10();
    v31 = sub_1CDF32E44();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      v33 = swift_slowAlloc();
      *(_QWORD *)&v48 = v33;
      *(_DWORD *)v32 = 136315394;
      swift_beginAccess();
      v44 = v7;
      swift_bridgeObjectRetain();
      v41 = MEMORY[0x1E0DEE9B8] + 8;
      v34 = sub_1CDF32CD0();
      v42 = v8;
      v43 = v10;
      v35 = v34;
      v36 = v16;
      v38 = v37;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v47[0] = sub_1CDF0D64C(v35, v38, (uint64_t *)&v48);
      sub_1CDF32EC8();
      v16 = v36;
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v47[0] = sub_1CDF0D64C(v45, v15, (uint64_t *)&v48);
      sub_1CDF32EC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CDEBD000, v30, v31, "Tracking event %s for key %s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v33, -1, -1);
      MEMORY[0x1D17BBC9C](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v39 = (void *)sub_1CDF32CB8();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v40 = (void *)sub_1CDF32D00();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setObject_forKey_, v39, v40);

    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CDF1F22C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1CDF32A78();
    result = MEMORY[0x1D17BBC00](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for BubbleBannerTracker()
{
  return objc_opt_self();
}

unint64_t sub_1CDF1F290()
{
  unint64_t result;

  result = qword_1EFA5ADF8;
  if (!qword_1EFA5ADF8)
  {
    result = MEMORY[0x1D17BBC00](&unk_1CDF3969C, &type metadata for BubbleBannerEventType);
    atomic_store(result, (unint64_t *)&qword_1EFA5ADF8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for BubbleBannerEventType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1CDF1F320 + 4 * byte_1CDF39695[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CDF1F354 + 4 * byte_1CDF39690[v4]))();
}

uint64_t sub_1CDF1F354(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CDF1F35C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CDF1F364);
  return result;
}

uint64_t sub_1CDF1F370(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CDF1F378);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CDF1F37C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CDF1F384(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BubbleBannerEventType()
{
  return &type metadata for BubbleBannerEventType;
}

uint64_t method lookup function for BubbleBannerTracker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BubbleBannerTracker.trackLastDisplayedAtTheTop(_:date:reason:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of BubbleBannerTracker.trackLastDismissed(_:date:reason:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of BubbleBannerTracker.shouldDisplay(_:date:for:dismissedInSession:supressUntil:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of BubbleBannerTracker.lastUpdated(_:reason:decayUntil:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

unint64_t sub_1CDF1F41C()
{
  unint64_t result;

  result = qword_1EFA5AE28;
  if (!qword_1EFA5AE28)
  {
    result = MEMORY[0x1D17BBC00](&unk_1CDF39704, &type metadata for BubbleBannerEventType);
    atomic_store(result, (unint64_t *)&qword_1EFA5AE28);
  }
  return result;
}

uint64_t sub_1CDF1F460()
{
  return swift_deallocObject();
}

unint64_t sub_1CDF1F470()
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CDF397F0;
  *(_QWORD *)(inited + 32) = 0x795472656E6E6162;
  *(_QWORD *)(inited + 40) = 0xEA00000000006570;
  *(_QWORD *)(inited + 48) = sub_1CDF32E2C();
  *(_QWORD *)(inited + 56) = 0x616C707369447369;
  *(_QWORD *)(inited + 64) = 0xEB00000000646579;
  *(_QWORD *)(inited + 72) = sub_1CDF32DB4();
  strcpy((char *)(inited + 80), "lastDismissed");
  *(_WORD *)(inited + 94) = -4864;
  *(_QWORD *)(inited + 96) = sub_1CDF32E20();
  strcpy((char *)(inited + 104), "suppressUntil");
  *(_WORD *)(inited + 118) = -4864;
  *(_QWORD *)(inited + 120) = sub_1CDF32E20();
  return sub_1CDF1C164(inited);
}

unint64_t sub_1CDF1F58C()
{
  unint64_t result;

  result = qword_1EFA5A6E8;
  if (!qword_1EFA5A6E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFA5A6E8);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1CDF1F604()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = *v0;
  v2 = (void *)sub_1CDF32D00();
  v3 = objc_msgSend(v1, sel_dictionaryForKey_, v2);

  if (!v3)
    return 0;
  v4 = sub_1CDF32CC4();

  return v4;
}

void sub_1CDF1F688(uint64_t a1)
{
  sub_1CDF1F6A8(a1);
}

void sub_1CDF1F6A8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[3];
  uint64_t v10;

  sub_1CDF15D7C(a1, (uint64_t)v9, &qword_1ED2B9B90);
  v2 = v10;
  if (v10)
  {
    v3 = __swift_project_boxed_opaque_existential_0(v9, v10);
    v4 = *(_QWORD *)(v2 - 8);
    MEMORY[0x1E0C80A78](v3);
    v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    v7 = sub_1CDF32FE8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)sub_1CDF32D00();
  objc_msgSend(v1, sel_setObject_forKey_, v7, v8);
  swift_unknownObjectRelease();

}

void sub_1CDF1F7B8()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  v2 = (id)sub_1CDF32D00();
  objc_msgSend(v1, sel_removeObjectForKey_, v2);

}

uint64_t sub_1CDF1F7FC()
{
  return sub_1CDF32A0C();
}

void sub_1CDF1F814(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  sub_1CDF1F834(a1, a2, a3, a4, a5);
}

void sub_1CDF1F834(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  void *v5;
  void *v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];
  id v22[2];

  v6 = v5;
  v21[1] = a5;
  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE60);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CDF15D7C(a3, (uint64_t)v13, &qword_1EFA5AE60);
  v14 = sub_1CDF32A00();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
  {
    v16 = (void *)sub_1CDF329C4();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
  }
  v22[0] = 0;
  v17 = objc_msgSend(v6, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, a1, a2, v16, a4 & 1, v22);

  v18 = v22[0];
  if (v17)
  {
    sub_1CDF329D0();
    v19 = v18;

  }
  else
  {
    v20 = v22[0];
    sub_1CDF329A0();

    swift_willThrow();
  }
}

id sub_1CDF1F9CC(uint64_t a1, char a2, void *a3)
{
  return sub_1CDF1F9EC(a1, a2, a3);
}

id sub_1CDF1F9EC(uint64_t a1, char a2, void *a3)
{
  void *v3;
  void *v4;
  void *v7;
  unsigned int v8;
  id v10;
  id v11[2];

  v4 = v3;
  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v7 = (void *)sub_1CDF329C4();
  if (a3)
  {
    type metadata accessor for FileAttributeKey();
    sub_1CDF27140(&qword_1EFA5AF40, 255, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1CDF39B48);
    a3 = (void *)sub_1CDF32CB8();
  }
  v11[0] = 0;
  v8 = objc_msgSend(v4, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v7, a2 & 1, a3, v11);

  if (v8)
    return v11[0];
  v10 = v11[0];
  sub_1CDF329A0();

  return (id)swift_willThrow();
}

id sub_1CDF1FB18()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *v0;
  v2 = (void *)sub_1CDF32D00();
  v3 = objc_msgSend(v1, sel_fileExistsAtPath_, v2);

  return v3;
}

uint64_t sub_1CDF1FB5C()
{
  return sub_1CDF32A24();
}

uint64_t sub_1CDF1FB74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_1CDF1FBC8;
  return ICQLiftUIDataSource.data(for:)(a2);
}

uint64_t sub_1CDF1FBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;

  v6 = *v3;
  v7 = *v3;
  swift_task_dealloc();
  if (v2)
    return (*(uint64_t (**)(void))(v7 + 8))();
  *(_QWORD *)(v6 + 32) = a2;
  *(_QWORD *)(v6 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF1FC48()
{
  uint64_t v0;
  int8x16_t *v1;
  int8x16_t v2;

  v1 = *(int8x16_t **)(v0 + 16);
  v2 = *(int8x16_t *)(v0 + 32);
  v1[1].i64[1] = MEMORY[0x1E0CB0338];
  v1[2].i64[0] = (uint64_t)&off_1E8B3B118;
  *v1 = vextq_s8(v2, v2, 8uLL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF1FC78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ICQLiftUIDataSource.request(for:)(a1, a2);
}

uint64_t sub_1CDF1FC98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_1CDF1FCF0;
  return ICQLiftUIDataSource.data(for:)(a2);
}

uint64_t sub_1CDF1FCF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;

  v6 = *v3;
  v7 = *v3;
  swift_task_dealloc();
  if (v2)
    return (*(uint64_t (**)(void))(v7 + 8))();
  *(_QWORD *)(v6 + 32) = a2;
  *(_QWORD *)(v6 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_1CDF1FD70()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  _UNKNOWN **v6;
  __int128 v7;
  uint64_t v8;
  _UNKNOWN **v9;

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v8 = sub_1CDF0E874(0, &qword_1ED2B99D8);
  v9 = &off_1E8B3B0D0;
  *(_QWORD *)&v7 = v0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v5 = sub_1CDF0E874(0, &qword_1ED2B99D0);
  v6 = &off_1E8B3B0F0;
  *(_QWORD *)&v4 = v1;
  type metadata accessor for LiftUICache();
  v2 = swift_allocObject();
  swift_defaultActor_initialize();
  sub_1CDF1A860(&v7, v2 + 112);
  result = sub_1CDF1A860(&v4, v2 + 152);
  qword_1ED2B9C58 = v2;
  return result;
}

uint64_t *sub_1CDF1FE60()
{
  if (qword_1ED2B9C60 != -1)
    swift_once();
  return &qword_1ED2B9C58;
}

uint64_t static LiftUICache.shared.getter()
{
  if (qword_1ED2B9C60 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_1CDF1FF24(__int128 *a1, __int128 *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  swift_defaultActor_initialize();
  sub_1CDF1A860(a1, v4 + 112);
  sub_1CDF1A860(a2, v4 + 152);
  return v4;
}

uint64_t sub_1CDF1FF80(__int128 *a1, __int128 *a2)
{
  uint64_t v2;

  swift_defaultActor_initialize();
  sub_1CDF1A860(a1, v2 + 112);
  sub_1CDF1A860(a2, v2 + 152);
  return v2;
}

uint64_t sub_1CDF1FFCC()
{
  sub_1CDF32B68();
  return sub_1CDF32B50();
}

uint64_t sub_1CDF20024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v16;

  v6 = sub_1CDF32A00();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = (char *)swift_allocObject();
  *((_QWORD *)v14 + 2) = 0;
  *((_QWORD *)v14 + 3) = 0;
  *((_QWORD *)v14 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v14[v13], (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(_QWORD *)&v14[(v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8] = a1;
  swift_retain();
  swift_retain();
  sub_1CDF1009C((uint64_t)v11, (uint64_t)&unk_1EFA5AFA0, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_1CDF2018C(uint64_t a1)
{
  uint64_t v1;

  return sub_1CDF20024(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1CDF20194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  *(_QWORD *)(v6 + 16) = a6;
  v10 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)a4 + 120) + *(_QWORD *)(*(_QWORD *)a4 + 120));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 24) = v8;
  *v8 = v6;
  v8[1] = sub_1CDF20204;
  return v10(a5);
}

uint64_t sub_1CDF20204()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CDF20258()
{
  uint64_t v0;

  MEMORY[0x1D17BAE2C]();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF20288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1CDF32DF0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1CDF32DE4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1CDF16A0C(a1, &qword_1ED2B9B68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CDF32DC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFA5AEA0);
  return swift_task_create();
}

uint64_t sub_1CDF204A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[21] = a1;
  v2[22] = v1;
  v3 = sub_1CDF32C1C();
  v2[23] = v3;
  v2[24] = *(_QWORD *)(v3 - 8);
  v2[25] = swift_task_alloc();
  return swift_task_switch();
}

id sub_1CDF20508()
{
  _QWORD *v0;
  id result;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  result = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  v0[26] = result;
  if (result)
  {
    v2 = result;
    v0[7] = v0 + 20;
    v0[2] = v0;
    v0[3] = sub_1CDF205C8;
    v3 = swift_continuation_init();
    v0[10] = MEMORY[0x1E0C809B0];
    v4 = v0 + 10;
    v4[1] = 0x40000000;
    v4[2] = sub_1CDF20938;
    v4[3] = &block_descriptor_3;
    v4[4] = v3;
    objc_msgSend(v2, sel_aa_primaryAppleAccountWithCompletion_, v4);
    return (id)swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CDF205C8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 216) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CDF20628()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_QWORD, uint64_t);

  v1 = *(void **)(v0 + 208);
  v2 = *(void **)(v0 + 160);
  *(_QWORD *)(v0 + 224) = v2;

  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 176);
    v4 = type metadata accessor for ICQLiftUIDataSource();
    *(_QWORD *)(v0 + 120) = ICQLiftUIDataSource.__allocating_init(account:)((uint64_t)v2);
    *(_QWORD *)(v0 + 144) = v4;
    *(_QWORD *)(v0 + 152) = &off_1E8B3B128;
    v17 = (uint64_t (*)(_QWORD, uint64_t))(**(int **)(*(_QWORD *)v3 + 128)
                                                  + *(_QWORD *)(*(_QWORD *)v3 + 128));
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 232) = v5;
    *v5 = v0;
    v5[1] = sub_1CDF207A0;
    return v17(*(_QWORD *)(v0 + 168), v0 + 120);
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 192);
    v7 = *(_QWORD *)(v0 + 200);
    v9 = *(_QWORD *)(v0 + 184);
    v10 = sub_1CDF27238();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
    v11 = sub_1CDF32C10();
    v12 = sub_1CDF32E5C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1CDEBD000, v11, v12, "LiftUI cache failed to get primary account", v13, 2u);
      MEMORY[0x1D17BBC9C](v13, -1, -1);
    }
    v15 = *(_QWORD *)(v0 + 192);
    v14 = *(_QWORD *)(v0 + 200);
    v16 = *(_QWORD *)(v0 + 184);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CDF207A0()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *v0 + 120;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_0(v1);
  return swift_task_switch();
}

uint64_t sub_1CDF20804()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF2083C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(void **)(v0 + 208);
  v2 = *(void **)(v0 + 216);
  swift_willThrow();

  v4 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = sub_1CDF27238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  v7 = sub_1CDF32C10();
  v8 = sub_1CDF32E5C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CDEBD000, v7, v8, "LiftUI cache failed to get primary account", v9, 2u);
    MEMORY[0x1D17BBC9C](v9, -1, -1);
  }
  v11 = *(_QWORD *)(v0 + 192);
  v10 = *(_QWORD *)(v0 + 200);
  v12 = *(_QWORD *)(v0 + 184);

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF20938(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B88);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v10 = a2;
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
    v9 = a2;
    sub_1CDF26F0C((uint64_t)&v10, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1CDF209D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[31] = a2;
  v3[32] = v2;
  v3[30] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE58);
  v3[33] = swift_task_alloc();
  v4 = sub_1CDF32928();
  v3[34] = v4;
  v3[35] = *(_QWORD *)(v4 - 8);
  v3[36] = swift_task_alloc();
  v5 = sub_1CDF329AC();
  v3[37] = v5;
  v3[38] = *(_QWORD *)(v5 - 8);
  v3[39] = swift_task_alloc();
  v6 = sub_1CDF32A9C();
  v3[40] = v6;
  v3[41] = *(_QWORD *)(v6 - 8);
  v3[42] = swift_task_alloc();
  v7 = sub_1CDF32C1C();
  v3[43] = v7;
  v3[44] = *(_QWORD *)(v7 - 8);
  v3[45] = swift_task_alloc();
  v3[46] = swift_task_alloc();
  v3[47] = swift_task_alloc();
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE60);
  v3[51] = swift_task_alloc();
  v3[52] = swift_task_alloc();
  v8 = sub_1CDF32A00();
  v3[53] = v8;
  v3[54] = *(_QWORD *)(v8 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  v3[58] = swift_task_alloc();
  v3[59] = swift_task_alloc();
  v3[60] = swift_task_alloc();
  v3[61] = swift_task_alloc();
  v3[62] = swift_task_alloc();
  v3[63] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF20BD8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t, uint64_t, uint64_t);
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  os_log_type_t v101;
  _BOOL4 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint8_t *v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  void (*v111)(uint64_t, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  os_log_type_t type[8];
  os_log_type_t typea[8];
  os_log_type_t typeb;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  os_log_t log;
  NSObject *loga;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(uint64_t, uint64_t, uint64_t);
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  _QWORD *v143;
  uint64_t v144;
  void (*v145)(uint64_t, uint64_t);
  uint64_t (*v146)(uint64_t, _QWORD, uint64_t, uint64_t);
  unint64_t v147;
  uint64_t v148[2];

  v1 = *(_QWORD **)(v0 + 256);
  v2 = v1[17];
  v3 = v1[18];
  __swift_project_boxed_opaque_existential_0(v1 + 14, v2);
  v4 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v3 + 8))(0xD000000000000013, 0x80000001CDF40490, v2, v3);
  if (!v4)
    goto LABEL_9;
  v5 = sub_1CDF225B0(v4);
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_9;
  v147 = v5;
  swift_bridgeObjectRetain();
  v6 = sub_1CDF329B8();
  if (!*(_QWORD *)(v5 + 16) || (sub_1CDF15BB0(v6, v7), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease_n();
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v9 = *(_QWORD *)(v0 + 432);
  v144 = *(_QWORD *)(v0 + 424);
  v10 = *(_QWORD *)(v0 + 416);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CDF329E8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v144) == 1)
  {
    v11 = *(_QWORD *)(v0 + 416);
    swift_bridgeObjectRelease();
    sub_1CDF16A0C(v11, &qword_1EFA5AE60);
    goto LABEL_9;
  }
  v87 = *(_QWORD **)(v0 + 256);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 432) + 32))(*(_QWORD *)(v0 + 504), *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 424));
  v88 = v87 + 19;
  v89 = v87[22];
  v90 = v87[23];
  __swift_project_boxed_opaque_existential_0(v88, v89);
  v91 = sub_1CDF329DC();
  v92 = (*(uint64_t (**)(uint64_t))(v90 + 24))(v91);
  swift_bridgeObjectRelease();
  if ((v92 & 1) == 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 432) + 8))(*(_QWORD *)(v0 + 504), *(_QWORD *)(v0 + 424));
    goto LABEL_8;
  }
  v140 = *(_QWORD *)(v0 + 496);
  v93 = *(_QWORD *)(v0 + 424);
  v94 = *(_QWORD *)(v0 + 432);
  v95 = *(_QWORD *)(v0 + 400);
  v97 = *(_QWORD *)(v0 + 344);
  v96 = *(_QWORD *)(v0 + 352);
  v98 = *(_QWORD *)(v0 + 240);
  v99 = sub_1CDF27238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 16))(v95, v99, v97);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 16))(v140, v98, v93);
  v100 = sub_1CDF32C10();
  v101 = sub_1CDF32E44();
  v102 = os_log_type_enabled(v100, v101);
  v103 = *(_QWORD *)(v0 + 496);
  v104 = *(_QWORD *)(v0 + 400);
  v105 = *(_QWORD *)(v0 + 344);
  v106 = *(_QWORD *)(v0 + 352);
  if (v102)
  {
    v141 = *(_QWORD *)(v0 + 400);
    v132 = *(_QWORD *)(v0 + 424);
    v126 = *(_QWORD *)(v0 + 432);
    v136 = *(_QWORD *)(v0 + 352);
    v107 = (uint8_t *)swift_slowAlloc();
    loga = v100;
    v108 = swift_slowAlloc();
    v148[0] = v108;
    typeb = v101;
    *(_DWORD *)v107 = 136315138;
    v109 = sub_1CDF329B8();
    *(_QWORD *)(v0 + 232) = sub_1CDF0D64C(v109, v110, v148);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    v111 = *(void (**)(uint64_t, uint64_t))(v126 + 8);
    v111(v103, v132);
    _os_log_impl(&dword_1CDEBD000, loga, typeb, "LiftUI cache exists for %s deleting", v107, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v108, -1, -1);
    MEMORY[0x1D17BBC9C](v107, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v136 + 8))(v141, v105);
  }
  else
  {
    v111 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 432) + 8);
    v111(*(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 424));

    (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v104, v105);
  }
  sub_1CDF25AC0(*(_QWORD *)(v0 + 504));
  v112 = *(_QWORD *)(v0 + 504);
  v113 = *(_QWORD *)(v0 + 424);
  v114 = sub_1CDF329B8();
  sub_1CDF251B8(v114, v115);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v116 = v1[17];
  v117 = v1[18];
  __swift_project_boxed_opaque_existential_0(v1 + 14, v116);
  *(_QWORD *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFA5AE80);
  *(_QWORD *)(v0 + 96) = v147;
  (*(void (**)(uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(v117 + 16))(v0 + 96, 0xD000000000000013, 0x80000001CDF40490, v116, v117);
  v111(v112, v113);
  sub_1CDF16A0C(v0 + 96, &qword_1ED2B9B90);
LABEL_9:
  v12 = *(_QWORD *)(v0 + 392);
  v13 = *(_QWORD *)(v0 + 352);
  v14 = sub_1CDF27238();
  *(_QWORD *)(v0 + 512) = v14;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  *(_QWORD *)(v0 + 520) = v15;
  v133 = v15;
  v134 = v14;
  ((void (*)(uint64_t))v15)(v12);
  v16 = sub_1CDF32C10();
  v17 = sub_1CDF32E44();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1CDEBD000, v16, v17, "LiftUI cache creating path URL", v18, 2u);
    MEMORY[0x1D17BBC9C](v18, -1, -1);
  }
  v137 = *(_QWORD *)(v0 + 432);
  v142 = *(_QWORD *)(v0 + 424);
  v19 = *(_QWORD *)(v0 + 408);
  v20 = *(_QWORD *)(v0 + 392);
  v22 = *(_QWORD *)(v0 + 344);
  v21 = *(_QWORD *)(v0 + 352);
  v23 = *(_QWORD *)(v0 + 328);
  v24 = *(_QWORD *)(v0 + 336);
  v25 = *(_QWORD *)(v0 + 320);
  v26 = *(_QWORD **)(v0 + 256);

  v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  *(_QWORD *)(v0 + 528) = v27;
  v27(v20, v22);
  sub_1CDF32A90();
  log = (os_log_t)sub_1CDF32A84();
  v29 = v28;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v25);
  v30 = v26[22];
  v31 = v26[23];
  __swift_project_boxed_opaque_existential_0(v26 + 19, v30);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v137 + 56))(v19, 1, 1, v142);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8))(9, 1, v19, 1, v30, v31);
  v138 = v26 + 19;
  v143 = v26;
  v145 = v27;
  v118 = *(_QWORD *)(v0 + 480);
  v124 = *(_QWORD *)(v0 + 424);
  v127 = *(_QWORD *)(v0 + 472);
  v119 = *(_QWORD *)(v0 + 384);
  v120 = *(_QWORD *)(v0 + 344);
  *(_QWORD *)type = *(_QWORD *)(v0 + 432);
  v33 = *(_QWORD *)(v0 + 304);
  v32 = *(_QWORD *)(v0 + 312);
  v34 = *(_QWORD *)(v0 + 296);
  sub_1CDF16A0C(*(_QWORD *)(v0 + 408), &qword_1EFA5AE60);
  *(_QWORD *)(v0 + 160) = 0x2F69757466696CLL;
  *(_QWORD *)(v0 + 168) = 0xE700000000000000;
  v35 = *MEMORY[0x1E0CAFD78];
  v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 104);
  v36(v32, v35, v34);
  sub_1CDF25174();
  sub_1CDF329F4();
  v37 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
  v37(v32, v34);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 176) = log;
  *(_QWORD *)(v0 + 184) = v29;
  v36(v32, v35, v34);
  sub_1CDF329F4();
  v37(v32, v34);
  swift_bridgeObjectRelease();
  v133(v119, v134, v120);
  v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)type + 16);
  *(_QWORD *)(v0 + 536) = v38;
  v38(v127, v118, v124);
  v39 = sub_1CDF32C10();
  v40 = sub_1CDF32E44();
  v41 = os_log_type_enabled(v39, v40);
  v42 = *(_QWORD *)(v0 + 472);
  v43 = *(_QWORD *)(v0 + 432);
  v44 = *(_QWORD *)(v0 + 384);
  v45 = *(_QWORD *)(v0 + 344);
  if (v41)
  {
    v128 = *(_QWORD *)(v0 + 344);
    *(_QWORD *)typea = *(_QWORD *)(v0 + 424);
    v46 = (uint8_t *)swift_slowAlloc();
    v125 = v44;
    v47 = swift_slowAlloc();
    v148[0] = v47;
    *(_DWORD *)v46 = 136315138;
    v48 = sub_1CDF329B8();
    *(_QWORD *)(v0 + 216) = sub_1CDF0D64C(v48, v49, v148);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    v50 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v50(v42, *(_QWORD *)typea);
    _os_log_impl(&dword_1CDEBD000, v39, v40, "LiftUI cache path url: %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v47, -1, -1);
    MEMORY[0x1D17BBC9C](v46, -1, -1);

    v51 = v125;
    v52 = v128;
  }
  else
  {
    v50 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v50(*(_QWORD *)(v0 + 472), *(_QWORD *)(v0 + 424));

    v51 = v44;
    v52 = v45;
  }
  v145(v51, v52);
  *(_QWORD *)(v0 + 544) = v50;
  v53 = *(_QWORD *)(v0 + 464);
  v54 = v143[22];
  v55 = v143[23];
  __swift_project_boxed_opaque_existential_0(v138, v54);
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v55 + 16))(v53, 1, 0, v54, v55);
  v57 = *(_QWORD *)(v0 + 240);
  v56 = *(_QWORD **)(v0 + 248);
  v58 = v56[3];
  v59 = v56[4];
  __swift_project_boxed_opaque_existential_0(v56, v58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 8))(v57, v58, v59);
  v60 = *(_QWORD *)(v0 + 272);
  v61 = *(_QWORD *)(v0 + 280);
  v62 = *(_QWORD *)(v0 + 264);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v61 + 56))(v62, 0, 1, v60);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v62, 1, v60) == 1)
  {
    v63 = *(_QWORD *)(v0 + 448);
    v64 = *(_QWORD *)(v0 + 424);
    v65 = *(_QWORD *)(v0 + 368);
    v66 = *(_QWORD *)(v0 + 344);
    v67 = *(_QWORD *)(v0 + 240);
    sub_1CDF16A0C(*(_QWORD *)(v0 + 264), &qword_1EFA5AE58);
    v133(v65, v134, v66);
    v38(v63, v67, v64);
    v68 = sub_1CDF32C10();
    v69 = sub_1CDF32E50();
    v70 = os_log_type_enabled(v68, v69);
    v72 = *(_QWORD *)(v0 + 480);
    v71 = *(_QWORD *)(v0 + 488);
    v73 = *(_QWORD *)(v0 + 464);
    v74 = *(_QWORD *)(v0 + 448);
    v75 = *(_QWORD *)(v0 + 424);
    v76 = *(_QWORD *)(v0 + 368);
    if (v70)
    {
      v135 = *(_QWORD *)(v0 + 344);
      v139 = *(_QWORD *)(v0 + 480);
      v77 = (uint8_t *)swift_slowAlloc();
      v131 = v73;
      v78 = swift_slowAlloc();
      v148[0] = v78;
      *(_DWORD *)v77 = 136315138;
      sub_1CDF27140(&qword_1EFA5AE68, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      v79 = sub_1CDF32FD0();
      *(_QWORD *)(v0 + 208) = sub_1CDF0D64C(v79, v80, v148);
      sub_1CDF32EC8();
      swift_bridgeObjectRelease();
      v50(v74, v75);
      _os_log_impl(&dword_1CDEBD000, v68, v69, "Failed to build LiftUI request for %s", v77, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v78, -1, -1);
      MEMORY[0x1D17BBC9C](v77, -1, -1);

      v145(v76, v135);
      v50(v139, v75);
      v50(v131, v75);
    }
    else
    {
      v81 = *(_QWORD *)(v0 + 344);

      v50(v74, v75);
      v145(v76, v81);
      v50(v72, v75);
      v50(v73, v75);
    }
    v50(v71, v75);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v83 = *(_QWORD **)(v0 + 248);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 280) + 32))(*(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 272));
    v85 = v56[3];
    v84 = v56[4];
    __swift_project_boxed_opaque_existential_0(v83, v85);
    v146 = (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))(**(int **)(v84 + 16) + *(_QWORD *)(v84 + 16));
    v86 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 552) = v86;
    *v86 = v0;
    v86[1] = sub_1CDF21B64;
    return v146(v0 + 16, *(_QWORD *)(v0 + 288), v85, v84);
  }
}

uint64_t sub_1CDF21B64()
{
  void *v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 560) = v0;
  swift_task_dealloc();
  if (v0)

  return swift_task_switch();
}

uint64_t sub_1CDF21BD4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  BOOL v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;

  v1 = *(void **)(v0 + 560);
  v2 = *(_QWORD *)(v0 + 480);
  sub_1CDF1A860((__int128 *)(v0 + 16), v0 + 56);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_0((_QWORD *)(v0 + 56), v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 8))(v2, 0, v3, v4);
  if (v1)
  {
    v5 = *(void (**)(uint64_t, uint64_t))(v0 + 544);
    v7 = *(_QWORD *)(v0 + 480);
    v6 = *(_QWORD *)(v0 + 488);
    v8 = *(_QWORD *)(v0 + 464);
    v9 = *(_QWORD *)(v0 + 424);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 280) + 8))(*(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 272));
    v5(v7, v9);
    v5(v8, v9);
    v5(v6, v9);
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
    v11 = *(_QWORD *)(v0 + 432);
    v10 = *(_QWORD *)(v0 + 440);
    v12 = *(_QWORD *)(v0 + 424);
    v13 = *(_QWORD *)(v0 + 240);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 520))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 344));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v13, v12);
    v14 = v1;
    v15 = v1;
    v16 = sub_1CDF32C10();
    v17 = sub_1CDF32E50();
    v18 = os_log_type_enabled(v16, v17);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    v21 = *(_QWORD *)(v0 + 432);
    v20 = *(_QWORD *)(v0 + 440);
    v22 = *(_QWORD *)(v0 + 424);
    v23 = *(_QWORD *)(v0 + 360);
    v24 = *(_QWORD *)(v0 + 344);
    if (v18)
    {
      v57 = *(_QWORD *)(v0 + 360);
      v25 = swift_slowAlloc();
      v51 = (_QWORD *)swift_slowAlloc();
      v54 = swift_slowAlloc();
      v58 = v54;
      *(_DWORD *)v25 = 136315394;
      sub_1CDF27140(&qword_1EFA5AE68, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      v26 = sub_1CDF32FD0();
      *(_QWORD *)(v0 + 192) = sub_1CDF0D64C(v26, v27, (uint64_t *)&v58);
      sub_1CDF32EC8();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
      *(_WORD *)(v25 + 12) = 2112;
      v28 = v1;
      v29 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 224) = v29;
      sub_1CDF32EC8();
      *v51 = v29;

      _os_log_impl(&dword_1CDEBD000, v16, v17, "Failed to save LiftUI content at %s with error: %@", (uint8_t *)v25, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAC0);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v51, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v54, -1, -1);
      MEMORY[0x1D17BBC9C](v25, -1, -1);

      v19(v57, v24);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
      v19(v23, v24);
    }
  }
  else
  {
    v30 = *(_QWORD **)(v0 + 256);
    v31 = v30[17];
    v32 = v30[18];
    __swift_project_boxed_opaque_existential_0(v30 + 14, v31);
    v33 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v32 + 8))(0xD000000000000013, 0x80000001CDF40490, v31, v32);
    if (!v33 || (v34 = sub_1CDF225B0(v33), swift_bridgeObjectRelease(), !v34))
    {
      v34 = sub_1CDF2292C(MEMORY[0x1E0DEE9D8]);
      swift_bridgeObjectRelease();
    }
    v56 = *(_QWORD *)(v0 + 488);
    v53 = *(void (**)(uint64_t, uint64_t))(v0 + 544);
    v55 = *(_QWORD *)(v0 + 464);
    v35 = *(_QWORD *)(v0 + 424);
    v48 = *(_QWORD *)(v0 + 480);
    v49 = *(_QWORD *)(v0 + 280);
    v50 = *(_QWORD *)(v0 + 272);
    v52 = *(_QWORD *)(v0 + 288);
    v36 = *(_QWORD **)(v0 + 256);
    v37 = sub_1CDF329B8();
    v39 = v38;
    v40 = sub_1CDF329B8();
    v42 = v41;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v58 = v34;
    sub_1CDF25794(v40, v42, v37, v39, isUniquelyReferenced_nonNull_native);
    v44 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45 = v36[17];
    v46 = v36[18];
    __swift_project_boxed_opaque_existential_0(v36 + 14, v45);
    *(_QWORD *)(v0 + 152) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFA5AE80);
    *(_QWORD *)(v0 + 128) = v44;
    (*(void (**)(uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(v46 + 16))(v0 + 128, 0xD000000000000013, 0x80000001CDF40490, v45, v46);
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v52, v50);
    v53(v48, v35);
    v53(v55, v35);
    v53(v56, v35);
    sub_1CDF16A0C(v0 + 128, &qword_1ED2B9B90);
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF221DC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  *(_OWORD *)(v0 + 16) = 0u;
  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 536);
  v2 = *(_QWORD *)(v0 + 512);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 520);
  v4 = *(_QWORD *)(v0 + 456);
  v5 = *(_QWORD *)(v0 + 424);
  v6 = *(_QWORD *)(v0 + 376);
  v7 = *(_QWORD *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 240);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  sub_1CDF16A0C(v0 + 16, &qword_1EFA5AE78);
  v3(v6, v2, v7);
  v1(v4, v8, v5);
  v9 = sub_1CDF32C10();
  v10 = sub_1CDF32E50();
  if (os_log_type_enabled(v9, v10))
  {
    v34 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    v35 = *(_QWORD *)(v0 + 480);
    v11 = *(_QWORD *)(v0 + 456);
    v37 = *(_QWORD *)(v0 + 464);
    v39 = *(_QWORD *)(v0 + 488);
    v12 = *(_QWORD *)(v0 + 424);
    v28 = *(void (**)(uint64_t, uint64_t))(v0 + 544);
    v29 = *(_QWORD *)(v0 + 344);
    v30 = *(_QWORD *)(v0 + 376);
    v31 = *(_QWORD *)(v0 + 280);
    v32 = *(_QWORD *)(v0 + 272);
    v33 = *(_QWORD *)(v0 + 288);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v41 = v14;
    *(_DWORD *)v13 = 136315138;
    sub_1CDF27140(&qword_1EFA5AE68, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v15 = sub_1CDF32FD0();
    *(_QWORD *)(v0 + 200) = sub_1CDF0D64C(v15, v16, &v41);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    v28(v11, v12);
    _os_log_impl(&dword_1CDEBD000, v9, v10, "Failed to fetch LiftUI content at %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v14, -1, -1);
    MEMORY[0x1D17BBC9C](v13, -1, -1);

    v34(v30, v29);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
    v28(v35, v12);
    v28(v37, v12);
    v28(v39, v12);
  }
  else
  {
    v17 = *(void (**)(uint64_t, uint64_t))(v0 + 544);
    v18 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    v36 = *(_QWORD *)(v0 + 480);
    v19 = *(_QWORD *)(v0 + 456);
    v38 = *(_QWORD *)(v0 + 464);
    v40 = *(_QWORD *)(v0 + 488);
    v20 = *(_QWORD *)(v0 + 424);
    v21 = *(_QWORD *)(v0 + 376);
    v22 = *(_QWORD *)(v0 + 344);
    v23 = v9;
    v24 = *(_QWORD *)(v0 + 280);
    v25 = *(_QWORD *)(v0 + 288);
    v26 = *(_QWORD *)(v0 + 272);

    v17(v19, v20);
    v18(v21, v22);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
    v17(v36, v20);
    v17(v38, v20);
    v17(v40, v20);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1CDF225B0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  unint64_t result;
  int64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  _QWORD *v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36[32];
  _QWORD v37[2];
  uint64_t v38;

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AF78);
    v2 = (_QWORD *)sub_1CDF32F70();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v31 = v1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 64);
  v30 = (unint64_t)(63 - v4) >> 6;
  v6 = &v38;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  v9 = (uint64_t *)&unk_1EFA5AF88;
  while (1)
  {
    if (v5)
    {
      v33 = (v5 - 1) & v5;
      v16 = __clz(__rbit64(v5)) | (v8 << 6);
      v17 = v8;
    }
    else
    {
      v18 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_37;
      if (v18 >= v30)
      {
LABEL_33:
        sub_1CDF26F04();
        return (unint64_t)v2;
      }
      v19 = *(_QWORD *)(v31 + 8 * v18);
      v17 = v8 + 1;
      if (!v19)
      {
        v17 = v8 + 2;
        if (v8 + 2 >= v30)
          goto LABEL_33;
        v19 = *(_QWORD *)(v31 + 8 * v17);
        if (!v19)
        {
          v17 = v8 + 3;
          if (v8 + 3 >= v30)
            goto LABEL_33;
          v19 = *(_QWORD *)(v31 + 8 * v17);
          if (!v19)
          {
            v17 = v8 + 4;
            if (v8 + 4 >= v30)
              goto LABEL_33;
            v19 = *(_QWORD *)(v31 + 8 * v17);
            if (!v19)
            {
              v20 = v8 + 5;
              if (v8 + 5 >= v30)
                goto LABEL_33;
              v19 = *(_QWORD *)(v31 + 8 * v20);
              if (!v19)
              {
                while (1)
                {
                  v17 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_38;
                  if (v17 >= v30)
                    goto LABEL_33;
                  v19 = *(_QWORD *)(v31 + 8 * v17);
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v17 = v8 + 5;
            }
          }
        }
      }
LABEL_26:
      v33 = (v19 - 1) & v19;
      v16 = __clz(__rbit64(v19)) + (v17 << 6);
    }
    v21 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v16);
    v23 = *v21;
    v22 = v21[1];
    sub_1CDF0E834(*(_QWORD *)(v1 + 56) + 32 * v16, (uint64_t)v6);
    v37[0] = v23;
    v37[1] = v22;
    sub_1CDF0E834((uint64_t)v6, (uint64_t)v36);
    swift_bridgeObjectRetain_n();
    sub_1CDF16A0C((uint64_t)v37, v9);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1CDF26F04();
      swift_release();
      return 0;
    }
    v32 = v17;
    result = sub_1CDF15BB0(v23, v22);
    if ((v24 & 1) != 0)
    {
      v10 = v9;
      v11 = 16 * result;
      v12 = v6;
      v13 = v1;
      v14 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v14 = v23;
      v14[1] = v22;
      v15 = (_QWORD *)(v2[7] + v11);
      v9 = v10;
      result = swift_bridgeObjectRelease();
      *v15 = v34;
      v15[1] = v35;
      v1 = v13;
      v6 = v12;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v25 = (uint64_t *)(v2[6] + 16 * result);
    *v25 = v23;
    v25[1] = v22;
    v26 = (_QWORD *)(v2[7] + 16 * result);
    *v26 = v34;
    v26[1] = v35;
    v27 = v2[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_36;
    v2[2] = v29;
LABEL_8:
    v8 = v32;
    v5 = v33;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

unint64_t sub_1CDF2292C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AF78);
  v2 = (_QWORD *)sub_1CDF32F70();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1CDF15BB0(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1CDF22A4C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[4] = a1;
  v2[5] = v1;
  v3 = sub_1CDF32A00();
  v2[6] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[7] = v4;
  v2[8] = *(_QWORD *)(v4 + 64);
  v2[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF22AD4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  _QWORD *v10;

  v2 = v0[9];
  v1 = v0[10];
  v3 = v0[7];
  v5 = v0[5];
  v4 = v0[6];
  v6 = v0[4];
  v7 = sub_1CDF32DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v1, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v6, v4);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = (char *)swift_allocObject();
  *((_QWORD *)v9 + 2) = 0;
  *((_QWORD *)v9 + 3) = 0;
  *((_QWORD *)v9 + 4) = v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(&v9[v8], v2, v4);
  swift_retain();
  v0[11] = sub_1CDF20288(v1, (uint64_t)&unk_1EFA5AE98, (uint64_t)v9);
  v10 = (_QWORD *)swift_task_alloc();
  v0[12] = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFA5AEA0);
  *v10 = v0;
  v10[1] = sub_1CDF22C08;
  return sub_1CDF32E14();
}

uint64_t sub_1CDF22C08()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF22C64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_1CDF22CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  *(_QWORD *)(v5 + 16) = a1;
  v9 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)a4 + 144) + *(_QWORD *)(*(_QWORD *)a4 + 144));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 24) = v7;
  *v7 = v5;
  v7[1] = sub_1CDF22D20;
  return v9(a5);
}

uint64_t sub_1CDF22D20(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  *(_QWORD *)(v3 + 40) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CDF22D7C()
{
  uint64_t v0;

  *(_OWORD *)*(_QWORD *)(v0 + 16) = *(_OWORD *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF22EC4(uint64_t a1, const void *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  v3[4] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  v3[5] = swift_task_alloc();
  v5 = sub_1CDF32A00();
  v3[6] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[7] = v6;
  v3[8] = *(_QWORD *)(v6 + 64);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[11] = _Block_copy(a2);
  sub_1CDF329D0();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CDF22F94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  _QWORD *v10;

  v2 = v0[9];
  v1 = v0[10];
  v3 = v0[7];
  v5 = v0[5];
  v4 = v0[6];
  v6 = v0[4];
  v7 = sub_1CDF32DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = (char *)swift_allocObject();
  *((_QWORD *)v9 + 2) = 0;
  *((_QWORD *)v9 + 3) = 0;
  *((_QWORD *)v9 + 4) = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(&v9[v8], v2, v4);
  swift_retain();
  v0[12] = sub_1CDF20288(v5, (uint64_t)&unk_1EFA5AF38, (uint64_t)v9);
  v10 = (_QWORD *)swift_task_alloc();
  v0[13] = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFA5AEA0);
  *v10 = v0;
  v10[1] = sub_1CDF230C8;
  return sub_1CDF32E14();
}

uint64_t sub_1CDF230C8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF23124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  swift_release();
  v4 = *(_QWORD *)(v0 + 16);
  v5 = *(_QWORD *)(v0 + 24);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1CDF32A18();
    sub_1CDF26CC0(v4, v5);
  }
  v7 = *(void (***)(_QWORD, _QWORD))(v0 + 88);
  ((void (**)(_QWORD, void *))v7)[2](v7, v6);

  _Block_release(v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF231F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[4] = a1;
  v2[5] = v1;
  v3 = sub_1CDF32A00();
  v2[6] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[7] = v4;
  v2[8] = *(_QWORD *)(v4 + 64);
  v2[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF23278()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v2 = v0[9];
  v1 = v0[10];
  v4 = v0[7];
  v3 = v0[8];
  v5 = v0[5];
  v6 = v0[6];
  v7 = v0[4];
  v8 = sub_1CDF32DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v1, 1, 1, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v7, v6);
  v10 = sub_1CDF27140(&qword_1EFA5AEB8, v9, (uint64_t (*)(uint64_t))type metadata accessor for LiftUICache, (uint64_t)&protocol conformance descriptor for LiftUICache);
  v11 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v12 = (v3 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v5;
  *(_QWORD *)(v13 + 24) = v10;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v13 + v11, v2, v6);
  *(_QWORD *)(v13 + v12) = v5;
  swift_retain_n();
  v0[11] = sub_1CDF24450(v1, (uint64_t)&unk_1EFA5AEC0, v13);
  v14 = (_QWORD *)swift_task_alloc();
  v0[12] = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B88);
  *v14 = v0;
  v14[1] = sub_1CDF233F0;
  return sub_1CDF32DFC();
}

uint64_t sub_1CDF233F0()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CDF23478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_1CDF234C4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
}

uint64_t sub_1CDF23504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[14] = a4;
  v5[15] = a5;
  v5[13] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE60);
  v5[16] = swift_task_alloc();
  v6 = sub_1CDF32A00();
  v5[17] = v6;
  v5[18] = *(_QWORD *)(v6 - 8);
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v7 = sub_1CDF32C1C();
  v5[25] = v7;
  v5[26] = *(_QWORD *)(v7 - 8);
  v5[27] = swift_task_alloc();
  v5[28] = swift_task_alloc();
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF2362C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void (*v9)(uint64_t, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(void);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  _BOOL4 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  uint8_t *v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  _DWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  unint64_t v98;
  void (*v99)(uint64_t);
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  void (*v105)(uint64_t, uint64_t, uint64_t);
  _QWORD *v106;
  void (*v107)(uint64_t, uint64_t, uint64_t);
  uint64_t v108;
  uint64_t v109;
  void (*v110)(uint64_t, uint64_t);
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t v114[2];

  v1 = v0[31];
  v2 = v0[26];
  v3 = v0[24];
  v5 = v0[17];
  v4 = v0[18];
  v6 = v0[14];
  v7 = sub_1CDF27238();
  v8 = *(void (**)(uint64_t))(v2 + 16);
  v111 = v7;
  v8(v1);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v9(v3, v6, v5);
  v10 = sub_1CDF32C10();
  v11 = sub_1CDF32E44();
  if (os_log_type_enabled(v10, v11))
  {
    v101 = v0[26];
    v12 = v0[24];
    v103 = v0[25];
    v104 = v0[31];
    v105 = v9;
    v109 = v0[18];
    v13 = v0[17];
    v14 = (uint8_t *)swift_slowAlloc();
    v114[0] = swift_slowAlloc();
    v15 = v114[0];
    *(_DWORD *)v14 = 136315138;
    sub_1CDF27140(&qword_1EFA5AE68, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v16 = sub_1CDF32FD0();
    v0[12] = sub_1CDF0D64C(v16, v17, v114);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    v18 = v13;
    v9 = v105;
    v110 = *(void (**)(uint64_t, uint64_t))(v109 + 8);
    v110(v12, v18);
    _os_log_impl(&dword_1CDEBD000, v10, v11, "Fetching LiftUI content at %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v15, -1, -1);
    MEMORY[0x1D17BBC9C](v14, -1, -1);

    v19 = *(void (**)(uint64_t, uint64_t))(v101 + 8);
    v19(v104, v103);
  }
  else
  {
    v20 = v0[31];
    v21 = v0[25];
    v22 = v0[26];
    v110 = *(void (**)(uint64_t, uint64_t))(v0[18] + 8);
    v110(v0[24], v0[17]);

    v19 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v19(v20, v21);
  }
  v23 = (_QWORD *)v0[15];
  v24 = v23[17];
  v25 = v23[18];
  v106 = v23;
  v113 = v23 + 14;
  __swift_project_boxed_opaque_existential_0(v23 + 14, v24);
  v26 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v25 + 8))(0xD000000000000013, 0x80000001CDF40490, v24, v25);
  if (!v26 || (v27 = sub_1CDF225B0(v26), swift_bridgeObjectRelease(), !v27))
  {
LABEL_11:
    v34 = v0[20];
    v35 = v0[17];
    v36 = v0[14];
    ((void (*)(_QWORD, uint64_t, _QWORD))v8)(v0[28], v111, v0[25]);
    v9(v34, v36, v35);
    v37 = sub_1CDF32C10();
    v38 = sub_1CDF32E44();
    v39 = os_log_type_enabled(v37, v38);
    v40 = v0[28];
    v41 = v0[25];
    v42 = v0[20];
    v43 = v0[17];
    if (v39)
    {
      v112 = v0[25];
      v44 = (uint8_t *)swift_slowAlloc();
      v100 = v40;
      v45 = swift_slowAlloc();
      v114[0] = v45;
      *(_DWORD *)v44 = 136315138;
      sub_1CDF27140(&qword_1EFA5AE68, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      v46 = sub_1CDF32FD0();
      v0[6] = sub_1CDF0D64C(v46, v47, v114);
      sub_1CDF32EC8();
      swift_bridgeObjectRelease();
      v110(v42, v43);
      _os_log_impl(&dword_1CDEBD000, v37, v38, "No cached LiftUI data for %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v45, -1, -1);
      MEMORY[0x1D17BBC9C](v44, -1, -1);

      v19(v100, v112);
    }
    else
    {
      v110(v0[20], v0[17]);

      v19(v40, v41);
    }
    v48 = v106[17];
    v49 = v106[18];
    __swift_project_boxed_opaque_existential_0(v113, v48);
    v50 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v49 + 8))(0xD000000000000013, 0x80000001CDF40490, v48, v49);
    if (v50)
    {
      v51 = sub_1CDF225B0(v50);
      swift_bridgeObjectRelease();
      if (v51)
      {
        v114[0] = v51;
        v52 = sub_1CDF329B8();
        sub_1CDF251B8(v52, v53);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v54 = v106[17];
        v55 = v106[18];
        __swift_project_boxed_opaque_existential_0(v113, v54);
        v56 = v114[0];
        v0[5] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFA5AE80);
        v0[2] = v56;
        (*(void (**)(_QWORD *, unint64_t, unint64_t, uint64_t, uint64_t))(v55 + 16))(v0 + 2, 0xD000000000000013, 0x80000001CDF40490, v54, v55);
        sub_1CDF16A0C((uint64_t)(v0 + 2), &qword_1ED2B9B90);
      }
    }
    sub_1CDF26E0C();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v57 = (uint64_t (*)(void))v0[1];
    return v57();
  }
  v28 = sub_1CDF329B8();
  if (!*(_QWORD *)(v27 + 16) || (sub_1CDF15BB0(v28, v29), (v30 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v99 = v8;
  v31 = v0[17];
  v32 = v0[18];
  v33 = v0[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CDF329E8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v33, 1, v31) == 1)
  {
    sub_1CDF16A0C(v0[16], &qword_1EFA5AE60);
    goto LABEL_11;
  }
  v102 = v19;
  v59 = v0[30];
  v60 = v0[25];
  v62 = v0[22];
  v61 = v0[23];
  v63 = v0[17];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v0[18] + 32))(v61, v0[16], v63);
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v59, v111, v60);
  v9(v62, v61, v63);
  v64 = sub_1CDF32C10();
  v65 = sub_1CDF32E44();
  v66 = os_log_type_enabled(v64, v65);
  v67 = v0[30];
  v68 = v0[25];
  v69 = v0[22];
  v70 = v0[17];
  if (v66)
  {
    v107 = v9;
    v71 = (uint8_t *)swift_slowAlloc();
    v72 = swift_slowAlloc();
    v114[0] = v72;
    *(_DWORD *)v71 = 136315138;
    sub_1CDF27140(&qword_1EFA5AE68, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v73 = sub_1CDF32FD0();
    v0[11] = sub_1CDF0D64C(v73, v74, v114);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    v75 = v110;
    v110(v69, v70);
    _os_log_impl(&dword_1CDEBD000, v64, v65, "Cache file path: %s", v71, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v72, -1, -1);
    v76 = v71;
    v9 = v107;
    MEMORY[0x1D17BBC9C](v76, -1, -1);
  }
  else
  {
    v75 = v110;
    v110(v69, v70);
  }

  v102(v67, v68);
  v77 = v0[23];
  v78 = (_QWORD *)v0[15];
  v79 = v78[22];
  v80 = v78[23];
  __swift_project_boxed_opaque_existential_0(v78 + 19, v79);
  v81 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v80 + 32))(v77, v79, v80);
  v83 = v82;
  v84 = v0[21];
  v85 = v0[17];
  v86 = v0[14];
  ((void (*)(_QWORD, uint64_t, _QWORD))v99)(v0[29], v111, v0[25]);
  v9(v84, v86, v85);
  sub_1CDF26E50(v81, v83);
  v87 = sub_1CDF32C10();
  v88 = sub_1CDF32E44();
  v108 = v81;
  v98 = v83;
  if (os_log_type_enabled(v87, v88))
  {
    v89 = (_DWORD *)swift_slowAlloc();
    v114[0] = swift_slowAlloc();
    *v89 = 134218242;
    __asm { BR              X10 }
  }
  v90 = v0[29];
  v91 = v0[25];
  v92 = v0[23];
  v93 = v81;
  v94 = v0[21];
  v95 = v83;
  v96 = v0[17];

  v75(v94, v96);
  sub_1CDF26CD4(v93, v95);
  v102(v90, v91);
  v75(v92, v96);
  v97 = (uint64_t *)v0[13];
  *v97 = v108;
  v97[1] = v98;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v57 = (uint64_t (*)(void))v0[1];
  return v57();
}

uint64_t sub_1CDF24450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1CDF32DF0();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1CDF32DE4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_1CDF16A0C(a1, &qword_1ED2B9B68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CDF32DC0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1CDF24580()
{
  sub_1CDF32B68();
  return sub_1CDF32B50();
}

uint64_t sub_1CDF245C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a2;
  v8[5] = a1;
  swift_retain();
  swift_retain();
  sub_1CDF1009C((uint64_t)v6, (uint64_t)&unk_1EFA5AF50, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_1CDF24698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  v5[4] = *(_QWORD *)(*(_QWORD *)a4 + 160);
  return swift_task_switch();
}

uint64_t sub_1CDF246BC()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 32))();
  return swift_task_switch();
}

uint64_t sub_1CDF246FC()
{
  uint64_t v0;

  MEMORY[0x1D17BAE2C]();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF24780()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;

  v1 = v0;
  v2 = sub_1CDF32C1C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v0 + 14;
  v7 = v0[17];
  v8 = v0[18];
  __swift_project_boxed_opaque_existential_0(v0 + 14, v7);
  v9 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v8 + 8))(0xD000000000000013, 0x80000001CDF40490, v7, v8);
  if (v9 && (v10 = sub_1CDF225B0(v9), swift_bridgeObjectRelease(), v10))
  {
    swift_retain();
    sub_1CDF264B8(v10);
    swift_bridgeObjectRelease();
    swift_release();
    v11 = v1[17];
    v12 = v1[18];
    __swift_project_boxed_opaque_existential_0(v6, v11);
    return (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v12 + 24))(0xD000000000000013, 0x80000001CDF40490, v11, v12);
  }
  else
  {
    v14 = sub_1CDF27238();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    v15 = sub_1CDF32C10();
    v16 = sub_1CDF32E44();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1CDEBD000, v15, v16, "No cached LiftUI data to discard", v17, 2u);
      MEMORY[0x1D17BBC9C](v17, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

id sub_1CDF24948(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;
  uint64_t v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)sub_1CDF329C4();
  v11[0] = 0;
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForReadingFromURL_error_, v2, v11);

  v4 = v11[0];
  if (v3)
  {
    v5 = sub_1CDF32A00();
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
    v7 = v4;
    v6(a1, v5);
  }
  else
  {
    v8 = v11[0];
    sub_1CDF329A0();

    swift_willThrow();
    v9 = sub_1CDF32A00();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t LiftUICache.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 112);
  __swift_destroy_boxed_opaque_existential_0(v0 + 152);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LiftUICache.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 112);
  __swift_destroy_boxed_opaque_existential_0(v0 + 152);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t LiftUICache.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1CDF24AC0()
{
  return 1;
}

uint64_t sub_1CDF24AC8()
{
  return sub_1CDF33054();
}

uint64_t sub_1CDF24AEC()
{
  sub_1CDF33048();
  sub_1CDF33054();
  return sub_1CDF33060();
}

uint64_t sub_1CDF24B2C()
{
  sub_1CDF33048();
  sub_1CDF33054();
  return sub_1CDF33060();
}

uint64_t sub_1CDF24B68(uint64_t a1, uint64_t a2)
{
  return sub_1CDF24C30(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1CDF24B74()
{
  sub_1CDF32D24();
  sub_1CDF32D30();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CDF24BB4()
{
  uint64_t v0;

  sub_1CDF32D24();
  sub_1CDF33048();
  sub_1CDF32D30();
  v0 = sub_1CDF33060();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1CDF24C24(uint64_t a1, uint64_t a2)
{
  return sub_1CDF24C30(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1CDF24C30(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1CDF32D24();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1CDF24C6C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1CDF32D0C();
  *a2 = 0;
  return result;
}

uint64_t sub_1CDF24CE0(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1CDF32D18();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1CDF24D5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1CDF32D24();
  v2 = sub_1CDF32D00();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1CDF24D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1CDF32D24();
  v2 = v1;
  if (v0 == sub_1CDF32D24() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1CDF32FF4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1CDF24E24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1CDF32D00();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1CDF24E68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1CDF32D24();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1CDF24E90()
{
  sub_1CDF27140(&qword_1EFA5AF40, 255, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1CDF39B48);
  sub_1CDF27140(&qword_1EFA5AFC8, 255, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1CDF39A9C);
  return sub_1CDF32F88();
}

uint64_t sub_1CDF24F1C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1CDF16CFC;
  return v6();
}

uint64_t sub_1CDF24F70(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1CDF16CFC;
  return v7();
}

uint64_t sub_1CDF24FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1CDF32DF0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1CDF32DE4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1CDF16A0C(a1, &qword_1ED2B9B68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CDF32DC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1CDF25110(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CDF27180;
  return v6(a1);
}

unint64_t sub_1CDF25174()
{
  unint64_t result;

  result = qword_1EFA5AE70;
  if (!qword_1EFA5AE70)
  {
    result = MEMORY[0x1D17BBC00](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EFA5AE70);
  }
  return result;
}

uint64_t sub_1CDF251B8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1CDF15BB0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1CDF25908();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v6);
  sub_1CDF255C0(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1CDF2529C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AF78);
  v42 = a2;
  v6 = sub_1CDF32F64();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1CDF33048();
    sub_1CDF32D30();
    result = sub_1CDF33060();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1CDF255C0(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CDF32EF8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1CDF33048();
        swift_bridgeObjectRetain();
        sub_1CDF32D30();
        v9 = sub_1CDF33060();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1CDF25794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_1CDF15BB0(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1CDF25908();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CDF2529C(v17, a5 & 1);
  v23 = sub_1CDF15BB0(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CDF3300C();
  __break(1u);
  return result;
}

void *sub_1CDF25908()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AF78);
  v2 = *v0;
  v3 = sub_1CDF32F58();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1CDF25AC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, uint64_t, uint64_t);
  id v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  uint64_t *boxed_opaque_existential_0;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[12];

  v20[11] = *MEMORY[0x1E0C80C00];
  v3 = sub_1CDF32A00();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CDF0E874(0, &qword_1EFA5AF80);
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v7(v6, a1, v3);
  v8 = sub_1CDF24948((uint64_t)v6);
  if (!v1)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, sel_fileDescriptor);
    v20[0] = 66053;
    v11 = ffsctl(v10, 0xC0084A44uLL, v20, 0);
    if (v11)
    {
      v12 = v11;
      sub_1CDF32D24();
      v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AD78);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1CDF39590;
      *(_QWORD *)(inited + 32) = sub_1CDF32D24();
      *(_QWORD *)(inited + 40) = v15;
      *(_QWORD *)(inited + 72) = v3;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
      v7((char *)boxed_opaque_existential_0, a1, v3);
      sub_1CDF18098(inited);
      v17 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      v18 = (void *)sub_1CDF32D00();
      swift_bridgeObjectRelease();
      v19 = (void *)sub_1CDF32CB8();
      swift_bridgeObjectRelease();
      objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, v13, v19);

      swift_willThrow();
    }

  }
}

uint64_t sub_1CDF25CFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_1CDF32A00() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = v1 + ((v4 + 40) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1CDF16CFC;
  v7[2] = a1;
  v10 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v5 + 144) + *(_QWORD *)(*(_QWORD *)v5 + 144));
  v8 = (_QWORD *)swift_task_alloc();
  v7[3] = v8;
  *v8 = v7;
  v8[1] = sub_1CDF22D20;
  return v10(v6);
}

uint64_t type metadata accessor for LiftUICache()
{
  return objc_opt_self();
}

uint64_t sub_1CDF25DD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1CDF32A00();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF25E60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(sub_1CDF32A00() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1 + v5;
  v7 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1CDF15F64;
  return sub_1CDF23504(a1, v9, v10, v6, v7);
}

uint64_t sub_1CDF25EF0(uint64_t a1)
{
  uint64_t v1;

  return sub_1CDF245C8(a1, v1);
}

uint64_t sub_1CDF25EF8(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  char *v42;
  char *v43;
  id v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t (*v54)(char *, uint64_t);
  id v55;
  uint64_t v56;
  _QWORD *v57;
  os_log_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  _QWORD v61[2];
  os_log_t v62;
  _QWORD *v63;
  uint8_t *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v2 = sub_1CDF32C1C();
  v67 = *(_QWORD *)(v2 - 8);
  v68 = v2;
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v65 = (char *)v61 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE60);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CDF32A00();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)v61 - v15;
  v18 = *a1;
  v17 = a1[1];
  sub_1CDF329E8();
  v19 = v11;
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v21 = v10;
  if (v20(v9, 1, v10) == 1)
  {
    sub_1CDF16A0C((uint64_t)v9, &qword_1EFA5AE60);
    v22 = sub_1CDF27238();
    v23 = v67;
    v24 = v68;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v65, v22, v68);
    swift_bridgeObjectRetain_n();
    v25 = sub_1CDF32C10();
    v26 = sub_1CDF32E50();
    v27 = v23;
    if (os_log_type_enabled(v25, v26))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v70 = v29;
      *(_DWORD *)v28 = 136315138;
      v64 = v28 + 4;
      swift_bridgeObjectRetain();
      v69 = sub_1CDF0D64C(v18, v17, &v70);
      sub_1CDF32EC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CDEBD000, v25, v26, "Invalid URL was stored in LiftUI cache: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v29, -1, -1);
      MEMORY[0x1D17BBC9C](v28, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v65, v24);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v65, v24);
    }
  }
  else
  {
    v31 = v14;
    v32 = v5;
    v34 = v67;
    v33 = v68;
    v35 = v19;
    v36 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
    v37 = v16;
    v36(v16, v9, v21);
    v38 = (void *)v66;
    sub_1CDF25AC0((uint64_t)v16);
    if (v38)
    {
      v39 = sub_1CDF27238();
      v40 = v34;
      v41 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
      v42 = v32;
      v41(v32, v39, v33);
      v43 = v31;
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v31, v37, v21);
      v44 = v38;
      v45 = v38;
      v46 = sub_1CDF32C10();
      v47 = sub_1CDF32E50();
      v48 = v47;
      if (os_log_type_enabled(v46, v47))
      {
        v49 = swift_slowAlloc();
        LODWORD(v64) = v48;
        v50 = v49;
        v63 = (_QWORD *)swift_slowAlloc();
        v66 = swift_slowAlloc();
        v70 = v66;
        *(_DWORD *)v50 = 136315394;
        v61[1] = v50 + 4;
        sub_1CDF27140(&qword_1EFA5AE68, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
        v62 = v46;
        v51 = sub_1CDF32FD0();
        v69 = sub_1CDF0D64C(v51, v52, &v70);
        v65 = v37;
        sub_1CDF32EC8();
        swift_bridgeObjectRelease();
        v53 = *(void (**)(char *, uint64_t))(v35 + 8);
        v53(v43, v21);
        v54 = (uint64_t (*)(char *, uint64_t))v53;
        *(_WORD *)(v50 + 12) = 2112;
        v55 = v38;
        v56 = _swift_stdlib_bridgeErrorToNSError();
        v69 = v56;
        sub_1CDF32EC8();
        v57 = v63;
        *v63 = v56;

        v58 = v62;
        _os_log_impl(&dword_1CDEBD000, v62, (os_log_type_t)v64, "Failed to mark LiftUI content at %s for purge with error: %@", (uint8_t *)v50, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AAC0);
        swift_arrayDestroy();
        MEMORY[0x1D17BBC9C](v57, -1, -1);
        v59 = v66;
        swift_arrayDestroy();
        MEMORY[0x1D17BBC9C](v59, -1, -1);
        MEMORY[0x1D17BBC9C](v50, -1, -1);

        (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v68);
        return v54(v65, v21);
      }
      else
      {

        v60 = *(void (**)(char *, uint64_t))(v35 + 8);
        v60(v43, v21);

        (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v68);
        return ((uint64_t (*)(char *, uint64_t))v60)(v37, v21);
      }
    }
    else
    {
      return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v16, v21);
    }
  }
}

uint64_t sub_1CDF264B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t i;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18[2];

  v3 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v10 | (v9 << 6); ; i = __clz(__rbit64(v13)) + (v9 << 6))
  {
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * i);
    v16 = v15[1];
    v18[0] = *v15;
    v18[1] = v16;
    swift_bridgeObjectRetain();
    sub_1CDF25EF8(v18);
    if (v1)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v9++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v9 >= v7)
      return swift_release();
    v13 = *(_QWORD *)(v3 + 8 * v9);
    if (!v13)
    {
      v14 = v9 + 1;
      if (v9 + 1 >= v7)
        return swift_release();
      v13 = *(_QWORD *)(v3 + 8 * v14);
      if (v13)
        goto LABEL_14;
      v14 = v9 + 2;
      if (v9 + 2 >= v7)
        return swift_release();
      v13 = *(_QWORD *)(v3 + 8 * v14);
      if (v13)
        goto LABEL_14;
      v14 = v9 + 3;
      if (v9 + 3 >= v7)
        return swift_release();
      v13 = *(_QWORD *)(v3 + 8 * v14);
      if (v13)
      {
LABEL_14:
        v9 = v14;
        goto LABEL_15;
      }
      v17 = v9 + 4;
      if (v9 + 4 >= v7)
        return swift_release();
      v13 = *(_QWORD *)(v3 + 8 * v17);
      v9 += 4;
      if (!v13)
        break;
    }
LABEL_15:
    v6 = (v13 - 1) & v13;
  }
  while (1)
  {
    v9 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v13 = *(_QWORD *)(v3 + 8 * v9);
    ++v17;
    if (v13)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_1CDF26658()
{
  unint64_t result;

  result = qword_1EFA5AED0;
  if (!qword_1EFA5AED0)
  {
    result = MEMORY[0x1D17BBC00](&unk_1CDF39894, &type metadata for LiftUICacheError);
    atomic_store(result, (unint64_t *)&qword_1EFA5AED0);
  }
  return result;
}

uint64_t sub_1CDF2669C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_1CDF266A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_1CDF266AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_1CDF266B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_1CDF266CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_1CDF266E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_1CDF266FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_1CDF26714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_1CDF2672C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1CDF16CFC;
  return v11(a1, a2, a3, a4);
}

uint64_t method lookup function for LiftUICache()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LiftUICache.cacheResponseObjC(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of LiftUICache.cacheResponse(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CDF15F64;
  return v6(a1);
}

uint64_t dispatch thunk of LiftUICache.fetchResponseForURLObjc(url:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 136) + *(_QWORD *)(*(_QWORD *)v1 + 136));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CDF27194;
  return v6(a1);
}

uint64_t dispatch thunk of LiftUICache.fetchResponse(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 144) + *(_QWORD *)(*(_QWORD *)v1 + 144));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CDF268F8;
  return v6(a1);
}

uint64_t sub_1CDF268F8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t dispatch thunk of LiftUICache.discardCachesObjc()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of LiftUICache.discardCaches()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t getEnumTagSinglePayload for LiftUICacheError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for LiftUICacheError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1CDF269FC + 4 * byte_1CDF39800[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CDF26A1C + 4 * byte_1CDF39805[v4]))();
}

_BYTE *sub_1CDF269FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CDF26A1C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CDF26A24(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CDF26A2C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CDF26A34(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CDF26A3C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LiftUICacheError()
{
  return &type metadata for LiftUICacheError;
}

uint64_t sub_1CDF26A58()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF26A8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (const void *)v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1CDF16CFC;
  return ((uint64_t (*)(uint64_t, const void *, uint64_t))((char *)&dword_1EFA5AEF8 + dword_1EFA5AEF8))(v2, v3, v4);
}

uint64_t sub_1CDF26AFC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1CDF16CFC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EFA5AF08 + dword_1EFA5AF08))(v2, v3, v4);
}

uint64_t objectdestroy_22Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF26BA4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1CDF16CFC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EFA5AF18 + dword_1EFA5AF18))(a1, v4, v5, v6);
}

uint64_t sub_1CDF26C28()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF26C4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CDF16CFC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFA5AF28 + dword_1EFA5AF28))(a1, v4);
}

uint64_t sub_1CDF26CC0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1CDF26CD4(a1, a2);
  return a1;
}

uint64_t sub_1CDF26CD4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

void type metadata accessor for FileAttributeKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EFA5AFA8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EFA5AFA8);
  }
}

uint64_t sub_1CDF26D6C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF26DA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_1CDF16CFC;
  *(_OWORD *)(v2 + 16) = v3;
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(*(_QWORD *)v3 + 160);
  return swift_task_switch();
}

unint64_t sub_1CDF26E0C()
{
  unint64_t result;

  result = qword_1EFA5AF60;
  if (!qword_1EFA5AF60)
  {
    result = MEMORY[0x1D17BBC00](&unk_1CDF398FC, &type metadata for LiftUICacheError);
    atomic_store(result, (unint64_t *)&qword_1EFA5AF60);
  }
  return result;
}

uint64_t sub_1CDF26E50(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1CDF26E94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CDF16CFC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFA5AF68 + dword_1EFA5AF68))(a1, v4);
}

uint64_t sub_1CDF26F04()
{
  return swift_release();
}

uint64_t sub_1CDF26F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AF90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CDF26F54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1CDF32A00();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF26FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v2 = *(_QWORD *)(sub_1CDF32A00() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = v0 + v3;
  v6 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_1CDF16CFC;
  v7[2] = v6;
  v10 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v4 + 120) + *(_QWORD *)(*(_QWORD *)v4 + 120));
  v8 = (_QWORD *)swift_task_alloc();
  v7[3] = v8;
  *v8 = v7;
  v8[1] = sub_1CDF20204;
  return v10(v5);
}

uint64_t sub_1CDF270B0()
{
  return sub_1CDF27140(&qword_1EFA5AFB0, 255, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1CDF39A60);
}

uint64_t sub_1CDF270E0()
{
  return sub_1CDF27140(&qword_1EFA5AFB8, 255, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1CDF39A34);
}

uint64_t sub_1CDF27110()
{
  return sub_1CDF27140(&qword_1EFA5AFC0, 255, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1CDF39AD0);
}

uint64_t sub_1CDF27140(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1D17BBC00](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CDF27198(uint64_t a1)
{
  return sub_1CDF2728C(a1, qword_1ED2B9CA0);
}

uint64_t sub_1CDF271B0()
{
  sub_1CDF271FC();
  return sub_1CDF32EB0();
}

unint64_t sub_1CDF271FC()
{
  unint64_t result;

  result = qword_1ED2B9B70;
  if (!qword_1ED2B9B70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED2B9B70);
  }
  return result;
}

uint64_t sub_1CDF27238()
{
  return sub_1CDF27384(&qword_1ED2B9CB8, (uint64_t)qword_1ED2B9CA0);
}

uint64_t static QuotaLogger.core.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CDF273E0(&qword_1ED2B9CB8, (uint64_t)qword_1ED2B9CA0, a1);
}

uint64_t sub_1CDF27270(uint64_t a1)
{
  return sub_1CDF2728C(a1, qword_1EFA5C268);
}

uint64_t sub_1CDF2728C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1CDF32C1C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_1CDF271FC();
  sub_1CDF32EB0();
  return sub_1CDF32C28();
}

uint64_t sub_1CDF27318()
{
  sub_1CDF271FC();
  return sub_1CDF32EB0();
}

uint64_t sub_1CDF27368()
{
  return sub_1CDF27384(&qword_1EFA5C260, (uint64_t)qword_1EFA5C268);
}

uint64_t sub_1CDF27384(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_1CDF32C1C();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static QuotaLogger.banner.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CDF273E0(&qword_1EFA5C260, (uint64_t)qword_1EFA5C268, a1);
}

uint64_t sub_1CDF273E0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1CDF32C1C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

ValueMetadata *type metadata accessor for QuotaLogger()
{
  return &type metadata for QuotaLogger;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_1CDF27498()
{
  byte_1ED2B9C68 = 1;
  qword_1ED2B9C70 = 0xED00006B6E694C68;
}

void *sub_1CDF274C0()
{
  return &unk_1CDF39BD0;
}

uint64_t static AppLaunchLinkTracker.neverShown.getter()
{
  return -1;
}

void sub_1CDF274DC()
{
  id v0;
  void *v1;
  id v2;
  objc_class *v3;
  char *v4;
  char *v5;
  char *v6;
  id v7;
  void *v8;
  char *v9;
  id v10;
  id v11;
  objc_super v12;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v1 = (void *)sub_1CDF32D00();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  v3 = (objc_class *)type metadata accessor for AppLaunchLinkTracker();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = v4;
  if (v2)
  {
    v6 = v4;
    v7 = v2;
  }
  else
  {
    v8 = (void *)objc_opt_self();
    v9 = v5;
    v7 = objc_msgSend(v8, sel_standardUserDefaults);
  }
  *(_QWORD *)&v5[OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults] = v7;
  v10 = v2;

  v12.receiver = v5;
  v12.super_class = v3;
  v11 = objc_msgSendSuper2(&v12, sel_init);

  qword_1ED2B9C90 = (uint64_t)v11;
}

id sub_1CDF275D4()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v1 = (void *)sub_1CDF32D00();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  return v2;
}

id sub_1CDF2763C(void *a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  char *v5;
  id v6;
  void *v7;
  char *v8;
  id v9;
  id v10;
  objc_super v12;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    v6 = a1;
  }
  else
  {
    v7 = (void *)objc_opt_self();
    v8 = v4;
    v6 = objc_msgSend(v7, sel_standardUserDefaults);
  }
  *(_QWORD *)&v4[OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults] = v6;
  v9 = a1;

  v12.receiver = v4;
  v12.super_class = v1;
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t *sub_1CDF276E8()
{
  if (qword_1ED2B9C98 != -1)
    swift_once();
  return &qword_1ED2B9C90;
}

id static AppLaunchLinkTracker.shared.getter()
{
  if (qword_1ED2B9C98 != -1)
    swift_once();
  return (id)qword_1ED2B9C90;
}

id sub_1CDF277A8(void *a1)
{
  char *v1;
  char *v3;
  id v4;
  void *v5;
  char *v6;
  id v7;
  id v8;
  objc_super v10;

  if (a1)
  {
    v3 = v1;
    v4 = a1;
  }
  else
  {
    v5 = (void *)objc_opt_self();
    v6 = v1;
    v4 = objc_msgSend(v5, sel_standardUserDefaults);
  }
  *(_QWORD *)&v1[OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults] = v4;
  v7 = a1;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for AppLaunchLinkTracker();
  v8 = objc_msgSendSuper2(&v10, sel_init);

  return v8;
}

uint64_t type metadata accessor for AppLaunchLinkTracker()
{
  return objc_opt_self();
}

uint64_t sub_1CDF2786C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[2];
  _BYTE v29[24];
  uint64_t v30;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFD8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)(v3 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  if (qword_1ED2B9C80 != -1)
    swift_once();
  v11 = (void *)sub_1CDF32D00();
  v12 = objc_msgSend(v10, sel_objectForKey_, v11);

  if (v12)
  {
    sub_1CDF32EE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v28, 0, sizeof(v28));
  }
  sub_1CDF27D10((uint64_t)v28, (uint64_t)v29);
  if (!v30)
  {
    sub_1CDF16A0C((uint64_t)v29, &qword_1ED2B9B90);
LABEL_16:
    v25 = type metadata accessor for AppLaunchEvent();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v9, 1, 1, v25);
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFE8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_16;
  v13 = v27;
  if (!v27)
    goto LABEL_16;
  if (!*(_QWORD *)(v27 + 16))
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  v14 = sub_1CDF15BB0(a1, a2);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v16 = (uint64_t *)(*(_QWORD *)(v13 + 56) + 16 * v14);
  v17 = *v16;
  v18 = v16[1];
  sub_1CDF26E50(*v16, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CDF32964();
  swift_allocObject();
  sub_1CDF26E50(v17, v18);
  sub_1CDF32958();
  v19 = type metadata accessor for AppLaunchEvent();
  sub_1CDF2B424(&qword_1EFA5AFE0, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchEvent, (uint64_t)&unk_1CDF39BD8);
  sub_1CDF3294C();
  swift_release();
  sub_1CDF26CD4(v17, v18);
  v20 = *(_QWORD *)(v19 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v9, 0, 1, v19);
  sub_1CDF26CD4(v17, v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v19) != 1)
  {
    v21 = &v9[*(int *)(v19 + 20)];
    v22 = sub_1CDF32A78();
    v23 = *(_QWORD *)(v22 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(a3, v21, v22);
    sub_1CDF29F94((uint64_t)v9);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(a3, 0, 1, v22);
  }
LABEL_17:
  sub_1CDF16A0C((uint64_t)v9, &qword_1EFA5AFD8);
  v26 = sub_1CDF32A78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(a3, 1, 1, v26);
}

uint64_t sub_1CDF27BD0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;

  if (a2 >> 60 == 15)
  {
    v4 = type metadata accessor for AppLaunchEvent();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
    v6 = a3;
    v7 = 1;
  }
  else
  {
    sub_1CDF32964();
    swift_allocObject();
    sub_1CDF26E50(a1, a2);
    sub_1CDF32958();
    v10 = type metadata accessor for AppLaunchEvent();
    sub_1CDF2B424(&qword_1EFA5AFE0, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchEvent, (uint64_t)&unk_1CDF39BD8);
    sub_1CDF3294C();
    swift_release();
    sub_1CDF26CC0(a1, a2);
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
    v6 = a3;
    v7 = 0;
    v4 = v10;
  }
  return v5(v6, v7, 1, v4);
}

uint64_t sub_1CDF27D10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for AppLaunchEvent()
{
  uint64_t result;

  result = qword_1EFA5C390;
  if (!qword_1EFA5C390)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CDF27E80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  void (*v45)(_BYTE *, uint64_t);
  uint64_t v46;
  char v47;
  _BYTE v48[12];
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  _BYTE *v52;
  _BYTE *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _OWORD v59[2];
  _BYTE v60[24];
  uint64_t v61;

  v5 = sub_1CDF32B14();
  v56 = *(_QWORD *)(v5 - 8);
  v57 = v5;
  MEMORY[0x1E0C80A78](v5);
  v53 = &v48[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1CDF32940();
  v54 = *(_QWORD *)(v7 - 8);
  v55 = v7;
  MEMORY[0x1E0C80A78](v7);
  v52 = &v48[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFD8);
  MEMORY[0x1E0C80A78](v9);
  v11 = &v48[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5ADB0);
  MEMORY[0x1E0C80A78](v12);
  v14 = &v48[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_1CDF32A78();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = &v48[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v17);
  v21 = &v48[-v20];
  v22 = *(void **)(v2 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  if (qword_1ED2B9C80 != -1)
    swift_once();
  v23 = (void *)sub_1CDF32D00();
  v24 = objc_msgSend(v22, sel_objectForKey_, v23);

  if (v24)
  {
    sub_1CDF32EE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v59, 0, sizeof(v59));
  }
  sub_1CDF27D10((uint64_t)v59, (uint64_t)v60);
  if (!v61)
  {
    sub_1CDF16A0C((uint64_t)v60, &qword_1ED2B9B90);
LABEL_15:
    v33 = type metadata accessor for AppLaunchEvent();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v11, 1, 1, v33);
LABEL_16:
    sub_1CDF16A0C((uint64_t)v11, &qword_1EFA5AFD8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
LABEL_17:
    sub_1CDF16A0C((uint64_t)v14, &qword_1EFA5ADB0);
    return -1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFE8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_15;
  v25 = v58;
  if (!v58)
    goto LABEL_15;
  if (!*(_QWORD *)(v58 + 16))
  {
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  v26 = sub_1CDF15BB0(a1, a2);
  if ((v27 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v28 = (uint64_t *)(*(_QWORD *)(v25 + 56) + 16 * v26);
  v29 = v28[1];
  v30 = *v28;
  sub_1CDF26E50(*v28, v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CDF32964();
  swift_allocObject();
  v31 = v30;
  sub_1CDF26E50(v30, v29);
  sub_1CDF32958();
  v32 = type metadata accessor for AppLaunchEvent();
  sub_1CDF2B424(&qword_1EFA5AFE0, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchEvent, (uint64_t)&unk_1CDF39BD8);
  v50 = v31;
  v51 = v29;
  sub_1CDF3294C();
  v49 = 0;
  swift_release();
  v35 = v50;
  v36 = v51;
  sub_1CDF26CD4(v50, v51);
  v37 = *(_QWORD *)(v32 - 8);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v11, v49, 1, v32);
  sub_1CDF26CD4(v35, v36);
  v38 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v37 + 48))(v11, 1, v32);
  if (v38 == 1)
    goto LABEL_16;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v16 + 16))(v14, &v11[*(int *)(v32 + 20)], v15);
  sub_1CDF29F94((uint64_t)v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
    goto LABEL_17;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v16 + 32))(v21, v14, v15);
  v39 = v53;
  sub_1CDF32AFC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFF0);
  v40 = sub_1CDF32B08();
  v41 = *(_QWORD *)(v40 - 8);
  v42 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_1CDF39590;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v41 + 104))(v43 + v42, *MEMORY[0x1E0CB1130], v40);
  sub_1CDF2AA8C(v43);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_1CDF32A60();
  v44 = v52;
  sub_1CDF32AE4();
  swift_bridgeObjectRelease();
  v45 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
  v45(v19, v15);
  (*(void (**)(_BYTE *, uint64_t))(v56 + 8))(v39, v57);
  v46 = sub_1CDF32934();
  LOBYTE(v40) = v47;
  (*(void (**)(_BYTE *, uint64_t))(v54 + 8))(v44, v55);
  v45(v21, v15);
  if ((v40 & 1) != 0)
    return 0;
  else
    return v46;
}

uint64_t sub_1CDF284B8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  v1 = *(void **)(v0 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  if (qword_1ED2B9C80 != -1)
    swift_once();
  v2 = (void *)sub_1CDF32D00();
  v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_1CDF32EE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_1CDF27D10((uint64_t)v8, (uint64_t)v9);
  if (!v10)
  {
    sub_1CDF16A0C((uint64_t)v9, &qword_1ED2B9B90);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFE8);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v4 = sub_1CDF29FD0(v7);
  swift_bridgeObjectRelease();
  v5 = sub_1CDF28BC8(v4);
  swift_release();
  return v5;
}

uint64_t sub_1CDF28620@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  char *v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char v37;
  char v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  void *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;

  v53 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFD8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5ADB0);
  MEMORY[0x1E0C80A78](v6);
  v43 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CDF32A78();
  v42 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v45 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v44 = (char *)&v41 - v11;
  v12 = sub_1CDF32B14();
  v51 = *(_QWORD *)(v12 - 8);
  v52 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1CDF32940();
  v49 = *(_QWORD *)(v15 - 8);
  v50 = v15;
  MEMORY[0x1E0C80A78](v15);
  v47 = v14;
  v48 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v17 = a1[1];
  sub_1CDF32AFC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFF0);
  v19 = sub_1CDF32B08();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1CDF39590;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v20 + 104))(v22 + v21, *MEMORY[0x1E0CB1130], v19);
  sub_1CDF2AA8C(v22);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_1CDF32964();
  swift_allocObject();
  sub_1CDF26E50(v18, v17);
  sub_1CDF32958();
  v23 = type metadata accessor for AppLaunchEvent();
  sub_1CDF2B424(&qword_1EFA5AFE0, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchEvent, (uint64_t)&unk_1CDF39BD8);
  v24 = v46;
  sub_1CDF3294C();
  if (v24)
  {

    swift_release();
    sub_1CDF26CD4(v18, v17);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v5, 1, 1, v23);
    sub_1CDF16A0C((uint64_t)v5, &qword_1EFA5AFD8);
    v26 = v42;
    v25 = (uint64_t)v43;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56))(v43, 1, 1, v8);
    v28 = v44;
    v27 = v45;
LABEL_4:
    v32 = v8;
    sub_1CDF32A60();
    sub_1CDF16A0C(v25, &qword_1EFA5ADB0);
    goto LABEL_6;
  }
  swift_release();
  sub_1CDF26CD4(v18, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v5, 0, 1, v23);
  v29 = &v5[*(int *)(v23 + 20)];
  v30 = v42;
  v25 = (uint64_t)v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v43, v29, v8);
  sub_1CDF29F94((uint64_t)v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v30 + 56))(v25, 0, 1, v8);
  v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v25, 1, v8);
  v26 = v30;
  v28 = v44;
  v27 = v45;
  if (v31 == 1)
    goto LABEL_4;
  v32 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v44, v25, v8);
LABEL_6:
  sub_1CDF32A60();
  v33 = v47;
  v34 = v48;
  sub_1CDF32AE4();
  swift_bridgeObjectRelease();
  v35 = *(void (**)(char *, uint64_t))(v26 + 8);
  v35(v27, v32);
  v35(v28, v32);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v33, v52);
  v36 = sub_1CDF32934();
  v38 = v37;
  result = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v34, v50);
  if ((v38 & 1) != 0)
    v40 = 0;
  else
    v40 = v36;
  *v53 = v40;
  return result;
}

unint64_t sub_1CDF28AA4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B0A8);
  v2 = (_QWORD *)sub_1CDF32F70();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    sub_1CDF26E50(v7, v8);
    result = sub_1CDF15BB0(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (uint64_t *)(v2[7] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1CDF28BC8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t inited;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return v2;
  v28 = MEMORY[0x1E0DEE9D8];
  sub_1CDF2A528(0, v1, 0);
  v2 = v28;
  result = sub_1CDF2AA04(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v27 = a1 + 64;
  v25 = v1;
  v26 = v5;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_24;
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
    v13 = *v12;
    v14 = v12[1];
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v6);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AD78);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CDF39BB0;
    *(_QWORD *)(inited + 32) = 0x6449707061;
    *(_QWORD *)(inited + 40) = 0xE500000000000000;
    *(_QWORD *)(inited + 48) = v13;
    *(_QWORD *)(inited + 56) = v14;
    *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 80) = 0xD000000000000015;
    *(_QWORD *)(inited + 120) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(inited + 88) = 0x80000001CDF40660;
    *(_QWORD *)(inited + 96) = v15;
    swift_bridgeObjectRetain();
    v17 = sub_1CDF18098(inited);
    result = swift_bridgeObjectRelease();
    v19 = *(_QWORD *)(v28 + 16);
    v18 = *(_QWORD *)(v28 + 24);
    if (v19 >= v18 >> 1)
      result = sub_1CDF2A528(v18 > 1, v19 + 1, 1);
    *(_QWORD *)(v28 + 16) = v19 + 1;
    *(_QWORD *)(v28 + 8 * v19 + 32) = v17;
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = a1 + 64;
    v20 = *(_QWORD *)(v27 + 8 * v11);
    if ((v20 & (1 << v6)) == 0)
      goto LABEL_26;
    v5 = v26;
    if (*(_DWORD *)(a1 + 36) != v26)
      goto LABEL_27;
    v21 = v20 & (-2 << (v6 & 0x3F));
    if (v21)
    {
      v9 = __clz(__rbit64(v21)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v25;
    }
    else
    {
      v22 = v11 + 1;
      v23 = (unint64_t)(v9 + 63) >> 6;
      v10 = v25;
      if (v11 + 1 < v23)
      {
        v24 = *(_QWORD *)(v27 + 8 * v22);
        if (v24)
        {
LABEL_20:
          v9 = __clz(__rbit64(v24)) + (v22 << 6);
        }
        else
        {
          while (v23 - 2 != v11)
          {
            v24 = *(_QWORD *)(a1 + 80 + 8 * v11++);
            if (v24)
            {
              v22 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    v6 = v9;
    if (v7 == v10)
      return v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

BOOL sub_1CDF28ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  _OWORD v25[2];
  _QWORD v26[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFD8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (uint64_t *)((char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void **)(v2 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  if (qword_1ED2B9C80 != -1)
    swift_once();
  v9 = (void *)sub_1CDF32D00();
  v10 = objc_msgSend(v8, sel_objectForKey_, v9);

  if (v10)
  {
    sub_1CDF32EE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  sub_1CDF27D10((uint64_t)v25, (uint64_t)v26);
  if (!v26[3])
  {
    sub_1CDF16A0C((uint64_t)v26, &qword_1ED2B9B90);
LABEL_16:
    v20 = type metadata accessor for AppLaunchEvent();
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v7, 1, 1, v20);
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFE8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_16;
  v11 = v24;
  if (!v24)
    goto LABEL_16;
  if (!*(_QWORD *)(v24 + 16))
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  v12 = sub_1CDF15BB0(a1, a2);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v14 = (uint64_t *)(*(_QWORD *)(v11 + 56) + 16 * v12);
  v15 = *v14;
  v16 = v14[1];
  sub_1CDF26E50(*v14, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CDF32964();
  swift_allocObject();
  sub_1CDF26E50(v15, v16);
  sub_1CDF32958();
  v17 = type metadata accessor for AppLaunchEvent();
  sub_1CDF2B424(&qword_1EFA5AFE0, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchEvent, (uint64_t)&unk_1CDF39BD8);
  sub_1CDF3294C();
  swift_release();
  sub_1CDF26CD4(v15, v16);
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v7, 0, 1, v17);
  sub_1CDF26CD4(v15, v16);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v18 + 48))(v7, 1, v17) == 1)
  {
LABEL_17:
    sub_1CDF16A0C((uint64_t)v7, &qword_1EFA5AFD8);
    v19 = 0;
    goto LABEL_18;
  }
  v19 = *v7;
  sub_1CDF29F94((uint64_t)v7);
LABEL_18:
  v21 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  objc_msgSend(v21, sel_operatingSystemVersion);
  v22 = v26[0];

  return v19 < v22;
}

void sub_1CDF2926C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  void *v31;
  id v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  void *v41;
  void *v42;
  _BYTE v43[12];
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(_BYTE *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  unint64_t v55;
  _OWORD v56[2];
  uint64_t v57[5];

  v4 = v3;
  v53 = type metadata accessor for AppLaunchEvent();
  MEMORY[0x1E0C80A78](v53);
  v54 = (uint64_t *)&v43[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_1CDF32A78();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = &v43[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_1CDF32C1C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = &v43[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = sub_1CDF27238();
  v49 = v14;
  v50 = v13;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  v51 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16);
  v52 = a1;
  v51(v12, a1, v9);
  swift_bridgeObjectRetain_n();
  v18 = sub_1CDF32C10();
  v19 = sub_1CDF32E44();
  v20 = v19;
  v21 = os_log_type_enabled(v18, v19);
  v47 = a2;
  v48 = a3;
  if (v21)
  {
    v22 = swift_slowAlloc();
    v46 = v4;
    v23 = v22;
    v45 = swift_slowAlloc();
    v57[0] = v45;
    *(_DWORD *)v23 = 136315394;
    sub_1CDF2B424(&qword_1EFA5ADD0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
    v44 = v20;
    v24 = sub_1CDF32FD0();
    *(_QWORD *)&v56[0] = sub_1CDF0D64C(v24, v25, v57);
    v26 = v48;
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
    *(_WORD *)(v23 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v56[0] = sub_1CDF0D64C(a2, v26, v57);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CDEBD000, v18, (os_log_type_t)v44, "Saving last shown date %s for bundle: %s", (uint8_t *)v23, 0x16u);
    v27 = v45;
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v27, -1, -1);
    v28 = v23;
    v4 = v46;
    MEMORY[0x1D17BBC9C](v28, -1, -1);

  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(_BYTE *, uint64_t))(v49 + 8))(v16, v50);
  v29 = *(void **)(v4 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  v30 = v54;
  if (qword_1ED2B9C80 != -1)
    swift_once();
  v31 = (void *)sub_1CDF32D00();
  v32 = objc_msgSend(v29, sel_objectForKey_, v31);

  if (v32)
  {
    sub_1CDF32EE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v56, 0, sizeof(v56));
  }
  sub_1CDF27D10((uint64_t)v56, (uint64_t)v57);
  if (!v57[3])
  {
    sub_1CDF16A0C((uint64_t)v57, &qword_1ED2B9B90);
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AFE8);
  if (!swift_dynamicCast())
  {
LABEL_13:
    v33 = sub_1CDF28AA4(MEMORY[0x1E0DEE9D8]);
    goto LABEL_14;
  }
  v33 = v55;
LABEL_14:
  v34 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  objc_msgSend(v34, sel_operatingSystemVersion);
  v35 = v57[0];

  v51((_BYTE *)v30 + *(int *)(v53 + 20), v52, v9);
  *v30 = v35;
  sub_1CDF32988();
  swift_allocObject();
  sub_1CDF3297C();
  sub_1CDF2B424(&qword_1EFA5AFF8, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchEvent, (uint64_t)&unk_1CDF39C00);
  v36 = sub_1CDF32970();
  v38 = v37;
  swift_release();
  sub_1CDF29F94((uint64_t)v30);
  v39 = v48;
  swift_bridgeObjectRetain();
  sub_1CDF26E50(v36, v38);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v57[0] = v33;
  sub_1CDF2A6CC(v36, v38, v47, v39, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CDF26CD4(v36, v38);
  v41 = (void *)sub_1CDF32CB8();
  swift_bridgeObjectRelease();
  v42 = (void *)sub_1CDF32D00();
  objc_msgSend(v29, sel_setObject_forKey_, v41, v42);

}

uint64_t sub_1CDF29844@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  char *v4;
  uint64_t v5;

  *a3 = a1;
  v4 = (char *)a3 + *(int *)(type metadata accessor for AppLaunchEvent() + 20);
  v5 = sub_1CDF32A78();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
}

uint64_t sub_1CDF29894()
{
  uint64_t v0;

  sub_1CDF32988();
  swift_allocObject();
  sub_1CDF3297C();
  type metadata accessor for AppLaunchEvent();
  sub_1CDF2B424(&qword_1EFA5AFF8, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchEvent, (uint64_t)&unk_1CDF39C00);
  v0 = sub_1CDF32970();
  swift_release();
  return v0;
}

id AppLaunchLinkTracker.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AppLaunchLinkTracker.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AppLaunchLinkTracker.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppLaunchLinkTracker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1CDF29AD4()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_1CDF29ADC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for AppLaunchEvent() + 20);
  v4 = sub_1CDF32A78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1CDF29B24(char a1)
{
  if ((a1 & 1) != 0)
    return 1702125924;
  else
    return 0x6F6973726556736FLL;
}

uint64_t sub_1CDF29B58()
{
  char *v0;

  return sub_1CDF29B24(*v0);
}

uint64_t sub_1CDF29B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CDF2B2FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CDF29B84()
{
  return 0;
}

void sub_1CDF29B90(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1CDF29B9C()
{
  sub_1CDF2ACF4();
  return sub_1CDF33084();
}

uint64_t sub_1CDF29BC4()
{
  sub_1CDF2ACF4();
  return sub_1CDF33090();
}

uint64_t sub_1CDF29BEC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B000);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1CDF2ACF4();
  sub_1CDF33078();
  v8[15] = 0;
  sub_1CDF32FB8();
  if (!v1)
  {
    type metadata accessor for AppLaunchEvent();
    v8[14] = 1;
    sub_1CDF32A78();
    sub_1CDF2B424(&qword_1EFA5B008, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
    sub_1CDF32FC4();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1CDF29D40@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v22 = a2;
  v25 = sub_1CDF32A78();
  v23 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25);
  v24 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B010);
  v5 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AppLaunchEvent();
  MEMORY[0x1E0C80A78](v8);
  v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1CDF2ACF4();
  sub_1CDF3306C();
  if (!v2)
  {
    v21 = v8;
    v12 = v24;
    v11 = v25;
    v28 = 0;
    v13 = v26;
    v14 = sub_1CDF32FA0();
    v20 = v10;
    *v10 = v14;
    v27 = 1;
    sub_1CDF2B424(qword_1EFA5B018, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
    v15 = v11;
    sub_1CDF32FAC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v13);
    v16 = v22;
    v17 = (uint64_t)v20;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))((char *)v20 + *(int *)(v21 + 20), v12, v15);
    sub_1CDF2AD38(v17, v16);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1CDF29F6C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CDF29D40(a1, a2);
}

uint64_t sub_1CDF29F80(_QWORD *a1)
{
  return sub_1CDF29BEC(a1);
}

uint64_t sub_1CDF29F94(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AppLaunchEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CDF29FD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t i;
  BOOL v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[2];
  uint64_t v31;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B0B8);
  result = sub_1CDF32F58();
  v4 = (_QWORD *)result;
  v5 = 0;
  v29 = a1;
  v8 = *(_QWORD *)(a1 + 64);
  v7 = a1 + 64;
  v6 = v8;
  v9 = 1 << *(_BYTE *)(v7 - 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v6;
  v26 = v7;
  v27 = (unint64_t)(v9 + 63) >> 6;
  v28 = result + 64;
  if ((v10 & v6) == 0)
    goto LABEL_5;
LABEL_4:
  v12 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v29 + 48) + 16 * i);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v29 + 56) + 16 * i);
    v21 = v20[1];
    v30[0] = *v20;
    v22 = v30[0];
    v30[1] = v21;
    swift_bridgeObjectRetain();
    sub_1CDF26E50(v22, v21);
    sub_1CDF28620(v30, &v31);
    if (v1)
    {
      swift_bridgeObjectRelease();
      swift_release();
      sub_1CDF26CD4(v22, v21);
      return (uint64_t)v4;
    }
    result = sub_1CDF26CD4(v22, v21);
    *(_QWORD *)(v28 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v23 = (_QWORD *)(v4[6] + 16 * i);
    *v23 = v19;
    v23[1] = v18;
    *(_QWORD *)(v4[7] + 8 * i) = v31;
    v24 = v4[2];
    v14 = __OFADD__(v24, 1);
    v25 = v24 + 1;
    if (v14)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v4[2] = v25;
    if (v11)
      goto LABEL_4;
LABEL_5:
    v14 = __OFADD__(v5++, 1);
    if (v14)
      goto LABEL_27;
    if (v5 >= v27)
      return (uint64_t)v4;
    v15 = *(_QWORD *)(v26 + 8 * v5);
    if (!v15)
      break;
LABEL_15:
    v11 = (v15 - 1) & v15;
  }
  v16 = v5 + 1;
  if (v5 + 1 >= v27)
    return (uint64_t)v4;
  v15 = *(_QWORD *)(v26 + 8 * v16);
  if (v15)
    goto LABEL_14;
  v16 = v5 + 2;
  if (v5 + 2 >= v27)
    return (uint64_t)v4;
  v15 = *(_QWORD *)(v26 + 8 * v16);
  if (v15)
    goto LABEL_14;
  v16 = v5 + 3;
  if (v5 + 3 >= v27)
    return (uint64_t)v4;
  v15 = *(_QWORD *)(v26 + 8 * v16);
  if (v15)
  {
LABEL_14:
    v5 = v16;
    goto LABEL_15;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v27)
      return (uint64_t)v4;
    v15 = *(_QWORD *)(v26 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1CDF2A21C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B0A8);
  v6 = a2;
  v7 = sub_1CDF32F64();
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v22 = v21 | (v14 << 6);
      }
      else
      {
        v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35)
          goto LABEL_33;
        v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          v14 = v23 + 1;
          if (v23 + 1 >= v35)
            goto LABEL_33;
          v24 = v36[v14];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v6 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                v14 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v14 >= v35)
                  goto LABEL_33;
                v24 = v36[v14];
                ++v25;
                if (v24)
                  goto LABEL_30;
              }
            }
            v14 = v25;
          }
        }
LABEL_30:
        v11 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      v30 = 16 * v22;
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v30);
      v33 = *v31;
      v32 = v31[1];
      v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_1CDF26E50(v37, *((unint64_t *)&v37 + 1));
      }
      sub_1CDF33048();
      sub_1CDF32D30();
      result = sub_1CDF33060();
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v17 == v27;
          if (v17 == v27)
            v17 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 16 * v18;
      v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
      *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + v19) = v37;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v3 = v8;
  return result;
}

uint64_t sub_1CDF2A528(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CDF2A544(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1CDF2A544(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B0B0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B0A0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1CDF32F7C();
  __break(1u);
  return result;
}

uint64_t sub_1CDF2A6CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_1CDF15BB0(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1CDF2A840();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7] + 16 * v14;
      result = sub_1CDF26CD4(*(_QWORD *)v21, *(_QWORD *)(v21 + 8));
      *(_QWORD *)v21 = a1;
      *(_QWORD *)(v21 + 8) = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CDF2A21C(v17, a5 & 1);
  v23 = sub_1CDF15BB0(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CDF3300C();
  __break(1u);
  return result;
}

void *sub_1CDF2A840()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B0A8);
  v2 = *v0;
  v3 = sub_1CDF32F58();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v24 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    result = (void *)sub_1CDF26E50(v24, *((unint64_t *)&v24 + 1));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1CDF2AA04(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_1CDF2AA8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_1CDF32B08();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B0C0);
    v10 = sub_1CDF32F04();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_1CDF2B424(&qword_1EFA5B0C8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], MEMORY[0x1E0CB11D0]);
      v14 = sub_1CDF32CDC();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_1CDF2B424((unint64_t *)&unk_1EFA5B0D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], MEMORY[0x1E0CB11D8]);
          v20 = sub_1CDF32CF4();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E8];
  }
  return result;
}

unint64_t sub_1CDF2ACF4()
{
  unint64_t result;

  result = qword_1EFA5C288[0];
  if (!qword_1EFA5C288[0])
  {
    result = MEMORY[0x1D17BBC00](&unk_1CDF39D3C, &type metadata for AppLaunchEvent.CodingKeys);
    atomic_store(result, qword_1EFA5C288);
  }
  return result;
}

uint64_t sub_1CDF2AD38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppLaunchEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t method lookup function for AppLaunchLinkTracker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppLaunchLinkTracker.lastShownDate(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AppLaunchLinkTracker.daysSinceLastShown(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AppLaunchLinkTracker.allDaysSinceLastShown()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AppLaunchLinkTracker.osUpgradeSinceLastShown(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AppLaunchLinkTracker.setLastShownDate(_:for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t *sub_1CDF2AE14(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_1CDF32A78();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_1CDF2AE9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_1CDF32A78();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *sub_1CDF2AED4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1CDF32A78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *sub_1CDF2AF30(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1CDF32A78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_QWORD *sub_1CDF2AF8C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1CDF32A78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_1CDF2AFE8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1CDF32A78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_1CDF2B044()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CDF2B050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = sub_1CDF32A78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t sub_1CDF2B090()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CDF2B09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = sub_1CDF32A78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_1CDF2B0E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CDF32A78();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AppLaunchEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1CDF2B1A4 + 4 * byte_1CDF39BC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CDF2B1D8 + 4 * byte_1CDF39BC0[v4]))();
}

uint64_t sub_1CDF2B1D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CDF2B1E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CDF2B1E8);
  return result;
}

uint64_t sub_1CDF2B1F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CDF2B1FCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CDF2B200(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CDF2B208(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchEvent.CodingKeys()
{
  return &type metadata for AppLaunchEvent.CodingKeys;
}

unint64_t sub_1CDF2B228()
{
  unint64_t result;

  result = qword_1EFA5C4A0[0];
  if (!qword_1EFA5C4A0[0])
  {
    result = MEMORY[0x1D17BBC00](&unk_1CDF39D14, &type metadata for AppLaunchEvent.CodingKeys);
    atomic_store(result, qword_1EFA5C4A0);
  }
  return result;
}

unint64_t sub_1CDF2B270()
{
  unint64_t result;

  result = qword_1EFA5C5B0;
  if (!qword_1EFA5C5B0)
  {
    result = MEMORY[0x1D17BBC00](&unk_1CDF39C84, &type metadata for AppLaunchEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFA5C5B0);
  }
  return result;
}

unint64_t sub_1CDF2B2B8()
{
  unint64_t result;

  result = qword_1EFA5C5B8[0];
  if (!qword_1EFA5C5B8[0])
  {
    result = MEMORY[0x1D17BBC00](&unk_1CDF39CAC, &type metadata for AppLaunchEvent.CodingKeys);
    atomic_store(result, qword_1EFA5C5B8);
  }
  return result;
}

uint64_t sub_1CDF2B2FC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL;
  if (v3 || (sub_1CDF32FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1CDF32FF4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1CDF2B3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFA5AD88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CDF2B424(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D17BBC00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id CERuleConfiguration.urlsConfigObject()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  void (*v9)(char *, uint64_t);
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;

  v1 = v0;
  v2 = sub_1CDF32A00();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D11660]), sel_init);
  v7 = objc_msgSend(v1, sel_actionURL);
  sub_1CDF329D0();

  v8 = (void *)sub_1CDF329C4();
  v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v5, v2);
  objc_msgSend(v6, sel_setActionURL_, v8);

  v10 = objc_msgSend(v1, sel_completedURL);
  sub_1CDF329D0();

  v11 = (void *)sub_1CDF329C4();
  v9(v5, v2);
  objc_msgSend(v6, sel_setCompletedURL_, v11);

  v12 = objc_msgSend(v1, sel_displayURL);
  sub_1CDF329D0();

  v13 = (void *)sub_1CDF329C4();
  v9(v5, v2);
  objc_msgSend(v6, sel_setDisplayURL_, v13);

  v14 = objc_msgSend(v1, sel_dismissURL);
  sub_1CDF329D0();

  v15 = (void *)sub_1CDF329C4();
  v9(v5, v2);
  objc_msgSend(v6, sel_setDismissURL_, v15);

  return v6;
}

uint64_t sub_1CDF2B640()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID + 8);
  v4 = v2;
  if (v3 == 1)
  {
    v5 = *(void **)(v0 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
    v6 = objc_allocWithZone(MEMORY[0x1E0D4E0A8]);
    v20 = 0;
    v7 = v5;
    v8 = objc_msgSend(v6, sel_initWithAccount_delegate_eventQueue_error_, v7, 0, 0, &v20);
    if (v8)
    {
      v9 = v8;
      v10 = v20;

      v11 = objc_msgSend(v9, sel_backupDeviceUUID);
      if (v11)
      {
        v12 = v11;
        v4 = sub_1CDF32D24();
        v14 = v13;

LABEL_8:
        v17 = *v1;
        v18 = v1[1];
        *v1 = v4;
        v1[1] = v14;
        swift_bridgeObjectRetain();
        sub_1CDF2E34C(v17, v18);
        goto LABEL_9;
      }

    }
    else
    {
      v15 = v20;
      v16 = (void *)sub_1CDF329A0();

      swift_willThrow();
    }
    v4 = 0;
    v14 = 0;
    goto LABEL_8;
  }
LABEL_9:
  sub_1CDF2E9C4(v2, v3);
  return v4;
}

id ICQLiftUIDataSource.__allocating_init(account:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_OWORD *)&v3[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID] = xmmword_1CDF39D90;
  *(_QWORD *)&v3[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ICQLiftUIDataSource.init(account:)(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v1[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID] = xmmword_1CDF39D90;
  *(_QWORD *)&v1[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t ICQLiftUIDataSource.request(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1CDF32B44();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CDF32B38();
  ICQLiftUIDataSource.request(for:timeZone:)(a1, (uint64_t)v7, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void ICQLiftUIDataSource.request(for:timeZone:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v5 = v3;
  v37 = a2;
  v38 = a3;
  v7 = sub_1CDF32A00();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CDF32C1C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1CDF27238();
  v34 = v12;
  v35 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v36 = a1;
  v16(v10, a1, v7);
  v17 = sub_1CDF32C10();
  v18 = sub_1CDF32E5C();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v33 = v4;
    v20 = (uint8_t *)v19;
    v31 = swift_slowAlloc();
    v40 = v31;
    v32 = v5;
    *(_DWORD *)v20 = 136315138;
    v30 = v20 + 4;
    v21 = sub_1CDF329B8();
    v39 = sub_1CDF0D64C(v21, v22, &v40);
    v5 = v32;
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    _os_log_impl(&dword_1CDEBD000, v17, v18, "Loading LiftUI for url: %s", v20, 0xCu);
    v23 = v31;
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v23, -1, -1);
    MEMORY[0x1D17BBC9C](v20, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v35);
  v24 = objc_allocWithZone(MEMORY[0x1E0CB37A8]);
  v25 = (void *)sub_1CDF329C4();
  v26 = objc_msgSend(v24, sel_initWithURL_cachePolicy_timeoutInterval_, v25, 1, 30.0);

  v27 = *(_QWORD *)(v5 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
  v28 = sub_1CDF2B640();
  sub_1CDF2BC34(v27, v28, v29);
  swift_bridgeObjectRelease();
  sub_1CDF3291C();

}

void sub_1CDF2BC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v4 = v3;
  v47 = a3;
  v42[1] = a2;
  v6 = sub_1CDF32AB4();
  v45 = *(_QWORD *)(v6 - 8);
  v46 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CDF32AD8();
  v43 = *(_QWORD *)(v9 - 8);
  v44 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1CDF32A78();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v3, sel_aa_addMultiUserDeviceHeaderIfEnabled);
  objc_msgSend(v3, sel_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_, a1, 0);
  objc_msgSend(v3, sel_aa_addClientInfoHeaders);
  objc_msgSend(v3, sel_aa_addDeviceIDHeader);
  v16 = (void *)sub_1CDF32D00();
  objc_msgSend(v3, sel_aa_addContentTypeHeaders_, v16);

  sub_1CDF32A6C();
  sub_1CDF32B20();
  v18 = v17;
  v19 = *(void (**)(char *, uint64_t))(v13 + 8);
  v19(v15, v12);
  if (v18)
  {
    v20 = (void *)sub_1CDF32D00();
    swift_bridgeObjectRelease();
    v21 = (void *)sub_1CDF32D00();
    objc_msgSend(v3, sel_setValue_forHTTPHeaderField_, v20, v21);

  }
  sub_1CDF32A6C();
  v22 = sub_1CDF32B2C();
  v19(v15, v12);
  if ((unsigned __int128)(v22 * (__int128)1000) >> 64 == (1000 * v22) >> 63)
  {
    v48 = 1000 * v22;
    sub_1CDF32FD0();
    v23 = (void *)sub_1CDF32D00();
    swift_bridgeObjectRelease();
    v24 = (void *)sub_1CDF32D00();
    objc_msgSend(v4, sel_setValue_forHTTPHeaderField_, v23, v24);

    sub_1CDF32ACC();
    sub_1CDF32AC0();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
    sub_1CDF32AA8();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v46);
    v25 = (void *)sub_1CDF32D00();
    swift_bridgeObjectRelease();
    v26 = (void *)sub_1CDF32D00();
    objc_msgSend(v4, sel_setValue_forHTTPHeaderField_, v25, v26);

    v27 = (void *)objc_opt_self();
    v28 = objc_msgSend(v27, sel_standardDateFormat_, 3);
    if (!v28)
    {
      sub_1CDF32D24();
      v28 = (id)sub_1CDF32D00();
      swift_bridgeObjectRelease();
    }
    v29 = (void *)sub_1CDF32D00();
    objc_msgSend(v4, (SEL)&selRef_setSubtitleText_, v28, v29);

    v30 = objc_msgSend(v27, sel_standardDateFormat_, 1);
    if (!v30)
    {
      sub_1CDF32D24();
      v30 = (id)sub_1CDF32D00();
      swift_bridgeObjectRelease();
    }
    v31 = (void *)sub_1CDF32D00();
    objc_msgSend(v4, (SEL)&selRef_setSubtitleText_, v30, v31);

    if (v47)
    {
      v32 = (void *)sub_1CDF32D00();
      v33 = (void *)sub_1CDF32D00();
      objc_msgSend(v4, (SEL)&selRef_setSubtitleText_, v32, v33);

    }
    v34 = objc_msgSend((id)objc_opt_self(), sel_ams_sharedAccountStore);
    v35 = objc_msgSend(v34, sel_ams_activeiTunesAccount);
    if (v35)
    {
      v36 = v35;
      v37 = objc_msgSend(v35, sel_ams_DSID);
      if (v37)
      {
        v38 = v37;
        v39 = objc_msgSend(v37, sel_stringValue);
        if (!v39)
        {
          sub_1CDF32D24();
          v39 = (id)sub_1CDF32D00();
          swift_bridgeObjectRelease();
        }
        v40 = (void *)sub_1CDF32D00();
        objc_msgSend(v4, (SEL)&selRef_setSubtitleText_, v39, v40);

        v41 = v34;
        v34 = v36;
      }
      else
      {
        v41 = v36;
      }

    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t ICQLiftUIDataSource.data(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[33] = a1;
  v2[34] = v1;
  v3 = sub_1CDF32B44();
  v2[35] = v3;
  v2[36] = *(_QWORD *)(v3 - 8);
  v2[37] = swift_task_alloc();
  v4 = sub_1CDF32928();
  v2[38] = v4;
  v2[39] = *(_QWORD *)(v4 - 8);
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v5 = sub_1CDF32C1C();
  v2[47] = v5;
  v2[48] = *(_QWORD *)(v5 - 8);
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CDF2C2E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  void (*v10)(uint64_t, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = v0[54];
  v2 = v0[47];
  v3 = v0[48];
  v4 = v0[46];
  v5 = v0[38];
  v6 = v0[39];
  v7 = v0[33];
  v8 = sub_1CDF27238();
  v0[55] = v8;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[56] = v9;
  v9(v1, v8, v2);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v0[57] = v10;
  v10(v4, v7, v5);
  v11 = sub_1CDF32C10();
  v12 = sub_1CDF32E44();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = v0[46];
    v31 = v0[47];
    v32 = v0[54];
    v14 = v0[38];
    v29 = v0[39];
    v30 = v0[48];
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v33 = v16;
    *(_DWORD *)v15 = 136315138;
    sub_1CDF2E2C8();
    v17 = sub_1CDF32FD0();
    v0[32] = sub_1CDF0D64C(v17, v18, &v33);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    v19 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v19(v13, v14);
    _os_log_impl(&dword_1CDEBD000, v11, v12, "Fetching data for LiftUI request %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v16, -1, -1);
    MEMORY[0x1D17BBC9C](v15, -1, -1);

    v20 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v20(v32, v31);
  }
  else
  {
    v21 = v0[54];
    v22 = v0[47];
    v23 = v0[48];
    v19 = *(void (**)(uint64_t, uint64_t))(v0[39] + 8);
    v19(v0[46], v0[38]);

    v20 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v20(v21, v22);
  }
  v0[58] = v20;
  v0[59] = v19;
  v24 = v0[34];
  v25 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v0[60] = v25;
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D00140]), sel_init);
  objc_msgSend(v25, sel_set_appleIDContext_, v26);

  v0[61] = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_delegate_delegateQueue_, v25, v24, 0);
  v27 = (_QWORD *)swift_task_alloc();
  v0[62] = v27;
  *v27 = v0;
  v27[1] = sub_1CDF2C5A0;
  return sub_1CDF32E38();
}

uint64_t sub_1CDF2C5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[63] = a1;
  v5[64] = a2;
  v5[65] = a3;
  v5[66] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CDF2C614()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _DWORD *v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  void *v42;
  void (*v44)(uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 504);
  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = *(id *)(v0 + 520);
    if (objc_msgSend(v2, sel_statusCode) == (id)401)
    {
      v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
      v5 = *(_QWORD *)(v0 + 360);
      v6 = *(_QWORD *)(v0 + 304);
      v7 = *(_QWORD *)(v0 + 264);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 448))(*(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 376));
      v4(v5, v7, v6);
      v8 = sub_1CDF32C10();
      v9 = sub_1CDF32E5C();
      v10 = os_log_type_enabled(v8, v9);
      v11 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
      v12 = *(_QWORD *)(v0 + 424);
      v13 = *(_QWORD *)(v0 + 376);
      v14 = *(_QWORD *)(v0 + 360);
      v15 = *(_QWORD *)(v0 + 304);
      if (v10)
      {
        v44 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
        v45 = *(_QWORD *)(v0 + 424);
        v16 = (uint8_t *)swift_slowAlloc();
        v17 = swift_slowAlloc();
        v48 = v17;
        *(_DWORD *)v16 = 136315138;
        sub_1CDF2E2C8();
        v18 = sub_1CDF32FD0();
        *(_QWORD *)(v0 + 248) = sub_1CDF0D64C(v18, v19, &v48);
        sub_1CDF32EC8();
        swift_bridgeObjectRelease();
        v44(v14, v15);
        _os_log_impl(&dword_1CDEBD000, v8, v9, "LiftUI auth failure. Renewing credentials for request %s", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17BBC9C](v17, -1, -1);
        MEMORY[0x1D17BBC9C](v16, -1, -1);

        v11(v45, v13);
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(v0 + 472))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 304));

        v11(v12, v13);
      }
      v35 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
      *(_QWORD *)(v0 + 536) = v35;
      if (!v35)
      {
        __break(1u);
        JUMPOUT(0x1CDF2CC44);
      }
      v36 = v35;
      v37 = *(_QWORD *)(*(_QWORD *)(v0 + 272) + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
      *(_QWORD *)(v0 + 544) = v37;
      *(_QWORD *)(v0 + 56) = v0 + 192;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_1CDF2CC54;
      v38 = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
      v39 = (_QWORD *)(v0 + 80);
      v39[1] = 0x40000000;
      v39[2] = sub_1CDF2DBB4;
      v39[3] = &block_descriptor_4;
      v39[4] = v38;
      objc_msgSend(v36, sel_renewCredentialsForAccount_completion_, v37, v39);
      return swift_continuation_await();
    }

  }
  v21 = *(_QWORD *)(v0 + 504);
  v20 = *(_QWORD *)(v0 + 512);
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
  v23 = *(_QWORD *)(v0 + 320);
  v24 = *(_QWORD *)(v0 + 304);
  v25 = *(_QWORD *)(v0 + 264);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 448))(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 376));
  v22(v23, v25, v24);
  sub_1CDF26E50(v21, v20);
  v26 = sub_1CDF32C10();
  v27 = sub_1CDF32E44();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (_DWORD *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    *v28 = 134218242;
    __asm { BR              X10 }
  }
  v29 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
  v30 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
  v31 = *(_QWORD *)(v0 + 392);
  v32 = *(_QWORD *)(v0 + 376);
  v33 = *(_QWORD *)(v0 + 320);
  v34 = *(_QWORD *)(v0 + 304);
  sub_1CDF26CD4(v21, v20);
  v30(v33, v34);

  v29(v31, v32);
  v40 = *(void **)(v0 + 520);
  v42 = *(void **)(v0 + 480);
  v41 = *(void **)(v0 + 488);
  objc_msgSend(v41, sel_invalidateAndCancel);

  swift_beginAccess();
  v46 = *(_QWORD *)(v0 + 176);
  v47 = *(_QWORD *)(v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v46, v47);
}

uint64_t sub_1CDF2CC54()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 552) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CDF2CCB4()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  void (*v50)(os_log_t, uint64_t);
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  NSObject *v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  void *v65;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t, uint64_t);
  void (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t, uint64_t);
  uint64_t v74;
  void (*v75)(os_log_t, uint64_t, uint64_t);
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v1 = *(_QWORD *)(v0 + 192);

  if (v1)
  {
    v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
    v3 = *(_QWORD *)(v0 + 328);
    v4 = *(_QWORD *)(v0 + 304);
    v5 = *(_QWORD *)(v0 + 264);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 448))(*(_QWORD *)(v0 + 400), *(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 376));
    v2(v3, v5, v4);
    v6 = sub_1CDF32C10();
    v7 = sub_1CDF32E50();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(void **)(v0 + 520);
    v10 = *(void **)(v0 + 488);
    v11 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
    v12 = *(_QWORD *)(v0 + 400);
    v13 = *(_QWORD *)(v0 + 376);
    v14 = *(_QWORD *)(v0 + 328);
    v15 = *(_QWORD *)(v0 + 304);
    if (v8)
    {
      v63 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
      v78 = *(void **)(v0 + 480);
      log = v6;
      v16 = (uint8_t *)swift_slowAlloc();
      v74 = v13;
      v17 = swift_slowAlloc();
      v82 = v17;
      *(_DWORD *)v16 = 136315138;
      sub_1CDF2E2C8();
      v18 = sub_1CDF32FD0();
      *(_QWORD *)(v0 + 208) = sub_1CDF0D64C(v18, v19, &v82);
      sub_1CDF32EC8();
      swift_bridgeObjectRelease();
      v63(v14, v15);
      _os_log_impl(&dword_1CDEBD000, log, v7, "Failed to renew credentials for request %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v17, -1, -1);
      MEMORY[0x1D17BBC9C](v16, -1, -1);

      v11(v12, v74);
    }
    else
    {
      v42 = *(void (**)(uint64_t, uint64_t))(v0 + 472);

      v42(v14, v15);
      v11(v12, v13);
    }
LABEL_13:
    v80 = *(_QWORD *)(v0 + 176);
    v81 = *(_QWORD *)(v0 + 184);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v80, v81);
  }
  v20 = (void *)sub_1CDF32910();
  objc_msgSend(v20, sel_mutableCopy);

  sub_1CDF32EE0();
  swift_unknownObjectRelease();
  sub_1CDF2E310();
  if (!swift_dynamicCast())
  {
    v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
    v44 = *(_QWORD *)(v0 + 336);
    v45 = *(_QWORD *)(v0 + 304);
    v46 = *(_QWORD *)(v0 + 264);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 448))(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 376));
    v43(v44, v46, v45);
    v47 = sub_1CDF32C10();
    v48 = sub_1CDF32E50();
    v49 = os_log_type_enabled(v47, v48);
    v77 = *(void **)(v0 + 520);
    v79 = *(void **)(v0 + 488);
    v73 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
    v50 = *(void (**)(os_log_t, uint64_t))(v0 + 464);
    v51 = *(NSObject **)(v0 + 408);
    v52 = *(_QWORD *)(v0 + 376);
    v53 = *(_QWORD *)(v0 + 336);
    v54 = *(_QWORD *)(v0 + 304);
    if (v49)
    {
      v65 = *(void **)(v0 + 480);
      logc = *(os_log_t *)(v0 + 408);
      v55 = (uint8_t *)swift_slowAlloc();
      v61 = v47;
      v56 = swift_slowAlloc();
      v82 = v56;
      *(_DWORD *)v55 = 136315138;
      sub_1CDF2E2C8();
      v57 = sub_1CDF32FD0();
      *(_QWORD *)(v0 + 232) = sub_1CDF0D64C(v57, v58, &v82);
      sub_1CDF32EC8();
      swift_bridgeObjectRelease();
      v73(v53, v54);
      _os_log_impl(&dword_1CDEBD000, v61, v48, "Failed to renew credentials for request %s. Unable to rerun request.", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v56, -1, -1);
      MEMORY[0x1D17BBC9C](v55, -1, -1);

      v50(logc, v52);
    }
    else
    {

      v73(v53, v54);
      v50(v51, v52);
    }
    goto LABEL_13;
  }
  v21 = *(_QWORD *)(v0 + 544);
  v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 448);
  v75 = *(void (**)(os_log_t, uint64_t, uint64_t))(v0 + 456);
  v22 = *(_QWORD *)(v0 + 416);
  v62 = *(_QWORD *)(v0 + 376);
  v64 = *(_QWORD *)(v0 + 440);
  v23 = *(_QWORD *)(v0 + 296);
  loga = *(os_log_t *)(v0 + 352);
  v70 = *(_QWORD *)(v0 + 304);
  v24 = *(_QWORD *)(v0 + 280);
  v25 = *(_QWORD *)(v0 + 288);
  v26 = *(_QWORD *)(v0 + 264);
  *(_QWORD *)(v0 + 560) = *(_QWORD *)(v0 + 224);
  v27 = sub_1CDF2B640();
  v29 = v28;
  sub_1CDF32B38();
  sub_1CDF2BC34(v21, v27, v29);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
  v71(v22, v64, v62);
  v75(loga, v26, v70);
  v30 = sub_1CDF32C10();
  v31 = sub_1CDF32E5C();
  v32 = os_log_type_enabled(v30, v31);
  v33 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
  v34 = *(_QWORD *)(v0 + 416);
  v35 = *(_QWORD *)(v0 + 376);
  v36 = *(_QWORD *)(v0 + 352);
  v37 = *(_QWORD *)(v0 + 304);
  if (v32)
  {
    v76 = *(_QWORD *)(v0 + 376);
    logb = *(os_log_t *)(v0 + 472);
    v38 = (uint8_t *)swift_slowAlloc();
    v72 = v33;
    v39 = swift_slowAlloc();
    v82 = v39;
    *(_DWORD *)v38 = 136315138;
    sub_1CDF2E2C8();
    v40 = sub_1CDF32FD0();
    *(_QWORD *)(v0 + 240) = sub_1CDF0D64C(v40, v41, &v82);
    sub_1CDF32EC8();
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, uint64_t))logb)(v36, v37);
    _os_log_impl(&dword_1CDEBD000, v30, v31, "Renewing credentials succeeded for request %s, retrying", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17BBC9C](v39, -1, -1);
    MEMORY[0x1D17BBC9C](v38, -1, -1);

    v72(v34, v76);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 472))(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 304));

    v33(v34, v35);
  }
  sub_1CDF3291C();
  v59 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 568) = v59;
  *v59 = v0;
  v59[1] = sub_1CDF2D444;
  return sub_1CDF32E38();
}

uint64_t sub_1CDF2D444(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;

  v8 = *(_QWORD **)v4;
  *(_QWORD *)(*(_QWORD *)v4 + 576) = v3;
  swift_task_dealloc();
  v9 = (void (*)(uint64_t, uint64_t))v8[59];
  v10 = v8[43];
  v11 = v8[38];
  if (v3)
  {
    v9(v10, v11);
  }
  else
  {
    v8[73] = a2;
    v8[74] = a1;
    v9(v10, v11);

  }
  return swift_task_switch();
}

uint64_t sub_1CDF2D4E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _DWORD *v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 592);
  v2 = *(_QWORD *)(v0 + 584);
  v3 = *(void **)(v0 + 560);

  sub_1CDF26CD4(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184));
  *(_QWORD *)(v0 + 176) = v1;
  *(_QWORD *)(v0 + 184) = v2;
  v4 = *(_QWORD *)(v0 + 592);
  v5 = *(_QWORD *)(v0 + 584);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
  v7 = *(_QWORD *)(v0 + 320);
  v8 = *(_QWORD *)(v0 + 304);
  v9 = *(_QWORD *)(v0 + 264);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 448))(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 376));
  v6(v7, v9, v8);
  sub_1CDF26E50(v4, v5);
  v10 = sub_1CDF32C10();
  v11 = sub_1CDF32E44();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (_DWORD *)swift_slowAlloc();
    swift_slowAlloc();
    *v12 = 134218242;
    __asm { BR              X10 }
  }
  v13 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
  v23 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
  v14 = *(_QWORD *)(v0 + 392);
  v15 = *(_QWORD *)(v0 + 376);
  v16 = *(_QWORD *)(v0 + 320);
  v17 = *(_QWORD *)(v0 + 304);
  sub_1CDF26CD4(v4, v5);
  v13(v16, v17);

  v23(v14, v15);
  v18 = *(void **)(v0 + 520);
  v20 = *(void **)(v0 + 480);
  v19 = *(void **)(v0 + 488);
  objc_msgSend(v19, sel_invalidateAndCancel);

  swift_beginAccess();
  v22 = *(_QWORD *)(v0 + 176);
  v24 = *(_QWORD *)(v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v22, v24);
}

uint64_t sub_1CDF2D88C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 488);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF2D984()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 536);
  v2 = *(void **)(v0 + 520);
  v4 = *(void **)(v0 + 480);
  v3 = *(void **)(v0 + 488);
  swift_willThrow();

  sub_1CDF26CD4(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF2DAA0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 560);
  v2 = *(void **)(v0 + 520);
  v4 = *(void **)(v0 + 480);
  v3 = *(void **)(v0 + 488);

  sub_1CDF26CD4(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CDF2DBB4(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B88);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

id ICQLiftUIDataSource.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ICQLiftUIDataSource.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ICQLiftUIDataSource.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ICQLiftUIDataSource.urlSession(_:task:willPerformHTTPRedirection:newRequest:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint8_t *v45;
  void (*v46)(char *, uint64_t, uint64_t);
  void (*v47)(char *, uint64_t);
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56[4];

  v51 = a6;
  v52 = a5;
  v53 = a4;
  v54 = sub_1CDF32928();
  v50 = *(_QWORD *)(v54 - 8);
  MEMORY[0x1E0C80A78](v54);
  v49 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE58);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CDF32B44();
  v45 = *(uint8_t **)(v10 - 8);
  v46 = (void (*)(char *, uint64_t, uint64_t))v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1CDF32C1C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v48 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v44 - v17;
  v19 = sub_1CDF27238();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v20(v18, v19, v13);
  v21 = sub_1CDF32C10();
  v22 = sub_1CDF32E5C();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1CDEBD000, v21, v22, "ICQLiftUIDataSource handling redirect, re-adding headers", v23, 2u);
    MEMORY[0x1D17BBC9C](v23, -1, -1);
  }

  v24 = *(void (**)(char *, uint64_t))(v14 + 8);
  v24(v18, v13);
  v25 = v53;
  v26 = (void *)sub_1CDF32910();
  objc_msgSend(v26, sel_mutableCopy);

  sub_1CDF32EE0();
  swift_unknownObjectRelease();
  sub_1CDF2E310();
  if (swift_dynamicCast())
  {
    v27 = (void *)v55;
    v28 = *(_QWORD *)((char *)v47 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
    v29 = sub_1CDF2B640();
    v31 = v30;
    sub_1CDF32B38();
    sub_1CDF2BC34(v28, v29, v31);
    swift_bridgeObjectRelease();
    (*((void (**)(char *, void (*)(char *, uint64_t, uint64_t)))v45 + 1))(v12, v46);
    sub_1CDF3291C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56))(v9, 0, 1, v54);
    v52(v9);

  }
  else
  {
    v47 = v24;
    v32 = v48;
    v20(v48, v19, v13);
    v33 = v49;
    v34 = v50;
    v35 = v54;
    v46 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
    v46(v49, v25, v54);
    v36 = sub_1CDF32C10();
    v37 = sub_1CDF32E50();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v56[0] = v39;
      *(_DWORD *)v38 = 136315138;
      v45 = v38 + 4;
      sub_1CDF2E2C8();
      v40 = sub_1CDF32FD0();
      v55 = sub_1CDF0D64C(v40, v41, v56);
      v35 = v54;
      sub_1CDF32EC8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v49, v35);
      _os_log_impl(&dword_1CDEBD000, v36, v37, "Failed to copy %s. Skipping adding headers", v38, 0xCu);
      swift_arrayDestroy();
      v42 = v39;
      v25 = v53;
      MEMORY[0x1D17BBC9C](v42, -1, -1);
      MEMORY[0x1D17BBC9C](v38, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v35);
    }

    v47(v32, v13);
    v46(v9, v25, v35);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v9, 0, 1, v35);
    v52(v9);
  }
  return sub_1CDF2E360((uint64_t)v9);
}

unint64_t sub_1CDF2E2C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFA5B0F8;
  if (!qword_1EFA5B0F8)
  {
    v1 = sub_1CDF32928();
    result = MEMORY[0x1D17BBC00](MEMORY[0x1E0CADF70], v1);
    atomic_store(result, (unint64_t *)&qword_1EFA5B0F8);
  }
  return result;
}

unint64_t sub_1CDF2E310()
{
  unint64_t result;

  result = qword_1EFA5B100;
  if (!qword_1EFA5B100)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFA5B100);
  }
  return result;
}

uint64_t sub_1CDF2E34C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1CDF2E360(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ICQLiftUIDataSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for ICQLiftUIDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ICQLiftUIDataSource.__allocating_init(account:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1CDF2E3D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  char *v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68[4];

  v64 = a3;
  v65 = a1;
  v57 = a2;
  v66 = sub_1CDF32928();
  v63 = *(_QWORD *)(v66 - 8);
  MEMORY[0x1E0C80A78](v66);
  v62 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE58);
  v5 = MEMORY[0x1E0C80A78](v4);
  v59 = (uint64_t)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v60 = (char *)&v54 - v8;
  v9 = MEMORY[0x1E0C80A78](v7);
  v58 = (uint64_t *)((char *)&v54 - v10);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v54 - v11;
  v13 = sub_1CDF32B44();
  v55 = *(_QWORD *)(v13 - 8);
  v56 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1CDF32C1C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x1E0C80A78](v16);
  v61 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v54 - v20;
  v22 = sub_1CDF27238();
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v23(v21, v22, v16);
  v24 = sub_1CDF32C10();
  v25 = sub_1CDF32E5C();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_1CDEBD000, v24, v25, "ICQLiftUIDataSource handling redirect, re-adding headers", v26, 2u);
    MEMORY[0x1D17BBC9C](v26, -1, -1);
  }

  v27 = *(void (**)(char *, uint64_t))(v17 + 8);
  v27(v21, v16);
  v28 = v65;
  v29 = (void *)sub_1CDF32910();
  objc_msgSend(v29, sel_mutableCopy);

  sub_1CDF32EE0();
  swift_unknownObjectRelease();
  sub_1CDF2E310();
  if (swift_dynamicCast())
  {
    v30 = (void *)v67;
    v31 = *(_QWORD *)(v57 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
    v32 = sub_1CDF2B640();
    v34 = v33;
    sub_1CDF32B38();
    sub_1CDF2BC34(v31, v32, v34);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v15, v56);
    sub_1CDF3291C();
    v35 = v63;
    v36 = v66;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v63 + 56))(v12, 0, 1, v66);
    v37 = (void (*)(_QWORD, _QWORD, _QWORD))v58;
    sub_1CDF2E97C((uint64_t)v12, (uint64_t)v58);
    if ((*(unsigned int (**)(_QWORD, uint64_t, uint64_t))(v35 + 48))(v37, 1, v36) == 1)
    {
      v38 = 0;
    }
    else
    {
      v38 = (void *)sub_1CDF32910();
      (*(void (**)(void (*)(_QWORD, _QWORD, _QWORD), uint64_t))(v35 + 8))(v37, v36);
    }
    (*(void (**)(uint64_t, void *))(v64 + 16))(v64, v38);

  }
  else
  {
    v39 = v61;
    v23(v61, v22, v16);
    v41 = v62;
    v40 = v63;
    v42 = v66;
    v58 = *(_QWORD **)(v63 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v58)(v62, v28, v66);
    v43 = sub_1CDF32C10();
    v44 = sub_1CDF32E50();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v68[0] = v46;
      *(_DWORD *)v45 = 136315138;
      sub_1CDF2E2C8();
      v47 = sub_1CDF32FD0();
      v67 = sub_1CDF0D64C(v47, v48, v68);
      v42 = v66;
      sub_1CDF32EC8();
      swift_bridgeObjectRelease();
      v49 = v40;
      v50 = *(void (**)(char *, uint64_t))(v40 + 8);
      v50(v62, v42);
      _os_log_impl(&dword_1CDEBD000, v43, v44, "Failed to copy %s. Skipping adding headers", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17BBC9C](v46, -1, -1);
      MEMORY[0x1D17BBC9C](v45, -1, -1);

      v51 = v61;
    }
    else
    {
      v49 = v40;
      v50 = *(void (**)(char *, uint64_t))(v40 + 8);
      v50(v41, v42);

      v51 = v39;
    }
    v27(v51, v16);
    v12 = v60;
    ((void (*)(char *, uint64_t, uint64_t))v58)(v60, v65, v42);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v12, 0, 1, v42);
    v52 = v59;
    sub_1CDF2E97C((uint64_t)v12, v59);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v52, 1, v42) == 1)
    {
      v38 = 0;
    }
    else
    {
      v38 = (void *)sub_1CDF32910();
      v50((char *)v52, v42);
    }
    (*(void (**)(uint64_t, void *))(v64 + 16))(v64, v38);
  }

  return sub_1CDF2E360((uint64_t)v12);
}

uint64_t sub_1CDF2E97C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5AE58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CDF2E9C4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1CDF2E9D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = _s13OptionalErrorOMa(0, a1, a3, a4);
  MEMORY[0x1D17BBC00](&unk_1CDF39E4C, v4);
  return swift_allocError();
}

uint64_t _s13OptionalErrorOMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s13OptionalErrorOMn);
}

uint64_t sub_1CDF2EA2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v6, v8, a2);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v6, v9);
  v13 = _s13OptionalErrorOMa(0, v9, v11, v12);
  MEMORY[0x1D17BBC00](&unk_1CDF39E4C, v13);
  swift_allocError();
  return swift_willThrow();
}

void sub_1CDF2EB28()
{
  JUMPOUT(0x1D17BBC00);
}

uint64_t sub_1CDF2EB38()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1CDF2EB40(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1CDF2EB80 + 4 * byte_1CDF39DD8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CDF2EBA0 + 4 * byte_1CDF39DDD[v4]))();
}

_BYTE *sub_1CDF2EB80(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CDF2EBA0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CDF2EBA8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CDF2EBB0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CDF2EBB8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CDF2EBC0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1CDF2EBCC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B270);
  return sub_1CDF32C40();
}

uint64_t StorageSummaryModel.storageSummary.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CDF32C70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1CDF2EC80@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CDF32C70();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1CDF2ECFC(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  swift_retain();
  return sub_1CDF32C7C();
}

uint64_t StorageSummaryModel.storageSummary.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1CDF32C7C();
}

uint64_t (*StorageSummaryModel.storageSummary.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1CDF32C64();
  return sub_1CDF0BD00;
}

uint64_t StorageSummaryModel.$storageSummary.getter()
{
  return sub_1CDF0C568((uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary, &qword_1EFA5B278);
}

uint64_t sub_1CDF2EE68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CDF2F1E4(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary, &qword_1EFA5B278);
}

uint64_t sub_1CDF2EE7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CDF2F26C(a1, a2, a3, a4, &qword_1EFA5B280, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary, &qword_1EFA5B278);
}

uint64_t StorageSummaryModel.$storageSummary.setter(uint64_t a1)
{
  return sub_1CDF0C5E8(a1, &qword_1EFA5B280, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary, &qword_1EFA5B278);
}

uint64_t (*StorageSummaryModel.$storageSummary.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B280);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B278);
  sub_1CDF32C4C();
  swift_endAccess();
  return sub_1CDF0BEB8;
}

uint64_t StorageSummaryModel.didError.getter()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CDF32C70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1CDF2EFEC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CDF32C70();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1CDF2F068()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1CDF32C7C();
}

uint64_t StorageSummaryModel.didError.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1CDF32C7C();
}

uint64_t (*StorageSummaryModel.didError.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1CDF32C64();
  return sub_1CDF0BD00;
}

uint64_t StorageSummaryModel.$didError.getter()
{
  return sub_1CDF0C568((uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError, &qword_1EFA5A510);
}

uint64_t sub_1CDF2F1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CDF2F1E4(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError, &qword_1EFA5A510);
}

uint64_t sub_1CDF2F1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_1CDF32C4C();
  return swift_endAccess();
}

uint64_t sub_1CDF2F250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CDF2F26C(a1, a2, a3, a4, &qword_1EFA5A518, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError, &qword_1EFA5A510);
}

uint64_t sub_1CDF2F26C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_1CDF32C58();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t StorageSummaryModel.$didError.setter(uint64_t a1)
{
  return sub_1CDF0C5E8(a1, &qword_1EFA5A518, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError, &qword_1EFA5A510);
}

uint64_t (*StorageSummaryModel.$didError.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A518);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A510);
  sub_1CDF32C4C();
  swift_endAccess();
  return sub_1CDF0BEB8;
}

id StorageSummaryModel.account.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel_account);
}

id sub_1CDF2F478()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel____lazy_storage___dataController;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel____lazy_storage___dataController);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel____lazy_storage___dataController);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)ICQCloudStorageDataController), sel_initWithAccount_, *(_QWORD *)(v0 + OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel_account));
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

char *StorageSummaryModel.__allocating_init(account:)(void *a1)
{
  char *v2;

  swift_allocObject();
  v2 = sub_1CDF2FAA4(a1);

  return v2;
}

char *StorageSummaryModel.init(account:)(void *a1)
{
  char *v2;

  v2 = sub_1CDF2FAA4(a1);

  return v2;
}

char *StorageSummaryModel.deinit()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v1 = v0;
  type metadata accessor for DarwinRegistrar();
  sub_1CDF16F98(v0);
  v2 = &v0[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B278);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = &v1[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A510);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  return v1;
}

uint64_t StorageSummaryModel.__deallocating_deinit()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v1 = v0;
  type metadata accessor for DarwinRegistrar();
  sub_1CDF16F98(v0);
  v2 = &v0[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B278);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = &v1[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A510);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  return swift_deallocClassInstance();
}

Swift::Void __swiftcall StorageSummaryModel.fetchCloudStorageSummary(shouldIgnoreCache:)(Swift::Bool shouldIgnoreCache)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v6[0]) = 0;
  swift_retain();
  sub_1CDF32C7C();
  v2 = sub_1CDF2F478();
  objc_msgSend(v2, sel_setShouldIgnoreCache_, shouldIgnoreCache, v6[0]);

  v3 = sub_1CDF2F478();
  v4 = swift_allocObject();
  swift_weakInit();
  v6[4] = sub_1CDF2FCCC;
  v6[5] = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1CDF0CE8C;
  v6[3] = &block_descriptor_5;
  v5 = _Block_copy(v6);
  swift_release();
  objc_msgSend(v3, sel_fetchStorageSummaryWithCompletion_, v5);
  _Block_release(v5);

}

uint64_t sub_1CDF2F804(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v6 = sub_1CDF32C94();
  v19 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1CDF32CAC();
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CDF0E874(0, &qword_1EFA5A700);
  v12 = (void *)sub_1CDF32E68();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a1;
  v13[4] = a3;
  aBlock[4] = sub_1CDF2FFB8;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CDF0CE60;
  aBlock[3] = &block_descriptor_12;
  v14 = _Block_copy(aBlock);
  v15 = a2;
  v16 = a1;
  swift_retain();
  swift_release();
  sub_1CDF32CA0();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1CDF0EA74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A710);
  sub_1CDF0EABC();
  sub_1CDF32EEC();
  MEMORY[0x1D17BB144](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

void *sub_1CDF2FA04(void *result, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;

  if (a2)
  {
    v7 = result;
    v8 = a3;
    v9 = a5;
    swift_retain();
    StorageSummaryModel.fetchCloudStorageSummary(shouldIgnoreCache:)(1);

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1CDF2FA70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1CDF32C34();
  *a1 = result;
  return result;
}

uint64_t sub_1CDF2FA98()
{
  return _s11iCloudQuota19StorageSummaryModelC2eeoiySbAC_ACtFZ_0();
}

char *sub_1CDF2FAA4(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  id v22;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5A510);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B278);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = &v2[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary];
  v22 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B270);
  sub_1CDF32C40();
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v13 = &v2[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError];
  LOBYTE(v22) = 0;
  sub_1CDF32C40();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  *(_QWORD *)&v2[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel____lazy_storage___dataController] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel_account] = a1;
  v14 = a1;
  v15 = sub_1CDF2F478();
  v16 = objc_msgSend(v15, sel_cachedStorageSummary);

  swift_getKeyPath();
  swift_getKeyPath();
  v22 = v16;
  swift_retain();
  sub_1CDF32C7C();
  type metadata accessor for DarwinRegistrar();
  v17 = (uint64_t *)sub_1CDF16D30();
  v18 = *v17;
  v19 = v17[1];
  swift_bridgeObjectRetain();
  sub_1CDF16D58(v2, v18, v19, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_1CDF2FA04);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1CDF2FCA8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CDF2FCCC(void *a1, void *a2)
{
  uint64_t v2;

  return sub_1CDF2F804(a1, a2, v2);
}

uint64_t _s11iCloudQuota19StorageSummaryModelC2eeoiySbAC_ACtFZ_0()
{
  id v0;
  char v1;
  char v2;
  void *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CDF32C70();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CDF32C70();
  swift_release();
  swift_release();
  if (v4
    && (sub_1CDF0E874(0, &qword_1EFA5B348),
        v0 = v4,
        v1 = sub_1CDF32E98(),
        v0,
        v0,
        v4,
        (v1 & 1) == 0))
  {
    v2 = 0;
  }
  else
  {
    sub_1CDF0E874(0, (unint64_t *)&qword_1EFA5A6E8);
    v2 = sub_1CDF32E98();
  }
  return v2 & 1;
}

uint64_t sub_1CDF2FE34()
{
  return type metadata accessor for StorageSummaryModel();
}

uint64_t type metadata accessor for StorageSummaryModel()
{
  uint64_t result;

  result = qword_1EFA5C980;
  if (!qword_1EFA5C980)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1CDF2FE78()
{
  unint64_t v0;
  unint64_t v1;

  sub_1CDF2FF2C();
  if (v0 <= 0x3F)
  {
    sub_1CDF0E774();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for StorageSummaryModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StorageSummaryModel.__allocating_init(account:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_1CDF2FF2C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EFA5B2B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFA5B270);
    v0 = sub_1CDF32C88();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EFA5B2B0);
  }
}

uint64_t sub_1CDF2FF84()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CDF2FFB8()
{
  uint64_t v0;
  void *v1;
  BOOL v2;
  uint64_t result;
  id v4;

  v1 = *(void **)(v0 + 24);
  if (*(_QWORD *)(v0 + 16))
    v2 = 1;
  else
    v2 = v1 == 0;
  if (v2)
  {
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (!result)
      return result;
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_1CDF32C7C();
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v4 = v1;
    return sub_1CDF32C7C();
  }
  return result;
}

void _ICQAlertSpecificationForServerDict_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_DEBUG, "no alertInfo provided", v1, 2u);
}

void _ICQActionForString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_ERROR, "_ICQActionFromString - illegal action %@", (uint8_t *)&v2, 0xCu);
}

void ICQUsedDiskSpaceForVolume_cold_1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "UInt64 ICQUsedDiskSpaceForVolume(NSString *__strong _Nonnull)";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_ERROR, "Error in %s: %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_0_0();
}

uint64_t __getINDaemonConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[ICQLink dynamicUIRouteURL].cold.1(v0);
}

void ___handlePushReceivedDarwinNotification_block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_5(&dword_1CDEBD000, a2, a3, "darwin notification %@ is not handled", (uint8_t *)&v4);
  OUTLINED_FUNCTION_0_0();
}

uint64_t __getCKContainerClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[ICQNetworkThrottleController requestShouldThrottle:].cold.1(v0);
}

uint64_t __getPLPhotoLibraryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPLGatekeeperClientClass_block_invoke_cold_1(v0);
}

uint64_t __getPLGatekeeperClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[_ICQXMLSpecification stringForPlaceholder:withDeviceInfo:].cold.1(v0);
}

void _ICQServerDictionaryForBundleIdentifier_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_6(&dword_1CDEBD000, a2, a3, "appId array: %@", (uint8_t *)&v3);
}

uint64_t sub_1CDF32910()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1CDF3291C()
{
  return MEMORY[0x1E0CADF08]();
}

uint64_t sub_1CDF32928()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1CDF32934()
{
  return MEMORY[0x1E0CAE9C8]();
}

uint64_t sub_1CDF32940()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1CDF3294C()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1CDF32958()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1CDF32964()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1CDF32970()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_1CDF3297C()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_1CDF32988()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_1CDF32994()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1CDF329A0()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1CDF329AC()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1CDF329B8()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1CDF329C4()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1CDF329D0()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1CDF329DC()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1CDF329E8()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1CDF329F4()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1CDF32A00()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1CDF32A0C()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1CDF32A18()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1CDF32A24()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1CDF32A30()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1CDF32A3C()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1CDF32A48()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1CDF32A54()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1CDF32A60()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1CDF32A6C()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1CDF32A78()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1CDF32A84()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1CDF32A90()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1CDF32A9C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1CDF32AA8()
{
  return MEMORY[0x1E0CB0B38]();
}

uint64_t sub_1CDF32AB4()
{
  return MEMORY[0x1E0CB0B48]();
}

uint64_t sub_1CDF32AC0()
{
  return MEMORY[0x1E0CB0B78]();
}

uint64_t sub_1CDF32ACC()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1CDF32AD8()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1CDF32AE4()
{
  return MEMORY[0x1E0CB0FB0]();
}

uint64_t sub_1CDF32AF0()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1CDF32AFC()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1CDF32B08()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1CDF32B14()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1CDF32B20()
{
  return MEMORY[0x1E0CB1418]();
}

uint64_t sub_1CDF32B2C()
{
  return MEMORY[0x1E0CB1430]();
}

uint64_t sub_1CDF32B38()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t sub_1CDF32B44()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1CDF32B50()
{
  return MEMORY[0x1E0CF0F70]();
}

uint64_t sub_1CDF32B5C()
{
  return MEMORY[0x1E0CF0F88]();
}

uint64_t sub_1CDF32B68()
{
  return MEMORY[0x1E0CF0F90]();
}

uint64_t sub_1CDF32B74()
{
  return MEMORY[0x1E0D11628]();
}

uint64_t sub_1CDF32B80()
{
  return MEMORY[0x1E0D11630]();
}

uint64_t sub_1CDF32B8C()
{
  return MEMORY[0x1E0D11638]();
}

uint64_t sub_1CDF32B98()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1CDF32BA4()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1CDF32BB0()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1CDF32BBC()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1CDF32BC8()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1CDF32BD4()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1CDF32BE0()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1CDF32BEC()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1CDF32BF8()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1CDF32C04()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1CDF32C10()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1CDF32C1C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1CDF32C28()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1CDF32C34()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1CDF32C40()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1CDF32C4C()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1CDF32C58()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1CDF32C64()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1CDF32C70()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1CDF32C7C()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1CDF32C88()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1CDF32C94()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CDF32CA0()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CDF32CAC()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CDF32CB8()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CDF32CC4()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1CDF32CD0()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1CDF32CDC()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1CDF32CE8()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1CDF32CF4()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CDF32D00()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CDF32D0C()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1CDF32D18()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1CDF32D24()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CDF32D30()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CDF32D3C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CDF32D48()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1CDF32D54()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1CDF32D60()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1CDF32D6C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CDF32D78()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CDF32D84()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1CDF32D90()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CDF32D9C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1CDF32DA8()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1CDF32DB4()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1CDF32DC0()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1CDF32DCC()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1CDF32DD8()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1CDF32DE4()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1CDF32DF0()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1CDF32DFC()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1CDF32E08()
{
  return MEMORY[0x1E0DF0890]();
}

uint64_t sub_1CDF32E14()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t sub_1CDF32E20()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1CDF32E2C()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1CDF32E38()
{
  return MEMORY[0x1E0CB1D70]();
}

uint64_t sub_1CDF32E44()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1CDF32E50()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CDF32E5C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CDF32E68()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1CDF32E74()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1CDF32E80()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1CDF32E8C()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1CDF32E98()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CDF32EA4()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1CDF32EB0()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1CDF32EBC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1CDF32EC8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CDF32ED4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CDF32EE0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CDF32EEC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CDF32EF8()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1CDF32F04()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1CDF32F10()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CDF32F1C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CDF32F28()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1CDF32F34()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CDF32F40()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CDF32F4C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CDF32F58()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CDF32F64()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CDF32F70()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CDF32F7C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CDF32F88()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1CDF32F94()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1CDF32FA0()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1CDF32FAC()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1CDF32FB8()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1CDF32FC4()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1CDF32FD0()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CDF32FDC()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1CDF32FE8()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1CDF32FF4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CDF33000()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1CDF3300C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CDF33018()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1CDF33024()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1CDF33030()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1CDF3303C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1CDF33048()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CDF33054()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CDF33060()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1CDF3306C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1CDF33078()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1CDF33084()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1CDF33090()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return MEMORY[0x1E0D09B58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PLCPLIsExceedingPrimarySyncQuota()
{
  return MEMORY[0x1E0D71C98]();
}

uint64_t PLRequestCloudPhotoLibraryTransferProgressForLibrary()
{
  return MEMORY[0x1E0D72508]();
}

uint64_t PLRequestSizeOfOriginalResourcesForLibrary()
{
  return MEMORY[0x1E0D72510]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1E0DF0F68]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x1E0DF0F70]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x1E0DF0F80]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}


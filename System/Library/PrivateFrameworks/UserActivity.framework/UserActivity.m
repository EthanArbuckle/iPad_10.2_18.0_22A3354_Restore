void sub_1AF7ED0D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1AF7ED7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF7ED920(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AF7ED97C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AF7EDC80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7EDF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF7EE890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AF7EEF24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7EF040(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id getUAUserActivityToNSUserActivityMap(void)
{
  if (getUAUserActivityToNSUserActivityMap(void)::sOnce != -1)
    dispatch_once(&getUAUserActivityToNSUserActivityMap(void)::sOnce, &__block_literal_global_751);
  return (id)getUAUserActivityToNSUserActivityMap(void)::sResult;
}

id biomeInfoLogging()
{
  if (biomeInfoLogging::sOnce != -1)
    dispatch_once(&biomeInfoLogging::sOnce, &__block_literal_global_7);
  return (id)biomeInfoLogging::sLog;
}

uint64_t recurse(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t (**v8)(id, void *);
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v5;
  v8 = (uint64_t (**)(id, void *))v4;
  v24 = v7;
  if ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(v7, "addObject:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v6;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v10, "allKeys");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v26;
        LOBYTE(v9) = 1;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v9 & 1) != 0 && v8[2](v8, v15))
              v9 = v8[2](v8, v16);
            else
              v9 = 0;

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v12);
        goto LABEL_41;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v11 = v6;
        v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v26;
          LOBYTE(v9) = 1;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v26 != v18)
                objc_enumerationMutation(v11);
              if ((v9 & 1) != 0)
                v9 = v8[2](v8, *(void **)(*((_QWORD *)&v25 + 1) + 8 * j));
              else
                v9 = 0;
            }
            v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v17);
          goto LABEL_41;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = v8[2](v8, v6);
          goto LABEL_42;
        }
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v11 = v6;
        v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v26;
          LOBYTE(v9) = 1;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v26 != v21)
                objc_enumerationMutation(v11);
              if ((v9 & 1) != 0)
                v9 = v8[2](v8, *(void **)(*((_QWORD *)&v25 + 1) + 8 * k));
              else
                v9 = 0;
            }
            v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v20);
          goto LABEL_41;
        }
      }
    }
    v9 = 1;
LABEL_41:

    goto LABEL_42;
  }
  v9 = 1;
LABEL_42:

  return v9;
}

void sub_1AF7EF494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

uint64_t ___Z21acceptableForUserInfoP12NSDictionary_block_invoke(uint64_t a1, void *a2)
{
  objc_object *v2;
  objc_object *v3;
  uint64_t v4;

  v2 = a2;
  v3 = v2;
  if (v2)
    v4 = objectIsOfAcceptableClassForUserInfo(v2);
  else
    v4 = 0;

  return v4;
}

void sub_1AF7EF590(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t objectIsOfAcceptableClassForUserInfo(objc_object *a1)
{
  objc_object *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t j;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[11];

  v16[10] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&objectIsOfAcceptableClassForUserInfo(objc_object *)::sLock);
  v2 = (void *)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses;
  if (!objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses)
  {
    objc_opt_class();
    v16[0] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16[1] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16[2] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16[3] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16[4] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16[5] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16[6] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16[7] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16[8] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16[9] = objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", v16, 10);
    v4 = (void *)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses;
    objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses = v3;

    for (i = 9; i != -1; --i)
    v2 = (void *)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses;
  }
  if ((objc_msgSend(v2, "containsObject:", objc_opt_class()) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = (id)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses;
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (j = 0; j != v6; ++j)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v7);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend((id)objectIsOfAcceptableClassForUserInfo(objc_object *)::sAcceptableClasses, "addObject:", objc_opt_class(), v11);
            v6 = 1;
            goto LABEL_17;
          }
        }
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_17:

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&objectIsOfAcceptableClassForUserInfo(objc_object *)::sLock);

  return v6;
}

void sub_1AF7EF844(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL ___ZL25dictionaryContainsFileURLP12NSDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "isFileURL");

  }
  v5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;

  return v5;
}

void sub_1AF7EF930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF7EF9D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1AF7EFAE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _uaGetLogForCategory(void *a1)
{
  __CFString *v1;
  char *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  os_log_t v8;
  id v9;

  v1 = a1;
  if (!v1)
  {
    v2 = getenv("_UALOGGINGCATEGORY");
    if (!v2
      || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v2, 4),
          (v1 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v1 = CFSTR("main");
    }
  }
  if (pthread_mutex_lock(&_uaGetLogForCategory::sLock))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)_uaGetLogForCategory::sLogs;
    if (!_uaGetLogForCategory::sLogs)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)_uaGetLogForCategory::sLogs;
      _uaGetLogForCategory::sLogs = v5;

      v4 = (void *)_uaGetLogForCategory::sLogs;
    }
    objc_msgSend(v4, "objectForKey:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v7 = objc_retainAutorelease(v1);
      v8 = os_log_create("com.apple.useractivity", (const char *)-[__CFString cStringUsingEncoding:](v7, "cStringUsingEncoding:", 4));
      if (v8)
      {
        v3 = v8;
        objc_msgSend((id)_uaGetLogForCategory::sLogs, "setValue:forKey:", v8, v7);
      }
      else
      {
        v3 = (void *)MEMORY[0x1E0C81028];
        v9 = MEMORY[0x1E0C81028];
      }
    }
    pthread_mutex_unlock(&_uaGetLogForCategory::sLock);
  }

  return v3;
}

void sub_1AF7EFD74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF7F034C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7F0684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1AF7F077C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7F0C40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id stringFromEnvWithDefault(const char *a1, void *a2)
{
  id v3;
  char *v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = getenv(a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v4, 4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _uaGetLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_DEBUG, "Using service name %{public}@ for %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

id _LSGetUserActivityClientResponseProtocolInterface()
{
  if (_LSGetUserActivityClientResponseProtocolInterface_once != -1)
    dispatch_once(&_LSGetUserActivityClientResponseProtocolInterface_once, &__block_literal_global_107);
  return (id)_LSGetUserActivityClientResponseProtocolInterface_result;
}

id _LSGetUserActivityClientProtocolInterface()
{
  if (_LSGetUserActivityClientProtocolInterface_once != -1)
    dispatch_once(&_LSGetUserActivityClientProtocolInterface_once, &__block_literal_global_3);
  return (id)_LSGetUserActivityClientProtocolInterface_result;
}

id UActivityCreationXPCServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYCREATION", CFSTR("com.apple.coreservices.lsuseractivitymanager.xpc"));
}

void sub_1AF7F1258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AF7F12DC()
{
  JUMPOUT(0x1AF7F12C4);
}

void sub_1AF7F1458(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7F1580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t __validType_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = validType(a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

void sub_1AF7F169C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7F1828(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

id getUserActivityObserversCopy()
{
  id v0;
  void *v1;

  v0 = (id)getUserActivityObservers(BOOL)::sResult;
  objc_sync_enter(v0);
  v1 = (void *)objc_msgSend(v0, "copy");
  objc_sync_exit(v0);

  return v1;
}

void sub_1AF7F1C30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void encodeString(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a1;
  v5 = a2;
  v6 = a3;
  if (v8 && v5 && v6)
  {
    if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
    {
      encodeObject(v8, v5, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        encodeObject(v8, v5, v6);

    }
  }

}

void encodeObjectOfType(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a1;
  v7 = a2;
  v8 = a4;
  if (v9 && v7 && v8 && (!a3 || (objc_opt_isKindOfClass() & 1) != 0))
    encodeObject(v9, v7, v8);

}

uint64_t encodeObject(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (v5 && v6 && v7)
  {
    objc_msgSend(v5, "encodeObject:forKey:", v6, v7);
    v9 = 1;
  }

  return v9;
}

void sub_1AF7F258C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void encodeURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  if (a1 && a2)
  {
    if (a3)
    {
      v5 = a3;
      v6 = a1;
      objc_msgSend(a2, "absoluteURL");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      encodeObject(v6, v7, v5);

    }
  }
}

void sub_1AF7F271C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void encodeSet(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a1;
  v5 = a2;
  v6 = a3;
  if (validType(v5))
    encodeObject(v7, v5, v6);

}

uint64_t validType(void *a1)
{
  id v1;
  char v2;
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v1 = a1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v2 = 1;
LABEL_10:
      *((_BYTE *)v12 + 24) = v2;
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = MEMORY[0x1E0C809B0];
      v5 = &unk_1E60072C0;
      v6 = __validType_block_invoke;
      v7 = &v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8[0] = MEMORY[0x1E0C809B0];
          v8[1] = 3221225472;
          v8[2] = __validType_block_invoke_3;
          v8[3] = &unk_1E6007298;
          v8[4] = &v11;
          objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v8);
          goto LABEL_11;
        }
        v2 = 0;
        goto LABEL_10;
      }
      v9 = MEMORY[0x1E0C809B0];
      v5 = &unk_1E60072E8;
      v6 = __validType_block_invoke_2;
      v7 = &v9;
    }
    v7[1] = 3221225472;
    v7[2] = (uint64_t)v6;
    v7[3] = (uint64_t)v5;
    v7[4] = (uint64_t)&v11;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:");
  }
LABEL_11:
  v3 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v3;
}

void sub_1AF7F2AB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void encodeDictionary(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v5)
  {
    if (v6)
    {
      if (v7)
      {
        v9 = v6;
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 0;
        v15 = objc_msgSend(v9, "count") == 0;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __validDictionaryTypes_block_invoke;
        v11[3] = &unk_1E6007298;
        v11[4] = &v12;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);
        v10 = *((unsigned __int8 *)v13 + 24);
        _Block_object_dispose(&v12, 8);

        if (v10)
          objc_msgSend(v5, "encodeObject:forKey:", v9, v8);
      }
    }
  }

}

void sub_1AF7F2BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF7F32D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1AF7F3514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1AF7F38BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

BOOL differ(objc_object *a1, objc_object *a2)
{
  objc_object *v3;
  objc_object *v4;
  objc_object *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = v3 != v4 && (!v3 || !v4 || (-[objc_object isEqual:](v3, "isEqual:", v4) & 1) == 0);

  return v6;
}

void sub_1AF7F39C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF7F3A34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7F3B58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1AF7F3BC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1AF7F42C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,id a21,id a22)
{
  void *v22;

  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  objc_destroyWeak(&a22);

  _Unwind_Resume(a1);
}

objc_object *deepMutableCopyOnce(objc_object *a1, NSMutableDictionary *a2)
{
  objc_object *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;
  objc_object *v7;
  objc_object *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  objc_object *v13;
  void *v14;
  objc_object *v15;
  void *v16;
  BOOL v17;
  objc_object *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  objc_object *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    v8 = 0;
    goto LABEL_38;
  }
  -[NSMutableDictionary objectForKey:](v4, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](v5, "objectForKey:", v3);
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v8 = v7;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_object *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v8, v3);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[objc_object allKeys](v3, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v9);
          v13 = *(objc_object **)(*((_QWORD *)&v37 + 1) + 8 * i);
          deepMutableCopyOnce(v13, v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_object objectForKey:](v3, "objectForKey:", v13);
          v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
          deepMutableCopyOnce(v15, v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            v17 = v16 == 0;
          else
            v17 = 1;
          if (!v17)
            -[objc_object setObject:forKey:](v8, "setObject:forKey:", v16, v14);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v10);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (objc_object *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v8, v3);
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v18 = v3;
      v19 = -[objc_object countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(v18);
            deepMutableCopyOnce(*(objc_object **)(*((_QWORD *)&v33 + 1) + 8 * j), v5);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[objc_object addObject:](v8, "addObject:", v22);

          }
          v19 = -[objc_object countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v19);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (objc_object *)-[objc_object copy](v3, "copy");
        else
          v7 = v3;
        goto LABEL_4;
      }
      v8 = (objc_object *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v8, v3);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v23 = v3;
      v24 = -[objc_object countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v30;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v30 != v25)
              objc_enumerationMutation(v23);
            deepMutableCopyOnce(*(objc_object **)(*((_QWORD *)&v29 + 1) + 8 * k), v5);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[objc_object addObject:](v8, "addObject:", v27, (_QWORD)v29);

          }
          v24 = -[objc_object countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        }
        while (v24);
      }

    }
  }
LABEL_38:

  return v8;
}

void sub_1AF7F4828(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id uaUserActivityObjectsMap(void)
{
  if (uaUserActivityObjectsMap(void)::sOnce != -1)
    dispatch_once(&uaUserActivityObjectsMap(void)::sOnce, &__block_literal_global_743);
  return (id)uaUserActivityObjectsMap(void)::sResult;
}

__CFString *trimmedString(void *a1, unsigned int a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "length");
    if (v5 <= a2)
    {
      v9 = v4;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "substringWithRange:", 0, a2 >> 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "substringWithRange:", v5 - (a2 >> 1), a2 >> 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@..(%ld)..%@"), v7, v5 - a2, v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = &stru_1E60084E8;
  }

  return v9;
}

void sub_1AF7F4A28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__CFString *suggestedActionTypeString(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 0xA && ((0x217u >> v1) & 1) != 0)
  {
    v2 = off_1E60077F8[v1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UASuggestedActionType=%ld"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void sub_1AF7F4C58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7F4DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

id stringRemovingNewlines(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  v2 = v1;
  if (objc_msgSend(v1, "containsString:", CFSTR("\n")))
  {
    v3 = (void *)objc_msgSend(v1, "mutableCopy");
    do
      v4 = objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), &stru_1E60084E8, 0, 0, objc_msgSend(v3, "length"));
    while (v4
          + objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("  "), CFSTR(" "), 0, 0, objc_msgSend(v3, "length")));
    v2 = (void *)objc_msgSend(v3, "copy");

  }
  return v2;
}

void sub_1AF7F4F04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id deepMutableCopy(objc_object *a1)
{
  objc_object *v1;
  NSMutableDictionary *v2;
  void *v3;

  v1 = a1;
  v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  deepMutableCopyOnce(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1AF7F4F84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void encodeData(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = a2;
  v8 = a1;
  v7 = objc_opt_class();
  encodeObjectOfType(v8, v6, v7, v5);

}

void sub_1AF7F5120(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;

  if (a2 == 1)
  {
    v17 = objc_begin_catch(a1);
    _uaGetLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a9) = 138543618;
      *(_QWORD *)((char *)&a9 + 4) = v20;
      WORD6(a9) = 2114;
      *(_QWORD *)((char *)&a9 + 14) = v17;
      _os_log_impl(&dword_1AF7EB000, v18, OS_LOG_TYPE_INFO, "failed to encode contentAttributeSet of activity %{public}@ with exception %{public}@", (uint8_t *)&a9, 0x16u);

    }
    ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD))v12)[2](v12, v11, 0, 0, 0);

    objc_end_catch();
    JUMPOUT(0x1AF7F50D8);
  }

  _Unwind_Resume(a1);
}

Class initSFPeerDevice()
{
  Class result;

  if (LoadSharing_loadPredicate != -1)
    dispatch_once(&LoadSharing_loadPredicate, &__block_literal_global_402);
  result = objc_getClass("SFPeerDevice");
  classSFPeerDevice = (uint64_t)result;
  getSFPeerDeviceClass = (uint64_t (*)())SFPeerDeviceFunction;
  return result;
}

Class initSFPeerDevice_0()
{
  Class result;

  if (LoadSharing_loadPredicate_0 != -1)
    dispatch_once(&LoadSharing_loadPredicate_0, &__block_literal_global_114);
  result = objc_getClass("SFPeerDevice");
  classSFPeerDevice_0 = (uint64_t)result;
  getSFPeerDeviceClass_0 = (uint64_t (*)())SFPeerDeviceFunction_0;
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void ___ZL24getUserActivityObserversb_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)getUserActivityObservers(BOOL)::sResult;
  getUserActivityObservers(BOOL)::sResult = (uint64_t)v0;

}

void sub_1AF7F5820(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7F5B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1AF7F5E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1AF7F6618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,id a60)
{
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;

  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose((const void *)(v65 - 160), 8);

  _Unwind_Resume(a1);
}

void sub_1AF7F6880(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF7F6F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

id trimmedHexStringForData(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  unint64_t v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v18;
  id v20;
  uint64_t v21;

  v20 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("$"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_retainAutorelease(v20);
  v21 = objc_msgSend(v4, "bytes");
  v5 = objc_msgSend(v4, "length");
  v6 = v5;
  if (a2 >= 0)
    v7 = a2;
  else
    v7 = a2 + 1;
  v8 = v7 >> 1;
  if (v5 >= a2)
    v9 = v8;
  else
    v9 = v5;
  if (v9)
  {
    v10 = (unsigned __int8 *)v21;
    v11 = v9;
    do
    {
      v12 = *v10++;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c"), a0123456789abcd[(unint64_t)v12 >> 4], a0123456789abcd[v12 & 0xF]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v13);

      --v11;
    }
    while (v11);
  }
  if (v6 > v9)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(".. %ld .."), v6);
    if (v6 - v9 < v6)
    {
      v14 = -(uint64_t)v9;
      v15 = v21 + v6;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c"), a0123456789abcd[(unint64_t)*(unsigned __int8 *)(v15 + v14) >> 4], a0123456789abcd[*(_BYTE *)(v15 + v14) & 0xF]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v16);

      }
      while (!__CFADD__(v14++, 1));
    }
  }
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

void sub_1AF7F724C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

CFDataRef UAMessagePack::CopyPacked(void *a1, uint64_t a2, void *a3, void *a4)
{
  objc_object *v7;
  const UInt8 *v8;
  CFIndex v9;
  CFDataRef v10;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v7 = a1;
  UAMessagePack::UAMessagePack((uint64_t)&v12, a2, a3, a4);
  if (v7 && UAMessagePack::writeObject((UAMessagePack *)&v12, v7))
  {
    v8 = (const UInt8 *)objc_msgSend(v13, "bytes");
    v9 = objc_msgSend(v13, "length");
    v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1AF7F7354(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t UAMessagePack::writeObject(UAMessagePack *this, objc_object *a2)
{
  objc_object *v3;
  uint64_t v4;
  NSNumber *v5;
  NSNumber *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  objc_object *v14;
  objc_object *v15;
  char v16;
  NSNumber *v17;
  const char *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  NSNumber *v26;
  NSNumber *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  size_t v31;
  objc_object *v32;
  char *v33;
  objc_object *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  size_t size[2];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *((_QWORD *)this + 6);
  if (v4 && (*(unsigned int (**)(uint64_t, objc_object *, _QWORD))(v4 + 16))(v4, v3, *(_QWORD *)this))
  {
    v5 = (NSNumber *)(*(uint64_t (**)(void))(*((_QWORD *)this + 7) + 16))();

  }
  else
  {
    v5 = (NSNumber *)v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cmp_write_array((uint64_t)this + 16, -[NSNumber count](v5, "count"));
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v6 = v5;
    v7 = -[NSNumber countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v6);
          if ((UAMessagePack::writeObject(this, *(objc_object **)(*((_QWORD *)&v44 + 1) + 8 * i)) & 1) == 0)
          {

            goto LABEL_31;
          }
        }
        v7 = -[NSNumber countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        if (v7)
          continue;
        break;
      }
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cmp_write_map((uint64_t)this + 16, -[NSNumber count](v5, "count"));
    -[NSNumber keyEnumerator](v5, "keyEnumerator");
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v41;
      while (2)
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v10);
          v14 = *(objc_object **)(*((_QWORD *)&v40 + 1) + 8 * j);
          if ((UAMessagePack::writeObject(this, v14) & 1) != 0)
          {
            -[NSNumber objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v14);
            v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
            v16 = UAMessagePack::writeObject(this, v15);

            if ((v16 & 1) != 0)
              continue;
          }

          goto LABEL_31;
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v11)
          continue;
        break;
      }
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_retainAutorelease(v5);
    v18 = (const char *)-[NSNumber UTF8String](v17, "UTF8String");
    v19 = (uint64_t)v18;
    if (v18)
    {
      v20 = strlen(v18);
      cmp_write_str((uint64_t)this + 16, v19, v20);
    }
    else
    {
      size[0] = 0;
      v22 = -[NSNumber length](v17, "length");
      v23 = -[NSNumber getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v17, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, 0, size, 4, 0, 0, v22, 0);
      if (size[0] >= 0x7FFFFFFF)
        v23 = 0;
      if (v23 == 1)
      {
        v24 = malloc_type_malloc(size[0], 0xF0642784uLL);
        if (v24)
        {
          if (-[NSNumber getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v17, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v24, size[0], 0, 4, 0, 0, v22, 0))cmp_write_str((uint64_t)this + 16, (uint64_t)v24, size[0]);
          free(v24);
        }
      }
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    UAMessagePack::writeNumber(this, v5);
LABEL_44:
    v21 = 1;
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cmp_write_nil((uint64_t)this + 16);
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = objc_retainAutorelease(v5);
    cmp_write_bin((uint64_t)this + 16, -[NSNumber bytes](v26, "bytes"), -[NSNumber length](v26, "length"));
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cmp_write_ext((uint64_t)this + 16, 2, 0, 0);
    cmp_write_array((uint64_t)this + 16, -[NSNumber count](v5, "count"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v5;
    v28 = -[NSNumber countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v37;
      while (2)
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(v27);
          if ((UAMessagePack::writeObject(this, *(objc_object **)(*((_QWORD *)&v36 + 1) + 8 * k)) & 1) == 0)
          {

            goto LABEL_31;
          }
        }
        v28 = -[NSNumber countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
        if (v28)
          continue;
        break;
      }
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSNumber timeIntervalSinceReferenceDate](v5, "timeIntervalSinceReferenceDate");
    size[0] = v31;
    cmp_write_ext((uint64_t)this + 16, 3, 8u, (uint64_t)size);
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    size[0] = 0;
    size[1] = 0;
    -[NSNumber getUUIDBytes:](v5, "getUUIDBytes:", size);
    cmp_write_ext((uint64_t)this + 16, 1, 0x10u, (uint64_t)size);
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSNumber baseURL](v5, "baseURL");
    v32 = (objc_object *)objc_claimAutoreleasedReturnValue();
    v33 = (char *)this + 16;
    if (v32)
    {
      cmp_write_ext((uint64_t)v33, 4, 0, 0);
      if (!UAMessagePack::writeObject(this, v32))
      {
        v21 = 0;
        goto LABEL_70;
      }
      -[NSNumber relativeString](v5, "relativeString");
      v34 = (objc_object *)objc_claimAutoreleasedReturnValue();
      v35 = UAMessagePack::writeObject(this, v34);
    }
    else
    {
      cmp_write_ext((uint64_t)v33, 5, 0, 0);
      -[NSNumber absoluteString](v5, "absoluteString");
      v34 = (objc_object *)objc_claimAutoreleasedReturnValue();
      v35 = UAMessagePack::writeObject(this, v34);
    }
    v21 = v35;

LABEL_70:
    goto LABEL_45;
  }
LABEL_31:
  v21 = 0;
LABEL_45:

  return v21;
}

void sub_1AF7F7A44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t cmp_write_str(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  if (a3 <= 0x1F)
    return cmp_write_fixstr(a1, a2, a3);
  if (a3 > 0xFF)
  {
    if (HIWORD(a3))
    {
      result = cmp_write_str32_marker(a1, a3);
      if (!(_DWORD)result)
        return result;
    }
    else
    {
      result = cmp_write_str16_marker(a1, (unsigned __int16)a3);
      if (!(_DWORD)result)
        return result;
    }
  }
  else
  {
    result = cmp_write_str8_marker(a1, a3);
    if (!(_DWORD)result)
      return result;
  }
  result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a2, a3);
  if (result)
    return 1;
  *(_BYTE *)a1 = 10;
  return result;
}

uint64_t cmp_write_fixstr(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  char v7;
  char v8;

  if (a3 > 0x1F)
  {
    v7 = 5;
  }
  else
  {
    v8 = a3 | 0xA0;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1) == 1)
    {
      if ((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a2, a3))
        return 1;
      v7 = 10;
    }
    else
    {
      v7 = 6;
    }
  }
  result = 0;
  *(_BYTE *)a1 = v7;
  return result;
}

uint64_t UAMessagePack::mp_writer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 8), "appendBytes:length:", a2, a3);
  return a3;
}

uint64_t cmp_write_str8_marker(uint64_t a1, char a2)
{
  uint64_t v3;
  char v4;
  char v6;
  char v7;

  v6 = a2;
  v7 = -39;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    v4 = 8;
    goto LABEL_5;
  }
  v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    v4 = 15;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t UAMessagePack::writeNumber(UAMessagePack *this, NSNumber *a2)
{
  NSNumber *v3;
  CFNumberType Type;
  float v5;
  double v6;

  v3 = objc_retainAutorelease(a2);
  if (!strcmp((const char *)-[NSNumber objCType](v3, "objCType"), "B"))
  {
    cmp_write_BOOL((uint64_t)this + 16, -[NSNumber BOOLValue](v3, "BOOLValue"));
    goto LABEL_11;
  }
  Type = CFNumberGetType((CFNumberRef)v3);
  if ((unint64_t)Type <= kCFNumberCGFloatType)
  {
    if (((1 << Type) & 0x11020) != 0)
    {
      -[NSNumber floatValue](v3, "floatValue");
      cmp_write_float((uint64_t)this + 16, v5);
      goto LABEL_11;
    }
    if (((1 << Type) & 0x2040) != 0)
    {
      -[NSNumber doubleValue](v3, "doubleValue");
      cmp_write_double((uint64_t)this + 16, v6);
      goto LABEL_11;
    }
  }
  if (-[NSNumber compare:](v3, "compare:", &unk_1E60144E0) < 0)
    cmp_write_sint((uint64_t)this + 16, -[NSNumber longLongValue](v3, "longLongValue"));
  else
    cmp_write_uint((uint64_t)this + 16, -[NSNumber unsignedLongLongValue](v3, "unsignedLongLongValue"));
LABEL_11:

  return 1;
}

void sub_1AF7F7E08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t cmp_write_map(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  char v5;

  if (a2 > 0xF)
  {
    if (HIWORD(a2))
      return cmp_write_map32(a1, a2);
    else
      return cmp_write_map16(a1, (unsigned __int16)a2);
  }
  else
  {
    v5 = a2 | 0x80;
    v3 = 1;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
    {
      v3 = 0;
      *(_BYTE *)a1 = 6;
    }
    return v3;
  }
}

void sub_1AF7F80E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AF7F82A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7F8B98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SFPeerDeviceFunction()
{
  return (id)classSFPeerDevice;
}

id SFPeerDeviceFunction_0()
{
  return (id)classSFPeerDevice_0;
}

void sub_1AF7F8CF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t UAMessagePack::UAMessagePack(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  __int16 v10;
  char v11;
  char v12;

  v7 = a3;
  v8 = a4;
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  *(_QWORD *)(a1 + 48) = _Block_copy(v7);
  *(_QWORD *)(a1 + 56) = _Block_copy(v8);
  v10 = 20557;
  v11 = cmp_version();
  v12 = cmp_mp_version();
  objc_msgSend(*(id *)(a1 + 8), "appendBytes:length:", &v10, 4);
  cmp_init(a1 + 16, a1, (uint64_t)UAMessagePack::mp_reader, (uint64_t)UAMessagePack::mp_writer);

  return a1;
}

void sub_1AF7F8E00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t cmp_init(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 0;
  *(_QWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t cmp_version()
{
  return 3;
}

uint64_t cmp_mp_version()
{
  return 5;
}

BOOL cmp_write_uint(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  char v5;

  if (a2 > 0x7F)
  {
    if (a2 > 0xFF)
    {
      if (a2 >> 16)
      {
        if (HIDWORD(a2))
          return cmp_write_u64(a1, a2);
        else
          return cmp_write_u32(a1, a2);
      }
      else
      {
        return cmp_write_u16(a1, (unsigned __int16)a2);
      }
    }
    else
    {
      return cmp_write_u8(a1, a2);
    }
  }
  else
  {
    v5 = a2;
    v3 = 1;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
    {
      v3 = 0;
      *(_BYTE *)a1 = 6;
    }
    return v3;
  }
}

uint64_t cmp_write_array(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  char v5;

  if (a2 > 0xF)
  {
    if (HIWORD(a2))
      return cmp_write_array32(a1, a2);
    else
      return cmp_write_array16(a1, (unsigned __int16)a2);
  }
  else
  {
    v5 = a2 | 0x90;
    v3 = 1;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
    {
      v3 = 0;
      *(_BYTE *)a1 = 6;
    }
    return v3;
  }
}

void sub_1AF7F90D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL cmp_write_u32(uint64_t a1, unsigned int a2)
{
  _BOOL8 result;
  unsigned int v5;
  char v6;

  v6 = -50;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    v5 = bswap32(a2);
    return (*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v5, 4) != 0;
  }
  else
  {
    result = 0;
    *(_BYTE *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_u16(uint64_t a1, unsigned int a2)
{
  _BOOL8 result;
  __int16 v5;
  char v6;

  v6 = -51;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    v5 = __rev16(a2);
    return (*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v5, 2) != 0;
  }
  else
  {
    result = 0;
    *(_BYTE *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_double(uint64_t a1, double a2)
{
  _BOOL8 result;
  unint64_t v5;
  char v6;

  v6 = -53;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    v5 = bswap64(*(unint64_t *)&a2);
    return (*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(a1 + 24))(a1, &v5, 8) != 0;
  }
  else
  {
    result = 0;
    *(_BYTE *)a1 = 8;
  }
  return result;
}

uint64_t ___Z22setIndexPendingForUUIDbP6NSUUID_block_invoke(uint64_t a1)
{
  int v2;
  BOOL v3;
  id v4;
  void *v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
    v3 = sIndexPendingUUIDs == 0;
  else
    v3 = 0;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = (void *)sIndexPendingUUIDs;
    sIndexPendingUUIDs = (uint64_t)v4;

    v2 = *(unsigned __int8 *)(a1 + 40);
  }
  result = sIndexPendingUUIDs;
  if (v2)
    return objc_msgSend((id)sIndexPendingUUIDs, "addObject:", *(_QWORD *)(a1 + 32));
  if (sIndexPendingUUIDs)
  {
    if (*(_QWORD *)(a1 + 32))
      return objc_msgSend((id)sIndexPendingUUIDs, "removeObject:");
  }
  return result;
}

void ___ZL36getUAUserActivityToNSUserActivityMapv_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 0);
  v1 = (void *)getUAUserActivityToNSUserActivityMap(void)::sResult;
  getUAUserActivityToNSUserActivityMap(void)::sResult = v0;

}

void ___ZL24uaUserActivityObjectsMapv_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)uaUserActivityObjectsMap(void)::sResult;
  uaUserActivityObjectsMap(void)::sResult = v0;

}

void ___ZL20getIndexPendingQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("indexPendingQ", 0);
  v1 = (void *)getIndexPendingQueue(void)::sIndexPendingQueue;
  getIndexPendingQueue(void)::sIndexPendingQueue = (uint64_t)v0;

}

void sub_1AF7F9D5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id UAMessageUnpack::readArray(UAMessageUnpack *this, unsigned int a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a2 >= 0x3E8)
    v4 = 1000;
  else
    v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v6 = a2;
    while (1)
    {
      UAMessageUnpack::readFromContext(this);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        break;
      objc_msgSend(v5, "addObject:", v7);

      if (!--v6)
        goto LABEL_8;
    }
    v8 = 0;
  }
  else
  {
LABEL_8:
    v8 = v5;
  }

  return v8;
}

void sub_1AF7F9E04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id UAMessageUnpack::readDictionary(UAMessageUnpack *this, unsigned int a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (a2 >= 0x3E8)
    v4 = 1000;
  else
    v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v6 = a2;
    while (1)
    {
      UAMessageUnpack::readFromContext(this);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        break;
      UAMessageUnpack::readFromContext(this);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

        break;
      }
      objc_msgSend(v5, "setObject:forKey:", v8, v7);

      if (!--v6)
        goto LABEL_9;
    }
    v9 = 0;
  }
  else
  {
LABEL_9:
    v9 = (void *)objc_msgSend(v5, "copy");
  }

  return v9;
}

void sub_1AF7F9EE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *UAMessageUnpack::readFromContext(UAMessageUnpack *this)
{
  _opaque_pthread_t *v2;
  _BYTE *stackaddr_np;
  double v4;
  objc_object *v5;
  void *v6;
  __CFString *result;
  uint64_t v8;
  void *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  id v11;
  objc_object *v12;
  void *v13;
  objc_object *v14;
  void *v15;
  objc_object *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  objc_object *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_object *v25;
  objc_object *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  objc_object *v33;
  objc_class *v34;
  objc_object *v35;
  void *v36;
  objc_object *v37;
  void *v38;
  objc_object *v39;
  void *v40;
  objc_object *v41;
  void *v42;
  objc_object *v43;
  void *v44;
  objc_object *v45;
  void *v46;
  objc_object *v47;
  void *v48;
  objc_object *v49;
  void *v50;
  objc_object *v51;
  void *v52;
  objc_object *v53;
  void *v54;
  objc_object *v55;
  void *v56;
  void *v57;
  _BYTE v58[8];
  unsigned int v59[2];
  double v60[3];

  v60[2] = *(double *)MEMORY[0x1E0C80C00];
  v2 = pthread_self();
  stackaddr_np = pthread_get_stackaddr_np(v2);
  if (stackaddr_np - v58 <= pthread_get_stacksize_np(v2) - 1024
    && *(_BYTE *)this
    && cmp_read_object((uint64_t)this + 8, (uint64_t)v58))
  {
    switch(v58[0])
    {
      case 0:
      case 0xE:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", LOBYTE(v59[0]));
        v37 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v38;
      case 1:
      case 0x20:
      case 0x21:
        UAMessageUnpack::readDictionary(this, v59[0]);
        v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v15;
      case 2:
      case 0x1E:
      case 0x1F:
        UAMessageUnpack::readArray(this, v59[0]);
        v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v17;
      case 3:
      case 0x1B:
      case 0x1C:
      case 0x1D:
        v8 = v59[0];
        if (!v59[0])
          return &stru_1E60084E8;
        if (*((_QWORD *)this + 6) - *((_QWORD *)this + 7) < (unint64_t)v59[0])
          goto LABEL_21;
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v59[0]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)this + 3);
        v11 = objc_retainAutorelease(v9);
        v10((char *)this + 8, objc_msgSend(v11, "mutableBytes"), v8);
        v12 = (objc_object *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
        UAMessageUnpack::substitute(this, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v13;
      case 4:
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      case 5:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", LOBYTE(v59[0]));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      case 6:
      case 7:
      case 8:
        v18 = v59[0];
        if (v59[0])
        {
          if (*((_QWORD *)this + 6) - *((_QWORD *)this + 7) < (unint64_t)v59[0])
            goto LABEL_21;
          objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v59[0]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)this + 3);
          v21 = objc_retainAutorelease(v19);
          v20((char *)this + 8, -[objc_object mutableBytes](v21, "mutableBytes"), v18);
          UAMessageUnpack::substitute(this, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          result = v22;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
          result = v36;
        }
        break;
      case 9:
      case 0xA:
      case 0xB:
      case 0x16:
      case 0x17:
      case 0x18:
      case 0x19:
      case 0x1A:
        switch(LOBYTE(v59[0]))
        {
          case 1:
            if (v59[1] != 16)
              goto LABEL_21;
            v60[0] = 0.0;
            v60[1] = 0.0;
            (*((void (**)(char *, double *, uint64_t))this + 3))((char *)this + 8, v60, 16);
            v5 = (objc_object *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v60);
            UAMessageUnpack::substitute(this, v5);
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            return (__CFString *)v6;
          case 2:
            v23 = (objc_class *)objc_opt_class();
            UAMessageUnpack::readFromContextOfClass(this, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
              v25 = (objc_object *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = 0;
            }
            UAMessageUnpack::substitute(this, v25);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            return (__CFString *)v57;
          case 3:
            if (v59[1] != 8)
              goto LABEL_21;
            v60[0] = 0.0;
            (*((void (**)(char *, double *, uint64_t))this + 3))((char *)this + 8, v60, 8);
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v60[0]);
            v26 = (objc_object *)objc_claimAutoreleasedReturnValue();
            UAMessageUnpack::substitute(this, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            return (__CFString *)v27;
          case 4:
            v29 = (objc_class *)objc_opt_class();
            UAMessageUnpack::readFromContextOfClass(this, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30
              && (v31 = (objc_class *)objc_opt_class(),
                  UAMessageUnpack::readFromContextOfClass(this, v31),
                  (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v32, v30);
              v33 = (objc_object *)objc_claimAutoreleasedReturnValue();
              UAMessageUnpack::substitute(this, v33);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v28 = 0;
            }
            goto LABEL_44;
          case 5:
            v34 = (objc_class *)objc_opt_class();
            UAMessageUnpack::readFromContextOfClass(this, v34);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v30);
              v35 = (objc_object *)objc_claimAutoreleasedReturnValue();
              UAMessageUnpack::substitute(this, v35);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v28 = 0;
            }
LABEL_44:

            break;
          default:
            goto LABEL_21;
        }
        return (__CFString *)v28;
      case 0xC:
        LODWORD(v4) = v59[0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
        v39 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v40;
      case 0xD:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)v59);
        v41 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v42;
      case 0xF:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", LOWORD(v59[0]));
        v43 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v44;
      case 0x10:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v59[0]);
        v45 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v46;
      case 0x11:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)v59);
        v47 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v48;
      case 0x12:
      case 0x22:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", SLOBYTE(v59[0]));
        v49 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v50;
      case 0x13:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", SLOWORD(v59[0]));
        v51 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v52;
      case 0x14:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v59[0]);
        v53 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v54;
      case 0x15:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)v59);
        v55 = (objc_object *)objc_claimAutoreleasedReturnValue();
        UAMessageUnpack::substitute(this, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        return (__CFString *)v56;
      default:
        goto LABEL_21;
    }
  }
  else
  {
LABEL_21:
    v28 = 0;
    return (__CFString *)v28;
  }
  return result;
}

void sub_1AF7FA620(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t cmp_read_object(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4;
  uint64_t v5;
  char v6;
  int v8;
  char v9;
  unsigned int *v10;
  unsigned int v11;
  char v12;
  char v13;
  char v14;
  unint64_t *v15;
  unsigned int v16;
  char v17;
  char v18;
  _WORD *v19;
  unsigned int v20;
  char v21;
  unsigned __int16 v22;
  char v23;
  unsigned __int8 v24;
  char v25;
  unsigned __int8 v26;

  v26 = 0;
  if (((*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 16))(a1, &v26, 1) & 1) == 0)
  {
    v5 = 0;
    v6 = 7;
    goto LABEL_7;
  }
  v4 = v26;
  if (((char)v26 & 0x80000000) == 0)
  {
    *(_BYTE *)a2 = 0;
LABEL_4:
    *(_BYTE *)(a2 + 8) = v4;
    return 1;
  }
  if (v26 <= 0x8Fu)
  {
    v5 = 1;
    *(_BYTE *)a2 = 1;
    *(_DWORD *)(a2 + 8) = v4 & 0xF;
    return v5;
  }
  if (v26 > 0x9Fu)
  {
    if (v26 <= 0xBFu)
    {
      *(_BYTE *)a2 = 3;
      v8 = v4 & 0x1F;
      goto LABEL_15;
    }
    switch(v26)
    {
      case 0xC0u:
        v9 = 4;
        goto LABEL_21;
      case 0xC2u:
        v9 = 5;
LABEL_21:
        *(_BYTE *)a2 = v9;
        *(_BYTE *)(a2 + 8) = 0;
        return 1;
      case 0xC3u:
        *(_BYTE *)a2 = 5;
        v5 = 1;
        *(_BYTE *)(a2 + 8) = 1;
        return v5;
      case 0xC4u:
        *(_BYTE *)a2 = 6;
        v10 = (unsigned int *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 1) & 1) != 0)
          goto LABEL_56;
        goto LABEL_28;
      case 0xC5u:
        *(_BYTE *)a2 = 7;
        v10 = (unsigned int *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 2) & 1) != 0)
          goto LABEL_78;
        goto LABEL_28;
      case 0xC6u:
        *(_BYTE *)a2 = 8;
        v10 = (unsigned int *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 4) & 1) != 0)
          goto LABEL_75;
LABEL_28:
        v5 = 0;
        v6 = 14;
        break;
      case 0xC7u:
        v25 = 0;
        v24 = 0;
        *(_BYTE *)a2 = 9;
        if (!(*(unsigned int (**)(uint64_t, char *, uint64_t))(a1 + 16))(a1, &v25, 1))
          goto LABEL_61;
        if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 16))(a1, &v24, 1))
          goto LABEL_82;
        *(_BYTE *)(a2 + 8) = v25;
        v11 = v24;
        goto LABEL_71;
      case 0xC8u:
        v23 = 0;
        v22 = 0;
        *(_BYTE *)a2 = 10;
        if ((*(unsigned int (**)(uint64_t, char *, uint64_t))(a1 + 16))(a1, &v23, 1))
        {
          if ((*(unsigned int (**)(uint64_t, unsigned __int16 *, uint64_t))(a1 + 16))(a1, &v22, 2))
          {
            *(_BYTE *)(a2 + 8) = v23;
            v11 = bswap32(v22) >> 16;
            goto LABEL_71;
          }
LABEL_82:
          v6 = 14;
        }
        else
        {
LABEL_61:
          v6 = 11;
        }
        v5 = 0;
        break;
      case 0xC9u:
        v21 = 0;
        v20 = 0;
        v18 = 11;
        *(_BYTE *)a2 = 11;
        if (!(*(unsigned int (**)(uint64_t, char *, uint64_t))(a1 + 16))(a1, &v21, 1))
          goto LABEL_85;
        if ((*(unsigned int (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, &v20, 4))
        {
          *(_BYTE *)(a2 + 8) = v21;
          v11 = bswap32(v20);
          goto LABEL_71;
        }
        v18 = 14;
LABEL_85:
        v5 = 0;
        *(_BYTE *)a1 = v18;
        return v5;
      case 0xCAu:
        v12 = 12;
        goto LABEL_74;
      case 0xCBu:
        v13 = 13;
        goto LABEL_45;
      case 0xCCu:
        *(_BYTE *)a2 = 14;
        v5 = 1;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0)
          goto LABEL_80;
        return v5;
      case 0xCDu:
        v14 = 15;
        goto LABEL_66;
      case 0xCEu:
        v12 = 16;
        goto LABEL_74;
      case 0xCFu:
        v13 = 17;
        goto LABEL_45;
      case 0xD0u:
        *(_BYTE *)a2 = 18;
        v5 = 1;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0)
          goto LABEL_80;
        return v5;
      case 0xD1u:
        v14 = 19;
LABEL_66:
        *(_BYTE *)a2 = v14;
        v19 = (_WORD *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, _WORD *, uint64_t))(a1 + 16))(a1, v19, 2) & 1) == 0)
          goto LABEL_80;
        *v19 = bswap32((unsigned __int16)*v19) >> 16;
        return 1;
      case 0xD2u:
        v12 = 20;
        goto LABEL_74;
      case 0xD3u:
        v13 = 21;
LABEL_45:
        *(_BYTE *)a2 = v13;
        v15 = (unint64_t *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(a1 + 16))(a1, v15, 8) & 1) == 0)
          goto LABEL_80;
        *v15 = bswap64(*v15);
        return 1;
      case 0xD4u:
        *(_BYTE *)a2 = 22;
        v5 = 1;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0)
          goto LABEL_72;
        *(_DWORD *)(a2 + 12) = 1;
        return v5;
      case 0xD5u:
        *(_BYTE *)a2 = 23;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0)
          goto LABEL_72;
        v11 = 2;
        goto LABEL_71;
      case 0xD6u:
        *(_BYTE *)a2 = 24;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0)
          goto LABEL_72;
        v11 = 4;
        goto LABEL_71;
      case 0xD7u:
        *(_BYTE *)a2 = 25;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0)
          goto LABEL_72;
        v11 = 8;
        goto LABEL_71;
      case 0xD8u:
        *(_BYTE *)a2 = 26;
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a2 + 8, 1) & 1) == 0)
        {
LABEL_72:
          v5 = 0;
          v6 = 11;
          break;
        }
        v11 = 16;
LABEL_71:
        *(_DWORD *)(a2 + 12) = v11;
        return 1;
      case 0xD9u:
        *(_BYTE *)a2 = 27;
        v10 = (unsigned int *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 1) & 1) == 0)
          goto LABEL_80;
LABEL_56:
        v16 = *(unsigned __int8 *)v10;
        goto LABEL_79;
      case 0xDAu:
        v17 = 28;
        goto LABEL_77;
      case 0xDBu:
        v12 = 29;
        goto LABEL_74;
      case 0xDCu:
        v17 = 30;
        goto LABEL_77;
      case 0xDDu:
        v12 = 31;
        goto LABEL_74;
      case 0xDEu:
        v17 = 32;
LABEL_77:
        *(_BYTE *)a2 = v17;
        v10 = (unsigned int *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 2) & 1) == 0)
          goto LABEL_80;
LABEL_78:
        v16 = bswap32(*(unsigned __int16 *)v10) >> 16;
        goto LABEL_79;
      case 0xDFu:
        v12 = 33;
LABEL_74:
        *(_BYTE *)a2 = v12;
        v10 = (unsigned int *)(a2 + 8);
        if (((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 16))(a1, v10, 4) & 1) == 0)
        {
LABEL_80:
          v5 = 0;
          v6 = 9;
          break;
        }
LABEL_75:
        v16 = bswap32(*v10);
LABEL_79:
        *v10 = v16;
        return 1;
      default:
        if (v26 >= 0xE0u)
        {
          *(_BYTE *)a2 = 34;
          goto LABEL_4;
        }
        v5 = 0;
        v6 = 13;
        break;
    }
LABEL_7:
    *(_BYTE *)a1 = v6;
    return v5;
  }
  *(_BYTE *)a2 = 2;
  v8 = v4 & 0xF;
LABEL_15:
  *(_DWORD *)(a2 + 8) = v8;
  return 1;
}

BOOL UAMessageUnpack::mp_reader(uint64_t a1, void *__dst, size_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(a1 + 8);
  v4 = v3[7];
  if (v3[6] - v4 < a3)
    return 0;
  memcpy(__dst, (const void *)(v3[5] + v4), a3);
  v3[7] += a3;
  return a3 != 0;
}

id UAMessageUnpack::substitute(UAMessageUnpack *this, objc_object *a2)
{
  objc_object *v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  v4 = *((_QWORD *)this + 9);
  v5 = v3;
  if (v4)
  {
    v5 = v3;
    if ((*(unsigned int (**)(uint64_t, objc_object *, _QWORD))(v4 + 16))(v4, v3, *((_QWORD *)this + 8)))
    {
      (*(void (**)(void))(*((_QWORD *)this + 10) + 16))();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

void sub_1AF7FAD74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AF7FAF0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7FB038(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ___ZL11LoadSynapsev_block_invoke()
{
  LoadSynapse(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Synapse.framework/Synapse", 2);
  if (!LoadSynapse(void)::frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/Synapse.framework/Synapse"));
}

void sub_1AF7FB648(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7FB854(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1AF7FBA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AF7FBCDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7FBDF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF7FBFA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AF7FC100(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v2);
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

char *serializedCFType(void *a1)
{
  id v1;
  CFDataRef Data;
  char *v3;

  v1 = a1;
  if (v1)
  {
    Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v1, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    if ((unint64_t)-[__CFData length](Data, "length") > 0xFFFFFFFE)
    {
      v3 = 0;
    }
    else
    {
      v3 = (char *)malloc_type_malloc(-[__CFData length](Data, "length") + 200, 0x7A065B7EuLL);
      *(_DWORD *)v3 = 1;
      *((_DWORD *)v3 + 1) = -[__CFData length](Data, "length");
      bzero(v3 + 8, 0x40uLL);
      bzero(v3 + 72, 0x40uLL);
      bzero(v3 + 136, 0x40uLL);
      strlcpy(v3 + 136, "UAUserActivity", 0x40uLL);
      memcpy(v3 + 200, (const void *)-[__CFData bytes](objc_retainAutorelease(Data), "bytes"), *((unsigned int *)v3 + 1));
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1AF7FC23C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF7FC354(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AF7FC64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  a9.super_class = (Class)UAUserActivity;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AF7FC75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AF7FC878(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7FCA70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AF7FD030(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void setIndexPendingForUUID(char a1, NSUUID *a2)
{
  NSUUID *v3;
  NSObject *v4;
  NSUUID *v5;
  _QWORD block[4];
  NSUUID *v7;
  char v8;

  v3 = a2;
  getIndexPendingQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___Z22setIndexPendingForUUIDbP6NSUUID_block_invoke;
  block[3] = &unk_1E6006A50;
  v8 = a1;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

id getIndexPendingQueue(void)
{
  if (getIndexPendingQueue(void)::sIndexPendingOnce != -1)
    dispatch_once(&getIndexPendingQueue(void)::sIndexPendingOnce, &__block_literal_global_752);
  return (id)getIndexPendingQueue(void)::sIndexPendingQueue;
}

void sub_1AF7FD2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF7FDA14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF7FDBD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1AF7FDDC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AF7FE2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1AF7FE380(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7FE458(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sortedArrayOfNSStringValues(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        if (*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v5))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v8 = v1;
            goto LABEL_12;
          }
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }

  v6 = (void *)objc_msgSend(v1, "mutableCopy", (_QWORD)v10);
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "copy");

LABEL_12:
  return v8;
}

id _UACopyUnpackedObjectFromData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result;

  result = UAMessageUnpack::CopyUnpacked(a1, a2, a3, 0, 0);
  if (result)
    return (id)CFRetain(result);
  return result;
}

id UAMessageUnpack::CopyUnpacked(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, void *a5)
{
  void *v5;
  _BYTE v7[72];
  id v8;
  id v9;

  UAMessageUnpack::UAMessageUnpack((uint64_t)v7, a1, a2, a3, a4, a5);
  UAMessageUnpack::readFromContext((UAMessageUnpack *)v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1AF7FEFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{

  _Unwind_Resume(a1);
}

uint64_t UAMessageUnpack::UAMessageUnpack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v8;
  void *v9;
  _BYTE *v10;

  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 40) = a2;
  *(_QWORD *)(a1 + 48) = a3;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = a4;
  v8 = a6;
  *(_QWORD *)(a1 + 72) = _Block_copy(a5);
  v9 = _Block_copy(v8);

  *(_QWORD *)(a1 + 80) = v9;
  v10 = *(_BYTE **)(a1 + 40);
  if (v10 && *(_QWORD *)(a1 + 48) >= 4uLL && *v10 == 77 && v10[1] == 80)
  {
    *(_QWORD *)(a1 + 56) = 4;
    *(_BYTE *)a1 = 1;
  }
  cmp_init(a1 + 8, a1, (uint64_t)UAMessageUnpack::mp_reader, (uint64_t)UAMessageUnpack::mp_writer);
  return a1;
}

void sub_1AF7FF0B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZL53loadSynapseObserverWhenFirstUserActivityIsMadeCurrentv_block_invoke()
{
  uint64_t result;

  result = getSYActivityObserverClass();
  if (result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)getSYActivityObserverClass(), "loadSynapseObserver");
  }
  return result;
}

id SYActivityObserverFunction(void)
{
  return (id)classSYActivityObserver;
}

Class initSYActivityObserver(void)
{
  Class result;

  if (LoadSynapse(void)::loadPredicate != -1)
    dispatch_once(&LoadSynapse(void)::loadPredicate, &__block_literal_global_765);
  result = objc_getClass("SYActivityObserver");
  classSYActivityObserver = (uint64_t)result;
  getSYActivityObserverClass = (uint64_t (*)(void))SYActivityObserverFunction;
  return result;
}

void sub_1AF7FF5B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ___ZL24getDeferredIndexingQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("coreSpotlightDeferredIndexQ", 0);
  v1 = (void *)getDeferredIndexingQueue(void)::sQueue;
  getDeferredIndexingQueue(void)::sQueue = (uint64_t)v0;

}

uint64_t ___ZL21isIndexPendingForUUIDP6NSUUID_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = sIndexPendingUUIDs;
  if (sIndexPendingUUIDs)
  {
    result = objc_msgSend((id)sIndexPendingUUIDs, "containsObject:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

void sub_1AF7FF6E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AF7FFBA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF7FFE3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AF7FFF04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AF800110()
{
  void *v0;
  void *v1;
  void *v2;

  objc_end_catch();
  JUMPOUT(0x1AF7FFFECLL);
}

void sub_1AF8001A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AF800410(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1AF8006F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF800780(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CSSearchableIndexFunction(void)
{
  return (id)classCSSearchableIndex;
}

id stringForContentSet(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  stringRemovingNewlines(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1AF8007F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

Class initCSSearchableIndex(void)
{
  Class result;

  if (!CoreSpotlightLibrary(void)::frameworkLibrary)
    CoreSpotlightLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  result = objc_getClass("CSSearchableIndex");
  classCSSearchableIndex = (uint64_t)result;
  getCSSearchableIndexClass = (uint64_t (*)(void))CSSearchableIndexFunction;
  return result;
}

Class initNSUserActivity(void)
{
  Class result;

  if (!FoundationLibrary(void)::frameworkLibrary)
    FoundationLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Foundation.framework/Foundation", 2);
  result = objc_getClass("NSUserActivity");
  classNSUserActivity = (uint64_t)result;
  getNSUserActivityClass = (uint64_t (*)(void))NSUserActivityFunction;
  return result;
}

Class initCSSearchableIndex()
{
  Class result;

  if (!CoreSpotlightLibrary_frameworkLibrary)
    CoreSpotlightLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  result = objc_getClass("CSSearchableIndex");
  classCSSearchableIndex = (uint64_t)result;
  getCSSearchableIndexClass = (uint64_t (*)())CSSearchableIndexFunction;
  return result;
}

id CSSearchableIndexFunction()
{
  return (id)classCSSearchableIndex;
}

Class initCSSearchableItemAttributeSet(void)
{
  Class result;

  if (!CoreSpotlightLibrary(void)::frameworkLibrary)
    CoreSpotlightLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  result = objc_getClass("CSSearchableItemAttributeSet");
  classCSSearchableItemAttributeSet = (uint64_t)result;
  getCSSearchableItemAttributeSetClass = (uint64_t (*)(void))CSSearchableItemAttributeSetFunction;
  return result;
}

id NSUserActivityFunction(void)
{
  return (id)classNSUserActivity;
}

void __biomeInfoLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  v0 = os_log_create("com.apple.useractivity", "biome-69594900");
  v1 = (void *)biomeInfoLogging::sLog;
  biomeInfoLogging::sLog = (uint64_t)v0;

  v2 = biomeInfoLogging::sLog;
  if (os_log_type_enabled((os_log_t)biomeInfoLogging::sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "- UAUserActivity\tv1.0", v3, 2u);
  }
}

void sub_1AF800E18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void __validDictionaryTypes_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char valid;
  id v9;
  char isKindOfClass;
  void *v11;

  v7 = a3;
  valid = 0;
  if (a2 && v7)
  {
    v11 = v7;
    v9 = a2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      valid = validType(v11);
    else
      valid = 0;
    v7 = v11;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = valid;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;

}

void sub_1AF80143C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AF8017CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8018F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_1AF8019DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1AF801BC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF801C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

void sub_1AF801D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1AF801F5C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

id UABestAppSuggestionManagerServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYBESTAPP", CFSTR("com.apple.coreservices.lsbestappsuggestionmanager.xpc"));
}

void sub_1AF802280(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id CSSearchableItemAttributeSetFunction(void)
{
  return (id)classCSSearchableItemAttributeSet;
}

id _LSGetBestAppSuggestionManagerResponseProtocolInterface()
{
  if (_LSGetBestAppSuggestionManagerResponseProtocolInterface_once != -1)
    dispatch_once(&_LSGetBestAppSuggestionManagerResponseProtocolInterface_once, &__block_literal_global_139);
  return (id)_LSGetBestAppSuggestionManagerResponseProtocolInterface_result;
}

id _LSGetBestAppSuggestionManagerProtocolInterface()
{
  if (_LSGetBestAppSuggestionManagerProtocolInterface_once != -1)
    dispatch_once(&_LSGetBestAppSuggestionManagerProtocolInterface_once, &__block_literal_global_116);
  return (id)_LSGetBestAppSuggestionManagerProtocolInterface_result;
}

void sub_1AF8024E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1AF80274C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1AF802CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_1AF802E18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t acceptableForUserInfo(NSDictionary *a1)
{
  return recurse(a1, &__block_literal_global);
}

void sub_1AF803108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1AF8032E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1AF803370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

void sub_1AF80354C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1AF80382C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1AF8039D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1AF803C98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id getSupportsContinuationStreamsQueue(void)
{
  if (getSupportsContinuationStreamsQueue(void)::sOnce != -1)
    dispatch_once(&getSupportsContinuationStreamsQueue(void)::sOnce, &__block_literal_global_759);
  return (id)getSupportsContinuationStreamsQueue(void)::sResult;
}

void sub_1AF803F18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF804078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1AF804580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF804748(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AF80480C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF805020(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AF805680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AF8058B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1AF805AF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AF805CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{

  _Unwind_Resume(a1);
}

void sub_1AF805FCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1AF806C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *a50)
{
  void *v50;
  void *v51;
  uint64_t v52;

  _Block_object_dispose((const void *)(v52 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1AF806EDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF8070C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

id recurseAndReplace(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unsigned int (**v11)(id, id);
  void (**v12)(id, id);
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  id v43;
  uint64_t v44;
  NSObject *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  uint8_t v57[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v10 = v8;
  v11 = (unsigned int (**)(id, id))v6;
  v12 = (void (**)(id, id))v7;
  v47 = v10;
  v48 = v9;
  objc_msgSend(v10, "objectForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "objectForKey:", v48);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v15 = v14;
    goto LABEL_54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v31, v48);
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v32 = v48;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v50 != v34)
              objc_enumerationMutation(v32);
            v36 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * i);
            if (v11[2](v11, v36))
            {
              v12[2](v12, v36);
              v37 = objc_claimAutoreleasedReturnValue();

              v36 = (id)v37;
            }
            if (v36)
              objc_msgSend(v31, "addObject:", v36);

          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v33);
      }

      _uaGetLogForCategory(0);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v54 = v32;
        v55 = 2113;
        v56 = v31;
        _os_log_impl(&dword_1AF7EB000, v38, OS_LOG_TYPE_DEBUG, "recurseAndReplace(array): %{private}@ => %{private}@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _uaGetLogForCategory(0);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v57 = 138477827;
          v58 = v48;
          _os_log_impl(&dword_1AF7EB000, v46, OS_LOG_TYPE_DEBUG, "recurseAndReplace(obj): %{private}@", v57, 0xCu);
        }

        v14 = v48;
        goto LABEL_3;
      }
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v31, v48);
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v39 = v48;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v50 != v41)
              objc_enumerationMutation(v39);
            v43 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * j);
            if (v11[2](v11, v43))
            {
              v12[2](v12, v43);
              v44 = objc_claimAutoreleasedReturnValue();

              v43 = (id)v44;
            }
            if (v43)
              objc_msgSend(v31, "addObject:", v43);

          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v40);
      }

      _uaGetLogForCategory(0);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v54 = v39;
        v55 = 2113;
        v56 = v31;
        _os_log_impl(&dword_1AF7EB000, v38, OS_LOG_TYPE_DEBUG, "recurseAndReplace(set): %{private}@ => %{private}@", buf, 0x16u);
      }
    }

    v15 = (void *)objc_msgSend(v31, "copy");
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v16, v48);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v48, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(v17);
        v21 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * k);
        objc_msgSend(v48, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11[2](v11, v22))
        {
          v12[2](v12, v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v23;
        }
        if (v11[2](v11, v21))
        {
          v12[2](v12, v21);
          v24 = objc_claimAutoreleasedReturnValue();

          v21 = (id)v24;
        }
        if (v21)
          v25 = v22 == 0;
        else
          v25 = 1;
        if (!v25)
          objc_msgSend(v16, "setObject:forKey:", v22, v21);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v18);
  }

  _uaGetLogForCategory(0);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v48, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    stringRemovingNewlines(v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "description");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    stringRemovingNewlines(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v54 = v28;
    v55 = 2113;
    v56 = v30;
    _os_log_impl(&dword_1AF7EB000, v26, OS_LOG_TYPE_DEBUG, "recurseAndReplace(dict): %{private}@ => %{private}@", buf, 0x16u);

  }
  v15 = (void *)objc_msgSend(v16, "copy");

LABEL_54:
  return v15;
}

void sub_1AF8077CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AF807968(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AF807A8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF807BB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF807C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AF807CE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AF807ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1AF8080C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AF8081B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1AF8083C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AF808580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AF808738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AF80883C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AF808934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AF808E14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1AF809158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF809428(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF809780(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF809AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1AF80A3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AF80A6F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id suggestedActionNudgesQueue(void)
{
  if (suggestedActionNudgesQueue(void)::onceToken != -1)
    dispatch_once(&suggestedActionNudgesQueue(void)::onceToken, &__block_literal_global_778);
  return (id)suggestedActionNudgesQueue(void)::sSuggestedActionNudgesQueue;
}

void sub_1AF80A970(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AF80AB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AF80AC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AF80AD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AF80AE68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AF80AF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1AF80B058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  void *v9;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  objc_sync_exit(v8);

  _Unwind_Resume(a1);
}

void sub_1AF80B114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AF80B184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

void sub_1AF80BADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21,uint64_t a22)
{
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1AF80BC48()
{
  JUMPOUT(0x1AF80BD04);
}

void sub_1AF80BC54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  JUMPOUT(0x1AF80BBC0);
}

void sub_1AF80BC80()
{
  void *v0;

  JUMPOUT(0x1AF80BC98);
}

void sub_1AF80BCD8()
{
  void *v0;

  JUMPOUT(0x1AF80BCE8);
}

void sub_1AF80BE6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AF80C06C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AF80C284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  void *v29;

  _Block_object_dispose(&a24, 8);

  _Unwind_Resume(a1);
}

void sub_1AF80C454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1AF80C530(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF80C550(void *exc_buf, int a2)
{
  _QWORD *v2;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -114, 0);
      *v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_end_catch();
    JUMPOUT(0x1AF80C518);
  }
  JUMPOUT(0x1AF80C544);
}

void sub_1AF80C5B4()
{
  objc_end_catch();
  JUMPOUT(0x1AF80C544);
}

void sub_1AF80C700(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF80C7A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

NSArray *sortedArrayIfSameClass(NSArray *a1)
{
  NSArray *v1;
  NSArray *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1
    && -[NSArray count](v1, "count") >= 2
    && (-[NSArray firstObject](v2, "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    -[NSArray firstObject](v2, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v2;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          if (objc_opt_class() != v6)
          {

            goto LABEL_14;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    -[NSArray sortedArrayUsingSelector:](v7, "sortedArrayUsingSelector:", sel_compare_, v14);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_14:
    v11 = v2;
  }
  v12 = v11;

  return v12;
}

void sub_1AF80C93C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF80D054(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AF80D1A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AF80D220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AF80D2AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void ___ZL23dTraceProcessIdentifierv_block_invoke()
{
  __CFString *v0;
  uint64_t v1;
  id v2;
  __CFString *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PID:%lld]"), getpid(), 0);
    v1 = objc_claimAutoreleasedReturnValue();
    if (v1)
      v0 = (__CFString *)v1;
    else
      v0 = CFSTR("unknown");
  }
  v3 = objc_retainAutorelease(v0);
  dTraceProcessIdentifier(void)::result = (uint64_t)strdup((const char *)-[__CFString UTF8String](v3, "UTF8String"));

}

void sub_1AF80D374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

Class initSFCompanionAdvertiser(void)
{
  Class result;

  if (LoadSharing(void)::loadPredicate != -1)
    dispatch_once(&LoadSharing(void)::loadPredicate, &__block_literal_global_755);
  result = objc_getClass("SFCompanionAdvertiser");
  classSFCompanionAdvertiser = (uint64_t)result;
  getSFCompanionAdvertiserClass = (uint64_t (*)(void))SFCompanionAdvertiserFunction;
  return result;
}

id SFCompanionAdvertiserFunction(void)
{
  return (id)classSFCompanionAdvertiser;
}

void ___ZL11LoadSharingv_block_invoke()
{
  LoadSharing(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  if (!LoadSharing(void)::frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/Sharing.framework/Sharing"));
}

void ___ZL35getSupportsContinuationStreamsQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("getSupportsContinuationStreamsQueue", 0);
  v1 = (void *)getSupportsContinuationStreamsQueue(void)::sResult;
  getSupportsContinuationStreamsQueue(void)::sResult = (uint64_t)v0;

}

uint64_t initFPURLMightBeInFileProvider(const __CFURL *a1)
{
  void *v2;

  v2 = (void *)FileProviderLibrary(void)::frameworkLibrary;
  if (!FileProviderLibrary(void)::frameworkLibrary)
  {
    v2 = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
    FileProviderLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }
  softLinkFPURLMightBeInFileProvider = (uint64_t (*)(const __CFURL *))dlsym(v2, "FPURLMightBeInFileProvider");
  return softLinkFPURLMightBeInFileProvider(a1);
}

uint64_t initFPCreateBookmarkableStringFromDocumentURL(const __CFURL *a1, __CFError **a2)
{
  void *v4;

  v4 = (void *)FileProviderLibrary(void)::frameworkLibrary;
  if (!FileProviderLibrary(void)::frameworkLibrary)
  {
    v4 = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
    FileProviderLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  softLinkFPCreateBookmarkableStringFromDocumentURL = (uint64_t (*)(const __CFURL *, __CFError **))dlsym(v4, "FPCreateBookmarkableStringFromDocumentURL");
  return softLinkFPCreateBookmarkableStringFromDocumentURL(a1, a2);
}

uint64_t initFPCreateDocumentURLFromBookmarkableString(const __CFString *a1, __CFError **a2)
{
  void *v4;

  v4 = (void *)FileProviderLibrary(void)::frameworkLibrary;
  if (!FileProviderLibrary(void)::frameworkLibrary)
  {
    v4 = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
    FileProviderLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  softLinkFPCreateDocumentURLFromBookmarkableString = (uint64_t (*)(const __CFString *, __CFError **))dlsym(v4, "FPCreateDocumentURLFromBookmarkableString");
  return softLinkFPCreateDocumentURLFromBookmarkableString(a1, a2);
}

void ___ZL26suggestedActionNudgesQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("suggestedActionNudgesQ", 0);
  v1 = (void *)suggestedActionNudgesQueue(void)::sSuggestedActionNudgesQueue;
  suggestedActionNudgesQueue(void)::sSuggestedActionNudgesQueue = (uint64_t)v0;

}

uint64_t ___ZL34installSpringBoardUserEventMonitorv_block_invoke()
{
  uint64_t result;

  result = suggestedActionNudges;
  if (suggestedActionNudges)
    return objc_msgSend((id)suggestedActionNudges, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_784);
  return result;
}

uint64_t ___ZL34installSpringBoardUserEventMonitorv_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

void sub_1AF80DC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF80EF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF80F138(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF80F2DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF80F9CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __validType_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = validType(a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

void __validType_block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  char valid;
  id v10;

  v10 = a3;
  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    valid = validType(v10);
  else
    valid = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = valid;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;

}

id copyHexStringForData(void *a1)
{
  id v1;
  void *v2;
  id v3;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(v1);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = *v4++;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c"), a0123456789abcd[(unint64_t)v7 >> 4], a0123456789abcd[v7 & 0xF]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendString:", v8);

      --v6;
    }
    while (v6);
  }
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

id copyDataFromHexString(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  unsigned __int8 v5;
  char v7;
  unint64_t v8;
  int v9;
  unsigned int v10;
  char v11;
  char v12;
  void *v13;
  char v15;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    v3 = 0;
    do
    {
      v4 = v3 + 1;
      v5 = objc_msgSend(v1, "characterAtIndex:", v3);
      if (v5 > 0x24u || ((1 << v5) & 0x1100000400) == 0)
      {
        v7 = v5 - 48;
        if ((v5 - 48) >= 0xAu
          && (v5 - 65 > 0x25 || ((1 << (v5 - 65)) & 0x3F0000003FLL) == 0))
        {

          v2 = 0;
          break;
        }
        if (v5 - 48 >= 0xA)
        {
          if (v5 - 97 > 5)
          {
            if (v5 - 65 >= 6)
              v7 = 0;
            else
              v7 = v5 - 55;
          }
          else
          {
            v7 = v5 - 87;
          }
        }
        v8 = v3 + 2;
        v9 = objc_msgSend(v1, "characterAtIndex:", v4);
        v10 = v9 - 48;
        if ((v9 - 65) <= 5)
          v11 = v9 - 55;
        else
          v11 = 0;
        if ((v9 - 97) <= 5)
          v12 = v9 - 87;
        else
          v12 = v11;
        if (v10 > 9)
          LOBYTE(v10) = v12;
        v15 = v10 | (16 * v7);
        objc_msgSend(v2, "appendBytes:length:", &v15, 1);
        v4 = v8;
      }
      v3 = v4;
    }
    while (v4 < objc_msgSend(v1, "length"));
  }
  v13 = (void *)objc_msgSend(v2, "copy");

  return v13;
}

const char *cmp_strerror(unsigned __int8 *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((v1 - 1) > 0xE)
    return "";
  else
    return (&cmp_error_messages)[v1];
}

uint64_t cmp_write_pfix(uint64_t a1, char a2)
{
  uint64_t v3;
  char v4;
  char v6;

  if (a2 < 0)
  {
    v4 = 5;
    goto LABEL_5;
  }
  v6 = a2;
  v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    v4 = 6;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_nfix(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  char v4;
  char v6;

  if (a2 < 0xFFFFFFE0)
  {
    v4 = 5;
    goto LABEL_5;
  }
  v6 = a2;
  v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    v4 = 6;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_sfix(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  char v8;

  if ((a2 & 0x80000000) != 0)
  {
    if (a2 < 0xFFFFFFE0)
    {
      v5 = 5;
      goto LABEL_8;
    }
    v8 = a2;
    v3 = 1;
    v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1);
  }
  else
  {
    v7 = a2;
    v3 = 1;
    v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1);
  }
  if (v4 != 1)
  {
    v5 = 6;
LABEL_8:
    v3 = 0;
    *(_BYTE *)a1 = v5;
  }
  return v3;
}

BOOL cmp_write_s8(uint64_t a1, char a2)
{
  _BOOL8 result;
  char v4;
  char v5;

  v4 = a2;
  v5 = -48;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) == 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1) != 0;
  result = 0;
  *(_BYTE *)a1 = 8;
  return result;
}

BOOL cmp_write_s16(uint64_t a1, unsigned int a2)
{
  _BOOL8 result;
  __int16 v5;
  char v6;

  v6 = -47;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    v5 = bswap32(a2) >> 16;
    return (*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v5, 2) != 0;
  }
  else
  {
    result = 0;
    *(_BYTE *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_s32(uint64_t a1, unsigned int a2)
{
  _BOOL8 result;
  unsigned int v5;
  char v6;

  v6 = -46;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    v5 = bswap32(a2);
    return (*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v5, 4) != 0;
  }
  else
  {
    result = 0;
    *(_BYTE *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_s64(uint64_t a1, unint64_t a2)
{
  _BOOL8 result;
  unint64_t v5;
  char v6;

  v6 = -45;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    v5 = bswap64(a2);
    return (*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(a1 + 24))(a1, &v5, 8) != 0;
  }
  else
  {
    result = 0;
    *(_BYTE *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_sint(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  char v5;

  if ((a2 & 0x8000000000000000) == 0)
    return cmp_write_uint(a1, a2);
  if (a2 < 0xFFFFFFFFFFFFFFE0)
  {
    if (a2 < 0xFFFFFFFFFFFFFF80)
    {
      if (a2 < 0xFFFFFFFFFFFF8000)
      {
        if (a2 < 0xFFFFFFFF80000000)
          return cmp_write_s64(a1, a2);
        else
          return cmp_write_s32(a1, a2);
      }
      else
      {
        return cmp_write_s16(a1, (__int16)a2);
      }
    }
    else
    {
      return cmp_write_s8(a1, a2);
    }
  }
  else
  {
    v5 = a2;
    v4 = 1;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
    {
      v4 = 0;
      *(_BYTE *)a1 = 6;
    }
    return v4;
  }
}

BOOL cmp_write_u8(uint64_t a1, char a2)
{
  _BOOL8 result;
  char v4;
  char v5;

  v4 = a2;
  v5 = -52;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) == 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1) != 0;
  result = 0;
  *(_BYTE *)a1 = 8;
  return result;
}

BOOL cmp_write_u64(uint64_t a1, unint64_t a2)
{
  _BOOL8 result;
  unint64_t v5;
  char v6;

  v6 = -49;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    v5 = bswap64(a2);
    return (*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(a1 + 24))(a1, &v5, 8) != 0;
  }
  else
  {
    result = 0;
    *(_BYTE *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_float(uint64_t a1, float a2)
{
  _BOOL8 result;
  unsigned int v5;
  char v6;

  v6 = -54;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) == 1)
  {
    v5 = bswap32(LODWORD(a2));
    return (*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v5, 4) != 0;
  }
  else
  {
    result = 0;
    *(_BYTE *)a1 = 8;
  }
  return result;
}

BOOL cmp_write_nil(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v4 = -64;
  v2 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1);
  if (v2 != 1)
    *(_BYTE *)a1 = 8;
  return v2 == 1;
}

BOOL cmp_write_true(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v4 = -61;
  v2 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1);
  if (v2 != 1)
    *(_BYTE *)a1 = 8;
  return v2 == 1;
}

BOOL cmp_write_false(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v4 = -62;
  v2 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v4, 1);
  if (v2 != 1)
    *(_BYTE *)a1 = 8;
  return v2 == 1;
}

uint64_t cmp_write_BOOL(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char v6;
  char v7;

  if (a2)
  {
    v6 = -61;
    v3 = 1;
    v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1);
  }
  else
  {
    v7 = -62;
    v3 = 1;
    v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1);
  }
  if (v4 != 1)
  {
    v3 = 0;
    *(_BYTE *)a1 = 8;
  }
  return v3;
}

uint64_t cmp_write_fixstr_marker(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  char v4;
  char v6;

  if (a2 > 0x1F)
  {
    v4 = 5;
    goto LABEL_5;
  }
  v6 = a2 | 0xA0;
  v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    v4 = 6;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_str8(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = cmp_write_str8_marker(a1, a3);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a2, a3);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_str16_marker(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  char v5;
  __int16 v6;
  char v7;

  v7 = -38;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    v6 = __rev16(a2);
    if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v6, 2))
      return 1;
    v5 = 15;
  }
  else
  {
    v5 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v5;
  return result;
}

uint64_t cmp_write_str16(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = cmp_write_str16_marker(a1, a3);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a2, a3);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_str32_marker(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  char v5;
  unsigned int v6;
  char v7;

  v7 = -37;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    v6 = bswap32(a2);
    if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v6, 4))
      return 1;
    v5 = 15;
  }
  else
  {
    v5 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v5;
  return result;
}

uint64_t cmp_write_str32(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = cmp_write_str32_marker(a1, a3);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a2, a3);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_str_marker(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  char v5;

  if (a2 > 0x1F)
  {
    if (a2 > 0xFF)
    {
      if (HIWORD(a2))
        return cmp_write_str32_marker(a1, a2);
      else
        return cmp_write_str16_marker(a1, (unsigned __int16)a2);
    }
    else
    {
      return cmp_write_str8_marker(a1, a2);
    }
  }
  else
  {
    v5 = a2 | 0xA0;
    v3 = 1;
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v5, 1) != 1)
    {
      v3 = 0;
      *(_BYTE *)a1 = 6;
    }
    return v3;
  }
}

uint64_t cmp_write_bin8_marker(uint64_t a1, char a2)
{
  uint64_t v3;
  char v4;
  char v6;
  char v7;

  v6 = a2;
  v7 = -60;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    v4 = 8;
    goto LABEL_5;
  }
  v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    v4 = 15;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_bin8(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = cmp_write_bin8_marker(a1, a3);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a2, a3);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_bin16_marker(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  char v5;
  __int16 v6;
  char v7;

  v7 = -59;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    v6 = __rev16(a2);
    if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v6, 2))
      return 1;
    v5 = 15;
  }
  else
  {
    v5 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v5;
  return result;
}

uint64_t cmp_write_bin16(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = cmp_write_bin16_marker(a1, a3);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a2, a3);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_bin32_marker(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  char v5;
  unsigned int v6;
  char v7;

  v7 = -58;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    v6 = bswap32(a2);
    if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v6, 4))
      return 1;
    v5 = 15;
  }
  else
  {
    v5 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v5;
  return result;
}

uint64_t cmp_write_bin32(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = cmp_write_bin32_marker(a1, a3);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a2, a3);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_bin_marker(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0xFF)
    return cmp_write_bin8_marker(a1, a2);
  if (HIWORD(a2))
    return cmp_write_bin32_marker(a1, a2);
  return cmp_write_bin16_marker(a1, (unsigned __int16)a2);
}

uint64_t cmp_write_bin(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  if (a3 > 0xFF)
  {
    if (HIWORD(a3))
    {
      result = cmp_write_bin32_marker(a1, a3);
      if (!(_DWORD)result)
        return result;
    }
    else
    {
      result = cmp_write_bin16_marker(a1, (unsigned __int16)a3);
      if (!(_DWORD)result)
        return result;
    }
  }
  else
  {
    result = cmp_write_bin8_marker(a1, a3);
    if (!(_DWORD)result)
      return result;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a2, a3))
    return 1;
  result = 0;
  *(_BYTE *)a1 = 10;
  return result;
}

uint64_t cmp_write_fixarray(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  char v4;
  char v6;

  if (a2 > 0xF)
  {
    v4 = 5;
    goto LABEL_5;
  }
  v6 = a2 | 0x90;
  v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    v4 = 6;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_array16(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  char v5;
  __int16 v6;
  char v7;

  v7 = -36;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    v6 = __rev16(a2);
    if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v6, 2))
      return 1;
    v5 = 15;
  }
  else
  {
    v5 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v5;
  return result;
}

uint64_t cmp_write_array32(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  char v5;
  unsigned int v6;
  char v7;

  v7 = -35;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    v6 = bswap32(a2);
    if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v6, 4))
      return 1;
    v5 = 15;
  }
  else
  {
    v5 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v5;
  return result;
}

uint64_t cmp_write_fixmap(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  char v4;
  char v6;

  if (a2 > 0xF)
  {
    v4 = 5;
    goto LABEL_5;
  }
  v6 = a2 | 0x80;
  v3 = 1;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1) != 1)
  {
    v4 = 6;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_map16(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  char v5;
  __int16 v6;
  char v7;

  v7 = -34;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    v6 = __rev16(a2);
    if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v6, 2))
      return 1;
    v5 = 15;
  }
  else
  {
    v5 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v5;
  return result;
}

uint64_t cmp_write_map32(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  char v5;
  unsigned int v6;
  char v7;

  v7 = -33;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) == 1)
  {
    v6 = bswap32(a2);
    if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v6, 4))
      return 1;
    v5 = 15;
  }
  else
  {
    v5 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v5;
  return result;
}

uint64_t cmp_write_fixext1_marker(uint64_t a1, char a2)
{
  uint64_t v3;
  char v4;
  char v6;
  char v7;

  v6 = a2;
  v7 = -44;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    v4 = 8;
    goto LABEL_5;
  }
  v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    v4 = 12;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext1(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5;

  if (!cmp_write_fixext1_marker(a1, a2))
    return 0;
  v5 = 1;
  if (!(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 1))
  {
    v5 = 0;
    *(_BYTE *)a1 = 10;
  }
  return v5;
}

uint64_t cmp_write_fixext2_marker(uint64_t a1, char a2)
{
  uint64_t v3;
  char v4;
  char v6;
  char v7;

  v6 = a2;
  v7 = -43;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    v4 = 8;
    goto LABEL_5;
  }
  v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    v4 = 12;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext2(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result;

  result = cmp_write_fixext2_marker(a1, a2);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 2);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_fixext4_marker(uint64_t a1, char a2)
{
  uint64_t v3;
  char v4;
  char v6;
  char v7;

  v6 = a2;
  v7 = -42;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    v4 = 8;
    goto LABEL_5;
  }
  v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    v4 = 12;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result;

  result = cmp_write_fixext4_marker(a1, a2);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 4);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_fixext8_marker(uint64_t a1, char a2)
{
  uint64_t v3;
  char v4;
  char v6;
  char v7;

  v6 = a2;
  v7 = -41;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    v4 = 8;
    goto LABEL_5;
  }
  v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    v4 = 12;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext8(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result;

  result = cmp_write_fixext8_marker(a1, a2);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 8);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_fixext16_marker(uint64_t a1, char a2)
{
  uint64_t v3;
  char v4;
  char v6;
  char v7;

  v6 = a2;
  v7 = -40;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1) != 1)
  {
    v4 = 8;
    goto LABEL_5;
  }
  v3 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v6, 1))
  {
    v4 = 12;
LABEL_5:
    v3 = 0;
    *(_BYTE *)a1 = v4;
  }
  return v3;
}

uint64_t cmp_write_fixext16(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result;

  result = cmp_write_fixext16_marker(a1, a2);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a3, 16);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_ext8_marker(uint64_t a1, char a2, char a3)
{
  uint64_t v4;
  char v5;
  char v7;
  char v8;
  char v9;

  v8 = a2;
  v7 = a3;
  v9 = -57;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v9, 1) != 1)
  {
    v5 = 8;
    goto LABEL_7;
  }
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1))
  {
    v5 = 12;
    goto LABEL_7;
  }
  v4 = 1;
  if (!(*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v7, 1))
  {
    v5 = 15;
LABEL_7:
    v4 = 0;
    *(_BYTE *)a1 = v5;
  }
  return v4;
}

uint64_t cmp_write_ext8(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  uint64_t result;

  result = cmp_write_ext8_marker(a1, a2, a3);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a4, a3);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_ext16_marker(uint64_t a1, char a2, unsigned int a3)
{
  uint64_t result;
  char v6;
  __int16 v7;
  char v8;
  char v9;

  v8 = a2;
  v9 = -56;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v9, 1) == 1)
  {
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1))
    {
      v7 = __rev16(a3);
      if ((*(uint64_t (**)(uint64_t, __int16 *, uint64_t))(a1 + 24))(a1, &v7, 2))
        return 1;
      v6 = 15;
    }
    else
    {
      v6 = 12;
    }
  }
  else
  {
    v6 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v6;
  return result;
}

uint64_t cmp_write_ext16(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  uint64_t result;

  result = cmp_write_ext16_marker(a1, a2, a3);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a4, a3);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_ext32_marker(uint64_t a1, char a2, unsigned int a3)
{
  uint64_t result;
  char v6;
  unsigned int v7;
  char v8;
  char v9;

  v8 = a2;
  v9 = -55;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v9, 1) == 1)
  {
    if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v8, 1))
    {
      v7 = bswap32(a3);
      if ((*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(a1 + 24))(a1, &v7, 4))
        return 1;
      v6 = 15;
    }
    else
    {
      v6 = 12;
    }
  }
  else
  {
    v6 = 8;
  }
  result = 0;
  *(_BYTE *)a1 = v6;
  return result;
}

uint64_t cmp_write_ext32(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  uint64_t result;

  result = cmp_write_ext32_marker(a1, a2, a3);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a4, a3);
    if (result)
      return 1;
    else
      *(_BYTE *)a1 = 10;
  }
  return result;
}

uint64_t cmp_write_ext_marker(uint64_t a1, char a2, unsigned int a3)
{
  uint64_t result;

  switch(a3)
  {
    case 1u:
      result = cmp_write_fixext1_marker(a1, a2);
      break;
    case 2u:
      result = cmp_write_fixext2_marker(a1, a2);
      break;
    case 3u:
    case 5u:
    case 6u:
    case 7u:
      goto LABEL_5;
    case 4u:
      result = cmp_write_fixext4_marker(a1, a2);
      break;
    case 8u:
      result = cmp_write_fixext8_marker(a1, a2);
      break;
    default:
      if (a3 == 16)
      {
        result = cmp_write_fixext16_marker(a1, a2);
      }
      else
      {
LABEL_5:
        if (a3 > 0xFF)
        {
          if (HIWORD(a3))
            result = cmp_write_ext32_marker(a1, a2, a3);
          else
            result = cmp_write_ext16_marker(a1, a2, (unsigned __int16)a3);
        }
        else
        {
          result = cmp_write_ext8_marker(a1, a2, a3);
        }
      }
      break;
  }
  return result;
}

uint64_t cmp_write_ext(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;

  switch(a3)
  {
    case 1u:
      if (!cmp_write_fixext1_marker(a1, a2))
        return 0;
      v7 = 1;
      if (!(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 1))
        goto LABEL_22;
      return v7;
    case 2u:
      if (!cmp_write_fixext2_marker(a1, a2))
        return 0;
      v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 2);
      goto LABEL_20;
    case 3u:
    case 5u:
    case 6u:
    case 7u:
      goto LABEL_8;
    case 4u:
      if (!cmp_write_fixext4_marker(a1, a2))
        return 0;
      v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 4);
      goto LABEL_20;
    case 8u:
      if (!cmp_write_fixext8_marker(a1, a2))
        return 0;
      v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 8);
      goto LABEL_20;
    default:
      if (a3 == 16)
      {
        if (cmp_write_fixext16_marker(a1, a2))
        {
          v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a4, 16);
          goto LABEL_20;
        }
        return 0;
      }
LABEL_8:
      if (a3 > 0xFF)
      {
        if (HIWORD(a3))
        {
          if (!cmp_write_ext32_marker(a1, a2, a3))
            return 0;
        }
        else if (!cmp_write_ext16_marker(a1, a2, (unsigned __int16)a3))
        {
          return 0;
        }
      }
      else if (!cmp_write_ext8_marker(a1, a2, a3))
      {
        return 0;
      }
      v8 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 24))(a1, a4, a3);
LABEL_20:
      if (v8)
        return 1;
LABEL_22:
      v7 = 0;
      *(_BYTE *)a1 = 10;
      return v7;
  }
}

uint64_t cmp_write_object(uint64_t a1, _BYTE *a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;

  switch(*a2)
  {
    case 0:
      if ((char)a2[8] < 0)
        goto LABEL_45;
      v11 = a2[8];
      v3 = 1;
      v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v11, 1);
      goto LABEL_43;
    case 1:
      v5 = a2[8];
      if (v5 > 0xF)
        goto LABEL_45;
      v12 = v5 | 0x80;
      v3 = 1;
      v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v12, 1);
      goto LABEL_43;
    case 2:
      v6 = a2[8];
      if (v6 > 0xF)
        goto LABEL_45;
      v13 = v6 | 0x90;
      v3 = 1;
      v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v13, 1);
      goto LABEL_43;
    case 3:
      v7 = a2[8];
      if (v7 > 0x1F)
        goto LABEL_45;
      v14 = v7 | 0xA0;
      v3 = 1;
      v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v14, 1);
      goto LABEL_43;
    case 4:
      v15 = -64;
      v3 = 1;
      v8 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v15, 1);
      goto LABEL_48;
    case 5:
      if (a2[8])
      {
        v16 = -61;
        v3 = 1;
        v8 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v16, 1);
      }
      else
      {
        v17 = -62;
        v3 = 1;
        v8 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v17, 1);
      }
LABEL_48:
      if (v8 == 1)
        return v3;
      v3 = 0;
      v10 = 8;
      goto LABEL_50;
    case 6:
      return cmp_write_bin8_marker(a1, a2[8]);
    case 7:
      return cmp_write_bin16_marker(a1, *((unsigned __int16 *)a2 + 4));
    case 8:
      return cmp_write_bin32_marker(a1, *((_DWORD *)a2 + 2));
    case 9:
      return cmp_write_ext8_marker(a1, a2[8], a2[12]);
    case 0xA:
      return cmp_write_ext16_marker(a1, a2[8], *((unsigned __int16 *)a2 + 6));
    case 0xB:
      return cmp_write_ext32_marker(a1, a2[8], *((_DWORD *)a2 + 3));
    case 0xC:
      return cmp_write_float(a1, *((float *)a2 + 2));
    case 0xD:
      return cmp_write_double(a1, *((double *)a2 + 1));
    case 0xE:
      return cmp_write_u8(a1, a2[8]);
    case 0xF:
      return cmp_write_u16(a1, *((unsigned __int16 *)a2 + 4));
    case 0x10:
      return cmp_write_u32(a1, *((_DWORD *)a2 + 2));
    case 0x11:
      return cmp_write_u64(a1, *((_QWORD *)a2 + 1));
    case 0x12:
      return cmp_write_s8(a1, a2[8]);
    case 0x13:
      return cmp_write_s16(a1, *((__int16 *)a2 + 4));
    case 0x14:
      return cmp_write_s32(a1, *((_DWORD *)a2 + 2));
    case 0x15:
      return cmp_write_s64(a1, *((_QWORD *)a2 + 1));
    case 0x16:
      return cmp_write_fixext1_marker(a1, a2[8]);
    case 0x17:
      return cmp_write_fixext2_marker(a1, a2[8]);
    case 0x18:
      return cmp_write_fixext4_marker(a1, a2[8]);
    case 0x19:
      return cmp_write_fixext8_marker(a1, a2[8]);
    case 0x1A:
      return cmp_write_fixext16_marker(a1, a2[8]);
    case 0x1C:
      return cmp_write_str16_marker(a1, *((unsigned __int16 *)a2 + 4));
    case 0x1D:
      return cmp_write_str32_marker(a1, *((_DWORD *)a2 + 2));
    case 0x1E:
      return cmp_write_array16(a1, *((unsigned __int16 *)a2 + 4));
    case 0x1F:
      return cmp_write_array32(a1, *((_DWORD *)a2 + 2));
    case 0x20:
      return cmp_write_map16(a1, *((unsigned __int16 *)a2 + 4));
    case 0x21:
      return cmp_write_map32(a1, *((_DWORD *)a2 + 2));
    case 0x22:
      if (a2[8] < 0xE0u)
      {
LABEL_45:
        v10 = 5;
      }
      else
      {
        v18 = a2[8];
        v3 = 1;
        v4 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 24))(a1, &v18, 1);
LABEL_43:
        if (v4 == 1)
          return v3;
        v10 = 6;
      }
      v3 = 0;
LABEL_50:
      *(_BYTE *)a1 = v10;
      return v3;
    default:
      v3 = 0;
      v10 = 13;
      goto LABEL_50;
  }
}

uint64_t cmp_read_pfix(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if ((_BYTE)v5)
    {
      result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v6;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_nfix(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 34)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_sfix(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if ((_DWORD)result)
  {
    if (v6 == 34 || v6 == 0)
    {
      *a2 = v7;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_s8(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 18)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_s16(_BYTE *a1, _WORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 19)
    {
      *a2 = bswap32((unsigned __int16)v6) >> 16;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_s32(_BYTE *a1, _DWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 20)
    {
      *a2 = bswap32(v6);
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_s64(_BYTE *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 21)
    {
      *a2 = bswap64(v6);
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_char(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  char v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if ((_DWORD)result)
  {
    if (v7 > 0x11u)
    {
      if (v7 != 34 && v7 != 18)
        goto LABEL_14;
    }
    else if ((_BYTE)v7)
    {
      if (v7 != 14 || (v5 = v8, (char)v8 < 0))
      {
LABEL_14:
        result = 0;
        *a1 = 13;
        return result;
      }
LABEL_13:
      *a2 = v5;
      return 1;
    }
    v5 = v8;
    goto LABEL_13;
  }
  return result;
}

uint64_t cmp_read_short(_BYTE *a1, _WORD *a2)
{
  uint64_t result;
  __int16 v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if ((_DWORD)result)
  {
    switch((char)v7)
    {
      case 14:
        v5 = v8;
        goto LABEL_13;
      case 15:
        v5 = v8;
        if ((__int16)v8 < 0)
          goto LABEL_11;
        goto LABEL_13;
      case 16:
      case 17:
        goto LABEL_11;
      case 18:
        goto LABEL_9;
      case 19:
        v5 = v8;
        goto LABEL_13;
      default:
        if (v7 == 34 || v7 == 0)
        {
LABEL_9:
          v5 = (char)v8;
LABEL_13:
          *a2 = v5;
          result = 1;
        }
        else
        {
LABEL_11:
          result = 0;
          *a1 = 13;
        }
        break;
    }
  }
  return result;
}

uint64_t cmp_read_int(_BYTE *a1, _DWORD *a2)
{
  uint64_t result;
  int v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if ((_DWORD)result)
  {
    switch((char)v7)
    {
      case 14:
        v5 = v8;
        goto LABEL_15;
      case 15:
        v5 = (unsigned __int16)v8;
        goto LABEL_15;
      case 16:
        v5 = v8;
        if ((v8 & 0x80000000) != 0)
          goto LABEL_12;
        goto LABEL_15;
      case 17:
        goto LABEL_12;
      case 18:
        goto LABEL_9;
      case 19:
        v5 = (__int16)v8;
        goto LABEL_15;
      case 20:
        v5 = v8;
        goto LABEL_15;
      default:
        if (v7 == 34 || v7 == 0)
        {
LABEL_9:
          v5 = (char)v8;
LABEL_15:
          *a2 = v5;
          result = 1;
        }
        else
        {
LABEL_12:
          result = 0;
          *a1 = 13;
        }
        break;
    }
  }
  return result;
}

uint64_t cmp_read_long(_BYTE *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if ((_DWORD)result)
  {
    switch((char)v6)
    {
      case 14:
        v5 = v7;
        goto LABEL_13;
      case 15:
        v5 = (unsigned __int16)v7;
        goto LABEL_13;
      case 16:
        v5 = v7;
        goto LABEL_13;
      case 17:
        v5 = v7;
        if (v7 < 0)
          goto LABEL_9;
        goto LABEL_13;
      case 18:
      case 34:
        goto LABEL_5;
      case 19:
        v5 = (__int16)v7;
        goto LABEL_13;
      case 20:
        v5 = (int)v7;
        goto LABEL_13;
      case 21:
        v5 = v7;
        goto LABEL_13;
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
        goto LABEL_9;
      default:
        if ((_BYTE)v6)
        {
LABEL_9:
          result = 0;
          *a1 = 13;
        }
        else
        {
LABEL_5:
          v5 = (char)v7;
LABEL_13:
          *a2 = v5;
          result = 1;
        }
        break;
    }
  }
  return result;
}

uint64_t cmp_read_u8(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 14)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_u16(_BYTE *a1, _WORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 15)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_u32(_BYTE *a1, _DWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 16)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_u64(_BYTE *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 17)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_uchar(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if ((_DWORD)result)
  {
    if (v6 == 14 || v6 == 0)
    {
      *a2 = v7;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_ushort(_BYTE *a1, _WORD *a2)
{
  uint64_t result;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if ((_DWORD)result)
  {
    if (!(_BYTE)v6)
      goto LABEL_5;
    if (v6 == 15)
    {
      v5 = v7;
      goto LABEL_7;
    }
    if (v6 == 14)
    {
LABEL_5:
      v5 = v7;
LABEL_7:
      *a2 = v5;
      return 1;
    }
    result = 0;
    *a1 = 13;
  }
  return result;
}

uint64_t cmp_read_uint(_BYTE *a1, _DWORD *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if ((_DWORD)result)
  {
    if (v6 <= 0xEu)
    {
      if ((_BYTE)v6 && v6 != 14)
        goto LABEL_14;
    }
    else
    {
      if (v6 == 15)
      {
        v5 = (unsigned __int16)v7;
        goto LABEL_12;
      }
      if (v6 == 16)
      {
        v5 = v7;
        goto LABEL_12;
      }
      if (v6 != 34)
      {
LABEL_14:
        result = 0;
        *a1 = 13;
        return result;
      }
    }
    v5 = v7;
LABEL_12:
    *a2 = v5;
    return 1;
  }
  return result;
}

uint64_t cmp_read_ulong(_BYTE *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if ((_DWORD)result)
  {
    switch((char)v7)
    {
      case 14:
        goto LABEL_9;
      case 15:
        v5 = (unsigned __int16)v8;
        goto LABEL_12;
      case 16:
        v5 = v8;
        goto LABEL_12;
      case 17:
        v5 = v8;
        goto LABEL_12;
      default:
        if (v7 == 34 || v7 == 0)
        {
LABEL_9:
          v5 = v8;
LABEL_12:
          *a2 = v5;
          result = 1;
        }
        else
        {
          result = 0;
          *a1 = 13;
        }
        break;
    }
  }
  return result;
}

uint64_t cmp_read_float(_BYTE *a1, _DWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 12)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_double(_BYTE *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 13)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_nil(_BYTE *a1)
{
  uint64_t result;
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)v3);
  if ((_DWORD)result)
  {
    if (LOBYTE(v3[0]) == 4)
    {
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_BOOL(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 5)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_str_size(_BYTE *a1, _DWORD *a2)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if ((_DWORD)result)
  {
    if (v6 > 0x1Du || ((1 << v6) & 0x38000008) == 0)
    {
      result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v7;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_str(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v7;
  uint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v10))
    return 0;
  if (v10 > 0x1Du || ((1 << v10) & 0x38000008) == 0)
  {
    *(_BYTE *)a1 = 13;
    return 0;
  }
  v7 = v11;
  if ((v11 + 1) <= *a3)
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 16))(a1, a2, v11) & 1) != 0)
    {
      *(_BYTE *)(a2 + v7) = 0;
      *a3 = v7;
      return 1;
    }
    result = 0;
    v9 = 9;
  }
  else
  {
    result = 0;
    *a3 = v11;
    v9 = 1;
  }
  *(_BYTE *)a1 = v9;
  return result;
}

uint64_t cmp_read_bin_size(_BYTE *a1, _DWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 - 6 > 2)
    {
      result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v6;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_bin(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v6;
  uint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v9))
    return 0;
  if (v9 - 6 >= 3)
  {
    *(_BYTE *)a1 = 13;
    return 0;
  }
  v6 = v10;
  if (v10 <= *a3)
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 16))(a1, a2, v10) & 1) != 0)
    {
      *a3 = v6;
      return 1;
    }
    result = 0;
    v8 = 9;
  }
  else
  {
    result = 0;
    v8 = 2;
  }
  *(_BYTE *)a1 = v8;
  return result;
}

uint64_t cmp_read_array(_BYTE *a1, _DWORD *a2)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if ((_DWORD)result)
  {
    if (v6 > 0x1Fu || ((1 << v6) & 0xC0000004) == 0)
    {
      result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v7;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_map(_BYTE *a1, _DWORD *a2)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v6);
  if ((_DWORD)result)
  {
    if (v6 > 0x21u || ((1 << v6) & 0x300000002) == 0)
    {
      result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v7;
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_fixext1_marker(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 22)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext1(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v8))
    return 0;
  if (v8 != 22)
  {
    *(_BYTE *)a1 = 13;
    return 0;
  }
  *a2 = v9;
  v6 = 1;
  if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 1) & 1) == 0)
  {
    v6 = 0;
    *(_BYTE *)a1 = 9;
  }
  return v6;
}

uint64_t cmp_read_fixext2_marker(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 23)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext2(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v7))
    return 0;
  if (v7 != 23)
  {
    *(_BYTE *)a1 = 13;
    return 0;
  }
  *a2 = v8;
  if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 2) & 1) != 0)
    return 1;
  result = 0;
  *(_BYTE *)a1 = 9;
  return result;
}

uint64_t cmp_read_fixext4_marker(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 24)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext4(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v7))
    return 0;
  if (v7 != 24)
  {
    *(_BYTE *)a1 = 13;
    return 0;
  }
  *a2 = v8;
  if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 4) & 1) != 0)
    return 1;
  result = 0;
  *(_BYTE *)a1 = 9;
  return result;
}

uint64_t cmp_read_fixext8_marker(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 25)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext8(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v7))
    return 0;
  if (v7 != 25)
  {
    *(_BYTE *)a1 = 13;
    return 0;
  }
  *a2 = v8;
  if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 8) & 1) != 0)
    return 1;
  result = 0;
  *(_BYTE *)a1 = 9;
  return result;
}

uint64_t cmp_read_fixext16_marker(_BYTE *a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v5);
  if ((_DWORD)result)
  {
    if (v5 == 26)
    {
      *a2 = v6;
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_fixext16(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  if (!cmp_read_object(a1, (uint64_t)&v7))
    return 0;
  if (v7 != 26)
  {
    *(_BYTE *)a1 = 13;
    return 0;
  }
  *a2 = v8;
  if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, 16) & 1) != 0)
    return 1;
  result = 0;
  *(_BYTE *)a1 = 9;
  return result;
}

uint64_t cmp_read_ext8_marker(_BYTE *a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if ((_DWORD)result)
  {
    if (v7 == 9)
    {
      *a2 = v8;
      *a3 = BYTE4(v8);
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_ext8(uint64_t a1, _BYTE *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t result;

  result = cmp_read_ext8_marker((_BYTE *)a1, a2, a3);
  if ((_DWORD)result)
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 16))(a1, a4, *a3) & 1) != 0)
    {
      return 1;
    }
    else
    {
      result = 0;
      *(_BYTE *)a1 = 9;
    }
  }
  return result;
}

uint64_t cmp_read_ext16_marker(_BYTE *a1, _BYTE *a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if ((_DWORD)result)
  {
    if (v7 == 10)
    {
      *a2 = v8;
      *a3 = WORD2(v8);
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_ext16(uint64_t a1, _BYTE *a2, _WORD *a3, uint64_t a4)
{
  uint64_t result;

  result = cmp_read_ext16_marker((_BYTE *)a1, a2, a3);
  if ((_DWORD)result)
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 16))(a1, a4, (unsigned __int16)*a3) & 1) != 0)
    {
      return 1;
    }
    else
    {
      result = 0;
      *(_BYTE *)a1 = 9;
    }
  }
  return result;
}

uint64_t cmp_read_ext32_marker(_BYTE *a1, _BYTE *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v7);
  if ((_DWORD)result)
  {
    if (v7 == 11)
    {
      *a2 = v8;
      *a3 = HIDWORD(v8);
      return 1;
    }
    else
    {
      result = 0;
      *a1 = 13;
    }
  }
  return result;
}

uint64_t cmp_read_ext32(uint64_t a1, _BYTE *a2, _DWORD *a3, uint64_t a4)
{
  uint64_t result;

  result = cmp_read_ext32_marker((_BYTE *)a1, a2, a3);
  if ((_DWORD)result)
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 16))(a1, a4, *a3) & 1) != 0)
    {
      return 1;
    }
    else
    {
      result = 0;
      *(_BYTE *)a1 = 9;
    }
  }
  return result;
}

uint64_t cmp_read_ext_marker(_BYTE *a1, _BYTE *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  result = cmp_read_object((uint64_t)a1, (uint64_t)&v8);
  if ((_DWORD)result)
  {
    if (v8 > 0x1Au || ((1 << v8) & 0x7C00E00) == 0)
    {
      result = 0;
      *a1 = 13;
    }
    else
    {
      *a2 = v9;
      *a3 = HIDWORD(v9);
      return 1;
    }
  }
  return result;
}

uint64_t cmp_read_ext(uint64_t a1, _BYTE *a2, _DWORD *a3, uint64_t a4)
{
  uint64_t result;

  result = cmp_read_ext_marker((_BYTE *)a1, a2, a3);
  if ((_DWORD)result)
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 16))(a1, a4, *a3) & 1) != 0)
    {
      return 1;
    }
    else
    {
      result = 0;
      *(_BYTE *)a1 = 9;
    }
  }
  return result;
}

void sub_1AF814244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF8145DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF814788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF8149E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF814B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF814C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF814D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF814E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF814F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF815128(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF815230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF815378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF8154DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF815D30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t _UABRCopyDocumentURLForUbiquitousBookmarkData(const __CFString *a1, __CFError **a2)
{
  if (softLinkBRCopyDocumentURLForUbiquitousBookmarkData)
    return softLinkBRCopyDocumentURLForUbiquitousBookmarkData(a1, a2);
  else
    return 0;
}

uint64_t _UABRCopyUbiquitousBookmarkDataForDocumentAtURL(const __CFURL *a1, __CFError **a2)
{
  if (softLinkBRCopyUbiquitousBookmarkDataForDocumentAtURL)
    return softLinkBRCopyUbiquitousBookmarkDataForDocumentAtURL(a1, a2);
  else
    return 0;
}

void *_UABRCloudDocsErrorDomain()
{
  void *v0;

  getBRCloudDocsErrorDomain();
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  return v0;
}

uint64_t (*initBRCopyDocumentURLForUbiquitousBookmarkData(const __CFString *a1, __CFError **a2))(const __CFString *, __CFError **)
{
  void *v4;
  uint64_t (*result)(const __CFString *, __CFError **);

  v4 = (void *)CloudDocsLibrary(void)::frameworkLibrary;
  if (!CloudDocsLibrary(void)::frameworkLibrary)
  {
    v4 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
    CloudDocsLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  result = (uint64_t (*)(const __CFString *, __CFError **))dlsym(v4, "BRCopyDocumentURLForUbiquitousBookmarkData");
  softLinkBRCopyDocumentURLForUbiquitousBookmarkData = result;
  if (result)
    return (uint64_t (*)(const __CFString *, __CFError **))result(a1, a2);
  return result;
}

uint64_t (*initBRCopyUbiquitousBookmarkDataForDocumentAtURL(const __CFURL *a1, __CFError **a2))(const __CFURL *, __CFError **)
{
  void *v4;
  uint64_t (*result)(const __CFURL *, __CFError **);

  v4 = (void *)CloudDocsLibrary(void)::frameworkLibrary;
  if (!CloudDocsLibrary(void)::frameworkLibrary)
  {
    v4 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
    CloudDocsLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  result = (uint64_t (*)(const __CFURL *, __CFError **))dlsym(v4, "BRCopyUbiquitousBookmarkDataForDocumentAtURL");
  softLinkBRCopyUbiquitousBookmarkDataForDocumentAtURL = result;
  if (result)
    return (uint64_t (*)(const __CFURL *, __CFError **))result(a1, a2);
  return result;
}

id initBRCloudDocsErrorDomain(void)
{
  void *v0;
  id *v1;

  v0 = (void *)CloudDocsLibrary(void)::frameworkLibrary;
  if (!CloudDocsLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
    CloudDocsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  v1 = (id *)dlsym(v0, "BRCloudDocsErrorDomain");
  objc_storeStrong((id *)&constantBRCloudDocsErrorDomain, *v1);
  getBRCloudDocsErrorDomain = (uint64_t (*)(void))BRCloudDocsErrorDomainFunction;
  return (id)constantBRCloudDocsErrorDomain;
}

id BRCloudDocsErrorDomainFunction(void)
{
  return (id)constantBRCloudDocsErrorDomain;
}

id UASharedPasteboardManagerServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYPASTEBOARD", CFSTR("com.apple.coreservices.uasharedpasteboardmanager.xpc"));
}

id UASharedPasteboardAUXServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYPASTEBOARDAUX", CFSTR("com.apple.coreservices.uasharedpasteboardaux.xpc"));
}

id UASharedPasteboardControllServiceName()
{
  return stringFromEnvWithDefault("_UAUSERACTIVITYPASTEBOARDAUX", CFSTR("com.apple.coreservices.uasharedpasteboardcontroll.xpc"));
}

id _UAGetSharedPasteboardManagerProtocolInterface()
{
  if (_UAGetSharedPasteboardManagerProtocolInterface_once != -1)
    dispatch_once(&_UAGetSharedPasteboardManagerProtocolInterface_once, &__block_literal_global_145);
  return (id)_UAGetSharedPasteboardManagerProtocolInterface_result;
}

id _UAGetSharedPasteboardManagerResponseProtocolInterface()
{
  if (_UAGetSharedPasteboardManagerResponseProtocolInterface_once != -1)
    dispatch_once(&_UAGetSharedPasteboardManagerResponseProtocolInterface_once, &__block_literal_global_165);
  return (id)_UAGetSharedPasteboardManagerResponseProtocolInterface_result;
}

id _UAGetSharedPasteboardAUXProtocolInterface()
{
  if (_UAGetSharedPasteboardAUXProtocolInterface_once != -1)
    dispatch_once(&_UAGetSharedPasteboardAUXProtocolInterface_once, &__block_literal_global_174);
  return (id)_UAGetSharedPasteboardAUXProtocolInterface_result;
}

id _UAGetSharedPasteboardControllProtocolInterface()
{
  if (_UAGetSharedPasteboardControllProtocolInterface_once != -1)
    dispatch_once(&_UAGetSharedPasteboardControllProtocolInterface_once, &__block_literal_global_176);
  return (id)_UAGetSharedPasteboardControllProtocolInterface_result;
}

BOOL isEarlierThan(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (v4)
      v6 = objc_msgSend(v3, "compare:", v4) == -1;
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_1AF818214(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL isEarlierThanNow(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = isEarlierThan(v1, v2);

  return v3;
}

void sub_1AF818280(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL isLaterThan(void *a1, void *a2)
{
  return !isEarlierThan(a1, a2);
}

BOOL isLaterThanNow(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = !isEarlierThan(v1, v2);

  return v3;
}

void sub_1AF81830C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id teamIDFromApplicationIdentifier(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  v2 = v1;
  if (v1 && (unint64_t)objc_msgSend(v1, "length") >= 0xB)
  {
    v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("."));
    v4 = 0;
    if (v5 == 1 && v3 == 10)
    {
      objc_msgSend(v2, "substringToIndex:", 10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1AF8183A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id trimmedDataString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1 && (unint64_t)objc_msgSend(v1, "length") >= 0x41)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v2), "bytes"), 64, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void sub_1AF818450(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__CFString *timeoutStr(double a1)
{
  if (a1 >= 1.0e98)
    return CFSTR("forever");
  if (a1 <= 0.0)
    return CFSTR("now");
  if (a1 >= 300.0)
  {
    if (a1 >= 3600.0)
    {
      if (a1 >= 86400.0)
      {
        if (a1 >= 7776000.0)
          return CFSTR("a long time");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("roughly %ld days"), 3600 * ((uint64_t)a1 / 24));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("roughly %ld hours"), (uint64_t)a1 / 3600);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("roughly %ld minutes"), (uint64_t)a1 / 60);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld seconds"), (uint64_t)a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *dispatchTimeStr(unint64_t a1)
{
  dispatch_time_t v2;
  double v3;
  __CFString *v4;
  void *v6;
  void *v7;

  if (a1 == -1)
  {
    v4 = CFSTR("forever");
  }
  else if (a1 && (v2 = dispatch_time(0, 0), v2 <= a1) && (v3 = ((double)a1 - (double)v2) / 1000000000.0, v3 > 0.0))
  {
    if (v3 >= 10.0)
    {
      if (v3 >= 30.0)
      {
        if (v3 >= 300.0)
        {
          if (v3 >= 3600.0)
          {
            v6 = (void *)MEMORY[0x1E0CB3940];
            if (v3 >= 86400.0)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
              v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

              return v4;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("roughly %2ld hours"), (uint64_t)(v3 / 60.0) / 24);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("roughly %2ld minutes"), (uint64_t)v3 / 60);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%3ld seconds"), (uint64_t)v3);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%2ld seconds"), (uint64_t)v3);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%2.1g seconds"), *(_QWORD *)&v3);
    }
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("now");
  }
  return v4;
}

void sub_1AF818798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL isSuggestedActionTypeAdvertiseable(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

double currentAbsoluteTime()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  double result;
  double v5;
  mach_timebase_info info;

  v0 = mach_absolute_time();
  if (!v0)
    return NAN;
  v1 = v0;
  info = 0;
  if (mach_timebase_info(&info))
    return NAN;
  LODWORD(v2) = info.numer;
  LODWORD(v3) = info.denom;
  result = (double)v1 * (double)v2 / (double)v3 / 1000000000.0;
  v5 = fabs(result);
  if (result < 0.0 || v5 == INFINITY)
    return NAN;
  return result;
}

uint64_t applicationProxyCanHandleWebBrowserContinuation(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  v2 = v1;
  if (v1
    && (objc_msgSend(v1, "appState"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isInstalled"),
        v3,
        v2,
        v4))
  {
    objc_msgSend(v2, "activityTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "containsObject:", CFSTR("NSUserActivityTypeBrowsingWeb"));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1AF8188D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

id applicationProxyForWebBrowserSupportingContinuation()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v9;

  v0 = objc_alloc(MEMORY[0x1E0CA58A8]);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https:"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v2 = (void *)objc_msgSend(v0, "initWithURL:error:", v1, &v9);
  v3 = v9;

  if (!v2)
    goto LABEL_6;
  objc_msgSend(v2, "bundleRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v2, "bundleRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "compatibilityObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
  if ((applicationProxyCanHandleWebBrowserContinuation(v7) & 1) == 0)
  {

LABEL_6:
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilesafari"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void sub_1AF818A2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id userActivityInfoOptionsDictionaryString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    goto LABEL_20;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v1, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    v6 = *MEMORY[0x1E0CA59E8];
    v14 = *MEMORY[0x1E0CA59F0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqual:", v6))
        {
          objc_msgSend(v1, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR("fileProvider:%@"), v9);
        }
        else if (objc_msgSend(v8, "isEqual:", v14))
        {
          objc_msgSend(v1, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR("unsyncronizedCloudDocs:%@"), v9);
        }
        else if (objc_msgSend(v8, "isEqual:", CFSTR("UAUserActivityContainsCloudDocsKey")))
        {
          objc_msgSend(v1, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR("cloudDocs:%@"), v9);
        }
        else if (objc_msgSend(v8, "isEqual:", CFSTR("UAUserActivityItemIsNotActiveKey")))
        {
          objc_msgSend(v1, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR("inactive:%@"), v9);
        }
        else
        {
          objc_msgSend(v1, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "description");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          stringRemovingNewlines(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR("%@=%@"), v8, v11);

        }
      }
      v3 = obj;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "appendFormat:", CFSTR("}"));
  if (v2)
  {
    v12 = (void *)objc_msgSend(v2, "copy");

  }
  else
  {
LABEL_20:
    v12 = 0;
  }

  return v12;
}

void sub_1AF818D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AF819260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF819750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;

  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_1AF819B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_1AF819D64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF81A518(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF81ACA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF81B510(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF81BE58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF81C744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF81D0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF81DE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF81E8B8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1AF81F788(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1AF81F9DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AF81FEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF82061C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  void *v9;
  id v11;
  NSObject *v12;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(exc_buf);
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LODWORD(a9) = 138543362;
      *(_QWORD *)((char *)&a9 + 4) = v11;
      _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_FAULT, "Exception accessing data file: %{public}@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1AF8205C0);
  }
  objc_sync_exit(v9);
  _Unwind_Resume(exc_buf);
}

void sub_1AF8209D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF82104C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF823140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF825068(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __dTraceProcessIdentifier_block_invoke()
{
  void *v0;
  __CFString *v1;
  uint64_t v2;
  __CFString *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PID:%lld]"), getpid());
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
      v1 = (__CFString *)v2;
    else
      v1 = CFSTR("unknown");
  }
  v3 = objc_retainAutorelease(v1);
  dTraceProcessIdentifier_result = (uint64_t)strdup((const char *)-[__CFString UTF8String](v3, "UTF8String"));

}

BOOL rateLimitTenPercent(int a1, int a2)
{
  return a1 == 1
      || (int)((double)(a1 - 1) / (double)a2 * 10.0) % 10 != (int)((double)a1 / (double)a2 * 10.0) % 10
      || a1 == a2;
}

void sub_1AF826630(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t _UACheckEntitlementForSecTask(__SecTask *a1, const __CFString *a2)
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  const __CFNumber *v4;
  uint64_t Value;
  uint64_t valuePtr;

  if (!a1)
    return 0;
  v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(a1, a2, 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (const __CFNumber *)CFGetTypeID(v2);
  if (v4 == (const __CFNumber *)CFBooleanGetTypeID())
  {
    Value = CFBooleanGetValue(v3);
  }
  else if (v4 == (const __CFNumber *)CFNumberGetTypeID())
  {
    valuePtr = 0;
    CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
    Value = valuePtr != 0;
  }
  else
  {
    Value = 0;
  }
  CFRelease(v3);
  return Value;
}

uint64_t _UAGetAuditTokenForSelf(void)
{
  if (_UAGetAuditTokenForSelf(void)::once != -1)
    dispatch_once(&_UAGetAuditTokenForSelf(void)::once, &__block_literal_global_9);
  return _UAGetAuditTokenForSelf(void)::result;
}

double ___Z23_UAGetAuditTokenForSelfv_block_invoke()
{
  kern_return_t v0;
  double result;
  _OWORD *v2;
  __int128 v3;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v6;

  task_info_outCnt = 8;
  v0 = task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt);
  if (v0)
  {
    syslog(3, "failed to get audit token for current process: %llx", v0);
  }
  else
  {
    v2 = (_OWORD *)operator new();
    result = *(double *)task_info_out;
    v3 = v6;
    *v2 = *(_OWORD *)task_info_out;
    v2[1] = v3;
    _UAGetAuditTokenForSelf(void)::result = (uint64_t)v2;
  }
  return result;
}

uint64_t _UAIsAuditTokenSandboxed(uint64_t result, BOOL *a2)
{
  if (result)
  {
    result = sandbox_check_by_audit_token();
    if (a2)
      *a2 = (_DWORD)result != 0;
  }
  return result;
}

__CFString *_UACopyCodeSigningIdentifierForAuditToken(_OWORD *a1)
{
  const __CFAllocator *v1;
  __int128 v2;
  __SecTask *v3;
  __SecTask *v4;
  __CFString *v5;
  audit_token_t v7;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = a1[1];
  *(_OWORD *)v7.val = *a1;
  *(_OWORD *)&v7.val[4] = v2;
  v3 = SecTaskCreateWithAuditToken(v1, &v7);
  v4 = v3;
  if (!v3)
    return (__CFString *)0;
  v5 = (__CFString *)SecTaskCopySigningIdentifier(v3, 0);
  CFRelease(v4);
  return v5;
}

void sub_1AF827AB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AF8284BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF828E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF829E80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF829F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF82A230(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF82A310(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *UAResumableActivitiesManagerServiceName()
{
  char *v0;
  __CFString *v1;

  v0 = getenv("_UAUSERACTIVITYADMIN");
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v0, 4);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("com.apple.coreservices.lsuseractivityadministration.xpc");
  }
  return v1;
}

id _LSGetResumableActivitiesAdministrativeProtocolInterface()
{
  if (_LSGetResumableActivitiesAdministrativeProtocolInterface_once != -1)
    dispatch_once(&_LSGetResumableActivitiesAdministrativeProtocolInterface_once, &__block_literal_global_12);
  return (id)_LSGetResumableActivitiesAdministrativeProtocolInterface_result;
}

id _LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface()
{
  if (_LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface_once != -1)
    dispatch_once(&_LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface_once, &__block_literal_global_111);
  return (id)_LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface_result;
}

CFDataRef _UACopyPackedDataForObject(void *a1, uint64_t a2)
{
  return UAMessagePack::CopyPacked(a1, a2, 0, 0);
}

CFTypeRef _UACopyUnpackedObjectFromDataWithSubstitution(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  CFTypeRef v12;

  v9 = a4;
  v10 = a5;
  v11 = UAMessageUnpack::CopyUnpacked(a1, a2, a3, v9, v10);
  if (v11)
    v12 = CFRetain(v11);
  else
    v12 = 0;

  return v12;
}

void sub_1AF82B0DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t UAMessagePack::mp_reader()
{
  return 0;
}

void UAMessagePack::~UAMessagePack(id *this)
{

}

uint64_t UAMessageUnpack::mp_writer()
{
  return 0;
}

id UAMessageUnpack::readFromContextOfClass(UAMessageUnpack *this, objc_class *a2)
{
  void *v3;

  UAMessageUnpack::readFromContext(this);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (!a2 || (objc_opt_isKindOfClass() & 1) == 0))
  {

    v3 = 0;
  }
  return v3;
}

void sub_1AF82B184(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98648](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
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

uint64_t _LSCopyAdvertisementStringForTeamIdentifierAndActivityType()
{
  return MEMORY[0x1E0CA59B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator new()
{
  return off_1E6006130();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
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

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  return (void *)MEMORY[0x1E0C84DA0](a1);
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  return MEMORY[0x1E0C84DA8](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}


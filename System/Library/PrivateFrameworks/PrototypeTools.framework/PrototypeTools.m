id PTLogObjectForTopic(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (PTLogObjectForTopic_onceToken != -1)
    dispatch_once(&PTLogObjectForTopic_onceToken, &__block_literal_global_5);
  v2 = (void *)PTLogObjectForTopic___logObjects;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _NSStringFromRuntimeString(const char *a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a1, strlen(a1), 4, 0);
}

uint64_t PTInstallIsAppleInternal()
{
  if (PTInstallIsAppleInternal_onceToken != -1)
    dispatch_once(&PTInstallIsAppleInternal_onceToken, &__block_literal_global_4);
  return PTInstallIsAppleInternal_isAppleInternal;
}

void _handlePrototypingIsActiveNotification(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___handlePrototypingIsActiveNotification_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void sub_1B9677748(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, int a12, __int16 a13, __int16 a14, void *a15)
{
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v22 = v16;
  if (a2 == 1)
  {
    v17 = objc_begin_catch(a1);
    PTLogObjectForTopic(1);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v15 + 32), "_domainID");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(v15 + 40);
      objc_msgSend(v17, "reason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412802;
      *(_QWORD *)((char *)&buf + 4) = v19;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v20;
      a14 = 2112;
      a15 = v21;
      _os_log_impl(&dword_1B966F000, v18, OS_LOG_TYPE_DEFAULT, "Domain %@: can't invoke outlet at keypath %@ (%@)", (uint8_t *)&buf, 0x20u);

    }
    objc_end_catch();
    JUMPOUT(0x1B9677708);
  }
  _Unwind_Resume(a1);
}

void sub_1B9678688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ___handlePrototypingIsActiveNotification_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerWithServerIfNecessary");
}

uint64_t OUTLINED_FUNCTION_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return objc_opt_class();
}

void PTTransactionBegin(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  _TransactionQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PTTransactionBegin_block_invoke;
  block[3] = &unk_1E7058228;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

id _TransactionQueue()
{
  if (_TransactionQueue_onceToken != -1)
    dispatch_once(&_TransactionQueue_onceToken, &__block_literal_global_2);
  return (id)_TransactionQueue___queue;
}

id _TransactionsByReason()
{
  if (_TransactionsByReason_onceToken != -1)
    dispatch_once(&_TransactionsByReason_onceToken, &__block_literal_global_2);
  return (id)_TransactionsByReason___transactions;
}

void PTTransactionEnd(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  _TransactionQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PTTransactionEnd_block_invoke;
  block[3] = &unk_1E7058228;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

uint64_t PTDebugServerInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF22F798);
}

void PTDisableFileProtection(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3620];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB2AD8];
  v6[0] = *MEMORY[0x1E0CB2AE0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributes:ofItemAtPath:error:", v4, v2, 0);

}

id PTHomeDirectory()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;

  NSHomeDirectoryForUser(CFSTR("mobile"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v2 = v0;
  }
  else
  {
    NSHomeDirectory();
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

id PTPrototypeDirectory()
{
  if (PTPrototypeDirectory_onceToken != -1)
    dispatch_once(&PTPrototypeDirectory_onceToken, &__block_literal_global_3);
  return (id)PTPrototypeDirectory___path;
}

BOOL PTEqualFloats(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.00000011920929;
}

uint64_t PTObjectIsRecursivelyPlistable(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "bs_isPlistableType"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v2 = v1;
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v17 != v5)
              objc_enumerationMutation(v2);
            if (!PTObjectIsRecursivelyPlistable(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)))
            {

LABEL_26:
              goto LABEL_27;
            }
          }
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v4)
            continue;
          break;
        }
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v1;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v2, "allKeys", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j);
            objc_msgSend(v2, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!PTObjectIsRecursivelyPlistable(v12)
              || !PTObjectIsRecursivelyPlistable(v13))
            {

              goto LABEL_26;
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
    v14 = 1;
  }
  else
  {
LABEL_27:
    v14 = 0;
  }

  return v14;
}

id PTPlistableClasses()
{
  if (PTPlistableClasses_onceToken != -1)
    dispatch_once(&PTPlistableClasses_onceToken, &__block_literal_global_26);
  return (id)PTPlistableClasses_classes;
}

uint64_t PTValidateDictionary(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v2, "objectForKeyedSubscript:", v7, (_QWORD)v12);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
              continue;
          }
          v10 = 0;
          goto LABEL_15;
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v10 = 1;
        if (v4)
          continue;
        break;
      }
    }
    else
    {
      v10 = 1;
    }
LABEL_15:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t PTValidateArray(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
    v7 = 1;
LABEL_13:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t PTValidateSet(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
    v7 = 1;
LABEL_13:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t PTValidatePredicate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  void *v6;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v4 = 0;
    goto LABEL_5;
  }
  if (!objc_msgSend(v1, "_allowsEvaluation"))
  {
    +[_PTPredicateValidator validatorWithPredicate:]((uint64_t)_PTPredicateValidator, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[_PTPredicateValidator evaluate]((uint64_t)v3);

LABEL_5:
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("predicate has already enabled evaluation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    PTValidatePredicate_cold_1((uint64_t)v6);
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t PTRowClassIsWhitelistedForRemoteEditing(void *a1)
{
  if (_RowWhitelist_onceToken != -1)
    dispatch_once(&_RowWhitelist_onceToken, &__block_literal_global_45);
  return _ClassIsCodableAndWhitelisted(a1, (void *)_RowWhitelist_whitelist);
}

uint64_t _ClassIsCodableAndWhitelisted(void *a1, void *a2)
{
  int v3;
  unsigned int v4;
  char v5;
  uint64_t result;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "containsObject:", a1);
  v4 = objc_msgSend(a1, "conformsToProtocol:", &unk_1EF22C3E0);
  v5 = v4;
  result = v3 & v4;
  if (v3 && (v5 & 1) == 0)
  {
    PTLogObjectForTopic(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = a1;
      _os_log_impl(&dword_1B966F000, v7, OS_LOG_TYPE_DEFAULT, "%@ is whitelisted for remote editing, but does not conform to NSSecureCoding", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
  return result;
}

uint64_t PTRowActionClassIsWhitelistedForRemoteEditing(void *a1)
{
  if (_RowActionWhitelist_onceToken != -1)
    dispatch_once(&_RowActionWhitelist_onceToken, &__block_literal_global_53);
  return _ClassIsCodableAndWhitelisted(a1, (void *)_RowActionWhitelist_whitelist);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

__CFString *PTPrototypingEventName(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E7058440[a1];
}

__CFString *PTPrototypingEventShortName(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E7058460[a1];
}

uint64_t PTPrototypingEventAvailable(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (PTPrototypingEventAvailable_onceToken != -1)
    dispatch_once(&PTPrototypingEventAvailable_onceToken, &__block_literal_global_6);
  v2 = (void *)PTPrototypingEventAvailable___availableEvents;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void PTPrototypingEnumerateHardwareEventsWithBlock(void *a1)
{
  void (**v1)(id, uint64_t, _BYTE *);
  char v2;

  v1 = a1;
  v2 = 0;
  v1[2](v1, 1, &v2);
  if (!v2)
  {
    v1[2](v1, 2, &v2);
    if (!v2)
      v1[2](v1, 3, &v2);
  }

}

__CFString *PTPrototypingEventsDescription(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v1 = a1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __PTPrototypingEventsDescription_block_invoke;
  v15[3] = &unk_1E70583F8;
  v3 = v1;
  v16 = v3;
  v17 = &v18;
  PTPrototypingEnumerateHardwareEventsWithBlock(v15);
  if (v19[3])
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v14 = 0;
    v14 = v19[3];
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __PTPrototypingEventsDescription_block_invoke_2;
    v9[3] = &unk_1E7058420;
    v10 = v3;
    v5 = v4;
    v11 = v5;
    v12 = v13;
    PTPrototypingEnumerateHardwareEventsWithBlock(v9);
    v6 = v11;
    v7 = (__CFString *)v5;

    _Block_object_dispose(v13, 8);
  }
  else
  {
    v7 = CFSTR("no events");
  }

  _Block_object_dispose(&v18, 8);
  return v7;
}

void sub_1B967CEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id _ParameterRecordsPath()
{
  void *v0;
  void *v1;

  PTPrototypeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("ParameterRecords.archive"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1B9680AAC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id _ProxyDefinitionDirectory()
{
  if (_ProxyDefinitionDirectory_onceToken != -1)
    dispatch_once(&_ProxyDefinitionDirectory_onceToken, &__block_literal_global_8);
  return (id)_ProxyDefinitionDirectory___path;
}

id _SettingsArchiveDirectory()
{
  if (_SettingsArchiveDirectory_onceToken != -1)
    dispatch_once(&_SettingsArchiveDirectory_onceToken, &__block_literal_global_5);
  return (id)_SettingsArchiveDirectory___path;
}

id _DomainInfoPath()
{
  void *v0;
  void *v1;

  PTPrototypeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("DomainInfo.archive"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id _TestRecipeInfoPath()
{
  void *v0;
  void *v1;

  PTPrototypeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("TestRecipeInfo.archive"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id _ProxyDefinitionPath(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "stringByAppendingPathExtension:", CFSTR("archive"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _ProxyDefinitionDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _SettingsArchivePath(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "stringByAppendingPathExtension:", CFSTR("settings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _SettingsArchiveDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void _ValidateUnarchivedDictionary(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  _QWORD v6[6];

  v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("Dictionary validation failed: putative dictionary is a %@"), objc_opt_class());
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___ValidateUnarchivedDictionary_block_invoke;
  v6[3] = &__block_descriptor_48_e15_v32__0_8_16_B24lu32l8u40l8;
  v6[4] = a2;
  v6[5] = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

id _ReadInfo(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    PTLogObjectForTopic(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v21;
      _os_log_impl(&dword_1B966F000, v17, OS_LOG_TYPE_DEFAULT, "No persisted %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), a2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v12, v6, &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;
  if (!v13)
  {
    PTLogObjectForTopic(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v21;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1B966F000, v18, OS_LOG_TYPE_DEFAULT, "Error unarchiving persisted %@: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeItemAtPath:error:", v5, 0);

LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v15 = objc_opt_class();
  _ValidateUnarchivedDictionary(v13, v15, a2);

  v16 = (void *)objc_msgSend(v13, "mutableCopy");
LABEL_11:

  return v16;
}

void sub_1B9681334(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf)
{
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;

  if (a2 == 1)
  {
    v18 = objc_begin_catch(a1);
    PTLogObjectForTopic(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412546;
      *(_QWORD *)((char *)&buf + 4) = a15;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v18;
      _os_log_impl(&dword_1B966F000, v19, OS_LOG_TYPE_DEFAULT, "Error reading persisted %@: %@@", (uint8_t *)&buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeItemAtPath:error:", v17, 0);

    objc_end_catch();
    JUMPOUT(0x1B96812D0);
  }
  _Unwind_Resume(a1);
}

id _PTReadDomainInfo()
{
  void *v0;
  uint64_t v1;
  void *v2;

  _DomainInfoPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  _ReadInfo(v0, v1, CFSTR("domain info"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void _PTWriteDomainInfo(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v10;
  if (!v1)
    goto LABEL_3;
  _DomainInfoPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  v4 = objc_msgSend(v1, "writeToFile:options:error:", v3, 1, &v9);
  v5 = v9;

  v2 = v5;
  if ((v4 & 1) == 0)
  {
LABEL_3:
    PTLogObjectForTopic(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      _DomainInfoPath();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1B966F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to write domain dictionary to file %@: %@", buf, 0x16u);

    }
  }

}

id _PTReadTestRecipeInfo()
{
  void *v0;
  uint64_t v1;
  void *v2;

  _TestRecipeInfoPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  _ReadInfo(v0, v1, CFSTR("test recipe info"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void _PTWriteTestRecipeInfo(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v10;
  if (!v1)
    goto LABEL_3;
  _DomainInfoPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  v4 = objc_msgSend(v1, "writeToFile:options:error:", v3, 1, &v9);
  v5 = v9;

  v2 = v5;
  if ((v4 & 1) == 0)
  {
LABEL_3:
    PTLogObjectForTopic(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      _DomainInfoPath();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1B966F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to write test recipe dictionary to file %@: %@", buf, 0x16u);

    }
  }

}

id _PTReadSettingsProxyDefinition(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ProxyDefinitionPath(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v1, 0, &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v11;
  if (v2)
  {
    v10 = v3;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v10);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v10;

    if (v4)
    {
      v4 = v4;
      v6 = v4;
    }
    else
    {
      PTLogObjectForTopic(2);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v5;
        _os_log_impl(&dword_1B966F000, v7, OS_LOG_TYPE_DEFAULT, "Error unarchiving persisted proxy definition: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeItemAtPath:error:", v1, 0);

      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v1, 0);
    v6 = 0;
    v5 = v3;
  }

  return v6;
}

void _PTWriteSettingsProxyDefinition(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v4)
  {
    _ProxyDefinitionPath(v3);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeToFile:atomically:", v6, 1);
  }
  else
  {
    PTLogObjectForTopic(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1B966F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to archive proxy definition: %@", buf, 0xCu);
    }
  }

}

id _PTReadSettingsArchive(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _SettingsArchivePath(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v1, 0, &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v12;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v1, 0);
    v6 = 0;
    v5 = v3;
    goto LABEL_11;
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 1, 0, &v11);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v11;

  if (!v4)
  {
    PTLogObjectForTopic(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v1;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1B966F000, v7, OS_LOG_TYPE_DEFAULT, "Unable to deserialize settings archive at path %@: %@", buf, 0x16u);

    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PTLogObjectForTopic(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v1;
      _os_log_impl(&dword_1B966F000, v7, OS_LOG_TYPE_DEFAULT, "Non-dictionary archive at path %@", buf, 0xCu);
    }
LABEL_10:

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtPath:error:", v1, 0);

    v6 = 0;
    goto LABEL_11;
  }
  v4 = v4;
  v6 = v4;
LABEL_11:

  return v6;
}

void _PTWriteSettingsArchive(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a1, 200, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v4)
  {
    _SettingsArchivePath(v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v12 = v5;
    v7 = objc_msgSend(v4, "writeToFile:options:error:", v6, 1, &v12);
    v8 = v12;

    if ((v7 & 1) == 0)
    {
      PTLogObjectForTopic(2);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1B966F000, v9, OS_LOG_TYPE_DEFAULT, "Unable to write settings archive data to path %@: %@", buf, 0x16u);

      }
    }
  }
  else
  {
    PTLogObjectForTopic(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1B966F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to serialize settings archive for domain %@: %@", buf, 0x16u);

    }
    v8 = v5;
  }

}

void _PTClearSettingsArchive(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0CB3620];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SettingsArchivePath(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);
}

void _PTMigrateIfNecessary()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[PTDefaults sharedInstance](PTDefaults, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "shouldClearPrototypeCachesForMigration"))
  {
    objc_msgSend(v0, "setShouldClearPrototypeCachesForMigration:", 0);
    _DomainInfoPath();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeItemAtPath:error:", v2, 0);

    _TestRecipeInfoPath();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeItemAtPath:error:", v3, 0);

  }
  if (objc_msgSend(v0, "shouldClearSettingsArchivesForMigration"))
  {
    objc_msgSend(v0, "setShouldClearSettingsArchivesForMigration:", 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    _SettingsArchiveDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "contentsOfDirectoryAtPath:error:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
          _SettingsArchiveDirectory();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "removeItemAtPath:error:", v12, 0);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
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

void sub_1B9685CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B968626C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t PTDomainServerInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF22F5B0);
}

uint64_t PTDomainClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF22D640);
}

void PTValidatePredicate_cold_1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL PTValidatePredicate(NSPredicate *__strong)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("PTUtilities.m");
  v7 = 1024;
  v8 = 196;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_1B966F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1E0CD23C8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8068](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE8090](proto, outCount);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}


void sub_21E501058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_21E501B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

SBKGenericKeyValuePair *SBKKeyValuePayloadPairWithPreferredClass(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SBKGenericKeyValuePair *v7;
  SBKGenericKeyValuePair *v8;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(a1, "pairWithKVSKey:kvsPayload:", v6, v5);
    v7 = (SBKGenericKeyValuePair *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a3;
    v6 = a2;
    v7 = -[SBKGenericKeyValuePair initWithKVSKey:kvsPayload:]([SBKGenericKeyValuePair alloc], "initWithKVSKey:kvsPayload:", v6, v5);
  }
  v8 = v7;

  return v8;
}

void sub_21E502B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_21E502DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E502F94(_Unwind_Exception *exception_object, int a2)
{
  void *v2;

  if (a2)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_21E503188(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id shortArrayDescription(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = (objc_class *)MEMORY[0x24BDD16A8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithCapacity:", 32 * objc_msgSend(v2, "count"));
  objc_msgSend(v3, "appendString:", CFSTR("("));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __shortArrayDescription_block_invoke;
  v6[3] = &unk_24E2A7920;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  objc_msgSend(v4, "appendString:", CFSTR(")"));
  return v4;
}

void __shortArrayDescription_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  if (a3)
    v5 = CFSTR(", ");
  else
    v5 = CFSTR(" ");
  v6 = a2;
  objc_msgSend(v4, "appendString:", v5);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "description");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendString:", v8);
}

id ErrorInfoWithUnderlyingError(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a1;
  v4 = a2;
  if (v4
    && (v5 = *MEMORY[0x24BDD1398],
        objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD1398]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    if (v3)
      v8 = (id)objc_msgSend(v3, "mutableCopy");
    else
      v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = v8;
    objc_msgSend(v8, "setObject:forKey:", v4, v5);
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

id NSStringFromErrorCode(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1 > -2009)
  {
    switch(a1)
    {
      case -2008:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeKeyBagLoadFailure");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294965288;
        break;
      case -2007:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeKeyBagKillSwitch");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294965289;
        break;
      case -2006:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeDisabled");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294965290;
        break;
      case -2005:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeKillSwitch");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294965291;
        break;
      case -2004:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeNetworkingBlocked");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294965292;
        break;
      case -2003:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeUserClamp");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294965293;
        break;
      case -2002:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeServerClamp");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294965294;
        break;
      case -2001:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeAuthenticationClamp");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294965295;
        break;
      default:
        switch(a1)
        {
          case -1008:
            v1 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeValidation");
            v2 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v2;
            v4 = 4294966288;
            break;
          case -1007:
            v1 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeGeneric");
            v2 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v2;
            v4 = 4294966289;
            break;
          case -1006:
            v1 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeStoreAccountUserCredentials");
            v2 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v2;
            v4 = 4294966290;
            break;
          case -1005:
            v1 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeStoreAccountUserCancelSignIn");
            v2 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v2;
            v4 = 4294966291;
            break;
          case -1004:
            v1 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeStoreAccountSessionExpired");
            v2 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v2;
            v4 = 4294966292;
            break;
          case -1003:
            v1 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeStoreAccountMismatch");
            v2 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v2;
            v4 = 4294966293;
            break;
          case -1002:
            v1 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeStoreAccountLoggedOut");
            v2 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v2;
            v4 = 4294966294;
            break;
          case -1001:
            v1 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeNoStoreAccount");
            v2 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v2;
            v4 = 4294966295;
            break;
          default:
            switch(a1)
            {
              case -4:
                v1 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeAuthenticationError");
                v2 = objc_claimAutoreleasedReturnValue();
                v3 = (void *)v2;
                v4 = 4294967292;
                goto LABEL_38;
              case -3:
                v1 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeGenericBookkeeperServiceError");
                v2 = objc_claimAutoreleasedReturnValue();
                v3 = (void *)v2;
                v4 = 4294967293;
                goto LABEL_38;
              case -2:
                v1 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeGenericValidationError");
                v2 = objc_claimAutoreleasedReturnValue();
                v3 = (void *)v2;
                v4 = 4294967294;
                goto LABEL_38;
              case -1:
                v1 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeUnknown");
                v2 = objc_claimAutoreleasedReturnValue();
                v3 = (void *)v2;
                v4 = 0xFFFFFFFFLL;
                goto LABEL_38;
              default:
                goto LABEL_20;
            }
        }
        break;
    }
    goto LABEL_38;
  }
  if (a1 <= -4002)
  {
    if (a1 == -4003)
    {
      v1 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeTimeout");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v2;
      v4 = 4294963293;
      goto LABEL_38;
    }
    if (a1 == -4002)
    {
      v1 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeDelegateCancelled");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v2;
      v4 = 4294963294;
      goto LABEL_38;
    }
  }
  else
  {
    switch(a1)
    {
      case -4001:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeCancelled");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294963295;
        goto LABEL_38;
      case -3002:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeMissingDomain");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294964294;
        goto LABEL_38;
      case -3001:
        v1 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SBKStoreErrorCodeMissingURL");
        v2 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v2;
        v4 = 4294964295;
LABEL_38:
        objc_msgSend(v1, "stringWithFormat:", CFSTR("Error Code = %@ (%d)"), v2, v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        return v5;
    }
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error Code = %lld"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

os_log_t _SBKLogCategoryDefault()
{
  return os_log_create("com.apple.amp.StoreBookkeeper", "Default");
}

os_log_t _SBKLogCategorySync()
{
  return os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
}

uint64_t _PreferencesDidChangeNotification(uint64_t a1, void *a2)
{
  CFPreferencesSynchronize(CFSTR("com.apple.storebookkeeper"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  return objc_msgSend(a2, "_preferencesDidChange");
}

id storageItemIdentifierForProperties(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
    goto LABEL_16;
  v8 = v7;
  v9 = *(_QWORD *)v17;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "absoluteString");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v13 = (void *)v12;

        v11 = v13;
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "stringValue");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v11, "length"))
      {

        goto LABEL_19;
      }
      objc_msgSend(v5, "appendString:", v11);

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
      continue;
    break;
  }
LABEL_16:

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "SBKStringByMD5HashingString:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_19:
    v14 = 0;
  }

  return v14;
}

id valuesForProperties(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __valuesForProperties_block_invoke;
  v10[3] = &unk_24E2A7968;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v5, "enumerateValuesForProperties:usingBlock:", v7, v10);

  return v8;
}

uint64_t __valuesForProperties_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "setObject:forKey:", a3, a2);
  return result;
}

void sub_21E50BC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E50CBE4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_21E50CE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E50CF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ErrorInfoWithUnderlyingError_848(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = a1;
  if (v1)
  {
    v2 = *MEMORY[0x24BDD1398];
    objc_msgSend(0, "objectForKey:", *MEMORY[0x24BDD1398]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = 0;
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v4, "setObject:forKey:", v1, v2);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __Block_byref_object_copy__849(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__850(uint64_t a1)
{

}

void sub_21E510858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E510BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E5127F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1149(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1150(uint64_t a1)
{

}

void SBKLogProductionKeyBag()
{
  void *v0;
  void *v1;
  id v2;

  if (SBKLogProductionKeyBag_keybag)
  {
    NSLog(CFSTR("key bag contents = \n%@\n\n"), SBKLogProductionKeyBag_keybag);
  }
  else
  {
    v0 = (void *)MEMORY[0x24BEB1FF0];
    objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "URLBagForContext:", v1);
    v2 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "loadWithCompletionBlock:", &__block_literal_global_1201);
  }
}

void sub_21E51560C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E5158B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_21E515DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1570(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x2207AF7FC](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1571(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__1762(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1763(uint64_t a1)
{

}

void ___serialGetValue_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t ___serialSetValue_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21E519254(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E5192C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SBKStoreAccount()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activeAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id SBKStoreAccountIdentifiers()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userIdentitiesForManageableAccountsWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6), "accountDSID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObject:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  v10 = (void *)objc_msgSend(v0, "copy");
  return v10;
}

id SBKStoreAccountLastSyncedIdentifier()
{
  return +[SBKStoreAuthenticationController lastSyncedAccountIdentifier](SBKStoreAuthenticationController, "lastSyncedAccountIdentifier");
}

id SBKStoreAccountLastFailedSyncIdentifier()
{
  return +[SBKStoreAuthenticationController lastFailedSyncAccountIdentifier](SBKStoreAuthenticationController, "lastFailedSyncAccountIdentifier");
}

id SBKStoreAccountIdentifierFromDatabasePath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIdentitiesForManageableAccountsWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(MEMORY[0x24BE6B1D0], "musicLibraryForUserAccount:", v8, (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "databasePath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v1);

        if ((v11 & 1) != 0)
        {
          v12 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v8, "accountDSID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A0](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC3B0](c, data, *(_QWORD *)&len);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

uint64_t ISCopyDecompressedGZipDataForData()
{
  return MEMORY[0x24BEC8AA0]();
}

uint64_t ISCopyGzippedDataForData()
{
  return MEMORY[0x24BEC8AB0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E0](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  ldiv_t result;

  v2 = MEMORY[0x24BDAEA40](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x24BDAEA88](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}


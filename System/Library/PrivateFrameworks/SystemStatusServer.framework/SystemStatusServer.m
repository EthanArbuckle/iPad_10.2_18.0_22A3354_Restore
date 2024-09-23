id STAttributedEntityResolverLocalizedStringFromTableInCFBundle(void *a1, __CFBundle *a2, void *a3, void *a4)
{
  __CFString *v7;
  __CFString *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFArrayRef v11;
  void *v12;
  void *v13;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  v10 = CFBundleCopyBundleLocalizations(a2);
  v11 = CFBundleCopyLocalizationsForPreferences(v10, v9);

  -[__CFArray firstObject](v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12 || (v13 = (void *)CFBundleCopyLocalizedStringForLocalization()) == 0)
    v13 = (void *)CFBundleCopyLocalizedString(a2, v7, v8, CFSTR("InfoPlist"));

  return v13;
}

id _STExecutableIdentityResolvedIdentityForIdentity(void *a1, int a2, int a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v5 = a1;
  v6 = v5;
  v36 = 0u;
  v37 = 0u;
  if (v5)
    objc_msgSend(v5, "auditToken");
  v7 = objc_msgSend(v6, "hasAuditToken");
  objc_msgSend(v6, "executablePath");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundlePath");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personaUniqueString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 && v7)
  {
    v34 = v36;
    v35 = v37;
    v12 = BSPIDForAuditToken();
    v13 = (void *)MEMORY[0x1E0D87D68];
    objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleForIdentifier:error:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "hostProcess");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "auditToken");
    }
    else
    {
      v38 = v34;
      v39 = v35;
    }

    v36 = v38;
    v37 = v39;
  }
  if (v7)
  {
    v38 = v36;
    v39 = v37;
    v18 = (unint64_t)BSVersionedPIDForAuditToken() < 0xFFFFFFFF00000000;
    if (v9)
      goto LABEL_18;
  }
  else
  {
    v18 = 0;
    if (v9)
      goto LABEL_18;
  }
  if (v10)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, 0);
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "path");
      v9 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
LABEL_18:
  if (v8 | v9)
    v22 = 0;
  else
    v22 = v7;
  if (v8 | v9)
    v23 = (void *)v8;
  else
    v23 = 0;
  if (v22 == 1)
  {
    if (v18)
    {
      v38 = v36;
      v39 = v37;
      BSExecutablePathForAuditToken();
    }
    else
    {
      BSPIDForAuditToken();
      BSExecutablePathForPID();
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v23)
  {
    if (!v9)
    {
      BSBundlePathForExecutablePath();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        if (a3)
        {
          v24 = objc_msgSend(v23, "rangeOfString:", CFSTR(".framework/"));
          if (v24 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v26 = 0;
            v9 = 0;
            goto LABEL_39;
          }
          objc_msgSend(v23, "substringToIndex:", v24 + v25);
          v9 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v26 = v9 != 0;
  if (!v10 && v9)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01700]), "initWithPath:", v9);
    objc_msgSend(v27, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 1;
  }
LABEL_39:
  if (v23 && !v10)
  {
    BSBundleIDForExecutablePath();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v26)
    v28 = (void *)v9;
  else
    v28 = v23;
  v29 = v28;
  if (v29)
    v30 = BSPathExistsOnSystemPartition();
  else
    v30 = 0;
  v38 = 0u;
  v39 = 0u;
  if (v18)
  {
    v38 = v36;
    v39 = v37;
  }
  else if (v6)
  {
    objc_msgSend(v6, "auditToken");
  }
  v31 = objc_alloc(MEMORY[0x1E0DB08D8]);
  v34 = v38;
  v35 = v39;
  v32 = (void *)objc_msgSend(v31, "initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:", &v34, v9, v23, v10, v11, v30);

  return v32;
}

id STSystemStatusLogTelephonyState()
{
  if (qword_1ED907F08 != -1)
    dispatch_once(&qword_1ED907F08, &__block_literal_global_4);
  return (id)_MergedGlobals_3;
}

id STSystemStatusLogServer()
{
  if (qword_1ED907EC8 != -1)
    dispatch_once(&qword_1ED907EC8, &__block_literal_global_0);
  return (id)_MergedGlobals_0;
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

id STSystemStatusLogEntityResolving()
{
  if (qword_1ED907ED8 != -1)
    dispatch_once(&qword_1ED907ED8, &__block_literal_global_1);
  return (id)_MergedGlobals_1;
}

void sub_1D02D2F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D02D3060(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D02D3A18(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
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

uint64_t STTelephonyRegistrationStatusForStatus(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v10;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_10;
  v3 = *MEMORY[0x1E0CA77B8];
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA77B8]))
  {

LABEL_5:
    v6 = 1;
    goto LABEL_14;
  }
  v4 = *MEMORY[0x1E0CA77B0];
  v5 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA77B0]);

  if ((v5 & 1) != 0)
    goto LABEL_5;
  v7 = v2;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA7788]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", v4) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", v3) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA7798]))
  {
LABEL_10:

    v8 = *MEMORY[0x1E0CA7790];
  }
  else
  {
    v8 = *MEMORY[0x1E0CA7790];
    v10 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA7790]);

    if (!v10)
    {
      v6 = 2;
      goto LABEL_14;
    }
  }
  if (objc_msgSend(v2, "isEqualToString:", v8))
    v6 = 4;
  else
    v6 = 3;
LABEL_14:

  return v6;
}

__CFString *STTelephonyCachedBooleanDebugName(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) < 4)
    return off_1E8E18890[a1 + 2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1D02D7F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  _Block_object_dispose(&a17, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D02D88FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  objc_destroyWeak((id *)(v17 - 96));
  _Unwind_Resume(a1);
}

uint64_t STTelephonyDataConnectionTypeForIndicatorNameAndRadioTechnology(int a1, int a2)
{
  int v2;
  uint64_t result;

  v2 = a1 - 1;
  result = 3;
  switch(v2)
  {
    case 0:
      if ((a2 - 3) < 3)
        result = 1;
      else
        result = 2;
      break;
    case 1:
      return result;
    case 2:
      result = 4;
      break;
    case 3:
    case 4:
      result = 5;
      break;
    case 6:
      result = 7;
      break;
    case 7:
      result = 11;
      break;
    case 12:
      result = 10;
      break;
    case 13:
      result = 8;
      break;
    case 14:
      result = 9;
      break;
    case 15:
      result = 12;
      break;
    case 16:
      result = 13;
      break;
    case 17:
      result = 14;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void sub_1D02DA4BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1D02DB448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D02DCAC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t STStatusDomainNameForEntitlementValue(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DA0]) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DA8]) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DB0]) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DB8]) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DC0]) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DC8]) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DD0]) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DD8]) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DF8]) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0E00]) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0E08]) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0E10]) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DE0]) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DE8]) & 1) != 0)
  {
    v2 = 13;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0DF0]))
  {
    v2 = 14;
  }
  else
  {
    v2 = -1;
  }

  return v2;
}

id STEntitledDomainsForEntitlementValue(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_opt_class();
  v21 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v1;
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v27 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v3, "addObject:", v10);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v7);
      }

    }
    else
    {
      v3 = 0;
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("data-access")))
        {
          objc_msgSend(v2, "addObject:", &unk_1E8E1F538);
          objc_msgSend(v2, "addObject:", &unk_1E8E1F550);
        }
        else
        {
          v17 = STStatusDomainNameForEntitlementValue(v16);
          if (v17 != -1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v18);

          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v13);
  }

  v19 = (void *)objc_msgSend(v2, "copy");
  return v19;
}

__CFString *STTelephonyDataConnectionTypeDebugName(unint64_t a1)
{
  if (a1 < 0x10)
    return *(&off_1E8E18A08 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *STTelephonyRegistrationStatusDebugName(unint64_t a1)
{
  if (a1 < 5)
    return *(&off_1E8E18A88 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *STTelephonyCallForwardingIndicatorDebugName(unint64_t a1)
{
  if (a1 < 3)
    return *(&off_1E8E18AB0 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t BSBundleIDForExecutablePath()
{
  return MEMORY[0x1E0D01108]();
}

uint64_t BSBundlePathForExecutablePath()
{
  return MEMORY[0x1E0D01118]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSExecutablePathForAuditToken()
{
  return MEMORY[0x1E0D012A8]();
}

uint64_t BSExecutablePathForPID()
{
  return MEMORY[0x1E0D012B0]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSPIDForAuditToken()
{
  return MEMORY[0x1E0D01458]();
}

uint64_t BSPathExistsOnSystemPartition()
{
  return MEMORY[0x1E0D01470]();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1E0D01670]();
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1E0C98060]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t STDefaultStatusDomainPublisherServerHandle()
{
  return MEMORY[0x1E0DB0C30]();
}

uint64_t STDefaultStatusDomainServerHandle()
{
  return MEMORY[0x1E0DB0C38]();
}

uint64_t STIsValidDataChangeContextForStatusDomain()
{
  return MEMORY[0x1E0DB0C40]();
}

uint64_t STIsValidDataForStatusDomain()
{
  return MEMORY[0x1E0DB0C48]();
}

uint64_t STIsValidDiffForStatusDomain()
{
  return MEMORY[0x1E0DB0C50]();
}

uint64_t STIsValidUserInteractionForStatusDomain()
{
  return MEMORY[0x1E0DB0C58]();
}

uint64_t STStatusDomainPublisherXPCClientInterface()
{
  return MEMORY[0x1E0DB0E28]();
}

uint64_t STStatusDomainPublisherXPCServerInterface()
{
  return MEMORY[0x1E0DB0E30]();
}

uint64_t STStatusDomainXPCClientInterface()
{
  return MEMORY[0x1E0DB0E40]();
}

uint64_t STStatusDomainXPCServerInterface()
{
  return MEMORY[0x1E0DB0E48]();
}

uint64_t STSystemStatusDescriptionForDomain()
{
  return MEMORY[0x1E0DB0EA8]();
}

uint64_t STSystemStatusIsInternalLoggingEnabled()
{
  return MEMORY[0x1E0DB0EB0]();
}

uint64_t STSystemStatusLogBundleLoading()
{
  return MEMORY[0x1E0DB0EB8]();
}

uint64_t TUISOCountryCodeForMCC()
{
  return MEMORY[0x1E0DBD650]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1E0D018D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1E0CA6F30]();
}

uint64_t _CTServerConnectionGetRadioModuleIsDead()
{
  return MEMORY[0x1E0CA6FC8]();
}

uint64_t _CTServerConnectionHideDataIndicator()
{
  return MEMORY[0x1E0CA6FE8]();
}

uint64_t _CTServerConnectionHideRatIndicator()
{
  return MEMORY[0x1E0CA6FF0]();
}

uint64_t _CTServerConnectionIsUserIdentityModuleRequired()
{
  return MEMORY[0x1E0CA7010]();
}

uint64_t _CTServerConnectionRegisterBlockForNotification()
{
  return MEMORY[0x1E0CA7028]();
}

uint64_t _CTServerConnectionUnregisterForAllNotifications()
{
  return MEMORY[0x1E0CA7090]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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


id *_STStatusBarDataMatchingMutabilityOfData(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id *v6;

  v3 = a1;
  v4 = a2;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = (id *)v3;
  }
  else
  {
    v6 = (id *)objc_alloc_init((Class)objc_opt_class());
    _copyValuesFromDataToData((id *)v3, v6);
  }

  return v6;
}

void sub_1D12C9608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL STIsValidDiffForStatusDomain(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  if (v1)
  {
    STValidStatusDomainDiffTypes();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __STIsValidDiffForStatusDomain_block_invoke;
    v5[3] = &unk_1E91E5668;
    v6 = v1;
    v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v5) != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t STValidStatusDomainDiffTypes()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  return objc_msgSend(v15, "setWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

void sub_1D12C9D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id STBackgroundActivityIdentifiersDescription(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "bs_map:", &__block_literal_global_7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1D12CA7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  id *v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v11);
  _Unwind_Resume(a1);
}

void _copyValuesFromDataToData(id *a1, id *a2)
{
  id *v4;
  id *v5;

  objc_storeStrong(a2 + 1, a1[1]);
  v4 = a2;
  v5 = a1;
  objc_storeStrong(v4 + 2, v5[2]);
  objc_storeStrong(v4 + 3, v5[3]);
  objc_storeStrong(v4 + 4, v5[4]);
  objc_storeStrong(v4 + 5, v5[5]);
  objc_storeStrong(v4 + 6, v5[6]);
  objc_storeStrong(v4 + 7, v5[7]);
  objc_storeStrong(v4 + 8, v5[8]);
  objc_storeStrong(v4 + 9, v5[9]);
  objc_storeStrong(v4 + 10, v5[10]);
  objc_storeStrong(v4 + 11, v5[11]);
  objc_storeStrong(v4 + 12, v5[12]);
  objc_storeStrong(v4 + 13, v5[13]);
  objc_storeStrong(v4 + 14, v5[14]);
  objc_storeStrong(v4 + 15, v5[15]);
  objc_storeStrong(v4 + 16, v5[16]);
  objc_storeStrong(v4 + 17, v5[17]);
  objc_storeStrong(v4 + 18, v5[18]);
  objc_storeStrong(v4 + 19, v5[19]);
  objc_storeStrong(v4 + 20, v5[20]);
  objc_storeStrong(v4 + 21, v5[21]);
  objc_storeStrong(v4 + 22, v5[22]);
  objc_storeStrong(v4 + 23, v5[23]);
  objc_storeStrong(v4 + 24, v5[24]);
  objc_storeStrong(v4 + 25, v5[25]);
  objc_storeStrong(v4 + 26, v5[26]);
  objc_storeStrong(v4 + 27, v5[27]);
  objc_storeStrong(v4 + 28, v5[28]);
  objc_storeStrong(v4 + 29, v5[29]);
  objc_storeStrong(v4 + 30, v5[30]);
  objc_storeStrong(v4 + 31, v5[31]);
  objc_storeStrong(v4 + 32, v5[32]);
  objc_storeStrong(v4 + 33, v5[33]);
  objc_storeStrong(v4 + 34, v5[34]);
  objc_storeStrong(v4 + 35, v5[35]);
  objc_storeStrong(v4 + 36, v5[36]);
  objc_storeStrong(v4 + 37, v5[37]);
  objc_storeStrong(v4 + 38, v5[38]);
  objc_storeStrong(v4 + 39, v5[39]);
  objc_storeStrong(v4 + 40, v5[40]);

}

void sub_1D12CD538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t STSystemStatusIsInternalLoggingEnabled()
{
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
  return STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled;
}

void sub_1D12D1F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STLocationStatusDomainLocationAttributionDisplayModeMaskDescription(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v18[5], "appendString:", CFSTR("("));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __STLocationStatusDomainLocationAttributionDisplayModeMaskDescription_block_invoke;
  v10 = &unk_1E91E5BA8;
  v11 = &v13;
  v12 = &v17;
  v2 = v8;
  v3 = v2;
  if ((a1 & 1) != 0)
    __STLocationStatusDomainLocationAttributionDisplayModeMaskDescription_block_invoke((uint64_t)v2, 1);
  if ((a1 & 2) != 0)
    v9((uint64_t)v3, 2);
  if ((a1 & 4) != 0)
    v9((uint64_t)v3, 4);
  if ((a1 & 8) != 0)
    v9((uint64_t)v3, 8);

  if (!v14[3])
  {
    v4 = (void *)v18[5];
    STLocationStatusDomainLocationAttributionDisplayModeDescription(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);

  }
  objc_msgSend((id)v18[5], "appendString:", CFSTR(")"));
  v6 = (id)v18[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

void sub_1D12D4074(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

__CFString *STLocationStatusDomainLocationAttributionDisplayModeDescription(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  __CFString *v4;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 8 && ((0x8Bu >> v1) & 1) != 0)
  {
    v4 = off_1E91E5BC8[v1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("unknown: %@"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

__CFString *STSystemStatusDescriptionForDomain(unint64_t a1)
{
  if (a1 > 0xE)
    return 0;
  else
    return off_1E91E5D48[a1];
}

void sub_1D12D8ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D12D97FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
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

void sub_1D12DB04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STSystemStatusLogDynamicAttribution()
{
  if (qword_1ED0CB3D0 != -1)
    dispatch_once(&qword_1ED0CB3D0, &__block_literal_global);
  return (id)_MergedGlobals_3;
}

id STDynamicAttributionXPCServerInterface()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC5A180);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setCurrentAttributionKey_application_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setCurrentAttributionKey_application_reply_, 1, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setCurrentAttributionStringWithFormat_maskingClientAuditToken_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setCurrentAttributionWebsiteString_maskingClientAuditToken_reply_, 0, 0);
  return v0;
}

id STDynamicAttributionXPCClientInterface()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = (void *)objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC5EDC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_currentAttributionsDidChange_, 0, 0);

  return v3;
}

__CFString *STStatusItemIdentifierDescription(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.systemstatus.status-item."), &stru_1E91E65E8);
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = CFSTR("(unknown)");
  v3 = v1;

  return v3;
}

id STStatusItemIdentifiersDescription(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "bs_map:", &__block_literal_global_0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1D12DE0CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
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

void sub_1D12DEAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D12DEC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D12DFA50(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1D12DFC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D12E01FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id STSystemStatusLogBundleLoading()
{
  if (STSystemStatusLogBundleLoading_onceToken != -1)
    dispatch_once(&STSystemStatusLogBundleLoading_onceToken, &__block_literal_global_4);
  return (id)STSystemStatusLogBundleLoading___logObj;
}

void sub_1D12E08E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STSystemStatusLogCallingDomain()
{
  if (qword_1ED0CB400 != -1)
    dispatch_once(&qword_1ED0CB400, &__block_literal_global_6);
  return (id)_MergedGlobals_6;
}

const __CFString *STDescriptionForServiceState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("No Service");
  else
    return off_1E91E5220[a1 - 1];
}

const __CFString *STDescriptionForDataNetworkType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("Unknown");
  else
    return off_1E91E5238[a1 - 1];
}

__CFString *STBackgroundActivityIdentifierDescription(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.systemstatus.background-activity."), &stru_1E91E65E8);
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = CFSTR("(unknown)");
  v3 = v1;

  return v3;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1D12E3B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D12E5B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STStatusDomainXPCClientInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC5AFA0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  STValidStatusDomainDataTypes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_observeData_forDomain_withChangeContext_, 0, 0);

  STValidStatusDomainDataChangeContextTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_observeData_forDomain_withChangeContext_, 2, 0);

  STValidStatusDomainDiffTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_observeDiff_forDomain_withChangeContext_, 0, 0);

  STValidStatusDomainDataChangeContextTypes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_observeDiff_forDomain_withChangeContext_, 2, 0);

  return v0;
}

id STStatusDomainXPCServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC62BA8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  STValidStatusDomainUserInteractionTypes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_reportUserInteraction_forDomain_, 0, 0);

  STValidStatusDomainDataTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_serverDataForDomains_reply_, 0, 1);

  return v0;
}

void sub_1D12E8488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D12E9D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double STActivityAttributionUnsafeAuditTokenForPID@<D0>(int a1@<W0>, uint64_t a2@<X8>)
{
  double result;

  *(_QWORD *)a2 = -1;
  *(_QWORD *)(a2 + 8) = -1;
  *(_DWORD *)(a2 + 16) = -1;
  *(_DWORD *)(a2 + 20) = a1;
  result = NAN;
  *(_QWORD *)(a2 + 24) = -1;
  return result;
}

BOOL STIsValidDataForStatusDomain(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  if (v1)
  {
    STValidStatusDomainDataTypes();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __STIsValidDataForStatusDomain_block_invoke;
    v5[3] = &unk_1E91E5668;
    v6 = v1;
    v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v5) != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t STValidStatusDomainDataTypes()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  return objc_msgSend(v15, "setWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

BOOL STIsValidDataChangeContextForStatusDomain(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  if (v1)
  {
    STValidStatusDomainDataChangeContextTypes();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __STIsValidDataChangeContextForStatusDomain_block_invoke;
    v5[3] = &unk_1E91E5668;
    v6 = v1;
    v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v5) != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t STValidStatusDomainDataChangeContextTypes()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
}

BOOL STIsValidUserInteractionForStatusDomain(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  if (v1)
  {
    STValidStatusDomainUserInteractionTypes();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __STIsValidUserInteractionForStatusDomain_block_invoke;
    v5[3] = &unk_1E91E5668;
    v6 = v1;
    v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v5) != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t STValidStatusDomainUserInteractionTypes()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

const __CFString *_STStatusBarDataNetworkStatusDescription(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("(unknown)");
  else
    return off_1E91E5988[a1];
}

const __CFString *_STStatusBarDataCellularTypeDescription(unint64_t a1)
{
  if (a1 > 0xD)
    return CFSTR("(unknown)");
  else
    return off_1E91E5918[a1];
}

const __CFString *_STStatusBarDataWifiTypeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("(unknown)");
  if (a1 == 1)
    v1 = CFSTR("hotspot");
  if (a1)
    return v1;
  else
    return CFSTR("regular");
}

const __CFString *_STStatusBarBatteryStateDescription(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_1E91E59B8[a1];
}

const __CFString *_STStatusBarBluetoothStateDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91E59D8[a1];
}

const __CFString *_STStatusBarThermalColorDescription(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("(unknown)");
  else
    return off_1E91E59F0[a1];
}

const __CFString *_STStatusBarActivityTypeDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91E5A20[a1];
}

const __CFString *_STStatusBarLocationTypeDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91E5A38[a1];
}

const __CFString *_STStatusBarVoiceControlTypeDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91E5A50[a1];
}

const __CFString *STAirPlayStatusDomainAirPlayStateDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91E5A68[a1];
}

void sub_1D12F53F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D12F5530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D12F5670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D12F57E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D12F5D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

const __CFString *STVoiceControlStatusDomainListeningStateDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91E5C08[a1];
}

void ___orderedDataEntryKeys_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[STStatusBarData entryKeys](STStatusBarData, "entryKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingDescriptors:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v3;

}

id STDefaultStatusDomainServerHandle()
{
  return +[STStatusDomainXPCServerHandle sharedMachServiceServerHandle](STStatusDomainXPCServerHandle, "sharedMachServiceServerHandle");
}

id STStatusDomainPublisherXPCServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC62D00);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  STValidStatusDomainDataTypes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_registerToPublishDomain_fallbackData_, 1, 0);

  STValidStatusDomainDataTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_publishData_forDomain_withChangeContext_discardingOnExit_reply_, 0, 0);

  STValidStatusDomainDataChangeContextTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_publishData_forDomain_withChangeContext_discardingOnExit_reply_, 2, 0);

  STValidStatusDomainDiffTypes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply_, 0, 0);

  STValidStatusDomainDataChangeContextTypes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply_, 2, 0);

  return v0;
}

id STStatusDomainPublisherXPCClientInterface()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC5F570);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  STValidStatusDomainUserInteractionTypes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_handleUserInteraction_forDomain_, 0, 0);

  return v0;
}

id STSystemStatusLogObservation()
{
  if (STSystemStatusLogObservation_onceToken != -1)
    dispatch_once(&STSystemStatusLogObservation_onceToken, &__block_literal_global_15);
  return (id)STSystemStatusLogObservation___logObj;
}

id STSystemStatusLogPublishing()
{
  if (STSystemStatusLogPublishing_onceToken != -1)
    dispatch_once(&STSystemStatusLogPublishing_onceToken, &__block_literal_global_2_0);
  return (id)STSystemStatusLogPublishing___logObj;
}

void sub_1D12FDA5C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void _copyValuesFromDescriptorToDescriptor(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;

  v3 = (void *)a1[1];
  v4 = a2;
  v19 = a1;
  v5 = objc_msgSend(v3, "copy");
  v6 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v5;

  v7 = objc_msgSend((id)v19[2], "copy");
  v8 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v7;

  v9 = objc_msgSend((id)v19[3], "copy");
  v10 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v9;

  v11 = objc_msgSend((id)v19[4], "copy");
  v12 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v11;

  objc_storeStrong((id *)v4 + 5, (id)v19[5]);
  *((_QWORD *)v4 + 6) = v19[6];
  *((_QWORD *)v4 + 7) = v19[7];
  *((_BYTE *)v4 + 64) = *((_BYTE *)v19 + 64);
  v13 = objc_msgSend((id)v19[9], "copy");
  v14 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v13;

  v15 = objc_msgSend((id)v19[10], "copy");
  v16 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v15;

  v17 = objc_msgSend((id)v19[11], "copy");
  v18 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v17;

}

id STDefaultStatusDomainPublisherServerHandle()
{
  return +[STStatusDomainPublisherXPCServerHandle sharedMachServiceServerHandle](STStatusDomainPublisherXPCServerHandle, "sharedMachServiceServerHandle");
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

void __Block_byref_object_copy__34(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__35(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1D1304CE8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

const __CFString *STBatteryStatusDomainChargingStateDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91E5FE0[a1];
}

const __CFString *STBatteryStatusDomainChargingDescriptionTypeDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91E5FF8[a1];
}

void sub_1D1308AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1309914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
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

id STSystemStatusLogBackgroundActivityVisualDescriptor()
{
  if (qword_1ED0CB4D0 != -1)
    dispatch_once(&qword_1ED0CB4D0, &__block_literal_global_22);
  return (id)_MergedGlobals_18;
}

uint64_t STBackgroundActivityIsVisualEffect(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("none");
  v6[1] = CFSTR("darkBlur");
  v1 = (void *)MEMORY[0x1E0C99D20];
  v2 = a1;
  objc_msgSend(v1, "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2);

  return v4;
}

uint64_t STBackgroundActivityIsContinuousAnimation(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("none");
  v7 = CFSTR("pulseBackground");
  v8 = CFSTR("pulseSymbol");
  v1 = (void *)MEMORY[0x1E0C99D20];
  v2 = a1;
  objc_msgSend(v1, "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2, v6, v7, v8, v9);

  return v4;
}

void sub_1D130DD8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D130DEB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t BSAuditTokenForCurrentProcess()
{
  return MEMORY[0x1E0D010E8]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSExecutablePathForAuditToken()
{
  return MEMORY[0x1E0D012A8]();
}

uint64_t BSExecutablePathForPID()
{
  return MEMORY[0x1E0D012B0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSPIDForAuditToken()
{
  return MEMORY[0x1E0D01458]();
}

uint64_t BSProcessDescriptionForAuditToken()
{
  return MEMORY[0x1E0D014A0]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSSettingFlagIsExplicitNo()
{
  return MEMORY[0x1E0D015A0]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D015A8]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1E0D015F8]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1E0D01620]();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1E0D01670]();
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98030](bundleURL);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1E0D018D0]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}


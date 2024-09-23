id getRUIPageClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getRUIPageClass_softClass;
  v13 = getRUIPageClass_softClass;
  if (!getRUIPageClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getRUIPageClass_block_invoke;
    v6 = &unk_24F762EB8;
    v7 = &v9;
    __getRUIPageClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

_BYTE *__os_log_helper_16_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

id getAASetupAssistantServiceClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getAASetupAssistantServiceClass_softClass;
  v13 = getAASetupAssistantServiceClass_softClass;
  if (!getAASetupAssistantServiceClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getAASetupAssistantServiceClass_block_invoke;
    v6 = &unk_24F762EB8;
    v7 = &v9;
    __getAASetupAssistantServiceClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_2_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

id getBYLicenseAgreementClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getBYLicenseAgreementClass_softClass;
  v13 = getBYLicenseAgreementClass_softClass;
  if (!getBYLicenseAgreementClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getBYLicenseAgreementClass_block_invoke;
    v6 = &unk_24F762EB8;
    v7 = &v9;
    __getBYLicenseAgreementClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_22CBB358C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

id getkAAProtocolGenericTermsUIBuddyMLKey()
{
  id *v1;

  v1 = (id *)getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc();
  if (!v1)
  {
    dlerror();
    abort_report_np();
  }
  return *v1;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

id getAAGenericTermsUIRequestClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getAAGenericTermsUIRequestClass_softClass;
  v13 = getAAGenericTermsUIRequestClass_softClass;
  if (!getAAGenericTermsUIRequestClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getAAGenericTermsUIRequestClass_block_invoke;
    v6 = &unk_24F762EB8;
    v7 = &v9;
    __getAAGenericTermsUIRequestClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_22CBB3D5C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, id *location)
{
  uint64_t v14;

  *(_QWORD *)(v14 - 56) = a1;
  *(_DWORD *)(v14 - 60) = a2;
  objc_destroyWeak((id *)(v14 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v14 - 56));
}

id getRemoteUIControllerClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getRemoteUIControllerClass_softClass;
  v13 = getRemoteUIControllerClass_softClass;
  if (!getRemoteUIControllerClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getRemoteUIControllerClass_block_invoke;
    v6 = &unk_24F762EB8;
    v7 = &v9;
    __getRemoteUIControllerClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getAAiCloudTermsAgreeRequestClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getAAiCloudTermsAgreeRequestClass_softClass;
  v13 = getAAiCloudTermsAgreeRequestClass_softClass;
  if (!getAAiCloudTermsAgreeRequestClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getAAiCloudTermsAgreeRequestClass_block_invoke;
    v6 = &unk_24F762EB8;
    v7 = &v9;
    __getAAiCloudTermsAgreeRequestClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getAAiCloudTermsDisagreeRequestClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getAAiCloudTermsDisagreeRequestClass_softClass;
  v13 = getAAiCloudTermsDisagreeRequestClass_softClass;
  if (!getAAiCloudTermsDisagreeRequestClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getAAiCloudTermsDisagreeRequestClass_block_invoke;
    v6 = &unk_24F762EB8;
    v7 = &v9;
    __getAAiCloudTermsDisagreeRequestClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_2_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_32_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __getRUIPageClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  RemoteUILibrary();
  Class = objc_getClass("RUIPage");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getRUIPageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RemoteUILibrary()
{
  uint64_t v1;

  v1 = RemoteUILibraryCore();
  if (!v1)
    abort_report_np();
  return v1;
}

uint64_t RemoteUILibraryCore()
{
  if (!RemoteUILibraryCore_frameworkLibrary)
    __RemoteUILibraryCore_block_invoke();
  return RemoteUILibraryCore_frameworkLibrary;
}

uint64_t __getAASetupAssistantServiceClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  AppleAccountLibrary();
  Class = objc_getClass("AASetupAssistantService");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getAASetupAssistantServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppleAccountLibrary()
{
  uint64_t v1;

  v1 = AppleAccountLibraryCore();
  if (!v1)
    abort_report_np();
  return v1;
}

uint64_t AppleAccountLibraryCore()
{
  if (!AppleAccountLibraryCore_frameworkLibrary)
    __AppleAccountLibraryCore_block_invoke();
  return AppleAccountLibraryCore_frameworkLibrary;
}

uint64_t __getBYLicenseAgreementClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SetupAssistantLibrary();
  Class = objc_getClass("BYLicenseAgreement");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getBYLicenseAgreementClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v1;

  v1 = SetupAssistantLibraryCore();
  if (!v1)
    abort_report_np();
  return v1;
}

uint64_t SetupAssistantLibraryCore()
{
  if (!SetupAssistantLibraryCore_frameworkLibrary)
    __SetupAssistantLibraryCore_block_invoke();
  return SetupAssistantLibraryCore_frameworkLibrary;
}

uint64_t getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_ptr;
  v13 = getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_ptr;
  if (!getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_block_invoke;
    v6 = &unk_24F762EB8;
    v7 = &v9;
    __getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t result;

  v1 = (void *)AppleAccountLibrary();
  v2 = dlsym(v1, "kAAProtocolGenericTermsUIBuddyMLKey");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAAGenericTermsUIRequestClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  AppleAccountLibrary();
  Class = objc_getClass("AAGenericTermsUIRequest");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getAAGenericTermsUIRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getRemoteUIControllerClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  RemoteUILibrary();
  Class = objc_getClass("RemoteUIController");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getRemoteUIControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAAiCloudTermsAgreeRequestClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  AppleAccountLibrary();
  Class = objc_getClass("AAiCloudTermsAgreeRequest");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getAAiCloudTermsAgreeRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAAiCloudTermsDisagreeRequestClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  AppleAccountLibrary();
  Class = objc_getClass("AAiCloudTermsDisagreeRequest");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getAAiCloudTermsDisagreeRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void _settingDidChangeFontSize()
{
  refreshPadding = 1;
}

id _SUSLoggingFacility()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&_SUSLoggingFacility_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_2);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)_SUSLoggingFacility_oslog;
}

__CFString *SUSettingsUserDefaultsEntryTypeToString(uint64_t a1)
{
  __CFString *v2;

  switch(a1)
  {
    case 0:
      return CFSTR("BOOL");
    case 1:
      return CFSTR("number");
    case 2:
      v2 = CFSTR("string");
      break;
  }
  return v2;
}

id sub_22CBC5378()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  sub_22CBC567C();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_255C3B230 = (uint64_t)result;
  return result;
}

uint64_t *sub_22CBC53CC()
{
  if (qword_255C3AE98 != -1)
    swift_once();
  return &qword_255C3B230;
}

id sub_22CBC540C()
{
  if (qword_255C3AE98 != -1)
    swift_once();
  return (id)qword_255C3B230;
}

void *sub_22CBC544C()
{
  return &unk_22CBCE190;
}

uint64_t sub_22CBC5458()
{
  return 0x6572617774666F53;
}

uint64_t sub_22CBC547C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  id v4;

  v0 = sub_22CBCA410();
  __swift_allocate_value_buffer(v0, qword_255C3B238);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255C3B238);
  sub_22CBC567C();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = objc_msgSend(v3, sel_bundlePath);

  sub_22CBCA65C();
  sub_22CBCA41C();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x24BDCD330], v0);
}

uint64_t sub_22CBC556C()
{
  uint64_t v0;

  if (qword_255C3AEA0 != -1)
    swift_once();
  v0 = sub_22CBCA410();
  return __swift_project_value_buffer(v0, (uint64_t)qword_255C3B238);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_22CBC55CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_255C3AEA0 != -1)
    swift_once();
  v2 = sub_22CBCA410();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_255C3B238);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

unint64_t sub_22CBC567C()
{
  unint64_t result;

  result = qword_255C3AC28;
  if (!qword_255C3AC28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C3AC28);
  }
  return result;
}

uint64_t UserDefaultsBasedComingSoonTip.options.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t OpaqueTypeConformance2;
  uint64_t v9;
  _QWORD v11[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC30);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC38);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CBCA500();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x22E30351C](v7, v4, OpaqueTypeConformance2);
  v11[0] = v4;
  v11[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v9 = sub_22CBCA50C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E303B4C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t UserDefaultsBasedComingSoonTip.title.getter()
{
  return sub_22CBC5DE4();
}

uint64_t UserDefaultsBasedComingSoonTip.message.getter()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedDefaults);
  v1 = objc_msgSend(v0, sel_comingSoonTipMessage);

  if (!v1)
    return 0;
  sub_22CBCA65C();

  sub_22CBC5EB8();
  return sub_22CBCA638();
}

uint64_t UserDefaultsBasedComingSoonTip.rules.getter()
{
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_22CBC5914(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC68);
  v2 = sub_22CBCA710();
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
    sub_22CBC63A0(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_22CBC5CA0(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_22CBC63E8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_22CBC5A44()
{
  return sub_22CBC5DE4();
}

uint64_t sub_22CBC5A64()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedDefaults);
  v1 = objc_msgSend(v0, sel_comingSoonTipMessage);

  if (!v1)
    return 0;
  sub_22CBCA65C();

  sub_22CBC5EB8();
  return sub_22CBCA638();
}

uint64_t sub_22CBC5B20()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_22CBC5B2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t OpaqueTypeConformance2;
  uint64_t v9;
  _QWORD v11[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC30);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC38);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CBCA500();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x22E30351C](v7, v4, OpaqueTypeConformance2);
  v11[0] = v4;
  v11[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v9 = sub_22CBCA50C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

uint64_t sub_22CBC5C64@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_22CBC61E4();
  result = MEMORY[0x22E30348C](a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

unint64_t sub_22CBC5CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22CBCA734();
  sub_22CBCA674();
  v4 = sub_22CBCA740();
  return sub_22CBC5D04(a1, a2, v4);
}

unint64_t sub_22CBC5D04(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_22CBCA728() & 1) == 0)
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
      while (!v14 && (sub_22CBCA728() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22CBC5DE4()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedDefaults);
  v1 = objc_msgSend(v0, sel_comingSoonTipTitle);

  if (v1)
  {
    sub_22CBCA65C();

    sub_22CBC5EB8();
    return sub_22CBCA638();
  }
  else
  {
    sub_22CBCA620();
    return sub_22CBCA62C();
  }
}

unint64_t sub_22CBC5EB8()
{
  unint64_t result;

  result = qword_255C3AC40;
  if (!qword_255C3AC40)
  {
    result = MEMORY[0x22E303B64](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255C3AC40);
  }
  return result;
}

uint64_t _s22SoftwareUpdateSettings30UserDefaultsBasedComingSoonTipV7actionsSay0I3Kit4TipsO6ActionVGvg_0()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  Swift::String v13;
  unint64_t v14;
  uint64_t v15;
  Swift::String v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC58);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v1 = (char *)&v17 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_22CBCA440();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - v7;
  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedDefaults);
  v10 = objc_msgSend(v9, sel_comingSoonTipLearnMoreLink);

  if (v10)
  {
    sub_22CBCA65C();

    sub_22CBCA434();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
    {
      v12 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
      v12(v8, v1, v2);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC60);
      sub_22CBCA5E4();
      v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_22CBCE1A0;
      v13._countAndFlagsBits = 0x4F4D5F4E5241454CLL;
      v13._object = (void *)0xEF4B4E494C5F4552;
      v17 = localizedUIString(_:)(v13);
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
      v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      v15 = swift_allocObject();
      v12((char *)(v15 + v14), v6, v2);
      sub_22CBC5EB8();
      sub_22CBCA5D8();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      return v11;
    }
    sub_22CBC6228((uint64_t)v1);
  }
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_22CBC6184()
{
  unint64_t result;

  result = qword_255C3AC48;
  if (!qword_255C3AC48)
  {
    result = MEMORY[0x22E303B64](&protocol conformance descriptor for UserDefaultsBasedComingSoonTip, &type metadata for UserDefaultsBasedComingSoonTip);
    atomic_store(result, (unint64_t *)&qword_255C3AC48);
  }
  return result;
}

uint64_t sub_22CBC61C8()
{
  return MEMORY[0x24BEE0D10];
}

ValueMetadata *type metadata accessor for UserDefaultsBasedComingSoonTip()
{
  return &type metadata for UserDefaultsBasedComingSoonTip;
}

unint64_t sub_22CBC61E4()
{
  unint64_t result;

  result = qword_255C3AC50;
  if (!qword_255C3AC50)
  {
    result = MEMORY[0x22E303B64](&protocol conformance descriptor for UserDefaultsBasedComingSoonTip, &type metadata for UserDefaultsBasedComingSoonTip);
    atomic_store(result, (unint64_t *)&qword_255C3AC50);
  }
  return result;
}

uint64_t sub_22CBC6228(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22CBC6268()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_22CBCA440();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_22CBC62C8()
{
  void *v0;
  void *v1;
  id v2;

  sub_22CBCA440();
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v2)
  {
    v0 = (void *)sub_22CBCA428();
    sub_22CBC5914(MEMORY[0x24BEE4AF8]);
    v1 = (void *)sub_22CBCA644();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_openSensitiveURL_withOptions_, v0, v1);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22CBC63A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_22CBC63E8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

Swift::String __swiftcall localizedUIString(_:)(Swift::String a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  Swift::String result;

  v1 = (id)*sub_22CBC53CC();
  v2 = (void *)sub_22CBCA650();
  v3 = (void *)sub_22CBCA650();
  v4 = (void *)sub_22CBCA650();
  v5 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, v4);

  v6 = sub_22CBCA65C();
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

Swift::String __swiftcall localizedUIModelString(_:)(Swift::String a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  Swift::String result;

  v1 = (void *)*sub_22CBC53CC();
  v2 = (void *)objc_opt_self();
  v3 = v1;
  v4 = (void *)sub_22CBCA650();
  v5 = objc_msgSend(v2, sel_modelSpecificLocalizedStringKeyForKey_, v4);

  if (v5)
  {
    v8 = (void *)sub_22CBCA650();
    v9 = (void *)sub_22CBCA650();
    v10 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v5, v8, v9);

    v11 = sub_22CBCA65C();
    v13 = v12;

    v6 = v11;
    v7 = v13;
  }
  else
  {
    __break(1u);
  }
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

Swift::String __swiftcall localizedUIWAPIString(_:)(Swift::String a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  Swift::String result;

  v1 = (void *)sub_22CBCA650();
  v2 = (id)SFLocalizableWAPIStringKeyForKey();

  sub_22CBCA65C();
  v3 = (id)*sub_22CBC53CC();
  v4 = (void *)sub_22CBCA650();
  v5 = (void *)sub_22CBCA650();
  v6 = (void *)sub_22CBCA650();
  v7 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, v6);

  v8 = sub_22CBCA65C();
  v10 = v9;
  swift_bridgeObjectRelease();

  v11 = v8;
  v12 = v10;
  result._object = v12;
  result._countAndFlagsBits = v11;
  return result;
}

uint64_t sub_22CBC66F8()
{
  return 0;
}

Swift::String __swiftcall localizedRsrSupportedUIString(_:isSplatUpdate:)(Swift::String _, Swift::Bool isSplatUpdate)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  Swift::String result;

  if (isSplatUpdate)
    sub_22CBCA680();
  else
    sub_22CBCA4E8();
  v2 = (id)*sub_22CBC53CC();
  v3 = (void *)sub_22CBCA650();
  v4 = (void *)sub_22CBCA650();
  v5 = (void *)sub_22CBCA650();
  v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

  v7 = sub_22CBCA65C();
  v9 = v8;
  swift_bridgeObjectRelease();

  v10 = v7;
  v11 = v9;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

uint64_t sub_22CBC6820()
{
  return 0;
}

Swift::String __swiftcall localizedRsrSupportedUIModelString(_:isSplatUpdate:)(Swift::String _, Swift::Bool isSplatUpdate)
{
  uint64_t v2;
  void *v3;
  Swift::String result;

  v2 = sub_22CBC6848(_._countAndFlagsBits, (unint64_t)_._object, isSplatUpdate, (uint64_t (*)(uint64_t, unint64_t))localizedUIModelString(_:));
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_22CBC6834()
{
  return 0;
}

Swift::String __swiftcall localizedRsrSupportedUIWAPIString(_:isSplatUpdate:)(Swift::String _, Swift::Bool isSplatUpdate)
{
  uint64_t v2;
  void *v3;
  Swift::String result;

  v2 = sub_22CBC6848(_._countAndFlagsBits, (unint64_t)_._object, isSplatUpdate, (uint64_t (*)(uint64_t, unint64_t))localizedUIWAPIString(_:));
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_22CBC6848(uint64_t a1, unint64_t a2, char a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  uint64_t v7;

  if ((a3 & 1) != 0)
  {
    sub_22CBCA680();
    a1 = 1599230802;
    a2 = 0xE400000000000000;
  }
  else
  {
    sub_22CBCA4E8();
  }
  v7 = a4(a1, a2);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t variable initialization expression of MockedComingSoonTip.titleText()
{
  return 0;
}

uint64_t MockedComingSoonTip.titleText.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_22CBCA4E8();
  return v1;
}

uint64_t MockedComingSoonTip.titleText.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MockedComingSoonTip.titleText.modify())()
{
  return nullsub_2;
}

uint64_t variable initialization expression of MockedComingSoonTip.messageText()
{
  return 0;
}

uint64_t MockedComingSoonTip.messageText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_22CBCA4E8();
  return v1;
}

uint64_t MockedComingSoonTip.messageText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*MockedComingSoonTip.messageText.modify())()
{
  return nullsub_3;
}

uint64_t variable initialization expression of MockedComingSoonTip.learnMoreLink()
{
  return 0;
}

uint64_t MockedComingSoonTip.learnMoreLink.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_22CBCA4E8();
  return v1;
}

uint64_t MockedComingSoonTip.learnMoreLink.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*MockedComingSoonTip.learnMoreLink.modify())()
{
  return nullsub_4;
}

uint64_t sub_22CBC6A54()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  __swift_allocate_value_buffer(v0, qword_255C3B250);
  __swift_project_value_buffer(v0, (uint64_t)qword_255C3B250);
  return sub_22CBCA608();
}

uint64_t sub_22CBC6B00()
{
  uint64_t v0;

  if (qword_255C3AFB0 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  return __swift_project_value_buffer(v0, (uint64_t)qword_255C3B250);
}

uint64_t sub_22CBC6B4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_255C3AFB0 != -1)
    swift_once();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_255C3B250);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_22CBC6BE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_255C3AFB0 != -1)
    swift_once();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_255C3B250);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_22CBC6C9C())()
{
  uint64_t v0;

  if (qword_255C3AFB0 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  __swift_project_value_buffer(v0, (uint64_t)qword_255C3B250);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_22CBC6D1C()
{
  uint64_t v0;
  unsigned __int8 v2;

  if (qword_255C3AFB0 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  __swift_project_value_buffer(v0, (uint64_t)qword_255C3B250);
  swift_beginAccess();
  sub_22CBCA5F0();
  swift_endAccess();
  return v2;
}

uint64_t sub_22CBC6DB0()
{
  uint64_t v0;

  if (qword_255C3AFB0 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  __swift_project_value_buffer(v0, (uint64_t)qword_255C3B250);
  swift_beginAccess();
  sub_22CBCA5FC();
  return swift_endAccess();
}

void (*sub_22CBC6E54(_QWORD *a1))(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_255C3AFB0 != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_255C3B250);
  swift_beginAccess();
  sub_22CBCA5F0();
  v4 = *((_BYTE *)v2 + 41);
  swift_endAccess();
  *((_BYTE *)v2 + 40) = v4;
  return sub_22CBC6F24;
}

void sub_22CBC6F24(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_BYTE *)(*(_QWORD *)a1 + 41) = *(_BYTE *)(*(_QWORD *)a1 + 40);
  swift_beginAccess();
  sub_22CBCA5FC();
  swift_endAccess();
  free(v1);
}

uint64_t MockedComingSoonTip.options.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t OpaqueTypeConformance2;
  uint64_t v9;
  _QWORD v11[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC30);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC38);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CBCA500();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x22E30351C](v7, v4, OpaqueTypeConformance2);
  v11[0] = v4;
  v11[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v9 = sub_22CBCA50C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

uint64_t MockedComingSoonTip.title.getter()
{
  sub_22CBC5EB8();
  sub_22CBCA4E8();
  return sub_22CBCA638();
}

uint64_t MockedComingSoonTip.message.getter()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 24))
    return 0;
  sub_22CBC5EB8();
  sub_22CBCA4E8();
  return sub_22CBCA638();
}

uint64_t MockedComingSoonTip.rules.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC80);
  sub_22CBCA5C0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_22CBCE1A0;
  if (qword_255C3AFB0 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_255C3B250);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  sub_22CBCA5CC();
  sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  v5 = sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22CBC72F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC98);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3ACA0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22CBC8044(&qword_255C3ACA8, &qword_255C3ACA0, MEMORY[0x24BDCD230]);
  sub_22CBCA404();
  v11[15] = 1;
  sub_22CBCA3F8();
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3ACB0);
  a1[4] = sub_22CBC7F20();
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_22CBC8044(&qword_255C3ACD0, &qword_255C3AC98, MEMORY[0x24BDCD130]);
  sub_22CBCA3EC();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t MockedComingSoonTip.actions.getter()
{
  uint64_t v0;

  return sub_22CBC7890(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

double sub_22CBC7490@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  return result;
}

uint64_t sub_22CBC74A4()
{
  return 0;
}

uint64_t sub_22CBC74B0()
{
  return 0;
}

uint64_t sub_22CBC74BC()
{
  return 0;
}

uint64_t sub_22CBC74C8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t sub_22CBC74DC()
{
  sub_22CBC5EB8();
  sub_22CBCA4E8();
  return sub_22CBCA638();
}

uint64_t sub_22CBC752C()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 24))
    return 0;
  sub_22CBC5EB8();
  sub_22CBCA4E8();
  return sub_22CBCA638();
}

uint64_t sub_22CBC759C()
{
  uint64_t v0;

  return sub_22CBC7890(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_22CBC75A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC78);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC80);
  sub_22CBCA5C0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_22CBCE1A0;
  if (qword_255C3AFB0 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_255C3B250);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  sub_22CBCA5CC();
  sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  v5 = sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22CBC771C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t OpaqueTypeConformance2;
  uint64_t v9;
  _QWORD v11[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC30);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC38);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CBCA500();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x22E30351C](v7, v4, OpaqueTypeConformance2);
  v11[0] = v4;
  v11[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v9 = sub_22CBCA50C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

uint64_t sub_22CBC7854@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_22CBC7D60();
  result = MEMORY[0x22E30348C](a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_22CBC7890(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  Swift::String v15;
  unint64_t v16;
  uint64_t v17;
  Swift::String v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC58);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22CBCA440();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - v11;
  if (a2)
  {
    sub_22CBCA434();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v14 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v14(v12, v5, v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AC60);
      sub_22CBCA5E4();
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_22CBCE1A0;
      v15._countAndFlagsBits = 0x4F4D5F4E5241454CLL;
      v15._object = (void *)0xEF4B4E494C5F4552;
      v19 = localizedUIString(_:)(v15);
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
      v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v17 = swift_allocObject();
      v14((char *)(v17 + v16), v10, v6);
      sub_22CBC5EB8();
      sub_22CBCA5D8();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      return v13;
    }
    sub_22CBC6228((uint64_t)v5);
  }
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_22CBC7AC4()
{
  unint64_t result;

  result = qword_255C3AC88;
  if (!qword_255C3AC88)
  {
    result = MEMORY[0x22E303B64](&protocol conformance descriptor for MockedComingSoonTip, &type metadata for MockedComingSoonTip);
    atomic_store(result, (unint64_t *)&qword_255C3AC88);
  }
  return result;
}

uint64_t sub_22CBC7B08()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t initializeBufferWithCopyOfBuffer for MockedComingSoonTip(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MockedComingSoonTip()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for MockedComingSoonTip(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  sub_22CBCA4E8();
  sub_22CBCA4E8();
  sub_22CBCA4E8();
  return a1;
}

_QWORD *assignWithCopy for MockedComingSoonTip(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for MockedComingSoonTip(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MockedComingSoonTip(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MockedComingSoonTip(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MockedComingSoonTip()
{
  return &type metadata for MockedComingSoonTip;
}

unint64_t sub_22CBC7D60()
{
  unint64_t result;

  result = qword_255C3AC90;
  if (!qword_255C3AC90)
  {
    result = MEMORY[0x22E303B64](&protocol conformance descriptor for MockedComingSoonTip, &type metadata for MockedComingSoonTip);
    atomic_store(result, (unint64_t *)&qword_255C3AC90);
  }
  return result;
}

uint64_t sub_22CBC7DA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_22CBCA440();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_22CBC7E04()
{
  void *v0;
  void *v1;
  id v2;

  sub_22CBCA440();
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v2)
  {
    v0 = (void *)sub_22CBCA428();
    sub_22CBC5914(MEMORY[0x24BEE4AF8]);
    v1 = (void *)sub_22CBCA644();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_openSensitiveURL_withOptions_, v0, v1);

  }
  else
  {
    __break(1u);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E303B58](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_22CBC7F20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255C3ACB8;
  if (!qword_255C3ACB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3ACB0);
    v2[0] = sub_22CBC8044(&qword_255C3ACC0, &qword_255C3ACA0, MEMORY[0x24BDCD228]);
    v2[1] = sub_22CBC7FA4();
    result = MEMORY[0x22E303B64](MEMORY[0x24BDCD0E8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255C3ACB8);
  }
  return result;
}

unint64_t sub_22CBC7FA4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255C3ACC8;
  if (!qword_255C3ACC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3AC98);
    v2[0] = MEMORY[0x24BEE1348];
    v2[1] = MEMORY[0x24BEE1330];
    result = MEMORY[0x22E303B64](MEMORY[0x24BDCD128], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255C3ACC8);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t sub_22CBC8044(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E303B64](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22CBC8084()
{
  uint64_t v0;

  v0 = sub_22CBCA47C();
  __swift_allocate_value_buffer(v0, qword_255C3B0C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_255C3B0C8);
  return sub_22CBCA470();
}

id sub_22CBC8100()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SUSettingsSwiftTipsManager()), sel_init);
  static SUSettingsSwiftTipsManager.shared = (uint64_t)result;
  return result;
}

id SUSettingsSwiftTipsManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t *SUSettingsSwiftTipsManager.shared.unsafeMutableAddressor()
{
  if (qword_255C3B0E0 != -1)
    swift_once();
  return &static SUSettingsSwiftTipsManager.shared;
}

id static SUSettingsSwiftTipsManager.shared.getter()
{
  if (qword_255C3B0E0 != -1)
    swift_once();
  return (id)static SUSettingsSwiftTipsManager.shared;
}

double variable initialization expression of SUSettingsSwiftTipsManager.mockedComingSoonTip@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  double result;
  _OWORD v4[2];
  __int128 v5;

  sub_22CBC7490((uint64_t)v4);
  v2 = v4[1];
  *a1 = v4[0];
  a1[1] = v2;
  result = *(double *)&v5;
  a1[2] = v5;
  return result;
}

unint64_t SUSettingsSwiftTipsManager.comingSoonTip.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t result;

  if ((*((_BYTE *)v1 + OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl) & 1) != 0)
  {
    v3 = (_QWORD *)((char *)v1 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip);
    v5 = *(_QWORD *)((char *)v1 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip);
    v4 = *(_QWORD *)((char *)v1 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip + 8);
    v7 = v3[2];
    v6 = v3[3];
    v9 = v3[4];
    v8 = v3[5];
    a1[3] = &type metadata for MockedComingSoonTip;
    a1[4] = sub_22CBC7D60();
    v10 = (_QWORD *)swift_allocObject();
    *a1 = v10;
    v10[2] = v5;
    v10[3] = v4;
    v10[4] = v7;
    v10[5] = v6;
    v10[6] = v9;
    v10[7] = v8;
    sub_22CBCA4E8();
    sub_22CBCA4E8();
    return sub_22CBCA4E8();
  }
  else
  {
    if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x88))() & 1) != 0)
    {
      a1[3] = &type metadata for UserDefaultsBasedComingSoonTip;
      result = sub_22CBC61E4();
    }
    else
    {
      a1[3] = &type metadata for ConstellationComingSoonTip;
      result = sub_22CBC9C68();
    }
    a1[4] = result;
  }
  return result;
}

uint64_t variable initialization expression of SUSettingsSwiftTipsManager.inManualControl()
{
  return 0;
}

Swift::Void __swiftcall SUSettingsSwiftTipsManager.setup()()
{
  _QWORD *v0;

  (*(void (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))(0);
}

Swift::Void __swiftcall SUSettingsSwiftTipsManager.setup(forManualControl:)(Swift::Bool forManualControl)
{
  _BOOL4 v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  unsigned int v29;
  id v30;
  unsigned int v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64[2];

  v1 = forManualControl;
  v2 = sub_22CBCA59C();
  v54 = *(_QWORD *)(v2 - 8);
  v55 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22CBCA578();
  v58 = *(_QWORD *)(v5 - 8);
  v59 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22CBCA554();
  v57 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255C3B0C0 != -1)
    swift_once();
  v11 = sub_22CBCA47C();
  v60 = __swift_project_value_buffer(v11, (uint64_t)qword_255C3B0C8);
  v12 = sub_22CBCA464();
  v13 = sub_22CBCA6C8();
  v14 = os_log_type_enabled(v12, v13);
  LODWORD(v61) = v1;
  if (v14)
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v62 = v16;
    *(_DWORD *)v15 = 136315394;
    v64[0] = sub_22CBC9418(0xD000000000000018, 0x800000022CBCD360, &v62);
    LOBYTE(v1) = v61;
    sub_22CBCA6D4();
    *(_WORD *)(v15 + 12) = 1024;
    LODWORD(v64[0]) = v1;
    sub_22CBCA6D4();
    _os_log_impl(&dword_22CBAC000, v12, v13, "%s: Setting up SUSettingsSwiftTipsManager (manual control: %{BOOL}d).", (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x22E303BAC](v16, -1, -1);
    MEMORY[0x22E303BAC](v15, -1, -1);
  }

  v17 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (v1)
    goto LABEL_9;
  if (qword_255C3B0E0 != -1)
    swift_once();
  if (((*(uint64_t (**)(void))((*v17 & *(_QWORD *)static SUSettingsSwiftTipsManager.shared) + 0x88))() & 1) != 0)
  {
LABEL_9:
    v18 = sub_22CBCA464();
    v19 = sub_22CBCA6C8();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v62 = v21;
      *(_DWORD *)v20 = 136315138;
      v64[0] = sub_22CBC9418(0xD000000000000018, 0x800000022CBCD360, &v62);
      sub_22CBCA6D4();
      _os_log_impl(&dword_22CBAC000, v18, v19, "%s: Resetting the datastore.", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E303BAC](v21, -1, -1);
      MEMORY[0x22E303BAC](v20, -1, -1);
    }

    sub_22CBCA524();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3ACF0);
  sub_22CBCA5B4();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_22CBCE3A0;
  sub_22CBCA548();
  sub_22CBCA560();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v10, v8);
  sub_22CBCA56C();
  sub_22CBCA584();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v7, v59);
  sub_22CBCA590();
  sub_22CBCA5A8();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v4, v55);
  sub_22CBCA614();
  swift_bridgeObjectRelease();
  v22 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if ((v61 & 1) != 0)
  {
    *(_BYTE *)(v56 + OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl) = 1;
  }
  else
  {
    if (qword_255C3B0E0 != -1)
      swift_once();
    if (((*(uint64_t (**)(void))((*v22 & *(_QWORD *)static SUSettingsSwiftTipsManager.shared) + 0x88))() & 1) != 0)
    {
      v23 = sub_22CBCA464();
      v24 = sub_22CBCA6C8();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = swift_slowAlloc();
        v26 = swift_slowAlloc();
        v64[0] = v26;
        *(_DWORD *)v25 = 136316418;
        v62 = sub_22CBC9418(0xD000000000000018, 0x800000022CBCD360, v64);
        sub_22CBCA6D4();
        *(_WORD *)(v25 + 12) = 1024;
        v27 = (void *)objc_opt_self();
        v28 = objc_msgSend(v27, sel_sharedDefaults);
        v29 = objc_msgSend(v28, sel_shouldShowComingSoonTip);

        LODWORD(v62) = v29;
        sub_22CBCA6D4();
        *(_WORD *)(v25 + 18) = 1024;
        v30 = objc_msgSend(v27, sel_sharedDefaults);
        v31 = objc_msgSend(v30, sel_shouldHideComingSoonTip);

        LODWORD(v62) = v31;
        sub_22CBCA6D4();
        *(_WORD *)(v25 + 24) = 2080;
        v32 = objc_msgSend(v27, sel_sharedDefaults);
        v33 = objc_msgSend(v32, sel_comingSoonTipTitle);

        v61 = v26;
        if (v33)
        {
          v34 = sub_22CBCA65C();
          v36 = v35;

        }
        else
        {
          v34 = 0;
          v36 = 0;
        }
        v62 = v34;
        v63 = v36;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255C3ACF8);
        v37 = sub_22CBCA668();
        v62 = sub_22CBC9418(v37, v38, v64);
        sub_22CBCA6D4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 34) = 2080;
        v39 = objc_msgSend(v27, sel_sharedDefaults);
        v40 = objc_msgSend(v39, sel_comingSoonTipMessage);

        if (v40)
        {
          v41 = sub_22CBCA65C();
          v43 = v42;

        }
        else
        {
          v41 = 0;
          v43 = 0;
        }
        v62 = v41;
        v63 = v43;
        v44 = sub_22CBCA668();
        v62 = sub_22CBC9418(v44, v45, v64);
        sub_22CBCA6D4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 44) = 2080;
        v46 = objc_msgSend(v27, sel_sharedDefaults);
        v47 = objc_msgSend(v46, sel_comingSoonTipLearnMoreLink);

        if (v47)
        {
          v48 = sub_22CBCA65C();
          v50 = v49;

        }
        else
        {
          v48 = 0;
          v50 = 0;
        }
        v62 = v48;
        v63 = v50;
        v51 = sub_22CBCA668();
        v62 = sub_22CBC9418(v51, v52, v64);
        sub_22CBCA6D4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22CBAC000, v23, v24, "%s Overring the default Coming Soon tip content and returning UserDefaultsBasedComingSoonTip instead.\nForce show: %{BOOL}d\nForce hide: %{BOOL}d\nTitle: %s\nMessage: %s\nLearn More URL: %s", (uint8_t *)v25, 0x36u);
        v53 = v61;
        swift_arrayDestroy();
        MEMORY[0x22E303BAC](v53, -1, -1);
        MEMORY[0x22E303BAC](v25, -1, -1);
      }

    }
  }
}

Swift::Void __swiftcall SUSettingsSwiftTipsManager.configureManualComingSoonTip(withTitle:andContent:learnMoreLink:)(Swift::String withTitle, Swift::String_optional andContent, Swift::String_optional learnMoreLink)
{
  uint64_t v3;
  uint64_t v4;
  void *object;
  uint64_t countAndFlagsBits;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  os_log_type_t type;
  uint64_t v21;
  uint64_t v22;

  v4 = v3;
  object = learnMoreLink.value._object;
  countAndFlagsBits = learnMoreLink.value._countAndFlagsBits;
  v7 = andContent.value._object;
  v8 = andContent.value._countAndFlagsBits;
  v9 = withTitle._object;
  v10 = withTitle._countAndFlagsBits;
  if (qword_255C3B0C0 != -1)
    swift_once();
  v11 = sub_22CBCA47C();
  __swift_project_value_buffer(v11, (uint64_t)qword_255C3B0C8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v12 = sub_22CBCA464();
  v13 = sub_22CBCA6C8();
  if (os_log_type_enabled(v12, v13))
  {
    type = v13;
    v14 = swift_slowAlloc();
    v21 = swift_slowAlloc();
    v22 = v21;
    *(_DWORD *)v14 = 136315906;
    sub_22CBC9418(0xD000000000000041, 0x800000022CBCD380, &v22);
    sub_22CBCA6D4();
    *(_WORD *)(v14 + 12) = 2080;
    sub_22CBCA4E8();
    sub_22CBC9418(v10, (unint64_t)v9, &v22);
    sub_22CBCA6D4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 22) = 2080;
    sub_22CBCA4E8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C3ACF8);
    v15 = sub_22CBCA668();
    sub_22CBC9418(v15, v16, &v22);
    sub_22CBCA6D4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 32) = 2080;
    sub_22CBCA4E8();
    v17 = sub_22CBCA668();
    sub_22CBC9418(v17, v18, &v22);
    sub_22CBCA6D4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22CBAC000, v12, type, "%s: Setting up the Mocked Coming Soon tip with:\n    title: %s\n    content: %s\n    learnMoreLink: %s", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x22E303BAC](v21, -1, -1);
    MEMORY[0x22E303BAC](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  *(_BYTE *)(v4 + OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl) = 1;
  v19 = (uint64_t *)(v4 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip);
  *v19 = v10;
  v19[1] = (uint64_t)v9;
  sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  v19[2] = v8;
  v19[3] = (uint64_t)v7;
  sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  v19[4] = countAndFlagsBits;
  v19[5] = (uint64_t)object;
  sub_22CBCA4E8();
  swift_bridgeObjectRelease();
  sub_22CBC6DB0();
}

id SUSettingsSwiftTipsManager.init()()
{
  void *v0;
  _BYTE *v1;
  uint64_t v2;
  _OWORD *v3;
  __int128 v4;
  objc_super v6;
  _OWORD v7[3];

  v1 = v0;
  v2 = nullsub_6();
  nullsub_1(v2);
  v3 = &v1[OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip];
  sub_22CBC7490((uint64_t)v7);
  v4 = v7[1];
  *v3 = v7[0];
  v3[1] = v4;
  v3[2] = v7[2];
  v1[OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl] = 0;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SUSettingsSwiftTipsManager();
  return objc_msgSendSuper2(&v6, sel_init);
}

id SUSettingsSwiftTipsManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SUSettingsSwiftTipsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22CBC92C8(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t ObjectType;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (!a1)
    return MEMORY[0x24BEE4AF8];
  v1 = a1;
  v2 = objc_msgSend(v1, sel_superview);
  if (!v2)
  {
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AD00);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_22CBCE3B0;
    *(_QWORD *)(v10 + 32) = v1;
    v12 = v10;
    sub_22CBCA6A4();
    return v12;
  }
  v3 = v2;
  ObjectType = swift_getObjectType();
  if (ObjectType == sub_22CBC9D00())
  {

    goto LABEL_9;
  }
  v5 = v3;
  v6 = sub_22CBC92C8(v3);

  v7 = v1;
  v8 = sub_22CBCA4E8();
  MEMORY[0x22E30369C](v8);
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22CBCA6B0();
  sub_22CBCA6BC();
  sub_22CBCA6A4();
  v9 = v6;

  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_22CBC9418(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22CBC94E8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22CBC9D5C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_22CBC9D5C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_22CBCA4E8();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22CBC94E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22CBCA6E0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_22CBC96A0(a5, a6);
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
  v8 = sub_22CBCA6F8();
  if (!v8)
  {
    sub_22CBCA704();
    __break(1u);
LABEL_17:
    result = sub_22CBCA71C();
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

uint64_t sub_22CBC96A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22CBC9734(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_22CBC990C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_22CBC990C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22CBC9734(uint64_t a1, unint64_t a2)
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
      v3 = sub_22CBC98A8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_22CBCA6EC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22CBCA704();
      __break(1u);
LABEL_10:
      v2 = sub_22CBCA68C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_22CBCA71C();
    __break(1u);
LABEL_14:
    result = sub_22CBCA704();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_22CBC98A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AD38);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22CBC990C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AD38);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
  result = sub_22CBCA71C();
  __break(1u);
  return result;
}

void _s22SoftwareUpdateSettings26SUSettingsSwiftTipsManagerC40shouldShowUserDefaultsBasedComingSoonTipSbvg_0()
{
  void *v0;
  id v1;
  unsigned int v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_sharedDefaults);
  v2 = objc_msgSend(v1, sel_shouldShowComingSoonTip);

  if (!v2)
    return;
  v3 = objc_msgSend(v0, sel_sharedDefaults);
  v4 = objc_msgSend(v3, sel_comingSoonTipTitle);

  if (v4)
  {

    v5 = objc_msgSend(v0, sel_sharedDefaults);
    v6 = objc_msgSend(v5, sel_comingSoonTipTitle);

    if (!v6)
    {
      __break(1u);
      goto LABEL_17;
    }
    v7 = sub_22CBCA65C();
    v9 = v8;

    if (v7 || v9 != 0xE000000000000000)
    {
      v10 = sub_22CBCA728();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
        return;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  v11 = objc_msgSend(v0, sel_sharedDefaults);
  v12 = objc_msgSend(v11, sel_comingSoonTipMessage);

  if (!v12)
    return;

  v13 = objc_msgSend(v0, sel_sharedDefaults);
  v14 = objc_msgSend(v13, sel_comingSoonTipMessage);

  if (!v14)
  {
LABEL_17:
    __break(1u);
    return;
  }
  v15 = sub_22CBCA65C();
  v17 = v16;

  if (v15 || v17 != 0xE000000000000000)
  {
    sub_22CBCA728();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_22CBC9C68()
{
  unint64_t result;

  result = qword_255C3ACE0;
  if (!qword_255C3ACE0)
  {
    result = MEMORY[0x22E303B64](&protocol conformance descriptor for ConstellationComingSoonTip, &type metadata for ConstellationComingSoonTip);
    atomic_store(result, (unint64_t *)&qword_255C3ACE0);
  }
  return result;
}

uint64_t sub_22CBC9CAC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t type metadata accessor for SUSettingsSwiftTipsManager()
{
  return objc_opt_self();
}

unint64_t sub_22CBC9D00()
{
  unint64_t result;

  result = qword_255C3AD08;
  if (!qword_255C3AD08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C3AD08);
  }
  return result;
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

uint64_t sub_22CBC9D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_22CBC9D9C()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_22CBC9DAC()
{
  id *v0;
  void (*v1)(_QWORD *__return_ptr);
  id v2;
  id v3;
  _QWORD v5[5];

  v0 = (id *)SUSettingsSwiftTipsManager.shared.unsafeMutableAddressor();
  v1 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & *(_QWORD *)*v0) + 0x90);
  v2 = *v0;
  v1(v5);

  v3 = objc_allocWithZone((Class)sub_22CBCA4D0());
  return sub_22CBCA4DC();
}

void *ConstellationComingSoonTip.ConstellationIdentifier.unsafeMutableAddressor()
{
  return &static ConstellationComingSoonTip.ConstellationIdentifier;
}

unint64_t static ConstellationComingSoonTip.ConstellationIdentifier.getter()
{
  return 0xD000000000000020;
}

unint64_t ConstellationComingSoonTip.id.getter()
{
  return 0xD000000000000020;
}

uint64_t ConstellationComingSoonTip.options.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AD40);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22CBCE1A0;
  v1 = sub_22CBCA530();
  v2 = MEMORY[0x24BDF61D8];
  *(_QWORD *)(v0 + 56) = v1;
  *(_QWORD *)(v0 + 64) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 32));
  sub_22CBCA53C();
  return v0;
}

unint64_t sub_22CBC9F80()
{
  unint64_t result;

  result = qword_255C3AD48;
  if (!qword_255C3AD48)
  {
    result = MEMORY[0x22E303B64](&protocol conformance descriptor for ConstellationComingSoonTip, &type metadata for ConstellationComingSoonTip);
    atomic_store(result, (unint64_t *)&qword_255C3AD48);
  }
  return result;
}

unint64_t sub_22CBC9FC4()
{
  return 0xD000000000000020;
}

uint64_t sub_22CBC9FE0()
{
  return sub_22CBCA4AC();
}

uint64_t sub_22CBCA010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3AD40);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22CBCE1A0;
  v1 = sub_22CBCA530();
  v2 = MEMORY[0x24BDF61D8];
  *(_QWORD *)(v0 + 56) = v1;
  *(_QWORD *)(v0 + 64) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 32));
  sub_22CBCA53C();
  return v0;
}

uint64_t sub_22CBCA080()
{
  return MEMORY[0x24BEE0D10];
}

void sub_22CBCA08C(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x800000022CBCD770;
}

ValueMetadata *type metadata accessor for ConstellationComingSoonTip()
{
  return &type metadata for ConstellationComingSoonTip;
}

uint64_t sub_22CBCA0BC()
{
  return swift_deallocClassInstance();
}

id sub_22CBCA0CC()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_255C3B208 = (uint64_t)result;
  return result;
}

uint64_t sub_22CBCA11C(uint64_t a1)
{
  return sub_22CBCA2FC(a1, qword_255C3B270);
}

uint64_t sub_22CBCA140()
{
  return sub_22CBCA1B8(&qword_255C3B210, (uint64_t)qword_255C3B270);
}

uint64_t sub_22CBCA15C@<X0>(uint64_t a1@<X8>)
{
  return sub_22CBCA214(&qword_255C3B210, (uint64_t)qword_255C3B270, a1);
}

uint64_t sub_22CBCA178(uint64_t a1)
{
  return sub_22CBCA2FC(a1, qword_255C3B288);
}

uint64_t sub_22CBCA19C()
{
  return sub_22CBCA1B8(&qword_255C3B218, (uint64_t)qword_255C3B288);
}

uint64_t sub_22CBCA1B8(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_22CBCA458();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_22CBCA1F8@<X0>(uint64_t a1@<X8>)
{
  return sub_22CBCA214(&qword_255C3B218, (uint64_t)qword_255C3B288, a1);
}

uint64_t sub_22CBCA214@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_22CBCA458();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_22CBCA27C(uint64_t a1)
{
  return sub_22CBCA2FC(a1, qword_255C3B2A0);
}

uint64_t sub_22CBCA2A0()
{
  return sub_22CBCA1B8(&qword_255C3B220, (uint64_t)qword_255C3B2A0);
}

uint64_t sub_22CBCA2BC@<X0>(uint64_t a1@<X8>)
{
  return sub_22CBCA214(&qword_255C3B220, (uint64_t)qword_255C3B2A0, a1);
}

uint64_t sub_22CBCA2D8(uint64_t a1)
{
  return sub_22CBCA2FC(a1, qword_255C3B2B8);
}

uint64_t sub_22CBCA2FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_22CBCA458();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_255C3B200 != -1)
    swift_once();
  v4 = (id)qword_255C3B208;
  return sub_22CBCA44C();
}

uint64_t sub_22CBCA394()
{
  return sub_22CBCA1B8(&qword_255C3B228, (uint64_t)qword_255C3B2B8);
}

uint64_t sub_22CBCA3B0@<X0>(uint64_t a1@<X8>)
{
  return sub_22CBCA214(&qword_255C3B228, (uint64_t)qword_255C3B2B8, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_22CBCA3EC()
{
  return MEMORY[0x24BDCCE08]();
}

uint64_t sub_22CBCA3F8()
{
  return MEMORY[0x24BDCD238]();
}

uint64_t sub_22CBCA404()
{
  return MEMORY[0x24BDCD240]();
}

uint64_t sub_22CBCA410()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_22CBCA41C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_22CBCA428()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22CBCA434()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_22CBCA440()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22CBCA44C()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t sub_22CBCA458()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t sub_22CBCA464()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22CBCA470()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22CBCA47C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22CBCA488()
{
  return MEMORY[0x24BDF60B0]();
}

uint64_t sub_22CBCA494()
{
  return MEMORY[0x24BDF60B8]();
}

uint64_t sub_22CBCA4A0()
{
  return MEMORY[0x24BDF60C0]();
}

uint64_t sub_22CBCA4AC()
{
  return MEMORY[0x24BDF60C8]();
}

uint64_t sub_22CBCA4B8()
{
  return MEMORY[0x24BDF60D8]();
}

uint64_t sub_22CBCA4C4()
{
  return MEMORY[0x24BDF60E0]();
}

uint64_t sub_22CBCA4D0()
{
  return MEMORY[0x24BDF6128]();
}

uint64_t sub_22CBCA4DC()
{
  return MEMORY[0x24BDF6130]();
}

uint64_t sub_22CBCA4E8()
{
  return MEMORY[0x24BDF6140]();
}

uint64_t sub_22CBCA4F4()
{
  return MEMORY[0x24BDF6148]();
}

uint64_t sub_22CBCA500()
{
  return MEMORY[0x24BDF6158]();
}

uint64_t sub_22CBCA50C()
{
  return MEMORY[0x24BDF6188]();
}

uint64_t sub_22CBCA518()
{
  return MEMORY[0x24BDF61A0]();
}

uint64_t sub_22CBCA524()
{
  return MEMORY[0x24BDF61B0]();
}

uint64_t sub_22CBCA530()
{
  return MEMORY[0x24BDF61E0]();
}

uint64_t sub_22CBCA53C()
{
  return MEMORY[0x24BDF61F0]();
}

uint64_t sub_22CBCA548()
{
  return MEMORY[0x24BDF6208]();
}

uint64_t sub_22CBCA554()
{
  return MEMORY[0x24BDF6210]();
}

uint64_t sub_22CBCA560()
{
  return MEMORY[0x24BDF6218]();
}

uint64_t sub_22CBCA56C()
{
  return MEMORY[0x24BDF6220]();
}

uint64_t sub_22CBCA578()
{
  return MEMORY[0x24BDF6230]();
}

uint64_t sub_22CBCA584()
{
  return MEMORY[0x24BDF6238]();
}

uint64_t sub_22CBCA590()
{
  return MEMORY[0x24BDF6240]();
}

uint64_t sub_22CBCA59C()
{
  return MEMORY[0x24BDF6248]();
}

uint64_t sub_22CBCA5A8()
{
  return MEMORY[0x24BDF6250]();
}

uint64_t sub_22CBCA5B4()
{
  return MEMORY[0x24BDF6258]();
}

uint64_t sub_22CBCA5C0()
{
  return MEMORY[0x24BDF6288]();
}

uint64_t sub_22CBCA5CC()
{
  return MEMORY[0x24BDF6298]();
}

uint64_t sub_22CBCA5D8()
{
  return MEMORY[0x24BDF62C0]();
}

uint64_t sub_22CBCA5E4()
{
  return MEMORY[0x24BDF62D0]();
}

uint64_t sub_22CBCA5F0()
{
  return MEMORY[0x24BDF6308]();
}

uint64_t sub_22CBCA5FC()
{
  return MEMORY[0x24BDF6310]();
}

uint64_t sub_22CBCA608()
{
  return MEMORY[0x24BDF6320]();
}

uint64_t sub_22CBCA614()
{
  return MEMORY[0x24BDF6328]();
}

uint64_t sub_22CBCA620()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_22CBCA62C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_22CBCA638()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_22CBCA644()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22CBCA650()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22CBCA65C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22CBCA668()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22CBCA674()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22CBCA680()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22CBCA68C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22CBCA698()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22CBCA6A4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22CBCA6B0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22CBCA6BC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22CBCA6C8()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22CBCA6D4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22CBCA6E0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22CBCA6EC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22CBCA6F8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22CBCA704()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22CBCA710()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22CBCA71C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22CBCA728()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22CBCA734()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22CBCA740()
{
  return MEMORY[0x24BEE4328]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t PSIsRunningInAssistant()
{
  return MEMORY[0x24BE75B30]();
}

uint64_t PSRoundToPixel()
{
  return MEMORY[0x24BE75C50]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x24BE85770]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x24BEBE080](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}


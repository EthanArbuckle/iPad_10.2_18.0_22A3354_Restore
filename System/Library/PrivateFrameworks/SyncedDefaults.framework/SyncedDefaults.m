void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20DA7CB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20DA7D25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_20DA7D540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  os_activity_scope_leave(&state);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20DA7D820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state, id location)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id SYDGetSyncSignpostsLog()
{
  if (SYDGetSyncSignpostsLog_onceToken != -1)
    dispatch_once(&SYDGetSyncSignpostsLog_onceToken, &__block_literal_global_19);
  return (id)SYDGetSyncSignpostsLog_log;
}

void sub_20DA7D988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_20DA7DBD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SYDErrorUserInfoClasses()
{
  if (SYDErrorUserInfoClasses_onceToken != -1)
    dispatch_once(&SYDErrorUserInfoClasses_onceToken, &__block_literal_global_121);
  return (id)SYDErrorUserInfoClasses_sAcceptableClasses;
}

void sub_20DA7E618(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DA7E7A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DA7E988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_20DA7F070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  uint64_t v48;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a48, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v48 - 240));
  _Unwind_Resume(a1);
}

id SYDGetConnectionLog()
{
  if (SYDGetConnectionLog_onceToken != -1)
    dispatch_once(&SYDGetConnectionLog_onceToken, &__block_literal_global_7);
  return (id)SYDGetConnectionLog_log;
}

id SYDGetAccessorSignpostsLog()
{
  if (SYDGetAccessorSignpostsLog_onceToken != -1)
    dispatch_once(&SYDGetAccessorSignpostsLog_onceToken, &__block_literal_global_17);
  return (id)SYDGetAccessorSignpostsLog_log;
}

const __CFString *SYDStringForStoreType(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_24C806B88[a1];
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20DA7F970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v9 - 64));
  _Unwind_Resume(a1);
}

void sub_20DA7FB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v11 - 96));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = 1752392040;
  *(_WORD *)(a3 + 12) = 2113;
  *(_QWORD *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(_QWORD *)(a3 + 24) = a2;
  return result;
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t SYDIsDataSeparatedPersona()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BEBF270], "currentPersona");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isDataSeparatedPersona");

  return v1;
}

void sub_20DA8083C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20DA81A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 160), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id SYDGetMiscLog()
{
  if (SYDGetMiscLog_onceToken != -1)
    dispatch_once(&SYDGetMiscLog_onceToken, &__block_literal_global);
  return (id)SYDGetMiscLog_log;
}

id SYDGetCloudKitLog()
{
  if (SYDGetCloudKitLog_onceToken != -1)
    dispatch_once(&SYDGetCloudKitLog_onceToken, &__block_literal_global_3);
  return (id)SYDGetCloudKitLog_log;
}

id SYDGetCoreDataLog()
{
  if (SYDGetCoreDataLog_onceToken != -1)
    dispatch_once(&SYDGetCoreDataLog_onceToken, &__block_literal_global_5);
  return (id)SYDGetCoreDataLog_log;
}

id SYDGetAnalyticsLog()
{
  if (SYDGetAnalyticsLog_onceToken != -1)
    dispatch_once(&SYDGetAnalyticsLog_onceToken, &__block_literal_global_9);
  return (id)SYDGetAnalyticsLog_log;
}

id SYDGetAccountsLog()
{
  if (SYDGetAccountsLog_onceToken != -1)
    dispatch_once(&SYDGetAccountsLog_onceToken, &__block_literal_global_11);
  return (id)SYDGetAccountsLog_log;
}

id SYDGetMigrationLog()
{
  if (SYDGetMigrationLog_onceToken != -1)
    dispatch_once(&SYDGetMigrationLog_onceToken, &__block_literal_global_13);
  return (id)SYDGetMigrationLog_log;
}

id SYDGetTCCLog()
{
  if (SYDGetTCCLog_onceToken != -1)
    dispatch_once(&SYDGetTCCLog_onceToken, &__block_literal_global_15);
  return (id)SYDGetTCCLog_log;
}

uint64_t SYDObjectsAreBothNilOrEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend(v3, "isEqual:", v4);
  }

  return v6;
}

void sub_20DA8348C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a27, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v27 - 96));
  _Unwind_Resume(a1);
}

void sub_20DA83E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20DA847B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,id location)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20DA84CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 64));
  _Unwind_Resume(a1);
}

void sub_20DA84E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_20DA851F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20DA853D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DA85444(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DA85BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20DA85D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  os_activity_scope_leave((os_activity_scope_state_t)(v16 - 80));
  _Unwind_Resume(a1);
}

void sub_20DA86080(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a2;
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void OUTLINED_FUNCTION_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_21(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_23(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id SYDClientToDaemonConnection.object<A>(forKey:)@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  id v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v5 = sub_20DA88DBC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v31 - v7;
  v9 = (void *)sub_20DA88D98();
  v32 = 0;
  v33[0] = 0;
  v10 = objc_msgSend(v2, sel_getObject_forKey_error_, v33, v9, &v32);

  v12 = v32;
  v11 = v33[0];
  if (v10)
  {
    if (!v33[0])
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1, a1);
      return v12;
    }
    swift_unknownObjectRetain_n();
    v13 = v12;
    v14 = swift_dynamicCast();
    v15 = *(_QWORD *)(a1 - 8);
    v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    if (v14)
    {
      v16(v8, 0, 1, a1);
      swift_unknownObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(a2, v8, a1);
      v16(a2, 0, 1, a1);
      return (id)swift_unknownObjectRelease();
    }
    v16(v8, 1, 1, a1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_20DA870AC();
    v19 = (void *)swift_allocError();
    v21 = v20;
    v20[3] = swift_getObjectType();
    *v21 = v11;
  }
  else
  {
    v18 = v32;
    swift_unknownObjectRetain();
    v19 = (void *)sub_20DA88D68();

  }
  swift_willThrow();
  swift_unknownObjectRelease();
  if (qword_2549D7E60 != -1)
    swift_once();
  v22 = sub_20DA88D8C();
  __swift_project_value_buffer(v22, (uint64_t)static Logger.client);
  v23 = v19;
  v24 = v19;
  v25 = sub_20DA88D74();
  v26 = sub_20DA88DB0();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v27 = 138412290;
    v29 = v19;
    v30 = _swift_stdlib_bridgeErrorToNSError();
    v33[0] = v30;
    sub_20DA88DC8();
    *v28 = v30;

    _os_log_impl(&dword_20DA7A000, v25, v26, "Error getting object for key: %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549D7E70);
    swift_arrayDestroy();
    MEMORY[0x212BAE278](v28, -1, -1);
    MEMORY[0x212BAE278](v27, -1, -1);
  }
  else
  {

  }
  return (id)swift_willThrow();
}

id SYDClientToDaemonConnection.set(_:forKey:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id result;
  void *v11;
  id v13[3];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sub_20DA870F0(a1, (uint64_t)v13);
  v2 = v14;
  if (v14)
  {
    v3 = __swift_project_boxed_opaque_existential_0(v13, v14);
    v4 = *(_QWORD *)(v2 - 8);
    MEMORY[0x24BDAC7A8](v3, v3);
    v6 = (char *)&v13[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    v7 = sub_20DA88DD4();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)sub_20DA88D98();
  v13[0] = 0;
  v9 = objc_msgSend(v1, sel_setObject_forKey_error_, v7, v8, v13);
  swift_unknownObjectRelease();

  result = v13[0];
  if (!v9)
  {
    v11 = result;
    sub_20DA88D68();

    return (id)swift_willThrow();
  }
  return result;
}

uint64_t SYDClientToDaemonConnection.sync()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_20DA86C30()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[16];
  v0[2] = v0;
  v0[3] = sub_20DA86CBC;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_20DA86FE0;
  v3[3] = &block_descriptor;
  v3[4] = v2;
  objc_msgSend(v1, sel_synchronizationWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_20DA86CBC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_20DA86D1C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DA86D28()
{
  uint64_t v0;
  void *v1;
  id *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  char *v12;
  char v13;
  _BYTE *v14;

  v1 = *(void **)(v0 + 136);
  swift_willThrow();
  *(_QWORD *)(v0 + 80) = v1;
  v2 = (id *)(v0 + 80);
  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549D7E90);
  sub_20DA8717C();
  if (!swift_dynamicCast())
  {

    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  v4 = *(void **)(v0 + 120);
  v5 = objc_msgSend(v4, sel_domain);
  v6 = sub_20DA88DA4();
  v8 = v7;

  if (v6 == 0x65446465636E7953 && v8 == 0xEE0073746C756166)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    v11 = (uint64_t)objc_msgSend(v4, sel_code);
    if (v11 > 7776)
    {
      switch(v11)
      {
        case 7777:
          sub_20DA871B8();
          swift_allocError();
          v13 = 1;
          goto LABEL_20;
        case 121212:
          sub_20DA871B8();
          swift_allocError();
          v13 = 4;
          goto LABEL_20;
        case 8888:
          sub_20DA871B8();
          swift_allocError();
          v13 = 2;
          goto LABEL_20;
      }
    }
    else if (v11 == 6666)
    {
      sub_20DA871B8();
      swift_allocError();
      v13 = 3;
LABEL_20:
      *v12 = v13;
      goto LABEL_21;
    }
    sub_20DA871B8();
    swift_allocError();
    *v14 = 0;
LABEL_21:
    swift_willThrow();

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v10 = sub_20DA88DE0();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
    goto LABEL_10;
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DA86FE0(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549D7E90);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BAE230]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_20DA870AC()
{
  unint64_t result;

  result = qword_2549D7E78;
  if (!qword_2549D7E78)
  {
    result = MEMORY[0x212BAE23C](&protocol conformance descriptor for GetObjectError, &type metadata for GetObjectError);
    atomic_store(result, (unint64_t *)&qword_2549D7E78);
  }
  return result;
}

uint64_t sub_20DA870F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549D7E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

unint64_t sub_20DA8717C()
{
  unint64_t result;

  result = qword_2549D7E98;
  if (!qword_2549D7E98)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549D7E98);
  }
  return result;
}

unint64_t sub_20DA871B8()
{
  unint64_t result;

  result = qword_2549D7EA0;
  if (!qword_2549D7EA0)
  {
    result = MEMORY[0x212BAE23C](&protocol conformance descriptor for SyncError, &type metadata for SyncError);
    atomic_store(result, (unint64_t *)&qword_2549D7EA0);
  }
  return result;
}

BOOL static SyncError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t SyncError.hash(into:)()
{
  return sub_20DA88E28();
}

uint64_t SyncError.hashValue.getter()
{
  sub_20DA88E1C();
  sub_20DA88E28();
  return sub_20DA88E34();
}

BOOL sub_20DA87284(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20DA87298()
{
  sub_20DA88E1C();
  sub_20DA88E28();
  return sub_20DA88E34();
}

uint64_t sub_20DA872DC()
{
  return sub_20DA88E28();
}

uint64_t sub_20DA87304()
{
  sub_20DA88E1C();
  sub_20DA88E28();
  return sub_20DA88E34();
}

unint64_t sub_20DA87348()
{
  unint64_t result;

  result = qword_2549D7EA8;
  if (!qword_2549D7EA8)
  {
    result = MEMORY[0x212BAE23C](&protocol conformance descriptor for SyncError, &type metadata for SyncError);
    atomic_store(result, (unint64_t *)&qword_2549D7EA8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GetObjectError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for GetObjectError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for GetObjectError(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_0(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for GetObjectError(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for GetObjectError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GetObjectError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_20DA8763C()
{
  return 0;
}

ValueMetadata *type metadata accessor for GetObjectError()
{
  return &type metadata for GetObjectError;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SyncError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_20DA87744 + 4 * byte_20DA89D7D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_20DA87778 + 4 * byte_20DA89D78[v4]))();
}

uint64_t sub_20DA87778(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20DA87780(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20DA87788);
  return result;
}

uint64_t sub_20DA87794(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20DA8779CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_20DA877A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20DA877A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20DA877B4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20DA877BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SyncError()
{
  return &type metadata for SyncError;
}

uint64_t Logger.client.unsafeMutableAddressor()
{
  return sub_20DA879D4(&qword_2549D7E60, (uint64_t)static Logger.client);
}

void sub_20DA877F0()
{
  strcpy((char *)&static Logger.loggingSubsystem, "com.apple.kvs");
  *(_WORD *)&algn_2549D8188[6] = -4864;
}

uint64_t *Logger.loggingSubsystem.unsafeMutableAddressor()
{
  if (qword_2549D7E58 != -1)
    swift_once();
  return &static Logger.loggingSubsystem;
}

uint64_t static Logger.loggingSubsystem.getter()
{
  uint64_t v0;

  if (qword_2549D7E58 != -1)
    swift_once();
  v0 = static Logger.loggingSubsystem;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_20DA878BC(uint64_t a1)
{
  return sub_20DA8790C(a1, static Logger.client);
}

uint64_t static Logger.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20DA87A30(&qword_2549D7E60, (uint64_t)static Logger.client, a1);
}

uint64_t sub_20DA878F4(uint64_t a1)
{
  return sub_20DA8790C(a1, static Logger.test);
}

uint64_t sub_20DA8790C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_20DA88D8C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_2549D7E58 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_20DA88D80();
}

uint64_t Logger.test.unsafeMutableAddressor()
{
  return sub_20DA879D4(&qword_2549D7E68, (uint64_t)static Logger.test);
}

uint64_t sub_20DA879D4(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_20DA88D8C();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.test.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20DA87A30(&qword_2549D7E68, (uint64_t)static Logger.test, a1);
}

uint64_t sub_20DA87A30@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_20DA88D8C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
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

uint64_t sub_20DA88D68()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_20DA88D74()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20DA88D80()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_20DA88D8C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20DA88D98()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20DA88DA4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20DA88DB0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20DA88DBC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20DA88DC8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20DA88DD4()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_20DA88DE0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20DA88DEC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_20DA88DF8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_20DA88E04()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_20DA88E10()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_20DA88E1C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20DA88E28()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20DA88E34()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


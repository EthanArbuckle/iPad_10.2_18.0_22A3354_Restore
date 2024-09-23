void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_218861E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
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

void sub_21886212C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21886233C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21886283C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void sub_218864924(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_218864A80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_218864BE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id queryGestalt(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MGCopyAnswer();
  if (!v2)
  {
    +[RMLog device](RMLog, "device");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 138543362;
      v6 = a1;
      _os_log_impl(&dword_21885E000, v3, OS_LOG_TYPE_INFO, "Could not query for %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  return v2;
}

void sub_218867B6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_218867C8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void __getEnglishDescription_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getEnglishDescription_enUSPosixLocale;
  getEnglishDescription_enUSPosixLocale = v0;

}

uint64_t createDirectoryAtURL(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a1;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (a2 != 1)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24D96E718, *MEMORY[0x24BDD0CC8]);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, v7, a3);

  return v9;
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_21886F4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_21886FE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_218870288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2188703EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void __timedDispatchQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("RMTimedDispatch timedDispatchQueue", MEMORY[0x24BDAC9C0]);
  v1 = (void *)timedDispatchQueue_queue;
  timedDispatchQueue_queue = (uint64_t)v0;

}

void sub_218872170(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2188723C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_218872878(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id sub_218872E04()
{
  objc_class *v0;
  char *v1;
  char *v2;
  id result;
  objc_super v4;

  v0 = (objc_class *)type metadata accessor for ManagedKeychain();
  v1 = (char *)objc_allocWithZone(v0);
  v2 = &v1[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  *(_QWORD *)v2 = 0xD000000000000017;
  *((_QWORD *)v2 + 1) = 0x80000002188AAF00;
  v4.receiver = v1;
  v4.super_class = v0;
  result = objc_msgSendSuper2(&v4, sel_init);
  qword_254FFC818 = (uint64_t)result;
  return result;
}

id ManagedKeychain.__allocating_init(repoAccessGroupOverride:)(unint64_t a1, unint64_t a2)
{
  objc_class *v2;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t *v8;
  objc_super v10;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = 0xD000000000000017;
  if (a2)
    v6 = a1;
  v7 = 0x80000002188AAF00;
  if (a2)
    v7 = a2;
  v8 = (unint64_t *)&v5[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  *v8 = v6;
  v8[1] = v7;
  v10.receiver = v5;
  v10.super_class = v2;
  return objc_msgSendSuper2(&v10, sel_init);
}

id static ManagedKeychain.sharedInstance.getter()
{
  if (qword_254FFC810 != -1)
    swift_once();
  return (id)qword_254FFC818;
}

void sub_218872F74()
{
  strcpy((char *)&qword_254FFC828, "persistentRef");
  unk_254FFC836 = -4864;
}

uint64_t static ManagedKeychain.assignedPersistentRef.getter()
{
  return sub_218873028(&qword_254FFC820, &qword_254FFC828);
}

void sub_218872FE4()
{
  qword_254FFC840 = 0x656D614E72657375;
  *(_QWORD *)algn_254FFC848 = 0xE800000000000000;
}

uint64_t static ManagedKeychain.assignedUserName.getter()
{
  return sub_218873028(&qword_254FFC838, &qword_254FFC840);
}

uint64_t sub_218873028(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

id sub_218873098(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;

  if (*a3 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_2188A5D14();
  swift_bridgeObjectRelease();
  return v3;
}

id ManagedKeychain.init(repoAccessGroupOverride:)(unint64_t a1, unint64_t a2)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t *v5;
  objc_super v7;

  v3 = 0xD000000000000017;
  if (a2)
    v3 = a1;
  v4 = 0x80000002188AAF00;
  if (a2)
    v4 = a2;
  v5 = (unint64_t *)&v2[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  *v5 = v3;
  v5[1] = v4;
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for ManagedKeychain();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for ManagedKeychain()
{
  return objc_opt_self();
}

uint64_t sub_218873184()
{
  uint64_t v0;

  v0 = sub_2188A5C9C();
  __swift_allocate_value_buffer(v0, qword_254FFEE30);
  __swift_project_value_buffer(v0, (uint64_t)qword_254FFEE30);
  if (qword_254FFC868 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_2188A5C90();
}

void sub_218873234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  sub_21887CFCC(a1, a2, a3, a4);
  if (!v10)
  {
    v15 = v14;
    type metadata accessor for MKRepo();
    sub_21888127C(a7, a8, a9, *(_QWORD *)(v9 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v9 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
    v16 = sub_218879FF4(a5);
    sub_2188902D8((uint64_t)v15, v16, v17);

    swift_release();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_218873520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  return sub_218873564(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(void))sub_21887D87C);
}

uint64_t sub_218873548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  return sub_218873564(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(void))sub_21887D9C0);
}

uint64_t sub_218873564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t (*a8)(void))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  result = a8();
  if (!v9)
  {
    v15 = (void *)result;
    type metadata accessor for MKRepo();
    sub_21888127C(a5, a6, a7, *(_QWORD *)(v8 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v8 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
    v16 = sub_218879FF4(a3);
    sub_21889082C(v15, v16, v17);

    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21887363C(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7, uint64_t (*a8)(uint64_t, unint64_t))
{
  id v12;
  id v13;
  char *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a1;
  v15 = a6;
  v16 = sub_2188A5C3C();
  v18 = v17;

  v19 = sub_2188A5D20();
  if (v15)
  {
    v20 = sub_2188A5D20();
    v22 = v21;

  }
  else
  {
    v20 = 0;
    v22 = 0;
  }
  v23 = (void *)a8(v16, v18);
  type metadata accessor for MKRepo();
  sub_21888127C(a5, v20, v22, *(_QWORD *)&v14[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup], *(_QWORD *)&v14[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8]);
  v24 = sub_218879FF4(v19);
  sub_21889082C(v23, v24, v25);
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21887A168(v16, v18);
  return 1;
}

uint64_t sub_218873828(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v9;
  uint64_t v16;
  _QWORD *v17;

  type metadata accessor for MKRepo();
  sub_21888127C(a7, a8, a9, *(_QWORD *)(v9 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v9 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  v16 = sub_218879FF4(a5);
  sub_218890B44(a1, a2, a3, a4, v16, v17);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_218873A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, _QWORD *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unint64_t a20)
{
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v29;
  uint64_t v33;
  void *v34;

  v29 = type metadata accessor for MKSCEPClient();
  v34 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21887A0FC(a5, (unint64_t)a6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21889C6DC(a19, a20, &v34, v29, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21887A154(a5, (unint64_t)a6);
  swift_bridgeObjectRelease();
  v23 = v34;
  if (v33)
  {

  }
  else if (v34)
  {
    type metadata accessor for MKRepo();
    sub_21888127C(a18, a19, a20, *(_QWORD *)(v26 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v26 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
    v24 = sub_218879FF4(a16);
    sub_2188902D8((uint64_t)v23, v24, v25);

    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void sub_218873FA0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, NSObject *a5, uint64_t a6, unint64_t a7, int a8, uint64_t a9, uint64_t a10, id *a11, void **a12, unsigned __int8 a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t a19)
{
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  sub_21887CAA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a18, a19);
  if (!v20)
  {
    v22 = v21;
    type metadata accessor for MKRepo();
    sub_21888127C(a17, a18, a19, *(_QWORD *)(v19 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v19 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
    v23 = sub_218879FF4(a15);
    sub_2188902D8((uint64_t)v22, v23, v24);

    swift_release();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_218874374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_218874C38(a1, a2, a3, a4, a5, (void (*)(uint64_t))sub_218890E7C);
}

uint64_t sub_21887439C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  unint64_t v11;

  type metadata accessor for MKRepo();
  sub_21888127C(a3, a4, a5, *(_QWORD *)(v5 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v5 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  v10 = sub_218879FF4(a1);
  LOBYTE(a4) = sub_2188911A8(v10, v11);
  swift_release();
  swift_bridgeObjectRelease();
  return a4 & 1;
}

uint64_t sub_21887452C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_2188745B8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2188874C0);
}

uint64_t sub_218874588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_2188745B8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_218887710);
}

uint64_t sub_2188745B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  type metadata accessor for MKRepo();
  sub_21888127C(a3, a4, a5, *(_QWORD *)(v11 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v11 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  v17 = sub_218879FF4(a1);
  v19 = v18;
  v20 = sub_218879FF4(a6);
  v22 = a11(v17, v19, v20, v21, a8, a9, a10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v22;
}

id sub_218874700(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;

  v33 = sub_2188A5D20();
  v34 = a4;
  if (a5)
  {
    v14 = sub_2188A5D20();
    v35 = v15;
  }
  else
  {
    v14 = 0;
    v35 = 0;
  }
  v16 = sub_2188A5D20();
  v17 = sub_2188A5D20();
  v19 = v18;
  type metadata accessor for MKRepo();
  v20 = *(_QWORD *)&a1[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v21 = *(_QWORD *)&a1[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8];
  swift_unknownObjectRetain();
  v32 = a1;
  sub_21888127C(v34, v14, v35, v20, v21);
  v22 = sub_218879FF4(v33);
  v24 = v23;
  v25 = sub_218879FF4(v16);
  v27 = a10(v22, v24, v25, v26, a7, v17, v19);
  v29 = v28;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v30 = (void *)sub_2188A5C24();
  sub_21887A168(v27, v29);
  return v30;
}

uint64_t sub_218874908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11)
{
  uint64_t v11;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  id v27;
  uint64_t v30;

  v17 = a9;
  type metadata accessor for MKRepo();
  sub_21888127C(a3, a4, a5, *(_QWORD *)(v11 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v11 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  v18 = sub_218879FF4(a1);
  v20 = v19;
  v21 = sub_218879FF4(a6);
  v23 = sub_2188884B8(v18, v20, v21, v22, a8, a9, a10);
  if (v30)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = v23;
    v25 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (a11)
    {
      sub_21887A110(v17, v25);
      swift_bridgeObjectRetain();
      sub_21887A168(v17, v25);
      v26 = (void *)sub_2188A5D14();
      swift_bridgeObjectRelease();
      v27 = v26;
      *a11 = v26;
    }
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v17;
}

uint64_t sub_218874C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_218874C38(a1, a2, a3, a4, a5, (void (*)(uint64_t))sub_218888710);
}

uint64_t sub_218874C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, void (*a6)(uint64_t))
{
  uint64_t v6;
  uint64_t v12;

  type metadata accessor for MKRepo();
  sub_21888127C(a3, a4, a5, *(_QWORD *)(v6 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v6 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  v12 = sub_218879FF4(a1);
  a6(v12);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_218874CF4(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v11 = sub_2188A5D20();
  if (a5)
  {
    v12 = sub_2188A5D20();
    a5 = v13;
  }
  else
  {
    v12 = 0;
  }
  type metadata accessor for MKRepo();
  v15 = *(_QWORD *)&a1[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v14 = *(_QWORD *)&a1[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8];
  v16 = a1;
  sub_21888127C(a4, v12, a5, v15, v14);
  v17 = sub_218879FF4(v11);
  a7(v17);
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

_QWORD *sub_218874E38(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;

  type metadata accessor for MKRepo();
  sub_21888127C(a1, a2, a3, *(_QWORD *)(v3 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v3 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  swift_beginAccess();
  v7 = swift_bridgeObjectRetain();
  v8 = sub_218879D14(v7);
  swift_release();
  swift_bridgeObjectRelease();
  return v8;
}

_QWORD *sub_218874FF4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;

  type metadata accessor for MKRepo();
  sub_21888127C(a1, a2, a3, *(_QWORD *)(v3 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v3 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  swift_beginAccess();
  v7 = swift_bridgeObjectRetain();
  v8 = sub_218879D14(v7);
  swift_release();
  swift_bridgeObjectRelease();
  return v8;
}

_QWORD *sub_2188751B0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;

  type metadata accessor for MKRepo();
  sub_21888127C(a1, a2, a3, *(_QWORD *)(v3 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v3 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  swift_beginAccess();
  v7 = swift_bridgeObjectRetain();
  v8 = sub_218879D14(v7);
  swift_release();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21887536C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  type metadata accessor for MKRepo();
  sub_21888127C(a3, a4, a5, *(_QWORD *)(v5 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v5 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  v10 = sub_218879FF4(a1);
  v12 = sub_218891DFC(v10, v11);
  swift_release();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_2188755A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char v25;
  unint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;

  v6 = v5;
  type metadata accessor for MKRepo();
  sub_21888127C(a2, a3, a4, *(_QWORD *)(v4 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v4 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  v11 = (_QWORD *)sub_218875F1C(MEMORY[0x24BEE4AF8]);
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
  {
    swift_release();
    return (uint64_t)v11;
  }
  swift_bridgeObjectRetain();
  v13 = (uint64_t *)(a1 + 40);
  sub_21887A1AC();
  while (1)
  {
    v15 = *(v13 - 1);
    v16 = *v13;
    swift_bridgeObjectRetain();
    v17 = sub_2188A5EE8();
    v39 = v12;
    v40 = v15;
    if (*(_QWORD *)(v17 + 16) == 2)
    {
      sub_2188A5F54();
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v17 + 16) < 2uLL)
        goto LABEL_26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_2188A5D98();
      swift_bridgeObjectRelease();
      v18 = 0xD000000000000010;
      v19 = 0x80000002188AAF20;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v18 = v15;
      v19 = v16;
    }
    v20 = sub_218891DFC(v18, v19);
    if (v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return (uint64_t)v11;
    }
    v22 = v20;
    v23 = v21;
    swift_bridgeObjectRelease();
    sub_21887A110(v22, v23);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v26 = sub_2188767BC(v40, v16);
    v27 = v11[2];
    v28 = (v25 & 1) == 0;
    v29 = v27 + v28;
    if (__OFADD__(v27, v28))
      break;
    v30 = v25;
    if (v11[3] >= v29)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v25 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_218879480();
        if ((v30 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_218877F84(v29, isUniquelyReferenced_nonNull_native);
      v31 = sub_2188767BC(v40, v16);
      if ((v30 & 1) != (v32 & 1))
        goto LABEL_28;
      v26 = v31;
      if ((v30 & 1) != 0)
      {
LABEL_3:
        v14 = v11[7] + 16 * v26;
        sub_21887A168(*(_QWORD *)v14, *(_QWORD *)(v14 + 8));
        *(_QWORD *)v14 = v22;
        *(_QWORD *)(v14 + 8) = v23;
        goto LABEL_4;
      }
    }
    v11[(v26 >> 6) + 8] |= 1 << v26;
    v33 = (uint64_t *)(v11[6] + 16 * v26);
    *v33 = v40;
    v33[1] = v16;
    v34 = (uint64_t *)(v11[7] + 16 * v26);
    *v34 = v22;
    v34[1] = v23;
    v35 = v11[2];
    v36 = __OFADD__(v35, 1);
    v37 = v35 + 1;
    if (v36)
      goto LABEL_27;
    v11[2] = v37;
    swift_bridgeObjectRetain();
LABEL_4:
    v13 += 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21887A168(v22, v23);
    v6 = 0;
    v12 = v39 - 1;
    if (v39 == 1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return (uint64_t)v11;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  result = sub_2188A6044();
  __break(1u);
  return result;
}

unint64_t sub_218875930(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC928);
  v2 = sub_2188A5FCC();
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
    sub_21887A758(v6, (uint64_t)&v13, &qword_254FFC930);
    v7 = v13;
    result = sub_218876820(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_21887A73C(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_218875A5C(uint64_t a1)
{
  return sub_218875A98(a1, &qword_254FFC8D8);
}

unint64_t sub_218875A68(uint64_t a1)
{
  return sub_218875BB8(a1, &qword_254FFC8D0);
}

unint64_t sub_218875A74(uint64_t a1)
{
  return sub_218875A98(a1, &qword_254FFC8C8);
}

unint64_t sub_218875A80(uint64_t a1)
{
  return sub_218875BB8(a1, &qword_254FFC8C0);
}

unint64_t sub_218875A8C(uint64_t a1)
{
  return sub_218875A98(a1, &qword_254FFC8B8);
}

unint64_t sub_218875A98(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_2188A5FCC();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v6 = *(v5 - 2);
    v7 = *(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    swift_retain();
    result = sub_2188767BC(v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v6;
    v11[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v8;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v5 += 3;
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

unint64_t sub_218875BAC(uint64_t a1)
{
  return sub_218875BB8(a1, &qword_254FFC8B0);
}

unint64_t sub_218875BB8(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_2188A5FCC();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v6 = *(v5 - 1);
    v7 = *v5;
    v8 = swift_retain();
    result = sub_2188768A4(v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v3[6] + v11) = v6;
    *(_QWORD *)(v3[7] + v11) = v7;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v5 += 2;
    v3[2] = v14;
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

unint64_t sub_218875CB0(uint64_t a1)
{
  return sub_218875CD4(a1, &qword_254FFC8A8);
}

unint64_t sub_218875CBC(uint64_t a1)
{
  return sub_218875CD4(a1, &qword_254FFC8A0);
}

unint64_t sub_218875CC8(uint64_t a1)
{
  return sub_218875CD4(a1, &qword_254FFC898);
}

unint64_t sub_218875CD4(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_2188A5FCC();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v6 = *(v5 - 2);
    v7 = *(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2188767BC(v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v6;
    v11[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v8;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v5 += 3;
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

unint64_t sub_218875DE8(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8E0);
  v2 = sub_2188A5FCC();
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
    sub_21887A758(v6, (uint64_t)&v15, &qword_254FFC8F0);
    v7 = v15;
    v8 = v16;
    result = sub_2188767BC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21887A73C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_218875F1C(uint64_t a1)
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
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC918);
  v2 = (_QWORD *)sub_2188A5FCC();
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
    sub_21887A110(v7, v8);
    result = sub_2188767BC(v5, v6);
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

unint64_t sub_218876040(uint64_t a1)
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
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8E8);
  v2 = (_QWORD *)sub_2188A5FCC();
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
    swift_unknownObjectRetain();
    result = sub_2188767BC(v5, v6);
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

uint64_t sub_21887627C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  type metadata accessor for MKRepo();
  sub_21888127C(a3, a4, a5, *(_QWORD *)(v5 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v5 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  v10 = sub_218879FF4(a1);
  v12 = sub_218891FB0(v10, v11);
  swift_release();
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_218876478(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v7;

  type metadata accessor for MKRepo();
  sub_21888127C(a1, a2, a3, *(_QWORD *)(v3 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)(v3 + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup + 8));
  v7 = sub_21888277C();
  swift_release();
  return v7;
}

id ManagedKeychain.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ManagedKeychain.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ManagedKeychain.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ManagedKeychain();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_218876694(uint64_t a1)
{
  MEMORY[0x219A1BFE8](&unk_2188A8584, a1);
  return sub_2188A5C78();
}

uint64_t sub_2188766D0()
{
  MEMORY[0x219A1BFE8](&unk_2188A8584);
  return sub_2188A5C6C();
}

uint64_t sub_218876718(uint64_t a1, uint64_t a2)
{
  sub_2188A608C();
  MEMORY[0x219A1BFE8](&unk_2188A8584, a2);
  sub_2188A5C6C();
  return sub_2188A60A4();
}

uint64_t sub_218876770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x219A1BFE8](&unk_2188A8584, a3);
  return sub_2188A5C60();
}

unint64_t sub_2188767BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2188A608C();
  sub_2188A5D8C();
  v4 = sub_2188A60A4();
  return sub_218876958(a1, a2, v4);
}

unint64_t sub_218876820(uint64_t a1)
{
  uint64_t v2;

  sub_2188A608C();
  type metadata accessor for CFString(0);
  sub_21887A838(&qword_254FFC938, (uint64_t)&unk_2188A8584);
  sub_2188A5C6C();
  v2 = sub_2188A60A4();
  return sub_218876A38(a1, v2);
}

uint64_t sub_2188768A4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_2188A608C();
  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  sub_21887A110(v2, v3);
  sub_2188A5C48();
  sub_21887A168(v2, v3);
  v4 = sub_2188A60A4();
  return sub_218876B70(a1, v4);
}

unint64_t sub_218876928(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2188A5F24();
  return sub_21887753C(a1, v2);
}

unint64_t sub_218876958(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2188A6038() & 1) == 0)
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
      while (!v14 && (sub_2188A6038() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_218876A38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_21887A838(&qword_254FFC938, (uint64_t)&unk_2188A8584);
    v7 = v6;
    v8 = sub_2188A5C60();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_2188A5C60();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_218876B70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
    __asm { BR              X10 }
  return a2 & ~v3;
}

unint64_t sub_21887753C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_21887A690(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x219A1B64C](v9, a1);
      sub_21887A6CC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_218877600(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8E0);
  v6 = sub_2188A5FC0();
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
        sub_21887A73C(v24, v35);
      }
      else
      {
        sub_21887A700((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2188A608C();
      sub_2188A5D8C();
      result = sub_2188A60A4();
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
      result = (uint64_t)sub_21887A73C(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2188778FC(uint64_t a1, char a2)
{
  return sub_218877938(a1, a2, &qword_254FFC8C0);
}

uint64_t sub_218877908(uint64_t a1, char a2)
{
  return sub_218877938(a1, a2, &qword_254FFC8D0);
}

uint64_t sub_218877914(uint64_t a1, char a2)
{
  return sub_218877C50(a1, a2, &qword_254FFC8C8);
}

uint64_t sub_218877920(uint64_t a1, char a2)
{
  return sub_218877C50(a1, a2, &qword_254FFC8D8);
}

uint64_t sub_21887792C(uint64_t a1, char a2)
{
  return sub_218877938(a1, a2, &qword_254FFC8B0);
}

uint64_t sub_218877938(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
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
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  _QWORD *v37;
  char v38;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v38 = a2;
  v7 = sub_2188A5FC0();
  v8 = v7;
  if (*(_QWORD *)(v6 + 16))
  {
    v35 = v3;
    v9 = 1 << *(_BYTE *)(v6 + 32);
    v37 = (_QWORD *)(v6 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v6 + 64);
    v36 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v23 = v22 | (v14 << 6);
      }
      else
      {
        v24 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v24 >= v36)
          goto LABEL_33;
        v25 = v37[v24];
        ++v14;
        if (!v25)
        {
          v14 = v24 + 1;
          if (v24 + 1 >= v36)
            goto LABEL_33;
          v25 = v37[v14];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v36)
            {
LABEL_33:
              swift_release();
              v4 = v35;
              if ((v38 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v6 + 32);
                if (v34 >= 64)
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v34;
                *(_QWORD *)(v6 + 16) = 0;
              }
              break;
            }
            v25 = v37[v26];
            if (!v25)
            {
              while (1)
              {
                v14 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_40;
                if (v14 >= v36)
                  goto LABEL_33;
                v25 = v37[v14];
                ++v26;
                if (v25)
                  goto LABEL_30;
              }
            }
            v14 = v26;
          }
        }
LABEL_30:
        v11 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v14 << 6);
      }
      v31 = 8 * v23;
      v32 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + v31);
      v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + v31);
      if ((v38 & 1) == 0)
        swift_retain();
      sub_2188A608C();
      v15 = *(_QWORD *)(v32 + 16);
      v16 = *(_QWORD *)(v32 + 24);
      sub_21887A110(v15, v16);
      sub_2188A5C48();
      sub_21887A168(v15, v16);
      result = sub_2188A60A4();
      v17 = -1 << *(_BYTE *)(v8 + 32);
      v18 = result & ~v17;
      v19 = v18 >> 6;
      if (((-1 << v18) & ~*(_QWORD *)(v12 + 8 * (v18 >> 6))) != 0)
      {
        v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v12 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v17) >> 6;
        do
        {
          if (++v19 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v29 = v19 == v28;
          if (v19 == v28)
            v19 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v12 + 8 * v19);
        }
        while (v30 == -1);
        v20 = __clz(__rbit64(~v30)) + (v19 << 6);
      }
      *(_QWORD *)(v12 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      v21 = 8 * v20;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v21) = v32;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v21) = v33;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_218877C44(uint64_t a1, char a2)
{
  return sub_218877C50(a1, a2, &qword_254FFC8B8);
}

uint64_t sub_218877C50(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
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
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v37 = a2;
  v7 = sub_2188A5FC0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v36 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v35)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
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
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_2188A608C();
    sub_2188A5D8C();
    result = sub_2188A60A4();
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
          goto LABEL_41;
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
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_218877F60(uint64_t a1, char a2)
{
  return sub_21887829C(a1, a2, &qword_254FFC8A8);
}

uint64_t sub_218877F6C(uint64_t a1, char a2)
{
  return sub_21887829C(a1, a2, &qword_254FFC8A0);
}

uint64_t sub_218877F78(uint64_t a1, char a2)
{
  return sub_21887829C(a1, a2, &qword_254FFC898);
}

uint64_t sub_218877F84(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC918);
  v6 = a2;
  v7 = sub_2188A5FC0();
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
        sub_21887A110(v37, *((unint64_t *)&v37 + 1));
      }
      sub_2188A608C();
      sub_2188A5D8C();
      result = sub_2188A60A4();
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

uint64_t sub_218878290(uint64_t a1, char a2)
{
  return sub_21887829C(a1, a2, &qword_254FFC900);
}

uint64_t sub_21887829C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
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
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v37 = a2;
  v7 = sub_2188A5FC0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v36 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v35)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
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
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2188A608C();
    sub_2188A5D8C();
    result = sub_2188A60A4();
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
          goto LABEL_41;
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
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_2188785AC(uint64_t a1, char a2)
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
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC908);
  v37 = a2;
  v6 = sub_2188A5FC0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
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
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
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
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_2188A608C();
    sub_2188A5D8C();
    result = sub_2188A60A4();
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
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
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

uint64_t sub_2188788B4(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC910);
  v42 = a2;
  v6 = sub_2188A5FC0();
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
    sub_2188A608C();
    sub_2188A5D8C();
    result = sub_2188A60A4();
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

uint64_t sub_218878BD8(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8E8);
  v36 = a2;
  v6 = sub_2188A5FC0();
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
      swift_unknownObjectRetain();
    }
    sub_2188A608C();
    sub_2188A5D8C();
    result = sub_2188A60A4();
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

void *sub_218878EEC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8E0);
  v2 = *v0;
  v3 = sub_2188A5FB4();
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
    sub_21887A700(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_21887A73C(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_2188790D0()
{
  return sub_21887910C(&qword_254FFC8C0);
}

void *sub_2188790DC()
{
  return sub_21887910C(&qword_254FFC8D0);
}

void *sub_2188790E8()
{
  return sub_2188792B0(&qword_254FFC8C8);
}

void *sub_2188790F4()
{
  return sub_2188792B0(&qword_254FFC8D8);
}

void *sub_218879100()
{
  return sub_21887910C(&qword_254FFC8B0);
}

void *sub_21887910C(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
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
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_2188A5FB4();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_26;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_25:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = *(_QWORD *)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v17) = v18;
    result = (void *)swift_retain();
  }
  v21 = v19 + 2;
  if (v21 >= v14)
    goto LABEL_26;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2188792A4()
{
  return sub_2188792B0(&qword_254FFC8B8);
}

void *sub_2188792B0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
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

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_2188A5FB4();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
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

void *sub_21887945C()
{
  return sub_218879650(&qword_254FFC8A8);
}

void *sub_218879468()
{
  return sub_218879650(&qword_254FFC8A0);
}

void *sub_218879474()
{
  return sub_218879650(&qword_254FFC898);
}

void *sub_218879480()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC918);
  v2 = *v0;
  v3 = sub_2188A5FB4();
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
    result = (void *)sub_21887A110(v24, *((unint64_t *)&v24 + 1));
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

void *sub_218879644()
{
  return sub_218879650(&qword_254FFC900);
}

void *sub_218879650(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
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

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_2188A5FB4();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_2188797FC()
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
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC908);
  v2 = *v0;
  v3 = sub_2188A5FB4();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2188799A8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC910);
  v2 = *v0;
  v3 = sub_2188A5FB4();
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

void *sub_218879B60()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8E8);
  v2 = *v0;
  v3 = sub_2188A5FB4();
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
    result = (void *)swift_unknownObjectRetain();
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

_QWORD *sub_218879D14(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC920);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_218879DF8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21887A74C();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_218879DF8(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_218879FF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  sub_21887A1AC();
  v2 = sub_2188A5EE8();
  if (*(_QWORD *)(v2 + 16) != 2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return a1;
  }
  sub_2188A5F54();
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(v2 + 16) >= 2uLL)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2188A5D98();
    swift_bridgeObjectRelease();
    return 0xD000000000000010;
  }
  __break(1u);
  return result;
}

uint64_t sub_21887A0FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21887A110(a1, a2);
  return a1;
}

uint64_t sub_21887A110(uint64_t a1, unint64_t a2)
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

uint64_t sub_21887A154(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21887A168(a1, a2);
  return a1;
}

uint64_t sub_21887A168(uint64_t a1, unint64_t a2)
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

unint64_t sub_21887A1AC()
{
  unint64_t result;

  result = qword_254FFC890;
  if (!qword_254FFC890)
  {
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254FFC890);
  }
  return result;
}

uint64_t method lookup function for ManagedKeychain()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ManagedKeychain.__allocating_init(repoAccessGroupOverride:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ManagedKeychain.store(pkcs12Data:password:assetKey:scope:persona:)(uint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x60))(a1);
}

uint64_t dispatch thunk of ManagedKeychain.store(derData:assetKey:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ManagedKeychain.store(pemData:assetKey:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ManagedKeychain.store(password:userName:assetKey:scope:persona:)(uint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x78))(a1);
}

uint64_t dispatch thunk of ManagedKeychain.storeSCEPIdentity(url:caInstanceName:caFingerprint:caCapabilities:challenge:subject:keySize:usageFlags:subjectAltName:retries:retryDelay:assetKey:scope:persona:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  _QWORD *v12;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v12) + 0x80))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t dispatch thunk of ManagedKeychain.storeACMEIdentity(directoryURL:clientIdentifier:keySize:keyType:hardwareBound:subject:subjectAltName:usageFlags:extendedKeyUsage:attest:isUserEnrollment:assetKey:scope:persona:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v10) + 0x88))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t dispatch thunk of ManagedKeychain.delete(assetKey:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ManagedKeychain.hasAssetFor(assetKey:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ManagedKeychain.assignCert(withAssetKey:scope:persona:toConfigurationKey:accessibility:accessGroup:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v2) + 0xA0))(a1, a2);
}

uint64_t dispatch thunk of ManagedKeychain.assignIdentity(withAssetKey:scope:persona:toConfigurationKey:accessibility:accessGroup:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v2) + 0xA8))(a1, a2);
}

uint64_t dispatch thunk of ManagedKeychain.assignPassword(withAssetKey:scope:persona:toConfigurationKey:accessibility:accessGroup:returnUserName:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0xB0))(a1, a2, a3);
}

uint64_t dispatch thunk of ManagedKeychain.unassignAllAssets(fromConfigurationKey:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ManagedKeychain.assetKeysForCertificates(scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ManagedKeychain.assetKeysForIdentities(scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ManagedKeychain.assetKeysForPasswords(scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ManagedKeychain.certificatePersistentRef(assetKey:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ManagedKeychain.certificatePersistentRefs(assetKeys:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ManagedKeychain.copyCertificate(assetKey:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ManagedKeychain.debugState(scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A1BFD0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21887A690(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_21887A6CC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_21887A700(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_21887A73C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21887A74C()
{
  return swift_release();
}

uint64_t sub_21887A758(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_21887A8B0(a1, &qword_254FFC958);
}

void type metadata accessor for SecKey(uint64_t a1)
{
  sub_21887A8B0(a1, &qword_254FFC940);
}

void type metadata accessor for SecIdentity(uint64_t a1)
{
  sub_21887A8B0(a1, &qword_254FFC948);
}

void type metadata accessor for SecPolicy(uint64_t a1)
{
  sub_21887A8B0(a1, &qword_254FFC950);
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_21887A8B0(a1, &qword_254FFC960);
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
  sub_21887A8B0(a1, &qword_254FFC968);
}

uint64_t sub_21887A814()
{
  return sub_21887A838((unint64_t *)&qword_254FFC970, (uint64_t)&unk_2188A85B0);
}

uint64_t sub_21887A838(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    result = MEMORY[0x219A1BFE8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21887A878()
{
  return sub_21887A838(&qword_254FFC978, (uint64_t)&unk_2188A8558);
}

void type metadata accessor for CFDictionary(uint64_t a1)
{
  sub_21887A8B0(a1, &qword_254FFC980);
}

void sub_21887A8B0(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_21887A8F4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_21887A920(a1, a2, a3, a4, a5);
}

uint64_t ManagedKeychainPublic.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ManagedKeychainPublic.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_21887A920(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  void *v5;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
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
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  const void *v37;
  CFTypeID v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  unsigned int v53;
  unint64_t v54;
  _OWORD v55[2];
  __int128 v56;
  uint64_t v57;
  _QWORD v58[19];

  v58[17] = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A8630;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v12;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v13;
  v14 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 96) = 1;
  sub_21887A110(a1, a2);
  v15 = sub_218875DE8(inited);
  v54 = v15;
  if (a3 != 1)
  {
LABEL_4:
    v58[0] = 0;
    v53 = 0;
    sub_21889BD58(a4, a5, &v53, (uint64_t)&v54, (uint64_t)v58);
    if (v5)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v22 = sub_2188A5C9C();
      __swift_project_value_buffer(v22, (uint64_t)qword_254FFEE30);
      v23 = v5;
      v24 = v5;
      v25 = sub_2188A5C84();
      v26 = sub_2188A5E4C();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        v28 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v27 = 138412290;
        v29 = v5;
        v30 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v56 = v30;
        sub_2188A5EC4();
        *v28 = v30;

        _os_log_impl(&dword_21885E000, v25, v26, "copyCertificate: Failed to apply persona: %@", v27, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v28, -1, -1);
        MEMORY[0x219A1C06C](v27, -1, -1);

      }
      else
      {

      }
    }
    if (v53)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v31 = sub_2188A5C9C();
      __swift_project_value_buffer(v31, (uint64_t)qword_254FFEE30);
      v32 = sub_2188A5C84();
      v33 = sub_2188A5E58();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v34 = 67109120;
        swift_beginAccess();
        LODWORD(v56) = v53;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v32, v33, "copyCertificate: status %d", v34, 8u);
        MEMORY[0x219A1C06C](v34, -1, -1);
      }

      swift_beginAccess();
      v35 = v53;
      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v36 = v35;
      *(_QWORD *)(v36 + 8) = 0;
      *(_BYTE *)(v36 + 16) = 0;
    }
    else
    {
      if (v58[0])
      {
        v37 = (const void *)swift_unknownObjectRetain();
        v38 = CFGetTypeID(v37);
        if (v38 == SecCertificateGetTypeID())
        {
          if (qword_254FFC850 != -1)
            swift_once();
          v39 = sub_2188A5C9C();
          __swift_project_value_buffer(v39, (uint64_t)qword_254FFEE30);
          v40 = sub_2188A5C84();
          v41 = sub_2188A5E40();
          if (os_log_type_enabled(v40, v41))
          {
            v42 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v42 = 0;
            _os_log_impl(&dword_21885E000, v40, v41, "copyCertificate: succeeded", v42, 2u);
            MEMORY[0x219A1C06C](v42, -1, -1);
          }

          type metadata accessor for SecCertificate(0);
          v35 = swift_dynamicCastUnknownClassUnconditional();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          return v35;
        }
        if (qword_254FFC850 != -1)
          swift_once();
        v48 = sub_2188A5C9C();
        __swift_project_value_buffer(v48, (uint64_t)qword_254FFEE30);
        v49 = sub_2188A5C84();
        v50 = sub_2188A5E58();
        v35 = v50;
        if (os_log_type_enabled(v49, v50))
        {
          v51 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_21885E000, v49, (os_log_type_t)v35, "copyCertificate: returned wrong type", v51, 2u);
          MEMORY[0x219A1C06C](v51, -1, -1);
        }

        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v52 = 0;
        *(_QWORD *)(v52 + 8) = 0;
        *(_BYTE *)(v52 + 16) = 9;
        swift_willThrow();
        swift_unknownObjectRelease();
LABEL_17:
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v35;
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v43 = sub_2188A5C9C();
      __swift_project_value_buffer(v43, (uint64_t)qword_254FFEE30);
      v44 = sub_2188A5C84();
      v45 = sub_2188A5E58();
      v35 = v45;
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_21885E000, v44, (os_log_type_t)v35, "copyCertificate: returned nil", v46, 2u);
        MEMORY[0x219A1C06C](v46, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v47 = 0;
      *(_QWORD *)(v47 + 8) = 0;
      *(_BYTE *)(v47 + 16) = 9;
    }
    swift_willThrow();
    goto LABEL_17;
  }
  v16 = v15;
  result = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    v18 = sub_2188A5D20();
    v20 = v19;
    v57 = v14;
    LOBYTE(v56) = 1;
    sub_21887A73C(&v56, v55);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v58[0] = v16;
    sub_218898008(v55, v18, v20, isUniquelyReferenced_nonNull_native);
    v54 = v58[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ManagedKeychainPublic()
{
  return objc_opt_self();
}

uint64_t method lookup function for ManagedKeychainPublic()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static ManagedKeychainPublic.copyCertificate(persistentRef:scope:persona:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_21887B0BC()
{
  unint64_t result;

  result = qword_254FFC990;
  if (!qword_254FFC990)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8774, &type metadata for MKError);
    atomic_store(result, (unint64_t *)&qword_254FFC990);
  }
  return result;
}

uint64_t sub_21887B100(void *a1, uint64_t a2)
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  id v15;

  if ((a2 & 0xC000000000000001) != 0)
  {
    v3 = a1;
    v4 = sub_2188A5F18();

    return v4 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v6 = sub_2188A5EAC(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        v9 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    v12 = 0;
    return v12 & 1;
  }
  sub_21887CEB4(0, &qword_254FFC9A8);
  v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v8);
  v11 = sub_2188A5EB8();

  if ((v11 & 1) == 0)
  {
    v13 = ~v7;
    v14 = (v8 + 1) & v13;
    if (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      do
      {
        v15 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v14);
        v12 = sub_2188A5EB8();

        if ((v12 & 1) != 0)
          break;
        v14 = (v14 + 1) & v13;
      }
      while (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  v12 = 1;
  return v12 & 1;
}

uint64_t sub_21887B25C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  id v9;
  void *v10;
  id v11;

  swift_beginAccess();
  v8 = *(void **)(a3 + 16);
  *(_QWORD *)(a3 + 16) = a2;
  v9 = a2;

  swift_beginAccess();
  v10 = *(void **)(a4 + 16);
  *(_QWORD *)(a4 + 16) = a1;
  v11 = a1;

  return sub_2188A5E94();
}

void sub_21887B2F8(uint64_t a1, void *a2, void *a3)
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

uint64_t sub_21887B36C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MKACMEClient()
{
  return objc_opt_self();
}

void sub_21887B39C(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2188A5FA8();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9B0);
      v3 = sub_2188A5F48();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_2188A5FA8();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x219A1B688](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_2188A5EAC();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_21887CEB4(0, &qword_254FFC9A8);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_2188A5EB8();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_2188A5EB8();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_2188A5EAC();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_21887CEB4(0, &qword_254FFC9A8);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_2188A5EB8();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_2188A5EB8();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_21887B6F8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, NSObject *a5, uint64_t a6, unint64_t a7, char a8, uint64_t a9, uint64_t a10, id *a11, void **a12, unsigned __int8 a13, char a14)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  id v34;
  unsigned __int8 v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  char *v57;
  uint64_t inited;
  uint64_t v59;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char isUniquelyReferenced_nonNull_native;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void **v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  _BOOL4 v94;
  uint8_t *v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  char *v104;
  void *v105;
  _QWORD *v106;
  dispatch_semaphore_t v107;
  void *v108;
  NSObject *v109;
  char *v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  char *v114;
  void (*v115)(char *, uint64_t);
  uint64_t v116;
  NSObject *v117;
  os_log_type_t v118;
  uint8_t *v119;
  uint64_t v120;
  void **v121;
  uint64_t v122;
  NSObject *v123;
  os_log_type_t v124;
  uint8_t *v125;
  _QWORD *v126;
  void *v127;
  _QWORD *v128;
  id v129;
  uint64_t v130;
  id *v131;
  id v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  NSObject *v138;
  os_log_type_t v139;
  uint8_t *v140;
  uint64_t v141;
  NSObject *v142;
  os_log_type_t v143;
  _BOOL4 v144;
  uint64_t v145;
  uint8_t *v146;
  uint8_t *v147;
  uint64_t v148;
  __int128 v149;
  uint64_t v150;
  id v151;
  _QWORD v152[3];
  uint64_t v153;
  id *v154;
  void **v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  dispatch_semaphore_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  char *v163;
  char *v164;
  uint64_t v165;
  _QWORD *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  _OWORD v175[3];
  unint64_t v176;
  __int128 v177;
  void (*v178)(uint64_t, void *, void *);
  void *v179;
  uint64_t (*v180)(void *, void *);
  _QWORD *v181;
  uint64_t v182;

  v159 = a5;
  v160 = a3;
  v161 = a4;
  v182 = *MEMORY[0x24BDAC8D0];
  v19 = sub_2188A5CA8();
  v167 = *(_QWORD *)(v19 - 8);
  v168 = v19;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v166 = (_QWORD *)((char *)v152 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v169 = sub_2188A5CD8();
  v165 = *(_QWORD *)(v169 - 8);
  v21 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v163 = (char *)v152 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v164 = (char *)v152 - v23;
  v24 = sub_2188A5CC0();
  v157 = *(_QWORD *)(v24 - 8);
  v158 = v24;
  MEMORY[0x24BDAC7A8](v24);
  v162 = (char *)v152 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_2188A5C0C();
  v27 = *(_QWORD *)(v26 - 8);
  v171 = v26;
  v172 = v27;
  MEMORY[0x24BDAC7A8](v26);
  v170 = (char *)v152 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9B8);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)v152 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v173 = (uint64_t)v152 - v33;
  if ((a8 & 1) != 0)
  {
    v34 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v35 = objc_msgSend(v34, sel_hasSEP);

    if ((v35 & 1) == 0)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v38 = sub_2188A5C9C();
      __swift_project_value_buffer(v38, (uint64_t)qword_254FFEE30);
      v39 = sub_2188A5C84();
      v40 = sub_2188A5E4C();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_21885E000, v39, v40, "requestCert: Hardware-bound key requested on device without a SEP", v41, 2u);
        MEMORY[0x219A1C06C](v41, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v42 = 0xD000000000000032;
      *(_QWORD *)(v42 + 8) = 0x80000002188AB310;
      goto LABEL_13;
    }
  }
  if (sub_2188A5D20() == a6 && v36 == a7)
    goto LABEL_5;
  v37 = sub_2188A6038();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
    if (sub_2188A5D20() == a6 && v44 == a7)
    {
LABEL_5:
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    v45 = sub_2188A6038();
    swift_bridgeObjectRelease();
    if ((v45 & 1) == 0)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v137 = sub_2188A5C9C();
      __swift_project_value_buffer(v137, (uint64_t)qword_254FFEE30);
      swift_bridgeObjectRetain_n();
      v138 = sub_2188A5C84();
      v139 = sub_2188A5E4C();
      if (os_log_type_enabled(v138, v139))
      {
        v140 = (uint8_t *)swift_slowAlloc();
        v141 = swift_slowAlloc();
        *(_QWORD *)&v177 = v141;
        *(_DWORD *)v140 = 136446210;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v175[0] = sub_2188A17DC(a6, a7, (uint64_t *)&v177);
        sub_2188A5EC4();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21885E000, v138, v139, "requestCert: Invalid ACME keyType %{public}s", v140, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v141, -1, -1);
        MEMORY[0x219A1C06C](v140, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      *(_QWORD *)&v177 = 0;
      *((_QWORD *)&v177 + 1) = 0xE000000000000000;
      sub_2188A5F54();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v177 = 0xD000000000000016;
      *((_QWORD *)&v177 + 1) = 0x80000002188AB280;
      sub_2188A5D98();
      v149 = v177;
      sub_21887B0BC();
      swift_allocError();
      *(_OWORD *)v42 = v149;
LABEL_13:
      *(_BYTE *)(v42 + 16) = 7;
      return swift_willThrow();
    }
  }
LABEL_17:
  v46 = v171;
  v47 = sub_2188A5D20();
  v49 = v48;
  v50 = v173;
  sub_2188A5C00();
  sub_21887CE0C(v50, (uint64_t)v32);
  v51 = v172;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v172 + 48))(v32, 1, v46) != 1)
  {
    LODWORD(v156) = a13;
    v155 = a12;
    v154 = a11;
    v153 = a10;
    v57 = v170;
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v170, v32, v46);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2188A8690;
    *(_QWORD *)(inited + 32) = sub_2188A5D20();
    *(_QWORD *)(inited + 40) = v59;
    *(_QWORD *)(inited + 72) = v46;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
    (*(void (**)(uint64_t *, char *, uint64_t))(v51 + 16))(boxed_opaque_existential_0, v57, v46);
    *(_QWORD *)(inited + 80) = sub_2188A5D20();
    *(_QWORD *)(inited + 88) = v61;
    *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 96) = a8 & 1;
    *(_QWORD *)(inited + 128) = sub_2188A5D20();
    *(_QWORD *)(inited + 136) = v62;
    v63 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 168) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 144) = v47;
    *(_QWORD *)(inited + 152) = v49;
    v64 = sub_2188A5D20();
    v65 = MEMORY[0x24BEE1E88];
    *(_QWORD *)(inited + 176) = v64;
    *(_QWORD *)(inited + 184) = v66;
    *(_QWORD *)(inited + 216) = v65;
    *(_QWORD *)(inited + 192) = v159;
    *(_QWORD *)(inited + 224) = sub_2188A5D20();
    *(_QWORD *)(inited + 232) = v67;
    *(_QWORD *)(inited + 264) = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9C0);
    *(_QWORD *)(inited + 240) = v153;
    *(_QWORD *)(inited + 272) = sub_2188A5D20();
    *(_QWORD *)(inited + 280) = v68;
    *(_QWORD *)(inited + 312) = v65;
    *(_QWORD *)(inited + 288) = v154;
    *(_QWORD *)(inited + 320) = sub_2188A5D20();
    *(_QWORD *)(inited + 328) = v69;
    v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9C8);
    *(_QWORD *)(inited + 360) = v70;
    *(_QWORD *)(inited + 336) = v155;
    *(_QWORD *)(inited + 368) = sub_2188A5D20();
    *(_QWORD *)(inited + 376) = v71;
    *(_QWORD *)(inited + 408) = v63;
    v72 = v161;
    *(_QWORD *)(inited + 384) = v160;
    *(_QWORD *)(inited + 392) = v72;
    *(_QWORD *)(inited + 416) = sub_2188A5D20();
    *(_QWORD *)(inited + 424) = v73;
    v74 = sub_2188A5D20();
    *(_QWORD *)(inited + 456) = v63;
    *(_QWORD *)(inited + 432) = v74;
    *(_QWORD *)(inited + 440) = v75;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v76 = sub_218875DE8(inited);
    v174 = v76;
    if ((v156 & 1) == 0)
      goto LABEL_30;
    v77 = v76;
    v78 = objc_msgSend((id)objc_opt_self(), sel_oidsAnonymous_nonce_coresidency_, a14 & 1, 1, 0);
    if (v78)
    {
      v79 = v78;
      v80 = sub_2188A5E04();

      v81 = sub_2188A5D20();
      v83 = v82;
      if (v80)
      {
        v179 = (void *)v70;
        *(_QWORD *)&v177 = v80;
        sub_21887A73C(&v177, v175);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v176 = v77;
        v174 = 0x8000000000000000;
        sub_218898008(v175, v81, v83, isUniquelyReferenced_nonNull_native);
        v174 = v176;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_30;
      }
    }
    else
    {
      v81 = sub_2188A5D20();
      v83 = v87;
    }
    sub_218897740(v81, v83, v175);
    swift_bridgeObjectRelease();
    sub_21887CF8C((uint64_t)v175, &qword_254FFC9E0);
LABEL_30:
    v159 = dispatch_semaphore_create(0);
    v88 = swift_allocObject();
    *(_QWORD *)(v88 + 16) = 0;
    v89 = swift_allocObject();
    v160 = v89;
    *(_QWORD *)(v89 + 16) = 0;
    v90 = (void **)(v89 + 16);
    if (qword_254FFC850 != -1)
      swift_once();
    v155 = v90;
    v91 = sub_2188A5C9C();
    v156 = __swift_project_value_buffer(v91, (uint64_t)qword_254FFEE30);
    v92 = sub_2188A5C84();
    v93 = sub_2188A5E40();
    v94 = os_log_type_enabled(v92, v93);
    v161 = v88;
    v154 = (id *)(v88 + 16);
    if (v94)
    {
      v95 = (uint8_t *)swift_slowAlloc();
      v153 = swift_slowAlloc();
      *(_QWORD *)&v177 = v153;
      *(_DWORD *)v95 = 136446210;
      v152[1] = v95 + 4;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v152[2] = MEMORY[0x24BEE4AD8] + 8;
      v96 = sub_2188A5D08();
      v98 = v97;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v175[0] = sub_2188A17DC(v96, v98, (uint64_t *)&v177);
      sub_2188A5EC4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21885E000, v92, v93, "requestCert: SecRequestClientIdentity() with parameters %{public}s", v95, 0xCu);
      v99 = v153;
      v88 = v161;
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v99, -1, -1);
      MEMORY[0x219A1C06C](v95, -1, -1);
    }

    v101 = v157;
    v100 = v158;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8F8);
    v102 = (void *)sub_2188A5DEC();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v103 = (void *)sub_2188A5CF0();
    swift_bridgeObjectRelease();
    sub_21887CEB4(0, &qword_254FFC9D0);
    v104 = v162;
    (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v162, *MEMORY[0x24BEE5490], v100);
    v105 = (void *)sub_2188A5E70();
    (*(void (**)(char *, uint64_t))(v101 + 8))(v104, v100);
    v106 = (_QWORD *)swift_allocObject();
    v107 = v159;
    v106[2] = v160;
    v106[3] = v88;
    v106[4] = v107;
    v180 = sub_21887CF20;
    v181 = v106;
    *(_QWORD *)&v177 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v177 + 1) = 1107296256;
    v178 = sub_21887B2F8;
    v179 = &block_descriptor;
    v108 = _Block_copy(&v177);
    swift_retain();
    swift_retain();
    v109 = v107;
    swift_release();
    SecRequestClientIdentity();
    _Block_release(v108);

    v110 = v163;
    sub_2188A5CCC();
    v112 = v166;
    v111 = v167;
    *v166 = 60;
    v113 = v168;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v111 + 104))(v112, *MEMORY[0x24BEE5420], v168);
    v114 = v164;
    MEMORY[0x219A1B400](v110, v112);
    (*(void (**)(_QWORD *, uint64_t))(v111 + 8))(v112, v113);
    v115 = *(void (**)(char *, uint64_t))(v165 + 8);
    v116 = v169;
    v115(v110, v169);
    sub_2188A5E7C();
    v115(v114, v116);
    if ((sub_2188A5CB4() & 1) != 0)
    {
      v117 = sub_2188A5C84();
      v118 = sub_2188A5E4C();
      if (os_log_type_enabled(v117, v118))
      {
        v119 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v119 = 0;
        _os_log_impl(&dword_21885E000, v117, v118, "requestCert: ACME request timed out", v119, 2u);
        MEMORY[0x219A1C06C](v119, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v120 = 0xD000000000000011;
      *(_QWORD *)(v120 + 8) = 0x80000002188AB2F0;
      *(_BYTE *)(v120 + 16) = 7;
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v172 + 8))(v170, v171);
      goto LABEL_59;
    }
    v121 = v155;
    swift_beginAccess();
    v122 = v172;
    if (!*v121)
    {
      v131 = v154;
      swift_beginAccess();
      if (*v131)
      {
        v132 = *v131;

        (*(void (**)(char *, uint64_t))(v122 + 8))(v170, v171);
        sub_21887CF8C(v173, &qword_254FFC9B8);
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        return (uint64_t)v132;
      }
      v142 = sub_2188A5C84();
      v143 = sub_2188A5E58();
      v144 = os_log_type_enabled(v142, v143);
      v145 = v171;
      if (v144)
      {
        v146 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v146 = 0;
        _os_log_impl(&dword_21885E000, v142, v143, "requestCert: ACME request failed, no identity", v146, 2u);
        v147 = v146;
        v122 = v172;
        MEMORY[0x219A1C06C](v147, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_OWORD *)v148 = xmmword_2188A86A0;
      *(_BYTE *)(v148 + 16) = 9;
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v122 + 8))(v170, v145);
      goto LABEL_59;
    }
    swift_retain_n();
    v123 = sub_2188A5C84();
    v124 = sub_2188A5E4C();
    if (os_log_type_enabled(v123, v124))
    {
      v125 = (uint8_t *)swift_slowAlloc();
      v126 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v125 = 138543362;
      v127 = *v121;
      if (*v121)
      {
        type metadata accessor for CFError(0);
        sub_21887CF44();
        swift_allocError();
        *v128 = v127;
        v129 = v127;
        v130 = _swift_stdlib_bridgeErrorToNSError();
        v176 = v130;
        sub_2188A5EC4();
      }
      else
      {
        v176 = 0;
        sub_2188A5EC4();
        v130 = 0;
      }
      *v126 = v130;
      swift_release_n();
      _os_log_impl(&dword_21885E000, v123, v124, "requestCert: ACME request failed, %{public}@", v125, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v126, -1, -1);
      MEMORY[0x219A1C06C](v125, -1, -1);

      v133 = v171;
      v134 = *v155;
      if (!*v155)
        goto LABEL_57;
    }
    else
    {

      swift_release_n();
      v133 = v171;
      v134 = *v121;
      if (!*v121)
      {
LABEL_57:
        v135 = 0;
        goto LABEL_58;
      }
    }
    type metadata accessor for CFError(0);
    sub_21887CF44();
    v135 = swift_allocError();
    *v136 = v134;
LABEL_58:
    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v150 = v135;
    *(_QWORD *)(v150 + 8) = 0;
    *(_BYTE *)(v150 + 16) = 8;
    v151 = v134;
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v172 + 8))(v170, v133);
LABEL_59:
    sub_21887CF8C(v173, &qword_254FFC9B8);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_21887CF8C((uint64_t)v32, &qword_254FFC9B8);
  if (qword_254FFC850 != -1)
    swift_once();
  v52 = sub_2188A5C9C();
  __swift_project_value_buffer(v52, (uint64_t)qword_254FFEE30);
  swift_bridgeObjectRetain_n();
  v53 = sub_2188A5C84();
  v54 = sub_2188A5E4C();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    *(_QWORD *)&v177 = v56;
    *(_DWORD *)v55 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v175[0] = sub_2188A17DC(a1, a2, (uint64_t *)&v177);
    sub_2188A5EC4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21885E000, v53, v54, "requestCert: Invalid DirectoryURL %{public}s", v55, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1C06C](v56, -1, -1);
    MEMORY[0x219A1C06C](v55, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)&v177 = 0;
  *((_QWORD *)&v177 + 1) = 0xE000000000000000;
  sub_2188A5F54();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v177 = 0xD000000000000016;
  *((_QWORD *)&v177 + 1) = 0x80000002188AB2A0;
  sub_2188A5D98();
  v85 = v177;
  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v86 = v85;
  *(_BYTE *)(v86 + 16) = 7;
  swift_willThrow();
  return sub_21887CF8C(v173, &qword_254FFC9B8);
}

void sub_21887CAA0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, NSObject *a5, uint64_t a6, unint64_t a7, int a8, uint64_t a9, uint64_t a10, id *a11, void **a12, unsigned __int8 a13, char a14, uint64_t a15, unint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v22;
  unint64_t inited;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint8_t *v35;
  NSObject *v36;
  void *v41;
  int v42;
  unsigned __int8 v43;

  v17 = v16;
  v42 = a8;
  v19 = a6;
  v22 = a3;
  v43 = a13;
  if ((a13 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9A0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2188A86B0;
    sub_21887CEB4(0, &qword_254FFC9A8);
    *(_QWORD *)(inited + 32) = sub_2188A5EA0();
    *(_QWORD *)(inited + 40) = sub_2188A5EA0();
    *(_QWORD *)(inited + 48) = sub_2188A5EA0();
    v41 = (void *)inited;
    sub_2188A5E10();
    if (inited >> 62)
    {
      swift_bridgeObjectRetain();
      v24 = sub_2188A5FA8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = *(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v36 = a5;
    v25 = v17;
    if (v24)
    {
      sub_21887B39C(inited);
      v27 = v26;
    }
    else
    {
      v27 = MEMORY[0x24BEE4B08];
    }
    swift_bridgeObjectRelease();
    v28 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v29 = objc_msgSend(v28, sel_chipID);

    LOBYTE(v28) = sub_21887B100(v29, v27);
    swift_bridgeObjectRelease();
    v17 = v25;
    a5 = v36;
    v22 = a3;
    v19 = a6;
    if ((v28 & 1) != 0)
    {
      v43 = 0;
      if (qword_254FFC850 != -1)
        swift_once();
      v30 = sub_2188A5C9C();
      __swift_project_value_buffer(v30, (uint64_t)qword_254FFEE30);
      v31 = sub_2188A5C84();
      v32 = sub_2188A5E4C();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = v17;
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_21885E000, v31, v32, "requestCert: Ignoring request for attesation on unsupported device", v34, 2u);
        v35 = v34;
        v17 = v33;
        a5 = v36;
        MEMORY[0x219A1C06C](v35, -1, -1);
      }

      v22 = a3;
      v19 = a6;
    }
  }
  v41 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21889D014(a15, a16, &v41, a1, a2, v22, a4, a5, v19, a7, v42 & 1, a9, a10, a11, a12, &v43, a14 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17)
  {

  }
  else if (!v41)
  {
    __break(1u);
  }
}

uint64_t sub_21887CE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_21887CE90()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21887CEB4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21887CEEC()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21887CF20(void *a1, void *a2)
{
  uint64_t v2;

  return sub_21887B25C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_21887CF44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254FFC9D8;
  if (!qword_254FFC9D8)
  {
    type metadata accessor for CFError(255);
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BDCFD90], v1);
    atomic_store(result, (unint64_t *)&qword_254FFC9D8);
  }
  return result;
}

uint64_t sub_21887CF8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_21887CFCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t inited;
  void *v7;
  id v8;
  const __CFData *v9;
  const __CFDictionary *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  char v16;
  CFArrayRef v17;
  unint64_t v18;
  uint64_t v19;
  const __CFArray *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  const __CFArray *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  CFArrayRef items[2];

  items[1] = *(CFArrayRef *)MEMORY[0x24BDAC8D0];
  items[0] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A86D0;
  v7 = (void *)*MEMORY[0x24BDE9270];
  *(_QWORD *)(inited + 64) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 32) = v7;
  *(_QWORD *)(inited + 40) = a3;
  *(_QWORD *)(inited + 48) = a4;
  v8 = v7;
  swift_bridgeObjectRetain();
  sub_218875930(inited);
  v9 = (const __CFData *)sub_2188A5C24();
  type metadata accessor for CFString(0);
  sub_21887E1AC();
  v10 = (const __CFDictionary *)sub_2188A5CF0();
  swift_bridgeObjectRelease();
  LODWORD(a4) = SecPKCS12Import(v9, v10, items);

  if ((_DWORD)a4)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v11 = sub_2188A5C9C();
    __swift_project_value_buffer(v11, (uint64_t)qword_254FFEE30);
    v12 = sub_2188A5C84();
    v13 = sub_2188A5E4C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v14 = 67109120;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v12, v13, "storePKCS12: Unable to decode PKCS12: %d", v14, 8u);
      MEMORY[0x219A1C06C](v14, -1, -1);
    }

    sub_2188A5F54();
    swift_bridgeObjectRelease();
    sub_2188A602C();
    sub_2188A5D98();
    swift_bridgeObjectRelease();
    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v15 = 0xD00000000000001ELL;
    *(_QWORD *)(v15 + 8) = 0x80000002188AB4A0;
    v16 = 2;
LABEL_7:
    *(_BYTE *)(v15 + 16) = v16;
    swift_willThrow();
LABEL_8:

    return;
  }
  v17 = items[0];
  if (!items[0])
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v25 = sub_2188A5C9C();
    __swift_project_value_buffer(v25, (uint64_t)qword_254FFEE30);
    v26 = sub_2188A5C84();
    v27 = sub_2188A5E4C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_21885E000, v26, v27, "storePKCS12: No result from SecPKCS12Import", v28, 2u);
      MEMORY[0x219A1C06C](v28, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v15 = xmmword_2188A86A0;
    v16 = 9;
    goto LABEL_7;
  }
  v18 = sub_2188A5E04();
  if (!(v18 >> 62))
  {
    v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    v20 = v17;
    if (v19 == 1)
      goto LABEL_12;
LABEL_36:
    if (qword_254FFC850 == -1)
    {
LABEL_37:
      v41 = sub_2188A5C9C();
      __swift_project_value_buffer(v41, (uint64_t)qword_254FFEE30);
      swift_bridgeObjectRetain();
      v42 = sub_2188A5C84();
      v43 = sub_2188A5E4C();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v44 = 134217984;
        sub_2188A5EC4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21885E000, v42, v43, "storePKCS12: Wrong number of items in P12. Expected 1, got %ld", v44, 0xCu);
        MEMORY[0x219A1C06C](v44, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease();
      }
      sub_2188A5F54();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2188A602C();
      sub_2188A5D98();
      swift_bridgeObjectRelease();
      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v45 = 0xD000000000000028;
      *(_QWORD *)(v45 + 8) = 0x80000002188AB4C0;
      *(_BYTE *)(v45 + 16) = 2;
      swift_willThrow();

      goto LABEL_8;
    }
LABEL_43:
    swift_once();
    goto LABEL_37;
  }
  v39 = v17;
  swift_bridgeObjectRetain();
  v40 = sub_2188A5FA8();
  swift_bridgeObjectRelease();
  if (v40 != 1)
    goto LABEL_36;
LABEL_12:
  if ((v18 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      swift_unknownObjectRetain();
      goto LABEL_15;
    }
    __break(1u);
    goto LABEL_43;
  }
  MEMORY[0x219A1B688](0, v18);
LABEL_15:
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9F8);
  if (!swift_dynamicCast())
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v29 = sub_2188A5C9C();
    __swift_project_value_buffer(v29, (uint64_t)qword_254FFEE30);
    v30 = sub_2188A5C84();
    v31 = sub_2188A5E58();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_21885E000, v30, v31, "storePKCS12: Bad return type from SecPKCS12Import", v32, 2u);
      MEMORY[0x219A1C06C](v32, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v33 = xmmword_2188A86A0;
    v34 = 9;
    goto LABEL_34;
  }
  v21 = sub_2188A5D20();
  if (!*(_QWORD *)(v46 + 16) || (v23 = sub_2188767BC(v21, v22), (v24 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_254FFC850 != -1)
      swift_once();
    v35 = sub_2188A5C9C();
    __swift_project_value_buffer(v35, (uint64_t)qword_254FFEE30);
    v36 = sub_2188A5C84();
    v37 = sub_2188A5E4C();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_21885E000, v36, v37, "storePKCS12: No SecIdentity found in result from SecPKCS12Import", v38, 2u);
      MEMORY[0x219A1C06C](v38, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v33 = 0xD000000000000029;
    *(_QWORD *)(v33 + 8) = 0x80000002188AB4F0;
    v34 = 2;
LABEL_34:
    *(_BYTE *)(v33 + 16) = v34;
    swift_willThrow();

    swift_unknownObjectRelease();
    goto LABEL_8;
  }
  *(id *)(*(_QWORD *)(v46 + 56) + 8 * v23);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

SecCertificateRef sub_21887D87C()
{
  const __CFData *v0;
  SecCertificateRef v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;

  v0 = (const __CFData *)sub_2188A5C24();
  v1 = SecCertificateCreateWithData(0, v0);

  if (!v1)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v2 = sub_2188A5C9C();
    __swift_project_value_buffer(v2, (uint64_t)qword_254FFEE30);
    v3 = sub_2188A5C84();
    v4 = sub_2188A5E4C();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21885E000, v3, v4, "storeDER: Unable to decode DER data", v5, 2u);
      MEMORY[0x219A1C06C](v5, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v6 = 0xD000000000000019;
    *(_QWORD *)(v6 + 8) = 0x80000002188AB480;
    *(_BYTE *)(v6 + 16) = 2;
    swift_willThrow();
  }
  return v1;
}

SecCertificateRef sub_21887D9C0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  SecCertificateRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  _QWORD v57[2];
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9E8);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v57 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2188A5D68();
  MEMORY[0x24BDAC7A8]();
  v4 = (SecCertificateRef)((char *)v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2188A5D5C();
  v5 = sub_2188A5D38();
  if (!v6)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v30 = sub_2188A5C9C();
    __swift_project_value_buffer(v30, (uint64_t)qword_254FFEE30);
    v31 = sub_2188A5C84();
    v32 = sub_2188A5E4C();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_21885E000, v31, v32, "storePEM: Unable to decode PEM data, not a string", v33, 2u);
      MEMORY[0x219A1C06C](v33, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    v28 = 0xD000000000000027;
    v29 = "Unable to decode PEM data: not a string";
    goto LABEL_29;
  }
  v7 = v5;
  v8 = v6;
  v60 = v5;
  v61 = v6;
  v57[1] = v0;
  v58 = 0xD00000000000001BLL;
  v59 = 0x80000002188AB380;
  v9 = sub_2188A5C54();
  v10 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56);
  v10(v2, 1, 1, v9);
  sub_21887A1AC();
  v11 = sub_2188A5EF4();
  v62 = v12;
  v14 = v13;
  sub_21887E16C((uint64_t)v2);
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_254FFC850 != -1)
      swift_once();
    v34 = sub_2188A5C9C();
    __swift_project_value_buffer(v34, (uint64_t)qword_254FFEE30);
    v35 = sub_2188A5C84();
    v36 = sub_2188A5E4C();
    v4 = (SecCertificateRef)0xD000000000000019;
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_21885E000, v35, v36, "storePEM: Unable to decode PEM data, header not found", v37, 2u);
      MEMORY[0x219A1C06C](v37, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    v28 = 0xD00000000000002BLL;
    v29 = "Unable to decode PEM data: header not found";
    goto LABEL_29;
  }
  v60 = v7;
  v61 = v8;
  v58 = 0xD000000000000019;
  v59 = 0x80000002188AB3D0;
  v10(v2, 1, 1, v9);
  v15 = sub_2188A5EF4();
  v17 = v16;
  v19 = v18;
  sub_21887E16C((uint64_t)v2);
  swift_bridgeObjectRelease();
  if ((v19 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_254FFC850 != -1)
      swift_once();
    v38 = sub_2188A5C9C();
    __swift_project_value_buffer(v38, (uint64_t)qword_254FFEE30);
    v39 = sub_2188A5C84();
    v40 = sub_2188A5E4C();
    v4 = (SecCertificateRef)0xD000000000000019;
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_21885E000, v39, v40, "storePEM: Unable to decode PEM data, footer not found", v41, 2u);
      MEMORY[0x219A1C06C](v41, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    v28 = 0xD00000000000002BLL;
    v29 = "Unable to decode PEM data: footer not found";
    goto LABEL_29;
  }
  v20 = v11 >> 14;
  v21 = v15 >> 14;
  if (v11 >> 14 < v15 >> 14)
  {
    v22 = v62 >> 14;
    if (v20 >= v17 >> 14 || v21 == v17 >> 14 || v20 == v22 || v21 >= v22)
    {
      if (v21 < v22)
      {
        __break(1u);
      }
      else
      {
        v43 = sub_2188A5DBC();
        v45 = v44;
        v47 = v46;
        v49 = v48;
        swift_bridgeObjectRelease();
        MEMORY[0x219A1B49C](v43, v45, v47, v49);
        swift_bridgeObjectRelease();
        v50 = sub_2188A5C18();
        v52 = v51;
        swift_bridgeObjectRelease();
        if (v52 >> 60 != 15)
        {
          v4 = sub_21887D87C();
          sub_21887A154(v50, v52);
          return v4;
        }
        if (qword_254FFC850 == -1)
          goto LABEL_35;
      }
      swift_once();
LABEL_35:
      v53 = sub_2188A5C9C();
      __swift_project_value_buffer(v53, (uint64_t)qword_254FFEE30);
      v54 = sub_2188A5C84();
      v55 = sub_2188A5E4C();
      v4 = (SecCertificateRef)0xD000000000000019;
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v56 = 0;
        _os_log_impl(&dword_21885E000, v54, v55, "storePEM: Unable to decode PEM data", v56, 2u);
        MEMORY[0x219A1C06C](v56, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v27 = 0xD000000000000019;
      *(_QWORD *)(v27 + 8) = 0x80000002188AB460;
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_254FFC850 != -1)
    swift_once();
  v23 = sub_2188A5C9C();
  __swift_project_value_buffer(v23, (uint64_t)qword_254FFEE30);
  v24 = sub_2188A5C84();
  v25 = sub_2188A5E4C();
  v4 = (SecCertificateRef)0xD000000000000019;
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_21885E000, v24, v25, "storePEM: Unable to decode PEM data, invalid header/footer combination", v26, 2u);
    MEMORY[0x219A1C06C](v26, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  v28 = 0xD00000000000003CLL;
  v29 = "Unable to decode PEM data: invalid header/footer combination";
LABEL_29:
  *(_QWORD *)v27 = v28;
  *(_QWORD *)(v27 + 8) = (unint64_t)(v29 - 32) | 0x8000000000000000;
LABEL_30:
  *(_BYTE *)(v27 + 16) = 2;
  swift_willThrow();
  return v4;
}

uint64_t sub_21887E16C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21887E1AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254FFC970;
  if (!qword_254FFC970)
  {
    type metadata accessor for CFString(255);
    result = MEMORY[0x219A1BFE8](&unk_2188A85B0, v1);
    atomic_store(result, (unint64_t *)&qword_254FFC970);
  }
  return result;
}

id sub_21887E1F8(id result, id a2, char a3)
{
  switch(a3)
  {
    case 1:
    case 4:
    case 5:
    case 6:
    case 8:
      result = result;
      break;
    case 2:
    case 3:
    case 7:
      result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

void destroy for MKError(uint64_t a1)
{
  sub_21887E244(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_21887E244(void *a1, id a2, char a3)
{
  switch(a3)
  {
    case 1:
    case 4:
    case 5:
    case 6:
    case 8:

      break;
    case 2:
    case 3:
    case 7:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t _s16RemoteManagement7MKErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21887E1F8(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MKError(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21887E1F8(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_21887E244(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MKError(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_21887E244(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MKError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF7 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 247);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 9)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MKError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF6)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 247;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF7)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xF7)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_21887E400(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 8u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 9);
}

uint64_t sub_21887E41C(uint64_t result, unsigned int a2)
{
  if (a2 >= 9)
  {
    *(_QWORD *)result = a2 - 9;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 9;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MKError()
{
  return &type metadata for MKError;
}

void sub_21887E448(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_21887E4A4()
{
  uint64_t v0;

  *(_QWORD *)v0 = 0;
  *(_QWORD *)(v0 + 8) = 0xE000000000000000;
  sub_2188A5F54();
  swift_bridgeObjectRelease();
  strcpy((char *)v0, "System error: ");
  *(_BYTE *)(v0 + 15) = -18;
  sub_2188A602C();
  sub_2188A5D98();
  swift_bridgeObjectRelease();
  return *(_QWORD *)v0;
}

void sub_21887E8E4()
{
  JUMPOUT(0x21887E8CCLL);
}

void sub_21887E918()
{
  uint64_t v0;

  sub_21887E448(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_21887E930()
{
  return 1;
}

uint64_t sub_21887E938()
{
  sub_2188A608C();
  sub_2188A6098();
  return sub_2188A60A4();
}

uint64_t sub_21887E978()
{
  return sub_2188A6098();
}

uint64_t sub_21887E99C()
{
  sub_2188A608C();
  sub_2188A6098();
  return sub_2188A60A4();
}

uint64_t sub_21887E9DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21887F83C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_21887EA04()
{
  return 0;
}

void sub_21887EA10(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_21887EA1C()
{
  sub_21887EEFC();
  return sub_2188A60C8();
}

uint64_t sub_21887EA44()
{
  sub_21887EEFC();
  return sub_2188A60D4();
}

uint64_t sub_21887EA6C()
{
  uint64_t v0;

  sub_21887A168(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MKPrimaryKeyCert()
{
  return objc_opt_self();
}

uint64_t sub_21887EAB0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v9;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCA20);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21887EEFC();
  sub_2188A60BC();
  v9 = *(_OWORD *)(v2 + 16);
  sub_21887F624();
  sub_2188A6020();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_21887EBAC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCA08);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21887EEFC();
  sub_2188A60B0();
  if (v2)
  {
    type metadata accessor for MKPrimaryKeyCert();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_21887EF60();
    sub_2188A5FFC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_OWORD *)(v1 + 16) = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_21887ECFC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for MKPrimaryKeyCert();
  v5 = swift_allocObject();
  result = sub_21887EBAC(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_21887ED50(_QWORD *a1)
{
  return sub_21887EAB0(a1);
}

uint64_t sub_21887ED70()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *v0;
  sub_2188A608C();
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  sub_21887A110(v2, v3);
  sub_2188A5C48();
  sub_21887A168(v2, v3);
  return sub_2188A60A4();
}

uint64_t sub_21887EDD4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  sub_21887A110(v2, v3);
  sub_2188A5C48();
  return sub_21887A168(v2, v3);
}

uint64_t sub_21887EE24()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  sub_2188A608C();
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  sub_21887A110(v1, v2);
  sub_2188A5C48();
  sub_21887A168(v1, v2);
  return sub_2188A60A4();
}

void sub_21887EE84(uint64_t *a1)
{
  sub_21887F4E4(*a1);
}

unint64_t sub_21887EE94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254FFCA00;
  if (!qword_254FFCA00)
  {
    v1 = type metadata accessor for MKPrimaryKeyCert();
    result = MEMORY[0x219A1BFE8](&unk_2188A87F4, v1);
    atomic_store(result, (unint64_t *)&qword_254FFCA00);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21887EEFC()
{
  unint64_t result;

  result = qword_254FFCA10;
  if (!qword_254FFCA10)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8970, &type metadata for MKPrimaryKeyCert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCA10);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_21887EF60()
{
  unint64_t result;

  result = qword_254FFCA18;
  if (!qword_254FFCA18)
  {
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254FFCA18);
  }
  return result;
}

void sub_21887EFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_21887F004(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x21887F1E8);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_21887F20C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21887F268()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_21887EFA4((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_21887A168(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_21887F430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_2188A5B34();
  v11 = result;
  if (result)
  {
    result = sub_2188A5B4C();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_2188A5B40();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_21887EFA4(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_21887F4E4(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_21887F520()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_21887F554 + dword_21887F614[v0 >> 62]))();
}

uint64_t sub_21887F564@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_21887A110(v3, v4);
      sub_21887F20C(v1, v2);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

unint64_t sub_21887F624()
{
  unint64_t result;

  result = qword_254FFCA28;
  if (!qword_254FFCA28)
  {
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254FFCA28);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MKPrimaryKeyCert.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MKPrimaryKeyCert.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21887F700 + 4 * byte_2188A87C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21887F720 + 4 * byte_2188A87C5[v4]))();
}

_BYTE *sub_21887F700(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21887F720(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21887F728(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21887F730(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21887F738(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21887F740(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21887F74C()
{
  return 0;
}

ValueMetadata *type metadata accessor for MKPrimaryKeyCert.CodingKeys()
{
  return &type metadata for MKPrimaryKeyCert.CodingKeys;
}

unint64_t sub_21887F768()
{
  unint64_t result;

  result = qword_254FFCA30;
  if (!qword_254FFCA30)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8948, &type metadata for MKPrimaryKeyCert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCA30);
  }
  return result;
}

unint64_t sub_21887F7B0()
{
  unint64_t result;

  result = qword_254FFCA38;
  if (!qword_254FFCA38)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A88B8, &type metadata for MKPrimaryKeyCert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCA38);
  }
  return result;
}

unint64_t sub_21887F7F8()
{
  unint64_t result;

  result = qword_254FFCA40;
  if (!qword_254FFCA40)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A88E0, &type metadata for MKPrimaryKeyCert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCA40);
  }
  return result;
}

uint64_t sub_21887F83C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6574736973726570 && a2 == 0xED0000666552746ELL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2188A6038();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_21887F8D8()
{
  return 0x6574736973726570;
}

uint64_t sub_21887F8FC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x4B5079656BLL;
  else
    return 0x4B5074726563;
}

BOOL sub_21887F92C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21887F944()
{
  sub_2188A608C();
  sub_2188A6098();
  return sub_2188A60A4();
}

uint64_t sub_21887F988()
{
  return sub_2188A6098();
}

uint64_t sub_21887F9B0()
{
  sub_2188A608C();
  sub_2188A6098();
  return sub_2188A60A4();
}

uint64_t sub_21887F9F0()
{
  char *v0;

  return sub_21887F8FC(*v0);
}

uint64_t sub_21887F9F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_218880454(a1, a2);
  *a3 = result;
  return result;
}

void sub_21887FA1C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_21887FA28()
{
  sub_21888017C();
  return sub_2188A60C8();
}

uint64_t sub_21887FA50()
{
  sub_21888017C();
  return sub_2188A60D4();
}

uint64_t sub_21887FA78()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MKPrimaryKeyIdentity()
{
  return objc_opt_self();
}

uint64_t sub_21887FAC4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCA70);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21888017C();
  sub_2188A60BC();
  v11 = *(_QWORD *)(v3 + 16);
  HIBYTE(v10) = 0;
  type metadata accessor for MKPrimaryKeyCert();
  sub_2188801C0(&qword_254FFCA78, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyCert, (uint64_t)&unk_2188A885C);
  sub_2188A6020();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + 24);
    HIBYTE(v10) = 1;
    type metadata accessor for MKPrimaryKeyKey();
    sub_2188801C0(&qword_254FFCA80, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyKey, (uint64_t)&unk_2188A8C7C);
    sub_2188A6020();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_21887FC50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  sub_2188A608C();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  swift_retain();
  sub_21887A110(v2, v3);
  sub_2188A5C48();
  sub_21887A168(v2, v3);
  swift_release();
  v4 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  swift_retain();
  sub_21887A110(v5, v6);
  sub_2188A5C48();
  sub_21887A168(v5, v6);
  swift_release();
  return sub_2188A60A4();
}

uint64_t sub_21887FD0C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCA50);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21888017C();
  sub_2188A60B0();
  if (v2)
  {
    type metadata accessor for MKPrimaryKeyIdentity();
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for MKPrimaryKeyCert();
    v10 = 0;
    sub_2188801C0(&qword_254FFCA60, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyCert, (uint64_t)&unk_2188A8884);
    sub_2188A5FFC();
    *(_QWORD *)(v1 + 16) = v11;
    type metadata accessor for MKPrimaryKeyKey();
    v10 = 1;
    sub_2188801C0(&qword_254FFCA68, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyKey, (uint64_t)&unk_2188A8CA4);
    sub_2188A5FFC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_QWORD *)(v1 + 24) = v11;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_21887FF0C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for MKPrimaryKeyIdentity();
  v5 = swift_allocObject();
  result = sub_21887FD0C(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_21887FF60(_QWORD *a1)
{
  return sub_21887FAC4(a1);
}

uint64_t sub_21887FF80()
{
  return sub_21887FC50();
}

uint64_t sub_21887FFA0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 24);
  swift_retain();
  sub_21887A110(v3, v4);
  sub_2188A5C48();
  sub_21887A168(v3, v4);
  swift_release();
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24);
  swift_retain();
  sub_21887A110(v6, v7);
  sub_2188A5C48();
  sub_21887A168(v6, v7);
  return swift_release();
}

uint64_t sub_21888004C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  sub_2188A608C();
  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 24);
  swift_retain();
  sub_21887A110(v3, v4);
  sub_2188A5C48();
  sub_21887A168(v3, v4);
  swift_release();
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24);
  swift_retain();
  sub_21887A110(v6, v7);
  sub_2188A5C48();
  sub_21887A168(v6, v7);
  swift_release();
  return sub_2188A60A4();
}

void sub_218880108(uint64_t *a1)
{
  uint64_t v1;
  char v2;

  v1 = *a1;
  sub_21887F4E4(*(_QWORD *)(*a1 + 16));
  if ((v2 & 1) != 0)
    sub_2188808B0(*(_QWORD *)(v1 + 24));
}

uint64_t sub_218880150(uint64_t a1, uint64_t a2)
{
  return sub_2188801C0(&qword_254FFCA48, a2, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyIdentity, (uint64_t)&unk_2188A8A08);
}

unint64_t sub_21888017C()
{
  unint64_t result;

  result = qword_254FFCA58;
  if (!qword_254FFCA58)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8B84, &type metadata for MKPrimaryKeyIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCA58);
  }
  return result;
}

uint64_t sub_2188801C0(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x219A1BFE8](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MKPrimaryKeyIdentity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MKPrimaryKeyIdentity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2188802E8 + 4 * byte_2188A89D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21888031C + 4 * byte_2188A89D0[v4]))();
}

uint64_t sub_21888031C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_218880324(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21888032CLL);
  return result;
}

uint64_t sub_218880338(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x218880340);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_218880344(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21888034C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_218880358(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_218880360(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MKPrimaryKeyIdentity.CodingKeys()
{
  return &type metadata for MKPrimaryKeyIdentity.CodingKeys;
}

unint64_t sub_218880380()
{
  unint64_t result;

  result = qword_254FFCA88;
  if (!qword_254FFCA88)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8B5C, &type metadata for MKPrimaryKeyIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCA88);
  }
  return result;
}

unint64_t sub_2188803C8()
{
  unint64_t result;

  result = qword_254FFCA90;
  if (!qword_254FFCA90)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8ACC, &type metadata for MKPrimaryKeyIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCA90);
  }
  return result;
}

unint64_t sub_218880410()
{
  unint64_t result;

  result = qword_254FFCA98;
  if (!qword_254FFCA98)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8AF4, &type metadata for MKPrimaryKeyIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCA98);
  }
  return result;
}

uint64_t sub_218880454(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4B5074726563 && a2 == 0xE600000000000000;
  if (v3 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4B5079656BLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2188A6038();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21888052C()
{
  sub_2188809F0();
  return sub_2188A60C8();
}

uint64_t sub_218880554()
{
  sub_2188809F0();
  return sub_2188A60D4();
}

uint64_t type metadata accessor for MKPrimaryKeyKey()
{
  return objc_opt_self();
}

uint64_t sub_21888059C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v9;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCAB8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2188809F0();
  sub_2188A60BC();
  v9 = *(_OWORD *)(v2 + 16);
  sub_21887F624();
  sub_2188A6020();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_218880698(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCAA8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2188809F0();
  sub_2188A60B0();
  if (v2)
  {
    type metadata accessor for MKPrimaryKeyKey();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_21887EF60();
    sub_2188A5FFC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_OWORD *)(v1 + 16) = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_2188807E8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for MKPrimaryKeyKey();
  v5 = swift_allocObject();
  result = sub_218880698(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_21888083C(_QWORD *a1)
{
  return sub_21888059C(a1);
}

void sub_21888085C(uint64_t *a1)
{
  sub_2188808B0(*a1);
}

unint64_t sub_21888086C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254FFCAA0;
  if (!qword_254FFCAA0)
  {
    v1 = type metadata accessor for MKPrimaryKeyKey();
    result = MEMORY[0x219A1BFE8](&unk_2188A8C14, v1);
    atomic_store(result, (unint64_t *)&qword_254FFCAA0);
  }
  return result;
}

void sub_2188808B0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2188808EC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_218880920 + *((int *)qword_2188809E0 + (v0 >> 62))))();
}

uint64_t sub_218880930@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_21887A110(v3, v4);
      sub_21887F20C(v1, v2);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

unint64_t sub_2188809F0()
{
  unint64_t result;

  result = qword_254FFCAB0;
  if (!qword_254FFCAB0)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8D90, &type metadata for MKPrimaryKeyKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCAB0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MKPrimaryKeyKey.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_218880A74 + 4 * byte_2188A8BE0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_218880A94 + 4 * byte_2188A8BE5[v4]))();
}

_BYTE *sub_218880A74(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_218880A94(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_218880A9C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_218880AA4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_218880AAC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_218880AB4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MKPrimaryKeyKey.CodingKeys()
{
  return &type metadata for MKPrimaryKeyKey.CodingKeys;
}

unint64_t sub_218880AD4()
{
  unint64_t result;

  result = qword_254FFCAC0;
  if (!qword_254FFCAC0)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8D68, &type metadata for MKPrimaryKeyKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCAC0);
  }
  return result;
}

unint64_t sub_218880B1C()
{
  unint64_t result;

  result = qword_254FFCAC8;
  if (!qword_254FFCAC8)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8CD8, &type metadata for MKPrimaryKeyKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCAC8);
  }
  return result;
}

unint64_t sub_218880B64()
{
  unint64_t result;

  result = qword_254FFCAD0;
  if (!qword_254FFCAD0)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8D00, &type metadata for MKPrimaryKeyKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCAD0);
  }
  return result;
}

uint64_t sub_218880BA8()
{
  sub_218880F2C();
  return sub_2188A60C8();
}

uint64_t sub_218880BD0()
{
  sub_218880F2C();
  return sub_2188A60D4();
}

uint64_t type metadata accessor for MKPrimaryKeyPassword()
{
  return objc_opt_self();
}

uint64_t sub_218880C18(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v9;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCAF0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_218880F2C();
  sub_2188A60BC();
  v9 = *(_OWORD *)(v2 + 16);
  sub_21887F624();
  sub_2188A6020();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_218880D14(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCAE0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_218880F2C();
  sub_2188A60B0();
  if (v2)
  {
    type metadata accessor for MKPrimaryKeyPassword();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_21887EF60();
    sub_2188A5FFC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_OWORD *)(v1 + 16) = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_218880E64@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for MKPrimaryKeyPassword();
  v5 = swift_allocObject();
  result = sub_218880D14(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_218880EB8(_QWORD *a1)
{
  return sub_218880C18(a1);
}

void sub_218880ED8(uint64_t *a1)
{
  sub_218880F70(*a1);
}

unint64_t sub_218880EE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254FFCAD8;
  if (!qword_254FFCAD8)
  {
    v1 = type metadata accessor for MKPrimaryKeyPassword();
    result = MEMORY[0x219A1BFE8](&unk_2188A8E18, v1);
    atomic_store(result, (unint64_t *)&qword_254FFCAD8);
  }
  return result;
}

unint64_t sub_218880F2C()
{
  unint64_t result;

  result = qword_254FFCAE8;
  if (!qword_254FFCAE8)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8F94, &type metadata for MKPrimaryKeyPassword.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCAE8);
  }
  return result;
}

void sub_218880F70(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_218880FAC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_218880FE0 + *((int *)qword_2188810A0 + (v0 >> 62))))();
}

uint64_t sub_218880FF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_21887A110(v3, v4);
      sub_21887F20C(v1, v2);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t storeEnumTagSinglePayload for MKPrimaryKeyPassword.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2188810F0 + 4 * byte_2188A8DE0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_218881110 + 4 * byte_2188A8DE5[v4]))();
}

_BYTE *sub_2188810F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_218881110(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_218881118(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_218881120(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_218881128(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_218881130(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MKPrimaryKeyPassword.CodingKeys()
{
  return &type metadata for MKPrimaryKeyPassword.CodingKeys;
}

unint64_t sub_218881150()
{
  unint64_t result;

  result = qword_254FFCAF8;
  if (!qword_254FFCAF8)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8F6C, &type metadata for MKPrimaryKeyPassword.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCAF8);
  }
  return result;
}

unint64_t sub_218881198()
{
  unint64_t result;

  result = qword_254FFCB00;
  if (!qword_254FFCB00)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8EDC, &type metadata for MKPrimaryKeyPassword.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCB00);
  }
  return result;
}

unint64_t sub_2188811E0()
{
  unint64_t result;

  result = qword_254FFCB08;
  if (!qword_254FFCB08)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A8F04, &type metadata for MKPrimaryKeyPassword.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCB08);
  }
  return result;
}

void sub_218881224()
{
  strcpy((char *)&qword_254FFEE48, "RepoMetadata");
  unk_254FFEE55 = 0;
  unk_254FFEE56 = -5120;
}

void sub_218881250()
{
  strcpy((char *)&qword_254FFEE58, "RepoMetadata");
  unk_254FFEE65 = 0;
  unk_254FFEE66 = -5120;
}

uint64_t sub_21888127C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint8_t *v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  os_log_type_t v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  int v52;
  unint64_t v53;
  _OWORD v54[2];
  __int128 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A8FF0;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v11;
  v12 = sub_2188A5D20();
  v13 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v12;
  *(_QWORD *)(inited + 56) = v14;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v15;
  if (qword_254FFC858 != -1)
    swift_once();
  v16 = qword_254FFEE48;
  v17 = unk_254FFEE50;
  *(_QWORD *)(inited + 120) = v13;
  *(_QWORD *)(inited + 96) = v16;
  *(_QWORD *)(inited + 104) = v17;
  *(_QWORD *)(inited + 128) = sub_2188A5D20();
  *(_QWORD *)(inited + 136) = v18;
  v19 = qword_254FFC860;
  swift_bridgeObjectRetain();
  if (v19 != -1)
    swift_once();
  v20 = qword_254FFEE58;
  v21 = unk_254FFEE60;
  *(_QWORD *)(inited + 168) = v13;
  *(_QWORD *)(inited + 144) = v20;
  *(_QWORD *)(inited + 152) = v21;
  *(_QWORD *)(inited + 176) = sub_2188A5D20();
  *(_QWORD *)(inited + 184) = v22;
  *(_QWORD *)(inited + 216) = v13;
  *(_QWORD *)(inited + 192) = a4;
  *(_QWORD *)(inited + 200) = a5;
  *(_QWORD *)(inited + 224) = sub_2188A5D20();
  *(_QWORD *)(inited + 232) = v23;
  v24 = (void *)*MEMORY[0x24BDE8F70];
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 264) = v25;
  *(_QWORD *)(inited + 240) = v24;
  *(_QWORD *)(inited + 272) = sub_2188A5D20();
  *(_QWORD *)(inited + 280) = v26;
  v27 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 312) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 288) = 1;
  *(_QWORD *)(inited + 320) = sub_2188A5D20();
  *(_QWORD *)(inited + 328) = v28;
  v29 = sub_2188A5D20();
  *(_QWORD *)(inited + 360) = v13;
  *(_QWORD *)(inited + 336) = v29;
  *(_QWORD *)(inited + 344) = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31 = v24;
  v32 = sub_218875DE8(inited);
  v53 = v32;
  if (a1 != 1)
  {
LABEL_8:
    *(_QWORD *)&v54[0] = 0;
    v52 = 0;
    sub_21889BD58(a2, a3, &v52, (uint64_t)&v53, (uint64_t)v54);
    if (v52)
    {
      if (v52 == -25300)
      {
LABEL_23:
        type metadata accessor for MKRepo();
        v51 = swift_allocObject();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_218882690(a1, a2, a3, a4, a5);
        goto LABEL_24;
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v39 = sub_2188A5C9C();
      __swift_project_value_buffer(v39, (uint64_t)qword_254FFEE30);
      v40 = sub_2188A5C84();
      v41 = sub_2188A5E58();
      if (!os_log_type_enabled(v40, v41))
      {
LABEL_22:

        goto LABEL_23;
      }
      v42 = a1;
      v43 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v43 = 67109120;
      swift_beginAccess();
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v40, v41, "deserialize: Metadata lookup status %d", v43, 8u);
      v44 = v43;
      a1 = v42;
    }
    else
    {
      if (*(_QWORD *)&v54[0])
      {
        swift_unknownObjectRetain();
        if ((swift_dynamicCast() & 1) != 0)
        {
          v45 = v55;
          sub_2188A5B94();
          swift_allocObject();
          sub_2188A5B88();
          type metadata accessor for MKRepo();
          sub_2188801C0(&qword_254FFCCC0, v46, (uint64_t (*)(uint64_t))type metadata accessor for MKRepo, (uint64_t)&unk_2188A90E0);
          sub_2188A5B7C();
          swift_release();
          sub_21887A168(v45, *((unint64_t *)&v45 + 1));
          v51 = v55;
LABEL_24:
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          return v51;
        }
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v47 = sub_2188A5C9C();
      __swift_project_value_buffer(v47, (uint64_t)qword_254FFEE30);
      v40 = sub_2188A5C84();
      v48 = sub_2188A5E58();
      if (!os_log_type_enabled(v40, v48))
        goto LABEL_22;
      v49 = a1;
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_21885E000, v40, v48, "deserialize: Metadata lookup wrong type", v50, 2u);
      v44 = v50;
      a1 = v49;
    }
    MEMORY[0x219A1C06C](v44, -1, -1);
    goto LABEL_22;
  }
  v33 = v32;
  result = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    v35 = sub_2188A5D20();
    v37 = v36;
    v56 = v27;
    LOBYTE(v55) = 1;
    sub_21887A73C(&v55, v54);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_218898008(v54, v35, v37, isUniquelyReferenced_nonNull_native);
    v53 = v33;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = 1;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_218881BE8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  _OWORD v51[2];
  __int128 v52;
  uint64_t v53;
  OSStatus v54;
  unint64_t v55;

  v1 = v0;
  sub_2188A5BC4();
  swift_allocObject();
  sub_2188A5BB8();
  sub_2188A5BA0();
  *(_QWORD *)&v52 = v0;
  type metadata accessor for MKRepo();
  sub_2188801C0(&qword_254FFCC68, v2, (uint64_t (*)(uint64_t))type metadata accessor for MKRepo, (uint64_t)&unk_2188A90B8);
  v3 = sub_2188A5BAC();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A9000;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v7;
  v8 = sub_2188A5D20();
  v9 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v8;
  *(_QWORD *)(inited + 56) = v10;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v11;
  sub_21887A110(v3, v5);
  if (qword_254FFC858 != -1)
    swift_once();
  v12 = qword_254FFEE48;
  v13 = unk_254FFEE50;
  *(_QWORD *)(inited + 120) = v9;
  *(_QWORD *)(inited + 96) = v12;
  *(_QWORD *)(inited + 104) = v13;
  *(_QWORD *)(inited + 128) = sub_2188A5D20();
  *(_QWORD *)(inited + 136) = v14;
  v15 = qword_254FFC860;
  swift_bridgeObjectRetain();
  if (v15 != -1)
    swift_once();
  v16 = qword_254FFEE58;
  v17 = unk_254FFEE60;
  *(_QWORD *)(inited + 168) = v9;
  *(_QWORD *)(inited + 144) = v16;
  *(_QWORD *)(inited + 152) = v17;
  *(_QWORD *)(inited + 176) = sub_2188A5D20();
  *(_QWORD *)(inited + 184) = v18;
  v19 = v1[5];
  v20 = v1[6];
  *(_QWORD *)(inited + 216) = v9;
  *(_QWORD *)(inited + 192) = v19;
  *(_QWORD *)(inited + 200) = v20;
  *(_QWORD *)(inited + 224) = sub_2188A5D20();
  *(_QWORD *)(inited + 232) = v21;
  v22 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 264) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 240) = 1;
  *(_QWORD *)(inited + 272) = sub_2188A5D20();
  *(_QWORD *)(inited + 280) = v23;
  v24 = (void *)*MEMORY[0x24BDE8F70];
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 312) = v25;
  *(_QWORD *)(inited + 288) = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = v24;
  v27 = sub_218875DE8(inited);
  v55 = v27;
  if (v1[2] == 1)
  {
    v28 = v27;
    result = *MEMORY[0x24BDE9538];
    if (!*MEMORY[0x24BDE9538])
    {
      __break(1u);
      return result;
    }
    v30 = sub_2188A5D20();
    v32 = v31;
    v53 = v22;
    LOBYTE(v52) = 1;
    sub_21887A73C(&v52, v51);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v55 = 0x8000000000000000;
    sub_218898008(v51, v30, v32, isUniquelyReferenced_nonNull_native);
    v55 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v54 = 0;
  v34 = v1[3];
  v35 = v1[4];
  sub_21889BE40(v34, v35, &v54);
  v50 = v3;
  if (v54 && v54 != -25300)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v39 = sub_2188A5C9C();
    __swift_project_value_buffer(v39, (uint64_t)qword_254FFEE30);
    v37 = sub_2188A5C84();
    v38 = sub_2188A5E58();
    if (!os_log_type_enabled(v37, v38))
      goto LABEL_18;
  }
  else
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v36 = sub_2188A5C9C();
    __swift_project_value_buffer(v36, (uint64_t)qword_254FFEE30);
    v37 = sub_2188A5C84();
    v38 = sub_2188A5E40();
    if (!os_log_type_enabled(v37, v38))
      goto LABEL_18;
  }
  v40 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v40 = 67109120;
  swift_beginAccess();
  LODWORD(v52) = v54;
  sub_2188A5EC4();
  _os_log_impl(&dword_21885E000, v37, v38, "serialize: status %d", v40, 8u);
  MEMORY[0x219A1C06C](v40, -1, -1);
LABEL_18:

  v41 = sub_2188A5D20();
  v43 = v42;
  v53 = MEMORY[0x24BDCDDE8];
  *(_QWORD *)&v52 = v50;
  *((_QWORD *)&v52 + 1) = v5;
  sub_21887A73C(&v52, v51);
  v44 = v55;
  v45 = swift_isUniquelyReferenced_nonNull_native();
  v55 = 0x8000000000000000;
  sub_218898008(v51, v41, v43, v45);
  v55 = v44;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LODWORD(v51[0]) = 0;
  sub_21889BE88(v34, v35, (OSStatus *)v51);
  if (LODWORD(v51[0]))
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v46 = sub_2188A5C9C();
    __swift_project_value_buffer(v46, (uint64_t)qword_254FFEE30);
    v47 = sub_2188A5C84();
    v48 = sub_2188A5E58();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v49 = 67109120;
      swift_beginAccess();
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v47, v48, "serialize: SecItemAdd status %d", v49, 8u);
      MEMORY[0x219A1C06C](v49, -1, -1);
    }
    sub_21887A168(v50, v5);
    swift_release();

  }
  else
  {
    sub_21887A168(v50, v5);
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

_QWORD *sub_218882690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v11;

  v11 = MEMORY[0x24BEE4AF8];
  v5[7] = sub_218875A5C(MEMORY[0x24BEE4AF8]);
  v5[8] = sub_218875A68(v11);
  v5[9] = sub_218875A74(v11);
  v5[10] = sub_218875A80(v11);
  v5[11] = sub_218875A8C(v11);
  v5[12] = sub_218875BAC(v11);
  v5[13] = sub_218875CB0(v11);
  v5[14] = sub_218875A68(v11);
  v5[15] = sub_218875CBC(v11);
  v5[16] = sub_218875A80(v11);
  v5[17] = sub_218875CC8(v11);
  v5[18] = sub_218875BAC(v11);
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = a3;
  v5[5] = a4;
  v5[6] = a5;
  return v5;
}

unint64_t sub_21888277C()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  char v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  char v78;
  _OWORD v80[2];
  __int128 v81;
  uint64_t v82;

  v1 = v0;
  v2 = sub_218875DE8(MEMORY[0x24BEE4AF8]);
  v3 = v1[2];
  v82 = MEMORY[0x24BEE1768];
  *(_QWORD *)&v81 = v3;
  sub_21887A73C(&v81, v80);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0x65706F6373, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v5 = v1[3];
  v6 = v1[4];
  v82 = MEMORY[0x24BEE0D00];
  if (!v6)
    v5 = 45;
  v7 = 0xE100000000000000;
  if (v6)
    v7 = v6;
  *(_QWORD *)&v81 = v5;
  *((_QWORD *)&v81 + 1) = v7;
  sub_21887A73C(&v81, v80);
  swift_bridgeObjectRetain();
  v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0x616E6F73726570, 0xE700000000000000, v8);
  v9 = v2;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v10 = swift_bridgeObjectRetain();
  v11 = sub_2188835C8(v10);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v11 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC910);
    v12 = sub_2188A5FCC();
  }
  else
  {
    v12 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v12;
  v13 = (_QWORD *)swift_bridgeObjectRetain();
  sub_2188861E0(v13, 1, &v81);
  swift_bridgeObjectRelease();
  v14 = v81;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCC70);
  v82 = v15;
  *(_QWORD *)&v81 = v14;
  sub_21887A73C(&v81, v80);
  v16 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0x436F547465737361, 0xED00004B50747265, v16);
  v17 = v9;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v18 = swift_bridgeObjectRetain();
  v19 = sub_218883380(v18);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v19 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC908);
    v20 = sub_2188A5FCC();
  }
  else
  {
    v20 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v20;
  v21 = (_QWORD *)swift_bridgeObjectRetain();
  sub_218885E64(v21, 1, &v81);
  swift_bridgeObjectRelease();
  v22 = v81;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCC78);
  v82 = v23;
  *(_QWORD *)&v81 = v22;
  sub_21887A73C(&v81, v80);
  v24 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0x65524B5074726563, 0xEE00746E756F4366, v24);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v25 = swift_bridgeObjectRetain();
  v26 = sub_2188835C8(v25);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v26 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC910);
    v27 = sub_2188A5FCC();
  }
  else
  {
    v27 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v27;
  v28 = (_QWORD *)swift_bridgeObjectRetain();
  sub_2188861E0(v28, 1, &v81);
  swift_bridgeObjectRelease();
  v82 = v15;
  sub_21887A73C(&v81, v80);
  v29 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0x4B6F547465737361, 0xEC0000004B507965, v29);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v30 = swift_bridgeObjectRetain();
  v31 = sub_218883380(v30);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v31 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC908);
    v32 = sub_2188A5FCC();
  }
  else
  {
    v32 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v32;
  v33 = (_QWORD *)swift_bridgeObjectRetain();
  sub_218885E64(v33, 1, &v81);
  swift_bridgeObjectRelease();
  v82 = v23;
  sub_21887A73C(&v81, v80);
  v34 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0x6665524B5079656BLL, 0xED0000746E756F43, v34);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v35 = swift_bridgeObjectRetain();
  v36 = sub_2188835C8(v35);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v36 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC910);
    v37 = sub_2188A5FCC();
  }
  else
  {
    v37 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v37;
  v38 = (_QWORD *)swift_bridgeObjectRetain();
  sub_2188861E0(v38, 1, &v81);
  swift_bridgeObjectRelease();
  v82 = v15;
  sub_21887A73C(&v81, v80);
  v39 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0xD000000000000011, 0x80000002188AB750, v39);
  v40 = v17;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v41 = swift_bridgeObjectRetain();
  v42 = sub_218883380(v41);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v42 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC908);
    v43 = sub_2188A5FCC();
  }
  else
  {
    v43 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v43;
  v44 = (_QWORD *)swift_bridgeObjectRetain();
  sub_218885E64(v44, 1, &v81);
  swift_bridgeObjectRelease();
  v82 = v23;
  sub_21887A73C(&v81, v80);
  v45 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0xD000000000000012, 0x80000002188AB770, v45);
  v46 = v40;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v47 = swift_bridgeObjectRetain();
  v48 = sub_218883824(v47);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v48 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC900);
    v49 = sub_2188A5FCC();
  }
  else
  {
    v49 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v49;
  v50 = (_QWORD *)swift_bridgeObjectRetain();
  sub_218885AD4(v50, 1, &v81);
  swift_bridgeObjectRelease();
  v51 = v81;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCC80);
  v82 = v52;
  *(_QWORD *)&v81 = v51;
  sub_21887A73C(&v81, v80);
  v53 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0xD00000000000001DLL, 0x80000002188AB790, v53);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v54 = swift_bridgeObjectRetain();
  v55 = sub_218883380(v54);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v55 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC908);
    v56 = sub_2188A5FCC();
  }
  else
  {
    v56 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v56;
  v57 = (_QWORD *)swift_bridgeObjectRetain();
  sub_218885E64(v57, 1, &v81);
  swift_bridgeObjectRelease();
  v82 = v23;
  sub_21887A73C(&v81, v80);
  v58 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0xD000000000000016, 0x80000002188AB7B0, v58);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v59 = swift_bridgeObjectRetain();
  v60 = sub_218883824(v59);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v60 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC900);
    v61 = sub_2188A5FCC();
  }
  else
  {
    v61 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v61;
  v62 = (_QWORD *)swift_bridgeObjectRetain();
  sub_218885AD4(v62, 1, &v81);
  swift_bridgeObjectRelease();
  v82 = v52;
  sub_21887A73C(&v81, v80);
  v63 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0xD00000000000001CLL, 0x80000002188AB7D0, v63);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v64 = swift_bridgeObjectRetain();
  v65 = sub_218883380(v64);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v65 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC908);
    v66 = sub_2188A5FCC();
  }
  else
  {
    v66 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v66;
  v67 = (_QWORD *)swift_bridgeObjectRetain();
  sub_218885E64(v67, 1, &v81);
  swift_bridgeObjectRelease();
  v82 = v23;
  sub_21887A73C(&v81, v80);
  v68 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0xD000000000000015, 0x80000002188AB7F0, v68);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v69 = swift_bridgeObjectRetain();
  v70 = sub_218883824(v69);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v70 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC900);
    v71 = sub_2188A5FCC();
  }
  else
  {
    v71 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v71;
  v72 = (_QWORD *)swift_bridgeObjectRetain();
  sub_218885AD4(v72, 1, &v81);
  swift_bridgeObjectRelease();
  v82 = v52;
  sub_21887A73C(&v81, v80);
  v73 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0xD000000000000021, 0x80000002188AB810, v73);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v74 = swift_bridgeObjectRetain();
  v75 = sub_218883380(v74);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v75 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC908);
    v76 = sub_2188A5FCC();
  }
  else
  {
    v76 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v81 = v76;
  v77 = (_QWORD *)swift_bridgeObjectRetain();
  sub_218885E64(v77, 1, &v81);
  swift_bridgeObjectRelease();
  v82 = v23;
  sub_21887A73C(&v81, v80);
  v78 = swift_isUniquelyReferenced_nonNull_native();
  sub_218898008(v80, 0xD00000000000001ALL, 0x80000002188AB840, v78);
  swift_bridgeObjectRelease();
  return v46;
}

uint64_t sub_218883380(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v3 = a1;
  v30 = MEMORY[0x24BEE4AF8];
  sub_218886598(0, v1, 0);
  v2 = v30;
  result = sub_218886C24(v3);
  v6 = result;
  v7 = 0;
  v8 = v3 + 64;
  v24 = v3 + 80;
  v25 = v1;
  v26 = v5;
  v27 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v3 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v3 + 36) != v5)
      goto LABEL_24;
    v28 = v7;
    v29 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
    swift_retain();
    v12 = sub_2188A5C30();
    v14 = v13;
    result = swift_release();
    v15 = v3;
    v17 = *(_QWORD *)(v30 + 16);
    v16 = *(_QWORD *)(v30 + 24);
    if (v17 >= v16 >> 1)
      result = sub_218886598(v16 > 1, v17 + 1, 1);
    *(_QWORD *)(v30 + 16) = v17 + 1;
    v18 = (_QWORD *)(v30 + 24 * v17);
    v18[4] = v12;
    v18[5] = v14;
    v18[6] = v29;
    v9 = 1 << *(_BYTE *)(v15 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = v27;
    v19 = *(_QWORD *)(v27 + 8 * v11);
    if ((v19 & (1 << v6)) == 0)
      goto LABEL_26;
    v3 = v15;
    v5 = v26;
    if (*(_DWORD *)(v15 + 36) != v26)
      goto LABEL_27;
    v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v25;
    }
    else
    {
      v21 = v11 + 1;
      v22 = (unint64_t)(v9 + 63) >> 6;
      v10 = v25;
      if (v11 + 1 < v22)
      {
        v23 = *(_QWORD *)(v27 + 8 * v21);
        if (v23)
        {
LABEL_20:
          v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            v23 = *(_QWORD *)(v24 + 8 * v11++);
            if (v23)
            {
              v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v7 = v28 + 1;
    v6 = v9;
    if (v28 + 1 == v10)
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

uint64_t sub_2188835C8(uint64_t a1)
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
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v30 = MEMORY[0x24BEE4AF8];
  sub_2188865B4(0, v1, 0);
  v2 = v30;
  result = sub_218886C24(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v24 = v1;
  v25 = v5;
  v26 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_24;
    v27 = v7;
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
    v13 = v12[1];
    v29 = *v12;
    swift_bridgeObjectRetain_n();
    swift_retain();
    v28 = sub_2188A5C30();
    v15 = v14;
    swift_release();
    result = swift_bridgeObjectRelease();
    v17 = *(_QWORD *)(v30 + 16);
    v16 = *(_QWORD *)(v30 + 24);
    if (v17 >= v16 >> 1)
      result = sub_2188865B4(v16 > 1, v17 + 1, 1);
    *(_QWORD *)(v30 + 16) = v17 + 1;
    v18 = (_QWORD *)(v30 + 32 * v17);
    v18[4] = v29;
    v18[5] = v13;
    v18[6] = v28;
    v18[7] = v15;
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = a1 + 64;
    v19 = *(_QWORD *)(v26 + 8 * v11);
    if ((v19 & (1 << v6)) == 0)
      goto LABEL_26;
    v5 = v25;
    if (*(_DWORD *)(a1 + 36) != v25)
      goto LABEL_27;
    v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v24;
    }
    else
    {
      v21 = v11 + 1;
      v22 = (unint64_t)(v9 + 63) >> 6;
      v10 = v24;
      if (v11 + 1 < v22)
      {
        v23 = *(_QWORD *)(v26 + 8 * v21);
        if (v23)
        {
LABEL_20:
          v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            v23 = *(_QWORD *)(a1 + 80 + 8 * v11++);
            if (v23)
            {
              v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v7 = v27 + 1;
    v6 = v9;
    if (v27 + 1 == v10)
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

uint64_t sub_218883824(uint64_t a1)
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v33 = MEMORY[0x24BEE4AF8];
  sub_21888657C(0, v1, 0);
  v2 = v33;
  result = sub_218886C24(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v28 = v1;
  v29 = v5;
  v30 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_24;
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
    v14 = *v12;
    v13 = v12[1];
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = sub_218883A68(v14, v13, v15);
    v31 = v17;
    v32 = v16;
    v19 = v18;
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v21 = *(_QWORD *)(v33 + 16);
    v20 = *(_QWORD *)(v33 + 24);
    if (v21 >= v20 >> 1)
      result = sub_21888657C(v20 > 1, v21 + 1, 1);
    *(_QWORD *)(v33 + 16) = v21 + 1;
    v22 = (_QWORD *)(v33 + 24 * v21);
    v22[4] = v32;
    v22[5] = v31;
    v22[6] = v19;
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = a1 + 64;
    v23 = *(_QWORD *)(v30 + 8 * v11);
    if ((v23 & (1 << v6)) == 0)
      goto LABEL_26;
    v5 = v29;
    if (*(_DWORD *)(a1 + 36) != v29)
      goto LABEL_27;
    v24 = v23 & (-2 << (v6 & 0x3F));
    if (v24)
    {
      v9 = __clz(__rbit64(v24)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v28;
    }
    else
    {
      v25 = v11 + 1;
      v26 = (unint64_t)(v9 + 63) >> 6;
      v10 = v28;
      if (v11 + 1 < v26)
      {
        v27 = *(_QWORD *)(v30 + 8 * v25);
        if (v27)
        {
LABEL_20:
          v9 = __clz(__rbit64(v27)) + (v25 << 6);
        }
        else
        {
          while (v26 - 2 != v11)
          {
            v27 = *(_QWORD *)(a1 + 80 + 8 * v11++);
            if (v27)
            {
              v25 = v11 + 1;
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

uint64_t sub_218883A68(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2188A5FA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v5)
  {
LABEL_15:
    swift_bridgeObjectRetain();
    return a1;
  }
  v21 = MEMORY[0x24BEE4AF8];
  result = sub_2188865D0(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    if ((a3 & 0xC000000000000001) != 0)
    {
      v7 = 0;
      do
      {
        MEMORY[0x219A1B688](v7, a3);
        v8 = sub_2188A5C30();
        v10 = v9;
        swift_unknownObjectRelease();
        v12 = *(_QWORD *)(v21 + 16);
        v11 = *(_QWORD *)(v21 + 24);
        if (v12 >= v11 >> 1)
          sub_2188865D0(v11 > 1, v12 + 1, 1);
        ++v7;
        *(_QWORD *)(v21 + 16) = v12 + 1;
        v13 = v21 + 16 * v12;
        *(_QWORD *)(v13 + 32) = v8;
        *(_QWORD *)(v13 + 40) = v10;
      }
      while (v5 != v7);
    }
    else
    {
      v14 = a3 + 32;
      do
      {
        swift_retain();
        v15 = sub_2188A5C30();
        v17 = v16;
        swift_release();
        v19 = *(_QWORD *)(v21 + 16);
        v18 = *(_QWORD *)(v21 + 24);
        if (v19 >= v18 >> 1)
          sub_2188865D0(v18 > 1, v19 + 1, 1);
        *(_QWORD *)(v21 + 16) = v19 + 1;
        v20 = v21 + 16 * v19;
        *(_QWORD *)(v20 + 32) = v15;
        *(_QWORD *)(v20 + 40) = v17;
        v14 += 8;
        --v5;
      }
      while (v5);
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_218883C40(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_218883C78 + 4 * byte_2188A9010[a1]))(0xD000000000000011, 0x80000002188AB750);
}

uint64_t sub_218883C78()
{
  return 0x65706F6373;
}

uint64_t sub_218883C8C()
{
  return 0x616E6F73726570;
}

uint64_t sub_218883CA4()
{
  return 0x7247737365636361;
}

uint64_t sub_218883CC4()
{
  return 0x436F547465737361;
}

uint64_t sub_218883CE8()
{
  return 0x65524B5074726563;
}

uint64_t sub_218883D0C()
{
  return 0x4B6F547465737361;
}

uint64_t sub_218883D2C()
{
  return 0x6665524B5079656BLL;
}

uint64_t sub_218883D50(uint64_t a1)
{
  return a1 + 1;
}

BOOL sub_218883DC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_218883DDC()
{
  unsigned __int8 *v0;

  return sub_218883C40(*v0);
}

uint64_t sub_218883DE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_218886EE8(a1, a2);
  *a3 = result;
  return result;
}

void sub_218883E08(_BYTE *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_218883E14()
{
  sub_218884EB4();
  return sub_2188A60C8();
}

uint64_t sub_218883E3C()
{
  sub_218884EB4();
  return sub_2188A60D4();
}

uint64_t sub_218883E64()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_218883EE8()
{
  sub_218883E64();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MKRepo()
{
  return objc_opt_self();
}

uint64_t sub_218883F28(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v16[5];
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCBF0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_218884EB4();
  sub_2188A60BC();
  v30 = v3[2];
  LOBYTE(v29) = 0;
  sub_218885574();
  sub_2188A6020();
  if (!v2)
  {
    LOBYTE(v30) = 1;
    sub_2188A6008();
    LOBYTE(v30) = 2;
    sub_2188A6014();
    swift_beginAccess();
    v29 = v3[7];
    LOBYTE(v28) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB28);
    sub_2188855B8();
    sub_2188A6020();
    swift_beginAccess();
    v28 = v3[8];
    LOBYTE(v27) = 4;
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB38);
    v10 = sub_218885640();
    sub_2188A6020();
    swift_beginAccess();
    v27 = v3[9];
    LOBYTE(v26) = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB48);
    sub_2188856C8();
    sub_2188A6020();
    v16[4] = v10;
    v31 = v9;
    swift_beginAccess();
    v26 = v3[10];
    LOBYTE(v25) = 6;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB58);
    v12 = sub_218885750();
    sub_2188A6020();
    v16[2] = v12;
    v16[3] = v11;
    swift_beginAccess();
    v25 = v3[11];
    LOBYTE(v24) = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB68);
    sub_2188857D8();
    sub_2188A6020();
    swift_beginAccess();
    v24 = v3[12];
    LOBYTE(v23) = 8;
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB80);
    v14 = sub_218885860();
    sub_2188A6020();
    v16[1] = v13;
    swift_beginAccess();
    v23 = v3[13];
    LOBYTE(v22) = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB90);
    sub_2188858E8(&qword_254FFCC38, &qword_254FFCB90, (uint64_t (*)(void))sub_218885954);
    sub_2188A6020();
    v16[0] = v14;
    swift_beginAccess();
    v22 = v3[14];
    LOBYTE(v21) = 10;
    sub_2188A6020();
    swift_beginAccess();
    v21 = v3[15];
    LOBYTE(v20) = 11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCBB0);
    sub_2188858E8(&qword_254FFCC48, &qword_254FFCBB0, (uint64_t (*)(void))sub_2188859D4);
    sub_2188A6020();
    swift_beginAccess();
    v20 = v3[16];
    LOBYTE(v19) = 12;
    sub_2188A6020();
    swift_beginAccess();
    v19 = v3[17];
    LOBYTE(v18) = 13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCBD0);
    sub_2188858E8(&qword_254FFCC58, &qword_254FFCBD0, (uint64_t (*)(void))sub_218885A54);
    sub_2188A6020();
    swift_beginAccess();
    v18 = v3[18];
    v17 = 14;
    sub_2188A6020();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

_QWORD *sub_218884540(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB10);
  v58 = *(_QWORD *)(v4 - 8);
  v59 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v63 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BEE4AF8];
  v2[7] = sub_218875A5C(MEMORY[0x24BEE4AF8]);
  v57 = v2 + 7;
  v2[8] = sub_218875A68(v6);
  v56 = v2 + 8;
  v2[9] = sub_218875A74(v6);
  v55 = v2 + 9;
  v2[10] = sub_218875A80(v6);
  v54 = v2 + 10;
  v2[11] = sub_218875A8C(v6);
  v53 = v2 + 11;
  v2[12] = sub_218875BAC(v6);
  v52 = v2 + 12;
  v2[13] = sub_218875CB0(v6);
  v51 = v2 + 13;
  v2[14] = sub_218875A68(v6);
  v50 = v2 + 14;
  v2[15] = sub_218875CBC(v6);
  v7 = v2 + 15;
  v2[16] = sub_218875A80(v6);
  v8 = v2 + 16;
  v2[17] = sub_218875CC8(v6);
  v9 = v2 + 17;
  v10 = sub_218875BAC(v6);
  v62 = v2;
  v2[18] = v10;
  v11 = v2 + 18;
  v12 = a1[3];
  v60 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_218884EB4();
  v13 = v61;
  sub_2188A60B0();
  if (v13)
  {
    v14 = v62;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for MKRepo();
    swift_deallocPartialClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
  }
  else
  {
    v61 = v7;
    v48 = v11;
    v49 = v9;
    v16 = v57;
    v15 = v58;
    LOBYTE(v74) = 0;
    sub_218884EF8();
    sub_2188A5FFC();
    v17 = v62;
    v62[2] = v75;
    LOBYTE(v75) = 1;
    v17[3] = sub_2188A5FE4();
    v17[4] = v18;
    LOBYTE(v75) = 2;
    v17[5] = sub_2188A5FF0();
    v17[6] = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB28);
    LOBYTE(v75) = 3;
    sub_218884F3C();
    sub_2188A5FFC();
    v21 = v74;
    swift_beginAccess();
    *v16 = v21;
    swift_bridgeObjectRelease();
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB38);
    LOBYTE(v74) = 4;
    v23 = sub_218885008();
    sub_2188A5FFC();
    v57 = (_QWORD *)v23;
    v24 = v73;
    v25 = v56;
    swift_beginAccess();
    *v25 = v24;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB48);
    LOBYTE(v73) = 5;
    sub_218885090();
    sub_2188A5FFC();
    v56 = (_QWORD *)v22;
    v26 = v72;
    v27 = v55;
    swift_beginAccess();
    *v27 = v26;
    swift_bridgeObjectRelease();
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB58);
    LOBYTE(v72) = 6;
    v29 = sub_218885118();
    sub_2188A5FFC();
    v47 = v29;
    v55 = (_QWORD *)v28;
    v30 = v71;
    v31 = v54;
    swift_beginAccess();
    *v31 = v30;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB68);
    LOBYTE(v71) = 7;
    sub_2188851A0();
    sub_2188A5FFC();
    v32 = v70;
    v33 = v53;
    swift_beginAccess();
    *v33 = v32;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB80);
    LOBYTE(v70) = 8;
    sub_218885228();
    sub_2188A5FFC();
    v34 = v69;
    v35 = v52;
    swift_beginAccess();
    *v35 = v34;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB90);
    LOBYTE(v69) = 9;
    sub_2188852B0();
    sub_2188A5FFC();
    v36 = v68;
    v37 = v51;
    swift_beginAccess();
    *v37 = v36;
    swift_bridgeObjectRelease();
    LOBYTE(v68) = 10;
    sub_2188A5FFC();
    v38 = v67;
    v39 = v50;
    swift_beginAccess();
    *v39 = v38;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCBB0);
    LOBYTE(v67) = 11;
    sub_21888539C();
    sub_2188A5FFC();
    v40 = v66;
    v41 = v61;
    swift_beginAccess();
    *v41 = v40;
    swift_bridgeObjectRelease();
    LOBYTE(v66) = 12;
    sub_2188A5FFC();
    v42 = v65;
    swift_beginAccess();
    *v8 = v42;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCBD0);
    LOBYTE(v65) = 13;
    sub_218885488();
    sub_2188A5FFC();
    v43 = v64;
    v44 = v49;
    swift_beginAccess();
    *v44 = v43;
    swift_bridgeObjectRelease();
    LOBYTE(v64) = 14;
    sub_2188A5FFC();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v63, v59);
    v45 = v76;
    v46 = v48;
    swift_beginAccess();
    *v46 = v45;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
    return v62;
  }
  return v14;
}

_QWORD *sub_218884E40@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *result;

  type metadata accessor for MKRepo();
  v5 = swift_allocObject();
  result = sub_218884540(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_218884E94(_QWORD *a1)
{
  return sub_218883F28(a1);
}

unint64_t sub_218884EB4()
{
  unint64_t result;

  result = qword_254FFCB18;
  if (!qword_254FFCB18)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A91CC, &type metadata for MKRepo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCB18);
  }
  return result;
}

unint64_t sub_218884EF8()
{
  unint64_t result;

  result = qword_254FFCB20;
  if (!qword_254FFCB20)
  {
    result = MEMORY[0x219A1BFE8](&protocol conformance descriptor for MKScope, &type metadata for MKScope);
    atomic_store(result, (unint64_t *)&qword_254FFCB20);
  }
  return result;
}

unint64_t sub_218884F3C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254FFCB30;
  if (!qword_254FFCB30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB28);
    v2 = sub_2188801C0(&qword_254FFCA60, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyCert, (uint64_t)&unk_2188A8884);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254FFCB30);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A1BFDC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_218885008()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254FFCB40;
  if (!qword_254FFCB40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB38);
    v2[0] = sub_2188801C0(&qword_254FFCA60, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyCert, (uint64_t)&unk_2188A8884);
    v2[1] = MEMORY[0x24BEE1EB8];
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254FFCB40);
  }
  return result;
}

unint64_t sub_218885090()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254FFCB50;
  if (!qword_254FFCB50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB48);
    v2 = sub_2188801C0(&qword_254FFCA68, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyKey, (uint64_t)&unk_2188A8CA4);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254FFCB50);
  }
  return result;
}

unint64_t sub_218885118()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254FFCB60;
  if (!qword_254FFCB60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB58);
    v2[0] = sub_2188801C0(&qword_254FFCA68, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyKey, (uint64_t)&unk_2188A8CA4);
    v2[1] = MEMORY[0x24BEE1EB8];
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254FFCB60);
  }
  return result;
}

unint64_t sub_2188851A0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254FFCB70;
  if (!qword_254FFCB70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB68);
    v2 = sub_2188801C0(&qword_254FFCB78, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyPassword, (uint64_t)&unk_2188A8EA8);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254FFCB70);
  }
  return result;
}

unint64_t sub_218885228()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254FFCB88;
  if (!qword_254FFCB88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB80);
    v2[0] = sub_2188801C0(&qword_254FFCB78, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyPassword, (uint64_t)&unk_2188A8EA8);
    v2[1] = MEMORY[0x24BEE1EB8];
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254FFCB88);
  }
  return result;
}

unint64_t sub_2188852B0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_254FFCB98;
  if (!qword_254FFCB98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB90);
    v2 = sub_21888531C();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254FFCB98);
  }
  return result;
}

unint64_t sub_21888531C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254FFCBA0;
  if (!qword_254FFCBA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCBA8);
    v2 = sub_2188801C0(&qword_254FFCA60, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyCert, (uint64_t)&unk_2188A8884);
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254FFCBA0);
  }
  return result;
}

unint64_t sub_21888539C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_254FFCBB8;
  if (!qword_254FFCBB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCBB0);
    v2 = sub_218885408();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254FFCBB8);
  }
  return result;
}

unint64_t sub_218885408()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254FFCBC0;
  if (!qword_254FFCBC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCBC8);
    v2 = sub_2188801C0(&qword_254FFCA68, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyKey, (uint64_t)&unk_2188A8CA4);
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254FFCBC0);
  }
  return result;
}

unint64_t sub_218885488()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_254FFCBD8;
  if (!qword_254FFCBD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCBD0);
    v2 = sub_2188854F4();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254FFCBD8);
  }
  return result;
}

unint64_t sub_2188854F4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254FFCBE0;
  if (!qword_254FFCBE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCBE8);
    v2 = sub_2188801C0(&qword_254FFCB78, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyPassword, (uint64_t)&unk_2188A8EA8);
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254FFCBE0);
  }
  return result;
}

unint64_t sub_218885574()
{
  unint64_t result;

  result = qword_254FFCBF8;
  if (!qword_254FFCBF8)
  {
    result = MEMORY[0x219A1BFE8](&protocol conformance descriptor for MKScope, &type metadata for MKScope);
    atomic_store(result, (unint64_t *)&qword_254FFCBF8);
  }
  return result;
}

unint64_t sub_2188855B8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254FFCC00;
  if (!qword_254FFCC00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB28);
    v2 = sub_2188801C0(&qword_254FFCA78, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyCert, (uint64_t)&unk_2188A885C);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254FFCC00);
  }
  return result;
}

unint64_t sub_218885640()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254FFCC08;
  if (!qword_254FFCC08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB38);
    v2[0] = sub_2188801C0(&qword_254FFCA78, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyCert, (uint64_t)&unk_2188A885C);
    v2[1] = MEMORY[0x24BEE1E90];
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254FFCC08);
  }
  return result;
}

unint64_t sub_2188856C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254FFCC10;
  if (!qword_254FFCC10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB48);
    v2 = sub_2188801C0(&qword_254FFCA80, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyKey, (uint64_t)&unk_2188A8C7C);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254FFCC10);
  }
  return result;
}

unint64_t sub_218885750()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254FFCC18;
  if (!qword_254FFCC18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB58);
    v2[0] = sub_2188801C0(&qword_254FFCA80, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyKey, (uint64_t)&unk_2188A8C7C);
    v2[1] = MEMORY[0x24BEE1E90];
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254FFCC18);
  }
  return result;
}

unint64_t sub_2188857D8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254FFCC20;
  if (!qword_254FFCC20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB68);
    v2 = sub_2188801C0(&qword_254FFCC28, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyPassword, (uint64_t)&unk_2188A8E80);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254FFCC20);
  }
  return result;
}

unint64_t sub_218885860()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254FFCC30;
  if (!qword_254FFCC30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCB80);
    v2[0] = sub_2188801C0(&qword_254FFCC28, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyPassword, (uint64_t)&unk_2188A8E80);
    v2[1] = MEMORY[0x24BEE1E90];
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254FFCC30);
  }
  return result;
}

uint64_t sub_2188858E8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    v8[0] = MEMORY[0x24BEE0D08];
    v8[1] = v7;
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE04C0], v6, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_218885954()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254FFCC40;
  if (!qword_254FFCC40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCBA8);
    v2 = sub_2188801C0(&qword_254FFCA78, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyCert, (uint64_t)&unk_2188A885C);
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254FFCC40);
  }
  return result;
}

unint64_t sub_2188859D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254FFCC50;
  if (!qword_254FFCC50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCBC8);
    v2 = sub_2188801C0(&qword_254FFCA80, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyKey, (uint64_t)&unk_2188A8C7C);
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254FFCC50);
  }
  return result;
}

unint64_t sub_218885A54()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254FFCC60;
  if (!qword_254FFCC60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254FFCBE8);
    v2 = sub_2188801C0(&qword_254FFCC28, 255, (uint64_t (*)(uint64_t))type metadata accessor for MKPrimaryKeyPassword, (uint64_t)&unk_2188A8E80);
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254FFCC60);
  }
  return result;
}

void sub_218885AD4(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  char v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  v42 = a1[2];
  v7 = a1[4];
  v6 = a1[5];
  v8 = a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_2188767BC(v7, v6);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_218879644();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v7;
    v21[1] = v6;
    *(_QWORD *)(v20[7] + 8 * v11) = v8;
    v22 = v20[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    v25 = v42 - 1;
    if (v42 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v26 = a1 + 9;
    while (1)
    {
      v28 = *(v26 - 2);
      v27 = *(v26 - 1);
      v29 = *v26;
      v30 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v31 = sub_2188767BC(v28, v27);
      v33 = v30[2];
      v34 = (v32 & 1) == 0;
      v23 = __OFADD__(v33, v34);
      v35 = v33 + v34;
      if (v23)
        break;
      v36 = v32;
      if (v30[3] < v35)
      {
        sub_218878290(v35, 1);
        v31 = sub_2188767BC(v28, v27);
        if ((v36 & 1) != (v37 & 1))
          goto LABEL_25;
      }
      if ((v36 & 1) != 0)
        goto LABEL_10;
      v38 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = (uint64_t *)(v38[6] + 16 * v31);
      *v39 = v28;
      v39[1] = v27;
      *(_QWORD *)(v38[7] + 8 * v31) = v29;
      v40 = v38[2];
      v23 = __OFADD__(v40, 1);
      v41 = v40 + 1;
      if (v23)
        goto LABEL_24;
      v38[2] = v41;
      v26 += 3;
      if (!--v25)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_218878290(v14, a2 & 1);
  v16 = sub_2188767BC(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCA8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_2188A6044();
  __break(1u);
LABEL_26:
  sub_2188A5F54();
  sub_2188A5D98();
  sub_2188A5F84();
  sub_2188A5D98();
  sub_2188A5F9C();
  __break(1u);
}

void sub_218885E64(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  char v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a1[2];
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v8 = a1[4];
  v7 = a1[5];
  v42 = a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v11 = sub_2188767BC(v8, v7);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_2188797FC();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v8;
    v21[1] = v7;
    *(_QWORD *)(v20[7] + 8 * v11) = v42;
    v22 = v20[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    v25 = v4 - 1;
    if (v4 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v26 = a1 + 9;
    while (1)
    {
      v28 = *(v26 - 2);
      v27 = *(v26 - 1);
      v29 = *v26;
      v30 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      v31 = sub_2188767BC(v28, v27);
      v33 = v30[2];
      v34 = (v32 & 1) == 0;
      v23 = __OFADD__(v33, v34);
      v35 = v33 + v34;
      if (v23)
        break;
      v36 = v32;
      if (v30[3] < v35)
      {
        sub_2188785AC(v35, 1);
        v31 = sub_2188767BC(v28, v27);
        if ((v36 & 1) != (v37 & 1))
          goto LABEL_25;
      }
      if ((v36 & 1) != 0)
        goto LABEL_10;
      v38 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = (uint64_t *)(v38[6] + 16 * v31);
      *v39 = v28;
      v39[1] = v27;
      *(_QWORD *)(v38[7] + 8 * v31) = v29;
      v40 = v38[2];
      v23 = __OFADD__(v40, 1);
      v41 = v40 + 1;
      if (v23)
        goto LABEL_24;
      v26 += 3;
      v38[2] = v41;
      if (!--v25)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_2188785AC(v14, a2 & 1);
  v16 = sub_2188767BC(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCA8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_2188A6044();
  __break(1u);
LABEL_26:
  sub_2188A5F54();
  sub_2188A5D98();
  sub_2188A5F84();
  sub_2188A5D98();
  sub_2188A5F9C();
  __break(1u);
}

void sub_2188861E0(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  char v39;
  _QWORD *v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v3 = a1[2];
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v7 = a1[4];
  v6 = a1[5];
  v8 = a1[7];
  v45 = a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_2188767BC(v7, v6);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_2188799A8();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v7;
    v21[1] = v6;
    v22 = (_QWORD *)(v20[7] + 16 * v11);
    *v22 = v45;
    v22[1] = v8;
    v23 = v20[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v25;
    v26 = v3 - 1;
    if (v3 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v27 = a1 + 11;
    while (1)
    {
      v29 = *(v27 - 3);
      v28 = *(v27 - 2);
      v30 = *(v27 - 1);
      v31 = *v27;
      v32 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v33 = sub_2188767BC(v29, v28);
      v35 = v32[2];
      v36 = (v34 & 1) == 0;
      v24 = __OFADD__(v35, v36);
      v37 = v35 + v36;
      if (v24)
        break;
      v38 = v34;
      if (v32[3] < v37)
      {
        sub_2188788B4(v37, 1);
        v33 = sub_2188767BC(v29, v28);
        if ((v38 & 1) != (v39 & 1))
          goto LABEL_25;
      }
      if ((v38 & 1) != 0)
        goto LABEL_10;
      v40 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v33 >> 6) + 64) |= 1 << v33;
      v41 = (uint64_t *)(v40[6] + 16 * v33);
      *v41 = v29;
      v41[1] = v28;
      v42 = (_QWORD *)(v40[7] + 16 * v33);
      *v42 = v30;
      v42[1] = v31;
      v43 = v40[2];
      v24 = __OFADD__(v43, 1);
      v44 = v43 + 1;
      if (v24)
        goto LABEL_24;
      v27 += 4;
      v40[2] = v44;
      if (!--v26)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_2188788B4(v14, a2 & 1);
  v16 = sub_2188767BC(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCA8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_2188A6044();
  __break(1u);
LABEL_26:
  sub_2188A5F54();
  sub_2188A5D98();
  sub_2188A5F84();
  sub_2188A5D98();
  sub_2188A5F9C();
  __break(1u);
}

uint64_t sub_21888657C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2188865EC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_218886598(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_218886790(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2188865B4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_218886934(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2188865D0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_218886ABC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2188865EC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCC98);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCA0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2188A5FD8();
  __break(1u);
  return result;
}

uint64_t sub_218886790(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCC88);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCC90);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2188A5FD8();
  __break(1u);
  return result;
}

uint64_t sub_218886934(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCB0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 32 * v8)
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 32 * v8 || v13 >= v14 + 32 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCB8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2188A5FD8();
  __break(1u);
  return result;
}

uint64_t sub_218886ABC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC920);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2188A5FD8();
  __break(1u);
  return result;
}

uint64_t sub_218886C24(uint64_t a1)
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

uint64_t getEnumTagSinglePayload for MKRepo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF2)
    goto LABEL_17;
  if (a2 + 14 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 14) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 14;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 14;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 14;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v8 = v6 - 15;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MKRepo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_218886D88 + 4 * byte_2188A9024[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_218886DBC + 4 * byte_2188A901F[v4]))();
}

uint64_t sub_218886DBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_218886DC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x218886DCCLL);
  return result;
}

uint64_t sub_218886DD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x218886DE0);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_218886DE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_218886DEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_218886DF8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MKRepo.CodingKeys()
{
  return &type metadata for MKRepo.CodingKeys;
}

unint64_t sub_218886E14()
{
  unint64_t result;

  result = qword_254FFCCC8;
  if (!qword_254FFCCC8)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A91A4, &type metadata for MKRepo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCCC8);
  }
  return result;
}

unint64_t sub_218886E5C()
{
  unint64_t result;

  result = qword_254FFCCD0;
  if (!qword_254FFCCD0)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A9114, &type metadata for MKRepo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCCD0);
  }
  return result;
}

unint64_t sub_218886EA4()
{
  unint64_t result;

  result = qword_254FFCCD8;
  if (!qword_254FFCCD8)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A913C, &type metadata for MKRepo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCCD8);
  }
  return result;
}

uint64_t sub_218886EE8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65706F6373 && a2 == 0xE500000000000000;
  if (v3 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616E6F73726570 && a2 == 0xE700000000000000 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7247737365636361 && a2 == 0xEB0000000070756FLL || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x436F547465737361 && a2 == 0xED00004B50747265 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65524B5074726563 && a2 == 0xEE00746E756F4366 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4B6F547465737361 && a2 == 0xEC0000004B507965 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6665524B5079656BLL && a2 == 0xED0000746E756F43 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002188AB750 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002188AB770 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x80000002188AB790 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002188AB7B0 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x80000002188AB7D0 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000002188AB7F0 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000021 && a2 == 0x80000002188AB810 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000002188AB840)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    v6 = sub_2188A6038();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 14;
    else
      return 15;
  }
}

uint64_t sub_2188874C0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;

  if ((sub_2188A5DB0() & 1) != 0)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v16 = sub_2188A5C9C();
    __swift_project_value_buffer(v16, (uint64_t)qword_254FFEE30);
    v17 = sub_2188A5C84();
    v18 = sub_2188A5E4C();
    v7 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21885E000, v17, (os_log_type_t)v7, "assignCert: Invalid destination access group", v19, 2u);
      MEMORY[0x219A1C06C](v19, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v20 = xmmword_2188A86A0;
    *(_BYTE *)(v20 + 16) = 9;
    swift_willThrow();
  }
  else
  {
    v21 = (void *)sub_218891FB0(a1, a2);
    if (!v8)
    {
      v22 = v21;
      v24 = sub_21888A51C(v21, a5, a6, a7, (uint64_t)type metadata accessor for SecCertificate, (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BDA8, "copyCert: SecItemAdd duplicate", (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BD58, (uint64_t)"copyCert: SecItemCopyMatching status %d", "copyCert: SecItemAdd success", (uint64_t)"copyCert: SecItemAdd failed %d", (void (*)(_QWORD))type metadata accessor for MKPrimaryKeyCert, "copyCert: SecItemAdd/SecItemCopyMatching did not return result", "copyCert: Failed to apply persona: %@");
      sub_21888A124(a3, a4, v24);
      sub_218881BE8();

      v7 = *(_QWORD *)(v24 + 16);
      sub_21887A110(v7, *(_QWORD *)(v24 + 24));
      swift_release();
    }
  }
  return v7;
}

uint64_t sub_218887710(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint8_t *v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t result;
  __SecCertificate *v29;
  __SecCertificate *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  __SecCertificate *v40;
  uint64_t v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t inited;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  __SecCertificate *v69;
  __SecKey *v70;
  unint64_t v71;
  unsigned int v72;
  _OWORD v73[2];
  __int128 v74;
  uint64_t v75;
  unint64_t v76;
  SecKeyRef privateKeyRef;
  SecCertificateRef certificateRef[3];

  v9 = v7;
  certificateRef[1] = *(SecCertificateRef *)MEMORY[0x24BDAC8D0];
  if ((sub_2188A5DB0() & 1) != 0)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v17 = sub_2188A5C9C();
    __swift_project_value_buffer(v17, (uint64_t)qword_254FFEE30);
    a5 = sub_2188A5C84();
    v18 = sub_2188A5E4C();
    if (os_log_type_enabled((os_log_t)a5, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21885E000, (os_log_t)a5, v18, "assignIdentity: Invalid destination access group", v19, 2u);
      MEMORY[0x219A1C06C](v19, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v20 = xmmword_2188A86A0;
    *(_BYTE *)(v20 + 16) = 9;
    swift_willThrow();
    return a5;
  }
  v21 = sub_218892178(a1, a2);
  if (v8)
    return a5;
  v22 = v21;
  certificateRef[0] = 0;
  v72 = SecIdentityCopyCertificate((SecIdentityRef)v21, certificateRef);
  if (v72)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v23 = sub_2188A5C9C();
    __swift_project_value_buffer(v23, (uint64_t)qword_254FFEE30);
    v24 = sub_2188A5C84();
    v25 = sub_2188A5E58();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v26 = 67109120;
      swift_beginAccess();
      LODWORD(v74) = v72;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v24, v25, "assignIdentity: SecIdentityCopyCertificate status %d", v26, 8u);
      MEMORY[0x219A1C06C](v26, -1, -1);
    }

    swift_beginAccess();
    a5 = v72;
    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v27 = v72;
    *(_QWORD *)(v27 + 8) = 0;
    *(_BYTE *)(v27 + 16) = 0;
LABEL_14:
    swift_willThrow();

LABEL_15:
    return a5;
  }
  if (!certificateRef[0])
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v36 = sub_2188A5C9C();
    __swift_project_value_buffer(v36, (uint64_t)qword_254FFEE30);
    a5 = sub_2188A5C84();
    v37 = sub_2188A5E58();
    if (os_log_type_enabled((os_log_t)a5, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_21885E000, (os_log_t)a5, v37, "assignIdentity: SecIdentityCopyCertificate did not return result", v38, 2u);
      MEMORY[0x219A1C06C](v38, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v39 = 0;
    *(_QWORD *)(v39 + 8) = 0;
    *(_BYTE *)(v39 + 16) = 9;
    goto LABEL_14;
  }
  privateKeyRef = 0;
  v29 = certificateRef[0];
  v72 = SecIdentityCopyPrivateKey((SecIdentityRef)v22, &privateKeyRef);
  if (v72)
  {
    v30 = v29;
    if (qword_254FFC850 != -1)
      swift_once();
    v31 = sub_2188A5C9C();
    __swift_project_value_buffer(v31, (uint64_t)qword_254FFEE30);
    v32 = sub_2188A5C84();
    v33 = sub_2188A5E58();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v34 = 67109120;
      swift_beginAccess();
      LODWORD(v74) = v72;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v32, v33, "assignIdentity: SecIdentityCopyPrivateKey status %d", v34, 8u);
      MEMORY[0x219A1C06C](v34, -1, -1);
    }

    swift_beginAccess();
    a5 = v72;
    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v35 = v72;
    *(_QWORD *)(v35 + 8) = 0;
    *(_BYTE *)(v35 + 16) = 0;
    swift_willThrow();

LABEL_24:
LABEL_25:

    goto LABEL_15;
  }
  if (!privateKeyRef)
  {
    v40 = v29;
    if (qword_254FFC850 != -1)
      swift_once();
    v41 = sub_2188A5C9C();
    __swift_project_value_buffer(v41, (uint64_t)qword_254FFEE30);
    a5 = sub_2188A5C84();
    v42 = sub_2188A5E58();
    if (os_log_type_enabled((os_log_t)a5, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_21885E000, (os_log_t)a5, v42, "assignIdentity: SecIdentityCopyPrivateKey did not return result", v43, 2u);
      MEMORY[0x219A1C06C](v43, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v44 = 0;
    *(_QWORD *)(v44 + 8) = 0;
    *(_BYTE *)(v44 + 16) = 9;
    swift_willThrow();

    goto LABEL_24;
  }
  v70 = privateKeyRef;
  v69 = v29;
  v68 = sub_21888A51C(v29, a5, a6, a7, (uint64_t)type metadata accessor for SecCertificate, (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BDA8, "copyCert: SecItemAdd duplicate", (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BD58, (uint64_t)"copyCert: SecItemCopyMatching status %d", "copyCert: SecItemAdd success", (uint64_t)"copyCert: SecItemAdd failed %d", (void (*)(_QWORD))type metadata accessor for MKPrimaryKeyCert, "copyCert: SecItemAdd/SecItemCopyMatching did not return result", "copyCert: Failed to apply persona: %@");
  v45 = sub_21888A51C(v70, a5, a6, a7, (uint64_t)type metadata accessor for SecKey, (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BDA8, "copyPrivateKey: SecItemAdd duplicate", (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BD58, (uint64_t)"copyPrivateKey: SecItemCopyMatching status %d", "copyPrivateKey: SecItemAdd success", (uint64_t)"copyPrivateKey: SecItemAdd failed %d", (void (*)(_QWORD))type metadata accessor for MKPrimaryKeyKey, "copyPrivateKey: SecItemAdd/SecItemCopyMatching did not return result", "copyPrivateKey: Failed to apply persona: %@");
  sub_21888A124(a3, a4, v68);
  sub_21888AEA0(a3, a4, v45);
  sub_218881BE8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A9220;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v47;
  type metadata accessor for SecIdentity(0);
  *(_QWORD *)(inited + 72) = v48;
  *(_QWORD *)(inited + 48) = v22;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v49;
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 96) = a6;
  *(_QWORD *)(inited + 104) = a7;
  *(_QWORD *)(inited + 128) = sub_2188A5D20();
  *(_QWORD *)(inited + 136) = v50;
  v51 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 144) = 1;
  v52 = v22;
  swift_bridgeObjectRetain();
  v53 = sub_218875DE8(inited);
  v71 = v53;
  if (v9[2] != 1)
  {
LABEL_41:
    v76 = 0;
    sub_21889BD58(v9[3], v9[4], &v72, (uint64_t)&v71, (uint64_t)&v76);
    if (v72)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v59 = sub_2188A5C9C();
      __swift_project_value_buffer(v59, (uint64_t)qword_254FFEE30);
      v60 = sub_2188A5C84();
      v61 = sub_2188A5E58();
      if (os_log_type_enabled(v60, v61))
      {
        v62 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v62 = 67109120;
        swift_beginAccess();
        LODWORD(v74) = v72;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v60, v61, "assignIdentity: SecItemCopyMatching status %d", v62, 8u);
        MEMORY[0x219A1C06C](v62, -1, -1);
      }

      swift_beginAccess();
      a5 = v72;
      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v63 = a5;
      *(_QWORD *)(v63 + 8) = 0;
      *(_BYTE *)(v63 + 16) = 0;
    }
    else
    {
      if (v76)
      {
        *(_QWORD *)&v73[0] = v76;
        swift_unknownObjectRetain();
        if ((swift_dynamicCast() & 1) != 0)
        {

          swift_release();
          swift_release();
          a5 = v74;
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          return a5;
        }
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v64 = sub_2188A5C9C();
      __swift_project_value_buffer(v64, (uint64_t)qword_254FFEE30);
      a5 = sub_2188A5C84();
      v65 = sub_2188A5E58();
      if (os_log_type_enabled((os_log_t)a5, v65))
      {
        v66 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v66 = 0;
        _os_log_impl(&dword_21885E000, (os_log_t)a5, v65, "assignIdentity: SecItemCopyMatching did not return result", v66, 2u);
        MEMORY[0x219A1C06C](v66, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v67 = 0;
      *(_QWORD *)(v67 + 8) = 0;
      *(_BYTE *)(v67 + 16) = 9;
    }
    swift_willThrow();

    swift_release();
    swift_release();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  v54 = v53;
  result = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    v55 = sub_2188A5D20();
    v57 = v56;
    v75 = v51;
    LOBYTE(v74) = 1;
    sub_21887A73C(&v74, v73);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v76 = v54;
    sub_218898008(v73, v55, v57, isUniquelyReferenced_nonNull_native);
    v71 = v76;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  __break(1u);
  return result;
}

uint64_t sub_2188884B8(uint64_t a1, _QWORD *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  if ((sub_2188A5DB0() & 1) != 0)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v16 = sub_2188A5C9C();
    __swift_project_value_buffer(v16, (uint64_t)qword_254FFEE30);
    v17 = sub_2188A5C84();
    v18 = sub_2188A5E4C();
    v7 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21885E000, v17, (os_log_type_t)v7, "assignPassword: Invalid destination access group", v19, 2u);
      MEMORY[0x219A1C06C](v19, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v20 = xmmword_2188A86A0;
    *(_BYTE *)(v20 + 16) = 9;
    swift_willThrow();
  }
  else
  {
    v31 = a3;
    v32 = a4;
    v21 = sub_2188924E4(a1, (uint64_t)a2);
    if (!v8)
    {
      v25 = v22;
      v26 = v24;
      v30 = v21;
      v27 = v23;
      swift_bridgeObjectRetain();
      v29 = sub_21888B298(v27, v26, a5, v30, v25, a1, a2, a6, a7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21888BEA4(v31, v32, v29);
      sub_218881BE8();
      v7 = *(_QWORD *)(v29 + 16);
      sub_21887A110(v7, *(_QWORD *)(v29 + 24));
      swift_release();
    }
  }
  return v7;
}

uint64_t sub_218888710(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  uint64_t v37;
  char v38;
  char v39;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  unint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  _BOOL8 v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  uint64_t v96;
  void *v97;
  BOOL v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  unint64_t v108;
  uint64_t v109;
  _BOOL8 v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  _QWORD *v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  NSObject *v130;
  os_log_type_t v131;
  uint8_t *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t result;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  NSObject *v145;
  os_log_type_t v146;
  uint8_t *v147;
  void *v148;
  unint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  NSObject *v155;
  os_log_type_t v156;
  uint8_t *v157;
  void *v158;
  uint64_t v159;
  void *v160;
  unint64_t v161;
  unint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t *v176;
  _QWORD *v177;
  uint64_t v178;
  uint64_t v179[3];
  unint64_t v180;
  uint64_t v181;
  uint64_t v182[3];
  unint64_t v183;
  uint64_t v184;
  uint64_t v185[3];
  unint64_t v186;

  swift_beginAccess();
  v176 = v2;
  v5 = v2[13];
  v6 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = sub_2188767BC(a1, a2);
    if ((v8 & 1) != 0)
    {
      v9 = *(uint64_t **)(*(_QWORD *)(v5 + 56) + 8 * v7);
      swift_bridgeObjectRetain();
    }
    else
    {
      v9 = (uint64_t *)MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (uint64_t *)MEMORY[0x24BEE4AF8];
  }
  v10 = (unint64_t)v9 >> 62;
  v159 = a1;
  if ((unint64_t)v9 >> 62)
    goto LABEL_188;
  v11 = *(_QWORD *)(((unint64_t)v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_9:
  v12 = v9;
  v161 = a2;
  if (v11)
  {
LABEL_13:
    v186 = v6;
    if (!v10)
      goto LABEL_14;
LABEL_17:
    swift_bridgeObjectRetain();
    a2 = sub_2188A5FA8();
    swift_bridgeObjectRelease();
    if (!a2)
      goto LABEL_50;
    goto LABEL_18;
  }
  if (qword_254FFC850 != -1)
LABEL_194:
    swift_once();
  v13 = sub_2188A5C9C();
  __swift_project_value_buffer(v13, (uint64_t)qword_254FFEE30);
  swift_bridgeObjectRetain_n();
  v14 = sub_2188A5C84();
  v15 = sub_2188A5E40();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v185[0] = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    v184 = sub_2188A17DC(v159, v161, v185);
    sub_2188A5EC4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21885E000, v14, v15, "unassignAllAssets: cert not found for %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1C06C](v17, -1, -1);
    MEMORY[0x219A1C06C](v16, -1, -1);

    goto LABEL_13;
  }

  swift_bridgeObjectRelease_n();
  v186 = v6;
  if (v10)
    goto LABEL_17;
LABEL_14:
  a2 = *(_QWORD *)(((unint64_t)v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (a2)
  {
LABEL_18:
    v9 = v176 + 14;
    v18 = (unint64_t)v12 & 0xC000000000000001;
    swift_beginAccess();
    v6 = 4;
    v162 = (unint64_t)v12 & 0xC000000000000001;
    v164 = v12;
    v170 = a2;
    do
    {
      v20 = v6 - 4;
      if (v18)
      {
        v21 = MEMORY[0x219A1B688](v6 - 4, v12);
        v19 = v6 - 3;
        if (__OFADD__(v20, 1))
          goto LABEL_182;
      }
      else
      {
        v21 = v12[v6];
        swift_retain();
        v19 = v6 - 3;
        if (__OFADD__(v20, 1))
        {
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
LABEL_188:
          swift_bridgeObjectRetain();
          v11 = sub_2188A5FA8();
          swift_bridgeObjectRelease();
          goto LABEL_9;
        }
      }
      v22 = *v9;
      if (!*(_QWORD *)(*v9 + 16))
        goto LABEL_56;
      swift_retain();
      swift_bridgeObjectRetain();
      v23 = sub_2188768A0(v21);
      if ((v24 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_release();
LABEL_56:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_254FFC850 != -1)
          swift_once();
        v51 = sub_2188A5C9C();
        __swift_project_value_buffer(v51, (uint64_t)qword_254FFEE30);
        v52 = sub_2188A5C84();
        v53 = sub_2188A5E58();
        if (!os_log_type_enabled(v52, v53))
          goto LABEL_181;
        v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v54 = 0;
        v55 = "unassignAllAssets: Refcount for assigned cert not found";
        goto LABEL_180;
      }
      v25 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23);
      swift_release();
      swift_bridgeObjectRelease();
      v10 = v25 - 1;
      if (v25 == 1)
      {
        swift_beginAccess();
        swift_retain();
        swift_bridgeObjectRetain();
        v37 = sub_2188768A0(v21);
        v39 = v38;
        swift_bridgeObjectRelease();
        if ((v39 & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v41 = *v9;
          v182[0] = *v9;
          *v9 = 0x8000000000000000;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_2188790DC();
            v41 = v182[0];
          }
          swift_release();
          sub_218897C3C(v37, v41);
          *v9 = v41;
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_release();
        }
        swift_endAccess();
        v42 = swift_retain();
        MEMORY[0x219A1B4FC](v42);
        v12 = v164;
        if (*(_QWORD *)((v186 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v186 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2188A5E1C();
        sub_2188A5E28();
        sub_2188A5E10();
        a2 = v170;
        goto LABEL_21;
      }
      if (!v25)
        goto LABEL_56;
      v167 = v19;
      v26 = v12;
      swift_beginAccess();
      swift_retain();
      a2 = swift_isUniquelyReferenced_nonNull_native();
      v182[0] = *v9;
      v27 = v182[0];
      *v9 = 0x8000000000000000;
      v29 = sub_2188768A0(v21);
      v30 = *(_QWORD *)(v27 + 16);
      v31 = (v28 & 1) == 0;
      v32 = v30 + v31;
      if (__OFADD__(v30, v31))
        goto LABEL_184;
      v33 = v28;
      if (*(_QWORD *)(v27 + 24) >= v32)
      {
        if ((a2 & 1) != 0)
        {
          v36 = (_QWORD *)v182[0];
          if ((v28 & 1) == 0)
            goto LABEL_46;
        }
        else
        {
          sub_2188790DC();
          v36 = (_QWORD *)v182[0];
          if ((v33 & 1) == 0)
            goto LABEL_46;
        }
      }
      else
      {
        sub_218877908(v32, a2);
        v34 = sub_2188768A0(v21);
        if ((v33 & 1) != (v35 & 1))
          goto LABEL_236;
        v29 = v34;
        v36 = (_QWORD *)v182[0];
        if ((v33 & 1) == 0)
        {
LABEL_46:
          v36[(v29 >> 6) + 8] |= 1 << v29;
          v43 = 8 * v29;
          *(_QWORD *)(v36[6] + v43) = v21;
          *(_QWORD *)(v36[7] + v43) = v10;
          v44 = v36[2];
          v45 = __OFADD__(v44, 1);
          v46 = v44 + 1;
          if (v45)
            goto LABEL_187;
          v36[2] = v46;
          swift_retain();
          goto LABEL_20;
        }
      }
      *(_QWORD *)(v36[7] + 8 * v29) = v10;
LABEL_20:
      *v9 = (uint64_t)v36;
      swift_release();
      swift_bridgeObjectRelease();
      swift_endAccess();
      v12 = v26;
      v19 = v167;
      a2 = v170;
      v18 = v162;
LABEL_21:
      swift_release();
      ++v6;
    }
    while (v19 != a2);
  }
LABEL_50:
  swift_bridgeObjectRelease();
  swift_beginAccess();
  a2 = v161;
  swift_bridgeObjectRetain();
  sub_218897A44(v159, v161);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v47 = v176[15];
  v6 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v47 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v48 = sub_2188767BC(v159, v161);
    if ((v49 & 1) != 0)
    {
      v50 = *(_QWORD *)(*(_QWORD *)(v47 + 56) + 8 * v48);
      swift_bridgeObjectRetain();
    }
    else
    {
      v50 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v50 = MEMORY[0x24BEE4AF8];
  }
  v10 = v50 >> 62;
  if (v50 >> 62)
  {
LABEL_191:
    swift_bridgeObjectRetain();
    v137 = sub_2188A5FA8();
    swift_bridgeObjectRelease();
    if (v137)
      goto LABEL_69;
  }
  else if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_69;
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v56 = sub_2188A5C9C();
  __swift_project_value_buffer(v56, (uint64_t)qword_254FFEE30);
  swift_bridgeObjectRetain_n();
  v57 = sub_2188A5C84();
  v58 = sub_2188A5E40();
  if (os_log_type_enabled(v57, v58))
  {
    v59 = (uint8_t *)swift_slowAlloc();
    a2 = swift_slowAlloc();
    v182[0] = a2;
    *(_DWORD *)v59 = 136315138;
    swift_bridgeObjectRetain();
    v181 = sub_2188A17DC(v159, v161, v182);
    sub_2188A5EC4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21885E000, v57, v58, "unassignAllAssets: key not found for %s", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1C06C](a2, -1, -1);
    MEMORY[0x219A1C06C](v59, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
LABEL_69:
  v183 = v6;
  if (v10)
  {
    swift_bridgeObjectRetain();
    v60 = sub_2188A5FA8();
    swift_bridgeObjectRelease();
    if (!v60)
      goto LABEL_104;
    goto LABEL_73;
  }
  v60 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v60)
  {
LABEL_73:
    v9 = v176 + 16;
    v61 = v50 & 0xC000000000000001;
    swift_beginAccess();
    v6 = 4;
    v163 = v60;
    v165 = v50 & 0xC000000000000001;
    v168 = v50;
    do
    {
      v63 = v6 - 4;
      if (v61)
      {
        v64 = MEMORY[0x219A1B688](v6 - 4, v50);
        v65 = v6 - 3;
        if (__OFADD__(v63, 1))
          goto LABEL_183;
      }
      else
      {
        v64 = *(_QWORD *)(v50 + 8 * v6);
        swift_retain();
        v65 = v6 - 3;
        if (__OFADD__(v63, 1))
          goto LABEL_183;
      }
      v66 = *v9;
      if (!*(_QWORD *)(*v9 + 16))
        goto LABEL_110;
      swift_retain();
      swift_bridgeObjectRetain();
      v67 = sub_2188768A0(v64);
      if ((v68 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_release();
LABEL_110:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_254FFC850 != -1)
          swift_once();
        v91 = sub_2188A5C9C();
        __swift_project_value_buffer(v91, (uint64_t)qword_254FFEE30);
        v52 = sub_2188A5C84();
        v53 = sub_2188A5E58();
        if (!os_log_type_enabled(v52, v53))
          goto LABEL_181;
        v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v54 = 0;
        v55 = "unassignAllAssets: Refcount for assigned key not found";
LABEL_180:
        _os_log_impl(&dword_21885E000, v52, v53, v55, v54, 2u);
        MEMORY[0x219A1C06C](v54, -1, -1);
        goto LABEL_181;
      }
      v69 = *(_QWORD *)(*(_QWORD *)(v66 + 56) + 8 * v67);
      swift_release();
      swift_bridgeObjectRelease();
      v10 = v69 - 1;
      v171 = v65;
      if (v69 == 1)
      {
        v79 = swift_retain();
        MEMORY[0x219A1B4FC](v79);
        if (*(_QWORD *)((v183 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v183 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2188A5E1C();
        sub_2188A5E28();
        sub_2188A5E10();
        swift_beginAccess();
        swift_retain();
        swift_bridgeObjectRetain();
        v80 = sub_2188768A0(v64);
        a2 = v81;
        swift_bridgeObjectRelease();
        if ((a2 & 1) != 0)
        {
          v82 = swift_isUniquelyReferenced_nonNull_native();
          v83 = *v9;
          v179[0] = *v9;
          *v9 = 0x8000000000000000;
          if ((v82 & 1) == 0)
          {
            sub_2188790D0();
            v83 = v179[0];
          }
          swift_release();
          sub_218897C3C(v80, v83);
          a2 = *v9;
          *v9 = v83;
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_release();
        }
        swift_endAccess();
        v50 = v168;
        v62 = v171;
        goto LABEL_76;
      }
      if (!v69)
        goto LABEL_110;
      swift_beginAccess();
      swift_retain();
      a2 = swift_isUniquelyReferenced_nonNull_native();
      v179[0] = *v9;
      v70 = v179[0];
      *v9 = 0x8000000000000000;
      v72 = sub_2188768A0(v64);
      v73 = *(_QWORD *)(v70 + 16);
      v74 = (v71 & 1) == 0;
      v75 = v73 + v74;
      if (__OFADD__(v73, v74))
        goto LABEL_186;
      v50 = v71;
      if (*(_QWORD *)(v70 + 24) >= v75)
      {
        if ((a2 & 1) != 0)
        {
          v78 = (_QWORD *)v179[0];
          if ((v71 & 1) == 0)
            goto LABEL_101;
        }
        else
        {
          sub_2188790D0();
          v78 = (_QWORD *)v179[0];
          if ((v50 & 1) == 0)
            goto LABEL_101;
        }
      }
      else
      {
        sub_2188778FC(v75, a2);
        v76 = sub_2188768A0(v64);
        if ((v50 & 1) != (v77 & 1))
          goto LABEL_237;
        v72 = v76;
        v78 = (_QWORD *)v179[0];
        if ((v50 & 1) == 0)
        {
LABEL_101:
          v78[(v72 >> 6) + 8] |= 1 << v72;
          v84 = 8 * v72;
          *(_QWORD *)(v78[6] + v84) = v64;
          *(_QWORD *)(v78[7] + v84) = v10;
          v85 = v78[2];
          v45 = __OFADD__(v85, 1);
          v86 = v85 + 1;
          if (v45)
          {
LABEL_190:
            __break(1u);
            goto LABEL_191;
          }
          v78[2] = v86;
          swift_retain();
          goto LABEL_103;
        }
      }
      *(_QWORD *)(v78[7] + 8 * v72) = v10;
LABEL_103:
      *v9 = (uint64_t)v78;
      swift_release();
      swift_bridgeObjectRelease();
      swift_endAccess();
      v50 = v168;
      v60 = v163;
      v61 = v165;
      v62 = v171;
LABEL_76:
      swift_release();
      ++v6;
    }
    while (v62 != v60);
  }
LABEL_104:
  swift_bridgeObjectRelease();
  swift_beginAccess();
  a2 = v161;
  swift_bridgeObjectRetain();
  sub_218897A50(v159, v161);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v87 = v176[17];
  v88 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v87 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v89 = sub_2188767BC(v159, v161);
    if ((v90 & 1) != 0)
    {
      v50 = *(_QWORD *)(*(_QWORD *)(v87 + 56) + 8 * v89);
      swift_bridgeObjectRetain();
    }
    else
    {
      v50 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v50 = MEMORY[0x24BEE4AF8];
  }
  if (v50 >> 62)
  {
    swift_bridgeObjectRetain();
    v138 = sub_2188A5FA8();
    swift_bridgeObjectRelease();
    if (!v138)
      goto LABEL_118;
  }
  else if (!*(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_118:
    if (qword_254FFC850 != -1)
      swift_once();
    v92 = sub_2188A5C9C();
    __swift_project_value_buffer(v92, (uint64_t)qword_254FFEE30);
    swift_bridgeObjectRetain_n();
    v93 = sub_2188A5C84();
    v94 = sub_2188A5E40();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = (uint8_t *)swift_slowAlloc();
      a2 = swift_slowAlloc();
      v179[0] = a2;
      *(_DWORD *)v95 = 136315138;
      swift_bridgeObjectRetain();
      sub_2188A17DC(v159, v161, v179);
      sub_2188A5EC4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21885E000, v93, v94, "unassignAllAssets: password not found for %s", v95, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](a2, -1, -1);
      MEMORY[0x219A1C06C](v95, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  v180 = v88;
  if (v50 >> 62)
  {
    swift_bridgeObjectRetain();
    v96 = sub_2188A5FA8();
    swift_bridgeObjectRelease();
    v97 = v160;
    if (!v96)
      goto LABEL_158;
  }
  else
  {
    v96 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
    v97 = v160;
    if (!v96)
    {
LABEL_158:
      swift_bridgeObjectRelease();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_218897A5C(v159, v161);
      swift_endAccess();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v124 = v186;
      if (v186 >> 62)
      {
        swift_bridgeObjectRetain();
        v125 = sub_2188A5FA8();
        swift_bridgeObjectRelease();
        if (!v125)
          goto LABEL_198;
      }
      else
      {
        v125 = *(_QWORD *)((v186 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v125)
          goto LABEL_198;
      }
      if (v125 < 1)
      {
        __break(1u);
        goto LABEL_234;
      }
      v126 = 0;
      v173 = v125;
      do
      {
        if ((v124 & 0xC000000000000001) != 0)
        {
          v127 = MEMORY[0x219A1B688](v126, v124);
        }
        else
        {
          v127 = *(_QWORD *)(v124 + 8 * v126 + 32);
          swift_retain();
        }
        v128 = v97;
        sub_21888C29C(v127);
        if (v97)
        {
          if (qword_254FFC850 != -1)
            swift_once();
          v129 = sub_2188A5C9C();
          __swift_project_value_buffer(v129, (uint64_t)qword_254FFEE30);
          v130 = sub_2188A5C84();
          v131 = sub_2188A5E4C();
          if (os_log_type_enabled(v130, v131))
          {
            v132 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v132 = 0;
            _os_log_impl(&dword_21885E000, v130, v131, "unassignAllAssets: Failed to delete cert", v132, 2u);
            MEMORY[0x219A1C06C](v132, -1, -1);
            swift_release();
            v133 = v128;
            v125 = v173;
          }
          else
          {
            swift_release();
            v133 = v97;
          }

          v97 = 0;
        }
        else
        {
          swift_release();
        }
        ++v126;
      }
      while (v125 != v126);
LABEL_198:
      swift_bridgeObjectRelease();
      v139 = v183;
      if (v183 >> 62)
      {
        swift_bridgeObjectRetain();
        v140 = sub_2188A5FA8();
        swift_bridgeObjectRelease();
        if (!v140)
          goto LABEL_215;
      }
      else
      {
        v140 = *(_QWORD *)((v183 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v140)
          goto LABEL_215;
      }
      if (v140 >= 1)
      {
        v141 = 0;
        v174 = v140;
        do
        {
          if ((v139 & 0xC000000000000001) != 0)
          {
            v142 = MEMORY[0x219A1B688](v141, v139);
          }
          else
          {
            v142 = *(_QWORD *)(v139 + 8 * v141 + 32);
            swift_retain();
          }
          v143 = v97;
          sub_21888C2C8(v142);
          if (v97)
          {
            if (qword_254FFC850 != -1)
              swift_once();
            v144 = sub_2188A5C9C();
            __swift_project_value_buffer(v144, (uint64_t)qword_254FFEE30);
            v145 = sub_2188A5C84();
            v146 = sub_2188A5E4C();
            if (os_log_type_enabled(v145, v146))
            {
              v147 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v147 = 0;
              _os_log_impl(&dword_21885E000, v145, v146, "unassignAllAssets: Failed to delete key", v147, 2u);
              MEMORY[0x219A1C06C](v147, -1, -1);
              swift_release();
              v148 = v143;
              v140 = v174;
            }
            else
            {
              swift_release();
              v148 = v97;
            }

            v97 = 0;
          }
          else
          {
            swift_release();
          }
          ++v141;
        }
        while (v140 != v141);
LABEL_215:
        swift_bridgeObjectRelease();
        v149 = v180;
        if (v180 >> 62)
        {
          swift_bridgeObjectRetain();
          v150 = sub_2188A5FA8();
          swift_bridgeObjectRelease();
          if (v150)
          {
LABEL_217:
            if (v150 >= 1)
            {
              v151 = 0;
              v175 = v150;
              do
              {
                if ((v149 & 0xC000000000000001) != 0)
                {
                  v152 = MEMORY[0x219A1B688](v151, v149);
                }
                else
                {
                  v152 = *(_QWORD *)(v149 + 8 * v151 + 32);
                  swift_retain();
                }
                v153 = v97;
                sub_21888C7DC(v152);
                if (v97)
                {
                  if (qword_254FFC850 != -1)
                    swift_once();
                  v154 = sub_2188A5C9C();
                  __swift_project_value_buffer(v154, (uint64_t)qword_254FFEE30);
                  v155 = sub_2188A5C84();
                  v156 = sub_2188A5E4C();
                  if (os_log_type_enabled(v155, v156))
                  {
                    v157 = (uint8_t *)swift_slowAlloc();
                    *(_WORD *)v157 = 0;
                    _os_log_impl(&dword_21885E000, v155, v156, "unassignAllAssets: Failed to delete password", v157, 2u);
                    MEMORY[0x219A1C06C](v157, -1, -1);
                    swift_release();
                    v158 = v153;
                    v150 = v175;
                  }
                  else
                  {
                    swift_release();
                    v158 = v97;
                  }

                  v97 = 0;
                }
                else
                {
                  swift_release();
                }
                ++v151;
              }
              while (v150 != v151);
              goto LABEL_232;
            }
LABEL_235:
            __break(1u);
LABEL_236:
            type metadata accessor for MKPrimaryKeyCert();
            sub_2188A6044();
            __break(1u);
LABEL_237:
            type metadata accessor for MKPrimaryKeyKey();
            sub_2188A6044();
            __break(1u);
LABEL_238:
            type metadata accessor for MKPrimaryKeyPassword();
            result = sub_2188A6044();
            __break(1u);
            return result;
          }
        }
        else
        {
          v150 = *(_QWORD *)((v180 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v150)
            goto LABEL_217;
        }
LABEL_232:
        swift_bridgeObjectRelease();
        return sub_218881BE8();
      }
LABEL_234:
      __break(1u);
      goto LABEL_235;
    }
  }
  v9 = v176 + 18;
  v172 = v50 & 0xC000000000000001;
  swift_beginAccess();
  v6 = 4;
  v166 = v96;
  while (1)
  {
    v99 = v6 - 4;
    if (v172)
    {
      v100 = MEMORY[0x219A1B688](v6 - 4, v50);
      v10 = v6 - 3;
      if (__OFADD__(v99, 1))
        goto LABEL_185;
    }
    else
    {
      v100 = *(_QWORD *)(v50 + 8 * v6);
      swift_retain();
      v10 = v6 - 3;
      if (__OFADD__(v99, 1))
        goto LABEL_185;
    }
    v101 = *v9;
    if (!*(_QWORD *)(*v9 + 16))
      break;
    swift_retain();
    swift_bridgeObjectRetain();
    v102 = sub_2188768A0(v100);
    if ((v103 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_release();
      break;
    }
    v104 = *(_QWORD *)(*(_QWORD *)(v101 + 56) + 8 * v102);
    swift_release();
    swift_bridgeObjectRelease();
    v105 = v104 - 1;
    if (v104 == 1)
    {
      v115 = v50;
      v116 = swift_retain();
      MEMORY[0x219A1B4FC](v116);
      if (*(_QWORD *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2188A5E1C();
      sub_2188A5E28();
      sub_2188A5E10();
      swift_beginAccess();
      swift_retain();
      swift_bridgeObjectRetain();
      v117 = sub_2188768A0(v100);
      a2 = v118;
      swift_bridgeObjectRelease();
      if ((a2 & 1) != 0)
      {
        v119 = swift_isUniquelyReferenced_nonNull_native();
        v120 = *v9;
        v178 = *v9;
        *v9 = 0x8000000000000000;
        if ((v119 & 1) == 0)
        {
          sub_218879100();
          v120 = v178;
        }
        swift_release();
        sub_218897C3C(v117, v120);
        a2 = *v9;
        *v9 = v120;
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
      }
      swift_endAccess();
      v50 = v115;
      goto LABEL_130;
    }
    if (!v104)
      break;
    v169 = v10;
    v10 = v50;
    swift_beginAccess();
    swift_retain();
    a2 = swift_isUniquelyReferenced_nonNull_native();
    v106 = *v9;
    v177 = (_QWORD *)*v9;
    *v9 = 0x8000000000000000;
    v108 = sub_2188768A0(v100);
    v109 = *(_QWORD *)(v106 + 16);
    v110 = (v107 & 1) == 0;
    v111 = v109 + v110;
    if (__OFADD__(v109, v110))
    {
      __break(1u);
      goto LABEL_190;
    }
    v12 = v107;
    if (*(_QWORD *)(v106 + 24) >= v111)
    {
      if ((a2 & 1) != 0)
      {
        v114 = v177;
        if ((v107 & 1) == 0)
          goto LABEL_155;
      }
      else
      {
        sub_218879100();
        v114 = v177;
        if ((v12 & 1) == 0)
          goto LABEL_155;
      }
    }
    else
    {
      sub_21887792C(v111, a2);
      v112 = sub_2188768A0(v100);
      if ((v12 & 1) != (v113 & 1))
        goto LABEL_238;
      v108 = v112;
      v114 = v177;
      if ((v12 & 1) == 0)
      {
LABEL_155:
        v114[(v108 >> 6) + 8] |= 1 << v108;
        v121 = 8 * v108;
        *(_QWORD *)(v114[6] + v121) = v100;
        *(_QWORD *)(v114[7] + v121) = v105;
        v122 = v114[2];
        v45 = __OFADD__(v122, 1);
        v123 = v122 + 1;
        if (v45)
        {
          __break(1u);
          goto LABEL_194;
        }
        v114[2] = v123;
        swift_retain();
        goto LABEL_157;
      }
    }
    *(_QWORD *)(v114[7] + 8 * v108) = v105;
LABEL_157:
    *v9 = (uint64_t)v114;
    swift_release();
    swift_bridgeObjectRelease();
    swift_endAccess();
    v50 = v10;
    v96 = v166;
    v10 = v169;
LABEL_130:
    swift_release();
    ++v6;
    v98 = v10 == v96;
    v97 = v160;
    if (v98)
      goto LABEL_158;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_254FFC850 != -1)
    swift_once();
  v134 = sub_2188A5C9C();
  __swift_project_value_buffer(v134, (uint64_t)qword_254FFEE30);
  v52 = sub_2188A5C84();
  v53 = sub_2188A5E58();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v54 = 0;
    v55 = "unassignAllAssets: Refcount for assigned password not found";
    goto LABEL_180;
  }
LABEL_181:

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v135 = xmmword_2188A86A0;
  *(_BYTE *)(v135 + 16) = 9;
  swift_willThrow();
  return swift_release();
}

void sub_21888A124(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[3];
  unint64_t v32;

  v4 = v3;
  swift_beginAccess();
  v8 = *(_QWORD *)(v3 + 104);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_2188767BC(a1, a2);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRetain();
    }
    else
    {
      v11 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  v32 = v11;
  swift_bridgeObjectRetain();
  v12 = sub_218893820(a3, v11);
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_254FFC850 != -1)
      swift_once();
    v13 = sub_2188A5C9C();
    __swift_project_value_buffer(v13, (uint64_t)qword_254FFEE30);
    swift_bridgeObjectRetain_n();
    v14 = sub_2188A5C84();
    v15 = sub_2188A5E34();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v31[0] = v17;
      *(_DWORD *)v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_2188A17DC(a1, a2, v31);
      sub_2188A5EC4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21885E000, v14, v15, "addCertRefCount: cert already assigned to configuration %s, not updating references", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v17, -1, -1);
      MEMORY[0x219A1C06C](v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    v18 = swift_retain();
    MEMORY[0x219A1B4FC](v18);
    if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2188A5E1C();
    sub_2188A5E28();
    sub_2188A5E10();
    v19 = v32;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = *(_QWORD *)(v4 + 104);
    *(_QWORD *)(v4 + 104) = 0x8000000000000000;
    sub_2188984C0(v19, a1, a2, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v4 + 104) = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    v21 = (uint64_t *)(v4 + 112);
    swift_beginAccess();
    v22 = *(_QWORD *)(v4 + 112);
    if (*(_QWORD *)(v22 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v23 = sub_2188768A0(a3);
      if ((v24 & 1) != 0)
        v25 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23);
      else
        v25 = 0;
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      v25 = 0;
    }
    v26 = __CFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
    {
      __break(1u);
    }
    else
    {
      swift_beginAccess();
      swift_retain();
      v28 = swift_isUniquelyReferenced_nonNull_native();
      v29 = *v21;
      *v21 = 0x8000000000000000;
      sub_21889815C(v27, a3, v28);
      *v21 = v29;
      swift_release();
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
  }
}

uint64_t sub_21888A51C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *), const char *a7, void (*a8)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *), uint64_t a9, const char *a10, uint64_t a11, void (*a12)(_QWORD), const char *a13, const char *a14)
{
  _QWORD *v14;
  void *v15;
  _QWORD *v17;
  uint64_t inited;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  id v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v78;
  unsigned int v80;
  unint64_t v81;
  _OWORD v82[2];
  __int128 v83;
  uint64_t v84;
  _QWORD v85[31];

  v17 = v14;
  v85[29] = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A9230;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v23;
  *(_QWORD *)(inited + 72) = ((uint64_t (*)(_QWORD))a5)(0);
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v24;
  *(_QWORD *)(inited + 120) = swift_getObjectType();
  *(_QWORD *)(inited + 96) = a2;
  *(_QWORD *)(inited + 128) = sub_2188A5D20();
  *(_QWORD *)(inited + 136) = v25;
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 144) = a3;
  *(_QWORD *)(inited + 152) = a4;
  *(_QWORD *)(inited + 176) = sub_2188A5D20();
  *(_QWORD *)(inited + 184) = v26;
  v27 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 216) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 192) = 1;
  v28 = a1;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v29 = sub_218875DE8(inited);
  v81 = v29;
  if (v17[2] != 1)
  {
LABEL_4:
    v85[0] = 0;
    v80 = 0;
    v35 = v17[3];
    v36 = v17[4];
    a6(v35, v36, &v80, &v81, v85);
    v37 = v15;
    if (v15)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v38 = sub_2188A5C9C();
      __swift_project_value_buffer(v38, (uint64_t)qword_254FFEE30);
      v39 = v15;
      v40 = v15;
      v41 = sub_2188A5C84();
      v42 = sub_2188A5E4C();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        v75 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v43 = 138412290;
        v44 = v15;
        v45 = v36;
        v46 = v35;
        v47 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v83 = v47;
        sub_2188A5EC4();
        a5 = (uint64_t)v75;
        *v75 = v47;
        v35 = v46;
        v36 = v45;

        _os_log_impl(&dword_21885E000, v41, v42, a14, v43, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v75, -1, -1);
        MEMORY[0x219A1C06C](v43, -1, -1);

      }
      else
      {

      }
      v37 = 0;
    }
    if (!v80)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v59 = sub_2188A5C9C();
      __swift_project_value_buffer(v59, (uint64_t)qword_254FFEE30);
      v60 = sub_2188A5C84();
      v61 = sub_2188A5E40();
      a5 = v61;
      if (os_log_type_enabled(v60, v61))
      {
        v62 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_21885E000, v60, (os_log_type_t)a5, a10, v62, 2u);
        MEMORY[0x219A1C06C](v62, -1, -1);
      }

      goto LABEL_36;
    }
    if (v80 == -25299)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v48 = sub_2188A5C9C();
      __swift_project_value_buffer(v48, (uint64_t)qword_254FFEE30);
      v49 = sub_2188A5C84();
      v50 = sub_2188A5E40();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_21885E000, v49, v50, a7, v51, 2u);
        MEMORY[0x219A1C06C](v51, -1, -1);
      }

      a8(v35, v36, &v80, &v81, v85);
      a5 = (uint64_t)v37;
      if (v37)
      {
        v52 = v37;
        v53 = v37;
        v54 = sub_2188A5C84();
        v55 = sub_2188A5E4C();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = (uint8_t *)swift_slowAlloc();
          v78 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v56 = 138412290;
          v57 = v37;
          v58 = _swift_stdlib_bridgeErrorToNSError();
          *(_QWORD *)&v83 = v58;
          sub_2188A5EC4();
          *v78 = v58;

          _os_log_impl(&dword_21885E000, v54, v55, a14, v56, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v78, -1, -1);
          MEMORY[0x219A1C06C](v56, -1, -1);

          if (!v80)
          {
LABEL_36:
            if (v85[0])
            {
              *(_QWORD *)&v82[0] = v85[0];
              swift_unknownObjectRetain();
              if ((swift_dynamicCast() & 1) != 0)
              {
                v69 = v83;
                a12(0);
                a5 = swift_allocObject();
                *(_OWORD *)(a5 + 16) = v69;
                swift_unknownObjectRelease();
                swift_bridgeObjectRelease();
                return a5;
              }
            }
            if (qword_254FFC850 != -1)
              swift_once();
            v70 = sub_2188A5C9C();
            __swift_project_value_buffer(v70, (uint64_t)qword_254FFEE30);
            v71 = sub_2188A5C84();
            v72 = sub_2188A5E58();
            if (os_log_type_enabled(v71, v72))
            {
              a5 = (uint64_t)a13;
              v73 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v73 = 0;
              _os_log_impl(&dword_21885E000, v71, v72, a13, v73, 2u);
              MEMORY[0x219A1C06C](v73, -1, -1);
            }

            sub_21887B0BC();
            swift_allocError();
            *(_QWORD *)v74 = 0;
            *(_QWORD *)(v74 + 8) = 0;
            *(_BYTE *)(v74 + 16) = 9;
LABEL_44:
            swift_willThrow();
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            return a5;
          }
        }
        else
        {

          if (!v80)
            goto LABEL_36;
        }
      }
      else if (!v80)
      {
        goto LABEL_36;
      }
      v64 = sub_2188A5C84();
      v65 = sub_2188A5E58();
      if (!os_log_type_enabled(v64, v65))
      {
LABEL_34:

        swift_beginAccess();
        v67 = v80;
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v68 = v67;
        *(_QWORD *)(v68 + 8) = 0;
        *(_BYTE *)(v68 + 16) = 0;
        goto LABEL_44;
      }
      a5 = a9;
    }
    else
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v63 = sub_2188A5C9C();
      __swift_project_value_buffer(v63, (uint64_t)qword_254FFEE30);
      v64 = sub_2188A5C84();
      v65 = sub_2188A5E58();
      if (!os_log_type_enabled(v64, v65))
        goto LABEL_34;
      a5 = a11;
    }
    v66 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v66 = 67109120;
    swift_beginAccess();
    LODWORD(v83) = v80;
    sub_2188A5EC4();
    _os_log_impl(&dword_21885E000, v64, v65, (const char *)a5, v66, 8u);
    MEMORY[0x219A1C06C](v66, -1, -1);
    goto LABEL_34;
  }
  v30 = v29;
  result = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    a5 = sub_2188A5D20();
    v33 = v32;
    v84 = v27;
    LOBYTE(v83) = 1;
    sub_21887A73C(&v83, v82);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v85[0] = v30;
    sub_218898008(v82, a5, v33, isUniquelyReferenced_nonNull_native);
    v81 = v85[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

void sub_21888AEA0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[3];
  unint64_t v32;

  v4 = v3;
  swift_beginAccess();
  v8 = *(_QWORD *)(v3 + 120);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_2188767BC(a1, a2);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRetain();
    }
    else
    {
      v11 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  v32 = v11;
  swift_bridgeObjectRetain();
  v12 = sub_218893820(a3, v11);
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_254FFC850 != -1)
      swift_once();
    v13 = sub_2188A5C9C();
    __swift_project_value_buffer(v13, (uint64_t)qword_254FFEE30);
    swift_bridgeObjectRetain_n();
    v14 = sub_2188A5C84();
    v15 = sub_2188A5E34();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v31[0] = v17;
      *(_DWORD *)v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_2188A17DC(a1, a2, v31);
      sub_2188A5EC4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21885E000, v14, v15, "addKeyRefCount: key already assigned to configuration %s, not updating references", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v17, -1, -1);
      MEMORY[0x219A1C06C](v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    v18 = swift_retain();
    MEMORY[0x219A1B4FC](v18);
    if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2188A5E1C();
    sub_2188A5E28();
    sub_2188A5E10();
    v19 = v32;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = *(_QWORD *)(v4 + 120);
    *(_QWORD *)(v4 + 120) = 0x8000000000000000;
    sub_2188984D4(v19, a1, a2, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v4 + 120) = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    v21 = (uint64_t *)(v4 + 128);
    swift_beginAccess();
    v22 = *(_QWORD *)(v4 + 128);
    if (*(_QWORD *)(v22 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v23 = sub_2188768A0(a3);
      if ((v24 & 1) != 0)
        v25 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23);
      else
        v25 = 0;
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      v25 = 0;
    }
    v26 = __CFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
    {
      __break(1u);
    }
    else
    {
      swift_beginAccess();
      swift_retain();
      v28 = swift_isUniquelyReferenced_nonNull_native();
      v29 = *v21;
      *v21 = 0x8000000000000000;
      sub_218898138(v27, a3, v28);
      *v21 = v29;
      swift_release();
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
  }
}

uint64_t sub_21888B298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t inited;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  id v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  uint8_t *v60;
  id v61;
  id v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  id v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  uint8_t *v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t v89;
  _QWORD v90[2];
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  unint64_t v96;
  CFTypeRef v97;
  unsigned int v98;
  unint64_t v99;
  _OWORD v100[2];
  __int128 v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  CFTypeRef v105[55];

  v91 = a6;
  v94 = a7;
  v92 = a8;
  v93 = a5;
  v105[53] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  v11 = sub_2188A5D68();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2188A5D50();
  v15 = sub_2188A5D2C();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v96 = v17;
  if (v17 >> 60 == 15)
    __break(1u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A9240;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v19;
  v20 = sub_2188A5D20();
  v21 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v20;
  *(_QWORD *)(inited + 56) = v22;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v23;
  *(_QWORD *)(inited + 120) = v21;
  v24 = v93;
  *(_QWORD *)(inited + 96) = a4;
  *(_QWORD *)(inited + 104) = v24;
  *(_QWORD *)(inited + 128) = sub_2188A5D20();
  *(_QWORD *)(inited + 136) = v25;
  *(_QWORD *)(inited + 168) = v21;
  v26 = v94;
  *(_QWORD *)(inited + 144) = v91;
  *(_QWORD *)(inited + 152) = v26;
  *(_QWORD *)(inited + 176) = sub_2188A5D20();
  *(_QWORD *)(inited + 184) = v27;
  *(_QWORD *)(inited + 216) = v21;
  *(_QWORD *)(inited + 192) = v92;
  *(_QWORD *)(inited + 200) = a9;
  *(_QWORD *)(inited + 224) = sub_2188A5D20();
  *(_QWORD *)(inited + 232) = v28;
  v29 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 264) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 240) = 1;
  *(_QWORD *)(inited + 272) = sub_2188A5D20();
  *(_QWORD *)(inited + 280) = v30;
  *(_QWORD *)(inited + 312) = swift_getObjectType();
  *(_QWORD *)(inited + 288) = a3;
  *(_QWORD *)(inited + 320) = sub_2188A5D20();
  *(_QWORD *)(inited + 328) = v31;
  *(_QWORD *)(inited + 360) = v29;
  *(_BYTE *)(inited + 336) = 1;
  *(_QWORD *)(inited + 368) = sub_2188A5D20();
  *(_QWORD *)(inited + 376) = v32;
  *(_QWORD *)(inited + 408) = MEMORY[0x24BDCDDE8];
  v33 = v96;
  *(_QWORD *)(inited + 384) = v15;
  *(_QWORD *)(inited + 392) = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_21887A0FC(v15, v33);
  v34 = sub_218875DE8(inited);
  v99 = v34;
  v35 = v15;
  v36 = v95;
  if (*(_QWORD *)(v95 + 16) != 1)
  {
LABEL_5:
    v105[0] = 0;
    v98 = 0;
    v43 = *(_QWORD *)(v36 + 24);
    v44 = *(_QWORD *)(v36 + 32);
    v45 = (void *)v90[1];
    sub_21889BDA8(v43, v44, &v98, (uint64_t)&v99, (uint64_t)v105);
    v46 = v45;
    if (v45)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v47 = sub_2188A5C9C();
      __swift_project_value_buffer(v47, (uint64_t)qword_254FFEE30);
      v48 = v45;
      v49 = v45;
      v50 = sub_2188A5C84();
      v51 = sub_2188A5E4C();
      if (os_log_type_enabled(v50, v51))
      {
        v90[0] = v35;
        v52 = (uint8_t *)swift_slowAlloc();
        v94 = (_QWORD *)swift_slowAlloc();
        v95 = v43;
        *(_DWORD *)v52 = 138412290;
        v53 = v45;
        v54 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v101 = v54;
        v43 = v95;
        sub_2188A5EC4();
        v55 = v94;
        *v94 = v54;
        v35 = v90[0];

        _os_log_impl(&dword_21885E000, v50, v51, "copyPassword: Failed to apply persona: %@", v52, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v55, -1, -1);
        MEMORY[0x219A1C06C](v52, -1, -1);

      }
      else
      {

      }
      v46 = 0;
    }
    if (v98)
    {
      if (v98 != -25299)
      {
        if (qword_254FFC850 != -1)
          swift_once();
        v73 = sub_2188A5C9C();
        __swift_project_value_buffer(v73, (uint64_t)qword_254FFEE30);
        v74 = sub_2188A5C84();
        v75 = sub_2188A5E58();
        v76 = v75;
        if (os_log_type_enabled(v74, v75))
        {
          v77 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v77 = 67109120;
          swift_beginAccess();
          LODWORD(v101) = v98;
          sub_2188A5EC4();
          _os_log_impl(&dword_21885E000, v74, (os_log_type_t)v76, "copyPassword: status %d", v77, 8u);
          MEMORY[0x219A1C06C](v77, -1, -1);
        }

        swift_beginAccess();
        goto LABEL_38;
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v56 = sub_2188A5C9C();
      v95 = __swift_project_value_buffer(v56, (uint64_t)qword_254FFEE30);
      v57 = sub_2188A5C84();
      v58 = sub_2188A5E40();
      v59 = os_log_type_enabled(v57, v58);
      v90[0] = v35;
      if (v59)
      {
        v60 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v60 = 67109120;
        swift_beginAccess();
        LODWORD(v101) = v98;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v57, v58, "copyPassword: SecItemAdd status %d", v60, 8u);
        v35 = v90[0];
        MEMORY[0x219A1C06C](v60, -1, -1);
      }

      sub_21889BDF8(v43, v44, (OSStatus *)&v98, (uint64_t)&v99, v105);
      if (v46)
      {
        v61 = v46;
        v62 = v46;
        v63 = sub_2188A5C84();
        v64 = sub_2188A5E4C();
        if (os_log_type_enabled(v63, v64))
        {
          v65 = (uint8_t *)swift_slowAlloc();
          v94 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v65 = 138412290;
          v66 = v46;
          v67 = _swift_stdlib_bridgeErrorToNSError();
          *(_QWORD *)&v101 = v67;
          sub_2188A5EC4();
          v68 = v94;
          *v94 = v67;

          _os_log_impl(&dword_21885E000, v63, v64, "copyPassword: Failed to apply persona: %@", v65, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v68, -1, -1);
          MEMORY[0x219A1C06C](v65, -1, -1);

        }
        else
        {

        }
        v35 = v90[0];
      }
      swift_beginAccess();
      if (v98)
      {
        v78 = sub_2188A5C84();
        v79 = sub_2188A5E58();
        v76 = v79;
        if (os_log_type_enabled(v78, v79))
        {
          v80 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v80 = 67109120;
          LODWORD(v103) = v98;
          sub_2188A5EC4();
          _os_log_impl(&dword_21885E000, v78, (os_log_type_t)v76, "copyPassword: SecItemCopyMatching status %d", v80, 8u);
          MEMORY[0x219A1C06C](v80, -1, -1);
        }

LABEL_38:
        v81 = v98;
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v82 = v81;
        *(_QWORD *)(v82 + 8) = 0;
        *(_BYTE *)(v82 + 16) = 0;
        goto LABEL_47;
      }
    }
    else
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v69 = sub_2188A5C9C();
      __swift_project_value_buffer(v69, (uint64_t)qword_254FFEE30);
      v70 = sub_2188A5C84();
      v71 = sub_2188A5E40();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v72 = 67109120;
        swift_beginAccess();
        LODWORD(v100[0]) = v98;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v70, v71, "copyPassword: SecItemAdd status %d", v72, 8u);
        MEMORY[0x219A1C06C](v72, -1, -1);
      }

    }
    if (v105[0])
    {
      v97 = v105[0];
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_21887A154(v35, v96);
        v83 = v103;
        v84 = v104;
        type metadata accessor for MKPrimaryKeyPassword();
        v76 = swift_allocObject();
        *(_QWORD *)(v76 + 16) = v83;
        *(_QWORD *)(v76 + 24) = v84;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v76;
      }
    }
    if (qword_254FFC850 != -1)
      swift_once();
    v85 = sub_2188A5C9C();
    __swift_project_value_buffer(v85, (uint64_t)qword_254FFEE30);
    v86 = sub_2188A5C84();
    v87 = sub_2188A5E58();
    v76 = v87;
    if (os_log_type_enabled(v86, v87))
    {
      v88 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v88 = 0;
      _os_log_impl(&dword_21885E000, v86, (os_log_type_t)v76, "copyPassword: SecItemAdd/SecItemCopyMatching did not return result", v88, 2u);
      MEMORY[0x219A1C06C](v88, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v89 = 0;
    *(_QWORD *)(v89 + 8) = 0;
    *(_BYTE *)(v89 + 16) = 9;
LABEL_47:
    swift_willThrow();
    sub_21887A154(v35, v96);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return v76;
  }
  v37 = v34;
  result = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    v39 = sub_2188A5D20();
    v41 = v40;
    v102 = v29;
    LOBYTE(v101) = 1;
    sub_21887A73C(&v101, v100);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v103 = v37;
    v99 = 0x8000000000000000;
    sub_218898008(v100, v39, v41, isUniquelyReferenced_nonNull_native);
    v99 = v103;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void sub_21888BEA4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[3];
  unint64_t v32;

  v4 = v3;
  swift_beginAccess();
  v8 = *(_QWORD *)(v3 + 136);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_2188767BC(a1, a2);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRetain();
    }
    else
    {
      v11 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  v32 = v11;
  swift_bridgeObjectRetain();
  v12 = sub_218893820(a3, v11);
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_254FFC850 != -1)
      swift_once();
    v13 = sub_2188A5C9C();
    __swift_project_value_buffer(v13, (uint64_t)qword_254FFEE30);
    swift_bridgeObjectRetain_n();
    v14 = sub_2188A5C84();
    v15 = sub_2188A5E34();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v31[0] = v17;
      *(_DWORD *)v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_2188A17DC(a1, a2, v31);
      sub_2188A5EC4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21885E000, v14, v15, "addPasswordRefCount: password already assigned to configuration %s, not updating references", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v17, -1, -1);
      MEMORY[0x219A1C06C](v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    v18 = swift_retain();
    MEMORY[0x219A1B4FC](v18);
    if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2188A5E1C();
    sub_2188A5E28();
    sub_2188A5E10();
    v19 = v32;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = *(_QWORD *)(v4 + 136);
    *(_QWORD *)(v4 + 136) = 0x8000000000000000;
    sub_2188984E8(v19, a1, a2, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v4 + 136) = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    v21 = (uint64_t *)(v4 + 144);
    swift_beginAccess();
    v22 = *(_QWORD *)(v4 + 144);
    if (*(_QWORD *)(v22 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v23 = sub_2188768A0(a3);
      if ((v24 & 1) != 0)
        v25 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23);
      else
        v25 = 0;
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      v25 = 0;
    }
    v26 = __CFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
    {
      __break(1u);
    }
    else
    {
      swift_beginAccess();
      swift_retain();
      v28 = swift_isUniquelyReferenced_nonNull_native();
      v29 = *v21;
      *v21 = 0x8000000000000000;
      sub_2188981A8(v27, a3, v28);
      *v21 = v29;
      swift_release();
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
  }
}

uint64_t sub_21888C29C(uint64_t a1)
{
  return sub_21888C808(a1, (void (*)(_QWORD, _QWORD, unint64_t *, unint64_t *))sub_21889BE40, "deleteCertFromKeychain: status %d", "deleteCertFromKeychain: Failed to apply persona: %@");
}

uint64_t sub_21888C2C8(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  unint64_t v35;
  _OWORD v36[2];
  __int128 v37;
  uint64_t v38;
  unint64_t v39;

  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A86D0;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v6;
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(inited + 72) = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = v8;
  sub_21887A110(v7, v8);
  v9 = sub_218875DE8(inited);
  v39 = v9;
  if (v3[2] == 1)
  {
    v10 = v9;
    result = *MEMORY[0x24BDE9538];
    if (!*MEMORY[0x24BDE9538])
    {
      __break(1u);
      return result;
    }
    v12 = sub_2188A5D20();
    v14 = v13;
    v38 = MEMORY[0x24BEE1328];
    LOBYTE(v37) = 1;
    sub_21887A73C(&v37, v36);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v35 = v10;
    v39 = 0x8000000000000000;
    sub_218898008(v36, v12, v14, isUniquelyReferenced_nonNull_native);
    v39 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  LODWORD(v35) = 0;
  sub_21889BE40(v3[3], v3[4], (OSStatus *)&v35);
  if (v2)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v16 = sub_2188A5C9C();
    __swift_project_value_buffer(v16, (uint64_t)qword_254FFEE30);
    v17 = v2;
    v18 = v2;
    v19 = sub_2188A5C84();
    v20 = sub_2188A5E4C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v23 = v2;
      v24 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v37 = v24;
      sub_2188A5EC4();
      *v22 = v24;

      _os_log_impl(&dword_21885E000, v19, v20, "deleteKeyFromKeychain: Failed to apply persona: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v22, -1, -1);
      MEMORY[0x219A1C06C](v21, -1, -1);

    }
    else
    {

    }
  }
  if ((_DWORD)v35)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v25 = sub_2188A5C9C();
    __swift_project_value_buffer(v25, (uint64_t)qword_254FFEE30);
    v26 = sub_2188A5C84();
    v27 = sub_2188A5E58();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v28 = 67109120;
      swift_beginAccess();
      LODWORD(v37) = v35;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v26, v27, "deleteKeyFromKeychain: status %d", v28, 8u);
      MEMORY[0x219A1C06C](v28, -1, -1);
    }

    swift_beginAccess();
    v29 = v35;
    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v30 = v29;
    *(_QWORD *)(v30 + 8) = 0;
    *(_BYTE *)(v30 + 16) = 0;
    swift_willThrow();
  }
  else
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v31 = sub_2188A5C9C();
    __swift_project_value_buffer(v31, (uint64_t)qword_254FFEE30);
    v32 = sub_2188A5C84();
    v33 = sub_2188A5E40();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v34 = 67109120;
      swift_beginAccess();
      LODWORD(v36[0]) = v35;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v32, v33, "deleteKeyFromKeychain: status %d", v34, 8u);
      MEMORY[0x219A1C06C](v34, -1, -1);
    }

  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_21888C7DC(uint64_t a1)
{
  return sub_21888C808(a1, (void (*)(_QWORD, _QWORD, unint64_t *, unint64_t *))sub_21889BE40, "deletePasswordFromKeychain: status %d", "deletePasswordFromKeychain: Failed to apply persona: %@");
}

uint64_t sub_21888C808(uint64_t a1, void (*a2)(_QWORD, _QWORD, unint64_t *, unint64_t *), const char *a3, char *a4)
{
  _QWORD *v4;
  void *v5;
  _QWORD *v9;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  char *format;
  unint64_t v44;
  _OWORD v45[2];
  __int128 v46;
  uint64_t v47;
  unint64_t v48;

  v9 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A86D0;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v12;
  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(inited + 72) = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 48) = v13;
  *(_QWORD *)(inited + 56) = v14;
  sub_21887A110(v13, v14);
  v15 = sub_218875DE8(inited);
  v48 = v15;
  if (v9[2] == 1)
  {
    v16 = v15;
    result = *MEMORY[0x24BDE9538];
    if (!*MEMORY[0x24BDE9538])
    {
      __break(1u);
      return result;
    }
    v18 = sub_2188A5D20();
    v20 = v19;
    v47 = MEMORY[0x24BEE1328];
    LOBYTE(v46) = 1;
    sub_21887A73C(&v46, v45);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v44 = v16;
    v48 = 0x8000000000000000;
    sub_218898008(v45, v18, v20, isUniquelyReferenced_nonNull_native);
    v48 = v16;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  LODWORD(v44) = 0;
  a2(v9[3], v9[4], &v44, &v48);
  v22 = 0x254FFC000uLL;
  if (v5)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v23 = sub_2188A5C9C();
    __swift_project_value_buffer(v23, (uint64_t)qword_254FFEE30);
    v24 = v5;
    v25 = v5;
    v26 = sub_2188A5C84();
    v27 = sub_2188A5E4C();
    if (os_log_type_enabled(v26, v27))
    {
      format = a4;
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v28 = 138412290;
      v30 = v5;
      v31 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v46 = v31;
      v22 = 0x254FFC000;
      sub_2188A5EC4();
      *v29 = v31;

      _os_log_impl(&dword_21885E000, v26, v27, format, v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v29, -1, -1);
      MEMORY[0x219A1C06C](v28, -1, -1);

    }
    else
    {

    }
  }
  v32 = *(_QWORD *)(v22 + 2128);
  if ((_DWORD)v44)
  {
    if (v32 != -1)
      swift_once();
    v33 = sub_2188A5C9C();
    __swift_project_value_buffer(v33, (uint64_t)qword_254FFEE30);
    v34 = sub_2188A5C84();
    v35 = sub_2188A5E58();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v36 = 67109120;
      swift_beginAccess();
      LODWORD(v46) = v44;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v34, v35, a3, v36, 8u);
      MEMORY[0x219A1C06C](v36, -1, -1);
    }

    swift_beginAccess();
    v37 = v44;
    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v38 = v37;
    *(_QWORD *)(v38 + 8) = 0;
    *(_BYTE *)(v38 + 16) = 0;
    swift_willThrow();
  }
  else
  {
    if (v32 != -1)
      swift_once();
    v39 = sub_2188A5C9C();
    __swift_project_value_buffer(v39, (uint64_t)qword_254FFEE30);
    v40 = sub_2188A5C84();
    v41 = sub_2188A5E40();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v42 = 67109120;
      swift_beginAccess();
      LODWORD(v45[0]) = v44;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v40, v41, a3, v42, 8u);
      MEMORY[0x219A1C06C](v42, -1, -1);
    }

  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_21888CD2C(void *a1)
{
  return sub_21888D5A4(a1, (uint64_t (*)(_QWORD))type metadata accessor for SecCertificate, (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BDA8, "addCertToKeychain: SecItemAdd status %d", (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BDF8, "addCertToKeychain: SecItemCopyMatching status %d", "addCertToKeychain: status %d", (void (*)(_QWORD))type metadata accessor for MKPrimaryKeyCert, "addCertToKeychain: SecItemAdd/SecItemCopyMatching did not return result", "addCertToKeychain: Failed to apply persona: %@");
}

uint64_t sub_21888CDC0(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  uint64_t inited;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;
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
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  CFTypeID v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  unsigned int v49;
  unint64_t v50;
  _OWORD v51[2];
  __int128 v52;
  uint64_t v53;
  _QWORD v54[19];

  v3 = v1;
  v54[17] = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A8630;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v6;
  v8 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(inited + 72) = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 48) = v8;
  *(_QWORD *)(inited + 56) = v7;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v9;
  v10 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 96) = 1;
  sub_21887A110(v8, v7);
  v11 = sub_218875DE8(inited);
  v50 = v11;
  if (v3[2] != 1)
  {
LABEL_4:
    v54[0] = 0;
    v49 = 0;
    sub_21889BD58(v3[3], v3[4], &v49, (uint64_t)&v50, (uint64_t)v54);
    if (v2)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v18 = sub_2188A5C9C();
      __swift_project_value_buffer(v18, (uint64_t)qword_254FFEE30);
      v19 = v2;
      v20 = v2;
      v21 = sub_2188A5C84();
      v22 = sub_2188A5E4C();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v24 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v23 = 138412290;
        v25 = v2;
        v26 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v52 = v26;
        sub_2188A5EC4();
        *v24 = v26;

        _os_log_impl(&dword_21885E000, v21, v22, "copyCertFromKeychain: Failed to apply persona: %@", v23, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v24, -1, -1);
        MEMORY[0x219A1C06C](v23, -1, -1);

      }
      else
      {

      }
    }
    if (v49)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v27 = sub_2188A5C9C();
      __swift_project_value_buffer(v27, (uint64_t)qword_254FFEE30);
      v28 = sub_2188A5C84();
      v29 = sub_2188A5E58();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v30 = 67109120;
        swift_beginAccess();
        LODWORD(v52) = v49;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v28, v29, "copyCertFromKeychain: status %d", v30, 8u);
        MEMORY[0x219A1C06C](v30, -1, -1);
      }

      swift_beginAccess();
      v31 = v49;
      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v32 = v31;
      *(_QWORD *)(v32 + 8) = 0;
      *(_BYTE *)(v32 + 16) = 0;
    }
    else
    {
      if (v54[0])
      {
        v33 = (const void *)swift_unknownObjectRetain();
        v34 = CFGetTypeID(v33);
        if (v34 == SecCertificateGetTypeID())
        {
          if (qword_254FFC850 != -1)
            swift_once();
          v35 = sub_2188A5C9C();
          __swift_project_value_buffer(v35, (uint64_t)qword_254FFEE30);
          v36 = sub_2188A5C84();
          v37 = sub_2188A5E40();
          if (os_log_type_enabled(v36, v37))
          {
            v38 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v38 = 0;
            _os_log_impl(&dword_21885E000, v36, v37, "copyCertFromKeychain: succeeded", v38, 2u);
            MEMORY[0x219A1C06C](v38, -1, -1);
          }

          type metadata accessor for SecCertificate(0);
          v31 = swift_dynamicCastUnknownClassUnconditional();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          return v31;
        }
        if (qword_254FFC850 != -1)
          swift_once();
        v44 = sub_2188A5C9C();
        __swift_project_value_buffer(v44, (uint64_t)qword_254FFEE30);
        v45 = sub_2188A5C84();
        v46 = sub_2188A5E58();
        v31 = v46;
        if (os_log_type_enabled(v45, v46))
        {
          v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_21885E000, v45, (os_log_type_t)v31, "copyCertFromKeychain: returned wrong type", v47, 2u);
          MEMORY[0x219A1C06C](v47, -1, -1);
        }

        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v48 = 0;
        *(_QWORD *)(v48 + 8) = 0;
        *(_BYTE *)(v48 + 16) = 9;
        swift_willThrow();
        swift_unknownObjectRelease();
LABEL_17:
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v31;
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v39 = sub_2188A5C9C();
      __swift_project_value_buffer(v39, (uint64_t)qword_254FFEE30);
      v40 = sub_2188A5C84();
      v41 = sub_2188A5E58();
      v31 = v41;
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_21885E000, v40, (os_log_type_t)v31, "copyCertFromKeychain: returned nil", v42, 2u);
        MEMORY[0x219A1C06C](v42, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v43 = 0;
      *(_QWORD *)(v43 + 8) = 0;
      *(_BYTE *)(v43 + 16) = 9;
    }
    swift_willThrow();
    goto LABEL_17;
  }
  v12 = v11;
  result = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    v14 = sub_2188A5D20();
    v16 = v15;
    v53 = v10;
    LOBYTE(v52) = 1;
    sub_21887A73C(&v52, v51);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v54[0] = v12;
    sub_218898008(v51, v14, v16, isUniquelyReferenced_nonNull_native);
    v50 = v54[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_21888D510(void *a1)
{
  return sub_21888D5A4(a1, (uint64_t (*)(_QWORD))type metadata accessor for SecKey, (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BDA8, "addKeyToKeychain: SecItemAdd status %d", (void (*)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *))sub_21889BDF8, "addKeyToKeychain: SecItemCopyMatching status %d", "addKeyToKeychain: status %d", (void (*)(_QWORD))type metadata accessor for MKPrimaryKeyKey, "addKeyToKeychain: SecItemAdd/SecItemCopyMatching did not return result", "addKeyToKeychain: Failed to apply persona: %@");
}

uint64_t sub_21888D5A4(void *a1, uint64_t (*a2)(_QWORD), void (*a3)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *), const char *a4, void (*a5)(uint64_t, uint64_t, unsigned int *, unint64_t *, _QWORD *), const char *a6, const char *a7, void (*a8)(_QWORD), const char *a9, const char *a10)
{
  _QWORD *v10;
  void *v11;
  _QWORD *v14;
  uint64_t inited;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  _QWORD *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint8_t *v52;
  id v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  _QWORD *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint8_t *v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  unsigned int v87;
  unint64_t v88;
  _OWORD v89[2];
  __int128 v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  _QWORD v94[31];

  v14 = v10;
  v94[29] = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A9230;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v17;
  *(_QWORD *)(inited + 72) = a2(0);
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v18;
  v19 = v14[5];
  v20 = v14[6];
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 96) = v19;
  *(_QWORD *)(inited + 104) = v20;
  *(_QWORD *)(inited + 128) = sub_2188A5D20();
  *(_QWORD *)(inited + 136) = v21;
  v22 = (void *)*MEMORY[0x24BDE8F70];
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 168) = v23;
  *(_QWORD *)(inited + 144) = v22;
  *(_QWORD *)(inited + 176) = sub_2188A5D20();
  *(_QWORD *)(inited + 184) = v24;
  v25 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 216) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 192) = 1;
  v26 = a1;
  swift_bridgeObjectRetain();
  v27 = v22;
  v28 = sub_218875DE8(inited);
  v88 = v28;
  if (v14[2] != 1)
  {
LABEL_4:
    v94[0] = 0;
    v87 = 0;
    v36 = v14[3];
    v35 = v14[4];
    a3(v36, v35, &v87, &v88, v94);
    v37 = v11;
    if (v11)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v38 = sub_2188A5C9C();
      __swift_project_value_buffer(v38, (uint64_t)qword_254FFEE30);
      v39 = v11;
      v40 = v11;
      v41 = sub_2188A5C84();
      v42 = sub_2188A5E4C();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        v44 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v43 = 138412290;
        v45 = v11;
        v46 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v90 = v46;
        sub_2188A5EC4();
        *v44 = v46;

        _os_log_impl(&dword_21885E000, v41, v42, a10, v43, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v44, -1, -1);
        MEMORY[0x219A1C06C](v43, -1, -1);

      }
      else
      {

      }
      v37 = 0;
    }
    if (v87)
    {
      if (v87 != -25299)
      {
        if (qword_254FFC850 != -1)
          swift_once();
        v65 = sub_2188A5C9C();
        __swift_project_value_buffer(v65, (uint64_t)qword_254FFEE30);
        v66 = sub_2188A5C84();
        v67 = sub_2188A5E58();
        v68 = v67;
        if (os_log_type_enabled(v66, v67))
        {
          v69 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v69 = 67109120;
          swift_beginAccess();
          LODWORD(v90) = v87;
          sub_2188A5EC4();
          _os_log_impl(&dword_21885E000, v66, (os_log_type_t)v68, a7, v69, 8u);
          MEMORY[0x219A1C06C](v69, -1, -1);
        }

        swift_beginAccess();
        goto LABEL_36;
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v47 = sub_2188A5C9C();
      __swift_project_value_buffer(v47, (uint64_t)qword_254FFEE30);
      v48 = sub_2188A5C84();
      v49 = sub_2188A5E40();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = v36;
        v51 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v51 = 67109120;
        swift_beginAccess();
        LODWORD(v90) = v87;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v48, v49, a4, v51, 8u);
        v52 = v51;
        v36 = v50;
        MEMORY[0x219A1C06C](v52, -1, -1);
      }

      a5(v36, v35, &v87, &v88, v94);
      if (v37)
      {
        v53 = v37;
        v54 = v37;
        v55 = sub_2188A5C84();
        v56 = sub_2188A5E4C();
        if (os_log_type_enabled(v55, v56))
        {
          v57 = (uint8_t *)swift_slowAlloc();
          v58 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v57 = 138412290;
          v59 = v37;
          v60 = _swift_stdlib_bridgeErrorToNSError();
          *(_QWORD *)&v90 = v60;
          sub_2188A5EC4();
          *v58 = v60;

          _os_log_impl(&dword_21885E000, v55, v56, a10, v57, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v58, -1, -1);
          MEMORY[0x219A1C06C](v57, -1, -1);

        }
        else
        {

        }
      }
      swift_beginAccess();
      if (v87)
      {
        v70 = sub_2188A5C84();
        v71 = sub_2188A5E58();
        v68 = v71;
        if (os_log_type_enabled(v70, v71))
        {
          v72 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v72 = 67109120;
          LODWORD(v92) = v87;
          sub_2188A5EC4();
          _os_log_impl(&dword_21885E000, v70, (os_log_type_t)v68, a6, v72, 8u);
          MEMORY[0x219A1C06C](v72, -1, -1);
        }

LABEL_36:
        v73 = v87;
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v74 = v73;
        *(_QWORD *)(v74 + 8) = 0;
        *(_BYTE *)(v74 + 16) = 0;
        goto LABEL_45;
      }
    }
    else
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v61 = sub_2188A5C9C();
      __swift_project_value_buffer(v61, (uint64_t)qword_254FFEE30);
      v62 = sub_2188A5C84();
      v63 = sub_2188A5E40();
      if (os_log_type_enabled(v62, v63))
      {
        v64 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v64 = 67109120;
        swift_beginAccess();
        LODWORD(v89[0]) = v87;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v62, v63, a4, v64, 8u);
        MEMORY[0x219A1C06C](v64, -1, -1);
      }

    }
    if (v94[0])
    {
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v75 = v92;
        v76 = v93;
        a8(0);
        v68 = swift_allocObject();
        *(_QWORD *)(v68 + 16) = v75;
        *(_QWORD *)(v68 + 24) = v76;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v68;
      }
    }
    if (qword_254FFC850 != -1)
      swift_once();
    v77 = sub_2188A5C9C();
    __swift_project_value_buffer(v77, (uint64_t)qword_254FFEE30);
    v78 = sub_2188A5C84();
    v79 = sub_2188A5E58();
    v68 = v79;
    if (os_log_type_enabled(v78, v79))
    {
      v80 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v80 = 0;
      _os_log_impl(&dword_21885E000, v78, (os_log_type_t)v68, a9, v80, 2u);
      MEMORY[0x219A1C06C](v80, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v81 = 0;
    *(_QWORD *)(v81 + 8) = 0;
    *(_BYTE *)(v81 + 16) = 9;
LABEL_45:
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return v68;
  }
  v29 = v28;
  result = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    v31 = sub_2188A5D20();
    v33 = v32;
    v91 = v25;
    LOBYTE(v90) = 1;
    sub_21887A73C(&v90, v89);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v92 = v29;
    sub_218898008(v89, v31, v33, isUniquelyReferenced_nonNull_native);
    v88 = v92;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_21888E040(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  uint64_t inited;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;
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
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  CFTypeID v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  unsigned int v49;
  unint64_t v50;
  _OWORD v51[2];
  __int128 v52;
  uint64_t v53;
  _QWORD v54[19];

  v3 = v1;
  v54[17] = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A8630;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v6;
  v8 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(inited + 72) = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 48) = v8;
  *(_QWORD *)(inited + 56) = v7;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v9;
  v10 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 96) = 1;
  sub_21887A110(v8, v7);
  v11 = sub_218875DE8(inited);
  v50 = v11;
  if (v3[2] != 1)
  {
LABEL_4:
    v54[0] = 0;
    v49 = 0;
    sub_21889BD58(v3[3], v3[4], &v49, (uint64_t)&v50, (uint64_t)v54);
    if (v2)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v18 = sub_2188A5C9C();
      __swift_project_value_buffer(v18, (uint64_t)qword_254FFEE30);
      v19 = v2;
      v20 = v2;
      v21 = sub_2188A5C84();
      v22 = sub_2188A5E4C();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v24 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v23 = 138412290;
        v25 = v2;
        v26 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v52 = v26;
        sub_2188A5EC4();
        *v24 = v26;

        _os_log_impl(&dword_21885E000, v21, v22, "copyKeyFromKeychain: Failed to apply persona: %@", v23, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v24, -1, -1);
        MEMORY[0x219A1C06C](v23, -1, -1);

      }
      else
      {

      }
    }
    if (v49)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v27 = sub_2188A5C9C();
      __swift_project_value_buffer(v27, (uint64_t)qword_254FFEE30);
      v28 = sub_2188A5C84();
      v29 = sub_2188A5E58();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v30 = 67109120;
        swift_beginAccess();
        LODWORD(v52) = v49;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v28, v29, "copyKeyFromKeychain: status %d", v30, 8u);
        MEMORY[0x219A1C06C](v30, -1, -1);
      }

      swift_beginAccess();
      v31 = v49;
      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v32 = v31;
      *(_QWORD *)(v32 + 8) = 0;
      *(_BYTE *)(v32 + 16) = 0;
    }
    else
    {
      if (v54[0])
      {
        v33 = (const void *)swift_unknownObjectRetain();
        v34 = CFGetTypeID(v33);
        if (v34 == SecKeyGetTypeID())
        {
          if (qword_254FFC850 != -1)
            swift_once();
          v35 = sub_2188A5C9C();
          __swift_project_value_buffer(v35, (uint64_t)qword_254FFEE30);
          v36 = sub_2188A5C84();
          v37 = sub_2188A5E40();
          if (os_log_type_enabled(v36, v37))
          {
            v38 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v38 = 0;
            _os_log_impl(&dword_21885E000, v36, v37, "copyKeyFromKeychain: succeeded", v38, 2u);
            MEMORY[0x219A1C06C](v38, -1, -1);
          }

          type metadata accessor for SecKey(0);
          v31 = swift_dynamicCastUnknownClassUnconditional();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          return v31;
        }
        if (qword_254FFC850 != -1)
          swift_once();
        v44 = sub_2188A5C9C();
        __swift_project_value_buffer(v44, (uint64_t)qword_254FFEE30);
        v45 = sub_2188A5C84();
        v46 = sub_2188A5E58();
        v31 = v46;
        if (os_log_type_enabled(v45, v46))
        {
          v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_21885E000, v45, (os_log_type_t)v31, "copyKeyFromKeychain: returned wrong type", v47, 2u);
          MEMORY[0x219A1C06C](v47, -1, -1);
        }

        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v48 = 0;
        *(_QWORD *)(v48 + 8) = 0;
        *(_BYTE *)(v48 + 16) = 9;
        swift_willThrow();
        swift_unknownObjectRelease();
LABEL_17:
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v31;
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v39 = sub_2188A5C9C();
      __swift_project_value_buffer(v39, (uint64_t)qword_254FFEE30);
      v40 = sub_2188A5C84();
      v41 = sub_2188A5E58();
      v31 = v41;
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_21885E000, v40, (os_log_type_t)v31, "copyKeyFromKeychain: returned nil", v42, 2u);
        MEMORY[0x219A1C06C](v42, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v43 = 0;
      *(_QWORD *)(v43 + 8) = 0;
      *(_BYTE *)(v43 + 16) = 9;
    }
    swift_willThrow();
    goto LABEL_17;
  }
  v12 = v11;
  result = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    v14 = sub_2188A5D20();
    v16 = v15;
    v53 = v10;
    LOBYTE(v52) = 1;
    sub_21887A73C(&v52, v51);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v54[0] = v12;
    sub_218898008(v51, v14, v16, isUniquelyReferenced_nonNull_native);
    v50 = v54[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

void sub_21888E790(uint64_t a1)
{
  sub_21888E850(a1, (uint64_t (*)(uint64_t, id *))MEMORY[0x24BDE8A48], "addIdentityToKeychain: SecIdentityCopyCertificate status %d", "addIdentityToKeychain: SecIdentityCopyCertificate did not return result");
}

void sub_21888E7F0(uint64_t a1)
{
  sub_21888E850(a1, (uint64_t (*)(uint64_t, id *))MEMORY[0x24BDE8A50], "addIdentityToKeychain: SecIdentityCopyPrivateKey status %d", "addIdentityToKeychain: SecIdentityCopyPrivateKey did not return result");
}

void sub_21888E850(uint64_t a1, uint64_t (*a2)(uint64_t, id *), const char *a3, const char *a4)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  id v21[2];

  v21[1] = *(id *)MEMORY[0x24BDAC8D0];
  v21[0] = 0;
  v6 = a2(a1, v21);
  if (v6)
  {
    v7 = v6;
    if (qword_254FFC850 != -1)
      swift_once();
    v8 = sub_2188A5C9C();
    __swift_project_value_buffer(v8, (uint64_t)qword_254FFEE30);
    v9 = sub_2188A5C84();
    v10 = sub_2188A5E58();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v11 = 67109120;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v9, v10, a3, v11, 8u);
      MEMORY[0x219A1C06C](v11, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v12 = v7;
    *(_QWORD *)(v12 + 8) = 0;
    *(_BYTE *)(v12 + 16) = 0;
LABEL_7:
    swift_willThrow();

    return;
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v13 = sub_2188A5C9C();
  __swift_project_value_buffer(v13, (uint64_t)qword_254FFEE30);
  v14 = sub_2188A5C84();
  v15 = sub_2188A5E40();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v16 = 67109120;
    sub_2188A5EC4();
    _os_log_impl(&dword_21885E000, v14, v15, a3, v16, 8u);
    MEMORY[0x219A1C06C](v16, -1, -1);
  }

  if (!v21[0])
  {
    v17 = sub_2188A5C84();
    v18 = sub_2188A5E58();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21885E000, v17, v18, a4, v19, 2u);
      MEMORY[0x219A1C06C](v19, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v20 = 0;
    *(_QWORD *)(v20 + 8) = 0;
    *(_BYTE *)(v20 + 16) = 9;
    goto LABEL_7;
  }
}

uint64_t sub_21888EB54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1;
  v3 = sub_21888CDC0(*(_QWORD *)(a1 + 16));
  if (!v1)
  {
    v4 = (void *)v3;
    v6 = (void *)sub_21888E040(*(_QWORD *)(v2 + 24));
    v7 = SecIdentityCreate();
    if (v7)
    {
      v2 = v7;
    }
    else
    {
      sub_21887B0BC();
      swift_allocError();
      *(_OWORD *)v8 = xmmword_2188A86A0;
      *(_BYTE *)(v8 + 16) = 9;
      swift_willThrow();
    }

  }
  return v2;
}

uint64_t sub_21888EC24(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t inited;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  unint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  id v56;
  unint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint8_t *v65;
  uint8_t *v66;
  id v67;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint64_t v89;
  _QWORD v90[2];
  _QWORD *v91;
  uint64_t v92;
  unint64_t v93;
  _QWORD *v94;
  CFTypeRef v95;
  unsigned int v96;
  unint64_t v97;
  _OWORD v98[2];
  __int128 v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  CFTypeRef v103[55];

  v91 = a6;
  v94 = a4;
  v103[53] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  v9 = sub_2188A5D68();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2188A5D50();
  v92 = sub_2188A5D2C();
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v93 = v14;
  if (v14 >> 60 == 15)
    __break(1u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A9240;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v16;
  v17 = sub_2188A5D20();
  v18 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v17;
  *(_QWORD *)(inited + 56) = v19;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v20;
  *(_QWORD *)(inited + 120) = v18;
  v21 = v94;
  *(_QWORD *)(inited + 96) = a3;
  *(_QWORD *)(inited + 104) = v21;
  *(_QWORD *)(inited + 128) = sub_2188A5D20();
  *(_QWORD *)(inited + 136) = v22;
  *(_QWORD *)(inited + 168) = v18;
  v23 = v91;
  *(_QWORD *)(inited + 144) = a5;
  *(_QWORD *)(inited + 152) = v23;
  *(_QWORD *)(inited + 176) = sub_2188A5D20();
  *(_QWORD *)(inited + 184) = v24;
  v25 = v6[5];
  v26 = v6[6];
  *(_QWORD *)(inited + 216) = v18;
  *(_QWORD *)(inited + 192) = v25;
  *(_QWORD *)(inited + 200) = v26;
  *(_QWORD *)(inited + 224) = sub_2188A5D20();
  *(_QWORD *)(inited + 232) = v27;
  v28 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 264) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 240) = 1;
  *(_QWORD *)(inited + 272) = sub_2188A5D20();
  *(_QWORD *)(inited + 280) = v29;
  v30 = (void *)*MEMORY[0x24BDE8F70];
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 312) = v31;
  *(_QWORD *)(inited + 288) = v30;
  *(_QWORD *)(inited + 320) = sub_2188A5D20();
  *(_QWORD *)(inited + 328) = v32;
  *(_QWORD *)(inited + 360) = v28;
  *(_BYTE *)(inited + 336) = 1;
  *(_QWORD *)(inited + 368) = sub_2188A5D20();
  *(_QWORD *)(inited + 376) = v33;
  *(_QWORD *)(inited + 408) = MEMORY[0x24BDCDDE8];
  v35 = v92;
  v34 = v93;
  *(_QWORD *)(inited + 384) = v92;
  *(_QWORD *)(inited + 392) = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v36 = v30;
  sub_21887A0FC(v35, v34);
  v37 = sub_218875DE8(inited);
  v97 = v37;
  v38 = v6;
  if (v6[2] != 1)
  {
LABEL_5:
    v103[0] = 0;
    v96 = 0;
    v45 = v38;
    v46 = v38[3];
    v47 = v45[4];
    v48 = (void *)v90[1];
    sub_21889BDA8(v46, v47, &v96, (uint64_t)&v97, (uint64_t)v103);
    v49 = v48;
    if (v48)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v50 = sub_2188A5C9C();
      __swift_project_value_buffer(v50, (uint64_t)qword_254FFEE30);
      v51 = v48;
      v52 = v48;
      v53 = sub_2188A5C84();
      v54 = sub_2188A5E4C();
      if (os_log_type_enabled(v53, v54))
      {
        v55 = (uint8_t *)swift_slowAlloc();
        v91 = (_QWORD *)swift_slowAlloc();
        v94 = (_QWORD *)v46;
        *(_DWORD *)v55 = 138412290;
        v56 = v48;
        v57 = v47;
        v58 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v99 = v58;
        v46 = (uint64_t)v94;
        sub_2188A5EC4();
        v59 = v91;
        *v91 = v58;
        v47 = v57;

        _os_log_impl(&dword_21885E000, v53, v54, "addPasswordToKeychain: Failed to apply persona: %@", v55, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
        v60 = v59;
        v34 = v93;
        swift_arrayDestroy();
        v35 = v92;
        MEMORY[0x219A1C06C](v60, -1, -1);
        MEMORY[0x219A1C06C](v55, -1, -1);

      }
      else
      {

      }
      v49 = 0;
    }
    if (v96)
    {
      if (v96 != -25299)
      {
        if (qword_254FFC850 != -1)
          swift_once();
        v77 = sub_2188A5C9C();
        __swift_project_value_buffer(v77, (uint64_t)qword_254FFEE30);
        v78 = sub_2188A5C84();
        v79 = sub_2188A5E58();
        if (os_log_type_enabled(v78, v79))
        {
          v46 = swift_slowAlloc();
          *(_DWORD *)v46 = 67109120;
          swift_beginAccess();
          LODWORD(v99) = v96;
          sub_2188A5EC4();
          _os_log_impl(&dword_21885E000, v78, v79, "addPasswordToKeychain: status %d", (uint8_t *)v46, 8u);
          MEMORY[0x219A1C06C](v46, -1, -1);
        }

        swift_beginAccess();
        goto LABEL_37;
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v61 = sub_2188A5C9C();
      v91 = (_QWORD *)__swift_project_value_buffer(v61, (uint64_t)qword_254FFEE30);
      v62 = sub_2188A5C84();
      v63 = sub_2188A5E40();
      if (os_log_type_enabled(v62, v63))
      {
        v64 = (uint8_t *)swift_slowAlloc();
        v94 = (_QWORD *)v46;
        v65 = v64;
        *(_DWORD *)v64 = 67109120;
        swift_beginAccess();
        LODWORD(v99) = v96;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v62, v63, "addPasswordToKeychain: SecItemAdd status %d", v65, 8u);
        v66 = v65;
        v46 = (uint64_t)v94;
        MEMORY[0x219A1C06C](v66, -1, -1);
      }

      sub_21889BDF8(v46, v47, (OSStatus *)&v96, (uint64_t)&v97, v103);
      if (v49)
      {
        v67 = v49;
        v68 = v49;
        v69 = sub_2188A5C84();
        v70 = sub_2188A5E4C();
        if (os_log_type_enabled(v69, v70))
        {
          v71 = (uint8_t *)swift_slowAlloc();
          v94 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v71 = 138412290;
          v72 = v49;
          v73 = _swift_stdlib_bridgeErrorToNSError();
          *(_QWORD *)&v99 = v73;
          v35 = v92;
          sub_2188A5EC4();
          v46 = (uint64_t)v94;
          *v94 = v73;

          _os_log_impl(&dword_21885E000, v69, v70, "addPasswordToKeychain: Failed to apply persona: %@", v71, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v46, -1, -1);
          MEMORY[0x219A1C06C](v71, -1, -1);

        }
        else
        {

        }
      }
      swift_beginAccess();
      v34 = v93;
      if (v96)
      {
        v80 = sub_2188A5C84();
        v81 = sub_2188A5E58();
        if (os_log_type_enabled(v80, v81))
        {
          v46 = swift_slowAlloc();
          *(_DWORD *)v46 = 67109120;
          LODWORD(v101) = v96;
          sub_2188A5EC4();
          _os_log_impl(&dword_21885E000, v80, v81, "addPasswordToKeychain: SecItemCopyMatching status %d", (uint8_t *)v46, 8u);
          MEMORY[0x219A1C06C](v46, -1, -1);
        }

LABEL_37:
        v82 = v96;
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v83 = v82;
        *(_QWORD *)(v83 + 8) = 0;
        *(_BYTE *)(v83 + 16) = 0;
        goto LABEL_46;
      }
    }
    else
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v74 = sub_2188A5C9C();
      __swift_project_value_buffer(v74, (uint64_t)qword_254FFEE30);
      v75 = sub_2188A5C84();
      v76 = sub_2188A5E40();
      if (os_log_type_enabled(v75, v76))
      {
        v46 = swift_slowAlloc();
        *(_DWORD *)v46 = 67109120;
        swift_beginAccess();
        LODWORD(v98[0]) = v96;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v75, v76, "addPasswordToKeychain: SecItemAdd status %d", (uint8_t *)v46, 8u);
        MEMORY[0x219A1C06C](v46, -1, -1);
      }

    }
    if (v103[0])
    {
      v95 = v103[0];
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_21887A154(v35, v34);
        v84 = v101;
        v85 = v102;
        type metadata accessor for MKPrimaryKeyPassword();
        v46 = swift_allocObject();
        *(_QWORD *)(v46 + 16) = v84;
        *(_QWORD *)(v46 + 24) = v85;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v46;
      }
    }
    if (qword_254FFC850 != -1)
      swift_once();
    v86 = sub_2188A5C9C();
    __swift_project_value_buffer(v86, (uint64_t)qword_254FFEE30);
    v87 = sub_2188A5C84();
    v88 = sub_2188A5E58();
    if (os_log_type_enabled(v87, v88))
    {
      v46 = swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_21885E000, v87, v88, "addPasswordToKeychain: SecItemAdd/SecItemCopyMatching did not return result", (uint8_t *)v46, 2u);
      MEMORY[0x219A1C06C](v46, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v89 = 0;
    *(_QWORD *)(v89 + 8) = 0;
    *(_BYTE *)(v89 + 16) = 9;
LABEL_46:
    swift_willThrow();
    sub_21887A154(v35, v34);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return v46;
  }
  v39 = v37;
  result = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    v41 = sub_2188A5D20();
    v43 = v42;
    v100 = MEMORY[0x24BEE1328];
    LOBYTE(v99) = 1;
    sub_21887A73C(&v99, v98);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v101 = v39;
    v97 = 0x8000000000000000;
    sub_218898008(v98, v41, v43, isUniquelyReferenced_nonNull_native);
    v97 = v101;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_21888F84C(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  CFTypeID v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint8_t *v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  NSObject *v69;
  unint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  unsigned int v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[25];

  v3 = v1;
  v81[23] = *MEMORY[0x24BDAC8D0];
  v5 = sub_2188A5D68();
  MEMORY[0x24BDAC7A8](v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A9220;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v7;
  v9 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(inited + 72) = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v10;
  v11 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 96) = 1;
  *(_QWORD *)(inited + 128) = sub_2188A5D20();
  *(_QWORD *)(inited + 136) = v12;
  *(_QWORD *)(inited + 168) = v11;
  *(_BYTE *)(inited + 144) = 1;
  sub_21887A110(v9, v8);
  v13 = sub_218875DE8(inited);
  v74 = v13;
  if (v3[2] == 1)
  {
    v14 = v13;
    result = *MEMORY[0x24BDE9538];
    if (!*MEMORY[0x24BDE9538])
    {
      __break(1u);
      goto LABEL_59;
    }
    inited = sub_2188A5D20();
    v17 = v16;
    *((_QWORD *)&v80 + 1) = v11;
    LOBYTE(v79) = 1;
    sub_21887A73C(&v79, &v77);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v75 = v14;
    sub_218898008(&v77, inited, v17, isUniquelyReferenced_nonNull_native);
    v74 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v81[0] = 0;
  v73 = 0;
  sub_21889BD58(v3[3], v3[4], &v73, (uint64_t)&v74, (uint64_t)v81);
  v19 = 0x254FFC000uLL;
  if (v2)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v20 = sub_2188A5C9C();
    __swift_project_value_buffer(v20, (uint64_t)qword_254FFEE30);
    v21 = v2;
    v22 = v2;
    v23 = sub_2188A5C84();
    v24 = sub_2188A5E4C();
    inited = v24;
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v71 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v25 = 138412290;
      v26 = v2;
      v27 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v79 = v27;
      sub_2188A5EC4();
      *v71 = v27;
      v19 = 0x254FFC000;

      _os_log_impl(&dword_21885E000, v23, (os_log_type_t)inited, "copyPasswordFromKeychain: Failed to apply persona: %@", v25, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v71, -1, -1);
      MEMORY[0x219A1C06C](v25, -1, -1);

    }
    else
    {

    }
  }
  if (v73)
  {
    if (*(_QWORD *)(v19 + 2128) != -1)
      swift_once();
    v28 = sub_2188A5C9C();
    __swift_project_value_buffer(v28, (uint64_t)qword_254FFEE30);
    v29 = sub_2188A5C84();
    v30 = sub_2188A5E58();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v31 = 67109120;
      inited = (uint64_t)(v31 + 4);
      swift_beginAccess();
      LODWORD(v79) = v73;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v29, v30, "copyPasswordFromKeychain: status %d", v31, 8u);
      MEMORY[0x219A1C06C](v31, -1, -1);
    }

    swift_beginAccess();
    v32 = v73;
    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v33 = v32;
    *(_QWORD *)(v33 + 8) = 0;
    *(_BYTE *)(v33 + 16) = 0;
LABEL_16:
    swift_willThrow();
LABEL_17:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return inited;
  }
  v34 = v81[0];
  if (!v81[0])
  {
    if (*(_QWORD *)(v19 + 2128) != -1)
      swift_once();
    v42 = sub_2188A5C9C();
    __swift_project_value_buffer(v42, (uint64_t)qword_254FFEE30);
    v43 = sub_2188A5C84();
    v44 = sub_2188A5E58();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_21885E000, v43, v44, "copyPasswordFromKeychain: returned nil", v45, 2u);
      MEMORY[0x219A1C06C](v45, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v46 = 0;
    *(_QWORD *)(v46 + 8) = 0;
    *(_BYTE *)(v46 + 16) = 9;
    goto LABEL_16;
  }
  v35 = (const void *)swift_unknownObjectRetain();
  v36 = CFGetTypeID(v35);
  if (v36 != CFDictionaryGetTypeID())
  {
    if (*(_QWORD *)(v19 + 2128) != -1)
      swift_once();
    v47 = sub_2188A5C9C();
    __swift_project_value_buffer(v47, (uint64_t)qword_254FFEE30);
    v48 = sub_2188A5C84();
    v49 = sub_2188A5E58();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_21885E000, v48, v49, "copyPasswordFromKeychain: returned wrong type", v50, 2u);
      MEMORY[0x219A1C06C](v50, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v51 = 0;
    *(_QWORD *)(v51 + 8) = 0;
    *(_BYTE *)(v51 + 16) = 9;
    swift_willThrow();
LABEL_55:
    swift_unknownObjectRelease();
    goto LABEL_17;
  }
  *(_QWORD *)&v79 = v34;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCE0);
  swift_dynamicCast();
  v37 = v77;
  v38 = sub_2188A5D20();
  if (*(_QWORD *)(v37 + 16) && (v40 = sub_2188767BC(v38, v39), (v41 & 1) != 0))
  {
    sub_21887A700(*(_QWORD *)(v37 + 56) + 32 * v40, (uint64_t)&v79);
  }
  else
  {
    v79 = 0u;
    v80 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v80 + 1))
  {
    sub_218890298((uint64_t)&v79);
    goto LABEL_39;
  }
  if (!swift_dynamicCast())
  {
LABEL_39:
    inited = 0;
    goto LABEL_40;
  }
  inited = v77;
LABEL_40:
  v52 = sub_2188A5D20();
  if (*(_QWORD *)(v37 + 16) && (v54 = sub_2188767BC(v52, v53), (v55 & 1) != 0))
  {
    sub_21887A700(*(_QWORD *)(v37 + 56) + 32 * v54, (uint64_t)&v77);
  }
  else
  {
    v77 = 0u;
    v78 = 0u;
  }
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (*((_QWORD *)&v78 + 1))
  {
    sub_21887A73C(&v77, &v79);
    swift_dynamicCast();
    v57 = v75;
    v56 = v76;
    sub_2188A5D50();
    v72 = v57;
    sub_2188A5D38();
    if (v58)
    {
      v70 = v56;
      if (qword_254FFC850 != -1)
        swift_once();
      v59 = sub_2188A5C9C();
      __swift_project_value_buffer(v59, (uint64_t)qword_254FFEE30);
      v60 = sub_2188A5C84();
      v61 = sub_2188A5E40();
      if (os_log_type_enabled(v60, v61))
      {
        v69 = v60;
        v62 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_21885E000, v69, v61, "copyPasswordFromKeychain: succeeded", v62, 2u);
        v63 = v62;
        v60 = v69;
        MEMORY[0x219A1C06C](v63, -1, -1);
        sub_21887A168(v57, v70);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
        sub_21887A168(v57, v70);
      }

      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return inited;
    }
    inited = v56;
    swift_bridgeObjectRelease();
    if (qword_254FFC850 != -1)
      swift_once();
    v64 = sub_2188A5C9C();
    __swift_project_value_buffer(v64, (uint64_t)qword_254FFEE30);
    v65 = sub_2188A5C84();
    v66 = sub_2188A5E58();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v67 = 0;
      _os_log_impl(&dword_21885E000, v65, v66, "copyPasswordFromKeychain: couldn't convert to string", v67, 2u);
      MEMORY[0x219A1C06C](v67, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v68 = 0;
    *(_QWORD *)(v68 + 8) = 0;
    *(_BYTE *)(v68 + 16) = 9;
    swift_willThrow();
    sub_21887A168(v72, inited);
    goto LABEL_55;
  }
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_218890298(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2188902D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  char v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v5 = v3;
  swift_beginAccess();
  if (!*(_QWORD *)(v3[7] + 16))
  {
LABEL_4:
    swift_beginAccess();
    if (*(_QWORD *)(v3[9] + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2188767BC(a2, a3);
      if ((v10 & 1) != 0)
        goto LABEL_6;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    sub_21888E790(a1);
    if (v4)
      return;
    v17 = v16;
    sub_21888E7F0(a1);
    v19 = v18;
    v37 = sub_21888CD2C(v17);
    v20 = sub_21888D510(v19);

    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v39 = v5[7];
    v5[7] = 0x8000000000000000;
    v22 = v20;
    sub_218898194(v37, a2, a3, isUniquelyReferenced_nonNull_native);
    v5[7] = v39;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    v23 = swift_isUniquelyReferenced_nonNull_native();
    v40 = v5[9];
    v5[9] = 0x8000000000000000;
    sub_218898180(v20, a2, a3, v23);
    v5[9] = v40;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_beginAccess();
    v24 = v5[8];
    if (*(_QWORD *)(v24 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v25 = sub_2188768A0(v37);
      if ((v26 & 1) != 0)
        v27 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v25);
      else
        v27 = 0;
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      v27 = 0;
    }
    v28 = __CFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
    {
      __break(1u);
    }
    else
    {
      swift_beginAccess();
      swift_retain();
      v30 = swift_isUniquelyReferenced_nonNull_native();
      v38 = v5[8];
      v5[8] = 0x8000000000000000;
      sub_21889815C(v29, v37, v30);
      v5[8] = v38;
      swift_release();
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_beginAccess();
      v31 = v5[10];
      if (*(_QWORD *)(v31 + 16))
      {
        swift_retain();
        swift_bridgeObjectRetain();
        v32 = sub_2188768A0(v22);
        if ((v33 & 1) != 0)
          v34 = *(_QWORD *)(*(_QWORD *)(v31 + 56) + 8 * v32);
        else
          v34 = 0;
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        v34 = 0;
      }
      v28 = __CFADD__(v34, 1);
      v35 = v34 + 1;
      if (!v28)
      {
        swift_beginAccess();
        swift_retain();
        v36 = swift_isUniquelyReferenced_nonNull_native();
        v41 = v5[10];
        v5[10] = 0x8000000000000000;
        sub_218898138(v35, v22, v36);
        v5[10] = v41;
        swift_release();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_218881BE8();
        swift_release();
        swift_release();
        return;
      }
    }
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2188767BC(a2, a3);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
LABEL_6:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_254FFC850 != -1)
    swift_once();
  v11 = sub_2188A5C9C();
  __swift_project_value_buffer(v11, (uint64_t)qword_254FFEE30);
  v12 = sub_2188A5C84();
  v13 = sub_2188A5E4C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21885E000, v12, v13, "add: assetKey already exists", v14, 2u);
    MEMORY[0x219A1C06C](v14, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v15 = xmmword_2188A9260;
  *(_BYTE *)(v15 + 16) = 9;
  swift_willThrow();
}

uint64_t sub_21889082C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  v5 = v3;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v3 + 56) + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_2188767BC(a2, a3),
        v10 = v9,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v10 & 1) != 0))
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v11 = sub_2188A5C9C();
    __swift_project_value_buffer(v11, (uint64_t)qword_254FFEE30);
    v12 = sub_2188A5C84();
    v13 = sub_2188A5E4C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21885E000, v12, v13, "add: assetKey already exists", v14, 2u);
      MEMORY[0x219A1C06C](v14, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v15 = xmmword_2188A9260;
    *(_BYTE *)(v15 + 16) = 9;
    return swift_willThrow();
  }
  else
  {
    result = sub_21888CD2C(a1);
    if (!v4)
    {
      v17 = result;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v27 = *(_QWORD *)(v3 + 56);
      *(_QWORD *)(v3 + 56) = 0x8000000000000000;
      sub_218898194(v17, a2, a3, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(v3 + 56) = v27;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      result = swift_beginAccess();
      v19 = *(_QWORD *)(v3 + 64);
      if (*(_QWORD *)(v19 + 16))
      {
        swift_retain();
        swift_bridgeObjectRetain();
        v20 = sub_2188768A0(v17);
        if ((v21 & 1) != 0)
          v22 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v20);
        else
          v22 = 0;
        swift_release();
        result = swift_bridgeObjectRelease();
      }
      else
      {
        v22 = 0;
      }
      v23 = __CFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
      }
      else
      {
        swift_beginAccess();
        swift_retain();
        v25 = swift_isUniquelyReferenced_nonNull_native();
        v26 = *(_QWORD *)(v5 + 64);
        *(_QWORD *)(v5 + 64) = 0x8000000000000000;
        sub_21889815C(v24, v17, v25);
        *(_QWORD *)(v5 + 64) = v26;
        swift_release();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_218881BE8();
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t sub_218890B44(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v7;
  char v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;

  v7 = v6;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v6 + 88) + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_2188767BC(a5, (uint64_t)a6),
        v14 = v13,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v14 & 1) != 0))
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v15 = sub_2188A5C9C();
    __swift_project_value_buffer(v15, (uint64_t)qword_254FFEE30);
    v16 = sub_2188A5C84();
    v17 = sub_2188A5E4C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21885E000, v16, v17, "add: assetKey already exists", v18, 2u);
      MEMORY[0x219A1C06C](v18, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v19 = xmmword_2188A9260;
    *(_BYTE *)(v19 + 16) = 9;
    return swift_willThrow();
  }
  else
  {
    result = sub_21888EC24(a1, a2, a3, a4, a5, a6);
    if (!v30)
    {
      v21 = result;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v32 = *(_QWORD *)(v6 + 88);
      *(_QWORD *)(v6 + 88) = 0x8000000000000000;
      sub_21889833C(v21, a5, (uint64_t)a6, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(v6 + 88) = v32;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      result = swift_beginAccess();
      v23 = *(_QWORD *)(v6 + 96);
      if (*(_QWORD *)(v23 + 16))
      {
        swift_retain();
        swift_bridgeObjectRetain();
        v24 = sub_2188768A0(v21);
        if ((v25 & 1) != 0)
          v26 = *(_QWORD *)(*(_QWORD *)(v23 + 56) + 8 * v24);
        else
          v26 = 0;
        swift_release();
        result = swift_bridgeObjectRelease();
      }
      else
      {
        v26 = 0;
      }
      v27 = __CFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
      {
        __break(1u);
      }
      else
      {
        swift_beginAccess();
        swift_retain();
        v29 = swift_isUniquelyReferenced_nonNull_native();
        v33 = *(_QWORD *)(v7 + 96);
        *(_QWORD *)(v7 + 96) = 0x8000000000000000;
        sub_2188981A8(v28, v21, v29);
        *(_QWORD *)(v7 + 96) = v33;
        swift_release();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_218881BE8();
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t sub_218890E7C(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  char v5;
  char v6;
  char v7;
  char v8;
  char v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  swift_beginAccess();
  if (*(_QWORD *)(v2[7] + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_2188767BC(a1, a2),
        v6 = v5,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v6 & 1) != 0))
  {
    swift_beginAccess();
    if (*(_QWORD *)(v2[9] + 16)
      && (swift_bridgeObjectRetain(),
          swift_bridgeObjectRetain(),
          sub_2188767BC(a1, a2),
          v8 = v7,
          swift_bridgeObjectRelease(),
          swift_bridgeObjectRelease(),
          (v8 & 1) != 0))
    {
      return sub_218892B98(a1, a2);
    }
    else
    {
      return sub_2188926C4(a1, a2);
    }
  }
  else
  {
    swift_beginAccess();
    if (*(_QWORD *)(v2[11] + 16)
      && (swift_bridgeObjectRetain(),
          swift_bridgeObjectRetain(),
          sub_2188767BC(a1, a2),
          v11 = v10,
          swift_bridgeObjectRelease(),
          swift_bridgeObjectRelease(),
          (v11 & 1) != 0))
    {
      return sub_21889334C(a1, a2);
    }
    else
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v12 = sub_2188A5C9C();
      __swift_project_value_buffer(v12, (uint64_t)qword_254FFEE30);
      swift_bridgeObjectRetain_n();
      v13 = sub_2188A5C84();
      v14 = sub_2188A5E58();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        v16 = swift_slowAlloc();
        v18 = v16;
        *(_DWORD *)v15 = 136315138;
        swift_bridgeObjectRetain();
        sub_2188A17DC(a1, a2, &v18);
        sub_2188A5EC4();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21885E000, v13, v14, "delete: No assets found for assetKey %s", v15, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v16, -1, -1);
        MEMORY[0x219A1C06C](v15, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_21887B0BC();
      swift_allocError();
      *(_OWORD *)v17 = xmmword_2188A9270;
      *(_BYTE *)(v17 + 16) = 9;
      return swift_willThrow();
    }
  }
}

uint64_t sub_2188911A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;

  v3 = v2;
  swift_beginAccess();
  v6 = *(_QWORD *)(v2 + 56);
  if (*(_QWORD *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = sub_2188767BC(a1, a2);
    if ((v8 & 1) != 0)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v10 = *(_QWORD *)(v3 + 72);
      if (*(_QWORD *)(v10 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v11 = sub_2188767BC(a1, a2);
        if ((v12 & 1) != 0)
        {
          v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
          swift_retain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          type metadata accessor for MKPrimaryKeyIdentity();
          inited = swift_initStackObject();
          *(_QWORD *)(inited + 16) = v9;
          *(_QWORD *)(inited + 24) = v13;
          swift_retain();
          swift_retain();
          v36 = (void *)sub_21888EB54(inited);
          swift_release();
          swift_release();

          if (qword_254FFC850 != -1)
            swift_once();
          v37 = sub_2188A5C9C();
          __swift_project_value_buffer(v37, (uint64_t)qword_254FFEE30);
          swift_bridgeObjectRetain_n();
          v38 = sub_2188A5C84();
          v39 = sub_2188A5E40();
          if (os_log_type_enabled(v38, v39))
          {
            v40 = (uint8_t *)swift_slowAlloc();
            v41 = swift_slowAlloc();
            v42 = v41;
            *(_DWORD *)v40 = 136315138;
            swift_bridgeObjectRetain();
            sub_2188A17DC(a1, a2, &v42);
            sub_2188A5EC4();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_21885E000, v38, v39, "hasAssetFor: Identity found for assetKey %s", v40, 0xCu);
            v24 = 1;
            swift_arrayDestroy();
            MEMORY[0x219A1C06C](v41, -1, -1);
            MEMORY[0x219A1C06C](v40, -1, -1);
            swift_release();
            swift_release();

            return v24;
          }

          swift_bridgeObjectRelease_n();
          swift_release();
LABEL_35:
          swift_release();
          return 1;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }

      if (qword_254FFC850 != -1)
        swift_once();
      v31 = sub_2188A5C9C();
      __swift_project_value_buffer(v31, (uint64_t)qword_254FFEE30);
      swift_bridgeObjectRetain_n();
      v32 = sub_2188A5C84();
      v33 = sub_2188A5E40();
      if (!os_log_type_enabled(v32, v33))
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_35;
      }
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v42 = v35;
      *(_DWORD *)v34 = 136315138;
      swift_bridgeObjectRetain();
      sub_2188A17DC(a1, a2, &v42);
      sub_2188A5EC4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21885E000, v32, v33, "hasAssetFor: Cert found for assetKey %s", v34, 0xCu);
      v24 = 1;
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v35, -1, -1);
      MEMORY[0x219A1C06C](v34, -1, -1);
      swift_release();

      return v24;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v15 = *(_QWORD *)(v3 + 88);
  if (*(_QWORD *)(v15 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = sub_2188767BC(a1, a2);
    if ((v17 & 1) != 0)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21888F84C(v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_254FFC850 != -1)
        swift_once();
      v26 = sub_2188A5C9C();
      __swift_project_value_buffer(v26, (uint64_t)qword_254FFEE30);
      swift_bridgeObjectRetain_n();
      v27 = sub_2188A5C84();
      v28 = sub_2188A5E40();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        v30 = swift_slowAlloc();
        v42 = v30;
        *(_DWORD *)v29 = 136315138;
        swift_bridgeObjectRetain();
        sub_2188A17DC(a1, a2, &v42);
        sub_2188A5EC4();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21885E000, v27, v28, "hasAssetFor: Password found for assetKey %s", v29, 0xCu);
        v24 = 1;
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v30, -1, -1);
        MEMORY[0x219A1C06C](v29, -1, -1);

        swift_release();
      }
      else
      {

        swift_release();
        swift_bridgeObjectRelease_n();
        return 1;
      }
      return v24;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v19 = sub_2188A5C9C();
  __swift_project_value_buffer(v19, (uint64_t)qword_254FFEE30);
  swift_bridgeObjectRetain_n();
  v20 = sub_2188A5C84();
  v21 = sub_2188A5E40();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v42 = v23;
    *(_DWORD *)v22 = 136315138;
    swift_bridgeObjectRetain();
    sub_2188A17DC(a1, a2, &v42);
    sub_2188A5EC4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21885E000, v20, v21, "hasAssetFor: No assets found for assetKey %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1C06C](v23, -1, -1);
    MEMORY[0x219A1C06C](v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_218891DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 56);
  if (*(_QWORD *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v6 = sub_2188767BC(a1, a2);
    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v8 + 16);
      sub_21887A110(v9, *(_QWORD *)(v8 + 24));
      swift_release();
      return v9;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v10 = sub_2188A5C9C();
  __swift_project_value_buffer(v10, (uint64_t)qword_254FFEE30);
  v11 = sub_2188A5C84();
  v12 = sub_2188A5E4C();
  v9 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21885E000, v11, (os_log_type_t)v9, "certPersistentRef: Not found", v13, 2u);
    MEMORY[0x219A1C06C](v13, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v14 = xmmword_2188A9270;
  *(_BYTE *)(v14 + 16) = 9;
  swift_willThrow();
  return v9;
}

uint64_t sub_218891FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 56);
  if (*(_QWORD *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v6 = sub_2188767BC(a1, a2);
    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v9 = sub_21888CDC0(v8);
      swift_release();
      return v9;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v10 = sub_2188A5C9C();
  __swift_project_value_buffer(v10, (uint64_t)qword_254FFEE30);
  v11 = sub_2188A5C84();
  v12 = sub_2188A5E4C();
  v9 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21885E000, v11, (os_log_type_t)v9, "copyCert: Not found", v13, 2u);
    MEMORY[0x219A1C06C](v13, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v14 = xmmword_2188A9270;
  *(_BYTE *)(v14 + 16) = 9;
  swift_willThrow();
  return v9;
}

uint8_t *sub_218892178(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint8_t *v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t inited;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;

  v4 = v3;
  v5 = v2;
  swift_beginAccess();
  v8 = *(_QWORD *)(v2 + 56);
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = sub_2188767BC(a1, a2);
  if ((v10 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_7:
    if (qword_254FFC850 != -1)
      swift_once();
    v17 = sub_2188A5C9C();
    __swift_project_value_buffer(v17, (uint64_t)qword_254FFEE30);
    v18 = sub_2188A5C84();
    v19 = sub_2188A5E4C();
    if (os_log_type_enabled(v18, v19))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21885E000, v18, v19, "copyIdentity: Not found", v4, 2u);
      MEMORY[0x219A1C06C](v4, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v20 = xmmword_2188A9270;
    *(_BYTE *)(v20 + 16) = 9;
    swift_willThrow();
    return v4;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v12 = *(_QWORD *)(v5 + 72);
  if (*(_QWORD *)(v12 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = sub_2188767BC(a1, a2);
    if ((v14 & 1) != 0)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v13);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for MKPrimaryKeyIdentity();
      inited = swift_initStackObject();
      *(_QWORD *)(inited + 16) = v11;
      *(_QWORD *)(inited + 24) = v15;
      swift_retain();
      swift_retain();
      v4 = (uint8_t *)sub_21888EB54(inited);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v21 = sub_2188A5C9C();
  __swift_project_value_buffer(v21, (uint64_t)qword_254FFEE30);
  v22 = sub_2188A5C84();
  v23 = sub_2188A5E4C();
  v4 = (uint8_t *)v23;
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_21885E000, v22, (os_log_type_t)v4, "copyIdentity: Not found", v24, 2u);
    MEMORY[0x219A1C06C](v24, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v25 = xmmword_2188A9270;
  *(_BYTE *)(v25 + 16) = 9;
  swift_willThrow();
  swift_release();
  return v4;
}

uint64_t sub_2188924E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 88);
  if (*(_QWORD *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v6 = sub_2188767BC(a1, a2);
    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v9 = sub_21888F84C(v8);
      swift_release();
      return v9;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v10 = sub_2188A5C9C();
  __swift_project_value_buffer(v10, (uint64_t)qword_254FFEE30);
  v11 = sub_2188A5C84();
  v12 = sub_2188A5E4C();
  v9 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21885E000, v11, (os_log_type_t)v9, "copyPassword: Not found", v13, 2u);
    MEMORY[0x219A1C06C](v13, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v14 = xmmword_2188A9270;
  *(_BYTE *)(v14 + 16) = 9;
  swift_willThrow();
  return v9;
}

uint64_t sub_2188926C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  swift_beginAccess();
  v6 = *(_QWORD *)(v2 + 56);
  if (*(_QWORD *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = sub_2188767BC(a1, a2);
    if ((v8 & 1) != 0)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v10 = *(_QWORD *)(v3 + 64);
      if (*(_QWORD *)(v10 + 16))
      {
        swift_retain();
        swift_bridgeObjectRetain();
        v11 = sub_2188768A0(v9);
        if ((v12 & 1) != 0)
        {
          v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
          swift_release();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          sub_218897940(a1, a2);
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_release();
          if (v13)
          {
            if (v13 != 1)
            {
              swift_beginAccess();
              swift_retain();
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              v31 = *(_QWORD *)(v3 + 64);
              *(_QWORD *)(v3 + 64) = 0x8000000000000000;
              sub_21889815C(v13 - 1, v9, isUniquelyReferenced_nonNull_native);
              *(_QWORD *)(v3 + 64) = v31;
              swift_release();
              swift_bridgeObjectRelease();
              swift_endAccess();
              sub_218881BE8();
              return swift_release();
            }
          }
          else
          {
            if (qword_254FFC850 != -1)
              swift_once();
            v26 = sub_2188A5C9C();
            __swift_project_value_buffer(v26, (uint64_t)qword_254FFEE30);
            v27 = sub_2188A5C84();
            v28 = sub_2188A5E58();
            if (os_log_type_enabled(v27, v28))
            {
              v29 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v29 = 0;
              _os_log_impl(&dword_21885E000, v27, v28, "deleteCert: Refcount was already 0", v29, 2u);
              MEMORY[0x219A1C06C](v29, -1, -1);
            }

          }
          swift_beginAccess();
          v30 = swift_retain();
          sub_218897844(v30);
          swift_endAccess();
          swift_release();
          sub_218881BE8();
          sub_21888C29C(v9);
          return swift_release();
        }
        swift_release();
        swift_bridgeObjectRelease();
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v21 = sub_2188A5C9C();
      __swift_project_value_buffer(v21, (uint64_t)qword_254FFEE30);
      v22 = sub_2188A5C84();
      v23 = sub_2188A5E58();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_21885E000, v22, v23, "deleteCert: Couldn't look up refcount when removing dependency for cert", v24, 2u);
        MEMORY[0x219A1C06C](v24, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_OWORD *)v25 = xmmword_2188A9270;
      *(_BYTE *)(v25 + 16) = 9;
      swift_willThrow();
      return swift_release();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v15 = sub_2188A5C9C();
  __swift_project_value_buffer(v15, (uint64_t)qword_254FFEE30);
  v16 = sub_2188A5C84();
  v17 = sub_2188A5E58();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_21885E000, v16, v17, "deleteCert: Attempted to remove dependency for cert that isn't present", v18, 2u);
    MEMORY[0x219A1C06C](v18, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v19 = xmmword_2188A9270;
  *(_BYTE *)(v19 + 16) = 9;
  return swift_willThrow();
}

uint64_t sub_218892B98(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = v2;
  swift_beginAccess();
  v7 = v2[7];
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = sub_2188767BC(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_13:
    if (qword_254FFC850 != -1)
      swift_once();
    v25 = sub_2188A5C9C();
    __swift_project_value_buffer(v25, (uint64_t)qword_254FFEE30);
    v26 = sub_2188A5C84();
    v27 = sub_2188A5E4C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_21885E000, v26, v27, "deleteIdentity: Attempted to remove dependency for cert that isn't present", v28, 2u);
      MEMORY[0x219A1C06C](v28, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v29 = xmmword_2188A9270;
    *(_BYTE *)(v29 + 16) = 9;
    return swift_willThrow();
  }
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v8);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = v4 + 8;
  swift_beginAccess();
  v12 = v4[8];
  if (!*(_QWORD *)(v12 + 16))
  {
LABEL_19:
    if (qword_254FFC850 != -1)
      swift_once();
    v30 = sub_2188A5C9C();
    __swift_project_value_buffer(v30, (uint64_t)qword_254FFEE30);
    v31 = sub_2188A5C84();
    v32 = sub_2188A5E58();
    if (!os_log_type_enabled(v31, v32))
      goto LABEL_29;
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    v34 = "deleteIdentity: Couldn't look up refcount when removing dependency for cert";
    goto LABEL_28;
  }
  swift_retain();
  swift_bridgeObjectRetain();
  v13 = sub_2188768A0(v10);
  if ((v14 & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v13);
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v16 = v4[9];
  if (!*(_QWORD *)(v16 + 16))
  {
LABEL_24:
    if (qword_254FFC850 != -1)
      swift_once();
    v35 = sub_2188A5C9C();
    __swift_project_value_buffer(v35, (uint64_t)qword_254FFEE30);
    v31 = sub_2188A5C84();
    v32 = sub_2188A5E58();
    if (!os_log_type_enabled(v31, v32))
      goto LABEL_29;
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    v34 = "deleteIdentity: Attempted to remove dependency for key that isn't present";
LABEL_28:
    _os_log_impl(&dword_21885E000, v31, v32, v34, v33, 2u);
    MEMORY[0x219A1C06C](v33, -1, -1);
LABEL_29:

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v36 = xmmword_2188A9270;
    *(_BYTE *)(v36 + 16) = 9;
    swift_willThrow();
    return swift_release();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = sub_2188767BC(a1, a2);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  v47 = v15;
  v19 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v46 = v4 + 10;
  swift_beginAccess();
  v20 = v4[10];
  if (!*(_QWORD *)(v20 + 16))
  {
LABEL_32:
    if (qword_254FFC850 != -1)
      swift_once();
    v37 = sub_2188A5C9C();
    __swift_project_value_buffer(v37, (uint64_t)qword_254FFEE30);
    v38 = sub_2188A5C84();
    v39 = sub_2188A5E58();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_21885E000, v38, v39, "deleteIdentity: Couldn't look up refcount when removing dependency for key", v40, 2u);
      MEMORY[0x219A1C06C](v40, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_OWORD *)v41 = xmmword_2188A9270;
    *(_BYTE *)(v41 + 16) = 9;
    swift_willThrow();
    goto LABEL_46;
  }
  swift_retain();
  swift_bridgeObjectRetain();
  v21 = sub_2188768A0(v19);
  if ((v22 & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  v45 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v21);
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_218897940(a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_218897934(a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  result = swift_release();
  if (v47)
  {
    swift_beginAccess();
    if (v47 == 1)
    {
      v42 = swift_retain();
      sub_218897844(v42);
      swift_endAccess();
      result = swift_release();
    }
    else
    {
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v48 = *v11;
      *v11 = 0x8000000000000000;
      sub_21889815C(v47 - 1, v10, isUniquelyReferenced_nonNull_native);
      *v11 = v48;
      swift_release();
      swift_bridgeObjectRelease();
      result = swift_endAccess();
    }
    if (v45)
    {
      swift_beginAccess();
      if (v45 == 1)
      {
        v44 = swift_retain();
        sub_218897830(v44);
        swift_endAccess();
        swift_release();
      }
      else
      {
        swift_retain();
        v43 = swift_isUniquelyReferenced_nonNull_native();
        v49 = *v46;
        *v46 = 0x8000000000000000;
        sub_218898138(v45 - 1, v19, v43);
        *v46 = v49;
        swift_release();
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
      sub_218881BE8();
      if (v47 != 1 || (sub_21888C29C(v10), !v3))
      {
        if (v45 == 1)
          sub_21888C2C8(v19);
      }
LABEL_46:
      swift_release();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21889334C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  swift_beginAccess();
  v6 = *(_QWORD *)(v2 + 88);
  if (*(_QWORD *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = sub_2188767BC(a1, a2);
    if ((v8 & 1) != 0)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v10 = *(_QWORD *)(v3 + 96);
      if (*(_QWORD *)(v10 + 16))
      {
        swift_retain();
        swift_bridgeObjectRetain();
        v11 = sub_2188768A0(v9);
        if ((v12 & 1) != 0)
        {
          v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
          swift_release();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          sub_218897A38(a1, a2);
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_release();
          if (v13)
          {
            if (v13 != 1)
            {
              swift_beginAccess();
              swift_retain();
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              v31 = *(_QWORD *)(v3 + 96);
              *(_QWORD *)(v3 + 96) = 0x8000000000000000;
              sub_2188981A8(v13 - 1, v9, isUniquelyReferenced_nonNull_native);
              *(_QWORD *)(v3 + 96) = v31;
              swift_release();
              swift_bridgeObjectRelease();
              swift_endAccess();
              sub_218881BE8();
              return swift_release();
            }
          }
          else
          {
            if (qword_254FFC850 != -1)
              swift_once();
            v26 = sub_2188A5C9C();
            __swift_project_value_buffer(v26, (uint64_t)qword_254FFEE30);
            v27 = sub_2188A5C84();
            v28 = sub_2188A5E58();
            if (os_log_type_enabled(v27, v28))
            {
              v29 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v29 = 0;
              _os_log_impl(&dword_21885E000, v27, v28, "deletePassword: Refcount was already 0", v29, 2u);
              MEMORY[0x219A1C06C](v29, -1, -1);
            }

          }
          swift_beginAccess();
          v30 = swift_retain();
          sub_218897A24(v30);
          swift_endAccess();
          swift_release();
          sub_218881BE8();
          sub_21888C7DC(v9);
          return swift_release();
        }
        swift_release();
        swift_bridgeObjectRelease();
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v21 = sub_2188A5C9C();
      __swift_project_value_buffer(v21, (uint64_t)qword_254FFEE30);
      v22 = sub_2188A5C84();
      v23 = sub_2188A5E58();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_21885E000, v22, v23, "deletePassword: Couldn't look up refcount when removing dependency for password", v24, 2u);
        MEMORY[0x219A1C06C](v24, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_OWORD *)v25 = xmmword_2188A9270;
      *(_BYTE *)(v25 + 16) = 9;
      swift_willThrow();
      return swift_release();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v15 = sub_2188A5C9C();
  __swift_project_value_buffer(v15, (uint64_t)qword_254FFEE30);
  v16 = sub_2188A5C84();
  v17 = sub_2188A5E58();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_21885E000, v16, v17, "deletePassword: Attempted to remove dependency for cert that isn't present", v18, 2u);
    MEMORY[0x219A1C06C](v18, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v19 = xmmword_2188A9270;
  *(_BYTE *)(v19 + 16) = 9;
  return swift_willThrow();
}

uint64_t sub_218893820(uint64_t a1, unint64_t a2)
{
  return sub_218893864(a1, a2);
}

uint64_t sub_218893864(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_2188A5FA8())
    {
LABEL_3:
      if ((a2 & 0xC000000000000001) != 0)
      {
        v4 = MEMORY[0x219A1B688](0, a2);
      }
      else
      {
        v4 = *(_QWORD *)(a2 + 32);
        swift_retain();
      }
      __asm { BR              X10 }
    }
  }
  else
  {
    v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_21889425C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_2188A6038();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_2188A6038() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void sub_218894320()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  char v21;
  void *v22;
  unsigned int v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  id v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _OWORD v54[2];
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v1 = v0;
  v57 = *MEMORY[0x24BDAC8D0];
  v2 = sub_2188A5D74();
  v4 = v3;
  v5 = objc_msgSend(v0, sel__atsContext);
  if (v5)
  {
    v6 = v5;
    v7 = sub_2188A5C3C();
    v9 = v8;

    v10 = (void *)objc_opt_self();
    v11 = (void *)sub_2188A5C24();
    *(_QWORD *)&v55 = 0;
    v12 = objc_msgSend(v10, sel_propertyListWithData_options_format_error_, v11, 1, 0, &v55);

    if (!v12)
    {
      v20 = (id)v55;
      swift_bridgeObjectRelease();
      sub_2188A5BDC();

      swift_willThrow();
      sub_21887A168(v7, v9);
      return;
    }
    v53 = v2;
    v13 = (id)v55;
    sub_2188A5F00();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCF8);
    v51 = v7;
    v52 = v9;
    v50 = v10;
    if (swift_dynamicCast())
      v14 = *(_QWORD *)&v54[0];
    else
      v14 = sub_218876040(MEMORY[0x24BEE4AF8]);
    if (!*(_QWORD *)(v14 + 16))
      goto LABEL_23;
    sub_2188767BC(0xD000000000000016, 0x80000002188ABAE0);
    if ((v21 & 1) != 0)
    {
      swift_unknownObjectRetain();
      objc_opt_self();
      v22 = (void *)swift_dynamicCastObjCClass();
      if (v22)
      {
        v23 = objc_msgSend(v22, sel_BOOLValue);
        swift_unknownObjectRelease();
        if (v23)
        {
          sub_21887A168(v7, v52);
          swift_bridgeObjectRelease();
LABEL_39:
          swift_bridgeObjectRelease();
          return;
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    if (*(_QWORD *)(v14 + 16)
      && (v24 = sub_2188767BC(0xD000000000000012, 0x80000002188ABB00), (v25 & 1) != 0)
      && (*(_QWORD *)&v55 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v24),
          swift_unknownObjectRetain(),
          __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCE0),
          swift_dynamicCast()))
    {
      v26 = *(_QWORD *)&v54[0];
      if (!*(_QWORD *)(*(_QWORD *)&v54[0] + 16))
      {
LABEL_22:
        v55 = 0u;
        v56 = 0u;
        goto LABEL_30;
      }
    }
    else
    {
LABEL_23:
      v26 = sub_218875DE8(MEMORY[0x24BEE4AF8]);
      if (!*(_QWORD *)(v26 + 16))
        goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    v27 = sub_2188767BC(v53, v4);
    if ((v28 & 1) != 0)
    {
      sub_21887A700(*(_QWORD *)(v26 + 56) + 32 * v27, (uint64_t)&v55);
    }
    else
    {
      v55 = 0u;
      v56 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v56 + 1))
    {
      if (swift_dynamicCast())
      {
        v29 = *(_QWORD *)&v54[0];
LABEL_32:
        v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, 1);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v55 = v29;
        sub_21889866C((uint64_t)v30, 0xD000000000000022, 0x80000002188ABB20, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
        v32 = sub_2188A5CF0();
        swift_bridgeObjectRelease();
        *((_QWORD *)&v56 + 1) = swift_getObjectType();
        *(_QWORD *)&v55 = v32;
        sub_21887A73C(&v55, v54);
        v33 = swift_isUniquelyReferenced_nonNull_native();
        sub_218898008(v54, v53, v4, v33);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v34 = sub_2188A5CF0();
        swift_bridgeObjectRelease();
        v35 = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v55 = v14;
        sub_21889866C(v34, 0xD000000000000012, 0x80000002188ABB00, v35);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v36 = (void *)sub_2188A5CF0();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v55 = 0;
        v37 = objc_msgSend(v50, sel_dataWithPropertyList_format_options_error_, v36, 200, 0, &v55);

        v38 = (id)v55;
        if (v37)
        {
          v39 = sub_2188A5C3C();
          v41 = v40;

          sub_21887A110(v39, v41);
          v42 = (void *)sub_2188A5C24();
          sub_21887A168(v39, v41);
          objc_msgSend(v1, sel_set_atsContext_, v42);
          sub_21887A168(v39, v41);
          sub_21887A168(v51, v52);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return;
        }
        v43 = v38;
        v44 = (void *)sub_2188A5BDC();

        swift_willThrow();
        if (qword_254FFC850 != -1)
          swift_once();
        v45 = sub_2188A5C9C();
        __swift_project_value_buffer(v45, (uint64_t)qword_254FFEE30);
        v46 = sub_2188A5C84();
        v47 = sub_2188A5E58();
        if (os_log_type_enabled(v46, v47))
        {
          v48 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v48 = 0;
          _os_log_impl(&dword_21885E000, v46, v47, "allowInsecureHTTPRequests: failed to serialize _atsContext", v48, 2u);
          MEMORY[0x219A1C06C](v48, -1, -1);
        }

        sub_21887B0BC();
        swift_allocError();
        *(_OWORD *)v49 = xmmword_2188A86A0;
        *(_BYTE *)(v49 + 16) = 9;
        swift_willThrow();
        sub_21887A168(v51, v52);

        swift_bridgeObjectRelease();
        goto LABEL_39;
      }
LABEL_31:
      v29 = sub_218876040(MEMORY[0x24BEE4AF8]);
      goto LABEL_32;
    }
LABEL_30:
    sub_21887CF8C((uint64_t)&v55, &qword_254FFC9E0);
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  if (qword_254FFC850 != -1)
    swift_once();
  v15 = sub_2188A5C9C();
  __swift_project_value_buffer(v15, (uint64_t)qword_254FFEE30);
  v16 = sub_2188A5C84();
  v17 = sub_2188A5E58();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_21885E000, v16, v17, "allowInsecureHTTPRequests: _atsContext is nil", v18, 2u);
    MEMORY[0x219A1C06C](v18, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v19 = xmmword_2188A86A0;
  *(_BYTE *)(v19 + 16) = 9;
  swift_willThrow();
}

id sub_218894AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, _QWORD *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned int a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  ValueMetadata *v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  void *v45;
  char v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  id v54;
  ValueMetadata *v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  SecKeyRef v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  uint64_t v78;
  SecKeyRef identityRef;
  unint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  SecKeyRef privateKeyRef;
  id v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;

  v21 = a2;
  v22 = (id)a1;
  v92 = *MEMORY[0x24BDAC8D0];
  v23 = sub_21889553C(a1, a2, a3, a4, a5, a6, a16);
  if (v16)
    return v22;
  v83 = (uint64_t)v23;
  v80 = v26;
  v78 = v25;
  v82 = v24;
  v27 = sub_218896380((uint64_t)v22, v21, a3, a4, a7);
  sub_21889A0B4(a8, a9, a12, a13, BYTE1(v27) & 1, BYTE2(v27) & 1, BYTE3(v27) & 1, BYTE4(v27) & 1, &privateKeyRef, BYTE5(v27) & 1, a11, (uint64_t)a10, v83, a16);
  if (a14 == -1)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  v81 = a14 + 1;
  identityRef = privateKeyRef;
  v73 = (uint64_t)v88;
  v74 = v89;
  v75 = v90;
  v76 = v91;
  sub_21887A110(v90, v91);
  if (qword_254FFC850 != -1)
LABEL_50:
    swift_once();
  v29 = sub_2188A5C9C();
  __swift_project_value_buffer(v29, (uint64_t)qword_254FFEE30);
  v30 = sub_2188A5C84();
  v31 = sub_2188A5E34();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_21885E000, v30, v31, "requestCert: Sending PKCSReq message", v32, 2u);
    MEMORY[0x219A1C06C](v32, -1, -1);
  }

  v77 = v27 & 1;
  v33 = &type metadata for MKError;
  v35 = v75;
  v34 = v76;
  while (1)
  {
    sub_218896794(v77, v35, v34, (uint64_t)v22, v21, v83);
    v37 = v36;
    if (v36 >> 62)
      break;
    v27 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v27)
      goto LABEL_12;
LABEL_26:
    swift_bridgeObjectRelease();
    v50 = sub_2188A5C84();
    v51 = sub_2188A5E4C();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_21885E000, v50, v51, "requestCert: Issued certs were empty", v52, 2u);
      MEMORY[0x219A1C06C](v52, -1, -1);
    }

    sub_21887B0BC();
    v45 = (void *)swift_allocError();
    *(_QWORD *)v53 = 0xD000000000000017;
    *(_QWORD *)(v53 + 8) = 0x80000002188ABD50;
    *(_BYTE *)(v53 + 16) = 3;
    swift_willThrow();
LABEL_29:
    v86 = v45;
    v54 = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCA8);
    if (!swift_dynamicCast())
    {
      sub_21887A168(v35, v34);
      swift_bridgeObjectRelease();

LABEL_41:
      sub_21889AED0(v73, v74, a16);
      sub_21887A168(v75, v76);
      sub_21887A168(v73, v74);

      v22 = (id)v80;
      if (v80 >> 60 != 15)
      {
        sub_21887A110(v78, v80);
        sub_21889AED0(v78, v80, a16);
        sub_21887A154(v78, v80);
        sub_21887A154(v78, v80);
      }
      goto LABEL_3;
    }
    v85 = v45;
    v55 = v33;
    v56 = v22;
    v57 = v21;
    v58 = v34;
    v60 = privateKeyRef;
    v59 = v88;
    if (v89 != 6)
    {
      sub_21887E244(privateKeyRef, v88, v89);
      sub_21887A168(v35, v58);
      swift_bridgeObjectRelease();

      sub_21889AED0(v73, v74, a16);
      sub_21887A168(v75, v76);
      sub_21887A168(v73, v74);

      v22 = (id)v80;
      if (v80 >> 60 != 15)
      {
        sub_21887A110(v78, v80);
        sub_21889AED0(v78, v80, a16);
        sub_21887A154(v78, v80);
        sub_21887A154(v78, v80);
      }
      goto LABEL_3;
    }

    sleep(a15);
    v61 = sub_21889B1B0((uint64_t)v82, a10);
    v63 = v62;
    sub_21887A168(v35, v58);
    sub_21887E244(v60, v59, 6);

    v34 = v63;
    v35 = v61;
    v21 = v57;
    v22 = v56;
    --v81;
    v33 = v55;
    if (!v81)
    {
      swift_bridgeObjectRelease();
      v64 = sub_2188A5C84();
      v65 = sub_2188A5E4C();
      if (os_log_type_enabled(v64, v65))
      {
        v67 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v67 = 0;
        _os_log_impl(&dword_21885E000, v64, v65, "requestCert: Exhausted retries, giving up", v67, 2u);
        MEMORY[0x219A1C06C](v67, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v68 = 0xD000000000000011;
      *(_QWORD *)(v68 + 8) = 0x80000002188ABD00;
      *(_BYTE *)(v68 + 16) = 3;
      swift_willThrow();
      sub_21887A168(v61, v63);
      goto LABEL_41;
    }
  }
  swift_bridgeObjectRetain();
  v27 = sub_2188A5FA8();
  swift_bridgeObjectRelease();
  if (!v27)
    goto LABEL_26;
LABEL_12:
  if ((v37 & 0xC000000000000001) != 0)
  {
    v38 = (id)MEMORY[0x219A1B688](0, v37);
  }
  else
  {
    if (!*(_QWORD *)((v37 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_49;
    }
    v38 = *(id *)(v37 + 32);
  }
  v39 = v38;
  swift_bridgeObjectRelease();
  privateKeyRef = 0;
  v84 = v39;
  if (SecIdentityCopyPrivateKey(identityRef, &privateKeyRef) || !privateKeyRef)
  {
    v47 = sub_2188A5C84();
    v48 = sub_2188A5E58();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_21885E000, v47, v48, "requestCert: Unable to get private key from temporary identity", v49, 2u);
      MEMORY[0x219A1C06C](v49, -1, -1);
    }

    sub_21887B0BC();
    v45 = (void *)swift_allocError();
    *(_OWORD *)v44 = xmmword_2188A86A0;
    v46 = 9;
    goto LABEL_24;
  }
  v40 = SecIdentityCreate();
  if (!v40)
  {
    v41 = sub_2188A5C84();
    v42 = sub_2188A5E58();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_21885E000, v41, v42, "requestCert: Issued certificate didn't match private key", v43, 2u);
      MEMORY[0x219A1C06C](v43, -1, -1);
    }

    sub_21887B0BC();
    v45 = (void *)swift_allocError();
    *(_QWORD *)v44 = 0xD00000000000002BLL;
    *(_QWORD *)(v44 + 8) = 0x80000002188ABD20;
    v46 = 3;
LABEL_24:
    *(_BYTE *)(v44 + 16) = v46;
    swift_willThrow();

    goto LABEL_29;
  }
  v69 = (void *)v40;
  swift_bridgeObjectRelease();
  v70 = sub_2188A5C84();
  v71 = sub_2188A5E34();
  if (os_log_type_enabled(v70, v71))
  {
    v72 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v72 = 0;
    _os_log_impl(&dword_21885E000, v70, v71, "requestCert: Success!", v72, 2u);
    MEMORY[0x219A1C06C](v72, -1, -1);
  }

  v22 = v69;
  sub_21887A168(v35, v34);

  sub_21889AED0(v73, v74, a16);
  sub_21887A168(v75, v76);
  sub_21887A168(v73, v74);

  if (v80 >> 60 != 15)
  {
    sub_21887A110(v78, v80);
    sub_21889AED0(v78, v80, a16);
    sub_21887A154(v78, v80);
    sub_21887A154(v78, v80);
  }
LABEL_3:

  return v22;
}

NSObject *sub_21889553C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint8_t *v34;
  const __CFData *v35;
  SecCertificateRef v36;
  uint64_t v37;
  uint64_t v38;
  __SecCertificate *v39;
  __SecCertificate *v40;
  uint64_t v41;
  uint64_t v42;
  os_log_type_t v43;
  _BOOL4 v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v48;
  _BOOL4 v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  int v61;
  uint64_t v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  unint64_t v66;
  const char *v67;
  uint64_t v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  os_log_type_t v88;
  uint8_t *v89;
  NSObject *v90;
  os_log_type_t v91;
  uint8_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  NSObject *v98;
  uint64_t v99;
  NSObject *v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;

  v8 = v7;
  v96 = a7;
  v97 = a6;
  v106 = *MEMORY[0x24BDAC8D0];
  v13 = sub_2188A5C0C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218896E94(a1, a2, 0x7265434143746547, 0xE900000000000074, a3, a4, (uint64_t)v16);
  if (!v7)
  {
    v17 = (unint64_t)v97;
    v94 = v14;
    v95 = v13;
    sub_218898948((uint64_t)v16, 0, 0xF000000000000000, 0, &v100);
    v18 = v103;
    v19 = (id)v105;
    if (v105 >> 60 == 15)
    {
      swift_bridgeObjectRelease();
      if (qword_254FFC850 != -1)
        swift_once();
      v20 = sub_2188A5C9C();
      __swift_project_value_buffer(v20, (uint64_t)qword_254FFEE30);
      v8 = sub_2188A5C84();
      v21 = sub_2188A5E4C();
      v22 = os_log_type_enabled(v8, v21);
      v24 = v94;
      v23 = v95;
      if (v22)
      {
        v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_21885E000, v8, v21, "GetCACert returned no data", v25, 2u);
        MEMORY[0x219A1C06C](v25, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v26 = 0xD00000000000001ALL;
      *(_QWORD *)(v26 + 8) = 0x80000002188ABB70;
      *(_BYTE *)(v26 + 16) = 3;
      swift_willThrow();
LABEL_24:
      (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v23);
      return v8;
    }
    if (!v103)
    {
      v41 = v104;
      sub_21887A110(v104, v105);
      if (qword_254FFC850 != -1)
        swift_once();
      v42 = sub_2188A5C9C();
      __swift_project_value_buffer(v42, (uint64_t)qword_254FFEE30);
      v8 = sub_2188A5C84();
      v43 = sub_2188A5E4C();
      v44 = os_log_type_enabled(v8, v43);
      v24 = v94;
      v23 = v95;
      if (v44)
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_21885E000, v8, v43, "getCACertOperation: SCEP server did not return a content type", v45, 2u);
        MEMORY[0x219A1C06C](v45, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v46 = 0xD000000000000024;
      *(_QWORD *)(v46 + 8) = 0x80000002188ABB90;
      *(_BYTE *)(v46 + 16) = 3;
      swift_willThrow();
      sub_21887A154(v41, (unint64_t)v19);
      sub_21887A154(v41, (unint64_t)v19);
      goto LABEL_24;
    }
    v93 = v104;
    v27 = v102;
    if (v102 == 0xD00000000000001ALL && v103 == 0x80000002188ABCB0 || (sub_2188A6038() & 1) != 0)
    {
      v28 = v93;
      sub_21887A0FC(v93, (unint64_t)v19);
      swift_bridgeObjectRelease();
      if (qword_254FFC850 != -1)
        swift_once();
      v29 = sub_2188A5C9C();
      __swift_project_value_buffer(v29, (uint64_t)qword_254FFEE30);
      v30 = sub_2188A5C84();
      v31 = sub_2188A5E34();
      v32 = os_log_type_enabled(v30, v31);
      v33 = v94;
      if (v32)
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_21885E000, v30, v31, "getCACertOperation: returned CA", v34, 2u);
        MEMORY[0x219A1C06C](v34, -1, -1);
      }

      v35 = (const __CFData *)sub_2188A5C24();
      v36 = SecCertificateCreateWithData(0, v35);

      if (v36)
      {
        v37 = v28;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9A0);
        v38 = swift_allocObject();
        *(_OWORD *)(v38 + 16) = xmmword_2188A9290;
        *(_QWORD *)(v38 + 32) = v36;
        v100 = v38;
        sub_2188A5E10();
        v8 = v100;
        v39 = v36;
LABEL_18:
        v40 = v39;
        sub_218899514((uint64_t)v40, v96);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v16, v95);
        sub_21887A154(v37, (unint64_t)v19);
        sub_21887A154(v37, (unint64_t)v19);

        return v8;
      }
      v8 = sub_2188A5C84();
      v48 = sub_2188A5E4C();
      v49 = os_log_type_enabled(v8, (os_log_type_t)v48);
      v50 = v95;
      if (v49)
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_21885E000, v8, (os_log_type_t)v48, "getCACertOperation: Failed converting CA data to certificate", v51, 2u);
        MEMORY[0x219A1C06C](v51, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v52 = 0xD000000000000028;
      *(_QWORD *)(v52 + 8) = 0x80000002188ABCD0;
      *(_BYTE *)(v52 + 16) = 3;
      swift_willThrow();
      sub_21887A154(v28, (unint64_t)v19);
      sub_21887A154(v28, (unint64_t)v19);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v16, v50);
    }
    else
    {
      if (v27 == 0xD00000000000001DLL && v18 == 0x80000002188ABBC0 || (sub_2188A6038() & 1) != 0)
      {
        sub_21887A0FC(v93, (unint64_t)v19);
        swift_bridgeObjectRelease();
        if (qword_254FFC850 != -1)
          swift_once();
        v53 = sub_2188A5C9C();
        __swift_project_value_buffer(v53, (uint64_t)qword_254FFEE30);
        v54 = sub_2188A5C84();
        v55 = sub_2188A5E34();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v56 = 0;
          _os_log_impl(&dword_21885E000, v54, v55, "getCACertOperation: returned CA+RA", v56, 2u);
          MEMORY[0x219A1C06C](v56, -1, -1);
        }

        v57 = (void *)sub_2188A5C24();
        v58 = (void *)SecCMSCertificatesOnlyMessageCopyCertificates();

        if (v58)
        {
          v99 = 0;
          v100 = 0;
          v59 = v58;
          v60 = 0;
          if (v17 >> 60 != 15)
            v60 = (void *)sub_2188A5C24();
          v61 = SecSCEPValidateCACertMessage();
          v97 = v59;

          v62 = v93;
          if (v61)
          {
            v8 = sub_2188A5C84();
            v63 = sub_2188A5E4C();
            if (os_log_type_enabled(v8, v63))
            {
              v64 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)v64 = 67240192;
              LODWORD(v98) = v61;
              sub_2188A5EC4();
              _os_log_impl(&dword_21885E000, v8, v63, "getCACertOperation: Failed validating CA Cert message, status: %{public}d", v64, 8u);
              MEMORY[0x219A1C06C](v64, -1, -1);
            }

            sub_21887B0BC();
            swift_allocError();
            v66 = 0xD000000000000021;
            v67 = "Failed validating CA Cert message";
          }
          else
          {
            v80 = v100;
            if (v100)
            {
              v81 = v99;
              if (v99)
              {
                v82 = sub_2188A5C84();
                v83 = sub_2188A5E34();
                if (os_log_type_enabled(v82, v83))
                {
                  v84 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v84 = 0;
                  _os_log_impl(&dword_21885E000, v82, v83, "getCACertOperation: returned separate signing and encryption certificates for RA.", v84, 2u);
                  MEMORY[0x219A1C06C](v84, -1, -1);
                }

                __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9A0);
                v85 = swift_allocObject();
                *(_OWORD *)(v85 + 16) = xmmword_2188A9280;
                *(_QWORD *)(v85 + 32) = v81;
                *(_QWORD *)(v85 + 40) = v80;
              }
              else
              {
                v90 = sub_2188A5C84();
                v91 = sub_2188A5E34();
                if (os_log_type_enabled(v90, v91))
                {
                  v92 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v92 = 0;
                  _os_log_impl(&dword_21885E000, v90, v91, "getCACertOperation: returned an RA certificate.", v92, 2u);
                  MEMORY[0x219A1C06C](v92, -1, -1);
                }

                __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9A0);
                v85 = swift_allocObject();
                *(_OWORD *)(v85 + 16) = xmmword_2188A9290;
                *(_QWORD *)(v85 + 32) = v80;
              }
              v98 = v85;
              sub_2188A5E10();
              v8 = v98;
              v33 = v94;
              v37 = v62;
              v39 = v80;

              goto LABEL_18;
            }
            v8 = sub_2188A5C84();
            v88 = sub_2188A5E4C();
            if (os_log_type_enabled(v8, v88))
            {
              v89 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v89 = 0;
              _os_log_impl(&dword_21885E000, v8, v88, "getCACertOperation: Failed validating RA Cert message, no RA certificate", v89, 2u);
              MEMORY[0x219A1C06C](v89, -1, -1);
            }

            sub_21887B0BC();
            swift_allocError();
            v66 = 0xD000000000000034;
            v67 = "Failed validating RA Cert message, no RA certificate";
          }
          *(_QWORD *)v65 = v66;
          *(_QWORD *)(v65 + 8) = (unint64_t)(v67 - 32) | 0x8000000000000000;
          *(_BYTE *)(v65 + 16) = 3;
          swift_willThrow();
          sub_21887A154(v62, (unint64_t)v19);

          v68 = v62;
        }
        else
        {
          v8 = sub_2188A5C84();
          v69 = sub_2188A5E4C();
          if (os_log_type_enabled(v8, v69))
          {
            v70 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v70 = 0;
            _os_log_impl(&dword_21885E000, v8, v69, "getCACertOperation: Failed converting CA+RA data to certificates", v70, 2u);
            MEMORY[0x219A1C06C](v70, -1, -1);
          }

          sub_21887B0BC();
          swift_allocError();
          *(_QWORD *)v71 = 0xD00000000000002CLL;
          *(_QWORD *)(v71 + 8) = 0x80000002188ABC10;
          *(_BYTE *)(v71 + 16) = 3;
          swift_willThrow();
          v72 = v93;
          sub_21887A154(v93, (unint64_t)v19);
          v68 = v72;
        }
        sub_21887A154(v68, (unint64_t)v19);
        (*(void (**)(char *, uint64_t))(v94 + 8))(v16, v95);
        return v8;
      }
      sub_21887A110(v93, (unint64_t)v19);
      if (qword_254FFC850 != -1)
        swift_once();
      v73 = sub_2188A5C9C();
      __swift_project_value_buffer(v73, (uint64_t)qword_254FFEE30);
      swift_bridgeObjectRetain_n();
      v74 = sub_2188A5C84();
      v75 = sub_2188A5E4C();
      if (os_log_type_enabled(v74, v75))
      {
        v97 = v19;
        v76 = (uint8_t *)swift_slowAlloc();
        v77 = swift_slowAlloc();
        v100 = v77;
        *(_DWORD *)v76 = 136446210;
        swift_bridgeObjectRetain();
        v99 = sub_2188A17DC(v27, v18, (uint64_t *)&v100);
        v19 = v97;
        v78 = v93;
        sub_2188A5EC4();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21885E000, v74, v75, "getCACertOperation: SCEP server returned wrong content type %{public}s", v76, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v77, -1, -1);
        MEMORY[0x219A1C06C](v76, -1, -1);

        v79 = v95;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v79 = v95;
        v78 = v93;
      }
      v100 = 0;
      v101 = 0xE000000000000000;
      sub_2188A5F54();
      swift_bridgeObjectRelease();
      v100 = 0xD000000000000024;
      v101 = 0x80000002188ABBE0;
      sub_2188A5D98();
      swift_bridgeObjectRelease();
      v86 = (uint64_t)v100;
      v8 = v101;
      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v87 = v86;
      *(_QWORD *)(v87 + 8) = v8;
      *(_BYTE *)(v87 + 16) = 3;
      swift_willThrow();
      sub_21887A154(v78, (unint64_t)v19);
      sub_21887A154(v78, (unint64_t)v19);
      (*(void (**)(char *, uint64_t))(v94 + 8))(v16, v79);
    }
  }
  return v8;
}

uint64_t sub_218896380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  unint64_t v34;
  _QWORD v35[4];
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[6];
  uint64_t v39;

  v39 = a4;
  v10 = sub_2188A5AE0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2188A5D68();
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2188A5C0C();
  v16 = MEMORY[0x24BDAC7A8]();
  v19 = (char *)v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    v20 = sub_21889425C(0xD000000000000010, 0x80000002188ABB50, a5);
    v21 = sub_21889425C(5457217, 0xE300000000000000, a5);
    v22 = sub_21889425C(861095236, 0xE400000000000000, a5);
    v23 = sub_21889425C(0x3231352D414853, 0xE700000000000000, a5);
    v24 = sub_21889425C(0x3635322D414853, 0xE700000000000000, a5);
    v25 = sub_21889425C(0x312D414853, 0xE500000000000000, a5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      v26 = 0x10000000000;
    else
      v26 = 0;
    v27 = 0x100000000;
    if ((v24 & 1) == 0)
      v27 = 0;
    v28 = 0x1000000;
    if ((v23 & 1) == 0)
      v28 = 0;
    v29 = 0x10000;
    if ((v22 & 1) == 0)
      v29 = 0;
    v30 = 256;
    if ((v21 & 1) == 0)
      v30 = 0;
    v31 = v20 & 1;
    return v27 | v29 | v26 | v28 | v30 | v31;
  }
  v35[2] = v15;
  v35[3] = v13;
  v36 = v17;
  v37 = v16;
  v35[0] = v11;
  v35[1] = v10;
  v33 = (uint64_t)v19;
  result = sub_218896E94(a1, a2, 0x7061434143746547, 0xE900000000000073, a3, v39, (uint64_t)v19);
  if (!v5)
  {
    sub_218898948(v33, 0, 0xF000000000000000, 0, v38);
    v34 = v38[5];
    swift_bridgeObjectRelease();
    if (v34 >> 60 != 15)
      __asm { BR              X10 }
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v33, v37);
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v26 = 0x10000000000;
    return v27 | v29 | v26 | v28 | v30 | v31;
  }
  return result;
}

void sub_218896794(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint8_t *v20;
  uint8_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  char *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFError *v38;
  id v39;
  const __CFString *v40;
  __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFError *v45;
  __CFError *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  CFDictionaryRef v51;
  CFDictionaryRef v52;
  const __CFDictionary *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  const __CFDictionary *v58;
  uint64_t v59;
  uint64_t v60;
  __CFError **v61;
  uint64_t v62;
  __CFError *v63;
  uint64_t v64;
  _QWORD v65[3];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70[7];

  v7 = v6;
  v65[1] = a6;
  v67 = a4;
  v68 = a3;
  v66 = a2;
  v70[6] = *(id *)MEMORY[0x24BDAC8D0];
  v9 = a1 & 1;
  v10 = sub_2188A5C0C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254FFC850 != -1)
    swift_once();
  v14 = sub_2188A5C9C();
  v65[2] = __swift_project_value_buffer(v14, (uint64_t)qword_254FFEE30);
  v15 = sub_2188A5C84();
  v16 = sub_2188A5E34();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = v11;
    v18 = v13;
    v19 = v10;
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_21885E000, v15, v16, "sendPKIOperation: Making request for issuance.", v20, 2u);
    v21 = v20;
    v10 = v19;
    v13 = v18;
    v11 = v17;
    v7 = v6;
    MEMORY[0x219A1C06C](v21, -1, -1);
  }

  if (v9)
  {
    v23 = 0;
    v25 = 0;
    v22 = v68;
  }
  else
  {
    v22 = v68;
    v23 = sub_2188A5C30();
    v25 = v24;
  }
  sub_218896E94(v67, a5, 0x617265704F494B50, 0xEC0000006E6F6974, v23, v25, (uint64_t)v13);
  swift_bridgeObjectRelease();
  if (!v7)
  {
    if (v9)
      v26 = v66;
    else
      v26 = 0;
    if (v9)
      v27 = v22;
    else
      v27 = 0xF000000000000000;
    sub_218898948((uint64_t)v13, v26, v27, 0x80000002188ABA30, v70);
    v28 = v70[4];
    v29 = (unint64_t)v70[5];
    swift_bridgeObjectRelease();
    if (v29 >> 60 == 15)
    {
      v30 = sub_2188A5C84();
      v31 = sub_2188A5E4C();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_21885E000, v30, v31, "PKIOperation returned no data", v32, 2u);
        MEMORY[0x219A1C06C](v32, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v33 = 0xD00000000000001DLL;
      *(_QWORD *)(v33 + 8) = 0x80000002188ABA50;
      *(_BYTE *)(v33 + 16) = 3;
      swift_willThrow();
      goto LABEL_19;
    }
    v67 = v11;
    v68 = v10;
    v34 = v13;
    v70[0] = 0;
    sub_21887A110((uint64_t)v28, v29);
    v35 = (void *)sub_2188A5C24();
    v66 = (uint64_t)v28;
    v36 = (void *)sub_2188A5C24();
    type metadata accessor for SecCertificate(0);
    v37 = (void *)sub_2188A5DEC();
    v38 = (__CFError *)SecSCEPVerifyReply();

    v39 = v70[0];
    if (v70[0])
    {
      v10 = v68;
      v13 = v34;
      if (!v38)
      {
        v38 = (__CFError *)v70[0];
        v40 = (id)CFErrorGetDomain(v38);
        if (v40)
        {
          v41 = (__CFString *)v40;
          v42 = sub_2188A5D20();
          v44 = v43;

          if (v42 == 0x474E49444E4550 && v44 == 0xE700000000000000)
          {
            swift_bridgeObjectRelease();
            v11 = v67;
          }
          else
          {
            v50 = sub_2188A6038();
            swift_bridgeObjectRelease();
            v11 = v67;
            if ((v50 & 1) == 0)
              goto LABEL_37;
          }
          v51 = CFErrorCopyUserInfo(v38);
          if (v51)
          {
            v52 = v51;
            v53 = v51;
            v54 = sub_2188A5C84();
            v55 = sub_2188A5E64();
            if (os_log_type_enabled(v54, v55))
            {
              v56 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v56 = 0;
              _os_log_impl(&dword_21885E000, v54, v55, "PKIOperation returned PENDING", v56, 2u);
              MEMORY[0x219A1C06C](v56, -1, -1);
            }

            sub_21887B0BC();
            swift_allocError();
            *(_QWORD *)v57 = v52;
            *(_QWORD *)(v57 + 8) = 0;
            *(_BYTE *)(v57 + 16) = 6;
            v58 = v53;
            swift_willThrow();
            v59 = v66;
            sub_21887A154(v66, v29);

            sub_21887A154(v59, v29);
            (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v68);
            return;
          }
LABEL_37:
          type metadata accessor for CFError(0);
          sub_21887CF44();
          v60 = swift_allocError();
          *v61 = v38;
          sub_21887B0BC();
          swift_allocError();
          *(_QWORD *)v62 = v60;
          *(_QWORD *)(v62 + 8) = 0;
          *(_BYTE *)(v62 + 16) = 4;
          v63 = v38;
          swift_willThrow();
          v64 = v66;
          sub_21887A154(v66, v29);

          sub_21887A154(v64, v29);
LABEL_19:
          (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
          return;
        }
LABEL_39:

        __break(1u);
        return;
      }
    }
    else
    {
      v10 = v68;
      v13 = v34;
      if (!v38)
      {
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v48 = 0xD00000000000001ALL;
        *(_QWORD *)(v48 + 8) = 0x80000002188ABA70;
        *(_BYTE *)(v48 + 16) = 3;
        swift_willThrow();
        v49 = v66;
        sub_21887A154(v66, v29);
        sub_21887A154(v49, v29);
        (*(void (**)(char *, uint64_t))(v67 + 8))(v34, v10);
        return;
      }
      v39 = 0;
    }
    v45 = v38;

    (*(void (**)(char *, uint64_t))(v67 + 8))(v13, v10);
    v69 = 0;
    v46 = v45;
    sub_2188A5DF8();
    if (v69)
    {
      v47 = v66;
      sub_21887A154(v66, v29);

      sub_21887A154(v47, v29);
      return;
    }
    __break(1u);
    goto LABEL_39;
  }
}

uint64_t sub_218896E94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;

  v52 = a7;
  v57 = a4;
  v58 = a6;
  v55 = a5;
  v56 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9B8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_2188A5AF8();
  v11 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCE8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2188A5B28();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = a2;
  sub_2188A5B1C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_21887CF8C((uint64_t)v15, &qword_254FFCCE8);
    if (qword_254FFC850 != -1)
      swift_once();
    v20 = sub_2188A5C9C();
    __swift_project_value_buffer(v20, (uint64_t)qword_254FFEE30);
    v21 = sub_2188A5C84();
    v22 = sub_2188A5E4C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_21885E000, v21, v22, "buildURL: Failed to parse base URL", v23, 2u);
      MEMORY[0x219A1C06C](v23, -1, -1);
    }

    v59 = 0;
    v60 = 0xE000000000000000;
    sub_2188A5F54();
    swift_bridgeObjectRelease();
    v59 = 0xD00000000000001ALL;
    v60 = 0x80000002188AB950;
    sub_2188A5D98();
    v24 = v59;
    v25 = v60;
    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v26 = v24;
    *(_QWORD *)(v26 + 8) = v25;
    *(_BYTE *)(v26 + 16) = 3;
    return swift_willThrow();
  }
  else
  {
    v50 = v16;
    v51 = a1;
    v49 = v17;
    v28 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v53 = v19;
    v28(v19, v15, v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCF0);
    v29 = *(_QWORD *)(v11 + 72);
    v30 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_2188A86D0;
    sub_2188A5AEC();
    if (v58)
    {
      sub_2188A5AEC();
      v33 = *(_QWORD *)(v31 + 16);
      v32 = *(_QWORD *)(v31 + 24);
      if (v33 >= v32 >> 1)
        v31 = sub_218897538(v32 > 1, v33 + 1, 1, v31);
      v34 = v54;
      *(_QWORD *)(v31 + 16) = v33 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v31 + v30 + v33 * v29, v13, v34);
    }
    v35 = v53;
    sub_2188A5B04();
    sub_2188A5B10();
    v36 = sub_2188A5C0C();
    v37 = *(_QWORD *)(v36 - 8);
    v38 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48))(v10, 1, v36);
    v39 = v50;
    v40 = v49;
    if (v38 == 1)
    {
      sub_21887CF8C((uint64_t)v10, &qword_254FFC9B8);
      if (qword_254FFC850 != -1)
        swift_once();
      v41 = sub_2188A5C9C();
      __swift_project_value_buffer(v41, (uint64_t)qword_254FFEE30);
      v42 = sub_2188A5C84();
      v43 = sub_2188A5E4C();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_21885E000, v42, v43, "buildURL: Failed to build URL", v44, 2u);
        MEMORY[0x219A1C06C](v44, -1, -1);
      }

      v59 = 0;
      v60 = 0xE000000000000000;
      sub_2188A5F54();
      swift_bridgeObjectRelease();
      v59 = 0xD000000000000015;
      v60 = 0x80000002188AB970;
      sub_2188A5D98();
      v45 = v59;
      v46 = v60;
      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v47 = v45;
      *(_QWORD *)(v47 + 8) = v46;
      *(_BYTE *)(v47 + 16) = 3;
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v53, v39);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v49 + 8))(v35, v50);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v52, v10, v36);
    }
  }
}

uint64_t sub_2188973F0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  unint64_t v9;

  swift_beginAccess();
  v8 = *(_QWORD *)(a5 + 16);
  v9 = *(_QWORD *)(a5 + 24);
  *(_QWORD *)(a5 + 16) = a1;
  *(_QWORD *)(a5 + 24) = a2;
  sub_21887A0FC(a1, a2);
  sub_21887A154(v8, v9);
  return sub_2188A5E94();
}

uint64_t sub_218897468(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void (*v7)(void *, unint64_t, void *, void *);
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v6 = a2;
  v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v8 = v6;
    v6 = (void *)sub_2188A5C3C();
    v10 = v9;

  }
  else
  {
    swift_retain();
    v10 = 0xF000000000000000;
  }
  v11 = a3;
  v12 = a4;
  v7(v6, v10, a3, a4);

  sub_21887A154((uint64_t)v6, v10);
  return swift_release();
}

uint64_t type metadata accessor for MKSCEPClient()
{
  return objc_opt_self();
}

uint64_t sub_218897538(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCF0);
  v10 = *(_QWORD *)(sub_2188A5AF8() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_2188A5F90();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_2188A5AF8() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_218898830(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

double sub_218897740@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
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
  v8 = sub_2188767BC(a1, a2);
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
      sub_218878EEC();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_21887A73C((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_218897A68(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_218897830(uint64_t a1)
{
  return sub_218897858(a1, sub_2188768A0, (void (*)(void))sub_2188790D0);
}

uint64_t sub_218897844(uint64_t a1)
{
  return sub_218897858(a1, sub_2188768A0, (void (*)(void))sub_2188790DC);
}

uint64_t sub_218897858(uint64_t a1, uint64_t (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t *v3;
  uint64_t *v6;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = v3;
  swift_bridgeObjectRetain();
  v8 = a2(a1);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v6;
  v14 = *v6;
  *v6 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3();
    v11 = v14;
  }
  swift_release();
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v8);
  sub_218897C40(v8, v11);
  *v6 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_218897934(uint64_t a1, uint64_t a2)
{
  return sub_21889794C(a1, a2, (void (*)(void))sub_2188790E8);
}

uint64_t sub_218897940(uint64_t a1, uint64_t a2)
{
  return sub_21889794C(a1, a2, (void (*)(void))sub_2188790F4);
}

uint64_t sub_21889794C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t *v3;
  uint64_t *v5;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_2188767BC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v5;
  v14 = *v5;
  *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3();
    v11 = v14;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v8);
  sub_218897E34(v8, v11);
  *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_218897A24(uint64_t a1)
{
  return sub_218897858(a1, sub_2188768A0, (void (*)(void))sub_218879100);
}

uint64_t sub_218897A38(uint64_t a1, uint64_t a2)
{
  return sub_21889794C(a1, a2, (void (*)(void))sub_2188792A4);
}

uint64_t sub_218897A44(uint64_t a1, uint64_t a2)
{
  return sub_21889794C(a1, a2, (void (*)(void))sub_21887945C);
}

uint64_t sub_218897A50(uint64_t a1, uint64_t a2)
{
  return sub_21889794C(a1, a2, (void (*)(void))sub_218879468);
}

uint64_t sub_218897A5C(uint64_t a1, uint64_t a2)
{
  return sub_21889794C(a1, a2, (void (*)(void))sub_218879474);
}

unint64_t sub_218897A68(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2188A5F0C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_2188A608C();
        swift_bridgeObjectRetain();
        sub_2188A5D8C();
        v10 = sub_2188A60A4();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_218897C40(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2188A5F0C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        sub_2188A608C();
        v10 = *(_QWORD *)(v9 + 16);
        v11 = *(_QWORD *)(v9 + 24);
        swift_retain();
        sub_21887A110(v10, v11);
        sub_2188A5C48();
        sub_21887A168(v10, v11);
        v12 = sub_2188A60A4();
        result = swift_release();
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_QWORD *)(v17 + 8 * v3);
          v19 = (_QWORD *)(v17 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_218897E34(unint64_t result, uint64_t a2)
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
    result = sub_2188A5F0C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_2188A608C();
        swift_bridgeObjectRetain();
        sub_2188A5D8C();
        v9 = sub_2188A60A4();
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

_OWORD *sub_218898008(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_2188767BC(a2, a3);
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
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
        return sub_21887A73C(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_218878EEC();
      goto LABEL_7;
    }
    sub_218877600(v15, a4 & 1);
    v21 = sub_2188767BC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_2188987C8(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_2188A6044();
  __break(1u);
  return result;
}

uint64_t sub_218898138(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2188981CC(a1, a2, a3, (uint64_t (*)(uint64_t))sub_2188768A0, (uint64_t (*)(void))sub_2188790D0, (void (*)(void))sub_2188778FC, (void (*)(_QWORD))type metadata accessor for MKPrimaryKeyKey);
}

uint64_t sub_21889815C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2188981CC(a1, a2, a3, (uint64_t (*)(uint64_t))sub_2188768A0, (uint64_t (*)(void))sub_2188790DC, (void (*)(void))sub_218877908, (void (*)(_QWORD))type metadata accessor for MKPrimaryKeyCert);
}

uint64_t sub_218898180(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_218898350(a1, a2, a3, a4, (void (*)(void))sub_2188790E8, (void (*)(void))sub_218877914);
}

uint64_t sub_218898194(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_218898350(a1, a2, a3, a4, (void (*)(void))sub_2188790F4, (void (*)(void))sub_218877920);
}

uint64_t sub_2188981A8(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2188981CC(a1, a2, a3, sub_2188768A0, (uint64_t (*)(void))sub_218879100, (void (*)(void))sub_21887792C, (void (*)(_QWORD))type metadata accessor for MKPrimaryKeyPassword);
}

uint64_t sub_2188981CC(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(void), void (*a6)(void), void (*a7)(_QWORD))
{
  _QWORD *v7;
  _QWORD *v11;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t result;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v11 = v7;
  v15 = *v7;
  v17 = a4(a2);
  v18 = *(_QWORD *)(v15 + 16);
  v19 = (v16 & 1) == 0;
  result = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v21 = v16;
  v22 = *(_QWORD *)(v15 + 24);
  if (v22 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v22 >= result && (a3 & 1) == 0)
  {
    result = a5();
LABEL_7:
    v23 = (_QWORD *)*v11;
    if ((v21 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v23[7] + 8 * v17) = a1;
      return result;
    }
LABEL_11:
    v23[(v17 >> 6) + 8] |= 1 << v17;
    v25 = 8 * v17;
    *(_QWORD *)(v23[6] + v25) = a2;
    *(_QWORD *)(v23[7] + v25) = a1;
    v26 = v23[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (!v27)
    {
      v23[2] = v28;
      return swift_retain();
    }
    goto LABEL_14;
  }
  a6();
  result = a4(a2);
  if ((v21 & 1) == (v24 & 1))
  {
    v17 = result;
    v23 = (_QWORD *)*v11;
    if ((v21 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  a7(0);
  result = sub_2188A6044();
  __break(1u);
  return result;
}

uint64_t sub_21889833C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_218898350(a1, a2, a3, a4, (void (*)(void))sub_2188792A4, (void (*)(void))sub_218877C44);
}

uint64_t sub_218898350(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void))
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t result;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;

  v9 = v6;
  v14 = *v6;
  v16 = sub_2188767BC(a2, a3);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];
      result = swift_release();
      *(_QWORD *)(v23 + 8 * v16) = a1;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v27 = (uint64_t *)(v22[6] + 16 * v16);
    *v27 = a2;
    v27[1] = a3;
    *(_QWORD *)(v22[7] + 8 * v16) = a1;
    v28 = v22[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (!v29)
    {
      v22[2] = v30;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  a6();
  v25 = sub_2188767BC(a2, a3);
  if ((v20 & 1) == (v26 & 1))
  {
    v16 = v25;
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2188A6044();
  __break(1u);
  return result;
}

uint64_t sub_2188984C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_2188984FC(a1, a2, a3, a4, (void (*)(void))sub_21887945C, (void (*)(void))sub_218877F60);
}

uint64_t sub_2188984D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_2188984FC(a1, a2, a3, a4, (void (*)(void))sub_218879468, (void (*)(void))sub_218877F6C);
}

uint64_t sub_2188984E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_2188984FC(a1, a2, a3, a4, (void (*)(void))sub_218879474, (void (*)(void))sub_218877F78);
}

uint64_t sub_2188984FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void))
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t result;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;

  v9 = v6;
  v14 = *v6;
  v16 = sub_2188767BC(a2, a3);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v23 + 8 * v16) = a1;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v27 = (uint64_t *)(v22[6] + 16 * v16);
    *v27 = a2;
    v27[1] = a3;
    *(_QWORD *)(v22[7] + 8 * v16) = a1;
    v28 = v22[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (!v29)
    {
      v22[2] = v30;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  a6();
  v25 = sub_2188767BC(a2, a3);
  if ((v20 & 1) == (v26 & 1))
  {
    v16 = v25;
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2188A6044();
  __break(1u);
  return result;
}

uint64_t sub_21889866C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_2188767BC(a2, a3);
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
    sub_218879B60();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_unknownObjectRelease();
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
  sub_218878BD8(v15, a4 & 1);
  v21 = sub_2188767BC(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2188A6044();
  __break(1u);
  return result;
}

_OWORD *sub_2188987C8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_21887A73C(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_218898830(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_2188A5AF8() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_2188A5FD8();
  __break(1u);
  return result;
}

void sub_218898948(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t a4@<X5>, void *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t, uint64_t);
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  dispatch_semaphore_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  _QWORD *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  _BYTE *v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  id v70;
  int v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  id v80;
  int v81;
  id v82;
  NSObject *v83;
  id v84;
  id v85;
  NSObject *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  uint64_t aBlock;
  unint64_t v93;
  uint64_t (*v94)(uint64_t, void *, void *, void *);
  void *v95;
  uint64_t (*v96)(uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;

  v87 = a5;
  v9 = sub_2188A5C0C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = sub_2188A5A80();
  v89 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16 = v14;
  v15(v12, a1, v9);
  sub_2188A5A5C();
  sub_2188A5A44();
  sub_21887A0FC(a2, a3);
  sub_2188A5A74();
  if (a4)
    sub_2188A5A68();
  v17 = sub_2188A5BF4();
  if (v18)
  {
    v19 = v17;
    v20 = v18;
    if (qword_254FFC850 != -1)
      swift_once();
    v21 = sub_2188A5C9C();
    v22 = __swift_project_value_buffer(v21, (uint64_t)qword_254FFEE30);
    swift_bridgeObjectRetain_n();
    v86 = v22;
    v23 = sub_2188A5C84();
    v24 = sub_2188A5E40();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      aBlock = v26;
      *(_DWORD *)v25 = 136446210;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v90 = sub_2188A17DC(v19, v20, &aBlock);
      sub_2188A5EC4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21885E000, v23, v24, "MKSCEPClient: performing synchronous URL request to host: %{public}s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v26, -1, -1);
      MEMORY[0x219A1C06C](v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v34 = objc_msgSend((id)objc_opt_self(), sel_ephemeralSessionConfiguration);
    v35 = v88;
    sub_218894320();
    if (v35)
    {
      (*(void (**)(char *, uint64_t))(v89 + 8))(v16, v98);
      swift_bridgeObjectRelease();

      return;
    }
    v79 = v19;
    v36 = (void *)objc_opt_self();
    v85 = v34;
    v37 = objc_msgSend(v36, sel_sessionWithConfiguration_, v34);
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_2188A92A0;
    v80 = (id)(v38 + 16);
    v39 = dispatch_semaphore_create(0);
    v40 = (void *)sub_2188A5A50();
    v41 = swift_allocObject();
    *(_QWORD *)(v41 + 16) = v38;
    *(_QWORD *)(v41 + 24) = v39;
    v96 = sub_2188994B0;
    v97 = v41;
    aBlock = MEMORY[0x24BDAC760];
    v93 = 1107296256;
    v94 = sub_218897468;
    v95 = &block_descriptor_0;
    v42 = _Block_copy(&aBlock);
    v88 = v38;
    swift_retain();
    v43 = v39;
    swift_release();
    v84 = v37;
    v44 = objc_msgSend(v37, sel_dataTaskWithRequest_completionHandler_, v40, v42);
    _Block_release(v42);

    objc_msgSend(v44, sel_resume);
    v83 = v43;
    sub_2188A5E88();
    v45 = objc_msgSend(v44, sel_response);
    if (v45)
    {
      v46 = v45;
      objc_opt_self();
      v47 = (void *)swift_dynamicCastObjCClass();
      v48 = v47;
      if (v47)
      {
        v82 = objc_msgSend(v47, sel_statusCode);
        v81 = 0;
        goto LABEL_22;
      }

      v82 = 0;
    }
    else
    {
      v82 = 0;
      v48 = 0;
    }
    v81 = 1;
LABEL_22:
    v49 = objc_msgSend(v44, sel_error);
    if (v49)
    {
      v50 = v49;
      v51 = v49;
      swift_bridgeObjectRetain();
      v87 = v51;
      v52 = sub_2188A5C84();
      v53 = sub_2188A5E4C();
      v86 = v52;
      if (os_log_type_enabled(v52, v53))
      {
        v54 = swift_slowAlloc();
        v78 = v48;
        v55 = v54;
        v76 = (_QWORD *)swift_slowAlloc();
        v77 = swift_slowAlloc();
        aBlock = v77;
        *(_DWORD *)v55 = 136446722;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v90 = sub_2188A17DC(v79, v20, &aBlock);
        v80 = v44;
        sub_2188A5EC4();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v55 + 12) = 2050;
        v56 = v82;
        if (v81)
          v56 = 0;
        *(_QWORD *)&v90 = v56;
        sub_2188A5EC4();
        *(_WORD *)(v55 + 22) = 2114;
        v57 = v87;
        v58 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v90 = v58;
        v44 = v80;
        sub_2188A5EC4();
        v59 = v76;
        *v76 = v58;

        v60 = v86;
        _os_log_impl(&dword_21885E000, v86, v53, "MKSCEPClient: URL request to host \"%{public}s\" failed. HTTP status code: %{public}ld Error: %{public}@", (uint8_t *)v55, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v59, -1, -1);
        v61 = v77;
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v61, -1, -1);
        v62 = v55;
        v48 = v78;
        MEMORY[0x219A1C06C](v62, -1, -1);

        v63 = v87;
      }
      else
      {

        v63 = v87;
        swift_bridgeObjectRelease_n();
      }
      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v69 = v50;
      *(_QWORD *)(v69 + 8) = 0;
      *(_BYTE *)(v69 + 16) = 5;
      v70 = v63;
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v89 + 8))(v16, v98);
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
    if (v48)
    {
      v64 = objc_msgSend(v48, sel_allHeaderFields);
      v65 = sub_2188A5CFC();

      strcpy((char *)&v90, "Content-Type");
      BYTE13(v90) = 0;
      HIWORD(v90) = -5120;
      sub_2188A5F3C();
      v66 = v87;
      if (*(_QWORD *)(v65 + 16) && (v67 = sub_218876928((uint64_t)&aBlock), (v68 & 1) != 0))
      {
        sub_21887A700(*(_QWORD *)(v65 + 56) + 32 * v67, (uint64_t)&v90);
      }
      else
      {
        v90 = 0u;
        v91 = 0u;
      }
      swift_bridgeObjectRelease();

      sub_21887A6CC((uint64_t)&aBlock);
      (*(void (**)(char *, uint64_t))(v89 + 8))(v16, v98);
      if (*((_QWORD *)&v91 + 1))
      {
        v71 = swift_dynamicCast();
        if (v71)
          v72 = aBlock;
        else
          v72 = 0;
        if (v71)
          v73 = v93;
        else
          v73 = 0;
        goto LABEL_43;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v89 + 8))(v16, v98);

      v90 = 0u;
      v91 = 0u;
      v66 = v87;
    }
    sub_21887CF8C((uint64_t)&v90, &qword_254FFC9E0);
    v72 = 0;
    v73 = 0;
LABEL_43:
    swift_beginAccess();
    v74 = *(_QWORD *)(v88 + 16);
    v75 = *(_QWORD *)(v88 + 24);
    sub_21887A0FC(v74, v75);
    swift_release();
    *(_QWORD *)v66 = v82;
    v66[8] = v81;
    *((_QWORD *)v66 + 2) = v72;
    *((_QWORD *)v66 + 3) = v73;
    *((_QWORD *)v66 + 4) = v74;
    *((_QWORD *)v66 + 5) = v75;
    return;
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v27 = sub_2188A5C9C();
  __swift_project_value_buffer(v27, (uint64_t)qword_254FFEE30);
  v28 = sub_2188A5C84();
  v29 = sub_2188A5E4C();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_21885E000, v28, v29, "MKSCEPClient: couldn't parse host from URL", v30, 2u);
    MEMORY[0x219A1C06C](v30, -1, -1);
  }

  aBlock = 0;
  v93 = 0xE000000000000000;
  sub_2188A5F54();
  swift_bridgeObjectRelease();
  aBlock = 0xD00000000000001ELL;
  v93 = 0x80000002188ABA90;
  sub_2188A5BE8();
  sub_2188A5D98();
  swift_bridgeObjectRelease();
  v31 = aBlock;
  v32 = v93;
  sub_21887B0BC();
  swift_allocError();
  *(_QWORD *)v33 = v31;
  *(_QWORD *)(v33 + 8) = v32;
  *(_BYTE *)(v33 + 16) = 3;
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v16, v98);
}

uint64_t sub_218899450()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >> 60 != 15)
    sub_21887A168(*(_QWORD *)(v0 + 16), v1);
  return swift_deallocObject();
}

uint64_t sub_218899484()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2188994B0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_2188973F0(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_2188994D0()
{
  unint64_t result;

  result = qword_254FFCD00;
  if (!qword_254FFCD00)
  {
    result = MEMORY[0x219A1BFE8](MEMORY[0x24BDCDE28], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254FFCD00);
  }
  return result;
}

uint64_t sub_218899514(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  const __CFDictionary *v21;
  OSStatus v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  const __CFDictionary *v27;
  OSStatus v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  OSStatus v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  unsigned int v48;
  _OWORD v49[2];
  __int128 v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  CFTypeRef result[31];

  result[29] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A9230;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 72) = swift_getObjectType();
  *(_QWORD *)(inited + 48) = a1;
  v6 = sub_2188A5D20();
  v7 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 80) = v6;
  *(_QWORD *)(inited + 88) = v8;
  *(_QWORD *)(inited + 120) = v7;
  *(_QWORD *)(inited + 96) = 0xD000000000000017;
  *(_QWORD *)(inited + 104) = 0x80000002188AAF00;
  *(_QWORD *)(inited + 128) = sub_2188A5D20();
  *(_QWORD *)(inited + 136) = v9;
  v10 = (void *)*MEMORY[0x24BDE8F70];
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 168) = v11;
  *(_QWORD *)(inited + 144) = v10;
  *(_QWORD *)(inited + 176) = sub_2188A5D20();
  *(_QWORD *)(inited + 184) = v12;
  v13 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 216) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 192) = 1;
  swift_unknownObjectRetain();
  v14 = v10;
  v15 = sub_218875DE8(inited);
  if (a2 != 1)
  {
LABEL_4:
    result[0] = 0;
    swift_bridgeObjectRetain();
    v21 = (const __CFDictionary *)sub_2188A5CF0();
    swift_bridgeObjectRelease();
    v22 = SecItemAdd(v21, result);

    v48 = v22;
    if (v22 == -25299)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v23 = sub_2188A5C9C();
      __swift_project_value_buffer(v23, (uint64_t)qword_254FFEE30);
      v24 = sub_2188A5C84();
      v25 = sub_2188A5E40();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v26 = 67109120;
        swift_beginAccess();
        LODWORD(v50) = -25299;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v24, v25, "getCACertOperation: SecItemAdd status %d", v26, 8u);
        MEMORY[0x219A1C06C](v26, -1, -1);
      }

      v27 = (const __CFDictionary *)sub_2188A5CF0();
      swift_bridgeObjectRelease();
      v28 = SecItemCopyMatching(v27, result);

      swift_beginAccess();
      v48 = v28;
      if (v28)
      {
        v29 = sub_2188A5C84();
        v30 = sub_2188A5E58();
        v31 = v30;
        if (os_log_type_enabled(v29, v30))
        {
          v32 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v32 = 67109120;
          LODWORD(v52) = v28;
          sub_2188A5EC4();
          _os_log_impl(&dword_21885E000, v29, (os_log_type_t)v31, "getCACertOperation: SecItemCopyMatching status %d", v32, 8u);
          MEMORY[0x219A1C06C](v32, -1, -1);
        }

LABEL_19:
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v38 = v48;
        *(_QWORD *)(v38 + 8) = 0;
        *(_BYTE *)(v38 + 16) = 0;
        goto LABEL_35;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      if (v22)
      {
        if (qword_254FFC850 != -1)
          swift_once();
        v33 = sub_2188A5C9C();
        __swift_project_value_buffer(v33, (uint64_t)qword_254FFEE30);
        v34 = v22;
        v35 = sub_2188A5C84();
        v36 = sub_2188A5E58();
        v31 = v36;
        if (os_log_type_enabled(v35, v36))
        {
          v37 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v37 = 67109120;
          LODWORD(v50) = v34;
          sub_2188A5EC4();
          _os_log_impl(&dword_21885E000, v35, (os_log_type_t)v31, "getCACertOperation: status %d", v37, 8u);
          MEMORY[0x219A1C06C](v37, -1, -1);
        }

        swift_beginAccess();
        goto LABEL_19;
      }
      if (qword_254FFC850 != -1)
        swift_once();
      v39 = sub_2188A5C9C();
      __swift_project_value_buffer(v39, (uint64_t)qword_254FFEE30);
      v40 = sub_2188A5C84();
      v41 = sub_2188A5E40();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v42 = 67109120;
        LODWORD(v50) = v22;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v40, v41, "getCACertOperation: SecItemAdd status %d", v42, 8u);
        MEMORY[0x219A1C06C](v42, -1, -1);
      }

    }
    if (result[0])
    {
      swift_unknownObjectRetain();
      if (swift_dynamicCast())
      {
        v31 = v52;
        if (v22 == -25299)
        {
          sub_21887A168(v52, v53);
          v31 = 0;
        }
        swift_unknownObjectRelease();
        return v31;
      }
    }
    if (qword_254FFC850 != -1)
      swift_once();
    v43 = sub_2188A5C9C();
    __swift_project_value_buffer(v43, (uint64_t)qword_254FFEE30);
    v44 = sub_2188A5C84();
    v45 = sub_2188A5E58();
    v31 = v45;
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_21885E000, v44, (os_log_type_t)v31, "getCACertOperation: SecItemAdd/SecItemCopyMatching did not return result", v46, 2u);
      MEMORY[0x219A1C06C](v46, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v47 = 0;
    *(_QWORD *)(v47 + 8) = 0;
    *(_BYTE *)(v47 + 16) = 9;
LABEL_35:
    swift_willThrow();
    swift_unknownObjectRelease();
    return v31;
  }
  v16 = *MEMORY[0x24BDE9538];
  if (*MEMORY[0x24BDE9538])
  {
    v17 = sub_2188A5D20();
    v19 = v18;
    v51 = v13;
    LOBYTE(v50) = 1;
    sub_21887A73C(&v50, v49);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v52 = v15;
    sub_218898008(v49, v17, v19, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  __break(1u);
  return v16;
}

SecKeyRef sub_218899C98(uint64_t a1)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  SecKeyRef RandomKey;
  CFErrorRef v9;
  uint64_t v10;
  __CFError *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  __CFError **v16;
  __CFError *v17;
  _QWORD *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  __CFError **v26;
  __SecKey *v28;
  uint64_t v29;
  CFErrorRef error[18];

  error[17] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A8630;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v3;
  v4 = sub_2188A5D20();
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 80) = sub_2188A5D20();
  *(_QWORD *)(inited + 88) = v6;
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1E88];
  *(_QWORD *)(inited + 96) = a1;
  sub_218875DE8(inited);
  error[0] = 0;
  v7 = (const __CFDictionary *)sub_2188A5CF0();
  swift_bridgeObjectRelease();
  RandomKey = SecKeyCreateRandomKey(v7, error);

  v9 = error[0];
  if (error[0])
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v10 = sub_2188A5C9C();
    __swift_project_value_buffer(v10, (uint64_t)qword_254FFEE30);
    v11 = v9;
    v12 = sub_2188A5C84();
    v13 = sub_2188A5E4C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v28 = RandomKey;
      v15 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v14 = 138412290;
      type metadata accessor for CFError(0);
      sub_21887CF44();
      swift_allocError();
      *v16 = v11;
      v17 = v11;
      v29 = _swift_stdlib_bridgeErrorToNSError();
      sub_2188A5EC4();
      *v15 = v29;

      _os_log_impl(&dword_21885E000, v12, v13, "generateKeyPair: SecKeyCreateRandomKey returned error %@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
      swift_arrayDestroy();
      v18 = v15;
      RandomKey = v28;
      MEMORY[0x219A1C06C](v18, -1, -1);
      MEMORY[0x219A1C06C](v14, -1, -1);
    }
    else
    {

      v12 = v11;
    }

    type metadata accessor for CFError(0);
    sub_21887CF44();
    v25 = swift_allocError();
    *v26 = v11;
    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v23 = v25;
    v24 = 4;
LABEL_14:
    *(_QWORD *)(v23 + 8) = 0;
    *(_BYTE *)(v23 + 16) = v24;
    swift_willThrow();

    return RandomKey;
  }
  if (!RandomKey)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v19 = sub_2188A5C9C();
    __swift_project_value_buffer(v19, (uint64_t)qword_254FFEE30);
    v20 = sub_2188A5C84();
    v21 = sub_2188A5E58();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21885E000, v20, v21, "generateKeyPair: SecKeyCreateRandomKey succeeded but returned nil", v22, 2u);
      MEMORY[0x219A1C06C](v22, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v23 = 2;
    v24 = 9;
    goto LABEL_14;
  }
  return RandomKey;
}

void sub_21889A0B4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, char a7@<W6>, char a8@<W7>, _QWORD *a9@<X8>, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t inited;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  __SecKey *v67;
  __SecKey *v68;
  SecKeyRef v69;
  __SecKey *v70;
  void *v71;
  id v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  os_log_type_t v85;
  uint8_t *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  __SecKey *v98;
  id v99;
  __SecKey *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint8_t *v110;
  uint64_t v111;
  uint64_t v114;
  uint64_t v115;
  _OWORD v116[2];
  __int128 v117;
  uint64_t v118;
  unint64_t v119;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A86D0;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v22;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1E88];
  *(_QWORD *)(inited + 48) = a3;
  v23 = sub_218875DE8(inited);
  v119 = v23;
  v24 = sub_2188A5D20();
  v26 = v24;
  v27 = v25;
  if (a2)
  {
    v118 = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v117 = a1;
    *((_QWORD *)&v117 + 1) = a2;
    sub_21887A73C(&v117, v116);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v119 = 0x8000000000000000;
    sub_218898008(v116, v26, v27, isUniquelyReferenced_nonNull_native);
    v119 = v23;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_218897740(v24, v25, &v117);
    swift_bridgeObjectRelease();
    sub_21887CF8C((uint64_t)&v117, &qword_254FFC9E0);
  }
  v29 = sub_2188A5D20();
  v31 = v29;
  v32 = v30;
  if (a4)
  {
    v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCE0);
    *(_QWORD *)&v117 = a4;
    sub_21887A73C(&v117, v116);
    swift_bridgeObjectRetain();
    v33 = v119;
    v34 = swift_isUniquelyReferenced_nonNull_native();
    v119 = 0x8000000000000000;
    sub_218898008(v116, v31, v32, v34);
    v119 = v33;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((a5 & 1) != 0)
    {
LABEL_6:
      if (qword_254FFC850 != -1)
        swift_once();
      v35 = sub_2188A5C9C();
      __swift_project_value_buffer(v35, (uint64_t)qword_254FFEE30);
      v36 = sub_2188A5C84();
      v37 = sub_2188A5E34();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_21885E000, v36, v37, "generateCSR: AES is supported", v38, 2u);
        MEMORY[0x219A1C06C](v38, -1, -1);
      }

      v39 = sub_2188A5D20();
      v41 = v40;
      v42 = sub_2188A5D20();
      v118 = MEMORY[0x24BEE0D00];
      *(_QWORD *)&v117 = v42;
      *((_QWORD *)&v117 + 1) = v43;
      sub_21887A73C(&v117, v116);
      v44 = v119;
      v45 = swift_isUniquelyReferenced_nonNull_native();
      v119 = 0x8000000000000000;
      sub_218898008(v116, v39, v41, v45);
      v119 = v44;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
  }
  else
  {
    sub_218897740(v29, v30, &v117);
    swift_bridgeObjectRelease();
    sub_21887CF8C((uint64_t)&v117, &qword_254FFC9E0);
    if ((a5 & 1) != 0)
      goto LABEL_6;
  }
  if ((a6 & 1) == 0)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v46 = sub_2188A5C9C();
    __swift_project_value_buffer(v46, (uint64_t)qword_254FFEE30);
    v47 = sub_2188A5C84();
    v48 = sub_2188A5E4C();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_21885E000, v47, v48, "generateCSR: Insufficient required capability from Certificate Authority. AES, 3DES not supported. Falling back to 3DES anyway.", v49, 2u);
      MEMORY[0x219A1C06C](v49, -1, -1);
    }

  }
LABEL_18:
  if ((a7 & 1) != 0)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v50 = sub_2188A5C9C();
    __swift_project_value_buffer(v50, (uint64_t)qword_254FFEE30);
    v51 = sub_2188A5C84();
    v52 = sub_2188A5E34();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_21885E000, v51, v52, "generateCSR: SHA-512 is supported", v53, 2u);
      MEMORY[0x219A1C06C](v53, -1, -1);
    }
LABEL_35:

    v60 = sub_2188A5D20();
    v62 = v61;
    v63 = sub_2188A5D20();
    v118 = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v117 = v63;
    *((_QWORD *)&v117 + 1) = v64;
    sub_21887A73C(&v117, v116);
    v65 = v119;
    v66 = swift_isUniquelyReferenced_nonNull_native();
    v119 = 0x8000000000000000;
    sub_218898008(v116, v60, v62, v66);
    v119 = v65;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v67 = sub_218899C98(a11);
    if (v114)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v68 = v67;
      v69 = SecKeyCopyPublicKey(v67);
      if (v69)
      {
        v70 = v69;
        v71 = (void *)SecSCEPCreateTemporaryIdentity();
        if (v71)
        {
          v72 = v71;
          v88 = sub_218899514((uint64_t)v72, a14);
          v90 = v89;

          if (v90 >> 60 == 15)
          {
            swift_bridgeObjectRelease();
            if (qword_254FFC850 != -1)
              swift_once();
            v91 = sub_2188A5C9C();
            __swift_project_value_buffer(v91, (uint64_t)qword_254FFEE30);
            v92 = sub_2188A5C84();
            v93 = sub_2188A5E58();
            if (os_log_type_enabled(v92, v93))
            {
              v94 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v94 = 0;
              _os_log_impl(&dword_21885E000, v92, v93, "generateCSR: Failed to store temporary identity.", v94, 2u);
              MEMORY[0x219A1C06C](v94, -1, -1);
            }

            sub_21887B0BC();
            swift_allocError();
            *(_OWORD *)v95 = xmmword_2188A86A0;
            *(_BYTE *)(v95 + 16) = 9;
            swift_willThrow();

          }
          else
          {
            v115 = v88;
            sub_21887A110(v88, v90);
            if (a12)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8F8);
              v96 = (void *)sub_2188A5DEC();
            }
            else
            {
              v96 = 0;
            }
            v97 = (void *)sub_2188A5CF0();
            swift_bridgeObjectRelease();
            type metadata accessor for SecCertificate(0);
            v98 = v70;
            v99 = v72;
            v100 = v68;
            v101 = (void *)sub_2188A5DEC();
            v102 = (void *)SecSCEPGenerateCertificateRequest();

            if (v102)
            {
              v103 = v102;
              v104 = sub_2188A5C3C();
              v106 = v105;

              sub_21887A154(v115, v90);
              *a9 = v99;
              a9[1] = v115;
              a9[2] = v90;
              a9[3] = v104;
              a9[4] = v106;
            }
            else
            {
              if (qword_254FFC850 != -1)
                swift_once();
              v107 = sub_2188A5C9C();
              __swift_project_value_buffer(v107, (uint64_t)qword_254FFEE30);
              v108 = sub_2188A5C84();
              v109 = sub_2188A5E4C();
              if (os_log_type_enabled(v108, v109))
              {
                v110 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v110 = 0;
                _os_log_impl(&dword_21885E000, v108, v109, "generateCSR: Failed to generate CSR.", v110, 2u);
                MEMORY[0x219A1C06C](v110, -1, -1);
              }

              sub_21887B0BC();
              swift_allocError();
              *(_QWORD *)v111 = 0xD000000000000016;
              *(_QWORD *)(v111 + 8) = 0x80000002188ABDE0;
              *(_BYTE *)(v111 + 16) = 3;
              swift_willThrow();
              sub_21887A154(v115, v90);
              sub_21887A154(v115, v90);

            }
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          if (qword_254FFC850 != -1)
            swift_once();
          v83 = sub_2188A5C9C();
          __swift_project_value_buffer(v83, (uint64_t)qword_254FFEE30);
          v84 = sub_2188A5C84();
          v85 = sub_2188A5E58();
          if (os_log_type_enabled(v84, v85))
          {
            v86 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v86 = 0;
            _os_log_impl(&dword_21885E000, v84, v85, "generateCSR: Failed to generate temporary identity.", v86, 2u);
            MEMORY[0x219A1C06C](v86, -1, -1);
          }

          sub_21887B0BC();
          swift_allocError();
          *(_OWORD *)v87 = xmmword_2188A86A0;
          *(_BYTE *)(v87 + 16) = 9;
          swift_willThrow();

        }
      }
      else
      {
        swift_bridgeObjectRelease();
        if (qword_254FFC850 != -1)
          swift_once();
        v78 = sub_2188A5C9C();
        __swift_project_value_buffer(v78, (uint64_t)qword_254FFEE30);
        v79 = sub_2188A5C84();
        v80 = sub_2188A5E58();
        if (os_log_type_enabled(v79, v80))
        {
          v81 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v81 = 0;
          _os_log_impl(&dword_21885E000, v79, v80, "generateCSR: Failed to copy public key from private key.", v81, 2u);
          MEMORY[0x219A1C06C](v81, -1, -1);
        }

        sub_21887B0BC();
        swift_allocError();
        *(_OWORD *)v82 = xmmword_2188A86A0;
        *(_BYTE *)(v82 + 16) = 9;
        swift_willThrow();

      }
    }
    return;
  }
  if ((a8 & 1) != 0)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v54 = sub_2188A5C9C();
    __swift_project_value_buffer(v54, (uint64_t)qword_254FFEE30);
    v51 = sub_2188A5C84();
    v55 = sub_2188A5E34();
    if (os_log_type_enabled(v51, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_21885E000, v51, v55, "generateCSR: SHA-512 not supported. Falling back to SHA-256.", v56, 2u);
      MEMORY[0x219A1C06C](v56, -1, -1);
    }
    goto LABEL_35;
  }
  if ((a10 & 1) != 0)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v57 = sub_2188A5C9C();
    __swift_project_value_buffer(v57, (uint64_t)qword_254FFEE30);
    v51 = sub_2188A5C84();
    v58 = sub_2188A5E34();
    if (os_log_type_enabled(v51, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v59 = 0;
      _os_log_impl(&dword_21885E000, v51, v58, "generateCSR: SHA-512 and SHA-256 not supported. Falling back to SHA-1.", v59, 2u);
      MEMORY[0x219A1C06C](v59, -1, -1);
    }
    goto LABEL_35;
  }
  swift_bridgeObjectRelease();
  if (qword_254FFC850 != -1)
    swift_once();
  v73 = sub_2188A5C9C();
  __swift_project_value_buffer(v73, (uint64_t)qword_254FFEE30);
  v74 = sub_2188A5C84();
  v75 = sub_2188A5E4C();
  if (os_log_type_enabled(v74, v75))
  {
    v76 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v76 = 0;
    _os_log_impl(&dword_21885E000, v74, v75, "generateCSR: Insufficient required SCEP server capability: SHA-512, SHA-256, and SHA-1 not supported.", v76, 2u);
    MEMORY[0x219A1C06C](v76, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_QWORD *)v77 = 0xD000000000000049;
  *(_QWORD *)(v77 + 8) = 0x80000002188ABD90;
  *(_BYTE *)(v77 + 16) = 3;
  swift_willThrow();
}

void sub_21889AED0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  const __CFDictionary *v12;
  OSStatus v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  os_log_type_t v21;
  _OWORD v22[2];
  __int128 v23;
  uint64_t v24;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2188A86D0;
  *(_QWORD *)(inited + 32) = sub_2188A5D20();
  *(_QWORD *)(inited + 40) = v7;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  sub_21887A110(a1, a2);
  sub_218875DE8(inited);
  if (a3 != 1)
  {
LABEL_4:
    v12 = (const __CFDictionary *)sub_2188A5CF0();
    swift_bridgeObjectRelease();
    v13 = SecItemDelete(v12);

    if (v13)
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v14 = sub_2188A5C9C();
      __swift_project_value_buffer(v14, (uint64_t)qword_254FFEE30);
      v15 = sub_2188A5C84();
      v16 = sub_2188A5E58();
      if (!os_log_type_enabled(v15, v16))
        goto LABEL_14;
      v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v17 = 67109120;
      LODWORD(v23) = v13;
      sub_2188A5EC4();
      v18 = v15;
      v19 = v16;
    }
    else
    {
      if (qword_254FFC850 != -1)
        swift_once();
      v20 = sub_2188A5C9C();
      __swift_project_value_buffer(v20, (uint64_t)qword_254FFEE30);
      v15 = sub_2188A5C84();
      v21 = sub_2188A5E40();
      if (!os_log_type_enabled(v15, v21))
        goto LABEL_14;
      v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v17 = 67109120;
      LODWORD(v23) = 0;
      sub_2188A5EC4();
      v18 = v15;
      v19 = v21;
    }
    _os_log_impl(&dword_21885E000, v18, v19, "deleteSigningCert: status %d", v17, 8u);
    MEMORY[0x219A1C06C](v17, -1, -1);
LABEL_14:

    return;
  }
  if (*MEMORY[0x24BDE9538])
  {
    v8 = sub_2188A5D20();
    v10 = v9;
    v24 = MEMORY[0x24BEE1328];
    LOBYTE(v23) = 1;
    sub_21887A73C(&v23, v22);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_218898008(v22, v8, v10, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  __break(1u);
}

uint64_t sub_21889B1B0(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;

  v2 = a2;
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8F8);
    v2 = (void *)sub_2188A5DEC();
  }
  type metadata accessor for SecCertificate(0);
  v3 = (void *)sub_2188A5DEC();
  v4 = (void *)SecSCEPGetCertInitial();

  if (v4)
  {
    v5 = v4;
    v6 = sub_2188A5C3C();

    return v6;
  }
  else
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v8 = sub_2188A5C9C();
    __swift_project_value_buffer(v8, (uint64_t)qword_254FFEE30);
    v9 = sub_2188A5C84();
    v10 = sub_2188A5E4C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21885E000, v9, v10, "sendGetCertInitial: Failed generating message", v11, 2u);
      MEMORY[0x219A1C06C](v11, -1, -1);
    }

    sub_21887B0BC();
    swift_allocError();
    *(_QWORD *)v12 = 0xD000000000000019;
    *(_QWORD *)(v12 + 8) = 0x80000002188ABD70;
    *(_BYTE *)(v12 + 16) = 3;
    return swift_willThrow();
  }
}

BOOL MKScope.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_21889B3A0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_21889B3B8()
{
  unint64_t result;

  result = qword_254FFCD08;
  if (!qword_254FFCD08)
  {
    result = MEMORY[0x219A1BFE8](&protocol conformance descriptor for MKScope, &type metadata for MKScope);
    atomic_store(result, (unint64_t *)&qword_254FFCD08);
  }
  return result;
}

uint64_t sub_21889B3FC()
{
  sub_2188A608C();
  sub_2188A6098();
  return sub_2188A60A4();
}

uint64_t sub_21889B440()
{
  return sub_2188A6098();
}

uint64_t sub_21889B468()
{
  sub_2188A608C();
  sub_2188A6098();
  return sub_2188A60A4();
}

_QWORD *sub_21889B4A8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

void sub_21889B4D8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_21889B4E4()
{
  sub_21889B59C();
  return sub_2188A5DD4();
}

uint64_t sub_21889B540()
{
  sub_21889B59C();
  return sub_2188A5DC8();
}

ValueMetadata *type metadata accessor for MKScope()
{
  return &type metadata for MKScope;
}

unint64_t sub_21889B59C()
{
  unint64_t result;

  result = qword_254FFCD10;
  if (!qword_254FFCD10)
  {
    result = MEMORY[0x219A1BFE8](&protocol conformance descriptor for MKScope, &type metadata for MKScope);
    atomic_store(result, (unint64_t *)&qword_254FFCD10);
  }
  return result;
}

void sub_21889B5E0()
{
  qword_254FFEE68 = 0x4B646567616E614DLL;
  unk_254FFEE70 = 0xEF6E696168637965;
}

void sub_21889B610(void **a1, id a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22[8];

  v22[7] = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend(a2, sel_restorePersonaWithSavedPersonaContext_);
  swift_beginAccess();
  v9 = *a1;
  *a1 = v8;

  swift_beginAccess();
  if (*a1)
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v10 = sub_2188A5C9C();
    __swift_project_value_buffer(v10, (uint64_t)qword_254FFEE30);
    v11 = sub_2188A5C84();
    v12 = sub_2188A5E58();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v13 = 138412290;
      swift_beginAccess();
      v15 = *a1;
      if (v15)
      {
        v16 = v15;
        v15 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v22[0] = (uint64_t)v15;
      }
      else
      {
        v22[0] = 0;
      }
      sub_2188A5EC4();
      *v14 = v15;
      _os_log_impl(&dword_21885E000, v11, v12, "Failed to restore previous persona: %@", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v14, -1, -1);
      MEMORY[0x219A1C06C](v13, -1, -1);
    }

  }
  if (qword_254FFC850 != -1)
    swift_once();
  v17 = sub_2188A5C9C();
  __swift_project_value_buffer(v17, (uint64_t)qword_254FFEE30);
  swift_bridgeObjectRetain_n();
  v18 = sub_2188A5C84();
  v19 = sub_2188A5E40();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v22[0] = v21;
    *(_DWORD *)v20 = 136315138;
    swift_bridgeObjectRetain();
    sub_2188A17DC(a4, a5, v22);
    sub_2188A5EC4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21885E000, v18, v19, "Switched away from persona: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1C06C](v21, -1, -1);
    MEMORY[0x219A1C06C](v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_21889B98C(uint64_t a1, id a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  void **v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23[8];

  v23[7] = *MEMORY[0x24BDAC8D0];
  v8 = (void **)(a1 + 16);
  v9 = objc_msgSend(a2, sel_restorePersonaWithSavedPersonaContext_);
  swift_beginAccess();
  v10 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v9;

  swift_beginAccess();
  if (*(_QWORD *)(a1 + 16))
  {
    if (qword_254FFC850 != -1)
      swift_once();
    v11 = sub_2188A5C9C();
    __swift_project_value_buffer(v11, (uint64_t)qword_254FFEE30);
    swift_retain_n();
    v12 = sub_2188A5C84();
    v13 = sub_2188A5E58();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v14 = 138412290;
      swift_beginAccess();
      v16 = *v8;
      if (v16)
      {
        v17 = v16;
        v16 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v23[0] = (uint64_t)v16;
      }
      else
      {
        v23[0] = 0;
      }
      sub_2188A5EC4();
      *v15 = v16;
      swift_release_n();
      _os_log_impl(&dword_21885E000, v12, v13, "Failed to restore previous persona: %@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v15, -1, -1);
      MEMORY[0x219A1C06C](v14, -1, -1);

    }
    else
    {

      swift_release_n();
    }
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v18 = sub_2188A5C9C();
  __swift_project_value_buffer(v18, (uint64_t)qword_254FFEE30);
  swift_bridgeObjectRetain_n();
  v19 = sub_2188A5C84();
  v20 = sub_2188A5E40();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23[0] = v22;
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain();
    sub_2188A17DC(a4, a5, v23);
    sub_2188A5EC4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21885E000, v19, v20, "Switched away from persona: %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1C06C](v22, -1, -1);
    MEMORY[0x219A1C06C](v21, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t type metadata accessor for MKUtility()
{
  return objc_opt_self();
}

void sub_21889BD58(uint64_t a1, unint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5)
{
  sub_21889EA5C(a1, a2, a3, a4, a5, (uint64_t (*)(void *, uint64_t))MEMORY[0x24BDE8A78]);
}

void sub_21889BDA8(uint64_t a1, unint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5)
{
  sub_21889EA5C(a1, a2, a3, a4, a5, (uint64_t (*)(void *, uint64_t))MEMORY[0x24BDE8A70]);
}

void sub_21889BDF8(uint64_t a1, unint64_t a2, OSStatus *a3, uint64_t a4, CFTypeRef *a5)
{
  sub_21889E1D8(a1, a2, a3, a4, a5);
}

void sub_21889BE40(uint64_t a1, unint64_t a2, OSStatus *a3)
{
  sub_21889D990(a1, a2, a3);
}

void sub_21889BE88(uint64_t a1, unint64_t a2, OSStatus *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  id v29;
  void *v30;
  const __CFDictionary *v31;
  OSStatus v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  const __CFDictionary *v38;
  OSStatus v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  const __CFDictionary *v54;
  OSStatus v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  OSStatus *v61;
  uint64_t v62;
  id v63;
  id v64[3];
  id v65[2];

  v65[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    swift_bridgeObjectRetain();
    v31 = (const __CFDictionary *)sub_2188A5CF0();
    swift_bridgeObjectRelease();
    v32 = SecItemAdd(v31, 0);

    *a3 = v32;
    return;
  }
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBF268]), sel_init);
  v7 = objc_msgSend(v6, sel_currentPersona);
  if (v7)
  {
    v8 = v7;
    v62 = a1;
    v9 = objc_msgSend(v7, sel_userPersonaUniqueString);
    if (v9)
    {
      v10 = v9;
      v11 = v8;
      v12 = v6;
      v13 = sub_2188A5D20();
      v15 = v14;

      if (v13 == v62 && v15 == a2)
      {
        swift_bridgeObjectRelease();
        v6 = v12;
        v8 = v11;
      }
      else
      {
        v17 = sub_2188A6038();
        swift_bridgeObjectRelease();
        v6 = v12;
        v8 = v11;
        if ((v17 & 1) == 0)
          goto LABEL_9;
      }
      swift_bridgeObjectRetain();
      v38 = (const __CFDictionary *)sub_2188A5CF0();
      swift_bridgeObjectRelease();
      v39 = SecItemAdd(v38, 0);

      *a3 = v39;
      return;
    }
LABEL_9:
    v65[0] = 0;
    v64[0] = 0;
    v18 = objc_msgSend(v8, sel_copyCurrentPersonaContextWithError_, v64);
    v19 = v64[0];
    if (v18)
    {
      v61 = a3;
      v20 = v18;
      v21 = v19;
      v22 = (void *)sub_2188A5D14();
      v23 = objc_msgSend(v8, sel_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_, v22);

      if (v23)
      {

        v65[0] = v23;
        if (qword_254FFC850 != -1)
          swift_once();
        v24 = sub_2188A5C9C();
        __swift_project_value_buffer(v24, (uint64_t)qword_254FFEE30);
        v25 = sub_2188A5C84();
        v26 = sub_2188A5E58();
        if (os_log_type_enabled(v25, v26))
        {
          v63 = v20;
          v27 = (uint8_t *)swift_slowAlloc();
          v28 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v27 = 138412290;
          swift_beginAccess();
          if (v65[0])
          {
            v29 = v65[0];
            v30 = (void *)_swift_stdlib_bridgeErrorToNSError();
            v64[0] = v30;
            sub_2188A5EC4();
          }
          else
          {
            v64[0] = 0;
            sub_2188A5EC4();
            v30 = 0;
          }
          *v28 = v30;
          _os_log_impl(&dword_21885E000, v25, v26, "Failed adopting persona: %@", v27, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v28, -1, -1);
          MEMORY[0x219A1C06C](v27, -1, -1);
          v20 = v63;
        }

        swift_beginAccess();
        v56 = v65[0];
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v57 = v56;
        *(_QWORD *)(v57 + 8) = 0;
        *(_BYTE *)(v57 + 16) = 1;
        v58 = v56;
        swift_willThrow();

      }
      else
      {
        v60 = v6;
        v65[0] = 0;
        if (qword_254FFC850 != -1)
          swift_once();
        v49 = sub_2188A5C9C();
        __swift_project_value_buffer(v49, (uint64_t)qword_254FFEE30);
        swift_bridgeObjectRetain_n();
        v50 = sub_2188A5C84();
        v51 = sub_2188A5E40();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          v59 = (void *)swift_slowAlloc();
          v64[0] = v59;
          *(_DWORD *)v52 = 136315138;
          swift_bridgeObjectRetain();
          v53 = v62;
          sub_2188A17DC(v62, a2, (uint64_t *)v64);
          sub_2188A5EC4();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21885E000, v50, v51, "Adopted persona: %s", v52, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v59, -1, -1);
          MEMORY[0x219A1C06C](v52, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          v53 = v62;
        }
        swift_bridgeObjectRetain();
        v54 = (const __CFDictionary *)sub_2188A5CF0();
        swift_bridgeObjectRelease();
        v55 = SecItemAdd(v54, 0);

        *v61 = v55;
        sub_21889B610(v65, v8, (uint64_t)v20, v53, a2);

      }
    }
    else
    {
      v40 = v6;
      v41 = v64[0];
      v42 = (void *)sub_2188A5BDC();

      swift_willThrow();
      if (qword_254FFC850 != -1)
        swift_once();
      v43 = sub_2188A5C9C();
      __swift_project_value_buffer(v43, (uint64_t)qword_254FFEE30);
      v44 = sub_2188A5C84();
      v45 = sub_2188A5E58();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_21885E000, v44, v45, "Failed to copy current persona context", v46, 2u);
        MEMORY[0x219A1C06C](v46, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v47 = v42;
      *(_QWORD *)(v47 + 8) = 0;
      *(_BYTE *)(v47 + 16) = 1;
      v48 = v42;
      swift_willThrow();

    }
    return;
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v33 = sub_2188A5C9C();
  __swift_project_value_buffer(v33, (uint64_t)qword_254FFEE30);
  v34 = sub_2188A5C84();
  v35 = sub_2188A5E58();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v36 = 0;
    _os_log_impl(&dword_21885E000, v34, v35, "No current persona", v36, 2u);
    MEMORY[0x219A1C06C](v36, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v37 = xmmword_2188A86A0;
  *(_BYTE *)(v37 + 16) = 9;
  swift_willThrow();

}

void sub_21889C6DC(uint64_t a1, unint64_t a2, void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, _QWORD *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned int a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  void *v47;
  uint8_t *v48;
  _QWORD *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  NSObject *log;
  void *v79;
  uint64_t v80;
  void **v81;
  void **v82;
  id v87[5];

  v21 = a6;
  v87[3] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v52 = sub_218894AE8(a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
    if (v20)
    {
      swift_bridgeObjectRelease();
      return;
    }
    v58 = *a3;
    *a3 = v52;
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBF268]), sel_init);
  v25 = objc_msgSend(v24, sel_currentPersona);
  if (v25)
  {
    v26 = v25;
    v82 = a3;
    v27 = objc_msgSend(v25, sel_userPersonaUniqueString);
    if (!v27)
      goto LABEL_9;
    v28 = v27;
    v29 = v26;
    v30 = v24;
    v31 = v21;
    v32 = sub_2188A5D20();
    v34 = v33;

    if (v32 == a1 && v34 == a2)
    {
      swift_bridgeObjectRelease();
      v21 = v31;
      v24 = v30;
      v26 = v29;
    }
    else
    {
      v36 = sub_2188A6038();
      swift_bridgeObjectRelease();
      v21 = v31;
      v24 = v30;
      v26 = v29;
      if ((v36 & 1) == 0)
      {
LABEL_9:
        v37 = swift_allocObject();
        *(_QWORD *)(v37 + 16) = 0;
        v87[0] = 0;
        v38 = objc_msgSend(v26, sel_copyCurrentPersonaContextWithError_, v87);
        v39 = v87[0];
        if (v38)
        {
          v80 = v37;
          v81 = (void **)(v37 + 16);
          v40 = v38;
          v41 = v39;
          v42 = (void *)sub_2188A5D14();
          v43 = objc_msgSend(v26, sel_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_, v42);

          if (v43)
          {

            *v81 = v43;
            if (qword_254FFC850 != -1)
              swift_once();
            v44 = sub_2188A5C9C();
            __swift_project_value_buffer(v44, (uint64_t)qword_254FFEE30);
            v45 = sub_2188A5C84();
            v46 = sub_2188A5E58();
            if (os_log_type_enabled(v45, v46))
            {
              v47 = v26;
              v48 = (uint8_t *)swift_slowAlloc();
              v49 = (_QWORD *)swift_slowAlloc();
              *(_DWORD *)v48 = 138412290;
              swift_beginAccess();
              v50 = *v81;
              if (*v81)
              {
                v51 = v50;
                v50 = (void *)_swift_stdlib_bridgeErrorToNSError();
                v87[0] = v50;
              }
              else
              {
                v87[0] = 0;
              }
              sub_2188A5EC4();
              *v49 = v50;
              _os_log_impl(&dword_21885E000, v45, v46, "Failed adopting persona: %@", v48, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
              swift_arrayDestroy();
              MEMORY[0x219A1C06C](v49, -1, -1);
              MEMORY[0x219A1C06C](v48, -1, -1);
              v26 = v47;
            }

            swift_beginAccess();
            v75 = *(void **)(v80 + 16);
            sub_21887B0BC();
            swift_allocError();
            *(_QWORD *)v76 = v75;
            *(_QWORD *)(v76 + 8) = 0;
            *(_BYTE *)(v76 + 16) = 1;
            v77 = v75;
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_release();

          }
          else
          {
            v79 = v40;
            *v81 = 0;
            if (qword_254FFC850 != -1)
              swift_once();
            v68 = sub_2188A5C9C();
            __swift_project_value_buffer(v68, (uint64_t)qword_254FFEE30);
            swift_bridgeObjectRetain_n();
            v69 = sub_2188A5C84();
            v70 = sub_2188A5E40();
            if (os_log_type_enabled(v69, v70))
            {
              v71 = (uint8_t *)swift_slowAlloc();
              log = v69;
              v72 = (void *)swift_slowAlloc();
              v87[0] = v72;
              *(_DWORD *)v71 = 136315138;
              swift_bridgeObjectRetain();
              sub_2188A17DC(a1, a2, (uint64_t *)v87);
              sub_2188A5EC4();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_21885E000, log, v70, "Adopted persona: %s", v71, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x219A1C06C](v72, -1, -1);
              MEMORY[0x219A1C06C](v71, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            v73 = sub_218894AE8(a5, v21, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
            if (!v20)
            {
              v74 = *v82;
              *v82 = v73;

            }
            sub_21889B98C(v80, v26, (uint64_t)v79, a1, a2);
            swift_bridgeObjectRelease();
            swift_release();

          }
        }
        else
        {
          v60 = v87[0];
          v61 = (void *)sub_2188A5BDC();

          swift_willThrow();
          if (qword_254FFC850 != -1)
            swift_once();
          v62 = sub_2188A5C9C();
          __swift_project_value_buffer(v62, (uint64_t)qword_254FFEE30);
          v63 = sub_2188A5C84();
          v64 = sub_2188A5E58();
          if (os_log_type_enabled(v63, v64))
          {
            v65 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v65 = 0;
            _os_log_impl(&dword_21885E000, v63, v64, "Failed to copy current persona context", v65, 2u);
            MEMORY[0x219A1C06C](v65, -1, -1);
          }

          sub_21887B0BC();
          swift_allocError();
          *(_QWORD *)v66 = v61;
          *(_QWORD *)(v66 + 8) = 0;
          *(_BYTE *)(v66 + 16) = 1;
          v67 = v61;
          swift_willThrow();

          swift_bridgeObjectRelease();
          swift_release();
        }
        return;
      }
    }
    v59 = sub_218894AE8(a5, v21, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
    if (v20)
    {
      swift_bridgeObjectRelease();

      return;
    }
    v58 = *v82;
    *v82 = v59;
    swift_bridgeObjectRelease();

LABEL_33:
    return;
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v53 = sub_2188A5C9C();
  __swift_project_value_buffer(v53, (uint64_t)qword_254FFEE30);
  v54 = sub_2188A5C84();
  v55 = sub_2188A5E58();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v56 = 0;
    _os_log_impl(&dword_21885E000, v54, v55, "No current persona", v56, 2u);
    MEMORY[0x219A1C06C](v56, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v57 = xmmword_2188A86A0;
  *(_BYTE *)(v57 + 16) = 9;
  swift_willThrow();
  swift_bridgeObjectRelease();

}

void sub_21889D014(uint64_t a1, unint64_t a2, void **a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, NSObject *a8, uint64_t a9, unint64_t a10, char a11, uint64_t a12, uint64_t a13, id *a14, void **a15, unsigned __int8 *a16, char a17)
{
  uint64_t v17;
  uint64_t v18;
  unint64_t v22;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void **v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  _QWORD *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  id v81;
  NSObject *log;
  void **v83;
  void *v84;
  void **v85;
  uint64_t v86;
  void *v87;
  id v91[5];

  v18 = v17;
  v22 = a5;
  v91[3] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v55 = sub_21887B6F8(a4, a5, a6, a7, a8, a9, a10, a11 & 1, a12, a13, a14, a15, *a16, a17 & 1);
    if (v17)
    {
      swift_bridgeObjectRelease();
      return;
    }
    v61 = *a3;
    *a3 = (void *)v55;
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBF268]), sel_init);
  v25 = objc_msgSend(v24, sel_currentPersona);
  if (v25)
  {
    v26 = v25;
    v86 = a6;
    v87 = v24;
    v27 = objc_msgSend(v25, sel_userPersonaUniqueString);
    if (!v27)
      goto LABEL_9;
    v28 = v27;
    v29 = a3;
    v30 = v26;
    v31 = v22;
    v32 = sub_2188A5D20();
    v34 = v33;

    if (v32 == a1 && v34 == a2)
    {
      swift_bridgeObjectRelease();
      v22 = v31;
      v26 = v30;
      a3 = v29;
      v18 = v17;
    }
    else
    {
      v36 = sub_2188A6038();
      swift_bridgeObjectRelease();
      v22 = v31;
      v26 = v30;
      a3 = v29;
      v18 = v17;
      if ((v36 & 1) == 0)
      {
LABEL_9:
        v37 = swift_allocObject();
        *(_QWORD *)(v37 + 16) = 0;
        v91[0] = 0;
        v38 = objc_msgSend(v26, sel_copyCurrentPersonaContextWithError_, v91);
        v39 = v91[0];
        if (v38)
        {
          v85 = (void **)(v37 + 16);
          v83 = a3;
          v40 = v38;
          v41 = v39;
          v42 = (void *)sub_2188A5D14();
          v43 = objc_msgSend(v26, sel_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_, v42);

          if (v43)
          {
            v44 = v37;
            v45 = v26;

            *v85 = v43;
            v46 = v87;
            v47 = v40;
            if (qword_254FFC850 != -1)
              swift_once();
            v48 = sub_2188A5C9C();
            __swift_project_value_buffer(v48, (uint64_t)qword_254FFEE30);
            v49 = sub_2188A5C84();
            v50 = sub_2188A5E58();
            if (os_log_type_enabled(v49, v50))
            {
              v51 = (uint8_t *)swift_slowAlloc();
              v52 = (_QWORD *)swift_slowAlloc();
              *(_DWORD *)v51 = 138412290;
              swift_beginAccess();
              v53 = *v85;
              if (*v85)
              {
                v54 = v53;
                v53 = (void *)_swift_stdlib_bridgeErrorToNSError();
                v91[0] = v53;
              }
              else
              {
                v91[0] = 0;
              }
              sub_2188A5EC4();
              *v52 = v53;
              _os_log_impl(&dword_21885E000, v49, v50, "Failed adopting persona: %@", v51, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
              swift_arrayDestroy();
              MEMORY[0x219A1C06C](v52, -1, -1);
              MEMORY[0x219A1C06C](v51, -1, -1);
              v46 = v87;
            }

            swift_beginAccess();
            v79 = *(void **)(v44 + 16);
            sub_21887B0BC();
            swift_allocError();
            *(_QWORD *)v80 = v79;
            *(_QWORD *)(v80 + 8) = 0;
            *(_BYTE *)(v80 + 16) = 1;
            v81 = v79;
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_release();

          }
          else
          {
            v84 = v40;
            *v85 = 0;
            if (qword_254FFC850 != -1)
              swift_once();
            v72 = sub_2188A5C9C();
            __swift_project_value_buffer(v72, (uint64_t)qword_254FFEE30);
            swift_bridgeObjectRetain_n();
            v73 = sub_2188A5C84();
            v74 = sub_2188A5E40();
            if (os_log_type_enabled(v73, v74))
            {
              v75 = (uint8_t *)swift_slowAlloc();
              log = v73;
              v76 = (void *)swift_slowAlloc();
              v91[0] = v76;
              *(_DWORD *)v75 = 136315138;
              swift_bridgeObjectRetain();
              sub_2188A17DC(a1, a2, (uint64_t *)v91);
              sub_2188A5EC4();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_21885E000, log, v74, "Adopted persona: %s", v75, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x219A1C06C](v76, -1, -1);
              MEMORY[0x219A1C06C](v75, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            v77 = sub_21887B6F8(a4, v22, v86, a7, a8, a9, a10, a11 & 1, a12, a13, a14, a15, *a16, a17 & 1);
            if (!v18)
            {
              v78 = *v83;
              *v83 = (void *)v77;

            }
            sub_21889B98C(v37, v26, (uint64_t)v84, a1, a2);
            swift_bridgeObjectRelease();
            swift_release();

          }
        }
        else
        {
          v63 = v26;
          v64 = v91[0];
          v65 = (void *)sub_2188A5BDC();

          swift_willThrow();
          if (qword_254FFC850 != -1)
            swift_once();
          v66 = sub_2188A5C9C();
          __swift_project_value_buffer(v66, (uint64_t)qword_254FFEE30);
          v67 = sub_2188A5C84();
          v68 = sub_2188A5E58();
          if (os_log_type_enabled(v67, v68))
          {
            v69 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v69 = 0;
            _os_log_impl(&dword_21885E000, v67, v68, "Failed to copy current persona context", v69, 2u);
            MEMORY[0x219A1C06C](v69, -1, -1);
          }

          sub_21887B0BC();
          swift_allocError();
          *(_QWORD *)v70 = v65;
          *(_QWORD *)(v70 + 8) = 0;
          *(_BYTE *)(v70 + 16) = 1;
          v71 = v65;
          swift_willThrow();

          swift_bridgeObjectRelease();
          swift_release();
        }
        return;
      }
    }
    v62 = sub_21887B6F8(a4, v22, a6, a7, a8, a9, a10, a11 & 1, a12, a13, a14, a15, *a16, a17 & 1);
    if (v18)
    {
      swift_bridgeObjectRelease();

      return;
    }
    v61 = *a3;
    *a3 = (void *)v62;
    swift_bridgeObjectRelease();

LABEL_33:
    return;
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v56 = sub_2188A5C9C();
  __swift_project_value_buffer(v56, (uint64_t)qword_254FFEE30);
  v57 = sub_2188A5C84();
  v58 = sub_2188A5E58();
  if (os_log_type_enabled(v57, v58))
  {
    v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v59 = 0;
    _os_log_impl(&dword_21885E000, v57, v58, "No current persona", v59, 2u);
    MEMORY[0x219A1C06C](v59, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v60 = xmmword_2188A86A0;
  *(_BYTE *)(v60 + 16) = 9;
  swift_willThrow();
  swift_bridgeObjectRelease();

}

void sub_21889D990(uint64_t a1, unint64_t a2, OSStatus *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  id v29;
  void *v30;
  const __CFDictionary *v31;
  OSStatus v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  const __CFDictionary *v38;
  OSStatus v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  const __CFDictionary *v54;
  OSStatus v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  OSStatus *v61;
  uint64_t v62;
  id v63;
  id v64[3];
  id v65[2];

  v65[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    swift_bridgeObjectRetain();
    v31 = (const __CFDictionary *)sub_2188A5CF0();
    swift_bridgeObjectRelease();
    v32 = SecItemDelete(v31);

    *a3 = v32;
    return;
  }
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBF268]), sel_init);
  v7 = objc_msgSend(v6, sel_currentPersona);
  if (v7)
  {
    v8 = v7;
    v62 = a1;
    v9 = objc_msgSend(v7, sel_userPersonaUniqueString);
    if (v9)
    {
      v10 = v9;
      v11 = v8;
      v12 = v6;
      v13 = sub_2188A5D20();
      v15 = v14;

      if (v13 == v62 && v15 == a2)
      {
        swift_bridgeObjectRelease();
        v6 = v12;
        v8 = v11;
      }
      else
      {
        v17 = sub_2188A6038();
        swift_bridgeObjectRelease();
        v6 = v12;
        v8 = v11;
        if ((v17 & 1) == 0)
          goto LABEL_9;
      }
      swift_bridgeObjectRetain();
      v38 = (const __CFDictionary *)sub_2188A5CF0();
      swift_bridgeObjectRelease();
      v39 = SecItemDelete(v38);

      *a3 = v39;
      return;
    }
LABEL_9:
    v65[0] = 0;
    v64[0] = 0;
    v18 = objc_msgSend(v8, sel_copyCurrentPersonaContextWithError_, v64);
    v19 = v64[0];
    if (v18)
    {
      v61 = a3;
      v20 = v18;
      v21 = v19;
      v22 = (void *)sub_2188A5D14();
      v23 = objc_msgSend(v8, sel_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_, v22);

      if (v23)
      {

        v65[0] = v23;
        if (qword_254FFC850 != -1)
          swift_once();
        v24 = sub_2188A5C9C();
        __swift_project_value_buffer(v24, (uint64_t)qword_254FFEE30);
        v25 = sub_2188A5C84();
        v26 = sub_2188A5E58();
        if (os_log_type_enabled(v25, v26))
        {
          v63 = v20;
          v27 = (uint8_t *)swift_slowAlloc();
          v28 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v27 = 138412290;
          swift_beginAccess();
          if (v65[0])
          {
            v29 = v65[0];
            v30 = (void *)_swift_stdlib_bridgeErrorToNSError();
            v64[0] = v30;
            sub_2188A5EC4();
          }
          else
          {
            v64[0] = 0;
            sub_2188A5EC4();
            v30 = 0;
          }
          *v28 = v30;
          _os_log_impl(&dword_21885E000, v25, v26, "Failed adopting persona: %@", v27, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v28, -1, -1);
          MEMORY[0x219A1C06C](v27, -1, -1);
          v20 = v63;
        }

        swift_beginAccess();
        v56 = v65[0];
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v57 = v56;
        *(_QWORD *)(v57 + 8) = 0;
        *(_BYTE *)(v57 + 16) = 1;
        v58 = v56;
        swift_willThrow();

      }
      else
      {
        v60 = v6;
        v65[0] = 0;
        if (qword_254FFC850 != -1)
          swift_once();
        v49 = sub_2188A5C9C();
        __swift_project_value_buffer(v49, (uint64_t)qword_254FFEE30);
        swift_bridgeObjectRetain_n();
        v50 = sub_2188A5C84();
        v51 = sub_2188A5E40();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          v59 = (void *)swift_slowAlloc();
          v64[0] = v59;
          *(_DWORD *)v52 = 136315138;
          swift_bridgeObjectRetain();
          v53 = v62;
          sub_2188A17DC(v62, a2, (uint64_t *)v64);
          sub_2188A5EC4();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21885E000, v50, v51, "Adopted persona: %s", v52, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v59, -1, -1);
          MEMORY[0x219A1C06C](v52, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          v53 = v62;
        }
        swift_bridgeObjectRetain();
        v54 = (const __CFDictionary *)sub_2188A5CF0();
        swift_bridgeObjectRelease();
        v55 = SecItemDelete(v54);

        *v61 = v55;
        sub_21889B610(v65, v8, (uint64_t)v20, v53, a2);

      }
    }
    else
    {
      v40 = v6;
      v41 = v64[0];
      v42 = (void *)sub_2188A5BDC();

      swift_willThrow();
      if (qword_254FFC850 != -1)
        swift_once();
      v43 = sub_2188A5C9C();
      __swift_project_value_buffer(v43, (uint64_t)qword_254FFEE30);
      v44 = sub_2188A5C84();
      v45 = sub_2188A5E58();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_21885E000, v44, v45, "Failed to copy current persona context", v46, 2u);
        MEMORY[0x219A1C06C](v46, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v47 = v42;
      *(_QWORD *)(v47 + 8) = 0;
      *(_BYTE *)(v47 + 16) = 1;
      v48 = v42;
      swift_willThrow();

    }
    return;
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v33 = sub_2188A5C9C();
  __swift_project_value_buffer(v33, (uint64_t)qword_254FFEE30);
  v34 = sub_2188A5C84();
  v35 = sub_2188A5E58();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v36 = 0;
    _os_log_impl(&dword_21885E000, v34, v35, "No current persona", v36, 2u);
    MEMORY[0x219A1C06C](v36, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v37 = xmmword_2188A86A0;
  *(_BYTE *)(v37 + 16) = 9;
  swift_willThrow();

}

void sub_21889E1D8(uint64_t a1, unint64_t a2, OSStatus *a3, uint64_t a4, CFTypeRef *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  id v29;
  void *v30;
  const __CFDictionary *v31;
  OSStatus v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  id v36;
  uint8_t *v37;
  uint8_t *v38;
  uint64_t v39;
  const __CFDictionary *v40;
  OSStatus v41;
  id v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  void *v54;
  const __CFDictionary *v55;
  OSStatus v56;
  id v57;
  uint64_t v58;
  id v59;
  NSObject *log;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65[4];

  v65[3] = *(id *)MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    swift_bridgeObjectRetain();
    v31 = (const __CFDictionary *)sub_2188A5CF0();
    swift_bridgeObjectRelease();
    v32 = SecItemCopyMatching(v31, a5);

    swift_beginAccess();
    *a3 = v32;
    return;
  }
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBF268]), sel_init);
  v10 = objc_msgSend(v9, sel_currentPersona);
  if (v10)
  {
    v62 = v9;
    v63 = v10;
    v11 = objc_msgSend(v10, sel_userPersonaUniqueString);
    if (v11)
    {
      v12 = v11;
      v13 = sub_2188A5D20();
      v15 = v14;

      if (v13 == a1 && v15 == a2)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v17 = sub_2188A6038();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0)
          goto LABEL_9;
      }
      swift_bridgeObjectRetain();
      v40 = (const __CFDictionary *)sub_2188A5CF0();
      swift_bridgeObjectRelease();
      v41 = SecItemCopyMatching(v40, a5);

      swift_beginAccess();
      *a3 = v41;

      return;
    }
LABEL_9:
    v64 = 0;
    v65[0] = 0;
    v18 = objc_msgSend(v63, sel_copyCurrentPersonaContextWithError_, v65);
    v19 = v65[0];
    if (v18)
    {
      v20 = v18;
      v21 = v19;
      v22 = (void *)sub_2188A5D14();
      v23 = objc_msgSend(v63, sel_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_, v22);

      if (v23)
      {

        v64 = v23;
        if (qword_254FFC850 != -1)
          swift_once();
        v24 = sub_2188A5C9C();
        __swift_project_value_buffer(v24, (uint64_t)qword_254FFEE30);
        v25 = sub_2188A5C84();
        v26 = sub_2188A5E58();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = (uint8_t *)swift_slowAlloc();
          v28 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v27 = 138412290;
          swift_beginAccess();
          if (v64)
          {
            v29 = v64;
            v30 = (void *)_swift_stdlib_bridgeErrorToNSError();
            v65[0] = v30;
            sub_2188A5EC4();
          }
          else
          {
            v65[0] = 0;
            sub_2188A5EC4();
            v30 = 0;
          }
          *v28 = v30;
          _os_log_impl(&dword_21885E000, v25, v26, "Failed adopting persona: %@", v27, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v28, -1, -1);
          MEMORY[0x219A1C06C](v27, -1, -1);
        }

        swift_beginAccess();
        v57 = v64;
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v58 = v64;
        *(_QWORD *)(v58 + 8) = 0;
        *(_BYTE *)(v58 + 16) = 1;
        v59 = v57;
        swift_willThrow();

      }
      else
      {
        v61 = v20;
        v64 = 0;
        if (qword_254FFC850 != -1)
          swift_once();
        v50 = sub_2188A5C9C();
        __swift_project_value_buffer(v50, (uint64_t)qword_254FFEE30);
        swift_bridgeObjectRetain_n();
        v51 = sub_2188A5C84();
        v52 = sub_2188A5E40();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = (uint8_t *)swift_slowAlloc();
          log = v51;
          v54 = (void *)swift_slowAlloc();
          v65[0] = v54;
          *(_DWORD *)v53 = 136315138;
          swift_bridgeObjectRetain();
          sub_2188A17DC(a1, a2, (uint64_t *)v65);
          sub_2188A5EC4();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21885E000, log, v52, "Adopted persona: %s", v53, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v54, -1, -1);
          MEMORY[0x219A1C06C](v53, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        swift_bridgeObjectRetain();
        v55 = (const __CFDictionary *)sub_2188A5CF0();
        swift_bridgeObjectRelease();
        v56 = SecItemCopyMatching(v55, a5);

        swift_beginAccess();
        *a3 = v56;
        sub_21889B610(&v64, v63, (uint64_t)v61, a1, a2);

      }
    }
    else
    {
      v42 = v65[0];
      v43 = (void *)sub_2188A5BDC();

      swift_willThrow();
      if (qword_254FFC850 != -1)
        swift_once();
      v44 = sub_2188A5C9C();
      __swift_project_value_buffer(v44, (uint64_t)qword_254FFEE30);
      v45 = sub_2188A5C84();
      v46 = sub_2188A5E58();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v47 = 0;
        _os_log_impl(&dword_21885E000, v45, v46, "Failed to copy current persona context", v47, 2u);
        MEMORY[0x219A1C06C](v47, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v48 = v43;
      *(_QWORD *)(v48 + 8) = 0;
      *(_BYTE *)(v48 + 16) = 1;
      v49 = v43;
      swift_willThrow();

    }
    return;
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v33 = sub_2188A5C9C();
  __swift_project_value_buffer(v33, (uint64_t)qword_254FFEE30);
  v34 = sub_2188A5C84();
  v35 = sub_2188A5E58();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = v9;
    v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v37 = 0;
    _os_log_impl(&dword_21885E000, v34, v35, "No current persona", v37, 2u);
    v38 = v37;
    v9 = v36;
    MEMORY[0x219A1C06C](v38, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v39 = xmmword_2188A86A0;
  *(_BYTE *)(v39 + 16) = 9;
  swift_willThrow();

}

void sub_21889EA5C(uint64_t a1, unint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void *, uint64_t))
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  void *v42;
  int v43;
  id v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  _DWORD *v63;
  uint64_t (*v64)(void *, uint64_t);
  void *v65;
  id v66;
  id v67[3];
  void *v68[2];

  v68[1] = *(void **)MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    swift_bridgeObjectRetain();
    v35 = (void *)sub_2188A5CF0();
    swift_bridgeObjectRelease();
    v36 = a6(v35, a5);

    *a3 = v36;
    return;
  }
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBF268]), sel_init);
  v12 = objc_msgSend(v11, sel_currentPersona);
  if (v12)
  {
    v64 = a6;
    v65 = v11;
    v66 = v12;
    v13 = objc_msgSend(v12, sel_userPersonaUniqueString);
    if (v13)
    {
      v14 = v13;
      v15 = sub_2188A5D20();
      v17 = v16;

      if (v15 == a1 && v17 == a2)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v19 = sub_2188A6038();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0)
          goto LABEL_9;
      }
      swift_bridgeObjectRetain();
      v42 = (void *)sub_2188A5CF0();
      swift_bridgeObjectRelease();
      v43 = v64(v42, a5);

      *a3 = v43;
      return;
    }
LABEL_9:
    v68[0] = 0;
    v67[0] = 0;
    v20 = objc_msgSend(v66, sel_copyCurrentPersonaContextWithError_, v67);
    v21 = v67[0];
    if (v20)
    {
      v63 = a3;
      v22 = v20;
      v23 = v21;
      v24 = (void *)sub_2188A5D14();
      v25 = objc_msgSend(v66, sel_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_, v24);

      if (v25)
      {

        v68[0] = v25;
        v26 = v65;
        v27 = v22;
        if (qword_254FFC850 != -1)
          swift_once();
        v28 = sub_2188A5C9C();
        __swift_project_value_buffer(v28, (uint64_t)qword_254FFEE30);
        v29 = sub_2188A5C84();
        v30 = sub_2188A5E58();
        if (os_log_type_enabled(v29, v30))
        {
          v31 = (uint8_t *)swift_slowAlloc();
          v32 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v31 = 138412290;
          swift_beginAccess();
          if (v68[0])
          {
            v33 = v68[0];
            v34 = (void *)_swift_stdlib_bridgeErrorToNSError();
            v67[0] = v34;
            sub_2188A5EC4();
          }
          else
          {
            v67[0] = 0;
            sub_2188A5EC4();
            v34 = 0;
          }
          *v32 = v34;
          _os_log_impl(&dword_21885E000, v29, v30, "Failed adopting persona: %@", v31, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC998);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v32, -1, -1);
          MEMORY[0x219A1C06C](v31, -1, -1);
          v26 = v65;
        }

        swift_beginAccess();
        v59 = v68[0];
        sub_21887B0BC();
        swift_allocError();
        *(_QWORD *)v60 = v59;
        *(_QWORD *)(v60 + 8) = 0;
        *(_BYTE *)(v60 + 16) = 1;
        v61 = v59;
        swift_willThrow();

      }
      else
      {
        v62 = v22;
        v68[0] = 0;
        if (qword_254FFC850 != -1)
          swift_once();
        v52 = sub_2188A5C9C();
        __swift_project_value_buffer(v52, (uint64_t)qword_254FFEE30);
        swift_bridgeObjectRetain_n();
        v53 = sub_2188A5C84();
        v54 = sub_2188A5E40();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = (uint8_t *)swift_slowAlloc();
          v56 = (void *)swift_slowAlloc();
          v67[0] = v56;
          *(_DWORD *)v55 = 136315138;
          swift_bridgeObjectRetain();
          sub_2188A17DC(a1, a2, (uint64_t *)v67);
          sub_2188A5EC4();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21885E000, v53, v54, "Adopted persona: %s", v55, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v56, -1, -1);
          MEMORY[0x219A1C06C](v55, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        swift_bridgeObjectRetain();
        v57 = (void *)sub_2188A5CF0();
        swift_bridgeObjectRelease();
        v58 = v64(v57, a5);

        *v63 = v58;
        sub_21889B610(v68, v66, (uint64_t)v62, a1, a2);

      }
    }
    else
    {
      v44 = v67[0];
      v45 = (void *)sub_2188A5BDC();

      swift_willThrow();
      if (qword_254FFC850 != -1)
        swift_once();
      v46 = sub_2188A5C9C();
      __swift_project_value_buffer(v46, (uint64_t)qword_254FFEE30);
      v47 = sub_2188A5C84();
      v48 = sub_2188A5E58();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v49 = 0;
        _os_log_impl(&dword_21885E000, v47, v48, "Failed to copy current persona context", v49, 2u);
        MEMORY[0x219A1C06C](v49, -1, -1);
      }

      sub_21887B0BC();
      swift_allocError();
      *(_QWORD *)v50 = v45;
      *(_QWORD *)(v50 + 8) = 0;
      *(_BYTE *)(v50 + 16) = 1;
      v51 = v45;
      swift_willThrow();

    }
    return;
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v37 = sub_2188A5C9C();
  __swift_project_value_buffer(v37, (uint64_t)qword_254FFEE30);
  v38 = sub_2188A5C84();
  v39 = sub_2188A5E58();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    _os_log_impl(&dword_21885E000, v38, v39, "No current persona", v40, 2u);
    MEMORY[0x219A1C06C](v40, -1, -1);
  }

  sub_21887B0BC();
  swift_allocError();
  *(_OWORD *)v41 = xmmword_2188A86A0;
  *(_BYTE *)(v41 + 16) = 9;
  swift_willThrow();

}

uint64_t sub_21889F2B4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21889F2D8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for RMManagedTrustStore()), sel_init);
  qword_254FFCD18 = (uint64_t)result;
  return result;
}

id RMManagedTrustStore.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static RMManagedTrustStore.sharedInstance.getter()
{
  if (qword_254FFC870 != -1)
    swift_once();
  return (id)qword_254FFCD18;
}

uint64_t sub_21889F3A4()
{
  uint64_t v0;

  v0 = sub_2188A5C9C();
  __swift_allocate_value_buffer(v0, qword_254FFEE78);
  __swift_project_value_buffer(v0, (uint64_t)qword_254FFEE78);
  return sub_2188A5C90();
}

uint64_t sub_21889F420(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_21889F498(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(uint64_t, uint64_t))sub_2188A2230);
}

uint64_t sub_21889F470(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_21889F498(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(uint64_t, uint64_t))sub_2188A2834);
}

uint64_t sub_21889F498(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t, uint64_t))
{
  uint64_t v12;
  _OWORD v14[2];
  uint64_t v15;

  v15 = 0;
  memset(v14, 0, sizeof(v14));
  sub_21889F914(a6, a7, a8, (uint64_t)v14, 0, 0);
  sub_21889F7C8((uint64_t)v14);
  type metadata accessor for MKPrimaryKeyCert();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  sub_21887A110(a1, a2);
  a9(v12, a5);
  swift_release();
  return swift_release();
}

uint64_t sub_21889F594(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, void (*a9)(uint64_t, uint64_t))
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD v26[2];
  uint64_t v27;

  v14 = a3;
  v15 = a4;
  v16 = a1;
  v17 = a7;
  v18 = sub_2188A5C3C();
  v20 = v19;

  if (v17)
  {
    v21 = sub_2188A5D20();
    v23 = v22;

  }
  else
  {
    v21 = 0;
    v23 = 0;
  }
  v27 = 0;
  memset(v26, 0, sizeof(v26));
  sub_21889F914(a6, v21, v23, (uint64_t)v26, 0, 0);
  sub_21889F7C8((uint64_t)v26);
  type metadata accessor for MKPrimaryKeyCert();
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v18;
  *(_QWORD *)(v24 + 24) = v20;
  sub_21887A110(v18, v20);
  a9(v24, a5);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_21887A168(v18, v20);
  return 1;
}

id RMManagedTrustStore.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RMManagedTrustStore();
  return objc_msgSendSuper2(&v2, sel_init);
}

id RMManagedTrustStore.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RMManagedTrustStore();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21889F7C8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCD20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for RMManagedTrustStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for RMManagedTrustStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RMManagedTrustStore.setTrust(forCertificateRef:configurationKey:fullTrust:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of RMManagedTrustStore.removeTrust(forCertificateRef:configurationKey:fullTrust:scope:persona:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

void sub_21889F88C()
{
  strcpy((char *)&qword_254FFEE90, "RMTrustStore");
  algn_254FFEE98[5] = 0;
  *(_WORD *)&algn_254FFEE98[6] = -5120;
}

uint64_t sub_21889F8B8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RMTrustStore()
{
  return objc_opt_self();
}

_QWORD *sub_21889F914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v19[24];
  ValueMetadata *v20;
  _UNKNOWN **v21;
  _BYTE v22[24];
  ValueMetadata *v23;
  _UNKNOWN **v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[24];
  ValueMetadata *v28;
  _UNKNOWN **v29;

  sub_21889FB40(a4, (uint64_t)&v25);
  if (v26)
  {
    sub_21889FBF4(&v25, (uint64_t)v27);
    if (a6)
    {
LABEL_3:
      v10 = a6;
      goto LABEL_8;
    }
  }
  else
  {
    v28 = &type metadata for RMTrustStoreBackend;
    v29 = &off_24D967138;
    sub_21889F7C8((uint64_t)&v25);
    if (a6)
      goto LABEL_3;
  }
  if (qword_254FFC880 != -1)
    swift_once();
  a5 = qword_254FFEE90;
  v10 = *(_QWORD *)algn_254FFEE98;
  swift_bridgeObjectRetain();
LABEL_8:
  sub_21889FB88((uint64_t)v27, (uint64_t)&v25);
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v25, v26);
  MEMORY[0x24BDAC7A8](v11);
  (*(void (**)(void))(v12 + 16))();
  v23 = &type metadata for RMTrustStoreBackend;
  v24 = &off_24D967138;
  type metadata accessor for RMTrustStore();
  v13 = (_QWORD *)swift_allocObject();
  v14 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, (uint64_t)&type metadata for RMTrustStoreBackend);
  MEMORY[0x24BDAC7A8](v14);
  (*(void (**)(void))(v15 + 16))();
  v20 = &type metadata for RMTrustStoreBackend;
  v21 = &off_24D967138;
  v13[2] = a1;
  v13[3] = a2;
  v13[4] = a3;
  sub_21889FB88((uint64_t)v19, (uint64_t)(v13 + 5));
  v13[10] = a5;
  v13[11] = v10;
  type metadata accessor for RMTrustStoreDatabase();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16 = sub_2188A0A20();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  v13[12] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return v13;
}

uint64_t sub_21889FB40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCD20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21889FB88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_21889FBF4(__int128 *a1, uint64_t a2)
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

uint64_t sub_21889FC0C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  void *v5;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  int v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  SecPolicyRef SSL;
  uint64_t v45;
  uint64_t inited;
  uint64_t v47;
  uint64_t v48;
  __SecPolicy *v49;
  uint64_t v50;
  void *v51;
  int v52;
  __SecPolicy *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v7 = (void *)sub_21887A920(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a3, a4, a5);
  if (v5)
  {

    if (qword_254FFC878 != -1)
      swift_once();
    v8 = sub_2188A5C9C();
    __swift_project_value_buffer(v8, (uint64_t)qword_254FFEE78);
    swift_retain_n();
    v9 = sub_2188A5C84();
    v10 = sub_2188A5E4C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v62 = v12;
      *(_DWORD *)v11 = 136315394;
      sub_2188A17DC(0xD00000000000002CLL, 0x80000002188ABF40, &v62);
      sub_2188A5EC4();
      *(_WORD *)(v11 + 12) = 2082;
      v13 = sub_2188A5C30();
      sub_2188A17DC(v13, v14, &v62);
      sub_2188A5EC4();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21885E000, v9, v10, "%s: missing certificate for %{public}s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v12, -1, -1);
      MEMORY[0x219A1C06C](v11, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    sub_2188A07D0();
    swift_allocError();
    *(_DWORD *)v22 = 0;
    *(_BYTE *)(v22 + 4) = 1;
    swift_willThrow();
    return v23 & 1;
  }
  v15 = v7;
  if ((SecCertificateIsSelfSignedCA() & 1) != 0)
  {
    if ((a2 & 1) != 0)
    {
      if (qword_254FFC878 != -1)
        swift_once();
      v16 = sub_2188A5C9C();
      __swift_project_value_buffer(v16, (uint64_t)qword_254FFEE78);
      swift_retain_n();
      v17 = sub_2188A5C84();
      v18 = sub_2188A5E40();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = swift_slowAlloc();
        v59 = swift_slowAlloc();
        v62 = v59;
        *(_DWORD *)v19 = 136315394;
        sub_2188A17DC(0xD00000000000002CLL, 0x80000002188ABF40, &v62);
        sub_2188A5EC4();
        *(_WORD *)(v19 + 12) = 2082;
        v20 = sub_2188A5C30();
        sub_2188A17DC(v20, v21, &v62);
        sub_2188A5EC4();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21885E000, v17, v18, "%s: setting full trust for certificate %{public}s", (uint8_t *)v19, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v59, -1, -1);
        MEMORY[0x219A1C06C](v19, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      SecTrustStoreForDomain();
      v37 = SecTrustStoreSetTrustSettings();
      if (v37)
      {
        v38 = v37;
        v39 = sub_2188A5C84();
        v40 = sub_2188A5E4C();
        if (os_log_type_enabled(v39, v40))
        {
          v41 = swift_slowAlloc();
          v42 = swift_slowAlloc();
          v62 = v42;
          *(_DWORD *)v41 = 136315394;
          sub_2188A17DC(0xD00000000000002CLL, 0x80000002188ABF40, &v62);
          sub_2188A5EC4();
          *(_WORD *)(v41 + 12) = 1024;
          sub_2188A5EC4();
          _os_log_impl(&dword_21885E000, v39, v40, "%s: Failed to set full trust, status: %d", (uint8_t *)v41, 0x12u);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v42, -1, -1);
          MEMORY[0x219A1C06C](v41, -1, -1);
        }

        sub_2188A07D0();
        swift_allocError();
        *(_DWORD *)v43 = v38;
        *(_BYTE *)(v43 + 4) = 0;
        swift_willThrow();

        return v23 & 1;
      }
LABEL_36:

      v23 = 1;
      return v23 & 1;
    }
    if (qword_254FFC878 != -1)
      swift_once();
    v31 = sub_2188A5C9C();
    __swift_project_value_buffer(v31, (uint64_t)qword_254FFEE78);
    swift_retain_n();
    v32 = sub_2188A5C84();
    v33 = sub_2188A5E40();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = swift_slowAlloc();
      v61 = swift_slowAlloc();
      v62 = v61;
      *(_DWORD *)v34 = 136315394;
      sub_2188A17DC(0xD00000000000002CLL, 0x80000002188ABF40, &v62);
      sub_2188A5EC4();
      *(_WORD *)(v34 + 12) = 2082;
      v35 = sub_2188A5C30();
      sub_2188A17DC(v35, v36, &v62);
      sub_2188A5EC4();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21885E000, v32, v33, "%s: setting partial trust for certificate %{public}s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v61, -1, -1);
      MEMORY[0x219A1C06C](v34, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    SSL = SecPolicyCreateSSL(1u, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCD30);
    v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_2188A8630;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC988);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2188A8630;
    *(_QWORD *)(inited + 32) = 0xD000000000000017;
    *(_QWORD *)(inited + 40) = 0x80000002188ABF70;
    type metadata accessor for SecPolicy(0);
    *(_QWORD *)(inited + 48) = SSL;
    *(_QWORD *)(inited + 72) = v47;
    *(_QWORD *)(inited + 80) = 0xD000000000000017;
    *(_QWORD *)(inited + 88) = 0x80000002188ABF90;
    v48 = MEMORY[0x24BEE44F0];
    *(_QWORD *)(inited + 120) = MEMORY[0x24BEE44F0];
    *(_DWORD *)(inited + 96) = 4;
    v49 = SSL;
    *(_QWORD *)(v45 + 32) = sub_218875DE8(inited);
    v50 = swift_initStackObject();
    *(_OWORD *)(v50 + 16) = xmmword_2188A86D0;
    *(_QWORD *)(v50 + 32) = 0xD000000000000017;
    *(_QWORD *)(v50 + 40) = 0x80000002188ABF90;
    *(_QWORD *)(v50 + 72) = v48;
    *(_DWORD *)(v50 + 48) = 1;
    *(_QWORD *)(v45 + 40) = sub_218875DE8(v50);
    SecTrustStoreForDomain();
    v15 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCCE0);
    v51 = (void *)sub_2188A5DEC();
    swift_bridgeObjectRelease();
    v52 = SecTrustStoreSetTrustSettings();

    if (!v52)
    {

      goto LABEL_36;
    }
    v53 = v49;
    v54 = sub_2188A5C84();
    v55 = sub_2188A5E4C();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = swift_slowAlloc();
      v57 = swift_slowAlloc();
      v62 = v57;
      *(_DWORD *)v56 = 136315394;
      sub_2188A17DC(0xD00000000000002CLL, 0x80000002188ABF40, &v62);
      sub_2188A5EC4();
      *(_WORD *)(v56 + 12) = 1024;
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v54, v55, "%s: Failed to set partial trust, status: %d", (uint8_t *)v56, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v57, -1, -1);
      MEMORY[0x219A1C06C](v56, -1, -1);
    }

    sub_2188A07D0();
    swift_allocError();
    *(_DWORD *)v58 = v52;
    *(_BYTE *)(v58 + 4) = 0;
    swift_willThrow();

  }
  else
  {
    if (qword_254FFC878 != -1)
      swift_once();
    v25 = sub_2188A5C9C();
    __swift_project_value_buffer(v25, (uint64_t)qword_254FFEE78);
    swift_retain_n();
    v26 = sub_2188A5C84();
    v27 = sub_2188A5E40();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc();
      v60 = swift_slowAlloc();
      v62 = v60;
      *(_DWORD *)v28 = 136315394;
      sub_2188A17DC(0xD00000000000002CLL, 0x80000002188ABF40, &v62);
      sub_2188A5EC4();
      *(_WORD *)(v28 + 12) = 2082;
      v29 = sub_2188A5C30();
      sub_2188A17DC(v29, v30, &v62);
      sub_2188A5EC4();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21885E000, v26, v27, "%s: certificate is not self-signed CA %{public}s", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v60, -1, -1);
      MEMORY[0x219A1C06C](v28, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v23 = 0;
  }
  return v23 & 1;
}

unint64_t sub_2188A07D0()
{
  unint64_t result;

  result = qword_254FFCD28;
  if (!qword_254FFCD28)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A96EC, &type metadata for RMTrustStoreError);
    atomic_store(result, (unint64_t *)&qword_254FFCD28);
  }
  return result;
}

void sub_2188A0814(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_21887A920(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2, a3, a4);
  if (!v4)
  {
    v6 = (void *)v5;
    SecTrustStoreForDomain();
    v7 = SecTrustStoreRemoveCertificate();
    if (v7)
    {
      v8 = v7;
      if (qword_254FFC878 != -1)
        swift_once();
      v9 = sub_2188A5C9C();
      __swift_project_value_buffer(v9, (uint64_t)qword_254FFEE78);
      v10 = sub_2188A5C84();
      v11 = sub_2188A5E4C();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = swift_slowAlloc();
        v13 = swift_slowAlloc();
        v15 = v13;
        *(_DWORD *)v12 = 136315394;
        sub_2188A17DC(0xD000000000000025, 0x80000002188ABFB0, &v15);
        sub_2188A5EC4();
        *(_WORD *)(v12 + 12) = 1024;
        sub_2188A5EC4();
        _os_log_impl(&dword_21885E000, v10, v11, "%s Failed to remove trust, status: %d", (uint8_t *)v12, 0x12u);
        swift_arrayDestroy();
        MEMORY[0x219A1C06C](v13, -1, -1);
        MEMORY[0x219A1C06C](v12, -1, -1);
      }

      sub_2188A07D0();
      swift_allocError();
      *(_DWORD *)v14 = v8;
      *(_BYTE *)(v14 + 4) = 0;
      swift_willThrow();
    }

  }
}

ValueMetadata *type metadata accessor for RMTrustStoreBackend()
{
  return &type metadata for RMTrustStoreBackend;
}

uint64_t sub_2188A0A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _OWORD v20[2];
  uint64_t v21[4];

  v0 = sub_2188A5D68();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 32;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF50]), sel_init);
  v5 = (void *)sub_2188A5D14();
  v6 = objc_msgSend(v4, sel_valueForKey_, v5);

  if (v6)
  {
    sub_2188A5F00();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  sub_2188A1794((uint64_t)v20, (uint64_t)v21);
  if (v21[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_2188A5D50();
      v7 = sub_2188A5D2C();
      v9 = v8;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      if (v9 >> 60 != 15)
      {
        sub_2188A5AA4();
        swift_allocObject();
        sub_2188A5A98();
        type metadata accessor for RMTrustStoreDatabase();
        sub_2188801C0(&qword_254FFCD58, v10, (uint64_t (*)(uint64_t))type metadata accessor for RMTrustStoreDatabase, (uint64_t)&unk_2188A9550);
        sub_2188A5A8C();
        swift_release();
        sub_21887A154(v7, v9);
        return v21[0];
      }
    }
  }
  else
  {
    sub_218890298((uint64_t)v21);
  }
  if (qword_254FFC850 != -1)
    swift_once();
  v11 = sub_2188A5C9C();
  __swift_project_value_buffer(v11, (uint64_t)qword_254FFEE30);
  v12 = sub_2188A5C84();
  v13 = sub_2188A5E40();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v21[0] = v15;
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)&v20[0] = sub_2188A17DC(0xD000000000000012, 0x80000002188AC050, v21);
    sub_2188A5EC4();
    _os_log_impl(&dword_21885E000, v12, v13, "%s: Invalid/empty user default", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1C06C](v15, -1, -1);
    MEMORY[0x219A1C06C](v14, -1, -1);
  }

  type metadata accessor for RMTrustStoreDatabase();
  v18 = swift_allocObject();
  v16 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v18 + 16) = sub_218875A68(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v18 + 24) = sub_218875A68(v16);
  return v18;
}

void sub_2188A0FE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;

  v0 = sub_2188A5D68();
  MEMORY[0x24BDAC7A8](v0);
  sub_2188A5AC8();
  swift_allocObject();
  sub_2188A5ABC();
  type metadata accessor for RMTrustStoreDatabase();
  sub_2188801C0(&qword_254FFCD50, v1, (uint64_t (*)(uint64_t))type metadata accessor for RMTrustStoreDatabase, (uint64_t)&unk_2188A9528);
  v2 = sub_2188A5AB0();
  v4 = v3;
  sub_21887A110(v2, v3);
  sub_2188A5D50();
  sub_2188A5D38();
  v6 = v5;
  sub_21887A168(v2, v4);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF50]), sel_init);
  if (v6)
  {
    v8 = sub_2188A5D14();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)sub_2188A5D14();
  objc_msgSend(v7, sel_setObject_forKey_, v8, v9);
  sub_21887A168(v2, v4);
  swift_release();

  swift_unknownObjectRelease();
}

unint64_t sub_2188A1244()
{
  _BYTE *v0;

  if (*v0)
    return 0xD00000000000001ALL;
  else
    return 0xD000000000000017;
}

uint64_t sub_2188A1284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2188A1FC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2188A12A8()
{
  sub_2188A1750();
  return sub_2188A60C8();
}

uint64_t sub_2188A12D0()
{
  sub_2188A1750();
  return sub_2188A60D4();
}

uint64_t sub_2188A12F8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RMTrustStoreDatabase()
{
  return objc_opt_self();
}

uint64_t sub_2188A1344(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[8];
  uint64_t v11;
  uint64_t v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCD48);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2188A1750();
  sub_2188A60BC();
  swift_beginAccess();
  v12 = *(_QWORD *)(v3 + 16);
  LOBYTE(v11) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB38);
  sub_218885640();
  sub_2188A6020();
  if (!v2)
  {
    swift_beginAccess();
    v11 = *(_QWORD *)(v3 + 24);
    v10[7] = 1;
    sub_2188A6020();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2188A14B8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v2 = v1;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCD38);
  v4 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 16) = sub_218875A68(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v2 + 24) = sub_218875A68(v7);
  v8 = a1[3];
  v17 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v8);
  sub_2188A1750();
  v9 = v18;
  sub_2188A60B0();
  if (v9)
  {
    swift_release();
  }
  else
  {
    v15 = (_QWORD *)(v2 + 24);
    v18 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCB38);
    v20 = 0;
    sub_218885008();
    sub_2188A5FFC();
    v10 = v19;
    swift_beginAccess();
    *(_QWORD *)(v2 + 16) = v10;
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 1;
    v11 = v16;
    sub_2188A5FFC();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v11);
    v13 = v21;
    v14 = v15;
    swift_beginAccess();
    *v14 = v13;
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return v2;
}

uint64_t sub_2188A16DC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for RMTrustStoreDatabase();
  v5 = swift_allocObject();
  result = sub_2188A14B8(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_2188A1730(_QWORD *a1)
{
  return sub_2188A1344(a1);
}

unint64_t sub_2188A1750()
{
  unint64_t result;

  result = qword_254FFCD40;
  if (!qword_254FFCD40)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A963C, &type metadata for RMTrustStoreDatabase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCD40);
  }
  return result;
}

uint64_t sub_2188A1794(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC9E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2188A17DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2188A18AC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21887A700((uint64_t)v12, *a3);
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
      sub_21887A700((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2188A18AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2188A5ED0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2188A1A64(a5, a6);
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
  v8 = sub_2188A5F78();
  if (!v8)
  {
    sub_2188A5F90();
    __break(1u);
LABEL_17:
    result = sub_2188A5FD8();
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

uint64_t sub_2188A1A64(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2188A1AF8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2188A1CD0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2188A1CD0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2188A1AF8(uint64_t a1, unint64_t a2)
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
      v3 = sub_2188A1C6C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2188A5F60();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2188A5F90();
      __break(1u);
LABEL_10:
      v2 = sub_2188A5DA4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2188A5FD8();
    __break(1u);
LABEL_14:
    result = sub_2188A5F90();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2188A1C6C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCD60);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2188A1CD0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFCD60);
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
  result = sub_2188A5FD8();
  __break(1u);
  return result;
}

uint64_t storeEnumTagSinglePayload for RMTrustStoreDatabase.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2188A1E68 + 4 * byte_2188A94F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2188A1E9C + 4 * byte_2188A94F0[v4]))();
}

uint64_t sub_2188A1E9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2188A1EA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2188A1EACLL);
  return result;
}

uint64_t sub_2188A1EB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2188A1EC0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2188A1EC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2188A1ECC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RMTrustStoreDatabase.CodingKeys()
{
  return &type metadata for RMTrustStoreDatabase.CodingKeys;
}

unint64_t sub_2188A1EEC()
{
  unint64_t result;

  result = qword_254FFCD68;
  if (!qword_254FFCD68)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A9614, &type metadata for RMTrustStoreDatabase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCD68);
  }
  return result;
}

unint64_t sub_2188A1F34()
{
  unint64_t result;

  result = qword_254FFCD70;
  if (!qword_254FFCD70)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A9584, &type metadata for RMTrustStoreDatabase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCD70);
  }
  return result;
}

unint64_t sub_2188A1F7C()
{
  unint64_t result;

  result = qword_254FFCD78;
  if (!qword_254FFCD78)
  {
    result = MEMORY[0x219A1BFE8](&unk_2188A95AC, &type metadata for RMTrustStoreDatabase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254FFCD78);
  }
  return result;
}

uint64_t sub_2188A1FC0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000017 && a2 == 0x80000002188AC010 || (sub_2188A6038() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000002188AC030)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_2188A6038();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for RMTrustStoreError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RMTrustStoreError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_2188A2108(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2188A2124(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for RMTrustStoreError()
{
  return &type metadata for RMTrustStoreError;
}

unint64_t sub_2188A2158(uint64_t a1)
{
  _QWORD v2[2];

  if ((a1 & 0x100000000) != 0)
    return 0xD000000000000013;
  sub_2188A5F54();
  swift_bridgeObjectRelease();
  strcpy((char *)v2, "System error: ");
  HIBYTE(v2[1]) = -18;
  sub_2188A602C();
  sub_2188A5D98();
  swift_bridgeObjectRelease();
  return v2[0];
}

unint64_t sub_2188A2210()
{
  unsigned int *v0;

  return sub_2188A2158(*v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32));
}

void sub_2188A2230(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char isUniquelyReferenced_nonNull_native;
  char v33;
  void *v34;
  const char *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41[6];
  uint64_t v42[3];
  uint64_t v43;

  v4 = v3;
  v5 = v2;
  if (qword_254FFC878 != -1)
    swift_once();
  v8 = sub_2188A5C9C();
  __swift_project_value_buffer(v8, (uint64_t)qword_254FFEE78);
  swift_retain_n();
  v9 = sub_2188A5C84();
  v10 = sub_2188A5E40();
  v39 = a2;
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v42[0] = v12;
    *(_DWORD *)v11 = 136315394;
    sub_2188A17DC(0xD000000000000026, 0x80000002188AC2F0, v42);
    sub_2188A5EC4();
    *(_WORD *)(v11 + 12) = 2082;
    v13 = sub_2188A5C30();
    v41[3] = sub_2188A17DC(v13, v14, v42);
    sub_2188A5EC4();
    swift_release_n();
    v4 = v3;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21885E000, v9, v10, "%s: certificate %{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    v15 = v12;
    a2 = v39;
    MEMORY[0x219A1C06C](v15, -1, -1);
    MEMORY[0x219A1C06C](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v16 = v5[12];
  v17 = (uint64_t *)(v16 + 16);
  swift_beginAccess();
  v18 = *(_QWORD *)(v16 + 16);
  if (*(_QWORD *)(v18 + 16))
  {
    swift_retain();
    swift_bridgeObjectRetain();
    v19 = sub_2188768A0(a1);
    if ((v20 & 1) != 0)
      v40 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v19);
    else
      v40 = 0;
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v40 = 0;
  }
  v21 = (uint64_t *)(v16 + 24);
  swift_beginAccess();
  v22 = *(_QWORD *)(v16 + 24);
  if (!*(_QWORD *)(v22 + 16))
    goto LABEL_18;
  swift_retain();
  swift_bridgeObjectRetain();
  v23 = sub_2188768A0(a1);
  if ((v24 & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
LABEL_18:
    v25 = 0;
LABEL_19:
    if (!v40)
      goto LABEL_22;
LABEL_20:
    v38 = v25;
    swift_retain_n();
    v26 = sub_2188A5C84();
    v27 = sub_2188A5E40();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      v41[0] = v37;
      *(_DWORD *)v28 = 136315394;
      v43 = sub_2188A17DC(0xD000000000000026, 0x80000002188AC2F0, v41);
      sub_2188A5EC4();
      *(_WORD *)(v28 + 12) = 2082;
      v29 = sub_2188A5C30();
      v43 = sub_2188A17DC(v29, v30, v41);
      sub_2188A5EC4();
      swift_release_n();
      v17 = (uint64_t *)(v16 + 16);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21885E000, v26, v27, "%s: incrementing trust for certificate %{public}s", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v37, -1, -1);
      MEMORY[0x219A1C06C](v28, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v25 = v38;
    if ((v39 & 1) != 0)
      goto LABEL_25;
    goto LABEL_29;
  }
  v25 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23);
  swift_release();
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
    goto LABEL_19;
  if (v40 | v25)
    goto LABEL_20;
  v25 = 0;
LABEL_22:
  v31 = sub_21889FC0C(a1, a2 & 1, v5[2], v5[3], v5[4]);
  if (!v4 && (v31 & 1) != 0)
  {
    if ((a2 & 1) != 0)
    {
LABEL_25:
      if (v40 != -1)
      {
        swift_beginAccess();
        swift_retain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v43 = *v17;
        *v17 = 0x8000000000000000;
        sub_21889815C(v40 + 1, a1, isUniquelyReferenced_nonNull_native);
        *v17 = v43;
LABEL_31:
        swift_release();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_2188A0FE8();
        v34 = (void *)sub_2188A5D14();
        v35 = (const char *)objc_msgSend(v34, sel_UTF8String);
        v36 = v34;
        notify_post(v35);
        return;
      }
      __break(1u);
      goto LABEL_34;
    }
LABEL_29:
    if (v25 != -1)
    {
      swift_beginAccess();
      swift_retain();
      v33 = swift_isUniquelyReferenced_nonNull_native();
      v43 = *v21;
      *v21 = 0x8000000000000000;
      sub_21889815C(v25 + 1, a1, v33);
      *v21 = v43;
      goto LABEL_31;
    }
LABEL_34:
    __break(1u);
  }
}

void sub_2188A2834(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v37;
  void *v38;
  const char *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[3];
  uint64_t v44;

  v4 = v2;
  v7 = *(_QWORD *)(v2 + 96);
  v8 = (uint64_t *)(v7 + 16);
  swift_beginAccess();
  v9 = *(_QWORD *)(v7 + 16);
  if (*(_QWORD *)(v9 + 16))
  {
    swift_retain();
    swift_bridgeObjectRetain();
    v10 = sub_2188768A0(a1);
    if ((v11 & 1) != 0)
      v12 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v10);
    else
      v12 = 0;
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = (uint64_t *)(v7 + 24);
  swift_beginAccess();
  v14 = *(_QWORD *)(v7 + 24);
  if (!*(_QWORD *)(v14 + 16))
  {
LABEL_19:
    if (v12)
    {
      if ((a2 & 1) != 0)
      {
        if (v12 != 1)
          goto LABEL_22;
LABEL_31:
        if (qword_254FFC878 != -1)
          swift_once();
        v30 = sub_2188A5C9C();
        __swift_project_value_buffer(v30, (uint64_t)qword_254FFEE78);
        swift_retain_n();
        v31 = sub_2188A5C84();
        v32 = sub_2188A5E40();
        if (os_log_type_enabled(v31, v32))
        {
          v33 = swift_slowAlloc();
          v42 = swift_slowAlloc();
          v43[0] = v42;
          *(_DWORD *)v33 = 136315394;
          v44 = sub_2188A17DC(0xD000000000000029, 0x80000002188AC2C0, v43);
          sub_2188A5EC4();
          *(_WORD *)(v33 + 12) = 2082;
          v34 = sub_2188A5C30();
          v44 = sub_2188A17DC(v34, v35, v43);
          sub_2188A5EC4();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21885E000, v31, v32, "%s: removing all trust for certificate %{public}s", (uint8_t *)v33, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x219A1C06C](v42, -1, -1);
          MEMORY[0x219A1C06C](v33, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        sub_2188A0814(a1, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32));
        if (!v3)
          goto LABEL_40;
        return;
      }
LABEL_40:
      swift_beginAccess();
      v37 = swift_retain();
      sub_218897844(v37);
      swift_endAccess();
      swift_release();
      goto LABEL_41;
    }
LABEL_24:
    if (qword_254FFC878 != -1)
      swift_once();
    v25 = sub_2188A5C9C();
    __swift_project_value_buffer(v25, (uint64_t)qword_254FFEE78);
    v26 = sub_2188A5C84();
    v27 = sub_2188A5E40();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v43[0] = v29;
      *(_DWORD *)v28 = 136315138;
      v44 = sub_2188A17DC(0xD000000000000029, 0x80000002188AC2C0, v43);
      sub_2188A5EC4();
      _os_log_impl(&dword_21885E000, v26, v27, "%s: trust store removal not needed", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1C06C](v29, -1, -1);
      MEMORY[0x219A1C06C](v28, -1, -1);
    }

    return;
  }
  swift_retain();
  swift_bridgeObjectRetain();
  v15 = sub_2188768A0(a1);
  if ((v16 & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v17 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v15);
  swift_release();
  swift_bridgeObjectRelease();
  if (!(v12 | v17))
    goto LABEL_24;
  if ((a2 & 1) == 0)
  {
    if (!v12 && v17 == 1)
      goto LABEL_31;
    if (v17 >= 2)
    {
      swift_beginAccess();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v44 = *v13;
      *v13 = 0x8000000000000000;
      sub_21889815C(v17 - 1, a1, isUniquelyReferenced_nonNull_native);
      *v13 = v44;
      goto LABEL_23;
    }
    goto LABEL_40;
  }
  if (!v12)
    goto LABEL_40;
  if (v12 != 1)
  {
LABEL_22:
    swift_beginAccess();
    swift_retain();
    v24 = swift_isUniquelyReferenced_nonNull_native();
    v44 = *v8;
    *v8 = 0x8000000000000000;
    sub_21889815C(v12 - 1, a1, v24);
    *v8 = v44;
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    swift_endAccess();
LABEL_41:
    sub_2188A0FE8();
    v38 = (void *)sub_2188A5D14();
    v39 = (const char *)objc_msgSend(v38, sel_UTF8String);
    v40 = v38;
    notify_post(v39);
    return;
  }
  if (!v17)
    goto LABEL_31;
  if (qword_254FFC878 != -1)
    swift_once();
  v18 = sub_2188A5C9C();
  __swift_project_value_buffer(v18, (uint64_t)qword_254FFEE78);
  swift_retain_n();
  v19 = sub_2188A5C84();
  v20 = sub_2188A5E40();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v43[0] = v41;
    *(_DWORD *)v21 = 136315394;
    v44 = sub_2188A17DC(0xD000000000000029, 0x80000002188AC2C0, v43);
    sub_2188A5EC4();
    *(_WORD *)(v21 + 12) = 2082;
    v22 = sub_2188A5C30();
    v44 = sub_2188A17DC(v22, v23, v43);
    sub_2188A5EC4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21885E000, v19, v20, "%s: downgrading to partial trust for certificate %{public}s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A1C06C](v41, -1, -1);
    MEMORY[0x219A1C06C](v21, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  sub_21889FC0C(a1, 0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32));
  if (!v3)
    goto LABEL_40;
}

uint64_t sub_2188A5A44()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_2188A5A50()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_2188A5A5C()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_2188A5A68()
{
  return MEMORY[0x24BDCB098]();
}

uint64_t sub_2188A5A74()
{
  return MEMORY[0x24BDCB0A8]();
}

uint64_t sub_2188A5A80()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_2188A5A8C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2188A5A98()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2188A5AA4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2188A5AB0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2188A5ABC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2188A5AC8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2188A5AD4()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_2188A5AE0()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2188A5AEC()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_2188A5AF8()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_2188A5B04()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_2188A5B10()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_2188A5B1C()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_2188A5B28()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_2188A5B34()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2188A5B40()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2188A5B4C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2188A5B58()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2188A5B64()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2188A5B70()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2188A5B7C()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_2188A5B88()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_2188A5B94()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_2188A5BA0()
{
  return MEMORY[0x24BDCCA58]();
}

uint64_t sub_2188A5BAC()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_2188A5BB8()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_2188A5BC4()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_2188A5BD0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2188A5BDC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2188A5BE8()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2188A5BF4()
{
  return MEMORY[0x24BDCD9D8]();
}

uint64_t sub_2188A5C00()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2188A5C0C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2188A5C18()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_2188A5C24()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2188A5C30()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_2188A5C3C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2188A5C48()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_2188A5C54()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2188A5C60()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_2188A5C6C()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_2188A5C78()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_2188A5C84()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2188A5C90()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2188A5C9C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2188A5CA8()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_2188A5CB4()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_2188A5CC0()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2188A5CCC()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2188A5CD8()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2188A5CE4()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_2188A5CF0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2188A5CFC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2188A5D08()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2188A5D14()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2188A5D20()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2188A5D2C()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_2188A5D38()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2188A5D44()
{
  return MEMORY[0x24BDCFA50]();
}

uint64_t sub_2188A5D50()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2188A5D5C()
{
  return MEMORY[0x24BDCFAD8]();
}

uint64_t sub_2188A5D68()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2188A5D74()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2188A5D80()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2188A5D8C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2188A5D98()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2188A5DA4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2188A5DB0()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_2188A5DBC()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2188A5DC8()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_2188A5DD4()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_2188A5DE0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2188A5DEC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2188A5DF8()
{
  return MEMORY[0x24BDCFBB0]();
}

uint64_t sub_2188A5E04()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2188A5E10()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2188A5E1C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2188A5E28()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2188A5E34()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2188A5E40()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2188A5E4C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2188A5E58()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2188A5E64()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2188A5E70()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2188A5E7C()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_2188A5E88()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_2188A5E94()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_2188A5EA0()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2188A5EAC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2188A5EB8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2188A5EC4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2188A5ED0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2188A5EDC()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_2188A5EE8()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_2188A5EF4()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_2188A5F00()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2188A5F0C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2188A5F18()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_2188A5F24()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2188A5F30()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2188A5F3C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2188A5F48()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2188A5F54()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2188A5F60()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2188A5F6C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2188A5F78()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2188A5F84()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2188A5F90()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2188A5F9C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2188A5FA8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2188A5FB4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2188A5FC0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2188A5FCC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2188A5FD8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2188A5FE4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2188A5FF0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2188A5FFC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2188A6008()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2188A6014()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2188A6020()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2188A602C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2188A6038()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2188A6044()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2188A6050()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2188A605C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2188A6068()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2188A6074()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2188A6080()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2188A608C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2188A6098()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2188A60A4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2188A60B0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2188A60BC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2188A60C8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2188A60D4()
{
  return MEMORY[0x24BEE4A10]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBE80](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

uint64_t DMCSetSkipBackupAttributeToItemAtPath()
{
  return MEMORY[0x24BE2A6B0]();
}

uint64_t DMCSystemContainerPathWithBundleIdentifier()
{
  return MEMORY[0x24BE2A6D0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SecCMSCertificatesOnlyMessageCopyCertificates()
{
  return MEMORY[0x24BDE8810]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x24BDE8948]();
}

uint64_t SecCertificateIsSelfSignedCA()
{
  return MEMORY[0x24BDE8960]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x24BDE8A50](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x24BDE8A58]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x24BDE8AC8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x24BDE8B80]();
}

OSStatus SecPKCS12Import(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef *items)
{
  return MEMORY[0x24BDE8BC8](pkcs12_data, options, items);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C78](server, hostname);
}

uint64_t SecRequestClientIdentity()
{
  return MEMORY[0x24BDE8CD0]();
}

uint64_t SecSCEPCreateTemporaryIdentity()
{
  return MEMORY[0x24BDE8CE8]();
}

uint64_t SecSCEPGenerateCertificateRequest()
{
  return MEMORY[0x24BDE8CF0]();
}

uint64_t SecSCEPGetCertInitial()
{
  return MEMORY[0x24BDE8CF8]();
}

uint64_t SecSCEPValidateCACertMessage()
{
  return MEMORY[0x24BDE8D00]();
}

uint64_t SecSCEPVerifyReply()
{
  return MEMORY[0x24BDE8D08]();
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x24BDE8E80]();
}

uint64_t SecTrustStoreRemoveCertificate()
{
  return MEMORY[0x24BDE8E98]();
}

uint64_t SecTrustStoreSetTrustSettings()
{
  return MEMORY[0x24BDE8EA0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x24BDACC40]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDADA08](*(_QWORD *)&a1, a2, a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x24BEE4C90]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}


void sub_1CF3B7664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CF3B7778(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CF3B7910(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1CF3B7C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1CF3B7DFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CF3B7F60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CF3B8268(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CF3B8434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1CF3B8514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;
  void *v11;

  v11 = v10;

  objc_sync_exit(v9);
  a9.super_class = (Class)AXKonaSpeechEngine;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1CF3B8990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1CF3B8D70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t globalEciCallback(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "eciCallback:iParam:instanceData:", a2, a3, a4);
}

uint64_t GlobalKlattConstHook(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "klattConstantHook:", a1);
}

uint64_t GlobalKlattDynamicHook(KlattFrame *a1, void *a2)
{
  return objc_msgSend(a2, "klattDynamicHook:", a1);
}

void sub_1CF3B9328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,void *a43,void *a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,id a54,char a55)
{

  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);

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

void sub_1CF3B975C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CF3B9970(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CF3B9B74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CF3B9E24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF3B9FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  objc_sync_exit(v20);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1CF3BA0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1CF3BA204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17)
{
  void *v17;
  void *v18;
  void *v19;

  v19 = v18;
  objc_sync_exit(v19);

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1CF3BA2D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CF3BA368(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF3BA43C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CF3BA4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1CF3BA6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1CF3BA740(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CF3BA84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1CF3BAB8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  _Unwind_Resume(a1);
}

void sub_1CF3BAD50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CF3BADE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1CF3BAE60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1CF3BAEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1CF3BAF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1CF3BBBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62)
{
  void *v62;

  _Unwind_Resume(a1);
}

void sub_1CF3BC138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1CF3BC588(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CF3BCB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void _GLOBAL__sub_I_AXKonaSpeechEngine_mm()
{
  void *v0;
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
  _QWORD v11[14];
  _QWORD v12[15];

  v12[14] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1D17CCB60]();
  v1 = *MEMORY[0x1E0CCDEF8];
  v11[0] = CFSTR("en-US");
  v11[1] = CFSTR("en-GB");
  v12[0] = v1;
  v12[1] = v1;
  v2 = *MEMORY[0x1E0CCDF80];
  v11[2] = CFSTR("es-ES");
  v11[3] = CFSTR("es-MX");
  v12[2] = v2;
  v12[3] = v2;
  v3 = *MEMORY[0x1E0CCDF08];
  v11[4] = CFSTR("fr-FR");
  v11[5] = CFSTR("fr-CA");
  v12[4] = v3;
  v12[5] = v3;
  v4 = *MEMORY[0x1E0CCDF10];
  v11[6] = CFSTR("de-DE");
  v11[7] = CFSTR("it-IT");
  v5 = *MEMORY[0x1E0CCDF20];
  v12[6] = v4;
  v12[7] = v5;
  v6 = *MEMORY[0x1E0CCDF58];
  v11[8] = CFSTR("pt-BR");
  v11[9] = CFSTR("fi-FI");
  v7 = *MEMORY[0x1E0CCDF00];
  v12[8] = v6;
  v12[9] = v7;
  v8 = *MEMORY[0x1E0CCDF28];
  v11[10] = CFSTR("ja-JP");
  v11[11] = CFSTR("ko-KR");
  v9 = *MEMORY[0x1E0CCDF30];
  v12[10] = v8;
  v12[11] = v9;
  v10 = *MEMORY[0x1E0CCDF70];
  v11[12] = CFSTR("zh-CN");
  v11[13] = CFSTR("zh-TW");
  v12[12] = v10;
  v12[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 14);
  kKonaLangToNLLang = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v0);
}

uint64_t AXTTSLogKona()
{
  return MEMORY[0x1E0CF3808]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x1E0CF38E8]();
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F30](*(_QWORD *)&encoding);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

uint64_t eciActivateDict2()
{
  return MEMORY[0x1E0DBEFA0]();
}

uint64_t eciAddText2()
{
  return MEMORY[0x1E0DBEFA8]();
}

uint64_t eciDelete2()
{
  return MEMORY[0x1E0DBEFB0]();
}

uint64_t eciDeleteDict2()
{
  return MEMORY[0x1E0DBEFB8]();
}

uint64_t eciInsertIndex2()
{
  return MEMORY[0x1E0DBEFC0]();
}

uint64_t eciLoadDictVolume2()
{
  return MEMORY[0x1E0DBEFC8]();
}

uint64_t eciNew2()
{
  return MEMORY[0x1E0DBEFD0]();
}

uint64_t eciNewDict2()
{
  return MEMORY[0x1E0DBEFD8]();
}

uint64_t eciRegisterCallback2()
{
  return MEMORY[0x1E0DBEFE0]();
}

uint64_t eciRegisterKlattHooks2()
{
  return MEMORY[0x1E0DBEFE8]();
}

uint64_t eciRegisterSampleBuffer2()
{
  return MEMORY[0x1E0DBEFF0]();
}

uint64_t eciSetIniContent()
{
  return MEMORY[0x1E0DBEFF8]();
}

uint64_t eciSetParam2()
{
  return MEMORY[0x1E0DBF000]();
}

uint64_t eciSetStandardVoice2()
{
  return MEMORY[0x1E0DBF008]();
}

uint64_t eciSynchronize2()
{
  return MEMORY[0x1E0DBF010]();
}

uint64_t eciSynthesize2()
{
  return MEMORY[0x1E0DBF018]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}


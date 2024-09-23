void *OUTLINED_FUNCTION_0(size_t a1)
{
  return malloc_type_malloc(a1, 0x8C5DC2A9uLL);
}

void sub_245BE6D44()
{
  void *v0;

  OUTLINED_FUNCTION_6();

  OUTLINED_FUNCTION_5();
}

void sub_245BE6DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  OUTLINED_FUNCTION_6();
  a9.super_class = (Class)SACaseConnectionInfoProvider;
  objc_msgSendSuper2(&a9, sel_dealloc);
  OUTLINED_FUNCTION_5();
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_245BE70E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

double __os_log_helper_16_0_1_4_2(_DWORD *a1, int a2)
{
  double result;

  *(_QWORD *)&result = 67240192;
  *a1 = 67240192;
  a1[1] = a2;
  return result;
}

_WORD *__os_log_helper_16_0_0(_WORD *result)
{
  *result = 0;
  return result;
}

double __os_log_helper_16_2_2_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;

  *(_QWORD *)&result = 138543618;
  *(_DWORD *)a1 = 138543618;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2114;
  *(_QWORD *)(a1 + 14) = a3;
  return result;
}

double __os_log_helper_16_2_1_8_66(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = 138543362;
  *(_DWORD *)a1 = 138543362;
  *(_QWORD *)(a1 + 4) = a2;
  return result;
}

void sub_245BE7254()
{
  void *v0;

  OUTLINED_FUNCTION_5();
}

BOOL OUTLINED_FUNCTION_0_0(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_DEFAULT, a4, a5, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_DEFAULT, a4, a5, 0xCu);
}

double OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9;

  return __os_log_helper_16_0_1_4_2(&a9, v9);
}

void OUTLINED_FUNCTION_5()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void OUTLINED_FUNCTION_6()
{
  void *v0;

}

void sub_245BE7588(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t SASGetTimestampCallback(void)
{
  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  return mach_continuous_time() * dword_257514580 / *(unsigned int *)algn_257514584 / 0x3E8;
}

#error "245BE793C: call analysis failed (funcsize=31)"

void sub_245BE7DB0()
{
  void *v0;
  void *v1;

  OUTLINED_FUNCTION_5();
}

double __os_log_helper_16_0_1_4_0(_DWORD *a1, int a2)
{
  double result;

  *(_QWORD *)&result = 67109120;
  *a1 = 67109120;
  a1[1] = a2;
  return result;
}

double __os_log_helper_16_0_3_8_2_8_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  double result;

  *(_QWORD *)&result = 134349568;
  *(_DWORD *)a1 = 134349568;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 1024;
  *(_DWORD *)(a1 + 24) = a4;
  return result;
}

void sub_245BE7ECC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, "callStreamCallback:", v3);
  OUTLINED_FUNCTION_17(v1, v2);
}

void sub_245BE7EEC(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_9();
}

#error "245BE7F84: call analysis failed (funcsize=2)"

void sub_245BE8004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  PacketCollection::~PacketCollection((PacketCollection *)&a9);
  OUTLINED_FUNCTION_9();
}

void sub_245BE81AC()
{
  void *v0;

  OUTLINED_FUNCTION_5();
}

void sub_245BE8280()
{
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_5();
}

void sub_245BE8538()
{
  void *v0;
  void *v1;

  OUTLINED_FUNCTION_5();
}

double __os_log_helper_16_0_7_8_2_8_0_8_0_4_0_4_0_4_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  double result;

  *(_QWORD *)&result = 134350592;
  *(_DWORD *)a1 = 134350592;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 2048;
  *(_QWORD *)(a1 + 24) = a4;
  *(_WORD *)(a1 + 32) = 1024;
  *(_DWORD *)(a1 + 34) = a5;
  *(_WORD *)(a1 + 38) = 1024;
  *(_DWORD *)(a1 + 40) = a6;
  *(_WORD *)(a1 + 44) = 1024;
  *(_DWORD *)(a1 + 46) = a7;
  *(_WORD *)(a1 + 50) = 1024;
  *(_DWORD *)(a1 + 52) = a8;
  return result;
}

void sub_245BE8780(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_9();
}

void sub_245BE8A14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

double __os_log_helper_16_2_2_8_64_8_64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;

  *(_QWORD *)&result = 138412546;
  *(_DWORD *)a1 = 138412546;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2112;
  *(_QWORD *)(a1 + 14) = a3;
  return result;
}

void sub_245BE8B30()
{
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_5();
}

void sub_245BE8BE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  PacketCollection::~PacketCollection((PacketCollection *)va);
  OUTLINED_FUNCTION_9();
}

#error "245BE92C4: call analysis failed (funcsize=19)"

double __os_log_helper_16_2_1_8_64(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = 138412290;
  *(_DWORD *)a1 = 138412290;
  *(_QWORD *)(a1 + 4) = a2;
  return result;
}

double __os_log_helper_16_2_2_8_64_4_0(uint64_t a1, uint64_t a2, int a3)
{
  double result;

  *(_QWORD *)&result = 138412546;
  *(_DWORD *)a1 = 138412546;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a3;
  return result;
}

double __os_log_helper_16_2_6_8_64_4_0_8_0_8_0_8_64_8_32(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double result;

  *(_QWORD *)&result = 138413570;
  *(_DWORD *)a1 = 138413570;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 18) = 2048;
  *(_QWORD *)(a1 + 20) = a4;
  *(_WORD *)(a1 + 28) = 2048;
  *(_QWORD *)(a1 + 30) = a5;
  *(_WORD *)(a1 + 38) = 2112;
  *(_QWORD *)(a1 + 40) = a6;
  *(_WORD *)(a1 + 48) = 2080;
  *(_QWORD *)(a1 + 50) = a7;
  return result;
}

void sub_245BE9760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  va_list va;
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
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  v20 = va_arg(va1, _QWORD);
  v21 = va_arg(va1, _QWORD);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)(v7 - 160));
  PacketCollection::~PacketCollection((PacketCollection *)va);
  PacketCollection::~PacketCollection((PacketCollection *)va1);

  _Unwind_Resume(a1);
}

double __os_log_helper_16_2_3_8_64_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double result;

  *(_QWORD *)&result = 138412802;
  *(_DWORD *)a1 = 138412802;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 2048;
  *(_QWORD *)(a1 + 24) = a4;
  return result;
}

double __os_log_helper_16_2_4_8_64_8_0_8_0_8_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double result;

  *(_QWORD *)&result = 138413058;
  *(_DWORD *)a1 = 138413058;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 2048;
  *(_QWORD *)(a1 + 24) = a4;
  *(_WORD *)(a1 + 32) = 2112;
  *(_QWORD *)(a1 + 34) = a5;
  return result;
}

void sub_245BE98E0()
{
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_5();
}

uint64_t ___ZL23SASGetTimestampCallbackv_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_257514580);
}

_QWORD *AlgDataExtractor::AlgDataExtractor(uint64_t a1, int a2, char a3)
{
  _QWORD *result;

  result = (_QWORD *)PacketCollection::PacketCollection(a1, a2, a3);
  *result = &off_2516DD3C8;
  result[10] = 0;
  result[11] = 0;
  return result;
}

void PacketCollection::~PacketCollection(PacketCollection *this)
{
  uint64_t *v2;

  *(_QWORD *)this = &off_2516DD3F8;
  v2 = (uint64_t *)((char *)this + 8);
  SAList<unsigned char>::~SAList((uint64_t *)this + 7);
  SAList<unsigned char>::~SAList((uint64_t *)this + 4);
  SAList<unsigned char>::~SAList(v2);
}

{
  PacketCollection::~PacketCollection(this);
  OUTLINED_FUNCTION_61();
  JUMPOUT(0x2495439B4);
}

uint64_t *SAList<unsigned char>::~SAList(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  if (v2)
    MEMORY[0x2495439A8](v2, 0x1000C8077774924);
  return a1;
}

#error "245BE9CA0: call analysis failed (funcsize=2)"

#error "245BE9CE0: call analysis failed (funcsize=2)"

_QWORD *AlgDataInjector::AlgDataInjector(uint64_t a1, int a2, char a3)
{
  _QWORD *result;

  result = (_QWORD *)PacketCollection::PacketCollection(a1, a2, a3);
  *result = &unk_2516DD428;
  return result;
}

void OUTLINED_FUNCTION_0_1(id a1)
{

}

BOOL OUTLINED_FUNCTION_1_0(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

void OUTLINED_FUNCTION_2_0(id *a1)
{
  objc_storeStrong(a1, 0);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  void *v0;

  return objc_msgSend(v0, "isEqualToString:");
}

uint64_t OUTLINED_FUNCTION_7()
{
  return mach_get_times();
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return PacketCollection::at((PacketCollection *)va, 0);
}

void OUTLINED_FUNCTION_9()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint64_t v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, (uint8_t *)(v5 - 176), 0x12u);
}

void OUTLINED_FUNCTION_13(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

}

void OUTLINED_FUNCTION_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AlgDataExtractor::callbackFor(a1, a2, a3, a4, 0, 0, a7, a8);
}

_QWORD *OUTLINED_FUNCTION_15(uint64_t a1, int a2)
{
  return AlgDataInjector::AlgDataInjector(a1, a2, 1);
}

_QWORD *OUTLINED_FUNCTION_16(uint64_t a1, int a2)
{
  return AlgDataExtractor::AlgDataExtractor(a1, a2, 1);
}

void OUTLINED_FUNCTION_17(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  PacketCollection::~PacketCollection((PacketCollection *)va);
}

void OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

}

void OUTLINED_FUNCTION_19(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_22(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

BOOL OUTLINED_FUNCTION_23(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_INFO);
}

char *OUTLINED_FUNCTION_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  return &a35;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return objc_opt_isKindOfClass();
}

BOOL OUTLINED_FUNCTION_26(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT);
}

void OUTLINED_FUNCTION_29(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = a1;

}

uint64_t OUTLINED_FUNCTION_30()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, "appendEvent:", v1);
}

_WORD *OUTLINED_FUNCTION_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  return __os_log_helper_16_0_0(&a9);
}

id OUTLINED_FUNCTION_32(id *a1)
{
  return *a1;
}

void OUTLINED_FUNCTION_33()
{
  void *v0;

}

void NovaHost::NovaHostAlgsDevice::NovaHostAlgsDevice(_QWORD *a1, uint64_t a2)
{
  SANovaHostVersionDescriptor();
  AlgsDevice::AlgsDevice(a1, a2, (uint64_t)"NovaHostDefaultPersonality");
}

uint64_t sub_245BE9F38(NovaHost::NovaHostAlgsDevice *a1)
{
  uint64_t v1;
  char v2;

  *(_QWORD *)v1 = &off_2516DCA40;
  *(_QWORD *)(v1 + 120) = 0;
  *(_BYTE *)(v1 + 128) = v2;
  NovaHost::NovaHostAlgsDevice::newPlanNode(a1, 0);
  return v1;
}

void sub_245BE9F68(_Unwind_Exception *a1)
{
  AlgsDevice *v1;

  AlgsDevice::~AlgsDevice(v1);
  _Unwind_Resume(a1);
}

BOOL NovaHost::NovaHostAlgsDevice::newPlanNode(NovaHost::NovaHostAlgsDevice *this, int a2)
{
  uint64_t v4;
  NovaHost::NovaHostActivePlan *v5;

  if (!a2)
  {
    v4 = *((_QWORD *)this + 15);
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    v5 = (NovaHost::NovaHostActivePlan *)operator new(4672, *((unsigned __int8 *)this + 128));
    *((_QWORD *)this + 15) = NovaHost::NovaHostActivePlan::NovaHostActivePlan(v5);
  }
  return a2 == 0;
}

void NovaHost::NovaHostAlgsDevice::~NovaHostAlgsDevice(NovaHost::NovaHostAlgsDevice *this)
{
  uint64_t v2;

  *(_QWORD *)this = &off_2516DCA40;
  v2 = *((_QWORD *)this + 15);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  AlgsDevice::~AlgsDevice(this);
}

{
  uint64_t v2;

  *(_QWORD *)this = &off_2516DCA40;
  v2 = *((_QWORD *)this + 15);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  AlgsDevice::~AlgsDevice(this);
  JUMPOUT(0x2495439B4);
}

uint64_t NovaHost::NovaHostAlgsDevice::planNode(NovaHost::NovaHostAlgsDevice *this)
{
  return *((_QWORD *)this + 15);
}

NovaHost::NovaHostActivePlan *NovaHost::NovaHostActivePlan::NovaHostActivePlan(NovaHost::NovaHostActivePlan *this)
{
  _QWORD *v2;
  uint64_t v3;
  char *v4;
  char ***v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  AlgTaskNode::AlgTaskNode(this);
  *v2 = &unk_2516DCAA0;
  v2[17] = 0;
  v3 = (uint64_t)(v2 + 17);
  v4 = (char *)(v2 + 20);
  v2[18] = 0;
  v2[19] = 0;
  AlgDataNode::AlgDataNode((AlgDataNode *)(v2 + 20), 0x726CDCE2C4D2802ALL, 0);
  *((_QWORD *)this + 20) = &unk_2516DCB18;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_DWORD *)this + 44) = 61451;
  *((_DWORD *)this + 46) = 32;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 224), 0xC79177FE77B0293ALL, 0);
  *((_WORD *)this + 127) = 0;
  *((_DWORD *)this + 60) = 20480;
  *((_DWORD *)this + 62) = 1;
  *((_QWORD *)this + 28) = &unk_2516DCB68;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 256), 0x658001896A50D1BALL, 0);
  *((_QWORD *)this + 32) = &unk_2516DCBD0;
  *((_BYTE *)this + 286) = 0;
  *((_DWORD *)this + 68) = 20480;
  *((_DWORD *)this + 70) = 1;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 288), 0x5A93A297EE678DAALL, 1);
  *((_QWORD *)this + 72) = 0;
  *((_OWORD *)this + 34) = 0u;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 28) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_DWORD *)this + 80) = -267714552;
  *((_WORD *)this + 162) = 32;
  *((_DWORD *)this + 76) = 39426;
  *((_DWORD *)this + 78) = 264;
  *((_QWORD *)this + 36) = &unk_2516DCC08;
  *((_QWORD *)this + 73) = &unk_2516DCC50;
  *((_WORD *)this + 296) = 0;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 600), 0xF761B8249EC06F80, 1);
  bzero((char *)this + 632, 0x408uLL);
  *((_DWORD *)this + 158) = -251592696;
  *((_WORD *)this + 318) = 32;
  *((_DWORD *)this + 154) = 39426;
  *((_DWORD *)this + 156) = 1032;
  *((_QWORD *)this + 75) = &unk_2516DCCD0;
  *((_QWORD *)this + 208) = &unk_2516DCD18;
  *((_WORD *)this + 836) = 0;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 1680), 0x5BF249159B57CEALL, 1);
  bzero((char *)this + 1712, 0x508uLL);
  *((_DWORD *)this + 428) = -251527160;
  *((_WORD *)this + 858) = 40;
  *((_DWORD *)this + 424) = 39426;
  *((_DWORD *)this + 426) = 1288;
  *((_QWORD *)this + 210) = &unk_2516DCD98;
  *((_QWORD *)this + 375) = &unk_2516DCDE0;
  *((_WORD *)this + 1504) = 0;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 3016), 0xE86303465E47D408, 0);
  *((_QWORD *)this + 381) = 0;
  *((_DWORD *)this + 758) = 61699;
  *((_DWORD *)this + 760) = 8;
  *((_QWORD *)this + 377) = &unk_2516DCE60;
  *((_BYTE *)this + 3056) = 0;
  NovaHost::InterpolationStep::InterpolationStep((uint64_t)this + 3064, 0xAD07F5970BDB4DA9, (uint64_t)v4, (uint64_t)this + 288);
  NovaHost::NovaButtonStateMachineStep::NovaButtonStateMachineStep((uint64_t)this + 3656, 0x9E0D7441786CB2A9, v3, (uint64_t)this + 288, (uint64_t)this + 224, (uint64_t)this + 256, (uint64_t)this + 600, (uint64_t)this + 1680);
  NovaHost::LiftoffVelocityStep::LiftoffVelocityStep((NovaHost::NovaHostActivePlan *)((char *)this + 4184), 0xB54CAD6BAF9995ALL, (uint64_t)this + 600, (uint64_t)this + 1680);
  NovaHost::CoreAnalyticsStep::CoreAnalyticsStep((NovaHost::NovaHostActivePlan *)((char *)this + 4520), 0xDA4E27EE52440112, v4, (uint64_t)this + 256, (uint64_t)this + 224, (uint64_t)this + 3016);
  v6 = (char ***)v4;
  v7 = (uint64_t)this + 224;
  v8 = (char *)this + 256;
  v10 = (char **)&v6;
  v11 = 3;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)this + 8, (uint64_t)&v10);
  v10 = (char **)((char *)this + 288);
  v6 = &v10;
  v7 = 1;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)this + 32, (uint64_t)&v6);
  v6 = (char ***)((char *)this + 600);
  v7 = (uint64_t)this + 1680;
  v8 = (char *)this + 3016;
  v10 = (char **)&v6;
  v11 = 3;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)this + 56, (uint64_t)&v10);
  v6 = (char ***)((char *)this + 3064);
  v7 = (uint64_t)this + 3656;
  v8 = (char *)this + 4184;
  v9 = (char *)this + 4520;
  v10 = (char **)&v6;
  v11 = 4;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)this + 112, (uint64_t)&v10);
  *((_BYTE *)this + 3048) = 1;
  return this;
}

void sub_245BEA4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, NovaHost::InterpolationStep *a10, _QWORD *a11, _QWORD *a12, _QWORD *a13)
{
  AlgTaskNode *v13;
  NovaHost::NovaButtonStateMachineStep *v14;
  AlgWorkNode *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  AlgWorkNode *v19;
  _QWORD *v20;

  AlgWorkNode::~AlgWorkNode(v15);
  AlgWorkNode::~AlgWorkNode(v19);
  NovaHost::NovaButtonStateMachineStep::~NovaButtonStateMachineStep(v14);
  NovaHost::InterpolationStep::~InterpolationStep(a10);
  *v18 = &off_2516DD220;
  *v17 = &off_2516DD220;
  *v16 = &off_2516DD220;
  *a11 = &off_2516DD220;
  *v20 = &off_2516DD220;
  *a13 = &off_2516DD220;
  *a12 = &off_2516DD220;
  AlgTaskNode::~AlgTaskNode(v13);
  _Unwind_Resume(a1);
}

void sub_245BEA59C()
{
  JUMPOUT(0x245BEA500);
}

void sub_245BEA5A4()
{
  JUMPOUT(0x245BEA508);
}

void sub_245BEA5AC()
{
  JUMPOUT(0x245BEA510);
}

void sub_245BEA5B4()
{
  JUMPOUT(0x245BEA520);
}

void sub_245BEA5BC()
{
  JUMPOUT(0x245BEA530);
}

void sub_245BEA5C4()
{
  JUMPOUT(0x245BEA540);
}

void sub_245BEA5CC()
{
  JUMPOUT(0x245BEA554);
}

void sub_245BEA5D4()
{
  JUMPOUT(0x245BEA564);
}

void sub_245BEA5DC()
{
  JUMPOUT(0x245BEA578);
}

void sub_245BEA5E4()
{
  JUMPOUT(0x245BEA58CLL);
}

void NovaHost::NovaButtonStateMachineStep::~NovaButtonStateMachineStep(NovaHost::NovaButtonStateMachineStep *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &unk_2516DCFB8;
  v2 = *((_QWORD *)this + 56);
  if (v2)
    MEMORY[0x2495439A8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 53);
  if (v3)
    MEMORY[0x2495439A8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 50);
  if (v4)
    MEMORY[0x2495439A8](v4, 0x1000C8077774924);
  *((_QWORD *)this + 40) = &off_2516DD220;
  *((_QWORD *)this + 32) = &off_2516DD220;
  *((_QWORD *)this + 27) = &off_2516DD220;
  *((_QWORD *)this + 22) = &off_2516DD220;
  *((_QWORD *)this + 18) = &off_2516DD220;
  AlgWorkNode::~AlgWorkNode(this);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &unk_2516DCFB8;
  v2 = *((_QWORD *)this + 56);
  if (v2)
    MEMORY[0x2495439A8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 53);
  if (v3)
    MEMORY[0x2495439A8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 50);
  if (v4)
    MEMORY[0x2495439A8](v4, 0x1000C8077774924);
  *((_QWORD *)this + 40) = &off_2516DD220;
  *((_QWORD *)this + 32) = &off_2516DD220;
  *((_QWORD *)this + 27) = &off_2516DD220;
  *((_QWORD *)this + 22) = &off_2516DD220;
  *((_QWORD *)this + 18) = &off_2516DD220;
  AlgWorkNode::~AlgWorkNode(this);
  JUMPOUT(0x2495439B4);
}

_QWORD *PlainDataNodeWithValidity<NovaHostCoreAnalytics>::~PlainDataNodeWithValidity(_QWORD *result)
{
  *result = &off_2516DD220;
  return result;
}

void AlgTaskNode::~AlgTaskNode(AlgTaskNode *this)
{
  uint64_t v2;

  *(_QWORD *)this = &off_2516DD268;
  if (*((_DWORD *)this + 31))
    *((_DWORD *)this + 31) = 0;
  v2 = *((_QWORD *)this + 14);
  if (v2)
    MEMORY[0x2495439A8](v2, 0x1000C8077774924);
  AlgWorkNode::~AlgWorkNode(this);
}

{
  AlgTaskNode::~AlgTaskNode(this);
  JUMPOUT(0x2495439B4);
}

void NovaHost::NovaHostActivePlan::~NovaHostActivePlan(NovaHost::NovaHostActivePlan *this)
{
  NovaHost::NovaHostActivePlan::~NovaHostActivePlan(this);
  JUMPOUT(0x2495439B4);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &unk_2516DCAA0;
  AlgWorkNode::~AlgWorkNode((NovaHost::NovaHostActivePlan *)((char *)this + 4520));
  AlgWorkNode::~AlgWorkNode((NovaHost::NovaHostActivePlan *)((char *)this + 4184));
  *((_QWORD *)this + 457) = &unk_2516DCFB8;
  v2 = *((_QWORD *)this + 513);
  if (v2)
    MEMORY[0x2495439A8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 510);
  if (v3)
    MEMORY[0x2495439A8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 507);
  if (v4)
    MEMORY[0x2495439A8](v4, 0x1000C8077774924);
  *((_QWORD *)this + 497) = &off_2516DD220;
  *((_QWORD *)this + 489) = &off_2516DD220;
  *((_QWORD *)this + 484) = &off_2516DD220;
  *((_QWORD *)this + 479) = &off_2516DD220;
  *((_QWORD *)this + 475) = &off_2516DD220;
  AlgWorkNode::~AlgWorkNode((NovaHost::NovaHostActivePlan *)((char *)this + 3656));
  NovaHost::InterpolationStep::~InterpolationStep((NovaHost::NovaHostActivePlan *)((char *)this + 3064));
  *((_QWORD *)this + 377) = &off_2516DD220;
  *((_QWORD *)this + 210) = &off_2516DD220;
  *((_QWORD *)this + 75) = &off_2516DD220;
  *((_QWORD *)this + 36) = &off_2516DD220;
  *((_QWORD *)this + 32) = &off_2516DD220;
  *((_QWORD *)this + 28) = &off_2516DD220;
  *((_QWORD *)this + 20) = &off_2516DD220;
  AlgTaskNode::~AlgTaskNode(this);
}

uint64_t AlgTaskNode::children(AlgTaskNode *this)
{
  return (uint64_t)this + 112;
}

uint64_t AlgTaskNode::run(AlgTaskNode *this)
{
  return 1280;
}

void NovaHost::NovaHostActivePlan::runPlan(uint64_t a1, uint64_t a2, AlgDataInjector *a3, AlgDataExtractor *a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 + 16);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)v4;
  *(_QWORD *)(a1 + 152) = v5;
  AlgTaskNode::runTask((AlgTaskNode *)a1, a3, a4);
}

void PlainDataNode<NovaOutput>::~PlainDataNode(_QWORD *a1)
{
  *a1 = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

uint64_t PlainDataNode<NovaOutput>::sendCallback(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  *(_QWORD *)(a3 + 56) = a1 + 32;
  return a2(a3);
}

__n128 PlainDataNode<NovaOutput>::injectBuffer(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 48) = v3;
  return result;
}

void PlainDataNodeWithValidity<BOOL>::~PlainDataNodeWithValidity(_QWORD *a1)
{
  *a1 = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

uint64_t PlainDataNodeWithValidity<BOOL>::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (*(_BYTE *)(result + 31))
  {
    *(_QWORD *)(a3 + 56) = result + 30;
    return a2(a3);
  }
  return result;
}

uint64_t PlainDataNode<BOOL>::injectBuffer(uint64_t result, _BYTE *a2)
{
  *(_BYTE *)(result + 30) = *a2;
  return result;
}

void PlainDataNode<BOOL>::~PlainDataNode(_QWORD *a1)
{
  *a1 = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

uint64_t PlainDataNode<BOOL>::sendCallback(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  *(_QWORD *)(a3 + 56) = a1 + 30;
  return a2(a3);
}

void SADynamicArray<NovaOutput,(unsigned short)8>::~SADynamicArray(_QWORD *a1)
{
  *a1 = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

uint64_t SADynamicArray<NovaOutput,(unsigned short)8>::sendCallback(unsigned __int16 *a1, uint64_t (*a2)(_QWORD *), _QWORD *a3)
{
  uint64_t result;

  if (*((_BYTE *)a1 + 304)
    || (result = (*(uint64_t (**)(unsigned __int16 *))(*(_QWORD *)a1 + 40))(a1), (_DWORD)result))
  {
    a3[4] = a1[16];
    a3[5] = a1 + 16;
    a3[7] = (*(uint64_t (**)(unsigned __int16 *))(*(_QWORD *)a1 + 48))(a1);
    a3[6] = 32 * (*(unsigned int (**)(unsigned __int16 *))(*(_QWORD *)a1 + 40))(a1);
    return a2(a3);
  }
  return result;
}

void SADynamicArray<NovaOutput,(unsigned short)8>::injectBuffer(uint64_t a1, unsigned __int16 *a2)
{
  unsigned int v3;
  size_t v4;
  unint64_t v5;
  char *v6;
  size_t v7;
  char *v8;

  if (*(_BYTE *)(a1 + 305) || !*(_BYTE *)(a1 + 29))
  {
    *(_WORD *)(a1 + 38) = a2[3];
    v3 = a2[2];
    v4 = v3 >= 0x20 ? 32 : a2[2];
    if (a2[3])
    {
      v5 = 0;
      v6 = (char *)a2 + *a2;
      if (v3 <= 0x20)
        v7 = 32 - v3;
      else
        v7 = 0;
      v8 = (char *)(a1 + 40);
      do
      {
        memcpy(v8, &v6[v5 * a2[2]], v4);
        if (v3 <= 0x1F)
          bzero(&v8[v4], v7);
        ++v5;
        v8 += 32;
      }
      while (v5 < a2[3]);
    }
  }
}

uint64_t SADynamicArray<NovaOutput,(unsigned short)8>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 38);
}

uint64_t SADynamicArray<NovaOutput,(unsigned short)8>::contents(uint64_t a1)
{
  return a1 + 40;
}

uint64_t `non-virtual thunk to'SADynamicArray<NovaOutput,(unsigned short)8>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 - 258);
}

uint64_t `non-virtual thunk to'SADynamicArray<NovaOutput,(unsigned short)8>::contents(uint64_t a1)
{
  return a1 - 256;
}

void SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::~SADynamicArray(_QWORD *a1)
{
  *a1 = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

uint64_t SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::sendCallback(unsigned __int16 *a1, uint64_t (*a2)(_QWORD *), _QWORD *a3)
{
  uint64_t result;

  if (*((_BYTE *)a1 + 1072)
    || (result = (*(uint64_t (**)(unsigned __int16 *))(*(_QWORD *)a1 + 40))(a1), (_DWORD)result))
  {
    a3[4] = a1[16];
    a3[5] = a1 + 16;
    a3[7] = (*(uint64_t (**)(unsigned __int16 *))(*(_QWORD *)a1 + 48))(a1);
    a3[6] = 32 * (*(unsigned int (**)(unsigned __int16 *))(*(_QWORD *)a1 + 40))(a1);
    return a2(a3);
  }
  return result;
}

void SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::injectBuffer(uint64_t a1, unsigned __int16 *a2)
{
  unsigned int v3;
  size_t v4;
  unint64_t v5;
  char *v6;
  size_t v7;
  char *v8;

  if (*(_BYTE *)(a1 + 1073) || !*(_BYTE *)(a1 + 29))
  {
    *(_WORD *)(a1 + 38) = a2[3];
    v3 = a2[2];
    v4 = v3 >= 0x20 ? 32 : a2[2];
    if (a2[3])
    {
      v5 = 0;
      v6 = (char *)a2 + *a2;
      if (v3 <= 0x20)
        v7 = 32 - v3;
      else
        v7 = 0;
      v8 = (char *)(a1 + 40);
      do
      {
        memcpy(v8, &v6[v5 * a2[2]], v4);
        if (v3 <= 0x1F)
          bzero(&v8[v4], v7);
        ++v5;
        v8 += 32;
      }
      while (v5 < a2[3]);
    }
  }
}

uint64_t `non-virtual thunk to'SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 - 1026);
}

uint64_t `non-virtual thunk to'SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::contents(uint64_t a1)
{
  return a1 - 1024;
}

void SADynamicArray<ForceStageEventPacket,(unsigned short)32>::~SADynamicArray(_QWORD *a1)
{
  *a1 = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

uint64_t SADynamicArray<ForceStageEventPacket,(unsigned short)32>::sendCallback(unsigned __int16 *a1, uint64_t (*a2)(_QWORD *), _QWORD *a3)
{
  uint64_t result;

  if (*((_BYTE *)a1 + 1328)
    || (result = (*(uint64_t (**)(unsigned __int16 *))(*(_QWORD *)a1 + 40))(a1), (_DWORD)result))
  {
    a3[4] = a1[16];
    a3[5] = a1 + 16;
    a3[7] = (*(uint64_t (**)(unsigned __int16 *))(*(_QWORD *)a1 + 48))(a1);
    a3[6] = 40 * (*(unsigned int (**)(unsigned __int16 *))(*(_QWORD *)a1 + 40))(a1);
    return a2(a3);
  }
  return result;
}

void SADynamicArray<ForceStageEventPacket,(unsigned short)32>::injectBuffer(uint64_t a1, unsigned __int16 *a2)
{
  unsigned int v3;
  size_t v4;
  unint64_t v5;
  char *v6;
  size_t v7;
  char *v8;

  if (*(_BYTE *)(a1 + 1329) || !*(_BYTE *)(a1 + 29))
  {
    *(_WORD *)(a1 + 38) = a2[3];
    v3 = a2[2];
    v4 = v3 >= 0x28 ? 40 : a2[2];
    if (a2[3])
    {
      v5 = 0;
      v6 = (char *)a2 + *a2;
      if (v3 <= 0x28)
        v7 = 40 - v3;
      else
        v7 = 0;
      v8 = (char *)(a1 + 40);
      do
      {
        memcpy(v8, &v6[v5 * a2[2]], v4);
        if (v3 <= 0x27)
          bzero(&v8[v4], v7);
        ++v5;
        v8 += 40;
      }
      while (v5 < a2[3]);
    }
  }
}

uint64_t `non-virtual thunk to'SADynamicArray<ForceStageEventPacket,(unsigned short)32>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 - 1282);
}

uint64_t `non-virtual thunk to'SADynamicArray<ForceStageEventPacket,(unsigned short)32>::contents(uint64_t a1)
{
  return a1 - 1280;
}

void PlainDataNodeWithValidity<NovaHostCoreAnalytics>::~PlainDataNodeWithValidity(_QWORD *a1)
{
  *a1 = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

uint64_t PlainDataNodeWithValidity<NovaHostCoreAnalytics>::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (*(_BYTE *)(result + 40))
  {
    *(_QWORD *)(a3 + 56) = result + 32;
    return a2(a3);
  }
  return result;
}

uint64_t PlainDataNode<NovaHostCoreAnalytics>::injectBuffer(uint64_t result, _QWORD *a2)
{
  *(_QWORD *)(result + 32) = *a2;
  return result;
}

uint64_t NovaHost::InterpolationStep::InterpolationStep(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  AlgWorkNode::AlgWorkNode((AlgWorkNode *)a1);
  *v7 = &unk_2516DCEC8;
  v7[14] = a3;
  v8 = v7 + 15;
  AlgDataNode::AlgDataNode((AlgDataNode *)(v7 + 15), 0xEA52A8B328945C38, 0);
  *(_QWORD *)(a1 + 120) = &unk_2516DCBD0;
  *(_BYTE *)(a1 + 150) = 0;
  *(_DWORD *)(a1 + 136) = 20480;
  *(_DWORD *)(a1 + 144) = 1;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 152), 0xC99FA38EDDBFB984, 0);
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 152) = &unk_2516DCF18;
  *(_DWORD *)(a1 + 168) = 20720;
  *(_DWORD *)(a1 + 176) = 8;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 192), 0xC99FB05AB16417D5, 0);
  *(_QWORD *)(a1 + 192) = &unk_2516DCB18;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_DWORD *)(a1 + 208) = 61451;
  *(_DWORD *)(a1 + 216) = 32;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 256), 0xF860E8F10D73DE9ELL, 0);
  *(_QWORD *)(a1 + 256) = &unk_2516DCF68;
  *(_DWORD *)(a1 + 272) = 20488;
  *(_DWORD *)(a1 + 280) = 8;
  *(_QWORD *)(a1 + 288) = 0;
  *(_QWORD *)(a1 + 296) = a4;
  *(_QWORD *)(a1 + 304) = a1 + 184;
  *(_BYTE *)(a1 + 312) = 1;
  *(_DWORD *)(a1 + 316) = 8;
  *(_QWORD *)(a1 + 320) = 0;
  *(_QWORD *)(a1 + 328) = 8;
  *(_BYTE *)(a1 + 336) = 0;
  *(_QWORD *)(a1 + 344) = 0;
  *(_QWORD *)(a1 + 352) = 8;
  *(_BYTE *)(a1 + 360) = 0;
  *(_QWORD *)(a1 + 400) = a1 + 184;
  *(_BYTE *)(a1 + 408) = 0;
  *(_DWORD *)(a1 + 412) = 8;
  *(_QWORD *)(a1 + 416) = 0;
  *(_QWORD *)(a1 + 424) = 8;
  *(_BYTE *)(a1 + 432) = 0;
  *(_QWORD *)(a1 + 440) = 0;
  *(_QWORD *)(a1 + 448) = 8;
  *(_BYTE *)(a1 + 456) = 0;
  *(_QWORD *)(a1 + 496) = a1 + 184;
  *(_BYTE *)(a1 + 504) = 0;
  *(_DWORD *)(a1 + 508) = 8;
  *(_QWORD *)(a1 + 512) = 0;
  *(_QWORD *)(a1 + 520) = 8;
  *(_BYTE *)(a1 + 528) = 0;
  *(_QWORD *)(a1 + 536) = 0;
  *(_QWORD *)(a1 + 544) = 8;
  *(_BYTE *)(a1 + 552) = 0;
  v9 = *(_QWORD *)(a1 + 112);
  v13 = 1;
  v14[0] = v9;
  v12 = v14;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 8, (uint64_t)&v12);
  v14[0] = a1 + 152;
  v14[1] = v8;
  v12 = v14;
  v13 = 2;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 32, (uint64_t)&v12);
  v10 = *(_QWORD *)(a1 + 296);
  v12 = v14;
  v13 = 1;
  v14[0] = v10;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 56, (uint64_t)&v12);
  *(_QWORD *)(a1 + 184) = 0x406E000000000000;
  *(_BYTE *)(a1 + 150) = 1;
  return a1;
}

void sub_245BEAFAC(_Unwind_Exception *a1)
{
  AlgWorkNode *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  NovaHost::Interpolator<float>::~Interpolator((uint64_t)v1 + 496);
  NovaHost::Interpolator<float>::~Interpolator((uint64_t)v1 + 400);
  NovaHost::Interpolator<float>::~Interpolator((uint64_t)v1 + 304);
  *v5 = &off_2516DD220;
  *v4 = &off_2516DD220;
  *v3 = &off_2516DD220;
  *v2 = &off_2516DD220;
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void sub_245BEB038()
{
  JUMPOUT(0x245BEB018);
}

void sub_245BEB040()
{
  JUMPOUT(0x245BEB028);
}

uint64_t NovaHost::Interpolator<float>::~Interpolator(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    MEMORY[0x2495439A8](v2, 0x1000C8077774924);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
    MEMORY[0x2495439A8](v3, 0x1000C8077774924);
  return a1;
}

void AlgWorkNode::~AlgWorkNode(AlgWorkNode *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)this = off_2516DD2E0;
  if (*((_DWORD *)this + 5))
    *((_DWORD *)this + 5) = 0;
  if (*((_DWORD *)this + 11))
    *((_DWORD *)this + 11) = 0;
  if (*((_DWORD *)this + 17))
    *((_DWORD *)this + 17) = 0;
  if (*((_DWORD *)this + 23))
    *((_DWORD *)this + 23) = 0;
  v2 = *((_QWORD *)this + 10);
  if (v2)
    MEMORY[0x2495439A8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 7);
  if (v3)
    MEMORY[0x2495439A8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 4);
  if (v4)
    MEMORY[0x2495439A8](v4, 0x1000C8077774924);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    MEMORY[0x2495439A8](v5, 0x1000C8077774924);
}

void NovaHost::InterpolationStep::~InterpolationStep(NovaHost::InterpolationStep *this)
{
  NovaHost::InterpolationStep::~InterpolationStep(this);
  JUMPOUT(0x2495439B4);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &unk_2516DCEC8;
  v2 = *((_QWORD *)this + 67);
  if (v2)
    MEMORY[0x2495439A8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 64);
  if (v3)
    MEMORY[0x2495439A8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 55);
  if (v4)
    MEMORY[0x2495439A8](v4, 0x1000C8077774924);
  v5 = *((_QWORD *)this + 52);
  if (v5)
    MEMORY[0x2495439A8](v5, 0x1000C8077774924);
  v6 = *((_QWORD *)this + 43);
  if (v6)
    MEMORY[0x2495439A8](v6, 0x1000C8077774924);
  v7 = *((_QWORD *)this + 40);
  if (v7)
    MEMORY[0x2495439A8](v7, 0x1000C8077774924);
  *((_QWORD *)this + 32) = &off_2516DD220;
  *((_QWORD *)this + 24) = &off_2516DD220;
  *((_QWORD *)this + 19) = &off_2516DD220;
  *((_QWORD *)this + 15) = &off_2516DD220;
  AlgWorkNode::~AlgWorkNode(this);
}

uint64_t NovaHost::InterpolationStep::run(__n128 *this)
{
  __n128 *v1;
  __n128 *v3;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __n128 v14;
  __n128 v15;

  v1 = (__n128 *)this[7].n128_u64[0];
  *(_WORD *)(this[18].n128_u64[1] + 38) = 0;
  if (v1[1].n128_u8[13])
  {
    v3 = v1 + 2;
    if (!v1[2].n128_u8[2])
      goto LABEL_17;
    v4 = v1[2].n128_i64[1];
    v5 = v4 - this[18].n128_u64[0];
    if (this[14].n128_u8[2] && v5 >= 0x4E21)
    {
      v6 = SALoggingGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        NovaHost::InterpolationStep::run((uint64_t *)&this[18], &v1[2].n128_i64[1], v6);
      goto LABEL_17;
    }
    if (!this[9].n128_u8[6]
      || !this[14].n128_u8[2]
      || v5 >= 0x4E21
      || (v7 = NovaHost::Interpolator<float>::run((uint64_t)&this[19], v4, v1[2].n128_f32[1]),
          v8 = NovaHost::Interpolator<float>::run((uint64_t)&this[25], v1[2].n128_i64[1], v1[3].n128_f32[0]),
          v9 = NovaHost::Interpolator<float>::run((uint64_t)&this[31], v1[2].n128_i64[1], v1[3].n128_f32[1]),
          !v7)
      || !v8
      || !v9)
    {
LABEL_17:
      NovaHost::InterpolationStep::runPassthrough(this, v1 + 2);
      return 0;
    }
    if (this[22].n128_u32[1])
    {
      v10 = 0;
      do
      {
        v11 = this[18].n128_u64[1];
        v12 = *(unsigned __int16 *)(v11 + 38);
        v13 = v11 + 32 * v12;
        *(_WORD *)(v11 + 38) = v12 + 1;
        v14 = *v3;
        *(__n128 *)(v13 + 56) = v1[3];
        *(__n128 *)(v13 + 40) = v14;
        *(_QWORD *)(v13 + 48) = *(_QWORD *)(this[21].n128_u64[1] + 8 * v10);
        *(_DWORD *)(v13 + 44) = *(_DWORD *)(this[20].n128_u64[0] + 4 * v10);
        *(_DWORD *)(v13 + 56) = *(_DWORD *)(this[26].n128_u64[0] + 4 * v10);
        *(_DWORD *)(v13 + 60) = *(_DWORD *)(this[32].n128_u64[0] + 4 * v10++);
      }
      while (v10 < this[22].n128_u32[1]);
    }
    v15 = v1[3];
    this[14] = *v3;
    this[15] = v15;
    this[18].n128_u64[0] = v1[2].n128_u64[1];
  }
  return 0;
}

void PlainDataNode<double>::~PlainDataNode(_QWORD *a1)
{
  *a1 = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

__n128 NovaHost::InterpolationStep::runPassthrough(__n128 *a1, __n128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  __n128 result;
  __n128 v9;

  NovaHost::Interpolator<float>::reset_state((uint64_t)&a1[19], a2->n128_u64[1], a2->n128_f32[1]);
  NovaHost::Interpolator<float>::reset_state((uint64_t)&a1[25], a2->n128_u64[1], a2[1].n128_f32[0]);
  NovaHost::Interpolator<float>::reset_state((uint64_t)&a1[31], a2->n128_u64[1], a2[1].n128_f32[1]);
  v4 = a1[18].n128_i64[1];
  v5 = *(unsigned __int16 *)(v4 + 38);
  v6 = v4 + 32 * v5;
  *(_WORD *)(v4 + 38) = v5 + 1;
  v7 = *a2;
  *(__n128 *)(v6 + 56) = a2[1];
  *(__n128 *)(v6 + 40) = v7;
  result = *a2;
  v9 = a2[1];
  a1[14] = *a2;
  a1[15] = v9;
  a1[18].n128_u64[0] = a2->n128_u64[1];
  return result;
}

uint64_t NovaHost::NovaButtonStateMachineStep::NovaButtonStateMachineStep(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v15;
  _QWORD *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  AlgWorkNode::AlgWorkNode((AlgWorkNode *)a1);
  *v15 = &unk_2516DCFB8;
  v15[14] = a3;
  v15[15] = a4;
  v15[16] = a5;
  v15[17] = a6;
  v17 = v15 + 18;
  AlgDataNode::AlgDataNode((AlgDataNode *)(v15 + 18), 0xC9B3C161F911BBE6, 0);
  *(_BYTE *)(a1 + 174) = 0;
  *(_QWORD *)(a1 + 144) = &unk_2516DCBD0;
  *(_DWORD *)(a1 + 160) = 20480;
  *(_DWORD *)(a1 + 168) = 1;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 176), 0x35AAE77916372217, 0);
  *(_DWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 176) = &unk_2516DD008;
  *(_DWORD *)(a1 + 192) = 20481;
  *(_DWORD *)(a1 + 200) = 4;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 216), 0xC9B395F2E24E96B8, 0);
  *(_DWORD *)(a1 + 248) = 0;
  *(_QWORD *)(a1 + 216) = &unk_2516DD008;
  *(_DWORD *)(a1 + 232) = 20481;
  *(_DWORD *)(a1 + 240) = 4;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 256));
  *(_QWORD *)(a1 + 256) = &unk_2516DCB18;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_DWORD *)(a1 + 272) = 61451;
  *(_DWORD *)(a1 + 280) = 32;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 320), 0x7DC316DA412088EELL, 0);
  *(_QWORD *)(a1 + 320) = &unk_2516DCBD0;
  *(_BYTE *)(a1 + 350) = 0;
  *(_DWORD *)(a1 + 336) = 20480;
  *(_DWORD *)(a1 + 344) = 1;
  *(_QWORD *)(a1 + 352) = a7;
  *(_QWORD *)(a1 + 360) = a8;
  *(_QWORD *)(a1 + 368) = a1 + 174;
  *(_QWORD *)(a1 + 376) = a1 + 208;
  *(_QWORD *)(a1 + 384) = a1 + 248;
  *(_QWORD *)(a1 + 392) = a1 + 350;
  *(_QWORD *)(a1 + 400) = 0;
  *(_QWORD *)(a1 + 408) = 16;
  *(_BYTE *)(a1 + 416) = 0;
  *(_QWORD *)(a1 + 424) = 0;
  *(_QWORD *)(a1 + 432) = 16;
  *(_BYTE *)(a1 + 440) = 0;
  *(_QWORD *)(a1 + 448) = 0;
  *(_QWORD *)(a1 + 456) = 16;
  *(_BYTE *)(a1 + 464) = 0;
  *(_OWORD *)(a1 + 498) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_QWORD *)(a1 + 516) = 0;
  *(_BYTE *)(a1 + 524) = 0;
  v18 = *(_OWORD *)(a1 + 120);
  v19 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)&v21 = &v18;
  *((_QWORD *)&v21 + 1) = 3;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 8, (uint64_t)&v21);
  *(_QWORD *)&v18 = v17;
  *((_QWORD *)&v18 + 1) = a1 + 176;
  v19 = a1 + 216;
  v20 = a1 + 320;
  *(_QWORD *)&v21 = &v18;
  *((_QWORD *)&v21 + 1) = 4;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 32, (uint64_t)&v21);
  v21 = *(_OWORD *)(a1 + 352);
  *(_QWORD *)&v18 = &v21;
  *((_QWORD *)&v18 + 1) = 2;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 56, (uint64_t)&v18);
  *(_BYTE *)(a1 + 174) = 1;
  *(_BYTE *)(a1 + 350) = 0;
  *(_DWORD *)(a1 + 208) = 1040187392;
  *(_DWORD *)(a1 + 248) = 1036831949;
  return a1;
}

void sub_245BEB680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _QWORD *a9, _QWORD *a10)
{
  AlgWorkNode *v10;
  _QWORD *v11;
  _QWORD *v12;
  NovaHost::NovaButtonStateMachine *v13;
  _QWORD *v14;

  NovaHost::NovaButtonStateMachine::~NovaButtonStateMachine(v13);
  *v14 = &off_2516DD220;
  *v11 = &off_2516DD220;
  *v12 = &off_2516DD220;
  *a9 = &off_2516DD220;
  *a10 = &off_2516DD220;
  AlgWorkNode::~AlgWorkNode(v10);
  _Unwind_Resume(a1);
}

void sub_245BEB70C()
{
  JUMPOUT(0x245BEB6D4);
}

void sub_245BEB714()
{
  JUMPOUT(0x245BEB6E8);
}

void sub_245BEB71C()
{
  JUMPOUT(0x245BEB6FCLL);
}

void NovaHost::NovaButtonStateMachine::~NovaButtonStateMachine(NovaHost::NovaButtonStateMachine *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 10);
  if (v2)
    MEMORY[0x2495439A8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 7);
  if (v3)
    MEMORY[0x2495439A8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 4);
  if (v4)
    MEMORY[0x2495439A8](v4, 0x1000C8077774924);
}

uint64_t NovaHost::NovaButtonStateMachineStep::run(NovaHost::NovaButtonStateMachineStep *this)
{
  uint64_t v2;
  NovaHost::NovaButtonStateMachine *v3;
  uint64_t v4;
  int v5;
  int v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  __int128 *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  unint64_t v28;
  __int128 *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;

  v2 = *((_QWORD *)this + 45);
  *(_WORD *)(*((_QWORD *)this + 44) + 38) = 0;
  *(_WORD *)(v2 + 38) = 0;
  v3 = (NovaHost::NovaButtonStateMachineStep *)((char *)this + 368);
  NovaHost::NovaButtonStateMachine::clearHIDEvents((uint64_t)this + 368);
  v4 = *((_QWORD *)this + 17);
  v5 = *(unsigned __int8 *)(v4 + 29);
  v6 = *(unsigned __int8 *)(v4 + 30);
  if (!v5)
  {
    if (!v6)
    {
      v7 = (_BYTE *)*((_QWORD *)this + 16);
      if (!v7[29])
        return 0;
      goto LABEL_6;
    }
LABEL_5:
    v7 = (_BYTE *)*((_QWORD *)this + 16);
    if (!v7[29])
    {
      v7[31] = 0;
      goto LABEL_8;
    }
LABEL_6:
    v7[31] = 1;
    NovaHost::NovaButtonStateMachine::setFullPressState((uint64_t)v3, v7[30]);
LABEL_8:
    v8 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 15) + 40))(*((_QWORD *)this + 15));
    if (!v8)
    {
      v9 = *((_QWORD *)this + 15);
      v10 = *(unsigned __int16 *)(v9 + 38);
      v11 = v9 + 32 * v10;
      *(_WORD *)(v9 + 38) = v10 + 1;
      v12 = *((_OWORD *)this + 19);
      *(_OWORD *)(v11 + 40) = *((_OWORD *)this + 18);
      *(_OWORD *)(v11 + 56) = v12;
      *(_DWORD *)(v11 + 44) = 0;
    }
    if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 15) + 40))(*((_QWORD *)this + 15)))
    {
      v14 = 0;
      v15 = 40;
      do
      {
        if (v8)
        {
          v16 = *((_QWORD *)this + 15);
          v17 = (uint64_t *)(v16 + v15 + 8);
        }
        else
        {
          v17 = (uint64_t *)*((_QWORD *)this + 14);
          v16 = *((_QWORD *)this + 15);
        }
        NovaHost::NovaButtonStateMachine::update((uint64_t)v3, (__int128 *)(v16 + v15), *v17, v13);
        v18 = *((_QWORD *)this + 15);
        v19 = *(_OWORD *)(v18 + v15 + 16);
        *((_OWORD *)this + 18) = *(_OWORD *)(v18 + v15);
        *((_OWORD *)this + 19) = v19;
        ++v14;
        v15 += 32;
      }
      while (v14 < (*(unsigned int (**)(uint64_t))(*(_QWORD *)v18 + 40))(v18));
    }
    goto LABEL_16;
  }
  if (v6)
    goto LABEL_5;
  NovaHost::NovaButtonStateMachine::cleanup(v3);
LABEL_16:
  if (*((_DWORD *)this + 109))
  {
    v20 = 0;
    v21 = 0;
    do
    {
      v22 = (__int128 *)(*((_QWORD *)this + 53) + v20);
      v23 = *((_QWORD *)this + 44);
      v24 = *(unsigned __int16 *)(v23 + 38);
      v25 = v23 + 32 * v24;
      *(_WORD *)(v23 + 38) = v24 + 1;
      v26 = *v22;
      *(_OWORD *)(v25 + 56) = v22[1];
      *(_OWORD *)(v25 + 40) = v26;
      ++v21;
      v20 += 32;
    }
    while (v21 < *((unsigned int *)this + 109));
  }
  if (*((_DWORD *)this + 115))
  {
    v27 = 0;
    v28 = 0;
    do
    {
      v29 = (__int128 *)(*((_QWORD *)this + 56) + v27);
      v30 = *((_QWORD *)this + 45);
      v31 = v30 + 40 * (unsigned __int16)(*(_WORD *)(v30 + 38))++;
      v32 = *v29;
      v33 = v29[1];
      *(_QWORD *)(v31 + 72) = *((_QWORD *)v29 + 4);
      *(_OWORD *)(v31 + 56) = v33;
      *(_OWORD *)(v31 + 40) = v32;
      ++v28;
      v27 += 40;
    }
    while (v28 < *((unsigned int *)this + 115));
  }
  return 0;
}

void PlainDataNode<float>::~PlainDataNode(_QWORD *a1)
{
  *a1 = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

uint64_t PlainDataNode<float>::injectBuffer(uint64_t result, _DWORD *a2)
{
  *(_DWORD *)(result + 32) = *a2;
  return result;
}

AlgWorkNode *NovaHost::LiftoffVelocityStep::LiftoffVelocityStep(AlgWorkNode *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  AlgWorkNode::AlgWorkNode(a1);
  *(_QWORD *)v7 = &unk_2516DD058;
  *(_QWORD *)(v7 + 112) = a3;
  *(_QWORD *)(v7 + 120) = a4;
  *(_OWORD *)(v7 + 144) = 0u;
  *(_OWORD *)(v7 + 160) = 0u;
  *(_OWORD *)(v7 + 176) = 0u;
  *(_OWORD *)(v7 + 192) = 0u;
  *(_OWORD *)(v7 + 208) = 0u;
  *(_OWORD *)(v7 + 224) = 0u;
  *(_OWORD *)(v7 + 240) = 0u;
  *(_OWORD *)(v7 + 256) = 0u;
  *(_OWORD *)(v7 + 272) = 0u;
  *(_OWORD *)(v7 + 288) = 0u;
  *(_OWORD *)(v7 + 128) = 0u;
  *(_OWORD *)(v7 + 297) = 0u;
  *(_QWORD *)(v7 + 324) = 0;
  *(_QWORD *)(v7 + 316) = 0;
  v12[0] = a3;
  v12[1] = a4;
  v10 = v12;
  v11 = 2;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(v7 + 8, (uint64_t)&v10);
  v8 = *((_QWORD *)a1 + 14);
  v10 = v12;
  v11 = 1;
  v12[0] = v8;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)a1 + 56, (uint64_t)&v10);
  return a1;
}

void sub_245BEBB58(_Unwind_Exception *a1)
{
  AlgWorkNode *v1;

  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void NovaHost::LiftoffVelocityStep::~LiftoffVelocityStep(NovaHost::LiftoffVelocityStep *this)
{
  AlgWorkNode::~AlgWorkNode(this);
  JUMPOUT(0x2495439B4);
}

uint64_t NovaHost::LiftoffVelocityStep::run(NovaHost::LiftoffVelocityStep *this)
{
  int v2;
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  TouchSensitiveButtonEventPacket *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  _DWORD *v13;
  unsigned int v14;
  int v15;

  if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 14) + 40))(*((_QWORD *)this + 14)))
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*((_QWORD *)this + 14) + 1064) + 8))(*((_QWORD *)this + 14) + 1064);
      v6 = (TouchSensitiveButtonEventPacket *)(v5 + 32 * v3);
      v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*((_QWORD *)this + 15) + 1320) + 8))(*((_QWORD *)this + 15) + 1320);
      v8 = v7;
      v10 = v6->var6 || (v9 = *(_DWORD *)(v7 + 40 * v3 + 24), v9 > 1) || v9 == 1 && *(_DWORD *)(v7 + 40 * v3 + 28) != 2;
      v11 = v3 + 1;
      if (v3 + 1 < (unint64_t)(*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 14) + 40))(*((_QWORD *)this + 14))
        && v6->var0 == *(_QWORD *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)(*((_QWORD *)this + 14) + 1064)
                                                                      + 8))(*((_QWORD *)this + 14) + 1064)
                                 + 32 * v11))
      {
        ++v4;
      }
      else if (*(_WORD *)(v5 + 32 * v3 + 24) == 2 || !v10)
      {
        NovaHost::LiftoffVelocityCalculator::update((NovaHost::LiftoffVelocityStep *)((char *)this + 128), v6, (ForceStageEventPacket *)(v8 + 40 * v3));
        if (v4)
        {
          v13 = (_DWORD *)(v5 + 32 * v3 + 28);
          v14 = v2 - v4;
          v15 = v4 - 1;
          do
            *(_DWORD *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)(*((_QWORD *)this + 14) + 1064) + 8))(*((_QWORD *)this + 14) + 1064)
                      + 32 * v14++
                      + 28) = *v13;
          while (v15--);
        }
        v4 = 0;
      }
      ++v2;
      ++v3;
    }
    while (v11 < (*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 14) + 40))(*((_QWORD *)this + 14)));
  }
  return 0;
}

AlgWorkNode *NovaHost::CoreAnalyticsStep::CoreAnalyticsStep(AlgWorkNode *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  AlgWorkNode::AlgWorkNode(a1);
  *(_QWORD *)v11 = &unk_2516DD0A8;
  *(_QWORD *)(v11 + 112) = a3;
  *(_QWORD *)(v11 + 120) = a4;
  *(_QWORD *)(v11 + 128) = a5;
  *(_QWORD *)(v11 + 136) = a6;
  *(_BYTE *)(v11 + 144) = 0;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16[0] = &v13;
  v16[1] = 3;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(v11 + 8, (uint64_t)v16);
  v16[0] = *((_QWORD *)a1 + 17);
  v13 = v16;
  v14 = 1;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)a1 + 56, (uint64_t)&v13);
  return a1;
}

void sub_245BEBE34(_Unwind_Exception *a1)
{
  AlgWorkNode *v1;

  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void NovaHost::CoreAnalyticsStep::~CoreAnalyticsStep(NovaHost::CoreAnalyticsStep *this)
{
  AlgWorkNode::~AlgWorkNode(this);
  JUMPOUT(0x2495439B4);
}

uint64_t NovaHost::CoreAnalyticsStep::run(NovaHost::CoreAnalyticsStep *this)
{
  int v1;
  uint64_t v2;
  int v3;
  BOOL v4;
  char v5;
  uint64_t v6;

  v1 = *((unsigned __int8 *)this + 144);
  v2 = *((_QWORD *)this + 17);
  v3 = *(unsigned __int8 *)(*((_QWORD *)this + 16) + 30);
  *((_BYTE *)this + 144) = v3;
  if (v1)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = *(_BYTE *)(*((_QWORD *)this + 15) + 30);
    if (v5)
    {
      v6 = *((_QWORD *)this + 14);
      *(_WORD *)(v2 + 33) = 257;
      *(_DWORD *)(v2 + 36) = *(_DWORD *)(v6 + 48);
      v5 = 1;
      *(_BYTE *)(v2 + 35) = 1;
    }
  }
  *(_BYTE *)(v2 + 40) = v5;
  return 0;
}

uint64_t SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  result = SAList<std::reference_wrapper<AlgDataNode>>::resize(a1, *(_DWORD *)(a1 + 12) + *(_DWORD *)(a2 + 8));
  v5 = *(_QWORD *)(a2 + 8);
  if (v5)
  {
    v6 = *(_QWORD **)a2;
    v7 = 8 * v5;
    do
    {
      result = SAList<std::reference_wrapper<AlgDataNode>>::push_back(a1, v6++);
      v7 -= 8;
    }
    while (v7);
  }
  return result;
}

uint64_t SAList<std::reference_wrapper<AlgDataNode>>::resize(uint64_t result, unsigned int a2)
{
  int v2;
  uint64_t v3;
  const void *v4;
  void *v5;

  v2 = *(_DWORD *)(result + 8);
  *(_DWORD *)(result + 8) = a2;
  if (a2)
  {
    if (v2 != a2)
    {
      v3 = result;
      v4 = *(const void **)result;
      if (*(_QWORD *)result)
      {
        v5 = (void *)operator new(8 * a2, *(unsigned __int8 *)(result + 16));
        *(_QWORD *)v3 = v5;
        memcpy(v5, v4, 8 * *(unsigned int *)(v3 + 12));
        JUMPOUT(0x2495439A8);
      }
    }
  }
  return result;
}

uint64_t SAList<std::reference_wrapper<AlgDataNode>>::push_back(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = *(_QWORD *)a1;
  if (!result)
  {
    result = operator new(8 * *(unsigned int *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
    *(_QWORD *)a1 = result;
  }
  *(_QWORD *)(result + 8 * (*(_DWORD *)(a1 + 12))++) = *a2;
  return result;
}

void NovaHost::InterpolationStep::run(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 134218496;
  v6 = 20000;
  v7 = 2048;
  v8 = v3;
  v9 = 2048;
  v10 = v4;
  _os_log_error_impl(&dword_245BE5000, log, OS_LOG_TYPE_ERROR, "Timeout of %lluus exceeded, likely dropped frames? %llu -> %llu", (uint8_t *)&v5, 0x20u);
}

uint64_t NovaHost::NovaButtonStateMachine::update(uint64_t a1, __int128 *a2, uint64_t a3, double a4)
{
  int v6;
  int v7;
  int v8;
  int v9;
  __int128 v10;

  *(_QWORD *)(a1 + 136) = a3;
  v6 = *(_DWORD *)(a1 + 44);
  if (v6)
    v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * (v6 - 1));
  v7 = *(_DWORD *)(a1 + 68);
  do
  {
    v8 = v6;
    switch(v6)
    {
      case 0:
        NovaHost::NovaButtonStateMachine::_processIdle(a1, (uint64_t)a2);
        break;
      case 1:
        a4 = NovaHost::NovaButtonStateMachine::_processEngaged(a1, (uint64_t)a2, a4);
        break;
      case 2:
        a4 = NovaHost::NovaButtonStateMachine::_processMaybeIntermediate(a1, (uint64_t)a2);
        break;
      case 3:
        a4 = NovaHost::NovaButtonStateMachine::_processIntermediate(a1, (uint64_t)a2);
        break;
      case 4:
        if (!*(_BYTE *)(a1 + 144))
          a4 = NovaHost::NovaButtonStateMachine::_exitStage(a1, (uint64_t)a2);
        break;
      default:
        break;
    }
    v6 = *(_DWORD *)(a1 + 44);
    if (v6)
      v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * (v6 - 1));
  }
  while (v8 != v6);
  v9 = *(_DWORD *)(a1 + 92);
  if (v9 && v8 && v7 != v9 && *(_DWORD *)(*(_QWORD *)(a1 + 80) + 40 * (v9 - 1) + 28) == 2
    || v7 == v9 && NovaHost::NovaButtonStateMachine::_shouldGenerateEvent(a1, (uint64_t)a2))
  {
    NovaHost::NovaButtonStateMachine::_changeInSameStage(a1, (uint64_t)a2);
  }
  v10 = *a2;
  *(_OWORD *)(a1 + 120) = a2[1];
  *(_OWORD *)(a1 + 104) = v10;
  return 1;
}

void NovaHost::NovaButtonStateMachine::_processIdle(uint64_t a1, uint64_t a2)
{
  int v3;
  BOOL v4;

  if (*(_BYTE *)(a1 + 144))
  {
    v3 = 4;
LABEL_3:
    NovaHost::NovaButtonStateMachine::_enterStage((_BYTE **)a1, v3, a2);
    return;
  }
  if (*(_BYTE *)(a2 + 2))
    v4 = 0;
  else
    v4 = *(float *)(a2 + 20) < 50.0;
  if (!v4 || *(_QWORD *)(a1 + 112) && *(unsigned __int8 *)(a2 + 1) > *(unsigned __int8 *)(a1 + 105))
  {
    v3 = 1;
    goto LABEL_3;
  }
}

double NovaHost::NovaButtonStateMachine::_processEngaged(uint64_t a1, uint64_t a2, double result)
{
  int v4;
  unsigned int v5;
  BOOL v6;

  if (*(_BYTE *)(a1 + 144))
  {
    v4 = 4;
    return NovaHost::NovaButtonStateMachine::_enterStage((_BYTE **)a1, v4, a2);
  }
  v5 = *(unsigned __int8 *)(a2 + 1);
  if (v5 != 3)
  {
    LODWORD(result) = *(_DWORD *)(a2 + 20);
    if (v5 | *(unsigned __int8 *)(a2 + 2))
      v6 = 0;
    else
      v6 = *(float *)&result < 50.0;
    if (v6)
    {
      return NovaHost::NovaButtonStateMachine::_exitStage(a1, a2);
    }
    else if (*(_QWORD *)(a1 + 112) && v5 > *(unsigned __int8 *)(a1 + 105))
    {
      v4 = 2;
      return NovaHost::NovaButtonStateMachine::_enterStage((_BYTE **)a1, v4, a2);
    }
  }
  return result;
}

double NovaHost::NovaButtonStateMachine::_processMaybeIntermediate(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  double result;

  if (*(_BYTE *)(a1 + 144))
  {
    v3 = 4;
    return NovaHost::NovaButtonStateMachine::_enterStage((_BYTE **)a1, v3, a2);
  }
  v4 = *(unsigned __int8 *)(a2 + 1);
  if (v4 != 3)
  {
    if (*(_BYTE *)(a2 + 1))
    {
      if (*(_QWORD *)(a1 + 112) && v4 >= 2 && v4 > *(unsigned __int8 *)(a1 + 105))
      {
        v3 = 3;
        return NovaHost::NovaButtonStateMachine::_enterStage((_BYTE **)a1, v3, a2);
      }
    }
    else
    {
      return NovaHost::NovaButtonStateMachine::_exitStage(a1, a2);
    }
  }
  return result;
}

double NovaHost::NovaButtonStateMachine::_processIntermediate(uint64_t a1, uint64_t a2)
{
  double result;

  if (*(_BYTE *)(a1 + 144))
    return NovaHost::NovaButtonStateMachine::_enterStage((_BYTE **)a1, 4, a2);
  if (*(unsigned __int8 *)(a2 + 1) <= 1u)
    return NovaHost::NovaButtonStateMachine::_exitStage(a1, a2);
  return result;
}

BOOL NovaHost::NovaButtonStateMachine::_shouldGenerateEvent(uint64_t a1, uint64_t a2)
{
  float v2;

  if (*(float *)(a2 + 4) != 0.0
    || *(unsigned __int8 *)(a1 + 106) != *(unsigned __int8 *)(a2 + 2)
    || vabds_f32(*(float *)(a2 + 24), *(float *)(a1 + 152)) > 0.1
    || *(_DWORD *)(a1 + 132) != *(_DWORD *)(a2 + 28))
  {
    return 1;
  }
  if (*(_DWORD *)(a1 + 44))
  {
    v2 = *(float *)(a2 + 20);
    if (v2 >= 50.0)
      return vabds_f32(v2, *(float *)(a1 + 148)) > 5.0;
  }
  return 0;
}

double NovaHost::NovaButtonStateMachine::_changeInSameStage(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  int v6;

  v4 = SALoggingGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    NovaHost::NovaButtonStateMachine::_changeInSameStage(a1, v4);
  v5 = *(_DWORD *)(a1 + 44);
  if (v5)
    v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * (v5 - 1));
  else
    v6 = 0;
  return NovaHost::NovaButtonStateMachine::_createEvent(a1, a2, v6, 0);
}

uint64_t NovaHost::NovaButtonStateMachine::setFullPressState(uint64_t this, char a2)
{
  *(_BYTE *)(this + 144) = a2;
  return this;
}

uint64_t NovaHost::NovaButtonStateMachine::clearHIDEvents(uint64_t this)
{
  if (*(_DWORD *)(this + 68))
    *(_DWORD *)(this + 68) = 0;
  if (*(_DWORD *)(this + 92))
    *(_DWORD *)(this + 92) = 0;
  return this;
}

void NovaHost::NovaButtonStateMachine::cleanup(NovaHost::NovaButtonStateMachine *this)
{
  NSObject *v2;
  _OWORD v3[2];

  v2 = SALoggingGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    NovaHost::NovaButtonStateMachine::cleanup(v2);
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *((_BYTE *)this + 145) = 1;
  memset(v3, 0, sizeof(v3));
  while (*((_DWORD *)this + 11))
    NovaHost::NovaButtonStateMachine::_exitStage((uint64_t)this, (uint64_t)v3);
  *((_BYTE *)this + 145) = 0;
}

double NovaHost::NovaButtonStateMachine::_exitStage(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  NSObject *v6;
  double result;

  v4 = *(_DWORD *)(a1 + 44);
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * (v4 - 1));
  if (v4)
    *(_DWORD *)(a1 + 44) = v4 - 1;
  v6 = SALoggingGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    NovaHost::NovaButtonStateMachine::_exitStage();
  if (v5 != 2 || **(_BYTE **)a1)
    return NovaHost::NovaButtonStateMachine::_createEvent(a1, a2, v5, 2);
  return result;
}

double NovaHost::NovaButtonStateMachine::_enterStage(_BYTE **a1, int a2, uint64_t a3)
{
  NSObject *v5;
  double result;
  int v7;

  v7 = a2;
  v5 = SALoggingGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    NovaHost::NovaButtonStateMachine::_enterStage();
  SAList<NovaForceStage>::push_back((uint64_t)(a1 + 4), &v7);
  if (v7 != 2 || **a1)
    return NovaHost::NovaButtonStateMachine::_createEvent((uint64_t)a1, a3, v7, 1);
  return result;
}

uint64_t SAList<NovaForceStage>::push_back(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = *(_QWORD *)a1;
  if (!result)
  {
    result = operator new(4 * *(unsigned int *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
    *(_QWORD *)a1 = result;
  }
  *(_DWORD *)(result + 4 * (*(_DWORD *)(a1 + 12))++) = *a2;
  return result;
}

double NovaHost::NovaButtonStateMachine::_createEvent(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v8;
  __int16 v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  BOOL v18;
  int v19;
  float v20;
  float v21;
  int v22;
  float v23;
  float v24;
  BOOL v25;
  float v26;
  float v28;
  double result;
  uint64_t v30;
  float v31;
  float v32;
  int v33;
  float v34;
  int v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;

  if (*(_BYTE *)(a1 + 145))
  {
    LOBYTE(v8) = 0;
    v9 = 8;
LABEL_3:
    *(_BYTE *)(a1 + 156) = v8;
    goto LABEL_4;
  }
  v8 = *(_DWORD *)(a1 + 44);
  if (*(_BYTE *)(a1 + 156))
  {
    if (!v8)
    {
      v9 = 4;
      goto LABEL_3;
    }
    v9 = 2;
  }
  else
  {
    if (v8)
    {
      LOBYTE(v8) = 1;
      v9 = 1;
      goto LABEL_3;
    }
    v9 = 0;
  }
LABEL_4:
  v10 = a1 + 56;
  v11 = *(_DWORD *)(a1 + 68);
  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 56);
    v13 = (v11 - 1);
    v14 = *(_QWORD *)(v12 + 32 * v13);
    v15 = *(_QWORD *)(a1 + 136);
    if (v14 == v15)
    {
      *(_DWORD *)(v12 + 32 * v13 + 12) = 0;
      v15 = v14;
    }
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 136);
  }
  v30 = v15;
  v31 = *(float *)(a2 + 16) * 0.061275;
  v16 = *(float *)(a2 + 28);
  v17 = *(float *)(a2 + 4);
  if (**(_BYTE **)(a1 + 24))
    v18 = (*(_DWORD *)(a2 + 28) & 1) == 0;
  else
    v18 = 0;
  if (v18)
    v17 = v17 * 0.5;
  v19 = *(_DWORD *)(a2 + 24);
  v32 = v17 * 0.061275;
  v33 = v19;
  v34 = v16;
  LOWORD(v35) = v9;
  HIWORD(v35) = *(unsigned __int8 *)(a2 + 2);
  v36 = 0;
  SAList<TouchSensitiveButtonEventPacket>::push_back(v10, (uint64_t)&v30);
  v20 = *(float *)(a2 + 20);
  if (a3 == 3)
  {
    v22 = **(int **)(a1 + 8);
    v23 = **(float **)(a1 + 16);
    v21 = NAN;
  }
  else if (a3 == 2)
  {
    v21 = (float)(v20 * 0.001) + 0.001;
    v22 = **(int **)(a1 + 8);
    v23 = **(float **)(a1 + 16);
  }
  else
  {
    if (a3 == 1)
    {
      v21 = **(float **)(a1 + 8);
      *(float *)&v22 = 0.05;
    }
    else
    {
      *(float *)&v22 = NAN;
      v21 = NAN;
    }
    v23 = *(float *)&v22;
  }
  v24 = v20 * 0.001;
  v25 = v20 < 50.0;
  v26 = 0.0;
  if (!v25)
    v26 = v24;
  if (v26 > v21)
    v21 = v26;
  if (v26 >= v23 || a4 == 2)
    v28 = v23;
  else
    v28 = v26;
  v30 = *(_QWORD *)(a1 + 136);
  v31 = v26;
  v32 = v21;
  v33 = v22;
  v34 = v28;
  v35 = a3;
  v36 = a4;
  v37 = v9;
  v38 = 0;
  v39 = 0;
  SAList<ForceStageEventPacket>::push_back(a1 + 80, (uint64_t)&v30);
  result = *(double *)(a2 + 20);
  *(double *)(a1 + 148) = result;
  return result;
}

__n128 SAList<TouchSensitiveButtonEventPacket>::push_back(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  __n128 result;
  __int128 v7;

  v4 = *(_QWORD *)a1;
  if (!v4)
  {
    v4 = operator new(32 * *(unsigned int *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
    *(_QWORD *)a1 = v4;
  }
  v5 = (_OWORD *)(v4 + 32 * *(unsigned int *)(a1 + 12));
  result = *(__n128 *)a2;
  v7 = *(_OWORD *)(a2 + 16);
  *v5 = *(_OWORD *)a2;
  v5[1] = v7;
  ++*(_DWORD *)(a1 + 12);
  return result;
}

__n128 SAList<ForceStageEventPacket>::push_back(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v7;

  v4 = *(_QWORD *)a1;
  if (!v4)
  {
    v4 = operator new(40 * *(unsigned int *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
    *(_QWORD *)a1 = v4;
  }
  v5 = v4 + 40 * *(unsigned int *)(a1 + 12);
  result = *(__n128 *)a2;
  v7 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)v5 = result;
  *(_OWORD *)(v5 + 16) = v7;
  ++*(_DWORD *)(a1 + 12);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void NovaHost::NovaButtonStateMachine::_changeInSameStage(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 136);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_245BE5000, a2, OS_LOG_TYPE_DEBUG, "[NovaButtonStateMachine] %llu: change in same stage event", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2_1();
}

void NovaHost::NovaButtonStateMachine::cleanup(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_245BE5000, log, OS_LOG_TYPE_DEBUG, "[NovaButtonStateMachine] Cleaning up", v1, 2u);
}

void NovaHost::NovaButtonStateMachine::_exitStage()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_245BE5000, v0, v1, "[NovaButtonStateMachine] %llu: exit stage %u", v2, v3);
  OUTLINED_FUNCTION_2_1();
}

void NovaHost::NovaButtonStateMachine::_enterStage()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_245BE5000, v0, v1, "[NovaButtonStateMachine] %llu: enter stage %u", v2, v3);
  OUTLINED_FUNCTION_2_1();
}

uint64_t NovaHost::LiftoffVelocityCalculator::update(NovaHost::LiftoffVelocityCalculator *this, TouchSensitiveButtonEventPacket *a2, ForceStageEventPacket *a3)
{
  float *p_var8;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  float var1;
  char *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  unsigned int var4;
  float v17;
  float v18;
  float v19;
  BOOL v20;
  float v21;
  BOOL v22;
  NSObject *v23;
  float v24;
  float v25;
  BOOL v27;
  float v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  uint64_t v40;
  float *v41;
  char *v42;
  unint64_t v43;
  float v44;
  unsigned int var5;
  float v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _DWORD *v56;
  float v57;
  BOOL v58;
  float v59;
  BOOL v60;
  float v61;
  NSObject *v62;
  NSObject *v63;

  a2->var8 = 0.0;
  p_var8 = &a2->var8;
  v5 = (_QWORD *)((char *)this + 168);
  v6 = *((_QWORD *)this + 21);
  v7 = a2->var4 & 0x38;
  if (!a2->var6)
  {
    v21 = 0.0;
    if (v7)
      v22 = 0;
    else
      v22 = v6 == 0;
    if (v22)
      v21 = NovaHost::LiftoffVelocityCalculator::_filteredVelocity(this);
    *p_var8 = v21;
    *(_OWORD *)((char *)this + 169) = 0u;
    *((_OWORD *)this + 9) = 0u;
    *((_OWORD *)this + 10) = 0u;
    v23 = SALoggingGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      NovaHost::LiftoffVelocityCalculator::update((uint64_t)p_var8);
    return 1;
  }
  if (!*((_BYTE *)this + 184))
  {
    *((_BYTE *)this + 184) = 1;
    *((_DWORD *)this + 47) = 0;
    var1 = a2->var1;
    *((float *)this + 50) = var1;
    *((_DWORD *)this + 49) = 0;
    NovaHost::LiftoffVelocityCalculator::_pushSample((uint64_t)this, var1, 0.0, a2->var0);
  }
  if (!*((_QWORD *)this + 19))
    return 0;
  v11 = (char *)this + 24 * ((*((_QWORD *)this + 18) + 5) % 6uLL);
  v12 = a2->var1;
  v13 = *(float *)v11;
  v14 = v12 - *(float *)v11;
  v15 = NovaHost::LiftoffVelocityCalculator::_filteredVelocity(this);
  var4 = a2->var4;
  v17 = v14 * *((float *)this + 49);
  *((float *)this + 49) = v14;
  v18 = vabds_f32(v12, v13);
  v19 = (float)(a2->var0 - *((_QWORD *)v11 + 1));
  if (v18 < (float)((float)(v19 * 0.05) / 1000000.0) || (v17 >= -0.00001 ? (v20 = v7 == 0) : (v20 = 0), !v20))
  {
    *((float *)this + 50) = v12;
    if ((var4 & 4) != 0)
      goto LABEL_22;
LABEL_12:
    *((float *)this + 48) = v18;
    goto LABEL_33;
  }
  if ((var4 & 4) == 0)
    goto LABEL_12;
LABEL_22:
  if (vabds_f32(v12, *((float *)this + 50)) >= 0.05)
  {
    v24 = *((float *)this + 48) * 1.5;
  }
  else
  {
    *((_DWORD *)this + 48) = 0;
    v24 = 0.0;
  }
  v25 = -v24;
  if (v14 > (float)-v24)
    v25 = v14;
  if (v14 < v24)
    v24 = v14;
  if (v14 >= 0.0)
    v14 = v24;
  else
    v14 = v25;
  a2->var2 = v14;
LABEL_33:
  v27 = (var4 & 4) == 0 || v6 == 0;
  if (v7 || !v27)
  {
    v30 = SALoggingGeneral();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      NovaHost::LiftoffVelocityCalculator::update(v30, v31, v32, v33, v34, v35, v36, v37);
    v38 = *((_QWORD *)this + 19);
    if (v38)
    {
      v39 = (_DWORD *)((char *)this + 4);
      do
      {
        *v39 = 0;
        v39 += 6;
        --v38;
      }
      while (v38);
    }
    v14 = 0.0;
    if (v7)
      a2->var2 = 0.0;
  }
  else if ((var4 & 4) != 0 && !v6)
  {
    v28 = (float)(v15 * v19) / 1000000.0;
    if (fabsf(v28) < fabsf(v14))
    {
      v29 = SALoggingGeneral();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        NovaHost::LiftoffVelocityCalculator::update();
      v14 = v28;
    }
  }
  NovaHost::LiftoffVelocityCalculator::_pushSample((uint64_t)this, a2->var1, v14, a2->var0);
  v40 = *((_QWORD *)this + 19);
  if (!v40)
    return 0;
  v41 = (float *)(v5 - 1);
  v42 = (char *)this + 24 * ((*((_QWORD *)this + 18) + 5) % 6uLL);
  v43 = *((_QWORD *)v42 + 2);
  if (v43 <= 0xA)
    v43 = 10;
  v44 = (float)(*((float *)v42 + 1) / (float)v43) * 1000000.0;
  if (fabsf(v44) < 0.48387 || v17 < -0.00001)
  {
    if (!v6)
      *((float *)this + 47) = v14 + *((float *)this + 47);
  }
  else
  {
    var5 = a3->var5;
    if (v6)
    {
      if (var5 != 4)
      {
        v46 = 0.0;
        if (vabds_f32(*(float *)v42, *v41) <= 0.096774)
          goto LABEL_84;
        *((_DWORD *)this + 47) = 0;
        *v5 = 0;
        v5[1] = 0;
        *(_QWORD *)v41 = 0;
        v47 = SALoggingGeneral();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          NovaHost::LiftoffVelocityCalculator::update(v47, v48, v49, v50, v51, v52, v53, v54);
        goto LABEL_83;
      }
    }
    else
    {
      *((float *)this + 47) = v14 + *((float *)this + 47);
      if (var5 != 4)
        goto LABEL_83;
    }
  }
  *(_OWORD *)v41 = *(_OWORD *)v42;
  v5[1] = *((_QWORD *)v42 + 2);
  v56 = (_DWORD *)((char *)this + 4);
  do
  {
    *v56 = 0;
    v56 += 6;
    --v40;
  }
  while (v40);
  v57 = *((float *)this + 47);
  v58 = v57 >= -0.1 || v44 <= 0.00001;
  v46 = 0.0;
  if (v58)
    v59 = 0.0;
  else
    v59 = 0.05;
  v60 = v57 > 0.1 && v44 < -0.00001;
  v61 = -0.05;
  if (!v60)
    v61 = v59;
  *((float *)this + 40) = *((float *)this + 40) + v61;
  v62 = SALoggingGeneral();
  if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
      goto LABEL_84;
    goto LABEL_83;
  }
  NovaHost::LiftoffVelocityCalculator::update((uint64_t)(v5 - 1));
  if (!v6)
LABEL_83:
    v46 = NovaHost::LiftoffVelocityCalculator::_filteredVelocity(this);
LABEL_84:
  *p_var8 = v46;
  v63 = SALoggingGeneral();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    NovaHost::LiftoffVelocityCalculator::update((uint64_t)p_var8);
  return 1;
}

float NovaHost::LiftoffVelocityCalculator::_filteredVelocity(NovaHost::LiftoffVelocityCalculator *this)
{
  unint64_t v1;
  unint64_t *v2;
  float v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *((_QWORD *)this + 19);
  if (v1)
  {
    v2 = (unint64_t *)((char *)this + 16);
    v3 = 0.0;
    v4 = *((_QWORD *)this + 19);
    do
    {
      v5 = *v2;
      if (*v2 <= 0xA)
        v5 = 10;
      v3 = v3 + (float)((float)(*((float *)v2 - 3) / (float)v5) * 1000000.0);
      v2 += 3;
      --v4;
    }
    while (v4);
  }
  else
  {
    v3 = 0.0;
  }
  return v3 / (float)v1;
}

uint64_t NovaHost::LiftoffVelocityCalculator::_pushSample(uint64_t this, float a2, float a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(this + 144);
  v4 = *(_QWORD *)(this + 152);
  if (v4)
    v6 = a4 - *(_QWORD *)(this + 24 * ((v5 + 5) % 6uLL) + 8);
  else
    v6 = 0;
  v7 = this + 24 * v5;
  *(float *)v7 = a2;
  *(float *)(v7 + 4) = a3;
  *(_QWORD *)(v7 + 8) = a4;
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(this + 144) = (v5 + 1) % 6uLL;
  if (v4 <= 5)
    *(_QWORD *)(this + 152) = v4 + 1;
  return this;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

double OUTLINED_FUNCTION_3_1@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 8) = a2;
  return *(float *)a1;
}

void NovaHost::LiftoffVelocityCalculator::update(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3(&dword_245BE5000, v1, v2, "[LiftoffVelocity] Break touch received; liftoff velocity:%f",
    v3,
    v4,
    v5,
    v6,
    v7);
  OUTLINED_FUNCTION_2_1();
}

{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3(&dword_245BE5000, v1, v2, "[LiftoffVelocity] Filtered Velocity:%f", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

{
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  v4 = 2048;
  v5 = v1;
  _os_log_debug_impl(&dword_245BE5000, v2, OS_LOG_TYPE_DEBUG, "[LiftoffVelocity] Set new deadzone at pos:%f, TS:%llu", v3, 0x16u);
  OUTLINED_FUNCTION_2_1();
}

void NovaHost::LiftoffVelocityCalculator::update(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_245BE5000, a1, a3, "[LiftoffVelocity] Exit deadzone", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_1_2(&dword_245BE5000, a1, a3, "[LiftoffVelocity] Resetting velocities due to scroll rejection", a5, a6, a7, a8, 0);
}

void NovaHost::LiftoffVelocityCalculator::update()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3(&dword_245BE5000, v0, v1, "[LiftoffVelocity] Clamping delta to %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

char **SANovaHostVersionDescriptor(void)
{
  return &SensingAlgsNovaHostDetailedVersionDescriptor;
}

uint64_t NovaHost::Interpolator<float>::reset_state(uint64_t result, unint64_t a2, float a3)
{
  *(double *)(result + 64) = (double)a2;
  *(double *)(result + 72) = (double)a2;
  *(float *)(result + 80) = a3;
  *(float *)(result + 84) = a3;
  *(_DWORD *)(result + 88) = 0;
  return result;
}

BOOL NovaHost::Interpolator<float>::run(uint64_t a1, uint64_t a2, float a3)
{
  double v6;
  double *v7;
  double v8;
  NSObject *v9;
  _BOOL8 result;
  float v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  NSObject *v21;
  unint64_t v22;
  float v23;

  if (*(_DWORD *)(a1 + 28))
    *(_DWORD *)(a1 + 28) = 0;
  if (*(_DWORD *)(a1 + 52))
    *(_DWORD *)(a1 + 52) = 0;
  v6 = (double)(unint64_t)a2;
  v7 = (double *)(a1 + 72);
  v8 = *(double *)(a1 + 72);
  if (v8 <= (double)(unint64_t)a2)
  {
    v11 = a3;
    if (!*(_BYTE *)(a1 + 8))
      v11 = a3 - *(float *)(a1 + 80);
    v12 = 1000000.0 / **(double **)a1;
    v13 = *(double *)(a1 + 64);
    v14 = v11 + *(float *)(a1 + 88);
    v15 = v12 + v13;
    if (v12 + v13 > v6)
    {
LABEL_21:
      *(float *)(a1 + 88) = v14;
      *(float *)(a1 + 80) = a3;
      result = 1;
      *(double *)(a1 + 72) = v6;
      return result;
    }
    v16 = v6 - v8;
    v17 = v11;
    while (*(_DWORD *)(a1 + 28) < *(_DWORD *)(a1 + 24) && *(_DWORD *)(a1 + 52) < *(_DWORD *)(a1 + 48))
    {
      v18 = *(double *)(a1 + 72);
      if (v13 >= v18)
        v19 = v12;
      else
        v19 = v15 - v18;
      v20 = *(float *)(a1 + 88) + v17 * (v19 / v16);
      v23 = v20;
      *(_DWORD *)(a1 + 88) = 0;
      if (*(_BYTE *)(a1 + 8))
      {
        SAList<NovaForceStage>::push_back(a1 + 16, &v23);
      }
      else
      {
        *(float *)&v22 = *(float *)(a1 + 84) + v20;
        SAList<NovaForceStage>::push_back(a1 + 16, &v22);
        *(_DWORD *)(a1 + 84) = v22;
      }
      v14 = v14 - v20;
      v22 = (unint64_t)v15;
      SAList<std::reference_wrapper<AlgDataNode>>::push_back(a1 + 40, &v22);
      *(double *)(a1 + 64) = v15;
      v13 = v15;
      v15 = v12 + v15;
      if (v15 > v6)
        goto LABEL_21;
    }
    v21 = SALoggingGeneral();
    result = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (result)
    {
      NovaHost::Interpolator<float>::run(v21);
      return 0;
    }
  }
  else
  {
    v9 = SALoggingGeneral();
    result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (result)
    {
      NovaHost::Interpolator<float>::run(v7, a2, v9);
      return 0;
    }
  }
  return result;
}

void NovaHost::Interpolator<float>::run(double *a1, uint64_t a2, os_log_t log)
{
  unint64_t v3;
  int v4;
  unint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (unint64_t)*a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_error_impl(&dword_245BE5000, log, OS_LOG_TYPE_ERROR, "Timestamps going backwards! %llu -> %llu", (uint8_t *)&v4, 0x16u);
}

void NovaHost::Interpolator<float>::run(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_245BE5000, log, OS_LOG_TYPE_ERROR, "Interpolation buffer overflow", v1, 2u);
}

uint64_t SALoggingGeneral()
{
  if (qword_257514590 != -1)
    dispatch_once(&qword_257514590, &__block_literal_global_0);
  return _MergedGlobals_0;
}

uint64_t SALoggingHIDEventSignpost()
{
  if (qword_2575145A0 != -1)
    dispatch_once(&qword_2575145A0, &__block_literal_global_13);
  return qword_257514598;
}

void AlgsDevice::runPlan(AlgsDevice *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  AlgWorkNode *v8;

  OUTLINED_FUNCTION_55();
  v7 = OUTLINED_FUNCTION_40(v6);
  (*(void (**)(uint64_t, uint64_t, AlgDataExtractor *))(*(_QWORD *)v7 + 48))(v7, v3, a3);
  v8 = (AlgWorkNode *)OUTLINED_FUNCTION_72(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 48));
  AlgWorkNode::resetInjectionState(v8);
  OUTLINED_FUNCTION_2_2();
}

void AlgsDevice::runPlan(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  AlgsDevice::StreamingClient *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (AlgsDevice::StreamingClient *)OUTLINED_FUNCTION_53(a1);
  if (v6)
    v7 = *v1;
  else
    v7 = 0;
  OUTLINED_FUNCTION_69(v3, v4, v7, v5);
  AlgsDevice::run(v2);
  OUTLINED_FUNCTION_51();
  if (v1)
    *v1 = v8;
  OUTLINED_FUNCTION_2_2();
}

void AlgsDevice::injExtWith(AlgsDevice *this, AlgDataInjector *a2, AlgDataExtractor *a3, void *a4, unint64_t *a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AlgsDevice::StreamingClient *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = (AlgsDevice::StreamingClient *)OUTLINED_FUNCTION_53((uint64_t)this);
  if (v12)
    v13 = *v5;
  else
    v13 = 0;
  OUTLINED_FUNCTION_69(v9, v10, v13, v11);
  AlgsDevice::injExtWith(v6, v8, v7);
  OUTLINED_FUNCTION_51();
  if (v5)
    *v5 = v14;
  OUTLINED_FUNCTION_2_2();
}

void AlgsDevice::injExtWith(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;

  OUTLINED_FUNCTION_55();
  for (i = 32; i != 48; i += 8)
  {
    v7 = *(_QWORD *)(v4 + i);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v7 + 24))(v7, 0, v3, a3);
  }
  v8 = OUTLINED_FUNCTION_72(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v8 + 40))(v8, v3, a3, 0, 0, 1);
  for (j = 0; j != 16; j += 8)
  {
    v10 = *(_QWORD *)(v4 + 32 + j);
    if (v10)
      OUTLINED_FUNCTION_76(v10);
  }
  OUTLINED_FUNCTION_2_2();
}

void AlgsDevice::run(uint64_t a1)
{
  uint64_t i;
  void (*v3)(void);
  uint64_t v4;
  unsigned int j;
  void (*v6)(void);
  AlgWorkNode *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  for (i = 32; i != 48; i += 8)
  {
    if (*(_QWORD *)(a1 + i))
    {
      OUTLINED_FUNCTION_37();
      v3();
    }
  }
  v4 = *(_QWORD *)(a1 + 56);
  SAList<unsigned char>::clear(v4 + 56);
  for (j = 0; *(_DWORD *)(v4 + 20) > j; ++j)
  {
    v11 = j;
    SAList<unsigned char>::push_back(v4 + 56, &v11);
  }
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_37();
  v6();
  v7 = (AlgWorkNode *)OUTLINED_FUNCTION_45();
  AlgWorkNode::resetInjectionState(v7);
  v8 = 0;
  v9 = a1 + 32;
  while (v8 != 16)
  {
    v10 = *(_QWORD *)(v9 + v8);
    if (v10)
      OUTLINED_FUNCTION_76(v10);
    v8 += 8;
  }
  OUTLINED_FUNCTION_41();
}

void AlgsDevice::AlgsDevice(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[96];

  *a1 = off_2516DD1C8;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = a3;
  a1[5] = 0;
  a1[6] = 0;
  a1[4] = 0;
  v5 = OUTLINED_FUNCTION_75();
  a1[7] = OUTLINED_FUNCTION_16(v5, 0);
  v6 = operator new(152, a2);
  *(_QWORD *)v6 = off_2516DD368;
  *(_QWORD *)(v6 + 8) = 0;
  *(_WORD *)(v6 + 16) = 256;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = a1;
  StreamingWriter::StreamingWriter((StreamingWriter *)(v6 + 40), 0, 0, 0);
  *(_QWORD *)(v6 + 88) = 0;
  *(_BYTE *)(v6 + 97) = 0;
  *(_QWORD *)(v6 + 104) = 0;
  *(_QWORD *)(v6 + 112) = 0;
  *(_BYTE *)(v6 + 120) = a2;
  *(_BYTE *)(v6 + 128) = 0;
  *(_QWORD *)(v6 + 136) = 0;
  *(_BYTE *)(v6 + 144) = a2;
  OUTLINED_FUNCTION_16((uint64_t)v7, 0);
  AlgsDevice::StreamingClient::configure((AlgsDevice::StreamingClient *)v6, 0, (AlgDataExtractor *)v7);
}

uint64_t sub_245BEDB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  const char *v9;
  char v10;
  int v11;
  char v12;
  uint64_t v13;
  const char *v14;
  uint64_t v16;

  OUTLINED_FUNCTION_52(a1, a2, a3, a4, a5, a6, a7, a8, v16);
  *(_QWORD *)(v8 + 64) = v13;
  *(_QWORD *)(v8 + 80) = 0;
  *(_QWORD *)(v8 + 88) = 16;
  *(_BYTE *)(v8 + 96) = 0;
  *(_QWORD *)(v8 + 104) = 0;
  *(_BYTE *)(v8 + 112) = v10;
  *(_BYTE *)(v8 + 76) = v12;
  *(_DWORD *)(v8 + 72) = v11;
  *(_BYTE *)(v8 + 77) = 0;
  if (v9)
    v14 = v9;
  else
    v14 = (const char *)&unk_245BF390F;
  AlgsDevice::addVersion((AlgsDevice *)v8, v14);
  return v8;
}

void sub_245BEDBCC()
{
  uint64_t v0;

  SAList<char const*>::~SAList(v0);
  OUTLINED_FUNCTION_9();
}

void AlgsDevice::addVersion(AlgsDevice *this, const char *a2)
{
  const char *v2;

  v2 = a2;
  if (a2 && *a2)
    SAList<char const*>::push_back((uint64_t)this + 80, &v2);
  OUTLINED_FUNCTION_47();
}

void SAList<char const*>::~SAList(uint64_t a1)
{
  if (OUTLINED_FUNCTION_11_0(a1))
    OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
}

void SAList<char const*>::push_back(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_11_0(a1);
  if (!v4)
  {
    v4 = OUTLINED_FUNCTION_36(8 * *(unsigned int *)(v2 + 8));
    *(_QWORD *)v2 = v4;
  }
  *(_QWORD *)(v4 + 8 * *(unsigned int *)(v2 + 12)) = *a2;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_3_2();
}

void AlgsDevice::~AlgsDevice(AlgsDevice *this)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = off_2516DD1C8;
  v2 = *((_QWORD *)this + 7);
  if (v2)
    OUTLINED_FUNCTION_9_0(v2);
  v3 = *((_QWORD *)this + 8);
  if (v3)
    OUTLINED_FUNCTION_9_0(v3);
  SAList<char const*>::~SAList((uint64_t)this + 80);
  OUTLINED_FUNCTION_3_2();
}

void AlgsDevice::handleInputStream(AlgsDevice *this, const void *a2, unint64_t a3, void *a4, unint64_t *a5, unsigned __int8 *a6, unsigned __int16 *a7, const void **a8)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _WORD *v15;
  _WORD *v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  AlgsDevice::StreamingClient *v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  _BYTE *v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  PacketCollection *v47;
  char v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  char v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t Info;
  char v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  int v99;
  AlgWorkNode *v100;
  unsigned int v101;
  unsigned int v102;
  unint64_t v103;
  int v104;
  char v105;
  uint64_t v106;
  int v107;
  unsigned int v108;
  void *v109;
  uint64_t v110;
  SABinaryWriter *v111;
  const void *v112;
  int v113;
  char **v114;
  int v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unsigned __int128 v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  char **v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  char **v154;
  uint64_t v155[2];
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char v163[16];
  char v164[8];
  uint64_t **v165;
  char **v166;
  uint64_t v167;
  char *v168;
  char *v169;
  uint64_t v170;
  char v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  BOOL v175[8];
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t *v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  uint64_t v184;
  uint64_t v185;
  char v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;

  OUTLINED_FUNCTION_22_0();
  v189 = v8;
  v190 = v12;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = v11;
  v21 = v20;
  v22 = v9;
  v24 = v23;
  v25 = *(AlgsDevice::StreamingClient **)(v23 + 64);
  if (v11)
    v26 = *v11;
  else
    v26 = 0;
  OUTLINED_FUNCTION_69(v25, v9, v26, v10);
  v34 = *(_QWORD *)(v24 + 64);
  if (v18)
    *v18 = 0;
  v35 = *(_BYTE *)(v34 + 128);
  v36 = *(_QWORD *)(v34 + 136);
  v145 = v34 + 128;
  v146 = v22;
  v148 = 0;
  v149 = 0;
  v147 = v21;
  LOBYTE(v150) = v35;
  v151 = v36;
  if (v21 < 2 || *(_BYTE *)v22 != 1)
  {
LABEL_109:
    v123 = 0;
    if (!v19)
      return;
    goto LABEL_110;
  }
  switch(*(_BYTE *)(v22 + 1))
  {
    case 1:
      v180 = (uint64_t *)&v168;
      v181 = 0u;
      v182 = 0u;
      v183 = 0u;
      v148 = 2;
      v149 = (char **)&v180;
      if (v21 == 2)
        goto LABEL_109;
      v37 = *(unsigned __int8 *)(v22 + 2);
      LOBYTE(v168) = v37;
      if (v21 == 3)
        goto LABEL_13;
      SABinaryParser::parseInfoData(&v146, (unsigned int (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))StreamingParser::parseReset(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke, 0, 0);
      if (!v38)
        goto LABEL_109;
      v37 = v168;
LABEL_13:
      v39 = *(_BYTE **)(v34 + 32);
      (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)v39 + 40))(v39, v37);
      v40 = 0;
      v39[77] = v37;
      v41 = v39 + 32;
      while (v40 != 16)
      {
        v42 = *(_QWORD *)&v41[v40];
        if (v42)
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v42 + 16))(v42, v37);
        v40 += 8;
      }
      goto LABEL_128;
    case 2:
      memset(v163, 0, sizeof(v163));
      StreamingParser::numberOfPackets((StreamingParser *)&v145, (unint64_t *)&v163[8], (unint64_t *)v163, 0, v30, v31, v32, v33);
      if ((v43 & 1) == 0)
        goto LABEL_109;
      v44 = *(_QWORD *)(v34 + 104);
      v45 = *(_DWORD *)&v163[8];
      if (v44)
      {
        v45 = *(_DWORD *)&v163[8] + *(_DWORD *)(v44 + 20);
        *(_QWORD *)&v163[8] += *(unsigned int *)(v44 + 20);
      }
      AlgDataInjector::AlgDataInjector((uint64_t)&v168, v45, 1);
      OUTLINED_FUNCTION_16((uint64_t)&v180, *(int *)v163);
      StreamingParser::parseRun((uint64_t)&v145, (uint64_t)&v152, (uint64_t)&v168, (uint64_t)&v180);
      if ((v46 & 1) != 0)
      {
        OUTLINED_FUNCTION_62(v46, (PacketCollection *)&v168);
        *(_BYTE *)(v34 + 97) = 1;
        AlgsDevice::run(*(_QWORD *)(v34 + 32));
        OUTLINED_FUNCTION_19_0();
        v47 = (PacketCollection *)&v168;
        goto LABEL_127;
      }
      OUTLINED_FUNCTION_19_0();
      v114 = &v168;
      goto LABEL_108;
    case 3:
      v162 = 0;
      *(_QWORD *)v163 = 0;
      v161 = 0;
      StreamingParser::numberOfPackets((StreamingParser *)&v145, (unint64_t *)v163, (unint64_t *)&v162, (unint64_t *)&v161, v30, v31, v32, v33);
      if ((v48 & 1) == 0)
        goto LABEL_109;
      v49 = *(_QWORD *)(v34 + 104);
      v50 = *(_DWORD *)v163;
      if (v49)
      {
        v50 = *(_DWORD *)v163 + *(_DWORD *)(v49 + 20);
        *(_QWORD *)v163 += *(unsigned int *)(v49 + 20);
      }
      AlgDataInjector::AlgDataInjector((uint64_t)&v152, v50, 1);
      OUTLINED_FUNCTION_16((uint64_t)&v180, v162);
      OUTLINED_FUNCTION_16((uint64_t)&v168, v161);
      *(_QWORD *)&v163[8] = v34 + 88;
      *(_QWORD *)v164 = &v152;
      v165 = &v180;
      v166 = &v168;
      v149 = (char **)&v163[8];
      SABinaryParser::parseInjExtFrame(&v146, (unsigned int (*)(uint64_t, _QWORD))StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke, (uint64_t)StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_1::__invoke, (uint64_t)StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_2::__invoke, (uint64_t (*)(_QWORD))StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_3::__invoke);
      v59 = v51;
      if ((v51 & 1) == 0)
      {
        OUTLINED_FUNCTION_20_0(v51, v52, v53, v54, v55, v56, v57, v58, v143, *((uint64_t *)&v143 + 1), v145, v146, v147, v148, (uint64_t)v149, v150, v151, (uint64_t)v152, v153,
          (uint64_t)v154,
          v155[0],
          v155[1],
          v156,
          v157,
          v158,
          v159,
          v160,
          v161,
          v162,
          *(uint64_t *)v163,
          *(uint64_t *)&v163[8],
          *(uint64_t *)v164,
          (uint64_t)v165,
          (uint64_t)v166,
          v167,
          (char)v168);
        OUTLINED_FUNCTION_19_0();
        v114 = &v152;
        goto LABEL_108;
      }
      v60 = HIDWORD(v170);
      v61 = (uint64_t *)(v169 + 72);
      if (HIDWORD(v170))
      {
        do
        {
          *(v61 - 1) = (uint64_t)AlgsDevice::StreamingClient::extraction;
          *v61 = v34;
          --v60;
          v61 += 10;
        }
        while (v60);
      }
      OUTLINED_FUNCTION_62(v51, (PacketCollection *)&v152);
      *(_BYTE *)(v34 + 97) = 1;
      AlgsDevice::injExtWith(*(_QWORD *)(v34 + 32), (uint64_t)&v152, (uint64_t)&v168);
      *(_QWORD *)(v34 + 88) = 0;
      OUTLINED_FUNCTION_20_0(v62, v63, v64, v65, v66, v67, v68, v69, v143, *((uint64_t *)&v143 + 1), v145, v146, v147, v148, (uint64_t)v149, v150, v151, (uint64_t)v152, v153,
        (uint64_t)v154,
        v155[0],
        v155[1],
        v156,
        v157,
        v158,
        v159,
        v160,
        v161,
        v162,
        *(uint64_t *)v163,
        *(uint64_t *)&v163[8],
        *(uint64_t *)v164,
        (uint64_t)v165,
        (uint64_t)v166,
        v167,
        (char)v168);
      OUTLINED_FUNCTION_19_0();
      PacketCollection::~PacketCollection((PacketCollection *)&v152);
      if ((v59 & 1) != 0)
        goto LABEL_128;
      goto LABEL_109;
    case 4:
      if (v21 - 5 >= 0xFFFFFFFFFFFFFFFDLL)
      {
        v70 = 1;
        if (v18)
        {
          *v18 = 1;
          v70 = 0;
        }
        if (v16)
          *v16 = 0;
      }
      else
      {
        v70 = *(unsigned __int8 *)(v22 + 2);
        if (v18)
        {
          *v18 = v70;
          v70 = 0;
        }
        if (v16)
          *v16 = *(_WORD *)(v22 + 3);
        if (v14)
          *v14 = v22 + 5;
      }
      if (v18)
        v70 = *v18;
      if (v16 && v70 == 1 && *v16 && *(unsigned __int8 *)*v14 == 255)
        *(_BYTE *)*v14 = *(_BYTE *)(*(_QWORD *)(v34 + 32) + 77);
      goto LABEL_128;
    case 5:
      v163[8] = 0;
      v163[0] = 0;
      v152 = 0;
      OUTLINED_FUNCTION_64((StreamingParser *)&v145, (uint64_t)v27, v28, (unint64_t *)&v152, v30, v31, v32, v33);
      if ((v71 & 1) == 0)
        goto LABEL_109;
      OUTLINED_FUNCTION_16((uint64_t)&v180, (int)v152);
      v168 = v163;
      v169 = &v163[8];
      v170 = (uint64_t)&v180;
      v149 = &v168;
      SABinaryParser::parseConfigure(&v146, (unsigned int (*)(uint64_t, BOOL))StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_0::__invoke, (uint64_t)StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_1::__invoke, (unsigned int (*)(uint64_t, uint64_t))StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_2::__invoke);
      if ((v72 & 1) == 0)
        goto LABEL_107;
      if (v163[0] <= 2u)
        AlgsDevice::StreamingClient::configure((AlgsDevice::StreamingClient *)v34, v163[8], (AlgDataExtractor *)&v180);
      if (v163[0] == 3 && HIDWORD(v181))
        StreamingWriter::writeConfigure(v34 + 40, v163[8], (uint64_t)&v180);
      else
        AlgsDevice::StreamingClient::configureStatus((AlgsDevice::StreamingClient *)v34);
      goto LABEL_126;
    case 6:
      *(_DWORD *)v163 = 0;
      LOBYTE(v162) = 0;
      LOBYTE(v161) = 0;
      HIWORD(v167) = 0;
      v152 = 0;
      v153 = 16;
      LOBYTE(v154) = 0;
      *(_QWORD *)&v163[8] = 0;
      OUTLINED_FUNCTION_64((StreamingParser *)&v145, (uint64_t)v27, v28, (unint64_t *)&v163[8], v30, v31, v32, v33);
      if ((v73 & 1) == 0)
      {
        OUTLINED_FUNCTION_58(v73, v74, v75, v76, v77, v78, v79, v80, v143);
        goto LABEL_109;
      }
      OUTLINED_FUNCTION_16((uint64_t)&v168, *(int *)&v163[8]);
      v180 = &v162;
      *(_QWORD *)&v181 = v163;
      *((_QWORD *)&v181 + 1) = &v161;
      *(_QWORD *)&v182 = (char *)&v167 + 7;
      *((_QWORD *)&v182 + 1) = &v152;
      *(_QWORD *)&v183 = (char *)&v167 + 6;
      *((_QWORD *)&v183 + 1) = &v168;
      v149 = (char **)&v180;
      SABinaryParser::parseInfo(&v146, (unsigned int (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke, (uint64_t (*)(uint64_t, const char *))StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_1::__invoke, (unsigned int (*)(uint64_t, BOOL))StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_2::__invoke);
      if ((v81 & 1) != 0)
      {
        v89 = *(_QWORD *)(v34 + 32);
        if (*(_DWORD *)v163 && *(_DWORD *)v163 != *(_DWORD *)(v89 + 72))
        {
          StreamingWriter::writeInfo(v34 + 40, v162, *(unsigned int *)v163, v161, HIBYTE(v167), (uint64_t)&v152, SBYTE6(v167), (uint64_t)&v168);
          v92 = 1;
        }
        else
        {
          Info = AlgsDevice::getInfo(*(AlgsDevice **)(v34 + 32));
          OUTLINED_FUNCTION_16((uint64_t)&v180, *(_DWORD *)(v89 + 48));
          AlgsDevice::getClientExtractor(*(_QWORD *)(v34 + 32), (uint64_t)&v180);
          StreamingWriter::writeInfo(v34 + 40, BYTE5(Info), Info, BYTE4(Info), BYTE6(Info), *(_QWORD *)(v34 + 32) + 80, *(_BYTE *)(v34 + 96), (uint64_t)&v180);
          v92 = v91;
          OUTLINED_FUNCTION_19_0();
        }
      }
      else
      {
        v92 = 0;
      }
      OUTLINED_FUNCTION_20_0(v81, v82, v83, v84, v85, v86, v87, v88, v143, *((uint64_t *)&v143 + 1), v145, v146, v147, v148, (uint64_t)v149, v150, v151, (uint64_t)v152, v153,
        (uint64_t)v154,
        v155[0],
        v155[1],
        v156,
        v157,
        v158,
        v159,
        v160,
        v161,
        v162,
        *(uint64_t *)v163,
        *(uint64_t *)&v163[8],
        *(uint64_t *)v164,
        (uint64_t)v165,
        (uint64_t)v166,
        v167,
        (char)v168);
      OUTLINED_FUNCTION_58(v124, v125, v126, v127, v128, v129, v130, v131, v144);
      if ((v92 & 1) != 0)
        goto LABEL_128;
      goto LABEL_109;
    case 7:
      *(_DWORD *)&v163[8] = 0;
      *((_QWORD *)&v181 + 1) = 16;
      LOBYTE(v182) = 1;
      *((_QWORD *)&v182 + 1) = 0;
      *(_QWORD *)&v183 = 16;
      BYTE8(v183) = 1;
      v184 = 0;
      v185 = 16;
      v186 = 1;
      v180 = (uint64_t *)&off_2516DD3C8;
      *(_QWORD *)&v181 = 0;
      v187 = 0;
      v188 = 0;
      v170 = 16;
      v171 = 1;
      v172 = 0;
      v173 = 16;
      LOBYTE(v174) = 1;
      *(_QWORD *)v175 = 0;
      v176 = 16;
      LOBYTE(v177) = 1;
      v168 = (char *)&off_2516DD3C8;
      v169 = 0;
      v178 = 0;
      v179 = 0;
      v152 = &v163[8];
      v153 = (uint64_t)&v180;
      v154 = &v168;
      v148 = 2;
      v149 = &v152;
      if (v21 - 6 > 0xFFFFFFFFFFFFFFFBLL)
        goto LABEL_106;
      *(_DWORD *)&v163[8] = *(_DWORD *)(v22 + 2);
      *(_QWORD *)&v143 = v147;
      v93 = -6;
      v94 = v148;
      v95 = 6;
      v96 = 42;
      while (2)
      {
        if (v21 > v96 - 36)
        {
          if (v93 + v21 < 0x12)
            goto LABEL_105;
          v27 = (_BYTE *)(v146 + v96 - 36);
          if (*v27 != 3 || v93 + v21 - 18 < 0x12)
            goto LABEL_105;
          if (*(_BYTE *)(v146 + v96 - 18) == 3)
          {
            v94 = v95 + 36;
            v97 = (uint64_t)v149[1];
            if (v97)
            {
              StreamingParser::addPoint(v97, (uint64_t)v27);
              v99 = v98;
              v36 = (uint64_t)v149[2];
              if (!v36)
              {
                if ((v99 & 1) == 0)
                  goto LABEL_105;
LABEL_64:
                v96 += 36;
                v93 -= 36;
                v95 = v94;
                v21 = v147;
                continue;
              }
            }
            else
            {
              v36 = (uint64_t)v149[2];
              if (!v36)
                goto LABEL_64;
              v99 = 1;
            }
            StreamingParser::addPoint(v36, v146 + v96 - 18);
            if ((v99 & v36 & 1) != 0)
              goto LABEL_64;
          }
          else
          {
            v94 = v96;
          }
LABEL_105:
          v148 = v94;
LABEL_106:
          OUTLINED_FUNCTION_20_0(v36, (uint64_t)v27, v28, v29, v30, v31, v32, v33, v143, *((uint64_t *)&v143 + 1), v145, v146, v147, v148, (uint64_t)v149, v150, v151, (uint64_t)v152, v153,
            (uint64_t)v154,
            v155[0],
            v155[1],
            v156,
            v157,
            v158,
            v159,
            v160,
            v161,
            v162,
            *(uint64_t *)v163,
            *(uint64_t *)&v163[8],
            *(uint64_t *)v164,
            (uint64_t)v165,
            (uint64_t)v166,
            v167,
            (char)v168);
LABEL_107:
          v114 = (char **)&v180;
LABEL_108:
          PacketCollection::~PacketCollection((PacketCollection *)v114);
          goto LABEL_109;
        }
        break;
      }
      v148 = v94;
      v115 = *(_DWORD *)&v163[8];
      if (*(_DWORD *)&v163[8] == *(_DWORD *)(*(_QWORD *)(v34 + 32) + 72))
      {
        v117 = (_QWORD *)(v34 + 104);
        v116 = *(_QWORD *)(v34 + 104);
        if (v116)
          OUTLINED_FUNCTION_9_0(v116);
        v118 = *(_QWORD *)(v34 + 112);
        if (v118)
          OUTLINED_FUNCTION_9_0(v118);
        if (HIDWORD(v181) && HIDWORD(v181) == HIDWORD(v170))
        {
          v119 = operator new(80, *(unsigned __int8 *)(v34 + 120));
          *(_QWORD *)(v34 + 104) = PacketCollection::PacketCollection(v119, SHIDWORD(v181), *(_BYTE *)(v34 + 120));
          v120 = operator new(80, *(unsigned __int8 *)(v34 + 120));
          v121 = 0;
          v122 = 0;
          *(_QWORD *)(v34 + 112) = PacketCollection::PacketCollection(v120, SHIDWORD(v170), *(_BYTE *)(v34 + 120));
          while (v122 < HIDWORD(v181))
          {
            (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)*v117 + 16))(*v117, v181 + v121);
            (*(void (**)(_QWORD, char *))(**(_QWORD **)(v34 + 112) + 16))(*(_QWORD *)(v34 + 112), &v169[v121]);
            ++v122;
            v121 += 80;
          }
        }
        else
        {
          *v117 = 0;
          *(_QWORD *)(v34 + 112) = 0;
        }
        v115 = *(_DWORD *)&v163[8];
      }
      LODWORD(v152) = v115;
      SABinaryWriter::writeHeader(v34 + 48, 7);
      if ((v132 & 1) != 0)
      {
        v132 = SABinaryWriter::write((SABinaryWriter *)(v34 + 48), &v152, 4uLL);
        if ((_DWORD)v132)
        {
          if (HIDWORD(v181) == HIDWORD(v170))
          {
            v140 = 0;
            v141 = -1;
            do
            {
              if (++v141 >= (unint64_t)HIDWORD(v181))
                break;
              if (*(_BYTE *)(v34 + 72) != 7)
                break;
              v132 = OUTLINED_FUNCTION_35(v132, v133, v134, v135, v136, v137, v138, v139, *(_QWORD *)&v169[v140], *(_QWORD *)&v169[v140 + 8], v145, v146, v147, v148, (uint64_t)v149, v150, v151, 3, *(_OWORD *)(v181 + v140) >> 56,
                       HIBYTE(*(_OWORD *)(v181 + v140)),
                       SBYTE1(v154));
              if ((v132 & 1) == 0)
                break;
              v140 += 80;
              v132 = OUTLINED_FUNCTION_35(v132, v133, v134, v135, v136, v137, v138, v139, v143, *((uint64_t *)&v143 + 1), v145, v146, v147, v148, (uint64_t)v149, v150, v151, (char)v152, v143 >> 56,
                       SHIBYTE(v143),
                       SBYTE1(v154));
            }
            while ((v132 & 1) != 0);
          }
        }
      }
      OUTLINED_FUNCTION_20_0(v132, v133, v134, v135, v136, v137, v138, v139, v143, *((uint64_t *)&v143 + 1), v145, v146, v147, v148, (uint64_t)v149, v150, v151, (uint64_t)v152, v153,
        (uint64_t)v154,
        v155[0],
        v155[1],
        v156,
        v157,
        v158,
        v159,
        v160,
        v161,
        v162,
        *(uint64_t *)v163,
        *(uint64_t *)&v163[8],
        *(uint64_t *)v164,
        (uint64_t)v165,
        (uint64_t)v166,
        v167,
        (char)v168);
LABEL_126:
      v47 = (PacketCollection *)&v180;
LABEL_127:
      PacketCollection::~PacketCollection(v47);
LABEL_128:
      OUTLINED_FUNCTION_51();
      v123 = v142;
      if (v19)
LABEL_110:
        *v19 = v123;
      return;
    case 8:
      v100 = (AlgWorkNode *)OUTLINED_FUNCTION_40(*(_QWORD *)(v34 + 32));
      AlgWorkNode::getTreeSize(v100);
      v102 = v101;
      v103 = AlgsDevice::getInfo(*(AlgsDevice **)(v34 + 32));
      *(_DWORD *)((char *)&v180 + 1) = 0;
      LOBYTE(v180) = BYTE5(v103);
      SABinaryWriter::writeHeader(v34 + 48, 8);
      if (!v104)
      {
        *(_QWORD *)(v34 + 64) += 4 * v102;
        goto LABEL_109;
      }
      v105 = SABinaryWriter::write((SABinaryWriter *)(v34 + 48), &v180, 5uLL);
      *(_QWORD *)(v34 + 64) += 4 * v102;
      if ((v105 & 1) != 0)
      {
        v106 = OUTLINED_FUNCTION_40(*(_QWORD *)(v34 + 32));
        AlgWorkNode::getTreeInfo(v106, v34, 1);
        if (v107)
          goto LABEL_128;
      }
      goto LABEL_109;
    case 9:
      if (v21 < 5)
        goto LABEL_109;
      v108 = *(unsigned __int8 *)(v22 + 3);
      if (v36)
        OUTLINED_FUNCTION_1_3();
      *(_BYTE *)(v34 + 128) = v108;
      v109 = (void *)operator new(22 * v108, *(unsigned __int8 *)(v34 + 144));
      *(_QWORD *)(v34 + 136) = v109;
      memcpy(v109, (const void *)(v22 + 4), 22 * *(unsigned __int8 *)(v34 + 128));
      v110 = *(unsigned __int8 *)(v34 + 128);
      if (!*(_BYTE *)(v34 + 128))
        goto LABEL_109;
      v111 = (SABinaryWriter *)(v34 + 48);
      v112 = *(const void **)(v34 + 136);
      LOBYTE(v180) = 1;
      BYTE1(v180) = v110;
      SABinaryWriter::updateCacheSizes(v110, (uint64_t)v112);
      SABinaryWriter::writeHeader((uint64_t)v111, 9);
      if (!v113
        || (SABinaryWriter::write(v111, &v180, 2uLL) & 1) == 0
        || (SABinaryWriter::write(v111, v112, 22 * v110) & 1) == 0)
      {
        goto LABEL_109;
      }
      goto LABEL_128;
    default:
      goto LABEL_109;
  }
}

#error "245BEE7A4: call analysis failed (funcsize=7)"

void AlgsDevice::configureInternalClient(uint64_t a1, const PacketCollection *a2, uint64_t a3)
{
  AlgsDevice::addClient(a1, 1u, a3, a2);
}

void AlgsDevice::addClient(uint64_t a1, unsigned int a2, uint64_t a3, const PacketCollection *a4)
{
  uint64_t v4;
  _DWORD *v5;
  int v6;
  uint64_t v10;
  const PacketCollection *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  const PacketCollection *v16;
  uint64_t v17;
  uint64_t v18;
  const PacketCollection *v19;
  unint64_t v20;
  unint64_t v21;

  *(_QWORD *)(a1 + 8 * a2 + 32) = a3;
  v4 = a1 + 4 * a2;
  v6 = *(_DWORD *)(v4 + 48);
  v5 = (_DWORD *)(v4 + 48);
  if (!(v6 | *((_DWORD *)a4 + 5)))
    goto LABEL_13;
  v10 = a2;
  v11 = *(const PacketCollection **)(a1 + 56);
  v12 = OUTLINED_FUNCTION_75();
  v13 = OUTLINED_FUNCTION_16(v12, *((_DWORD *)a4 + 5) - *v5 + *((_DWORD *)v11 + 5));
  v14 = 0;
  v15 = 0;
  *(_QWORD *)(a1 + 56) = v13;
  v16 = a2 ? v11 : a4;
  *((_OWORD *)v13 + 5) = *((_OWORD *)v16 + 5);
  v17 = a1 + 48;
  v18 = 4 * v10;
  while (v14 != 8)
  {
    if (v18 == v14)
    {
      v19 = a4;
      v20 = -1;
      v21 = 0;
    }
    else
    {
      v20 = *(unsigned int *)(v17 + v14);
      v19 = v11;
      v21 = v15;
    }
    PacketCollection::append(*(PacketCollection **)(a1 + 56), v19, v20, v21);
    v15 += *(unsigned int *)(v17 + v14);
    v14 += 4;
  }
  *v5 = *((_DWORD *)a4 + 5);
  if (v11)
    (*(void (**)(const PacketCollection *))(*(_QWORD *)v11 + 8))(v11);
  else
LABEL_13:
    OUTLINED_FUNCTION_42();
}

void AlgsDevice::configureStreaming(AlgsDevice::StreamingClient **this, BOOL a2, AlgDataExtractor *a3, void *a4, unint64_t *a5)
{
  AlgsDevice::StreamingClient::configure(this[8], a2, a3);
}

void sub_245BEE8E8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  if (v16)
  {
    if (v14)
      v17 = *v14;
    else
      v17 = 0;
    AlgsDevice::StreamingClient::setBuffer(*(AlgsDevice::StreamingClient **)(v15 + 64), v16, v17);
    if (AlgsDevice::StreamingClient::configureStatus(*(AlgsDevice::StreamingClient **)(v15 + 64)))
    {
      OUTLINED_FUNCTION_51();
      if (!v14)
        goto LABEL_10;
      goto LABEL_9;
    }
    v18 = 0;
    if (v14)
LABEL_9:
      *v14 = v18;
  }
LABEL_10:
  OUTLINED_FUNCTION_2_2();
}

void AlgsDevice::getClientExtractor(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t i;

  v4 = 0;
  v5 = 0;
LABEL_4:
  v6 = 80 * (v5 + v4);
  for (i = v4; i < *(unsigned int *)(a1 + 48); ++i)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 16))(a2, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + v6);
    v6 += 80;
  }
  do
  {
    v5 += *(unsigned int *)(a1 + 4 * v4++ + 48);
    if (!v4)
      goto LABEL_4;
  }
  while (v4 != 2);
  OUTLINED_FUNCTION_25_0();
}

unint64_t AlgsDevice::getInfo(AlgsDevice *this)
{
  return *((unsigned int *)this + 18) | ((unint64_t)*((unsigned __int8 *)this + 76) << 32) | ((unint64_t)*((unsigned __int8 *)this + 77) << 40) | ((unint64_t)*((unsigned __int8 *)this + 112) << 48);
}

void AlgDataNode::~AlgDataNode(AlgDataNode *this)
{
  *(_QWORD *)this = &off_2516DD220;
}

{
  *(_QWORD *)this = &off_2516DD220;
  JUMPOUT(0x2495439B4);
}

uint64_t *AlgDataNode::extractBuffer(uint64_t *this, unsigned __int8 *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[3];
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    v5[0] = a2;
    v5[1] = 0;
    v3 = *this;
    v5[2] = this[1];
    v6 = *((_DWORD *)this + 4);
    v7 = 0;
    v4 = *((unsigned __int16 *)this + 10);
    v8 = v4;
    v9 = 0;
    v10 = ((v2 + 3) & 0xFFFFFFFC) - v4;
    v11 = 0;
    return (uint64_t *)(*(uint64_t (**)(uint64_t *, void *(*)(void **), _QWORD *))(v3 + 24))(this, AlgDataNode::extractBuffer(unsigned char *)const::$_0::__invoke, v5);
  }
  return this;
}

unint64_t AlgDataNode::sendCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  uint64_t v4;

  result = *(_QWORD *)(a3 + 48) + *(_QWORD *)(a3 + 32);
  if (result)
  {
    if (result < 0x81)
    {
      MEMORY[0x24BDAC7A8]();
      OUTLINED_FUNCTION_39();
      return OUTLINED_FUNCTION_30_0();
    }
    else
    {
      v4 = OUTLINED_FUNCTION_73(result);
      OUTLINED_FUNCTION_39();
      result = OUTLINED_FUNCTION_30_0();
      if (v4)
        JUMPOUT(0x2495439A8);
    }
  }
  return result;
}

void *AlgDataNode::extractBuffer(unsigned char *)const::$_0::__invoke(void **a1)
{
  char *v2;

  v2 = (char *)*a1;
  memcpy(*a1, a1[5], (size_t)a1[4]);
  return memcpy((char *)a1[4] + (_QWORD)v2, a1[7], (size_t)a1[6]);
}

void AlgDataNode::AlgDataNode(AlgDataNode *this)
{
  *(_QWORD *)this = &off_2516DD220;
  *((_QWORD *)this + 1) = 0;
  *((_WORD *)this + 14) = 0;
  OUTLINED_FUNCTION_56((uint64_t)this);
}

void AlgDataNode::AlgDataNode(AlgDataNode *this, uint64_t a2, char a3)
{
  *(_QWORD *)this = &off_2516DD220;
  *((_QWORD *)this + 1) = a2;
  *((_BYTE *)this + 28) = a3;
  *((_BYTE *)this + 29) = 0;
  OUTLINED_FUNCTION_56((uint64_t)this);
}

uint64_t AlgTaskNode::runStep(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
}

void AlgTaskNode::runTask(AlgTaskNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  _QWORD *v10;
  void (*v11)(_QWORD, _QWORD);

  OUTLINED_FUNCTION_28_0(this, a2, a3);
  if ((v8 & 1) == 0)
    OUTLINED_FUNCTION_68(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 64));
  for (i = 0; i < *(unsigned int *)(v7 + 124); ++i)
  {
    v10 = *(_QWORD **)(*(_QWORD *)(v7 + 112) + 8 * i);
    v11 = *(void (**)(_QWORD, _QWORD))(v5 + 80);
    if (v11)
      v11(*(_QWORD *)(v5 + 88), v10[13]);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v10 + 16))(v10, v6, v5, v4, v3, v8);
  }
  if ((v8 & 1) == 0)
    OUTLINED_FUNCTION_68(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 72));
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_42();
}

void AlgTaskNode::runPlan(AlgTaskNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  AlgWorkNode::runPrologue(this, a3);
  AlgWorkNode::runEpilogue(this, a3);
  OUTLINED_FUNCTION_2_2();
}

uint64_t AlgTaskNode::runPlan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = *(_QWORD *)(a3 + 8);
  if (a2 && *(_DWORD *)a2 == 0x2000)
  {
    v5 = *(uint64_t **)(a2 + 16);
    v6 = *v5;
    v7 = *((_DWORD *)v5 + 2);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *(_QWORD *)(v4 + 40) = v6;
  *(_DWORD *)(v4 + 48) = v7;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 48))(a1, a3, a4);
}

void AlgTaskNode::AlgTaskNode(AlgTaskNode *this)
{
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_31_0((uint64_t)this, COERCE_DOUBLE(16));
  *(_QWORD *)v1 = &off_2516DD268;
  *(_QWORD *)(v1 + 8) = 0;
  *(_QWORD *)(v1 + 104) = v2;
  *(_QWORD *)(v1 + 112) = 0;
  *(_QWORD *)(v1 + 120) = 32;
  *(_BYTE *)(v1 + 128) = 0;
}

void AlgWorkNode::runStep(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_28_0(this, a2, a3);
  if ((v4 & 1) == 0)
    OUTLINED_FUNCTION_68(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 32));
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_25_0();
}

void AlgWorkNode::children(AlgWorkNode *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2575145A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2575145A8))
  {
    qword_2575145B8 = 0;
    byte_2575145C0 = 0;
    qword_2575145B0 = 0;
    __cxa_atexit((void (*)(void *))SAList<std::reference_wrapper<AlgWorkNode>>::~SAList, &qword_2575145B0, &dword_245BE5000);
    __cxa_guard_release(&qword_2575145A8);
  }
  OUTLINED_FUNCTION_3_2();
}

void AlgWorkNode::runPrologue(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  char v11;
  int v12;
  AlgWorkNode *v13;
  AlgDataExtractor *v14;

  v5 = 0;
  v6 = 0;
  v7 = *((unsigned int *)a2 + 17);
  while (v7 != v5)
  {
    v8 = *((_QWORD *)a2 + 1) + 80 * *(unsigned __int8 *)(*((_QWORD *)a2 + 7) - v6 + v5);
    if (*(_QWORD *)v8 == *((_QWORD *)this + 13) && *(_BYTE *)(v8 + 33) == 1)
    {
      OUTLINED_FUNCTION_74(*((_QWORD *)this + 10), *((_DWORD *)this + 23));
      if ((v10 & 1) != 0
        || (OUTLINED_FUNCTION_74(*((_QWORD *)this + 1), *((_DWORD *)this + 5)), (v11 & 1) != 0)
        || (OUTLINED_FUNCTION_74(*((_QWORD *)this + 4), *((_DWORD *)this + 11)), v12))
      {
        *(_BYTE *)(*((_QWORD *)a2 + 4) + 2 * *(unsigned __int8 *)(*((_QWORD *)a2 + 7) - v6 + v5)) = 1;
        PacketCollection::popIterableAt(a2, v5 - v6++);
      }
    }
    ++v5;
  }
  OUTLINED_FUNCTION_37();
  AlgWorkNode::runPrologue(v13, v14);
}

void AlgWorkNode::runEpilogue(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v13;
  AlgWorkNode *v14;
  AlgDataExtractor *v15;

  OUTLINED_FUNCTION_22_0();
  v10 = v9;
  OUTLINED_FUNCTION_13_0();
  while (v6 != v4)
  {
    v11 = *(_QWORD *)(v10 + 8) + *(unsigned __int8 *)(*(_QWORD *)(v10 + 56) - v5 + v4) * (unint64_t)v7;
    if (*(_QWORD *)v11 == *(_QWORD *)(v3 + 104) && *(_BYTE *)(v11 + 33) == 2)
    {
      AlgWorkNode::injectDataIfOnList(*(_QWORD *)(v3 + 56), *(_DWORD *)(v3 + 68), (_QWORD *)v11);
      if (v13)
      {
        *(_BYTE *)(*(_QWORD *)(v10 + 32) + 2 * *(unsigned __int8 *)(*(_QWORD *)(v10 + 56) - v5 + v4)) = v8;
        PacketCollection::popIterableAt((_DWORD *)v10, v4 - v5++);
      }
    }
    ++v4;
  }
  OUTLINED_FUNCTION_37();
  AlgWorkNode::runEpilogue(v14, v15);
}

void AlgWorkNode::runEpilogue(AlgWorkNode *this, AlgDataExtractor *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  char v7;
  int v8;

  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_13_0();
  while (v4 != v3)
  {
    OUTLINED_FUNCTION_21_0();
    v6 = v6 && v5 == 2;
    if (v6)
    {
      OUTLINED_FUNCTION_12_0(*(_QWORD *)(v2 + 56), *(_DWORD *)(v2 + 68));
      if ((v7 & 1) != 0 || (OUTLINED_FUNCTION_12_0(*(_QWORD *)(v2 + 32), *(_DWORD *)(v2 + 44)), v8))
        OUTLINED_FUNCTION_26_0();
    }
    ++v3;
  }
  OUTLINED_FUNCTION_6_1();
}

void AlgWorkNode::extractDataIfOnList(uint64_t a1, int a2, uint64_t *a3, uint64_t a4, int a5)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD v15[3];
  int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = 0;
  v7 = a3[1];
  while (a2 != v6)
  {
    v8 = *(_QWORD **)(a1 + 8 * v6++);
    if (v8[1] == v7)
    {
      v9 = *((_DWORD *)v8 + 4);
      *((_DWORD *)a3 + 4) = v9;
      v10 = (*((_DWORD *)v8 + 6) + 3) & 0xFFFFFFFC;
      a3[3] = v10;
      a3[5] = a4;
      *((_DWORD *)a3 + 12) = a5;
      v11 = a3[8];
      if (v11)
      {
        v12 = *a3;
        v13 = *((_BYTE *)a3 + 33);
        v15[0] = a3[9];
        v15[1] = v12;
        v15[2] = v7;
        v16 = v9;
        v17 = v13;
        v18 = *((unsigned __int16 *)v8 + 10);
        v19 = 0;
        v20 = v10 - v18;
        v21 = 0;
        (*(void (**)(_QWORD *, uint64_t, _QWORD *))(*v8 + 24))(v8, v11, v15);
      }
      else
      {
        v14 = a3[7];
        if (!v14)
        {
          v14 = OUTLINED_FUNCTION_73(v10);
          a3[7] = v14;
        }
        (*(void (**)(_QWORD *, uint64_t))(*v8 + 16))(v8, v14);
      }
      break;
    }
  }
  OUTLINED_FUNCTION_66();
}

void AlgWorkNode::injectDataIfOnList(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  while (a2 != v4)
  {
    v5 = *(_QWORD *)(a1 + 8 * v4++);
    if (*(_QWORD *)(v5 + 8) == a3[1])
    {
      v6 = a3[7];
      v7 = v6 & 3;
      if ((v6 & 3) != 0)
      {
        v6 = OUTLINED_FUNCTION_73(a3[3]);
        memcpy((void *)v6, (const void *)a3[7], a3[3]);
      }
      (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v5 + 32))(v5, v6, a3[3]);
      *(_BYTE *)(v5 + 29) = 1;
      if (v7 && v6)
        OUTLINED_FUNCTION_0_4();
      break;
    }
  }
  OUTLINED_FUNCTION_25_0();
}

void AlgWorkNode::runPrologue(AlgWorkNode *this, AlgDataExtractor *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  char v7;
  int v8;

  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_13_0();
  while (v4 != v3)
  {
    OUTLINED_FUNCTION_21_0();
    v6 = v6 && v5 == 1;
    if (v6)
    {
      OUTLINED_FUNCTION_12_0(*(_QWORD *)(v2 + 80), *(_DWORD *)(v2 + 92));
      if ((v7 & 1) != 0 || (OUTLINED_FUNCTION_12_0(*(_QWORD *)(v2 + 8), *(_DWORD *)(v2 + 20)), v8))
        OUTLINED_FUNCTION_26_0();
    }
    ++v3;
  }
  OUTLINED_FUNCTION_6_1();
}

void AlgWorkNode::AlgWorkNode(AlgWorkNode *this)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)this = off_2516DD2E0;
  *((_QWORD *)this + 1) = 0;
  v1 = OUTLINED_FUNCTION_31_0((uint64_t)this, COERCE_DOUBLE(16));
  *(_QWORD *)(v1 + 104) = v2;
}

void AlgWorkNode::getDataNodeInfo(uint64_t a1, char a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;

  v7 = 0;
  v4 = *(_QWORD *)(a1 + 8);
  v3 = (*(_DWORD *)(a1 + 24) + 3) & 0xFFFFFFFC;
  v5 = *(_DWORD *)(a1 + 16);
  v6 = v3;
  LOBYTE(v7) = a2;
  AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(a3, &v4);
  OUTLINED_FUNCTION_2_1();
}

void AlgWorkNode::getTreeInfo(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  int v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char v19;

  if (!a3 || (v5 = OUTLINED_FUNCTION_14_0(), OUTLINED_FUNCTION_59(v5), OUTLINED_FUNCTION_71(), v6))
  {
    v7 = 0;
    while (v7 < *(unsigned int *)(a1 + 20))
    {
      OUTLINED_FUNCTION_54(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v7++), 2);
      if ((v8 & 1) == 0)
        goto LABEL_18;
    }
    v9 = 0;
    while (v9 < *(unsigned int *)(a1 + 44))
    {
      OUTLINED_FUNCTION_54(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v9++), 4);
      if ((v10 & 1) == 0)
        goto LABEL_18;
    }
    v11 = 0;
    while (v11 < *(unsigned int *)(a1 + 68))
    {
      OUTLINED_FUNCTION_54(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11++), 3);
      if ((v12 & 1) == 0)
        goto LABEL_18;
    }
    v13 = 0;
    while (v13 < *(unsigned int *)(a1 + 92))
    {
      OUTLINED_FUNCTION_54(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8 * v13++), 5);
      if ((v14 & 1) == 0)
        goto LABEL_18;
    }
    v15 = 0;
    do
    {
      if (v15 >= *(unsigned int *)(OUTLINED_FUNCTION_14_0() + 12))
        break;
      v16 = *(_QWORD *)(*(_QWORD *)OUTLINED_FUNCTION_14_0() + 8 * v15);
      OUTLINED_FUNCTION_72(*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 24));
      v17 = OUTLINED_FUNCTION_14_0();
      OUTLINED_FUNCTION_59(v17);
      if (!v18)
        break;
      AlgWorkNode::getTreeInfo(v16, a2, 0);
      OUTLINED_FUNCTION_71();
      ++v15;
    }
    while ((v19 & 1) != 0);
  }
LABEL_18:
  OUTLINED_FUNCTION_34();
}

void AlgWorkNode::getTreeSize(AlgWorkNode *this)
{
  unint64_t v1;
  int v2;
  _QWORD *v3;

  v1 = 0;
  v2 = *((unsigned __int16 *)this + 10)
     + *((unsigned __int16 *)this + 22)
     + *((unsigned __int16 *)this + 34)
     + *((unsigned __int16 *)this + 46)
     + 1;
  while (v1 < *(unsigned int *)(OUTLINED_FUNCTION_10() + 12))
  {
    v3 = (_QWORD *)OUTLINED_FUNCTION_10();
    v2 += AlgWorkNode::getTreeSize(*(AlgWorkNode **)(*v3 + 8 * v1++));
  }
  OUTLINED_FUNCTION_2_2();
}

uint64_t *AlgWorkNode::resetInjectionStateOnList(uint64_t *result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a2;
  if (a2)
  {
    do
    {
      v3 = *result++;
      *(_BYTE *)(v3 + 29) = 0;
      --v2;
    }
    while (v2);
  }
  return result;
}

void AlgWorkNode::resetInjectionState(AlgWorkNode *this)
{
  unint64_t i;
  _QWORD *v3;

  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 10), *((_DWORD *)this + 23));
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 1), *((_DWORD *)this + 5));
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 4), *((_DWORD *)this + 11));
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 7), *((_DWORD *)this + 17));
  for (i = 0; i < *(unsigned int *)(OUTLINED_FUNCTION_10() + 12); ++i)
  {
    v3 = (_QWORD *)OUTLINED_FUNCTION_10();
    AlgWorkNode::resetInjectionState(*(AlgWorkNode **)(*v3 + 8 * i));
  }
  OUTLINED_FUNCTION_3_2();
}

void StreamingPacketCache::~StreamingPacketCache(StreamingPacketCache *this)
{
  if (*((_QWORD *)this + 1))
    OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
}

uint64_t StreamingParser::StreamingParser(uint64_t result, uint64_t a2, uint64_t a3, char *a4)
{
  char v4;
  uint64_t v5;

  *(_QWORD *)result = a4;
  if (a4)
  {
    v4 = *a4;
    v5 = *((_QWORD *)a4 + 1);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *(_QWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = 0;
  *(_BYTE *)(result + 40) = v4;
  *(_QWORD *)(result + 48) = v5;
  return result;
}

uint64_t StreamingParser::parseReset(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke(uint64_t a1, char a2, int a3, char a4, char a5)
{
  _DWORD *v5;
  _BYTE *v6;
  _BYTE *v7;

  if (*(_QWORD *)a1)
    **(_BYTE **)a1 = a2;
  v5 = *(_DWORD **)(a1 + 8);
  if (v5)
    *v5 = a3;
  v6 = *(_BYTE **)(a1 + 16);
  if (v6)
    *v6 = a4;
  v7 = *(_BYTE **)(a1 + 24);
  if (v7)
    *v7 = a5;
  return OUTLINED_FUNCTION_4_2();
}

void SABinaryParser::parseInfoData(uint64_t *a1, unsigned int (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t (*a3)(uint64_t, const char *), unsigned int (*a4)(uint64_t, BOOL))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, unsigned __int8 *, char *);
  uint64_t (*v21)(uint64_t, unsigned __int8 *, char *);
  uint64_t (*v22)(_QWORD);

  v4 = a1[2];
  if ((unint64_t)(a1[1] - v4) >= 7)
  {
    v8 = *a1;
    a1[2] = v4 + 7;
    if (!a2
      || a2(a1[3], *(unsigned __int8 *)(v8 + v4), *(unsigned int *)(v8 + v4 + 1), *(unsigned __int8 *)(v8 + v4 + 5), *(unsigned __int8 *)(v8 + v4 + 6)))
    {
      while (1)
      {
        v9 = a1[1];
        v10 = a1[2];
        if (v9 == v10)
          break;
        v11 = *a1;
        v12 = (unsigned __int8 *)(*a1 + v10);
        v13 = *v12;
        v14 = v10 + 1;
        a1[2] = v10 + 1;
        if (!v13)
        {
          if (v9 == v14)
            break;
          v18 = v10 + 2;
          a1[2] = v18;
          if (a4)
          {
            if (!a4(a1[3], *(_BYTE *)(v11 + v14) != 0))
              break;
            v9 = a1[1];
            v18 = a1[2];
          }
          if (v9 != v18)
          {
            v19 = OUTLINED_FUNCTION_67();
            SABinaryParser::parseInjExtData(v19, v20, v21, v22);
            return;
          }
          break;
        }
        v15 = *v12;
        if (v9 - v14 >= v15)
        {
          a1[2] = v14 + v15;
          v17 = *v12;
          v16 = (const char *)(v12 + 1);
          if (strnlen(v16, v17) != v17 && (!a3 || (a3(a1[3], v16) & 1) != 0))
            continue;
        }
        break;
      }
    }
  }
  OUTLINED_FUNCTION_25_0();
}

void SABinaryParser::parseInjExtData(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned __int8 *, char *), uint64_t (*a3)(uint64_t, unsigned __int8 *, char *), uint64_t (*a4)(_QWORD))
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned __int8 *v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;

  while (1)
  {
    v8 = *(_QWORD *)(a1 + 8);
    v9 = *(_QWORD *)(a1 + 16);
    v10 = v8 - v9;
    if (v8 <= v9)
      break;
    v11 = (unsigned __int8 *)(*(_QWORD *)a1 + v9);
    v12 = (char)*v11;
    if (v12 < 0)
    {
      v14 = *(_QWORD *)(a1 + 40);
      if (!v14)
        break;
      v15 = v12 & 0x7F;
      if (v15 >= *(unsigned __int8 *)(a1 + 32))
        break;
      v16 = (unsigned __int8 *)(v14 + 22 * v15);
      v17 = *((unsigned __int16 *)v16 + 10);
      if (v10 <= v17)
        break;
      *(_QWORD *)(a1 + 16) = v9 + v17 + 1;
      if (*v16 == 1)
      {
        if (a2)
        {
          v18 = *(_QWORD *)(a1 + 24);
          v19 = (char *)(v11 + 1);
          v11 = v16;
LABEL_20:
          if ((a2(v18, v11, v19) & 1) == 0)
            break;
        }
      }
      else if (a3)
      {
        v21 = *(_QWORD *)(a1 + 24);
        v22 = (char *)(v11 + 1);
        v11 = v16;
LABEL_26:
        if ((a3(v21, v11, v22) & 1) == 0)
          break;
      }
    }
    else
    {
      if (v10 < 0x12)
        break;
      v13 = *v11;
      *(_QWORD *)(a1 + 16) = v9 + 18;
      if (v13 == 3)
      {
        if (a4 && (a4(*(_QWORD *)(a1 + 24)) & 1) == 0)
          break;
      }
      else
      {
        if (v8 - (v9 + 18) < 4)
          break;
        *(_QWORD *)(a1 + 16) = v9 + 22;
        v20 = *((unsigned __int16 *)v11 + 10);
        if (v8 - (v9 + 22) < v20)
          break;
        *(_QWORD *)(a1 + 16) = v9 + 22 + v20;
        if (v13 == 2)
        {
          if (a3)
          {
            v21 = *(_QWORD *)(a1 + 24);
            v22 = (char *)(v11 + 22);
            goto LABEL_26;
          }
        }
        else
        {
          if (v13 != 1)
            break;
          if (a2)
          {
            v18 = *(_QWORD *)(a1 + 24);
            v19 = (char *)(v11 + 22);
            goto LABEL_20;
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_42();
}

void StreamingParser::addPoint(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  if (*(_BYTE *)(a2 + 17))
  {
    v10 = *(_OWORD *)(a2 + 1);
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_29_0(v2, v3, v4, v5, v6, v7, v8, v9, v10);
  }
  OUTLINED_FUNCTION_34();
}

void StreamingParser::parseRun(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t *, unsigned __int16 *);
  uint64_t (*v5)(uint64_t, unsigned __int8 *, char *);
  uint64_t (*v6)(uint64_t, unsigned __int8 *, char *);
  _QWORD v7[3];

  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  *(_QWORD *)(a1 + 32) = v7;
  if (a2)
    v4 = StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_0::__invoke;
  else
    v4 = 0;
  if (a3)
    v5 = (uint64_t (*)(uint64_t, unsigned __int8 *, char *))StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_1::__invoke;
  else
    v5 = 0;
  if (a4)
    v6 = (uint64_t (*)(uint64_t, unsigned __int8 *, char *))StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_2::__invoke;
  else
    v6 = 0;
  SABinaryParser::parseRunFrame((_QWORD *)(a1 + 8), (unsigned int (*)(_QWORD))v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

uint64_t StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_0::__invoke(uint64_t *a1, unsigned __int16 *a2)
{
  uint64_t v2;

  v2 = *a1;
  *(_DWORD *)v2 = *a2;
  *(_QWORD *)(v2 + 8) = a2[1];
  *(_QWORD *)(v2 + 16) = a2 + 2;
  return OUTLINED_FUNCTION_4_2();
}

void SABinaryParser::parseRunFrame(_QWORD *a1, unsigned int (*a2)(_QWORD), uint64_t (*a3)(uint64_t, unsigned __int8 *, char *), uint64_t (*a4)(uint64_t, unsigned __int8 *, char *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a1[1];
  v5 = a1[2];
  if ((unint64_t)(v4 - v5) < 2
    || (a1[2] = v5 + 2, (unint64_t)(v4 - (v5 + 2)) < 4)
    || (v8 = *a1 + v5 + 2, v9 = v5 + 6, a1[2] = v9, v10 = *(unsigned __int16 *)(v8 + 2), v4 - v9 < v10)
    || (a1[2] = v9 + v10, a2) && !a2(a1[3]))
  {
    OUTLINED_FUNCTION_2_2();
  }
  else
  {
    OUTLINED_FUNCTION_7_0((uint64_t)a1, a3, a4, 0);
  }
}

void StreamingParser::addPacket(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  __int128 v14;

  v14 = *(_OWORD *)(a2 + 1);
  OUTLINED_FUNCTION_63();
  v13 = OUTLINED_FUNCTION_29_0(v5, v6, v7, v8, v9, v10, v11, v12, v14);
  if (a3 == 2 && v13)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 2 * *(unsigned int *)(a1 + 20) - 2) = 1;
  OUTLINED_FUNCTION_66();
}

uint64_t StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke(_QWORD **a1, uint64_t a2)
{
  **a1 = a2;
  return OUTLINED_FUNCTION_4_2();
}

void StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_3::__invoke(uint64_t a1, uint64_t a2)
{
  StreamingParser::addPoint(*(_QWORD *)(a1 + 24), a2);
}

void SABinaryParser::parseInjExtFrame(uint64_t *a1, unsigned int (*a2)(uint64_t, _QWORD), uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, unsigned __int8 *, char *);
  uint64_t (*v11)(uint64_t, unsigned __int8 *, char *);

  v6 = a1[1];
  v5 = a1[2];
  if ((unint64_t)(v6 - v5) < 2
    || (a1[2] = v5 + 2, (unint64_t)(v6 - (v5 + 2)) < 8)
    || (v8 = *a1, a1[2] = v5 + 10, a2) && !a2(a1[3], *(_QWORD *)(v8 + v5 + 2)))
  {
    OUTLINED_FUNCTION_2_2();
  }
  else
  {
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_7_0(v9, v10, v11, a5);
  }
}

void StreamingParser::numberOfPackets(StreamingParser *this, unint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v8;
  char *v9;
  unsigned int (*v10)(_QWORD);
  uint64_t (*v11)(uint64_t, unsigned __int8 *, char *);
  uint64_t (*v12)(uint64_t, unsigned __int8 *, char *);
  uint64_t *v13;
  unsigned int (*v14)(uint64_t, _QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_QWORD);
  uint64_t *v18;
  unsigned int (*v19)(uint64_t, BOOL);
  uint64_t v20;
  uint64_t *v21;
  unsigned int (*v22)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v23;
  unint64_t *v24;
  unint64_t *v25;
  unint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v8 = *(_OWORD *)((char *)this + 24);
  v27 = *(_OWORD *)((char *)this + 8);
  v28 = v8;
  v29 = *(_OWORD *)((char *)this + 40);
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v24 = a2;
  v25 = a3;
  v26 = a4;
  *((_QWORD *)&v28 + 1) = &v24;
  if (*((_QWORD *)&v27 + 1) >= 2uLL && *(_BYTE *)v27 == 1)
  {
    switch(*(_BYTE *)(v27 + 1))
    {
      case 2:
        v9 = OUTLINED_FUNCTION_65(0, (uint64_t)a2, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_0::__invoke, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_1::__invoke, a5, a6, a7, a8, v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26, v27);
        SABinaryParser::parseRunFrame(v9, v10, v11, v12);
        break;
      case 3:
        v13 = (uint64_t *)OUTLINED_FUNCTION_65(0, (uint64_t)a2, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_0::__invoke, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_1::__invoke, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke, a6, a7, a8, v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26, v27);
        SABinaryParser::parseInjExtFrame(v13, v14, v15, v16, v17);
        break;
      case 5:
        v18 = (uint64_t *)OUTLINED_FUNCTION_65(0, (uint64_t)a2, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke, (uint64_t)a4, a5, a6, a7, a8, v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26, v27);
        SABinaryParser::parseConfigure(v18, v19, v20, 0);
        break;
      case 6:
        v21 = (uint64_t *)OUTLINED_FUNCTION_65(0, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke, a6, a7, a8, v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26, v27);
        SABinaryParser::parseInfo(v21, v22, 0, 0);
        break;
      default:
        break;
    }
  }
  OUTLINED_FUNCTION_34();
}

uint64_t StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_0::__invoke(_QWORD **a1)
{
  if (*a1)
    ++**a1;
  return OUTLINED_FUNCTION_4_2();
}

uint64_t StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_1::__invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 8);
  if (v1)
    ++*v1;
  return OUTLINED_FUNCTION_4_2();
}

uint64_t StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
    ++*v1;
  return OUTLINED_FUNCTION_4_2();
}

void SABinaryParser::parseConfigure(uint64_t *a1, unsigned int (*a2)(uint64_t, BOOL), uint64_t a3, unsigned int (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unsigned int v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, unsigned __int8 *, char *);
  uint64_t (*v16)(uint64_t, unsigned __int8 *, char *);
  uint64_t (*v17)(_QWORD);

  v5 = a1[1];
  v4 = a1[2];
  if ((unint64_t)(v5 - v4) < 2)
    goto LABEL_3;
  a1[2] = v4 + 2;
  if (v5 == v4 + 2)
    goto LABEL_3;
  v8 = *a1;
  v9 = (unsigned __int8 *)(*a1 + v4 + 2);
  v10 = v4 + 3;
  a1[2] = v4 + 3;
  v11 = *v9;
  v12 = v9;
  if (v11 < 2)
  {
LABEL_9:
    if (!a2 || !v12 || a2(a1[3], *v12 != 0))
      goto LABEL_12;
LABEL_3:
    OUTLINED_FUNCTION_2_2();
    return;
  }
  if (v5 != v10)
  {
    v12 = (_BYTE *)(v8 + v10);
    a1[2] = v4 + 4;
    goto LABEL_9;
  }
  if (v11 != 3)
    goto LABEL_3;
LABEL_12:
  if (a4)
  {
    v13 = *v9 <= 2u ? 2 : *v9;
    if (!a4(a1[3], v13))
      goto LABEL_3;
  }
  v14 = OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_7_0(v14, v15, v16, v17);
}

void SABinaryParser::parseInfo(uint64_t *a1, unsigned int (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t (*a3)(uint64_t, const char *), unsigned int (*a4)(uint64_t, BOOL))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a1[1];
  v5 = a1[2];
  if ((unint64_t)(v4 - v5) >= 2)
  {
    v6 = v5 + 2;
    a1[2] = v6;
    if (v4 == v6)
      OUTLINED_FUNCTION_4_2();
    else
      SABinaryParser::parseInfoData(a1, a2, a3, a4);
  }
}

uint64_t StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_0::__invoke(uint64_t a1, char a2)
{
  **(_BYTE **)(a1 + 8) = a2;
  return OUTLINED_FUNCTION_4_2();
}

void StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_1::__invoke(uint64_t a1, uint64_t a2)
{
  StreamingParser::addPoint(*(_QWORD *)(a1 + 16), a2);
}

uint64_t StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_2::__invoke(_BYTE **a1, char a2)
{
  **a1 = a2;
  return OUTLINED_FUNCTION_4_2();
}

void StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_1::__invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = a2;
  SAList<char const*>::push_back(*(_QWORD *)(a1 + 32), &v2);
  OUTLINED_FUNCTION_47();
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_2::__invoke(uint64_t a1, char a2)
{
  **(_BYTE **)(a1 + 40) = a2;
  return OUTLINED_FUNCTION_4_2();
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_3::__invoke(uint64_t a1, uint64_t a2)
{
  StreamingParser::addPoint(*(_QWORD *)(a1 + 48), a2);
  return 1;
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke(uint64_t a1, char a2, int a3, char a4, char a5)
{
  _DWORD *v5;
  _BYTE *v6;
  _BYTE *v7;

  if (*(_QWORD *)a1)
    **(_BYTE **)a1 = a2;
  v5 = *(_DWORD **)(a1 + 8);
  if (v5)
    *v5 = a3;
  v6 = *(_BYTE **)(a1 + 16);
  if (v6)
    *v6 = a4;
  v7 = *(_BYTE **)(a1 + 24);
  if (v7)
    *v7 = a5;
  return OUTLINED_FUNCTION_4_2();
}

uint64_t SABinaryWriter::updateCacheSizes(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _WORD *v3;

  v2 = result;
  v3 = (_WORD *)(a2 + 20);
  if ((_DWORD)result)
  {
    do
    {
      *v3 = (*v3 + 3) & 0xFFFC;
      v3 += 11;
      --v2;
    }
    while (v2);
  }
  return result;
}

void StreamingWriter::StreamingWriter(StreamingWriter *this, void *a2, uint64_t a3, StreamingPacketCache *a4)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = a4;
  if (a4)
  {
    v5 = *(unsigned __int8 *)a4;
    v6 = *((_QWORD *)a4 + 1);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = a3;
  *((_QWORD *)this + 3) = 0;
  *((_BYTE *)this + 32) = 0;
  *((_BYTE *)this + 34) = v5;
  *((_QWORD *)this + 5) = v6;
  SABinaryWriter::updateCacheSizes(v5, v6);
  OUTLINED_FUNCTION_3_2();
}

void SABinaryWriter::writeHeader(uint64_t a1, char a2)
{
  _BYTE v2[2];

  if (!*(_BYTE *)(a1 + 24))
  {
    *(_QWORD *)(a1 + 16) = 0;
    *(_BYTE *)(a1 + 24) = a2;
    v2[0] = 1;
    v2[1] = a2;
    SABinaryWriter::write((SABinaryWriter *)a1, v2, 2uLL);
  }
  OUTLINED_FUNCTION_47();
}

uint64_t SABinaryWriter::write(SABinaryWriter *this, const void *a2, size_t __n)
{
  uint64_t v5;
  uint64_t result;

  if (*(_QWORD *)this)
  {
    v5 = *((_QWORD *)this + 2);
    if (*((_QWORD *)this + 1) - v5 < __n)
    {
      result = 0;
      *((_BYTE *)this + 24) = 0;
      return result;
    }
    memcpy((void *)(*(_QWORD *)this + v5), a2, __n);
  }
  *((_QWORD *)this + 2) += __n;
  return 1;
}

void StreamingWriter::writeResetOrInfo(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  SABinaryWriter *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unint64_t v32;
  _BYTE *v33;
  int v34;
  BOOL v35;
  size_t v36;
  size_t v37;
  unsigned __int8 v38;
  int v39;
  uint64_t v41;
  uint64_t v42;
  char v43[7];
  char v44;

  *(_BYTE *)(a1 + 33) = 0;
  v12 = (SABinaryWriter *)(a1 + 8);
  if (a2)
  {
    v13 = OUTLINED_FUNCTION_46();
    SABinaryWriter::writeHeader(v13, 1);
    if ((v14 & 1) == 0)
      goto LABEL_32;
    v22 = OUTLINED_FUNCTION_48(v14, v15, v16, v17, v18, v19, v20, v21, v42, v43[0]);
    if ((v22 & 1) == 0)
      goto LABEL_32;
  }
  else
  {
    v23 = OUTLINED_FUNCTION_46();
    SABinaryWriter::writeHeader(v23, 6);
    if ((v24 & 1) == 0)
      goto LABEL_32;
    v22 = OUTLINED_FUNCTION_48(v24, v25, v26, v27, v28, v29, v30, v31, v42, v43[0]);
    if (!(_DWORD)v22)
      goto LABEL_32;
  }
  v32 = 0;
  while (v32 < *(unsigned int *)(a7 + 12))
  {
    v33 = *(_BYTE **)(*(_QWORD *)a7 + 8 * v32);
    v34 = *(unsigned __int8 *)(a1 + 32);
    if (v34 == 1)
    {
      if (!v33)
        goto LABEL_32;
    }
    else
    {
      if (v33)
        v35 = v34 == 6;
      else
        v35 = 0;
      if (!v35)
        goto LABEL_32;
    }
    if (*v33)
    {
      v36 = *(_QWORD *)(a1 + 16) + ~*(_QWORD *)(a1 + 24);
      v37 = strnlen(*(const char **)(*(_QWORD *)a7 + 8 * v32), v36);
      if (v37 != v36)
      {
        v38 = v37 + 1;
        if (v37 + 1 <= 0xFF)
        {
          v43[0] = v37 + 1;
          if ((OUTLINED_FUNCTION_16_0(v37, v43) & 1) != 0)
          {
            v22 = SABinaryWriter::write(v12, v33, v38);
            ++v32;
            if ((v22 & 1) != 0)
              continue;
          }
        }
      }
    }
    goto LABEL_32;
  }
  v39 = *(unsigned __int8 *)(a1 + 32);
  if ((v39 == 6 || v39 == 1) && !*(_BYTE *)(a1 + 33))
  {
    *(_BYTE *)(a1 + 33) = 1;
    v43[0] = 0;
    v44 = a8;
    v41 = OUTLINED_FUNCTION_16_0(v22, v43);
    if ((v41 & 1) != 0)
    {
      if (OUTLINED_FUNCTION_16_0(v41, &v44))
      {
        StreamingWriter::writeExtPoints(a1, a9);
        return;
      }
    }
  }
LABEL_32:
  OUTLINED_FUNCTION_32_0();
}

void StreamingWriter::writeExtPoints(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  SABinaryWriter *v6;
  uint64_t v7;
  __int128 *v8;
  __int128 v9;
  int v10;
  int v11;
  BOOL v12;
  char v13;
  char v14;
  __int128 v15;
  char v16;

  if (a2)
  {
    OUTLINED_FUNCTION_55();
    v4 = 0;
    v6 = (SABinaryWriter *)(v5 + 8);
    v7 = -1;
    do
    {
      if (++v7 >= (unint64_t)*(unsigned int *)(v2 + 20))
        break;
      v8 = (__int128 *)(*(_QWORD *)(v2 + 8) + v4);
      v9 = *v8;
      v10 = *((unsigned __int8 *)v8 + 33);
      v11 = *(unsigned __int8 *)(v3 + 32);
      v12 = v11 == 3 || v11 == 5;
      if (!v12 && !*(_BYTE *)(v3 + 33))
        break;
      v4 += 80;
      v14 = 3;
      v15 = v9;
      v13 = v10 == 1 ? 1 : 2;
      v16 = v13;
    }
    while ((SABinaryWriter::write(v6, &v14, 0x12uLL) & 1) != 0);
  }
  OUTLINED_FUNCTION_66();
}

void StreamingWriter::writeInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  StreamingWriter::writeResetOrInfo(a1, 0, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_47();
}

void StreamingWriter::writeInjExtData(StreamingWriter *this, int a2, PacketCollection *a3, int a4)
{
  unint64_t v8;
  SABinaryWriter *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  __int16 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  int v23;
  const void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  char v34;

  if (a3)
  {
    v8 = 0;
    v9 = (StreamingWriter *)((char *)this + 8);
    do
    {
      if (v8 >= *((unsigned int *)a3 + 5))
        break;
      v10 = *((_QWORD *)a3 + 1);
      v11 = v10 + 80 * v8;
      if (a4)
      {
        v12 = *(unsigned __int8 **)this;
        if (*(_QWORD *)this)
        {
          v13 = *((_QWORD *)v12 + 1);
          if (v13)
          {
            v14 = 0;
            v15 = *v12;
            v16 = (unsigned __int16)*(_QWORD *)(v11 + 24);
            v17 = *(_QWORD *)(v11 + 24) + 3;
            v18 = v13 + 17;
            while (v15 != v14)
            {
              if (*(_QWORD *)(v18 - 16) == *(_QWORD *)v11
                && *(_QWORD *)(v18 - 8) == *(_QWORD *)(v11 + 8)
                && (*(_BYTE *)v18 != 1) != (*(_BYTE *)(v11 + 33) == 1)
                && (*(_BYTE *)(v18 - 17) != 1) != a2
                && *(_DWORD *)(v11 + 16) == *(unsigned __int16 *)(v18 + 1)
                && (unsigned __int16)(v17 ^ (*(_WORD *)(v18 + 3) + 3)) < 4u)
              {
                if ((*((_BYTE *)this + 32) & 0xFE) == 2)
                {
                  v20 = *((_QWORD *)this + 5);
                  if (v20)
                  {
                    if (*((unsigned __int8 *)this + 34) > v14)
                    {
                      v21 = v20 + 22 * v14;
                      v23 = *(unsigned __int16 *)(v21 + 20);
                      v22 = (unsigned __int16 *)(v21 + 20);
                      if ((v17 & 0xFFFC) == v23)
                      {
                        v24 = *(const void **)(v10 + 80 * v8 + 56);
                        v34 = v14 | 0x80;
                        SABinaryWriter::write(v9, &v34, 1uLL);
                        OUTLINED_FUNCTION_71();
                        if (v25)
                        {
                          if (v24)
                          {
                            v26 = SABinaryWriter::write(v9, v24, v16);
                            if (v26)
                              OUTLINED_FUNCTION_60(v26, v27, *v22 - v16, v28, v29, v30, v31, v32, v33, 0);
                          }
                        }
                      }
                    }
                  }
                }
                goto LABEL_17;
              }
              ++v14;
              v18 += 22;
            }
          }
        }
      }
      SABinaryWriter::addInjExtData(v9, a2, *(_QWORD *)v11, *(_QWORD *)(v11 + 8), *(unsigned __int8 *)(v11 + 33) == 1, *(_WORD *)(v11 + 16), *(unsigned __int16 *)(v11 + 24), *(const void **)(v10 + 80 * v8++ + 56));
    }
    while ((v19 & 1) != 0);
LABEL_17:
    OUTLINED_FUNCTION_32_0();
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
  }
}

void SABinaryWriter::addInjExtData(SABinaryWriter *this, int a2, uint64_t a3, uint64_t a4, int a5, __int16 a6, unsigned int a7, const void *a8)
{
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  if ((*((_BYTE *)this + 24) & 0xFE) == 2)
  {
    if (a2)
      v12 = 1;
    else
      v12 = 2;
    v14 = v12;
    v15 = a3;
    v16 = a4;
    if (a5)
      v13 = 1;
    else
      v13 = 2;
    v17 = v13;
    if (SABinaryWriter::write(this, &v14, 0x12uLL))
      SABinaryWriter::writeData(this, a6, a7, a8);
  }
}

void SABinaryWriter::writeData(SABinaryWriter *this, __int16 a2, unsigned int a3, const void *a4)
{
  unsigned __int16 v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  _WORD v17[2];

  v17[0] = a2;
  v7 = (a3 + 3) & 0xFFFC;
  v17[1] = v7;
  SABinaryWriter::write(this, v17, 4uLL);
  OUTLINED_FUNCTION_71();
  if (v8)
  {
    if (a4)
    {
      v9 = SABinaryWriter::write(this, a4, a3);
      if (v9)
        OUTLINED_FUNCTION_60(v9, v10, v7 - (unint64_t)a3, v11, v12, v13, v14, v15, v16, 0);
    }
  }
  OUTLINED_FUNCTION_20();
}

void StreamingWriter::writeInjext(StreamingWriter *this, uint64_t a2, AlgDataInjector *a3, AlgDataExtractor *a4, AlgDataExtractor *a5, int a6)
{
  SABinaryWriter *v11;
  char v12;
  int v13;
  int v14;
  uint64_t v15;

  v11 = (StreamingWriter *)((char *)this + 8);
  v15 = a2;
  SABinaryWriter::writeHeader((uint64_t)this + 8, 3);
  if ((v12 & 1) != 0
    && SABinaryWriter::write(v11, &v15, 8uLL)
    && (StreamingWriter::writeInjExtData(this, 1, a3, a6), v13)
    && (StreamingWriter::writeInjExtData(this, 0, a4, a6), v14))
  {
    StreamingWriter::writeExtPoints((uint64_t)this, (uint64_t)a5);
  }
  else
  {
    OUTLINED_FUNCTION_41();
  }
}

void StreamingWriter::writeConfigure(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  v9 = 3;
  SABinaryWriter::writeHeader(a1 + 8, 5);
  if ((v6 & 1) != 0
    && (v7 = OUTLINED_FUNCTION_16_0(v6, &v9), (_DWORD)v7)
    && (v8 = a2, OUTLINED_FUNCTION_16_0(v7, &v8)))
  {
    StreamingWriter::writeExtPoints(a1, a3);
  }
  else
  {
    OUTLINED_FUNCTION_20();
  }
}

void SABinaryWriter::addExtractionData(SABinaryWriter *this, uint64_t a2, uint64_t a3, int a4, __int16 a5, unsigned int a6, const void *a7)
{
  SABinaryWriter::addInjExtData(this, 0, a2, a3, a4, a5, a6, a7);
}

void PacketCollection::add(PacketCollection *this, const AlgDataPacket *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  __int16 v8;

  v3 = *((_QWORD *)a2 + 8);
  if (!v3)
  {
    while (80 * *((unsigned int *)this + 5) != v3)
    {
      v4 = *((_QWORD *)this + 1);
      if (*(_QWORD *)a2 == *(_QWORD *)(v4 + v3))
      {
        v5 = v4 + v3;
        if (*((_QWORD *)a2 + 1) == *(_QWORD *)(v5 + 8)
          && *((unsigned __int8 *)a2 + 33) == *(unsigned __int8 *)(v5 + 33))
        {
          goto LABEL_3;
        }
      }
      v3 += 80;
    }
  }
  SAList<AlgDataPacket>::push_back((uint64_t)this + 8, a2);
  v8 = 0;
  SAList<PacketBookkeeper>::push_back((uint64_t)this + 32, &v8);
  v7 = *((_BYTE *)this + 20) - 1;
  SAList<unsigned char>::push_back((uint64_t)this + 56, &v7);
LABEL_3:
  OUTLINED_FUNCTION_2_1();
}

uint64_t PacketCollection::reset(PacketCollection *this)
{
  uint64_t v1;
  unint64_t i;
  unint64_t v3;
  uint64_t v4;
  int j;
  int k;

  v1 = 0;
  for (i = 0; ; ++i)
  {
    v3 = *((unsigned int *)this + 5);
    if (i >= v3)
      break;
    v4 = *((_QWORD *)this + 1) + v1;
    *(_QWORD *)(v4 + 24) = 0;
    *(_WORD *)(v4 + 32) = 0;
    *(_QWORD *)(v4 + 40) = 0;
    *(_DWORD *)(v4 + 48) = 0;
    *(_QWORD *)(v4 + 56) = 0;
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    *(_DWORD *)(v4 + 16) = 0;
    v1 += 80;
  }
  for (j = *((_DWORD *)this + 11); --j != -1; *((_DWORD *)this + 11) = j)
    ;
  for (k = v3 - 1; k != -1; --k)
    *((_DWORD *)this + 5) = k;
  return SAList<unsigned char>::clear((uint64_t)this + 56);
}

uint64_t SAList<unsigned char>::clear(uint64_t result)
{
  int i;

  for (i = *(_DWORD *)(result + 12); --i != -1; *(_DWORD *)(result + 12) = i)
    ;
  return result;
}

void SAList<AlgDataPacket>::push_back(uint64_t a1, const void *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_11_0(a1);
  if (!v4)
  {
    v4 = OUTLINED_FUNCTION_36(80 * *(unsigned int *)(v2 + 8));
    *(_QWORD *)v2 = v4;
  }
  memcpy((void *)(v4 + 80 * *(unsigned int *)(v2 + 12)), a2, 0x50uLL);
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_3_2();
}

void SAList<PacketBookkeeper>::push_back(uint64_t a1, _WORD *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_11_0(a1);
  if (!v4)
  {
    v4 = OUTLINED_FUNCTION_36(2 * *(unsigned int *)(v2 + 8));
    *(_QWORD *)v2 = v4;
  }
  *(_WORD *)(v4 + 2 * *(unsigned int *)(v2 + 12)) = *a2;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_3_2();
}

void SAList<unsigned char>::push_back(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_11_0(a1);
  if (!v4)
  {
    v4 = OUTLINED_FUNCTION_36(*(unsigned int *)(v2 + 8));
    *(_QWORD *)v2 = v4;
  }
  *(_BYTE *)(v4 + *(unsigned int *)(v2 + 12)) = *a2;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_3_2();
}

void AlgDataInjector::~AlgDataInjector(AlgDataInjector *this)
{
  PacketCollection::~PacketCollection(this);
  OUTLINED_FUNCTION_61();
  JUMPOUT(0x2495439B4);
}

void AlgDataExtractor::~AlgDataExtractor(AlgDataExtractor *this)
{
  PacketCollection::~PacketCollection(this);
  OUTLINED_FUNCTION_61();
  JUMPOUT(0x2495439B4);
}

uint64_t AlgDataExtractor::reset(AlgDataExtractor *this)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 0;
  v2 = 1;
  v3 = 56;
  while (v1 < *((unsigned int *)this + 11))
  {
    if (!*(_BYTE *)(*((_QWORD *)this + 4) + v2))
    {
      if (*(_QWORD *)(*((_QWORD *)this + 1) + v3))
        OUTLINED_FUNCTION_0_4();
    }
    ++v1;
    v2 += 2;
    v3 += 80;
  }
  return PacketCollection::reset(this);
}

uint64_t AlgDataPacket::AlgDataPacket(uint64_t result, uint64_t a2, uint64_t a3, int a4, char a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(_QWORD *)(result + 24) = a8;
  *(_BYTE *)(result + 32) = a5;
  *(_BYTE *)(result + 33) = a6;
  *(_WORD *)(result + 34) = 0;
  *(_QWORD *)(result + 40) = a9;
  *(_DWORD *)(result + 48) = a10;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 72) = 0;
  *(_QWORD *)(result + 56) = a7;
  return result;
}

uint64_t PacketCollection::PacketCollection(uint64_t result, int a2, char a3)
{
  *(_QWORD *)result = &off_2516DD3F8;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = 0;
  *(_BYTE *)(result + 24) = a3;
  *(_QWORD *)(result + 32) = 0;
  *(_DWORD *)(result + 40) = a2;
  *(_DWORD *)(result + 44) = 0;
  *(_BYTE *)(result + 48) = a3;
  *(_QWORD *)(result + 56) = 0;
  *(_DWORD *)(result + 64) = a2;
  *(_DWORD *)(result + 68) = 0;
  *(_BYTE *)(result + 72) = a3;
  return result;
}

void PacketCollection::append(PacketCollection *this, const PacketCollection *a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int16 v18;

  OUTLINED_FUNCTION_55();
  v11 = *(unsigned int *)(v10 + 20);
  if (v8 != -1)
    v11 = v8;
  v12 = v11 + v9;
  v13 = v7 + 8;
  v14 = v7 + 32;
  v15 = v7 + 56;
  v16 = 80 * v9;
  while (a4 < v12)
  {
    SAList<AlgDataPacket>::push_back(v13, (const void *)(*(_QWORD *)(v4 + 8) + v16));
    v18 = 0;
    SAList<PacketBookkeeper>::push_back(v14, &v18);
    v17 = *(_BYTE *)(v5 + 20) - 1;
    SAList<unsigned char>::push_back(v15, &v17);
    ++a4;
    v16 += 80;
  }
}

uint64_t PacketCollection::at(PacketCollection *this, uint64_t a2)
{
  return *((_QWORD *)this + 1) + 80 * a2;
}

_DWORD *PacketCollection::popIterableAt(_DWORD *this, uint64_t a2)
{
  int v2;
  uint64_t v3;

  v2 = this[17];
  v3 = (v2 - 1);
  if (v3 == a2)
  {
    if (v2)
      this[17] = v3;
  }
  else
  {
    this[17] = v3;
    return memmove((void *)(*((_QWORD *)this + 7) + a2), (const void *)(*((_QWORD *)this + 7) + a2 + 1), v3 - a2);
  }
  return this;
}

uint64_t PacketCollection::getFor(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;
  int v11;
  _BOOL4 v12;

  v4 = 0;
  v5 = 0;
  v6 = *(unsigned int *)(a1 + 20);
  while (1)
  {
    if (v6 == v5)
      return 0;
    v7 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(v7 + v4) == a2 && *(_QWORD *)(v7 + v4 + 8) == a3;
    if (v8 && *(unsigned __int8 *)(v7 + v4 + 33) == a4)
      break;
    ++v5;
    v4 += 80;
  }
  v10 = 0;
  if ((v5 & 0x80000000) == 0 && v6 > v5)
  {
    v10 = v7 + 80 * v5;
    v11 = *(unsigned __int8 *)(v10 + 32);
    v12 = v11 == 2 && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 2 * v5) != 0;
    if (v11 == 1 || v12)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 2 * v5 + 1) = 1;
      return v10;
    }
    return 0;
  }
  return v10;
}

void AlgDataExtractor::callbackFor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a4)
  {
    OUTLINED_FUNCTION_29_0(a1, a2, a3, a4, a5, a6, a7, a8, a2);
    OUTLINED_FUNCTION_34();
  }
}

void AlgsDevice::StreamingClient::~StreamingClient(AlgsDevice::StreamingClient *this)
{
  AlgsDevice::StreamingClient::~StreamingClient(this);
}

{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = off_2516DD368;
  v2 = *((_QWORD *)this + 13);
  if (v2)
    OUTLINED_FUNCTION_9_0(v2);
  v3 = *((_QWORD *)this + 14);
  if (v3)
    OUTLINED_FUNCTION_9_0(v3);
  OUTLINED_FUNCTION_15_0();
}

void sub_245BF0BE0()
{
  OUTLINED_FUNCTION_61();
  JUMPOUT(0x2495439B4);
}

void AlgsDevice::StreamingClient::reset(AlgsDevice::StreamingClient *this)
{
  int *v2;
  unint64_t Info;
  _BYTE v4[96];

  if (*((_QWORD *)this + 6))
  {
    v2 = (int *)*((_QWORD *)this + 4);
    Info = AlgsDevice::getInfo((AlgsDevice *)v2);
    OUTLINED_FUNCTION_16((uint64_t)v4, v2[12]);
    AlgsDevice::getClientExtractor(*((_QWORD *)this + 4), (uint64_t)v4);
    StreamingWriter::writeResetOrInfo((uint64_t)this + 40, 1, BYTE5(Info), Info, BYTE4(Info), BYTE6(Info), *((_QWORD *)this + 4) + 80, *((_BYTE *)this + 96), (uint64_t)v4);
    PacketCollection::~PacketCollection((PacketCollection *)v4);
  }
}

void sub_245BF0C88(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  PacketCollection::~PacketCollection((PacketCollection *)va);
  OUTLINED_FUNCTION_9();
}

void AlgsDevice::StreamingClient::start(uint64_t a1, int *a2, PacketCollection *a3, AlgDataExtractor *a4)
{
  uint64_t v4;
  _OWORD *v9;
  int v10;
  int v11;
  const void *v12;
  uint64_t v13;
  int v14;
  int v15;
  char v16;
  char v17;

  v4 = a1 + 48;
  if (*(_QWORD *)(a1 + 48))
  {
    v9 = (_OWORD *)(a1 + 40);
    *(_WORD *)(a1 + 20) = 0;
    AlgsDevice::StreamingClient::saveTimestamp((AlgsDevice::StreamingClient *)a1, 0x310E1E39B3);
    v10 = *(unsigned __int8 *)(a1 + 96);
    *(_BYTE *)(a1 + 97) |= v10;
    if (!v10)
      a3 = 0;
    if (a2)
    {
      v11 = *a2;
      v13 = *((_QWORD *)a2 + 1);
      v12 = (const void *)*((_QWORD *)a2 + 2);
      SABinaryWriter::writeHeader(v4, 2);
      if (v14)
      {
        SABinaryWriter::writeData((SABinaryWriter *)v4, v11, (unsigned __int16)v13, v12);
        if (v15)
        {
          StreamingWriter::writeInjExtData((StreamingWriter *)(v4 - 8), 1, a3, 0);
          if ((v16 & 1) != 0)
            goto LABEL_11;
        }
      }
    }
    else
    {
      StreamingWriter::writeInjext((StreamingWriter *)(v4 - 8), *(_QWORD *)(a1 + 88), a3, 0, a4, 0);
      if ((v17 & 1) != 0)
        goto LABEL_11;
    }
    OUTLINED_FUNCTION_38();
    *(_BYTE *)(v4 + 24) = 0;
    *v9 = 0u;
    *(_OWORD *)(v4 + 8) = 0u;
    *(_BYTE *)(a1 + 74) = 0;
    *(_QWORD *)(a1 + 80) = 0;
  }
LABEL_11:
  OUTLINED_FUNCTION_42();
}

void AlgsDevice::StreamingClient::finish(const void **this)
{
  uint64_t v2;

  if (*((_WORD *)this + 10) && *((_QWORD *)this[4] + 13))
  {
    AlgsDevice::StreamingClient::saveTimestamp((AlgsDevice::StreamingClient *)this, 0x652B2D24D46);
    *((_BYTE *)this[1] + 5) = *((_BYTE *)this + 20);
    SABinaryWriter::addExtractionData((SABinaryWriter *)(this + 6), 0x3779B8717A8905ELL, 0xC0246BF06F597652, 0, 39424, *((unsigned __int16 *)this + 8), this[1]);
    if ((_DWORD)v2)
      *((_BYTE *)this + 97) = 1;
    else
      OUTLINED_FUNCTION_5_1(v2);
  }
  if (!*((_BYTE *)this + 97) && !this[11])
    OUTLINED_FUNCTION_5_1(0);
  *((_BYTE *)this + 97) = 0;
  OUTLINED_FUNCTION_3_2();
}

void AlgsDevice::StreamingClient::saveTimestamp(AlgsDevice::StreamingClient *this, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v4)(void);
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *((_QWORD *)this + 3);
  if (v2)
  {
    v4 = *(uint64_t (**)(void))(*((_QWORD *)this + 4) + 104);
    if (v4)
    {
      v6 = *((unsigned __int16 *)this + 10);
      if (v6 == *((unsigned __int16 *)this + 9))
      {
        AlgsDevice::StreamingClient::profileAlloc(this, 2 * (*((_WORD *)this + 8) & 0x7FFF));
        v6 = *((unsigned __int16 *)this + 10);
        v2 = *((_QWORD *)this + 3);
        v4 = *(uint64_t (**)(void))(*((_QWORD *)this + 4) + 104);
      }
      *(_QWORD *)(v2 + 16 * v6) = a2;
      v7 = v4();
      v8 = *((unsigned __int16 *)this + 10);
      *(_QWORD *)(*((_QWORD *)this + 3) + 16 * v8 + 8) = v7;
      *((_WORD *)this + 10) = v8 + 1;
    }
  }
  OUTLINED_FUNCTION_3_2();
}

void AlgsDevice::StreamingClient::profileAlloc(AlgsDevice::StreamingClient *this, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const void *v6;
  size_t v7;

  *((_WORD *)this + 8) = a2;
  *((_WORD *)this + 9) = (a2 + 1048568) >> 4;
  v3 = *((_QWORD *)this + 1);
  v4 = operator new(a2, *((unsigned __int8 *)this + 120));
  *((_QWORD *)this + 1) = v4;
  if (v3)
  {
    OUTLINED_FUNCTION_37();
    memcpy(v5, v6, v7);
    OUTLINED_FUNCTION_15_0();
  }
  *(_DWORD *)v4 = 20488;
  *(_BYTE *)(v4 + 4) = 2;
  *(_BYTE *)(v4 + 6) = 2;
  *((_QWORD *)this + 3) = *((_QWORD *)this + 1) + 8;
  OUTLINED_FUNCTION_2_2();
}

void sub_245BF0F7C()
{
  uint64_t v0;

  StreamingPacketCache::~StreamingPacketCache((StreamingPacketCache *)(v0 + 128));
  OUTLINED_FUNCTION_3_2();
}

void AlgsDevice::StreamingClient::configure(AlgsDevice::StreamingClient *this, BOOL a2, AlgDataExtractor *a3)
{
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_22_0();
  *(_BYTE *)(v3 + 96) = v4;
  OUTLINED_FUNCTION_15_0();
}

void AlgsDevice::StreamingClient::extraction(__int16 *a1)
{
  uint64_t v1;
  SABinaryWriter *v2;
  int v4;

  v1 = *(_QWORD *)a1;
  v2 = (SABinaryWriter *)(*(_QWORD *)a1 + 48);
  if (*(_QWORD *)v2)
  {
    SABinaryWriter::addExtractionData((SABinaryWriter *)(*(_QWORD *)a1 + 48), *((_QWORD *)a1 + 1), *((_QWORD *)a1 + 2), *((unsigned __int8 *)a1 + 28) == 1, a1[12], (unsigned __int16)(*((_DWORD *)a1 + 12) + a1[16]), 0);
    if (v4
      && SABinaryWriter::write(v2, *((const void **)a1 + 5), (unsigned __int16)a1[16])
      && SABinaryWriter::write(v2, *((const void **)a1 + 7), (unsigned __int16)a1[24]))
    {
      *(_BYTE *)(v1 + 97) = 1;
    }
    else
    {
      OUTLINED_FUNCTION_38();
      *(_BYTE *)(v1 + 72) = 0;
      *(_OWORD *)(v1 + 40) = 0u;
      *(_OWORD *)(v1 + 56) = 0u;
      *(_BYTE *)(v1 + 74) = 0;
      *(_QWORD *)(v1 + 80) = 0;
    }
  }
  OUTLINED_FUNCTION_2_2();
}

void AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(uint64_t a1, uint64_t *a2)
{
  unint64_t v3;
  SABinaryWriter *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *i;
  __int16 v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v17[2];

  if (*(_BYTE *)(a1 + 72) == 8)
  {
    v3 = 0;
    v4 = (SABinaryWriter *)(a1 + 48);
    v5 = *((_BYTE *)a2 + 16);
    v6 = *a2;
    v7 = a2[1];
    v8 = *((_BYTE *)a2 + 17);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = v9 + *(_QWORD *)(a1 + 64);
    v11 = *(unsigned __int16 *)(v9 + 5);
    v12 = (_QWORD *)(v10 - 16 * v11);
    for (i = v12; ; i += 2)
    {
      if (v11 == v3)
      {
        v3 = *(unsigned __int16 *)(v9 + 5);
        v14 = *(_WORD *)(v9 + 5);
        goto LABEL_8;
      }
      if (*i == v6)
        break;
      ++v3;
    }
    v14 = v3;
LABEL_8:
    v15 = *(unsigned __int16 *)(v9 + 3);
    v16 = v9 + 7 + 4 * v15;
    if (v16 < (unint64_t)v12)
    {
      *(_WORD *)v16 = v14;
      *(_BYTE *)(v16 + 2) = v8;
      *(_BYTE *)(v16 + 3) = v5;
      *(_WORD *)(v9 + 3) = v15 + 1;
      if (v3 >= v11)
      {
        v17[0] = v6;
        v17[1] = v7;
        if (SABinaryWriter::write(v4, v17, 0x10uLL))
          ++*(_WORD *)(v9 + 5);
      }
    }
  }
  OUTLINED_FUNCTION_2_1();
}

uint64_t AlgsDevice::StreamingClient::configureStatus(AlgsDevice::StreamingClient *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[12];

  OUTLINED_FUNCTION_16((uint64_t)v12, *(_DWORD *)(*((_QWORD *)this + 4) + 48));
  AlgsDevice::getClientExtractor(*((_QWORD *)this + 4), (uint64_t)v12);
  StreamingWriter::writeConfigure((uint64_t)this + 40, *((_BYTE *)this + 96), (uint64_t)v12);
  v3 = v2;
  OUTLINED_FUNCTION_52(v2, v4, v5, v6, v7, v8, v9, v10, v12[0]);
  return v3;
}

#error "245BF1268: call analysis failed (funcsize=3)"

void AlgsDevice::StreamingClient::translate(AlgsDevice::StreamingClient *this, PacketCollection *a2, PacketCollection *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_22_0();
  v6 = *(_QWORD *)(v3 + 104);
  if (v6)
  {
    v7 = v3;
    if (*(_QWORD *)(v3 + 112))
    {
      v8 = v5;
      v9 = v4;
      v10 = 0;
      for (i = 0; i < *(unsigned int *)(v6 + 20); ++i)
      {
        v12 = *(_QWORD *)(v7 + 112);
        if (i >= *(unsigned int *)(v12 + 20))
          break;
        v13 = *(_QWORD *)(v6 + 8);
        v14 = *(_QWORD *)(v12 + 8);
        v15 = PacketCollection::getFor(v8, *(_QWORD *)(v13 + v10), *(_QWORD *)(v13 + v10 + 8), *(unsigned __int8 *)(v13 + v10 + 33));
        if (v15
          || (v15 = PacketCollection::getFor(v9, *(_QWORD *)(v13 + v10), *(_QWORD *)(v13 + v10 + 8), *(unsigned __int8 *)(v13 + v10 + 33))) != 0)
        {
          *(_OWORD *)v15 = *(_OWORD *)(v14 + v10);
          *(_BYTE *)(v15 + 33) = *(_BYTE *)(v14 + v10 + 33);
          if (*(_BYTE *)(v15 + 32) == 2)
          {
            *(_BYTE *)(v15 + 32) = 1;
            (*(void (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
          }
        }
        v6 = *(_QWORD *)(v7 + 104);
        v10 += 80;
      }
    }
  }
  OUTLINED_FUNCTION_6_1();
}

void AlgsDevice::StreamingClient::setBuffer(AlgsDevice::StreamingClient *this, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_38();
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)(v4 + 48) = v3;
  *(_QWORD *)(v4 + 56) = a3;
  *(_QWORD *)(v4 + 64) = 0;
  *(_BYTE *)(v4 + 72) = 0;
  *(_BYTE *)(v4 + 74) = 0;
  *(_QWORD *)(v4 + 80) = 0;
  OUTLINED_FUNCTION_2_2();
}

void AlgsDevice::StreamingClient::resetBuffer(AlgsDevice::StreamingClient *this)
{
  OUTLINED_FUNCTION_5_1(0);
  OUTLINED_FUNCTION_3_2();
}

void OUTLINED_FUNCTION_0_4()
{
  JUMPOUT(0x2495439A8);
}

void OUTLINED_FUNCTION_1_3()
{
  JUMPOUT(0x2495439A8);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return 1;
}

double OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  uint64_t v1;
  double result;

  SABinaryWriter::updateCacheSizes(a1, 0);
  *(_BYTE *)(v1 + 72) = 0;
  result = 0.0;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_BYTE *)(v1 + 74) = 0;
  *(_QWORD *)(v1 + 80) = 0;
  return result;
}

void OUTLINED_FUNCTION_7_0(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned __int8 *, char *), uint64_t (*a3)(uint64_t, unsigned __int8 *, char *), uint64_t (*a4)(_QWORD))
{
  SABinaryParser::parseInjExtData(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 24))(v0);
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void OUTLINED_FUNCTION_12_0(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  uint64_t *v4;

  AlgWorkNode::extractDataIfOnList(a1, a2, v4, v3, v2);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 24))(v0);
}

void OUTLINED_FUNCTION_15_0()
{
  JUMPOUT(0x2495439B4);
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1, const void *a2)
{
  SABinaryWriter *v2;

  return SABinaryWriter::write(v2, a2, 1uLL);
}

void OUTLINED_FUNCTION_17_0()
{
  uint64_t v0;

  ++*(_DWORD *)(v0 + 12);
}

void OUTLINED_FUNCTION_19_0()
{
  uint64_t v0;

  PacketCollection::~PacketCollection((PacketCollection *)(v0 - 184));
}

void OUTLINED_FUNCTION_20_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  PacketCollection::~PacketCollection((PacketCollection *)&a36);
}

void OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2)
{
  StreamingParser::addPacket(*(_QWORD *)(a1 + 16), a2, 2);
}

void OUTLINED_FUNCTION_24_0(uint64_t a1, uint64_t a2)
{
  StreamingParser::addPacket(*(_QWORD *)(a1 + 8), a2, 1);
}

_DWORD *OUTLINED_FUNCTION_26_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  *(_BYTE *)(*(_QWORD *)(v0 + 32) + 2 * *(unsigned __int8 *)(*(_QWORD *)(v0 + 56) - v2 + v1)) = v3;
  return PacketCollection::popIterableAt((_DWORD *)v0, v1 - v2);
}

void OUTLINED_FUNCTION_28_0(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  AlgWorkNode::runPrologue(this, a2, a3);
}

uint64_t OUTLINED_FUNCTION_29_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)a1 + 16))(a1, &a9);
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  uint64_t (*v0)(_QWORD *);
  _QWORD *v1;
  uint64_t v2;

  v1[5] = v2;
  v1[7] = v2 + v1[4];
  return v0(v1);
}

uint64_t OUTLINED_FUNCTION_31_0(uint64_t result, double a2)
{
  *(double *)(result + 16) = a2;
  *(_BYTE *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = 0;
  *(double *)(result + 40) = a2;
  *(_BYTE *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(double *)(result + 64) = a2;
  *(_BYTE *)(result + 72) = 0;
  *(_QWORD *)(result + 80) = 0;
  *(double *)(result + 88) = a2;
  *(_BYTE *)(result + 96) = 0;
  return result;
}

void OUTLINED_FUNCTION_33_0()
{
  AlgDataExtractor *v0;
  AlgDataInjector *v1;
  AlgWorkNode *v2;

  AlgWorkNode::runEpilogue(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_35(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20,char a21)
{
  char v21;
  SABinaryWriter *v22;
  char v23;
  char v24;

  if (v21)
    v24 = v23;
  else
    v24 = v23 + 1;
  a21 = v24;
  return SABinaryWriter::write(v22, &a18, 0x12uLL);
}

uint64_t OUTLINED_FUNCTION_36(uint64_t a1)
{
  uint64_t v1;

  return operator new(a1, *(unsigned __int8 *)(v1 + 16));
}

uint64_t OUTLINED_FUNCTION_38()
{
  return SABinaryWriter::updateCacheSizes(0, 0);
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v0 + 16))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_40(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
}

uint64_t OUTLINED_FUNCTION_45()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 48))(v0);
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_48(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  SABinaryWriter *v10;

  return SABinaryWriter::write(v10, &a10, 7uLL);
}

void OUTLINED_FUNCTION_51()
{
  uint64_t v0;

  AlgsDevice::StreamingClient::resetBuffer(*(AlgsDevice::StreamingClient **)(v0 + 64));
}

void OUTLINED_FUNCTION_52(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  PacketCollection::~PacketCollection((PacketCollection *)&a9);
}

uint64_t OUTLINED_FUNCTION_53(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

void OUTLINED_FUNCTION_54(uint64_t a1, char a2)
{
  uint64_t v2;

  AlgWorkNode::getDataNodeInfo(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_56(uint64_t result)
{
  *(_DWORD *)(result + 16) = 0;
  *(_DWORD *)(result + 24) = 0;
  *(_WORD *)(result + 20) = 0;
  return result;
}

void OUTLINED_FUNCTION_58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  SAList<char const*>::~SAList((uint64_t)va);
}

void OUTLINED_FUNCTION_59(uint64_t a1, ...)
{
  uint64_t v1;
  va_list va;

  va_start(va, a1);
  AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(v1, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_60(int a1, int a2, size_t a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  SABinaryWriter *v10;

  return SABinaryWriter::write(v10, &a10, a3);
}

void OUTLINED_FUNCTION_62(uint64_t a1, PacketCollection *a2)
{
  AlgsDevice::StreamingClient *v2;
  uint64_t v3;

  AlgsDevice::StreamingClient::translate(v2, a2, (PacketCollection *)(v3 - 184));
}

void OUTLINED_FUNCTION_64(StreamingParser *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  StreamingParser::numberOfPackets(a1, 0, 0, a4, a5, a6, a7, a8);
}

char *OUTLINED_FUNCTION_65(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return &a13;
}

uint64_t OUTLINED_FUNCTION_67()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_68@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1);
}

void OUTLINED_FUNCTION_69(AlgsDevice::StreamingClient *a1, int a2, uint64_t a3, void *a4)
{
  AlgsDevice::StreamingClient::setBuffer(a1, a4, a3);
}

uint64_t OUTLINED_FUNCTION_71()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_72@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1);
}

uint64_t OUTLINED_FUNCTION_73(uint64_t a1)
{
  return operator new(a1, 1);
}

void OUTLINED_FUNCTION_74(uint64_t a1, int a2)
{
  _QWORD *v2;

  AlgWorkNode::injectDataIfOnList(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_75()
{
  return operator new(96, 1);
}

uint64_t OUTLINED_FUNCTION_76(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
}

uint64_t IOHIDEventCreateForceStageEvent()
{
  return MEMORY[0x24BDD81C8]();
}

uint64_t IOHIDEventCreateTouchSensitiveButtonEventWithRadius()
{
  return MEMORY[0x24BDD8230]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x24BDD8328]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_2516DC7D8();
}

uint64_t operator delete()
{
  return off_2516DC7E0();
}

uint64_t operator new()
{
  return off_2516DC7E8();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}


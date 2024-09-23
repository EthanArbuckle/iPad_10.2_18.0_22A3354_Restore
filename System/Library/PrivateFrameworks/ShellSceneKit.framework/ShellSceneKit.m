const __CFString *SSKDisplayCloneMirroringModeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<.Invalid>");
  if (a1 == 1)
    v1 = CFSTR(".Default");
  if (a1 == 2)
    return CFSTR(".Disabled");
  else
    return v1;
}

void sub_245FED0CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _SSKActiveAssertion(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v1, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "wantsControlOfDisplay"))
        {
          v9 = objc_msgSend(v4, "level");
          if (v9 < objc_msgSend(v7, "level"))
          {
            v10 = v7;

            v4 = v10;
          }
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id _SSKDisplayControllerLoggingProem(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a1;
  v4 = a2;
  _NSFullMethodName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR(" "));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v3, "description");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("disconnected");
    }
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "substringToIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", v7 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@:%p> [%@] %@"), v10, v4, v8, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }

  return v5;
}

__CFString *SSKCADisplayDifferenceMaskDescription(uint64_t a1)
{
  void *v3;
  id v4;
  _QWORD *v5;
  uint8x8_t v6;
  int v7;
  unint64_t v8;
  __CFString *v9;
  id v10;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  const __CFString *v15;
  char v16;

  if (!a1)
    return CFSTR("<none>");
  if (a1 == -1)
    return CFSTR("<invalid>");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("["));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v12 = __SSKCADisplayDifferenceMaskDescription_block_invoke;
  v13 = &unk_25171C350;
  v4 = v3;
  v14 = v4;
  v15 = CFSTR("[");
  v5 = v11;
  v16 = 0;
  v6 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v6.i16[0] = vaddlv_u8(v6);
  v7 = v6.i32[0];
  if (v6.i32[0])
  {
    v8 = 0;
    do
    {
      if (((1 << v8) & a1) != 0)
      {
        ((void (*)(_QWORD *))v12)(v5);
        if (v16)
          break;
        --v7;
      }
      if (v8 > 0x3E)
        break;
      ++v8;
    }
    while (v7 > 0);
  }

  objc_msgSend(v4, "appendString:", CFSTR("]"));
  v9 = (__CFString *)v15;
  v10 = v4;

  return (__CFString *)v10;
}

uint64_t SSKCADifferenceMaskCalculate(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t result;
  void *v16;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = v8;
  if (!v10)
    goto LABEL_10;
  NSClassFromString(CFSTR("CADisplayMode"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    if (v9)
    {
      objc_msgSend(v7, "currentMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = BSEqualObjects() ^ 1;
      objc_msgSend(v7, "overscanAdjustment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!BSEqualStrings())
        v12 |= 2uLL;
      objc_msgSend(v7, "logicalScale");
      if ((BSFloatApproximatelyEqualToFloat() & 1) != 0)
      {
        if (!BSFloatApproximatelyEqualToFloat())
          v12 |= 4uLL;
      }
      else
      {
        v12 |= 4uLL;
      }
      if (objc_msgSend(v7, "pointScale") == a4)
        v14 = v12;
      else
        v14 = v12 | 8;

      goto LABEL_16;
    }
LABEL_10:
    v14 = -1;
LABEL_16:

    return v14;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:CADisplayModeClass]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    SSKCADifferenceMaskCalculate_cold_1((uint64_t)v16);
  objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

BOOL SSKCADisplayDifferenceMaskHasDifference(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xFFFFFFFFFFFFFFFELL;
}

void sub_245FF6414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SSKDisplaysShareRoot(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "rootIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

void sub_245FF7C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_245FF7DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SSKExtractFromBuilder(void *a1)
{
  void *v1;
  id v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(a1, "buildConfigurationWithError:", &v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v8;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "FBSDisplayConfiguration *SSKExtractFromBuilder(__strong id<SSKDisplayConfigurationBuilding>)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SSKRootDisplayDriver.m"), 31, CFSTR("error building display: %@"), v2);

    if (v1)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "FBSDisplayConfiguration *SSKExtractFromBuilder(__strong id<SSKDisplayConfigurationBuilding>)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:

  return v1;
}

id _SSKLoggingMethodProem(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a1;
  _NSFullMethodName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    v6 = objc_msgSend(v4, "rangeOfString:", CFSTR(" "));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "substringToIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "substringFromIndex:", v7 + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (%p) %@"), v9, v3, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
  }

  return v5;
}

id SSKLogDisplayMonitor()
{
  if (SSKLogDisplayMonitor_onceToken != -1)
    dispatch_once(&SSKLogDisplayMonitor_onceToken, &__block_literal_global_3);
  return (id)SSKLogDisplayMonitor___logObj;
}

id SSKLogDisplayAssertions()
{
  if (SSKLogDisplayAssertions_onceToken != -1)
    dispatch_once(&SSKLogDisplayAssertions_onceToken, &__block_literal_global_5);
  return (id)SSKLogDisplayAssertions___logObj;
}

id SSKLogDisplayControlling()
{
  if (SSKLogDisplayControlling_onceToken != -1)
    dispatch_once(&SSKLogDisplayControlling_onceToken, &__block_literal_global_7);
  return (id)SSKLogDisplayControlling___logObj;
}

id SSKLogDisplayTransforming()
{
  if (SSKLogDisplayTransforming_onceToken[0] != -1)
    dispatch_once(SSKLogDisplayTransforming_onceToken, &__block_literal_global_9);
  return (id)SSKLogDisplayTransforming___logObj;
}

id SSKLogRootDisplayDriver()
{
  if (SSKLogRootDisplayDriver_onceToken != -1)
    dispatch_once(&SSKLogRootDisplayDriver_onceToken, &__block_literal_global_11);
  return (id)SSKLogRootDisplayDriver___logObj;
}

uint64_t sub_245FF9798(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_245FF97A0(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_OWORD *);
  __int128 v4;
  _OWORD v6[3];

  v3 = *(uint64_t (**)(_OWORD *))(a3 + 16);
  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  v6[2] = a1[2];
  return v3(v6);
}

uint64_t sub_245FF97D4(_OWORD *a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(_OWORD *, _OWORD *);
  __int128 v5;
  __int128 v6;
  _OWORD v8[3];
  _OWORD v9[3];

  v4 = *(uint64_t (**)(_OWORD *, _OWORD *))(a4 + 24);
  v5 = a1[1];
  v9[0] = *a1;
  v9[1] = v5;
  v9[2] = a1[2];
  v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  v8[2] = a2[2];
  return v4(v9, v8);
}

uint64_t sub_245FF981C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_OWORD *);
  __int128 v4;
  _OWORD v6[3];

  v3 = *(uint64_t (**)(_OWORD *))(a3 + 32);
  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  v6[2] = a1[2];
  return v3(v6);
}

uint64_t sub_245FF9850(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

void type metadata accessor for DisplayPriority(uint64_t a1)
{
  sub_245FF9B68(a1, &qword_257537CB0);
}

BOOL sub_245FF986C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_245FF9880(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_245FF9888@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_245FF989C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_245FF98CC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_245FF98E0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_245FF98F4()
{
  return sub_246017E9C();
}

uint64_t sub_245FF98FC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x24954C690](a1, &v6);
  v4 = v6;
  v5 = v7;
  if (v7)
    v4 = 0;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_245FF994C(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = sub_246017EB4();
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_245FF99A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_246017EC0();
  *a1 = result;
  return result;
}

_QWORD *sub_245FF99C4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_245FF99D4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_245FF99E0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_245FF99EC()
{
  sub_245FF9AB8(&qword_257537D30, (uint64_t)&unk_246019D84);
  sub_245FF9AB8(&qword_257537D38, (uint64_t)"A*p\v,q");
  return sub_2460180B8();
}

uint64_t sub_245FF9A70()
{
  return sub_245FF9AB8(&qword_257537CB8, (uint64_t)"]*p\vhq");
}

uint64_t sub_245FF9A94()
{
  return sub_245FF9AB8(&qword_257537CC0, (uint64_t)&unk_246019CE8);
}

uint64_t sub_245FF9AB8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for DisplayPriority(255);
    result = MEMORY[0x24954D0EC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_245FF9AF8()
{
  return sub_245FF9AB8((unint64_t *)&qword_257537CC8, (uint64_t)&unk_246019E14);
}

uint64_t sub_245FF9B1C()
{
  return sub_246017ECC();
}

uint64_t sub_245FF9B24()
{
  return sub_246018178();
}

uint64_t sub_245FF9B4C()
{
  return sub_246018160();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_245FF9B68(a1, (unint64_t *)&unk_25441BE70);
}

void sub_245FF9B68(uint64_t a1, unint64_t *a2)
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

uint64_t sub_245FF9BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = sub_246017E00();
  v3[6] = sub_246017DF4();
  v3[7] = sub_246017DC4();
  v3[8] = v4;
  return swift_task_switch();
}

uint64_t sub_245FF9C4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;

  v1 = *(_QWORD *)(v0 + 32);
  v5 = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 72) = sub_246017DF4();
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v5;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_245FF9D0C;
  return sub_24601810C();
}

uint64_t sub_245FF9D0C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_245FF9D80()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245FF9DB4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245FF9DFC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t result;
  uint64_t v18;
  id v19;
  uint64_t aBlock;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v19 = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257537DA8);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = a4;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_245FFA070;
  *(_QWORD *)(v11 + 24) = v10;
  v24 = sub_245FFA070;
  v25 = v11;
  v12 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v21 = 1107296256;
  v22 = sub_245FFA0A0;
  v23 = &block_descriptor;
  v13 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v14 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v14, (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v24 = sub_245FFA218;
  v25 = v15;
  aBlock = v12;
  v21 = 1107296256;
  v22 = sub_245FFA268;
  v23 = &block_descriptor_11;
  v16 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v19, sel_performUpdate_withCompletion_, v13, v16);
  _Block_release(v16);
  _Block_release(v13);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v12 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_245FFA014(uint64_t a1)
{
  uint64_t v1;

  return sub_245FF9DFC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954D0D4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245FFA060()
{
  return swift_deallocObject();
}

uint64_t sub_245FFA070()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_245FFA090()
{
  return swift_deallocObject();
}

void sub_245FFA0A0(uint64_t a1, void *a2, void *a3)
{
  void (*v4)(id, id);
  id v5;
  id v6;

  v4 = *(void (**)(id, id))(a1 + 32);
  v6 = a2;
  v5 = a3;
  v4(v6, v5);

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

uint64_t sub_245FFA10C(char a1, id a2)
{
  id v2;
  _QWORD *v4;

  if (a2)
  {
    v2 = a2;
  }
  else
  {
    if ((a1 & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257537DA8);
      return sub_246017DDC();
    }
    sub_245FFA2C8();
    swift_allocError();
    *v4 = 0xD000000000000020;
    v4[1] = 0x800000024601CDF0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257537DA8);
  return sub_246017DD0();
}

uint64_t sub_245FFA1B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257537DA8);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_245FFA218(char a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257537DA8);
  return sub_245FFA10C(a1, a2);
}

void sub_245FFA268(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

unint64_t sub_245FFA2C8()
{
  unint64_t result;

  result = qword_257537DB0[0];
  if (!qword_257537DB0[0])
  {
    result = MEMORY[0x24954D0EC](&unk_246019E84, &_s16SceneUpdateErrorON);
    atomic_store(result, qword_257537DB0);
  }
  return result;
}

_QWORD *_s16SceneUpdateErrorOwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s16SceneUpdateErrorOwxx()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s16SceneUpdateErrorOwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *_s16SceneUpdateErrorOwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16SceneUpdateErrorOwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s16SceneUpdateErrorOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_245FFA440()
{
  return 0;
}

ValueMetadata *_s16SceneUpdateErrorOMa()
{
  return &_s16SceneUpdateErrorON;
}

uint64_t sub_245FFA468()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_245FFA470(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_245FFA49C()
{
  return swift_release();
}

_QWORD *sub_245FFA4A4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_245FFA4DC(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_245FFA50C(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_245FFA554(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for HostingGroupControllerProvider()
{
  JUMPOUT(0x24954D080);
}

void sub_245FFA59C()
{
  JUMPOUT(0x24954D0ECLL);
}

uint64_t sub_245FFA5B0()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_245FFA5BC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_245FFA5C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DisplayActivationState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DisplayActivationState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_245FFA6B8 + 4 * byte_246019FB5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_245FFA6EC + 4 * asc_246019FB0[v4]))();
}

uint64_t sub_245FFA6EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245FFA6F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245FFA6FCLL);
  return result;
}

uint64_t sub_245FFA708(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245FFA710);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_245FFA714(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245FFA71C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245FFA728(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245FFA730(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DisplayActivationState()
{
  return &type metadata for DisplayActivationState;
}

unint64_t sub_245FFA74C()
{
  unint64_t result;

  result = qword_257537E80[0];
  if (!qword_257537E80[0])
  {
    atomic_store(result, qword_257537E80);
  }
  return result;
}

BOOL sub_245FFA790(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_245FFA7A4()
{
  sub_24601816C();
  sub_246018178();
  return sub_246018190();
}

uint64_t sub_245FFA7E8()
{
  return sub_246018178();
}

uint64_t sub_245FFA810()
{
  sub_24601816C();
  sub_246018178();
  return sub_246018190();
}

uint64_t sub_245FFA850(char a1)
{
  return *(_QWORD *)&aActive_1[8 * a1];
}

uint64_t sub_245FFA870()
{
  char *v0;

  return sub_245FFA850(*v0);
}

uint64_t sub_245FFA878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_245FFA8F0;
  return v9(a1, a2, a3);
}

uint64_t sub_245FFA8F0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245FFA93C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_245FFA9A4()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_245FFA9D8()
{
  sub_245FFA9A4();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UISceneBinderPresenter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UISceneBinderPresenter);
}

uint64_t sub_245FFAA04()
{
  return swift_allocateGenericValueMetadata();
}

void **sub_245FFAA0C(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for DefaultDisplayTransformerRegistry.RegistryError(id *a1)
{

}

void **sub_245FFAA40(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  v4 = *a1;
  *a1 = *a2;
  v5 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **sub_245FFAA80(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_245FFAAB0(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t sub_245FFAB00(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_245FFAB54(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_245FFAB6C(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

uint64_t type metadata accessor for UISceneBinderPresenter.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UISceneBinderPresenter.State);
}

void sub_245FFAB98(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = *(void **)(v1 + 32);
  swift_beginAccess();
  if (v3)
  {
    v4 = v3;
    v5 = a1;
    sub_245FFB610(&v6, v5, &qword_257537FE0, 0x24BE380F0, (uint64_t *)&unk_257539020);
    swift_endAccess();

    objc_msgSend(v4, sel_addScene_, v5);
  }
  else
  {
    sub_245FFB610(&v6, a1, &qword_257537FE0, 0x24BE380F0, (uint64_t *)&unk_257539020);
    swift_endAccess();

  }
}

void sub_245FFAC94(void **a1)
{
  sub_245FFAB98(*a1);
}

void sub_245FFACB8(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void *v4;
  id v5;
  char v6;
  void *v7;
  uint64_t (*v8)(void *);
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  int64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  _QWORD *v29;
  id v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v2 = v1;
  v4 = (void *)v1[5];
  sub_245FFC180(0, (unint64_t *)&unk_25441BE90);
  v5 = v4;
  v6 = sub_246017F44();

  if ((v6 & 1) == 0)
  {
    v7 = (void *)v2[4];
    if (!v7)
    {
      v30 = (id)v2[5];
      v2[5] = a1;
      v15 = a1;

      return;
    }
    v8 = (uint64_t (*)(void *))v2[2];
    v9 = v7;
    v10 = (void *)v8(a1);
    swift_beginAccess();
    v11 = v2[6];
    v28 = v2;
    if ((v11 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_246017F98();
      sub_245FFC180(0, &qword_257537FE0);
      sub_245FFC120();
      sub_246017E84();
      v11 = v32;
      v29 = v33;
      v12 = v34;
      v13 = v35;
      v14 = v36;
    }
    else
    {
      v16 = -1 << *(_BYTE *)(v11 + 32);
      v29 = (_QWORD *)(v11 + 56);
      v12 = ~v16;
      v17 = -v16;
      if (v17 < 64)
        v18 = ~(-1 << v17);
      else
        v18 = -1;
      v14 = v18 & *(_QWORD *)(v11 + 56);
      swift_bridgeObjectRetain();
      v13 = 0;
    }
    v19 = (unint64_t)(v12 + 64) >> 6;
    if (v11 < 0)
      goto LABEL_13;
    while (1)
    {
      if (v14)
      {
        v20 = (v14 - 1) & v14;
        v21 = __clz(__rbit64(v14)) | (v13 << 6);
        v22 = v13;
      }
      else
      {
        v24 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
          __break(1u);
          return;
        }
        if (v24 >= v19)
          goto LABEL_33;
        v25 = v29[v24];
        v22 = v13 + 1;
        if (!v25)
        {
          v22 = v13 + 2;
          if (v13 + 2 >= v19)
            goto LABEL_33;
          v25 = v29[v22];
          if (!v25)
          {
            v22 = v13 + 3;
            if (v13 + 3 >= v19)
              goto LABEL_33;
            v25 = v29[v22];
            if (!v25)
            {
              v22 = v13 + 4;
              if (v13 + 4 >= v19)
                goto LABEL_33;
              v25 = v29[v22];
              if (!v25)
              {
                v26 = v13 + 5;
                while (v19 != v26)
                {
                  v25 = v29[v26++];
                  if (v25)
                  {
                    v22 = v26 - 1;
                    goto LABEL_29;
                  }
                }
LABEL_33:
                sub_245FFC178();
                objc_msgSend(v9, sel_invalidate);

                v27 = (void *)v28[4];
                v28[4] = v10;

                return;
              }
            }
          }
        }
LABEL_29:
        v20 = (v25 - 1) & v25;
        v21 = __clz(__rbit64(v25)) + (v22 << 6);
      }
      v23 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v21);
      if (!v23)
        goto LABEL_33;
      while (1)
      {
        objc_msgSend(v10, sel_addScene_, v23);

        v13 = v22;
        v14 = v20;
        if ((v11 & 0x8000000000000000) == 0)
          break;
LABEL_13:
        if (sub_246017FBC())
        {
          sub_245FFC180(0, &qword_257537FE0);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v23 = v31;
          swift_unknownObjectRelease();
          v22 = v13;
          v20 = v14;
          if (v31)
            continue;
        }
        goto LABEL_33;
      }
    }
  }
}

uint64_t sub_245FFB028(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  sub_246017E00();
  v2[4] = sub_246017DF4();
  sub_246017DC4();
  return swift_task_switch();
}

uint64_t sub_245FFB094()
{
  uint64_t v0;
  void **v1;

  v1 = *(void ***)(v0 + 16);
  swift_release();
  sub_245FFACB8(*v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_245FFB0D8(char a1, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t (*v5)(void);
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  if (a2)
  {
    if (a2 == 1)
    {
      if (!a1)
      {
        v3 = *(void **)(v2 + 32);
        if (v3)
        {
          objc_msgSend(v3, sel_invalidate);
          v4 = *(void **)(v2 + 32);
          *(_QWORD *)(v2 + 32) = 0;

        }
      }
    }
    else
    {
      v12 = *(void **)(v2 + 32);
      if (v12)
        objc_msgSend(v12, sel_invalidate);
    }
  }
  else if (a1 == 1)
  {
    v5 = *(uint64_t (**)(void))(v2 + 16);
    v6 = *(id *)(v2 + 40);
    v7 = (void *)v5();

    swift_beginAccess();
    v8 = *(_QWORD *)(v2 + 48);
    if ((v8 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_246017F98();
      sub_245FFC180(0, &qword_257537FE0);
      sub_245FFC120();
      sub_246017E84();
      v8 = v28;
      v26 = v29;
      v9 = v30;
      v10 = v31;
      v11 = v32;
    }
    else
    {
      v13 = -1 << *(_BYTE *)(v8 + 32);
      v26 = v8 + 56;
      v9 = ~v13;
      v14 = -v13;
      if (v14 < 64)
        v15 = ~(-1 << v14);
      else
        v15 = -1;
      v11 = v15 & *(_QWORD *)(v8 + 56);
      swift_bridgeObjectRetain();
      v10 = 0;
    }
    v24 = v9;
    v25 = (unint64_t)(v9 + 64) >> 6;
    if (v8 < 0)
      goto LABEL_18;
    while (1)
    {
      if (v11)
      {
        v16 = (v11 - 1) & v11;
        v17 = __clz(__rbit64(v11)) | (v10 << 6);
        v18 = v10;
      }
      else
      {
        v20 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
          __break(1u);
          return;
        }
        if (v20 >= v25)
          goto LABEL_38;
        v21 = *(_QWORD *)(v26 + 8 * v20);
        v18 = v10 + 1;
        if (!v21)
        {
          v18 = v10 + 2;
          if (v10 + 2 >= v25)
            goto LABEL_38;
          v21 = *(_QWORD *)(v26 + 8 * v18);
          if (!v21)
          {
            v18 = v10 + 3;
            if (v10 + 3 >= v25)
              goto LABEL_38;
            v21 = *(_QWORD *)(v26 + 8 * v18);
            if (!v21)
            {
              v18 = v10 + 4;
              if (v10 + 4 >= v25)
                goto LABEL_38;
              v21 = *(_QWORD *)(v26 + 8 * v18);
              if (!v21)
              {
                v22 = v10 + 5;
                while (v25 != v22)
                {
                  v21 = *(_QWORD *)(v26 + 8 * v22++);
                  if (v21)
                  {
                    v18 = v22 - 1;
                    goto LABEL_34;
                  }
                }
LABEL_38:
                sub_245FFC178();
                v23 = *(void **)(v2 + 32);
                *(_QWORD *)(v2 + 32) = v7;

                return;
              }
            }
          }
        }
LABEL_34:
        v16 = (v21 - 1) & v21;
        v17 = __clz(__rbit64(v21)) + (v18 << 6);
      }
      v19 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v17);
      if (!v19)
        goto LABEL_38;
      while (1)
      {
        objc_msgSend(v7, sel_addScene_, v19, v24);

        v10 = v18;
        v11 = v16;
        if ((v8 & 0x8000000000000000) == 0)
          break;
LABEL_18:
        if (sub_246017FBC())
        {
          sub_245FFC180(0, &qword_257537FE0);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v19 = v27;
          swift_unknownObjectRelease();
          v18 = v10;
          v16 = v11;
          if (v27)
            continue;
        }
        goto LABEL_38;
      }
    }
  }
}

void sub_245FFB454(char a1, char a2)
{
  sub_245FFB0D8(a1, a2);
}

id sub_245FFB474(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD8C0]), sel_initWithDisplayConfiguration_, a1);
  sub_246018010();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(a1, sel_identity, 0xD000000000000018, 0x800000024601CE50);
  v4 = objc_msgSend(v3, sel_description);
  sub_246017D04();

  sub_246017D28();
  swift_bridgeObjectRelease();
  v5 = objc_allocWithZone(MEMORY[0x24BEBD8C8]);
  v6 = (void *)sub_246017CF8();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithIdentifier_priority_appearanceStyle_rootWindow_, v6, 0, 0, v2);

  return v7;
}

uint64_t sub_245FFB5BC(_QWORD *a1, void *a2)
{
  return sub_245FFB610(a1, a2, &qword_257537FE0, 0x24BE380F0, (uint64_t *)&unk_257539020);
}

uint64_t sub_245FFB5D8(_QWORD *a1, void *a2)
{
  return sub_245FFB610(a1, a2, (unint64_t *)&unk_25441BE90, 0x24BE38400, &qword_25441BEA8);
}

uint64_t sub_245FFB5F4(_QWORD *a1, void *a2)
{
  return sub_245FFB610(a1, a2, (unint64_t *)&unk_2575384B0, 0x24BE38418, &qword_257537FF0);
}

uint64_t sub_245FFB610(_QWORD *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v8;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v8 = v5;
  v11 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v11 < 0)
      v12 = *v5;
    else
      v12 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v13 = a2;
    v14 = sub_246017FB0();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_245FFC180(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v36;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_246017FA4();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v26 = sub_245FFB8D8(v12, result + 1, a5, a3);
    v37 = v26;
    v27 = *(_QWORD *)(v26 + 16);
    if (*(_QWORD *)(v26 + 24) <= v27)
    {
      v32 = v27 + 1;
      v33 = v13;
      sub_245FFBAD8(v32, a5);
      v28 = v37;
    }
    else
    {
      v28 = v26;
      v29 = v13;
    }
    sub_245FFBD70((uint64_t)v13, v28);
    *v8 = v28;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    v16 = sub_246017F38();
    v17 = -1 << *(_BYTE *)(v11 + 32);
    v18 = v16 & ~v17;
    if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
    {
      sub_245FFC180(0, a3);
      v19 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
      v20 = sub_246017F44();

      if ((v20 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v24 = *(void **)(*(_QWORD *)(*v5 + 48) + 8 * v18);
        *a1 = v24;
        v25 = v24;
        return 0;
      }
      v21 = ~v17;
      while (1)
      {
        v18 = (v18 + 1) & v21;
        if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          break;
        v22 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
        v23 = sub_246017F44();

        if ((v23 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v38 = *v5;
    *v5 = 0x8000000000000000;
    v31 = a2;
    sub_245FFBDF0((uint64_t)v31, v18, isUniquelyReferenced_nonNull_native, a5, a3);
    *v5 = v38;
    swift_bridgeObjectRelease();
    *a1 = v31;
  }
  return 1;
}

uint64_t sub_245FFB8D8(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v6 = sub_246017FF8();
    v19 = v6;
    sub_246017F98();
    if (sub_246017FBC())
    {
      sub_245FFC180(0, a4);
      do
      {
        swift_dynamicCast();
        v6 = v19;
        v13 = *(_QWORD *)(v19 + 16);
        if (*(_QWORD *)(v19 + 24) <= v13)
        {
          sub_245FFBAD8(v13 + 1, a3);
          v6 = v19;
        }
        result = sub_246017F38();
        v8 = v6 + 56;
        v9 = -1 << *(_BYTE *)(v6 + 32);
        v10 = result & ~v9;
        v11 = v10 >> 6;
        if (((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          v12 = __clz(__rbit64((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v11 == v15;
            if (v11 == v15)
              v11 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(_QWORD *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12) = v18;
        ++*(_QWORD *)(v6 + 16);
      }
      while (sub_246017FBC());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v6;
}

uint64_t sub_245FFBAD8(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_246017FEC();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_246017F38();
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

unint64_t sub_245FFBD70(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_246017F38();
  result = sub_246017F8C();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_245FFBDF0(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v9 = *(_QWORD *)(*v5 + 16);
  v10 = *(_QWORD *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0)
    goto LABEL_14;
  v11 = v9 + 1;
  if ((a3 & 1) != 0)
  {
    sub_245FFBAD8(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_245FFBF80(a4);
      goto LABEL_14;
    }
    sub_245FFC1B8(v11, a4);
  }
  v12 = *v5;
  v13 = sub_246017F38();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_245FFC180(0, a5);
    v15 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
    v16 = sub_246017F44();

    if ((v16 & 1) != 0)
    {
LABEL_13:
      sub_246018118();
      __break(1u);
    }
    else
    {
      v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
        v19 = sub_246017F44();

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8 * a2) = a1;
  v21 = *(_QWORD *)(v20 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v23;
}

id sub_245FFBF80(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
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
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_246017FE0();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
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
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_245FFC120()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257537FE8;
  if (!qword_257537FE8)
  {
    v1 = sub_245FFC180(255, &qword_257537FE0);
    result = MEMORY[0x24954D0EC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_257537FE8);
  }
  return result;
}

uint64_t sub_245FFC178()
{
  return swift_release();
}

uint64_t sub_245FFC180(uint64_t a1, unint64_t *a2)
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

uint64_t sub_245FFC1B8(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_246017FEC();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v4 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_246017F38();
    v22 = -1 << *(_BYTE *)(v6 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24954D080](a1, v6, a5);
}

unint64_t sub_245FFC460()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257537FF8;
  if (!qword_257537FF8)
  {
    v1 = sub_245FFC180(255, qword_257538000);
    result = MEMORY[0x24954D0EC](MEMORY[0x24BEE5BE0], v1);
    atomic_store(result, (unint64_t *)&qword_257537FF8);
  }
  return result;
}

id sub_245FFC4B8()
{
  void *v0;
  id v1;
  id v2;
  id v3;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5680]), sel_init);
  objc_msgSend(v1, sel_setConnectionSeed_, objc_msgSend(v0, sel_connectionSeed));
  v2 = objc_msgSend(v0, sel_currentMode);
  objc_msgSend(v1, sel_setCurrentMode_, v2);

  objc_msgSend(v0, sel_logicalScale);
  objc_msgSend(v1, sel_setLogicalScale_);
  v3 = objc_msgSend(v0, sel_overscanAdjustment);
  objc_msgSend(v1, sel_setOverscanAdjustment_, v3);

  objc_msgSend(v1, sel_setPointScale_, objc_msgSend(v0, sel_pointScale));
  return v1;
}

id sub_245FFC5C8(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id result;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  id v23;
  id v24;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5680]), sel_init);
  v5 = objc_msgSend(v1, sel_immutableCopy);
  v6 = sub_245FFC4B8();
  sub_245FFC180(0, &qword_257538040);
  v7 = sub_245FFC8B0(a1);
  v8 = objc_msgSend(v5, sel_preferredModeWithCriteria_, v7);

  objc_msgSend(v4, sel_setCurrentMode_, v8);
  if (objc_msgSend(v2, sel_displayType) == (id)2 || (objc_msgSend(a1, sel_logicalScale), v10 == 0.0) && v9 == 0.0)
  {
    objc_msgSend(v6, sel_logicalScale);
  }
  else
  {
    objc_msgSend(a1, sel_logicalScale);
    objc_msgSend(v5, sel_minimumLogicalScale);
    v12 = v11;
    objc_msgSend(v5, sel_maximumLogicalScale);
    if (v13 >= v12)
      v14 = v12;
    else
      v14 = v13;
    objc_msgSend(v5, sel_minimumLogicalScale);
    v16 = v15;
    result = objc_msgSend(v5, sel_maximumLogicalScale);
    if (v16 > v18)
      v19 = v16;
    else
      v19 = v18;
    if (v14 > v19)
      goto LABEL_25;
  }
  objc_msgSend(v4, sel_setLogicalScale_);
  objc_msgSend(a1, sel_pointScale);
  if (v20 != 0.0)
  {
    result = objc_msgSend(a1, sel_pointScale);
    if ((~*(_QWORD *)&v22 & 0x7FF0000000000000) != 0)
    {
      if (v22 > -9.22337204e18)
      {
        if (v22 < 9.22337204e18)
        {
          v21 = (id)(uint64_t)v22;
          goto LABEL_18;
        }
        goto LABEL_24;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
  v21 = objc_msgSend(v6, sel_pointScale);
LABEL_18:
  objc_msgSend(v4, sel_setPointScale_, v21);
  if (objc_msgSend(a1, sel_overscanCompensation) == (id)-1)
  {
    v23 = objc_msgSend(v6, sel_overscanAdjustment);
  }
  else
  {
    objc_msgSend(a1, sel_overscanCompensation);
    v23 = (id)FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  }
  v24 = v23;
  objc_msgSend(v4, sel_setOverscanAdjustment_, v24);

  objc_msgSend(v4, sel_setConnectionSeed_, objc_msgSend(v2, sel_connectionSeed));
  return v4;
}

id sub_245FFC8B0(void *a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(a1, sel_nativePixelSize);
  objc_msgSend(v2, sel_setResolution_);
  objc_msgSend(a1, sel_refreshRate);
  objc_msgSend(v2, sel_setRefreshRate_);
  objc_msgSend(a1, sel_hdrMode);
  v3 = (id)FBSDisplayHDRModeToCADisplayHDRMode();
  objc_msgSend(v2, sel_setHdrMode_, v3);

  return v2;
}

uint64_t sub_245FFC96C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = sub_246017E00();
  v2[5] = sub_246017DF4();
  v2[6] = sub_246017DC4();
  v2[7] = v3;
  return swift_task_switch();
}

uint64_t sub_245FFC9DC()
{
  uint64_t v0;
  id v1;
  id v2;
  char v3;
  uint64_t v5;

  v1 = sub_245FFC5C8(*(void **)(v0 + 16));
  *(_QWORD *)(v0 + 64) = v1;
  v2 = sub_245FFC4B8();
  sub_245FFC180(0, &qword_257538038);
  v3 = sub_246017F44();

  if ((v3 & 1) != 0)
  {

    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 72) = sub_246017DF4();
    *(_QWORD *)(v0 + 80) = sub_246017DC4();
    *(_QWORD *)(v0 + 88) = v5;
    return swift_task_switch();
  }
}

uint64_t sub_245FFCAB8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(void **)(v0 + 64);
  v2 = *(void **)(v0 + 24);
  type metadata accessor for CADisplayActor();
  v3 = v2;
  v4 = v1;
  swift_initStaticObject();
  sub_245FFCC54();
  sub_246017DC4();
  return swift_task_switch();
}

uint64_t sub_245FFCB3C()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 24), sel_setDisplayProperties_, *(_QWORD *)(v0 + 64));
  return swift_task_switch();
}

uint64_t sub_245FFCB80()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);

  swift_release();
  return swift_task_switch();
}

uint64_t sub_245FFCBC8()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245FFCC04(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245FFA8F0;
  return sub_245FFC96C(v2);
}

unint64_t sub_245FFCC54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257538F30;
  if (!qword_257538F30)
  {
    v1 = type metadata accessor for CADisplayActor();
    result = MEMORY[0x24954D0EC](&unk_24601A8A0, v1);
    atomic_store(result, (unint64_t *)&qword_257538F30);
  }
  return result;
}

uint64_t sub_245FFCC9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  _QWORD v5[2];

  v0 = sub_246017F08();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246017F14();
  MEMORY[0x24BDAC7A8]();
  sub_246017CE0();
  MEMORY[0x24BDAC7A8]();
  sub_245FFCF94();
  sub_246017CD4();
  v5[1] = MEMORY[0x24BEE4AF8];
  sub_245FFCFD0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257538088);
  sub_245FFD018();
  sub_246017F80();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5758], v0);
  result = sub_246017F20();
  qword_257538048 = result;
  return result;
}

id static CADisplayQueue.queue.getter()
{
  if (qword_257537BD0 != -1)
    swift_once();
  return (id)qword_257538048;
}

id CADisplayQueue.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CADisplayQueue.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CADisplayQueue.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CADisplayQueue()
{
  return objc_opt_self();
}

unint64_t sub_245FFCF94()
{
  unint64_t result;

  result = qword_257538078;
  if (!qword_257538078)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257538078);
  }
  return result;
}

unint64_t sub_245FFCFD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257538080;
  if (!qword_257538080)
  {
    v1 = sub_246017F14();
    result = MEMORY[0x24954D0EC](MEMORY[0x24BEE5940], v1);
    atomic_store(result, (unint64_t *)&qword_257538080);
  }
  return result;
}

unint64_t sub_245FFD018()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257538090[0];
  if (!qword_257538090[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257538088);
    result = MEMORY[0x24954D0EC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, qword_257538090);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954D0E0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245FFD0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 24) + *(_QWORD *)(a3 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_246000888;
  return v9(a1, a2, a3);
}

uint64_t sub_245FFD120()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    v2 = swift_checkMetadataState();
    if (v3 > 0x3F)
    {
      return v2;
    }
    else
    {
      v4 = swift_checkMetadataState();
      if (v5 > 0x3F)
      {
        return v4;
      }
      else
      {
        v6 = swift_checkMetadataState();
        if (v7 <= 0x3F)
          type metadata accessor for DisplayUpdater.UpdateContext();
        return v6;
      }
    }
  }
  return v0;
}

uint64_t sub_245FFD298()
{
  uint64_t v0;

  v0 = sub_246017CC8();
  __swift_allocate_value_buffer(v0, qword_25753AA68);
  __swift_project_value_buffer(v0, (uint64_t)qword_25753AA68);
  return sub_246017CBC();
}

uint64_t sub_245FFD318(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2)
  {
    swift_getAssociatedTypeWitness();
    type metadata accessor for DisplayUpdater.UpdateContext();
  }
  return 0;
}

uint64_t sub_245FFD434(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_245FFD318(a1, a2) & 1;
}

uint64_t sub_245FFD474()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246017E00();
  sub_246017DF4();
  v4 = sub_246017E18();
  v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  swift_retain();
  v5(v3, 1, 1, v4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = &unk_2575381B8;
  *(_QWORD *)(v6 + 24) = v0;
  swift_retain();
  sub_246017E54();
  swift_release();
  sub_2460007E4((uint64_t)v3);
  swift_release();
  return swift_release();
}

void sub_245FFD588()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_246000888;
  sub_245FFD5D0();
}

void sub_245FFD5D0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1[29] = v0;
  v2 = *(_QWORD **)v0;
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v1[30] = v3;
  v4 = v2[11];
  v1[31] = v4;
  v5 = v2[12];
  v1[32] = v5;
  v6 = v2[13];
  v1[33] = v6;
  v7 = v2[14];
  v1[34] = v7;
  v8 = v2[15];
  v1[35] = v8;
  v9 = v2[16];
  v1[36] = v9;
  v10 = v2[17];
  v1[37] = v10;
  v11 = v2[18];
  v1[38] = v11;
  v1[2] = v3;
  v1[3] = v4;
  v1[4] = v5;
  v1[5] = v6;
  v1[6] = v7;
  v1[7] = v8;
  v1[8] = v9;
  v1[9] = v10;
  v1[10] = v11;
  type metadata accessor for DisplayUpdater.UpdateContext();
}

uint64_t sub_245FFD65C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t TupleTypeMetadata2;
  uint64_t v8;
  uint64_t v9;

  v1[39] = a1;
  v3 = sub_246017F5C();
  v1[40] = v3;
  v1[41] = *(_QWORD *)(v3 - 8);
  v1[42] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1[43] = AssociatedTypeWitness;
  v1[44] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v1[45] = swift_task_alloc();
  v5 = swift_getAssociatedTypeWitness();
  v1[46] = v5;
  v6 = sub_246017F5C();
  v1[47] = v6;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v1[48] = TupleTypeMetadata2;
  v1[49] = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v1[50] = swift_task_alloc();
  v1[51] = *(_QWORD *)(v6 - 8);
  v1[52] = swift_task_alloc();
  v1[53] = swift_task_alloc();
  v1[54] = swift_task_alloc();
  v1[55] = *(_QWORD *)(v5 - 8);
  v1[56] = swift_task_alloc();
  v8 = sub_246017CC8();
  v1[57] = v8;
  v1[58] = *(_QWORD *)(v8 - 8);
  v1[59] = swift_task_alloc();
  v1[60] = *(_QWORD *)(a1 - 8);
  v1[61] = swift_task_alloc();
  v1[62] = swift_task_alloc();
  v1[63] = swift_task_alloc();
  v1[64] = swift_task_alloc();
  v1[65] = swift_task_alloc();
  v1[66] = swift_task_alloc();
  v1[67] = sub_246017E00();
  v1[68] = sub_246017DF4();
  v1[69] = sub_246017DC4();
  v1[70] = v9;
  return swift_task_switch();
}

uint64_t sub_245FFD880()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  v1 = v0[66];
  v2 = v0[60];
  v3 = v0[39];
  v4 = v0[29];
  v5 = *(_QWORD *)(*(_QWORD *)v4 + 192);
  v0[71] = v5;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[72] = v6;
  v6(v1, v4 + v5, v3);
  v0[73] = sub_246017DF4();
  v0[74] = sub_246017DF4();
  v0[75] = sub_246017DC4();
  v0[76] = v7;
  return swift_task_switch();
}

uint64_t sub_245FFD918()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 616) = sub_246017DF4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 624) = v1;
  *v1 = v0;
  v1[1] = sub_245FFD9B4;
  return sub_2460180F4();
}

uint64_t sub_245FFD9B4()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_245FFDA10()
{
  uint64_t v0;

  swift_release();
  swift_release();
  *(_BYTE *)(v0 + 729) = *(_BYTE *)(v0 + 728);
  return swift_task_switch();
}

uint64_t sub_245FFDA60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t (*v6)(unsigned __int8 *, uint64_t, uint64_t);
  int v7;
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t, uint64_t);
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  uint64_t v66;
  char *v67;
  os_log_type_t type[8];
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v72)(_QWORD, _QWORD, _QWORD);
  uint64_t v73;

  if (*(_BYTE *)(v0 + 729) != 1)
  {
    swift_release();
    if (qword_257537BD8 != -1)
      swift_once();
    __swift_project_value_buffer(*(_QWORD *)(v0 + 456), (uint64_t)qword_25753AA68);
    swift_retain_n();
    v11 = sub_246017CB0();
    v12 = sub_246017EE4();
    v13 = os_log_type_enabled(v11, v12);
    v14 = *(_QWORD *)(v0 + 528);
    v15 = *(_QWORD *)(v0 + 480);
    v16 = *(_QWORD *)(v0 + 312);
    v17 = *(_QWORD *)(v0 + 232);
    if (v13)
    {
      v69 = *(_QWORD *)(v0 + 480);
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v73 = v19;
      *(_DWORD *)v18 = 136446210;
      *(_QWORD *)type = v16;
      v20 = *(_QWORD *)(v17 + 16);
      v21 = *(_QWORD *)(v17 + 24);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 136) = sub_246013004(v20, v21, &v73);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_245FEA000, v11, v12, "%{public}s somebody requested an update after us. short-circuiting.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954D194](v19, -1, -1);
      MEMORY[0x24954D194](v18, -1, -1);

      (*(void (**)(uint64_t, os_log_type_t *))(v69 + 8))(v14, *(os_log_type_t **)type);
    }
    else
    {

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    goto LABEL_20;
  }
  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 480);
  v3 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 200);
  *(_QWORD *)(v0 + 632) = v4;
  v5 = (unsigned __int8 *)(v1 + v4);
  swift_beginAccess();
  v6 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v2 + 48);
  *(_QWORD *)(v0 + 640) = v6;
  v7 = v6(v5, 1, v3);
  v8 = *(unsigned __int8 **)(v0 + 528);
  if (v7)
  {
    v9 = *v8;
    if ((_DWORD)v9 == 1)
    {
LABEL_19:
      (*(void (**)(unsigned __int8 *, _QWORD))(*(_QWORD *)(v0 + 480) + 8))(v8, *(_QWORD *)(v0 + 312));
      swift_release();
LABEL_20:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v10 = 1;
  }
  else
  {
    v10 = *v5;
    v9 = *v8;
    if ((_DWORD)v10 == (_DWORD)v9)
      goto LABEL_17;
  }
  if (sub_24600EA2C(v9, (uint64_t)&unk_25171C620))
  {
    v22 = *(_QWORD *)(v0 + 296);
    v23 = *(_QWORD *)(v0 + 264);
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8))(v10, v9, v23, v22);
    if (qword_257537BD8 != -1)
      swift_once();
    v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
    v24 = *(_QWORD *)(v0 + 528);
    v25 = *(_QWORD *)(v0 + 520);
    v27 = *(_QWORD *)(v0 + 464);
    v26 = *(_QWORD *)(v0 + 472);
    v28 = *(_QWORD *)(v0 + 456);
    v29 = *(_QWORD *)(v0 + 312);
    v30 = __swift_project_value_buffer(v28, (uint64_t)qword_25753AA68);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v26, v30, v28);
    v71(v25, v24, v29);
    swift_retain_n();
    v31 = sub_246017CB0();
    v32 = sub_246017EFC();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = *(_QWORD *)(v0 + 232);
      v34 = swift_slowAlloc();
      v70 = swift_slowAlloc();
      v73 = v70;
      *(_DWORD *)v34 = 136446722;
      v35 = *(_QWORD *)(v33 + 16);
      v36 = *(_QWORD *)(v33 + 24);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 216) = sub_246013004(v35, v36, &v73);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v34 + 12) = 2082;
      v37 = *(char **)(v0 + 520);
      v38 = *(_QWORD *)(v0 + 480);
      v39 = *(_QWORD *)(v0 + 312);
      *(_QWORD *)(v0 + 224) = sub_246013004(*(_QWORD *)&aActive_2[8 * (char)v10], *(_QWORD *)&aInactivediscon_0[8 * (char)v10 + 16], &v73);
      sub_246017F68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 22) = 2082;
      v40 = *v37;
      v41 = *(void (**)(char *, uint64_t))(v38 + 8);
      v41(v37, v39);
      v42 = *(_QWORD *)&aActive_2[8 * v40];
      v43 = *(_QWORD *)&aInactivediscon_0[8 * v40 + 16];
      v44 = *(_QWORD *)(v0 + 464);
      v45 = *(_QWORD *)(v0 + 472);
      v46 = *(_QWORD *)(v0 + 456);
      v66 = *(_QWORD *)(v0 + 312);
      v67 = *(char **)(v0 + 528);
      *(_QWORD *)(v0 + 192) = sub_246013004(v42, v43, &v73);
      sub_246017F68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245FEA000, v31, v32, "%{public}s transitioning from %{public}s to %{public}s. short-circuiting update and telling coordinator directly", (uint8_t *)v34, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24954D194](v70, -1, -1);
      MEMORY[0x24954D194](v34, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v46);
      v41(v67, v66);
    }
    else
    {
      v60 = *(_QWORD *)(v0 + 528);
      v61 = *(_QWORD *)(v0 + 472);
      v62 = *(_QWORD *)(v0 + 456);
      v63 = *(_QWORD *)(v0 + 464);
      v64 = *(_QWORD *)(v0 + 312);
      v65 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 480) + 8);
      v65(*(_QWORD *)(v0 + 520), v64);

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v61, v62);
      v65(v60, v64);
    }
    goto LABEL_20;
  }
  LODWORD(v10) = v9;
LABEL_17:
  if ((_DWORD)v10)
  {
    v8 = *(unsigned __int8 **)(v0 + 528);
    goto LABEL_19;
  }
  v49 = *(_QWORD *)(v0 + 440);
  v48 = *(_QWORD *)(v0 + 448);
  v50 = *(_QWORD *)(v0 + 368);
  v51 = *(_QWORD *)(v0 + 312);
  v52 = *(_QWORD *)(v0 + 288);
  v53 = *(_QWORD *)(v0 + 272);
  v54 = *(_QWORD *)(v0 + 256);
  v55 = *(_QWORD *)(v0 + 232);
  v56 = v55 + *(_QWORD *)(v0 + 568);
  *(_QWORD *)(v0 + 648) = *(_QWORD *)(*(_QWORD *)v55 + 176);
  (*(void (**)(uint64_t))(v52 + 24))(v54);
  v57 = v56 + *(int *)(v51 + 92);
  v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
  *(_QWORD *)(v0 + 656) = v58;
  v58(v48, v57, v50);
  v72 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(**(int **)(v53 + 24) + *(_QWORD *)(v53 + 24));
  v59 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 664) = v59;
  *v59 = v0;
  v59[1] = sub_245FFE1B4;
  return v72(*(_QWORD *)(v0 + 448), *(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 272));
}

uint64_t sub_245FFE1B4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = *v0;
  v3 = *(_QWORD *)(*v0 + 440);
  v2 = *(_QWORD *)(*v0 + 448);
  v4 = *(_QWORD *)(*v0 + 368);
  swift_task_dealloc();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v1 + 672) = v5;
  v5(v2, v4);
  return swift_task_switch();
}

uint64_t sub_245FFE228()
{
  uint64_t v0;
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v3;
  void (*v4)(unsigned __int8 *, uint64_t);
  unsigned int (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  unsigned __int8 *v34;
  unsigned __int8 *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  unsigned __int8 *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  void (*v62)(os_log_t, uint64_t);
  uint64_t v63;
  unsigned __int8 *v64;
  int v65;
  void (*v66)(uint64_t, unsigned __int8 *, uint64_t);
  unsigned __int8 *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  int v72;
  int v73;
  unsigned __int8 *v74;
  int v75;
  void (*v76)(uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(unsigned __int8 *, unsigned __int8 *, uint64_t);
  unsigned __int8 *v86;
  uint64_t v87;
  NSObject *v88;
  NSObject *log;
  os_log_t loga;
  uint64_t v91;
  uint64_t v92;
  os_log_type_t v93;
  NSObject *v94;
  uint64_t (*v95)(_QWORD, _QWORD, _QWORD);
  uint64_t v96;

  v1 = *(unsigned __int8 **)(v0 + 528);
  v2 = *(unsigned __int8 **)(v0 + 512);
  v91 = *(_QWORD *)(v0 + 480);
  v3 = *(_QWORD *)(v0 + 312);
  (*(void (**)(unsigned __int8 *, _QWORD, uint64_t))(v0 + 576))(v2, *(_QWORD *)(v0 + 232) + *(_QWORD *)(v0 + 568), v3);
  LOBYTE(v1) = sub_245FFD318(v1, v2);
  v4 = *(void (**)(unsigned __int8 *, uint64_t))(v91 + 8);
  *(_QWORD *)(v0 + 680) = v4;
  v4(v2, v3);
  if ((v1 & 1) == 0)
  {
    swift_release();
    if (qword_257537BD8 != -1)
      swift_once();
    v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
    v29 = *(_QWORD *)(v0 + 528);
    v30 = *(_QWORD *)(v0 + 488);
    v31 = *(_QWORD *)(v0 + 312);
    __swift_project_value_buffer(*(_QWORD *)(v0 + 456), (uint64_t)qword_25753AA68);
    v28(v30, v29, v31);
    swift_retain_n();
    v32 = sub_246017CB0();
    v33 = sub_246017EFC();
    if (os_log_type_enabled(v32, v33))
    {
      v85 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v0 + 576);
      v93 = v33;
      v34 = *(unsigned __int8 **)(v0 + 512);
      v35 = *(unsigned __int8 **)(v0 + 488);
      v36 = *(_QWORD *)(v0 + 312);
      log = v32;
      v37 = *(_QWORD *)(v0 + 232);
      v86 = (unsigned __int8 *)(v37 + *(_QWORD *)(v0 + 568));
      v38 = swift_slowAlloc();
      v87 = swift_slowAlloc();
      v96 = v87;
      *(_DWORD *)v38 = 136446722;
      v39 = *(_QWORD *)(v37 + 16);
      v40 = *(_QWORD *)(v37 + 24);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 144) = sub_246013004(v39, v40, &v96);
      sub_246017F68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2082;
      v85(v34, v35, v36);
      v4(v35, v36);
      v41 = sub_246000660();
      v43 = v42;
      v4(v34, v36);
      *(_QWORD *)(v0 + 152) = sub_246013004(v41, v43, &v96);
      sub_246017F68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 22) = 2082;
      v85(v34, v86, v36);
      swift_release();
      v44 = sub_246000660();
      v46 = v45;
      v4(v34, v36);
      *(_QWORD *)(v0 + 160) = sub_246013004(v44, v46, &v96);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_245FEA000, log, v93, "%{public}s early return post-display: updateContext changed from %{public}s to %{public}s", (uint8_t *)v38, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24954D194](v87, -1, -1);
      MEMORY[0x24954D194](v38, -1, -1);

    }
    else
    {
      v4(*(unsigned __int8 **)(v0 + 488), *(_QWORD *)(v0 + 312));
      swift_release_n();

    }
    v54 = *(unsigned __int8 **)(v0 + 528);
    v55 = *(_QWORD *)(v0 + 312);
    (*(void (**)(_QWORD))(*(_QWORD *)(**(_QWORD **)(v0 + 232) + 128) + 32))(*(_QWORD *)(**(_QWORD **)(v0 + 232) + 96));
    v4(v54, v55);
    goto LABEL_25;
  }
  v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 640);
  v6 = *(_QWORD *)(v0 + 432);
  v7 = *(_QWORD *)(v0 + 440);
  v8 = *(_QWORD *)(v0 + 368);
  v9 = *(_QWORD *)(v0 + 312);
  v10 = *(_QWORD *)(v0 + 232) + *(_QWORD *)(v0 + 632);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 656))(v6, *(_QWORD *)(v0 + 528) + *(int *)(v9 + 92), v8);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v12 = 1;
  v11(v6, 0, 1, v8);
  if (!v5(v10, 1, v9))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 656))(*(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 232) + *(_QWORD *)(v0 + 632) + *(int *)(*(_QWORD *)(v0 + 312) + 92), *(_QWORD *)(v0 + 368));
    v12 = 0;
  }
  v13 = *(_QWORD *)(v0 + 432);
  v92 = *(_QWORD *)(v0 + 440);
  v14 = *(_QWORD *)(v0 + 424);
  v15 = *(_QWORD *)(v0 + 400);
  v16 = *(_QWORD *)(v0 + 408);
  v17 = *(_QWORD *)(v0 + 376);
  v18 = *(_QWORD *)(v0 + 384);
  v19 = *(_QWORD *)(v0 + 368);
  v11(v14, v12, 1, v19);
  v20 = v15 + *(int *)(v18 + 48);
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v21(v15, v13, v17);
  v21(v20, v14, v17);
  v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v92 + 48);
  v23 = v22(v15, 1, v19);
  v24 = *(_QWORD *)(v0 + 368);
  v25 = *(_QWORD *)(v0 + 376);
  if (v23 == 1)
  {
    v26 = *(_QWORD *)(v0 + 432);
    v27 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 408) + 8);
    v27(*(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 376));
    v27(v26, v25);
    if (v22(v20, 1, v24) == 1)
    {
      v27(*(_QWORD *)(v0 + 400), *(_QWORD *)(v0 + 376));
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  v21(*(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 400), *(_QWORD *)(v0 + 376));
  v47 = v22(v20, 1, v24);
  v48 = *(void (**)(uint64_t, uint64_t))(v0 + 672);
  if (v47 == 1)
  {
    v49 = *(_QWORD *)(v0 + 432);
    v50 = *(_QWORD *)(v0 + 416);
    v52 = *(_QWORD *)(v0 + 368);
    v51 = *(_QWORD *)(v0 + 376);
    v53 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 408) + 8);
    v53(*(_QWORD *)(v0 + 424), v51);
    v53(v49, v51);
    v48(v50, v52);
LABEL_13:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 392) + 8))(*(_QWORD *)(v0 + 400), *(_QWORD *)(v0 + 384));
LABEL_19:
    v95 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(**(int **)(*(_QWORD *)(v0 + 280) + 16)
                                                         + *(_QWORD *)(*(_QWORD *)(v0 + 280) + 16));
    v70 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 688) = v70;
    *v70 = v0;
    v70[1] = sub_245FFEB24;
    return v95(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 280));
  }
  v56 = *(_QWORD *)(v0 + 448);
  loga = *(os_log_t *)(v0 + 432);
  v57 = *(_QWORD *)(v0 + 416);
  v88 = *(NSObject **)(v0 + 424);
  v58 = *(_QWORD *)(v0 + 408);
  v94 = *(NSObject **)(v0 + 400);
  v60 = *(_QWORD *)(v0 + 368);
  v59 = *(_QWORD *)(v0 + 376);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 440) + 32))(v56, v20, v60);
  swift_getAssociatedConformanceWitness();
  v61 = sub_246017CEC();
  v48(v56, v60);
  v62 = *(void (**)(os_log_t, uint64_t))(v58 + 8);
  v62(v88, v59);
  v62(loga, v59);
  v48(v57, v60);
  v62(v94, v59);
  if ((v61 & 1) == 0)
    goto LABEL_19;
LABEL_17:
  swift_release();
  v63 = *(_QWORD *)(v0 + 312);
  v64 = (unsigned __int8 *)(*(_QWORD *)(v0 + 232) + *(_QWORD *)(v0 + 632));
  v65 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v0 + 640))(v64, 1, v63);
  v66 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v0 + 576);
  v67 = *(unsigned __int8 **)(v0 + 528);
  v68 = *(_QWORD *)(v0 + 496);
  if (v65)
  {
    v66(v68, v67, v63);
    goto LABEL_22;
  }
  v72 = *v64;
  v73 = *v67;
  ((void (*)(uint64_t))v66)(v68);
  if (v72 != v73)
  {
LABEL_22:
    v74 = *(unsigned __int8 **)(v0 + 496);
    v75 = *v74;
    (*(void (**)(unsigned __int8 *, _QWORD, uint64_t))(v0 + 680))(v74, *(_QWORD *)(v0 + 312), v69);
    if (!v75)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(1, 0, *(_QWORD *)(v0 + 264));
    goto LABEL_24;
  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 680))(*(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 312));
LABEL_24:
  v76 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
  v77 = *(_QWORD *)(v0 + 528);
  v78 = *(_QWORD *)(v0 + 480);
  v80 = *(_QWORD *)(v0 + 328);
  v79 = *(_QWORD *)(v0 + 336);
  v82 = *(_QWORD *)(v0 + 312);
  v81 = *(_QWORD *)(v0 + 320);
  v83 = *(_QWORD *)(v0 + 232);
  v84 = v83 + *(_QWORD *)(v0 + 632);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576))(v79, v77, v82);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v78 + 56))(v79, 0, 1, v82);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v80 + 40))(v84, v79, v81);
  swift_endAccess();
  (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)v83 + 128) + 32))(*(_QWORD *)(*(_QWORD *)v83 + 96));
  v76(v77, v82);
LABEL_25:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245FFEB24()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245FFEB74()
{
  uint64_t v0;
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  NSObject *log;
  uint64_t v37;
  os_log_type_t type;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(unsigned __int8 *, uint64_t);
  uint64_t (*v42)(_QWORD, _QWORD, uint64_t);
  uint64_t v43;
  uint64_t v44;

  v41 = *(void (**)(unsigned __int8 *, uint64_t))(v0 + 680);
  v1 = *(unsigned __int8 **)(v0 + 528);
  v2 = *(unsigned __int8 **)(v0 + 512);
  v3 = *(_QWORD *)(v0 + 312);
  (*(void (**)(unsigned __int8 *, _QWORD, uint64_t))(v0 + 576))(v2, *(_QWORD *)(v0 + 232) + *(_QWORD *)(v0 + 568), v3);
  LOBYTE(v1) = sub_245FFD318(v1, v2);
  v41(v2, v3);
  if ((v1 & 1) != 0)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(v0 + 288) + 8);
    v42 = (uint64_t (*)(_QWORD, _QWORD, uint64_t))(**(int **)(v4 + 16) + *(_QWORD *)(v4 + 16));
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 696) = v5;
    *v5 = v0;
    v5[1] = sub_245FFF0A8;
    return v42(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 256), v4);
  }
  else
  {
    swift_release();
    if (qword_257537BD8 != -1)
      swift_once();
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
    v8 = *(_QWORD *)(v0 + 528);
    v9 = *(_QWORD *)(v0 + 504);
    v10 = *(_QWORD *)(v0 + 312);
    __swift_project_value_buffer(*(_QWORD *)(v0 + 456), (uint64_t)qword_25753AA68);
    v7(v9, v8, v10);
    swift_retain_n();
    v11 = sub_246017CB0();
    v12 = sub_246017EFC();
    v13 = os_log_type_enabled(v11, v12);
    v14 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
    if (v13)
    {
      v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
      type = v12;
      v15 = *(_QWORD *)(v0 + 512);
      v33 = *(_QWORD *)(v0 + 504);
      v43 = *(_QWORD *)(v0 + 360);
      v39 = *(_QWORD *)(v0 + 352);
      v40 = *(_QWORD *)(v0 + 344);
      v16 = *(_QWORD *)(v0 + 312);
      v17 = *(_QWORD *)(v0 + 232);
      v35 = v17 + *(_QWORD *)(v0 + 568);
      log = v11;
      v18 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      v44 = v37;
      *(_DWORD *)v18 = 136446722;
      v19 = *(_QWORD *)(v17 + 16);
      v20 = *(_QWORD *)(v17 + 24);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 168) = sub_246013004(v19, v20, &v44);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release();
      *(_WORD *)(v18 + 12) = 2082;
      v34(v15, v33, v16);
      v14(v33, v16);
      v21 = sub_246000660();
      v23 = v22;
      v14(v15, v16);
      *(_QWORD *)(v0 + 176) = sub_246013004(v21, v23, &v44);
      sub_246017F68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 22) = 2082;
      v34(v15, v35, v16);
      swift_release();
      v24 = sub_246000660();
      v26 = v25;
      v14(v15, v16);
      *(_QWORD *)(v0 + 184) = sub_246013004(v24, v26, &v44);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_245FEA000, log, type, "%{public}s early return post-UpdateTransforms: updateContext changed from %{public}s to %{public}s", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24954D194](v37, -1, -1);
      MEMORY[0x24954D194](v18, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v43, v40);
    }
    else
    {
      v28 = *(_QWORD *)(v0 + 352);
      v27 = *(_QWORD *)(v0 + 360);
      v29 = *(_QWORD *)(v0 + 344);
      v14(*(_QWORD *)(v0 + 504), *(_QWORD *)(v0 + 312));

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    }
    v30 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
    v31 = *(_QWORD *)(v0 + 528);
    v32 = *(_QWORD *)(v0 + 312);
    (*(void (**)(_QWORD))(*(_QWORD *)(**(_QWORD **)(v0 + 232) + 128) + 32))(*(_QWORD *)(**(_QWORD **)(v0 + 232) + 96));
    v30(v31, v32);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245FFF0A8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v5)(_QWORD, _QWORD, _QWORD);

  v2 = (_QWORD *)*v1;
  v2[88] = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v5 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(**(int **)(v2[38] + 16) + *(_QWORD *)(v2[38] + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v2[89] = v4;
  *v4 = v2;
  v4[1] = sub_245FFF16C;
  return v5(v2[45], v2[33], v2[38]);
}

uint64_t sub_245FFF16C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 720) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245FFF1D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  void (*v7)(uint64_t, unsigned __int8 *, uint64_t);
  unsigned __int8 *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v22)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 352);
  v1 = *(_QWORD *)(v0 + 360);
  v3 = *(_QWORD *)(v0 + 344);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = *(_QWORD *)(v0 + 312);
  v5 = (unsigned __int8 *)(*(_QWORD *)(v0 + 232) + *(_QWORD *)(v0 + 632));
  v6 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v0 + 640))(v5, 1, v4);
  v7 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v0 + 576);
  v8 = *(unsigned __int8 **)(v0 + 528);
  v9 = *(_QWORD *)(v0 + 496);
  if (v6)
  {
    v7(v9, v8, v4);
  }
  else
  {
    v10 = *v5;
    v11 = *v8;
    ((void (*)(uint64_t))v7)(v9);
    if (v10 == v11)
    {
      (*(void (**)(_QWORD, _QWORD))(v0 + 680))(*(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 312));
      goto LABEL_7;
    }
  }
  v12 = **(unsigned __int8 **)(v0 + 496);
  (*(void (**)(void))(v0 + 680))();
  if (!v12)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(1, 0, *(_QWORD *)(v0 + 264));
LABEL_7:
  v22 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
  v13 = *(_QWORD *)(v0 + 528);
  v14 = *(_QWORD *)(v0 + 480);
  v16 = *(_QWORD *)(v0 + 328);
  v15 = *(_QWORD *)(v0 + 336);
  v18 = *(_QWORD *)(v0 + 312);
  v17 = *(_QWORD *)(v0 + 320);
  v19 = *(_QWORD *)(v0 + 232);
  v20 = v19 + *(_QWORD *)(v0 + 632);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576))(v15, v13, v18);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(v15, 0, 1, v18);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 40))(v20, v15, v17);
  swift_endAccess();
  (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)v19 + 128) + 32))(*(_QWORD *)(*(_QWORD *)v19 + 96));
  v22(v13, v18);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245FFF438()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  int v18;
  void (*v19)(uint64_t, unsigned __int8 *, uint64_t);
  unsigned __int8 *v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;

  v1 = *(void **)(v0 + 704);
  swift_release();
  if (qword_257537BD8 != -1)
    swift_once();
  __swift_project_value_buffer(*(_QWORD *)(v0 + 456), (uint64_t)qword_25753AA68);
  swift_retain();
  v2 = v1;
  swift_retain();
  v3 = v1;
  v4 = sub_246017CB0();
  v5 = sub_246017EF0();
  v6 = os_log_type_enabled(v4, v5);
  v8 = *(_QWORD *)(v0 + 352);
  v7 = *(_QWORD *)(v0 + 360);
  v9 = *(_QWORD *)(v0 + 344);
  v10 = *(_QWORD *)(v0 + 232);
  if (v6)
  {
    v38 = *(_QWORD *)(v0 + 352);
    v11 = swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v40 = v35;
    *(_DWORD *)v11 = 136446466;
    v36 = v7;
    v37 = v9;
    v12 = *(_QWORD *)(v10 + 16);
    v13 = *(_QWORD *)(v10 + 24);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 200) = sub_246013004(v12, v13, &v40);
    sub_246017F68();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v11 + 12) = 2112;
    v14 = v1;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 208) = v15;
    sub_246017F68();
    *v34 = v15;

    _os_log_impl(&dword_245FEA000, v4, v5, "%{public}s failed updating blanker and coordinator: %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v34, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v35, -1, -1);
    MEMORY[0x24954D194](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
  }
  else
  {

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  v16 = *(_QWORD *)(v0 + 312);
  v17 = (unsigned __int8 *)(*(_QWORD *)(v0 + 232) + *(_QWORD *)(v0 + 632));
  v18 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v0 + 640))(v17, 1, v16);
  v19 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v0 + 576);
  v20 = *(unsigned __int8 **)(v0 + 528);
  v21 = *(_QWORD *)(v0 + 496);
  if (v18)
  {
    v19(v21, v20, v16);
  }
  else
  {
    v22 = *v17;
    v23 = *v20;
    ((void (*)(uint64_t))v19)(v21);
    if (v22 == v23)
    {
      (*(void (**)(_QWORD, _QWORD))(v0 + 680))(*(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 312));
      goto LABEL_12;
    }
  }
  v24 = **(unsigned __int8 **)(v0 + 496);
  (*(void (**)(void))(v0 + 680))();
  if (!v24)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(1, 0, *(_QWORD *)(v0 + 264));
LABEL_12:
  v39 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
  v25 = *(_QWORD *)(v0 + 528);
  v26 = *(_QWORD *)(v0 + 480);
  v28 = *(_QWORD *)(v0 + 328);
  v27 = *(_QWORD *)(v0 + 336);
  v30 = *(_QWORD *)(v0 + 312);
  v29 = *(_QWORD *)(v0 + 320);
  v31 = *(_QWORD *)(v0 + 232);
  v32 = v31 + *(_QWORD *)(v0 + 632);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576))(v27, v25, v30);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v27, 0, 1, v30);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 40))(v32, v27, v29);
  swift_endAccess();
  (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)v31 + 128) + 32))(*(_QWORD *)(*(_QWORD *)v31 + 96));
  v39(v25, v30);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245FFF8EC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  int v18;
  void (*v19)(uint64_t, unsigned __int8 *, uint64_t);
  unsigned __int8 *v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;

  v1 = *(void **)(v0 + 720);
  swift_release();
  if (qword_257537BD8 != -1)
    swift_once();
  __swift_project_value_buffer(*(_QWORD *)(v0 + 456), (uint64_t)qword_25753AA68);
  swift_retain();
  v2 = v1;
  swift_retain();
  v3 = v1;
  v4 = sub_246017CB0();
  v5 = sub_246017EF0();
  v6 = os_log_type_enabled(v4, v5);
  v8 = *(_QWORD *)(v0 + 352);
  v7 = *(_QWORD *)(v0 + 360);
  v9 = *(_QWORD *)(v0 + 344);
  v10 = *(_QWORD *)(v0 + 232);
  if (v6)
  {
    v38 = *(_QWORD *)(v0 + 352);
    v11 = swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v40 = v35;
    *(_DWORD *)v11 = 136446466;
    v36 = v7;
    v37 = v9;
    v12 = *(_QWORD *)(v10 + 16);
    v13 = *(_QWORD *)(v10 + 24);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 200) = sub_246013004(v12, v13, &v40);
    sub_246017F68();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v11 + 12) = 2112;
    v14 = v1;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 208) = v15;
    sub_246017F68();
    *v34 = v15;

    _os_log_impl(&dword_245FEA000, v4, v5, "%{public}s failed updating blanker and coordinator: %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v34, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v35, -1, -1);
    MEMORY[0x24954D194](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
  }
  else
  {

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  v16 = *(_QWORD *)(v0 + 312);
  v17 = (unsigned __int8 *)(*(_QWORD *)(v0 + 232) + *(_QWORD *)(v0 + 632));
  v18 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v0 + 640))(v17, 1, v16);
  v19 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v0 + 576);
  v20 = *(unsigned __int8 **)(v0 + 528);
  v21 = *(_QWORD *)(v0 + 496);
  if (v18)
  {
    v19(v21, v20, v16);
  }
  else
  {
    v22 = *v17;
    v23 = *v20;
    ((void (*)(uint64_t))v19)(v21);
    if (v22 == v23)
    {
      (*(void (**)(_QWORD, _QWORD))(v0 + 680))(*(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 312));
      goto LABEL_12;
    }
  }
  v24 = **(unsigned __int8 **)(v0 + 496);
  (*(void (**)(void))(v0 + 680))();
  if (!v24)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(1, 0, *(_QWORD *)(v0 + 264));
LABEL_12:
  v39 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
  v25 = *(_QWORD *)(v0 + 528);
  v26 = *(_QWORD *)(v0 + 480);
  v28 = *(_QWORD *)(v0 + 328);
  v27 = *(_QWORD *)(v0 + 336);
  v30 = *(_QWORD *)(v0 + 312);
  v29 = *(_QWORD *)(v0 + 320);
  v31 = *(_QWORD *)(v0 + 232);
  v32 = v31 + *(_QWORD *)(v0 + 632);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576))(v27, v25, v30);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v27, 0, 1, v30);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 40))(v32, v27, v29);
  swift_endAccess();
  (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)v31 + 128) + 32))(*(_QWORD *)(*(_QWORD *)v31 + 96));
  v39(v25, v30);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_245FFFDA0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = *(_QWORD **)v0;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1[10] - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 160), v1[10]);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1[11] - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 168), v1[11]);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1[12] - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 176), v1[12]);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1[13] - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 184), v1[13]);
  type metadata accessor for DisplayUpdater.UpdateContext();
}

uint64_t sub_245FFFE7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v2, a1);
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 200);
  v4 = sub_246017F5C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v1;
}

void sub_245FFFEE0()
{
  sub_245FFFDA0();
}

uint64_t sub_245FFFEEC()
{
  return swift_deallocClassInstance();
}

void type metadata accessor for DisplayUpdater()
{
  JUMPOUT(0x24954D080);
}

void type metadata accessor for DisplayUpdater.UpdateContext()
{
  JUMPOUT(0x24954D080);
}

uint64_t sub_245FFFF1C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_245FFFF24()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_245FFFFB0(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = ~v6;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 1) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & v7));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(((unint64_t)a1 + v6 + 1) & v7, ((unint64_t)a2 + v6 + 1) & v7, AssociatedTypeWitness);
  }
  return a1;
}

uint64_t sub_246000070(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80), AssociatedTypeWitness);
}

_BYTE *sub_2460000CC(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  *a1 = *a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))((unint64_t)&a1[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), AssociatedTypeWitness);
  return a1;
}

_BYTE *sub_246000140(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  *a1 = *a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 24))((unint64_t)&a1[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), AssociatedTypeWitness);
  return a1;
}

_BYTE *sub_2460001B4(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  *a1 = *a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))((unint64_t)&a1[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), AssociatedTypeWitness);
  return a1;
}

_BYTE *sub_246000228(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  *a1 = *a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 40))((unint64_t)&a1[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_24600029C(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  int v10;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0xFD)
    v6 = 253;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  if (a2 <= v6)
    goto LABEL_24;
  v8 = ((v7 + 1) & ~v7) + *(_QWORD *)(v4 + 64);
  v9 = 8 * v8;
  if (v8 <= 3)
  {
    v12 = ((a2 - v6 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v12))
    {
      v10 = *(_DWORD *)&a1[v8];
      if (!v10)
        goto LABEL_24;
      goto LABEL_15;
    }
    if (v12 > 0xFF)
    {
      v10 = *(unsigned __int16 *)&a1[v8];
      if (!*(_WORD *)&a1[v8])
        goto LABEL_24;
      goto LABEL_15;
    }
    if (v12 < 2)
    {
LABEL_24:
      if (v5 > 0xFD)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((unint64_t)&a1[v7 + 1] & ~v7);
      v15 = *a1;
      if (v15 >= 3)
        return v15 - 2;
      else
        return 0;
    }
  }
  v10 = a1[v8];
  if (!a1[v8])
    goto LABEL_24;
LABEL_15:
  v13 = (v10 - 1) << v9;
  if (v8 > 3)
    v13 = 0;
  if ((_DWORD)v8)
  {
    if (v8 <= 3)
      v14 = v8;
    else
      v14 = 4;
    __asm { BR              X12 }
  }
  return v6 + v13 + 1;
}

void sub_246000428(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v6 + 84) <= 0xFDu)
    v7 = 253;
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(unsigned __int8 *)(v6 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + *(_QWORD *)(v6 + 64);
  if (a3 <= v7)
  {
    v9 = 0;
  }
  else if (v8 <= 3)
  {
    v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v11))
    {
      v9 = 4u;
    }
    else if (v11 >= 0x100)
    {
      v9 = 2;
    }
    else
    {
      v9 = v11 > 1;
    }
  }
  else
  {
    v9 = 1u;
  }
  if (v7 < a2)
  {
    v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_24600063C(uint64_t a1, uint64_t a2)
{
  return sub_2460006DC(a2);
}

uint64_t sub_246000660()
{
  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  return 91;
}

uint64_t sub_2460006DC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 192);
  if (*(unsigned __int8 *)(v1 + v2) != result)
  {
    *(_BYTE *)(v1 + v2) = result;
    return sub_245FFD474();
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

uint64_t sub_246000754(uint64_t a1)
{
  return sub_246007330(a1);
}

uint64_t sub_24600075C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_246000780(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_246000888;
  return sub_246007214(a1, v4);
}

uint64_t sub_2460007E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_246000824()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_245FFA8F0;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_246000888;
  sub_245FFD5D0();
}

uint64_t sub_24600088C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t sub_246000894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

id sub_24600089C()
{
  return sub_2460008C4("%s: sendToFront", 1.79769313e308);
}

id sub_2460008B0()
{
  return sub_2460008C4("%s: sendToBack", -1.79769313e308);
}

id sub_2460008C4(const char *a1, double a2)
{
  void *v2;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  if (qword_257537C28 != -1)
    swift_once();
  v5 = sub_246017CC8();
  __swift_project_value_buffer(v5, (uint64_t)qword_25753AAB8);
  v6 = v2;
  v7 = sub_246017CB0();
  v8 = sub_246017EFC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v15 = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = sub_246017D10();
    v14 = sub_246013004(v11, v12, &v15);
    sub_246017F68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245FEA000, v7, v8, a1, v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v10, -1, -1);
    MEMORY[0x24954D194](v9, -1, -1);

  }
  else
  {

  }
  return objc_msgSend(v6, sel_setWindowLevel_, a2, v14, v15);
}

id sub_246000B64(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id sub_246000BB4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_246000BE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_246000C00()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RootWindowDisplayBlanker()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for RootWindowDisplayBlanker.State(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RootWindowDisplayBlanker.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246000D48 + 4 * byte_24601A445[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246000D7C + 4 * byte_24601A440[v4]))();
}

uint64_t sub_246000D7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246000D84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246000D8CLL);
  return result;
}

uint64_t sub_246000D98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246000DA0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246000DA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246000DAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_246000DB8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RootWindowDisplayBlanker.State()
{
  return &type metadata for RootWindowDisplayBlanker.State;
}

unint64_t sub_246000DD8()
{
  unint64_t result;

  result = qword_257538298;
  if (!qword_257538298)
  {
    result = MEMORY[0x24954D0EC](&unk_24601A4FC, &type metadata for RootWindowDisplayBlanker.State);
    atomic_store(result, (unint64_t *)&qword_257538298);
  }
  return result;
}

void sub_246000E1C()
{
  sub_246000E4C("[%@] %s: blank", (void (*)(void))sub_24600089C, 0);
}

void sub_246000E34()
{
  sub_246000E4C("[%@] %s: unblank", (void (*)(void))sub_2460008B0, 1);
}

void sub_246000E4C(char *a1, void (*a2)(void), char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  char *format;
  uint64_t v20;

  v7 = v3;
  if (qword_257537C28 != -1)
    swift_once();
  v8 = sub_246017CC8();
  __swift_project_value_buffer(v8, (uint64_t)qword_25753AAB8);
  swift_retain_n();
  v9 = sub_246017CB0();
  v10 = sub_246017EFC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v11 = 138412546;
    format = a1;
    v14 = *(void **)(v7 + 24);
    v20 = v13;
    v15 = v14;
    sub_246017F68();
    *v12 = v14;
    swift_release_n();
    *(_WORD *)(v11 + 12) = 2080;
    v16 = sub_246017D10();
    sub_246013004(v16, v17, &v20);
    sub_246017F68();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245FEA000, v9, v10, format, (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v13, -1, -1);
    MEMORY[0x24954D194](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v18 = *(id *)(v7 + 32);
  a2();

  *(_BYTE *)(v7 + 16) = a3;
}

void sub_2460010A4()
{
  sub_246000E4C("[%@] %s: blank", (void (*)(void))sub_24600089C, 0);
}

void sub_2460010D8()
{
  sub_246000E4C("[%@] %s: unblank", (void (*)(void))sub_2460008B0, 1);
}

uint64_t sub_24600110C()
{
  return sub_24600112C();
}

uint64_t sub_24600112C()
{
  sub_246018010();
  sub_246017D28();
  sub_2460181CC();
  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  sub_246018058();
  sub_246017D28();
  return 0;
}

uint64_t sub_246001200(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[3] = a1;
  v2[4] = v1;
  sub_246017E00();
  v2[5] = sub_246017DF4();
  sub_246017DC4();
  return swift_task_switch();
}

void sub_24600126C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  char **v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint8_t *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD *v41;
  CGRect v42;
  CGRect v43;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = objc_msgSend(*(id *)(v1 + 32), sel_screen);
  v3 = objc_msgSend(v2, sel_displayConfiguration);

  if (v3)
  {
    v4 = *(void **)(v0 + 24);
    v5 = &selRef__didInvalidateForDisplayDisconnect;
    objc_msgSend(v3, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v4, sel_bounds);
    v43.origin.x = v14;
    v43.origin.y = v15;
    v43.size.width = v16;
    v43.size.height = v17;
    v42.origin.x = v7;
    v42.origin.y = v9;
    v42.size.width = v11;
    v42.size.height = v13;
    if (!CGRectEqualToRect(v42, v43))
    {
      if (qword_257537C28 != -1)
        swift_once();
      v18 = sub_246017CC8();
      __swift_project_value_buffer(v18, (uint64_t)qword_25753AAB8);
      swift_retain_n();
      v19 = sub_246017CB0();
      v20 = sub_246017EFC();
      v21 = os_log_type_enabled(v19, v20);
      v22 = *(_QWORD *)(v0 + 32);
      if (v21)
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v41 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v23 = 138543362;
        v24 = *(void **)(v22 + 24);
        *(_QWORD *)(v0 + 16) = v24;
        v25 = v24;
        v5 = &selRef__didInvalidateForDisplayDisconnect;
        sub_246017F68();
        *v41 = v24;
        swift_release_n();
        _os_log_impl(&dword_245FEA000, v19, v20, "[%{public}@] recreating blanking window", v23, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
        swift_arrayDestroy();
        MEMORY[0x24954D194](v41, -1, -1);
        MEMORY[0x24954D194](v23, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      v26 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow()), sel_initWithDisplay_, *(_QWORD *)(v0 + 24));
      if (!v26)
      {
        sub_246018070();
        return;
      }
      v27 = v26;
      v28 = *(void **)(v0 + 24);
      v29 = *(_QWORD *)(v0 + 32);
      v30 = (void *)objc_opt_self();
      v31 = v27;
      v32 = objc_msgSend(v30, sel_blackColor);
      objc_msgSend(v31, sel_setBackgroundColor_, v32);

      objc_msgSend(v31, sel_setHidden_, 0);
      objc_msgSend(v31, sel_setOpaque_, 1);
      sub_2460008B0();
      objc_msgSend(v28, v5[53]);
      v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, v33, v34, v35, v36);
      v38 = objc_msgSend(v30, sel_blackColor);
      objc_msgSend(v37, sel_setBackgroundColor_, v38);

      objc_msgSend(v37, sel_setOpaque_, 1);
      objc_msgSend(v37, sel_setAutoresizingMask_, 18);
      v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
      objc_msgSend(v39, sel_setView_, v37);
      objc_msgSend(v31, sel_setRootViewController_, v39);

      if ((*(_BYTE *)(v29 + 16) & 1) != 0)
        sub_2460008B0();
      else
        sub_24600089C();
      v40 = *(void **)(v1 + 32);
      *(_QWORD *)(v1 + 32) = v31;

    }
    (*(void (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2460016F4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245FFA8F0;
  return sub_246001200(v2);
}

unint64_t sub_246001744(uint64_t a1)
{
  unint64_t result;

  result = sub_246001768();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_246001768()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575382C0;
  if (!qword_2575382C0)
  {
    v1 = type metadata accessor for RootWindowDisplayBlanker();
    result = MEMORY[0x24954D0EC](&unk_24601A534, v1);
    atomic_store(result, &qword_2575382C0);
  }
  return result;
}

void sub_2460017AC(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_246017F68();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_24600185C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2460018A0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2460018BC()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DemuxingPresenter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DemuxingPresenter);
}

uint64_t sub_2460018EC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for SceneRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_246001924(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_bridgeObjectRelease();
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

uint64_t sub_246001968(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *sub_2460019B0(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
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
      result[4] = a2[4];
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

uint64_t sub_246001B6C(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246001BAC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_246001BF4(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for DemuxingPresenter.PresenterEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DemuxingPresenter.PresenterEntry);
}

uint64_t sub_246001C4C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  int64_t v28;

  v23 = a1;
  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 88);
  v21 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  swift_beginAccess();
  v24[0] = v1[2];
  v9 = type metadata accessor for DemuxingPresenter.PresenterEntry(255, *(_QWORD *)(v2 + 80), v3, *(_QWORD *)(v2 + 96));
  v10 = sub_246017DAC();
  MEMORY[0x24954D0EC](MEMORY[0x24BEE12D8], v10);
  result = sub_246017ED8();
  v12 = v27;
  if (v27 != v28)
  {
    if (v28 < v27)
    {
      __break(1u);
    }
    else if (v27 < v28)
    {
      v13 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
      v17 = v10;
      v18 = v13;
      v14 = 48 * v27 + 72;
      v19 = v28;
      v20 = v9;
      do
      {
        v22 = v12 + 1;
        v18(v6, v23, v3);
        swift_beginAccess();
        sub_246017D7C();
        sub_246002510(v12, v1[2]);
        sub_246017E90();
        sub_246017E78();
        swift_endAccess();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v3);
        swift_beginAccess();
        sub_246017DB8();
        swift_endAccess();
        sub_246002560((uint64_t)&v27, (uint64_t)v24);
        (*(void (**)(int64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(&v27, v9);
        v16 = v25;
        v15 = v26;
        __swift_project_boxed_opaque_existential_1(v24, v25);
        v9 = v20;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v23, v16, v15);
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
        v14 += 48;
        v12 = v22;
      }
      while (v19 != v22);
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_246001ECC(uint64_t a1)
{
  return sub_246001C4C(a1);
}

uint64_t sub_246001EEC(uint64_t a1, uint64_t a2)
{
  uint64_t **v2;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *i;
  char v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[48];

  v5 = *v2;
  swift_beginAccess();
  v6 = v2[2];
  v7 = type metadata accessor for DemuxingPresenter.PresenterEntry(0, v5[10], v5[11], v5[12]);
  v8 = swift_bridgeObjectRetain();
  if (!MEMORY[0x24954C588](v8, v7))
    return swift_bridgeObjectRelease();
  v9 = 0;
  for (i = v6 + 4; ; i += 6)
  {
    v11 = sub_246017D88();
    sub_246017D64();
    if ((v11 & 1) == 0)
      break;
    v12 = *(_QWORD *)(v7 - 8);
    result = (*(uint64_t (**)(_BYTE *, uint64_t *, uint64_t))(v12 + 16))(v20, i, v7);
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
      goto LABEL_8;
    sub_246002560((uint64_t)v20, (uint64_t)v17);
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v20, v7);
    v15 = v18;
    v16 = v19;
    __swift_project_boxed_opaque_existential_1(v17, v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 + 8) + 8))(a1, a2, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    ++v9;
    if (v14 == MEMORY[0x24954C588](v6, v7))
      return swift_bridgeObjectRelease();
  }
  result = sub_246018028();
  __break(1u);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_246002054(uint64_t a1, uint64_t a2)
{
  return sub_246001EEC(a1, a2);
}

uint64_t sub_246002074(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2[16] = a1;
  v2[17] = v1;
  v2[18] = *v1;
  sub_246017E00();
  v2[19] = sub_246017DF4();
  v2[20] = sub_246017DC4();
  v2[21] = v3;
  return swift_task_switch();
}

uint64_t sub_2460020E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t result;
  uint64_t (*v13)(_QWORD, uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(uint64_t **)(v0 + 144);
  swift_beginAccess();
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v2 + 16);
  v3 = type metadata accessor for DemuxingPresenter.PresenterEntry(0, v1[10], v1[11], v1[12]);
  *(_QWORD *)(v0 + 184) = v3;
  v4 = swift_bridgeObjectRetain();
  if (MEMORY[0x24954C588](v4, v3))
  {
    v5 = sub_246017D88();
    sub_246017D64();
    if ((v5 & 1) != 0)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(v0 + 184) - 8);
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v0 + 16, *(_QWORD *)(v0 + 176) + 32);
      *(_QWORD *)(v0 + 192) = 1;
      v7 = *(_QWORD *)(v0 + 184);
      sub_246002560(v0 + 16, v0 + 64);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + 16, v7);
      v8 = *(_QWORD *)(v0 + 88);
      v9 = *(_QWORD *)(v0 + 96);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), v8);
      v10 = *(_QWORD *)(v9 + 16);
      v13 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v10 + 16) + *(_QWORD *)(v10 + 16));
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v11;
      *v11 = v0;
      v11[1] = sub_246002270;
      return v13(*(_QWORD *)(v0 + 128), v8, v10);
    }
    else
    {
      result = sub_246018028();
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_246002270()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2460022DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v13)(_QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 176);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  if (v2 == MEMORY[0x24954C588](v3, v1))
  {
    swift_bridgeObjectRelease();
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = *(_QWORD *)(v0 + 192);
  v6 = sub_246017D88();
  sub_246017D64();
  if ((v6 & 1) != 0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(v0 + 184) - 8);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v0 + 16, *(_QWORD *)(v0 + 176) + 48 * v5 + 32);
    *(_QWORD *)(v0 + 192) = v5 + 1;
    if (!__OFADD__(v5, 1))
    {
      v8 = *(_QWORD *)(v0 + 184);
      sub_246002560(v0 + 16, v0 + 64);
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + 16, v8);
      v9 = *(_QWORD *)(v0 + 88);
      v10 = *(_QWORD *)(v0 + 96);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), v9);
      v11 = *(_QWORD *)(v10 + 16);
      v13 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v11 + 16) + *(_QWORD *)(v11 + 16));
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v12;
      *v12 = v0;
      v12[1] = sub_246002270;
      return v13(*(_QWORD *)(v0 + 128), v9, v11);
    }
  }
  else
  {
    result = sub_246018028();
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_246002454()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_246002494(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245FFA8F0;
  return sub_246002074(a1);
}

uint64_t sub_2460024E4(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24954D0EC](&unk_24601A64C);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_246002510(unint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  v5 = a2 & 0xFFFFFFFFFFFFF8;
  if ((result & 1) == 0)
    v5 = a2;
  if (*(_QWORD *)(v5 + 16) <= a1)
    goto LABEL_7;
  return result;
}

uint64_t sub_246002560(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

id static DefaultDisplayTransformer.defaultRegistry.getter()
{
  if (qword_25441BDC0 != -1)
    swift_once();
  return (id)qword_25441BE50;
}

id DefaultDisplayTransformer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DefaultDisplayTransformer.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t DefaultDisplayTransformer.transform(_:)(void *a1)
{
  void *v2;
  id v3;
  uint64_t v4;

  if (qword_25441BDC0 != -1)
    swift_once();
  v2 = (void *)qword_25441BE50;
  type metadata accessor for DefaultDisplayTransformerRegistry();
  swift_dynamicCastClassUnconditional();
  v3 = v2;
  v4 = sub_246002734(a1);

  return v4;
}

uint64_t sub_246002734(void *a1)
{
  uint64_t v1;
  id v3;
  os_unfair_lock_s *v4;
  id *v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  id v9[2];
  uint64_t v10;
  uint64_t v11;

  v10 = MEMORY[0x24BEE4B08];
  v11 = MEMORY[0x24BEE4B08];
  v3 = objc_msgSend(a1, sel_identity);
  v4 = *(os_unfair_lock_s **)(v1
                            + OBJC_IVAR____TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry_lockState);
  v5 = (id *)&v4[4];
  v6 = v4 + 6;
  os_unfair_lock_lock(v4 + 6);
  sub_246002D30(v5, (uint64_t)a1, (uint64_t)v3, &v10);
  os_unfair_lock_unlock(v6);
  sub_245FFB5D8(v9, a1);

  v7 = v11;
  swift_bridgeObjectRelease();
  return v7;
}

id sub_246002914()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DefaultDisplayTransformerRegistry()), sel_init);
  qword_25441BE50 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for DefaultDisplayTransformerRegistry()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for DefaultDisplayTransformer()
{
  return objc_opt_self();
}

id sub_246002984(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  os_unfair_lock_s *v10;
  id *v11;
  os_unfair_lock_s *v12;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = a1;
  v5 = objc_allocWithZone(MEMORY[0x24BE0BE98]);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  v6 = (void *)sub_246017CF8();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_246017CF8();
  aBlock[4] = sub_246003664;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24600356C;
  aBlock[3] = &block_descriptor_0;
  v8 = _Block_copy(aBlock);
  v9 = objc_msgSend(v5, sel_initWithIdentifier_forReason_invalidationBlock_, v6, v7, v8);

  _Block_release(v8);
  swift_release();
  swift_release();
  v10 = *(os_unfair_lock_s **)(v1
                             + OBJC_IVAR____TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry_lockState);
  v11 = (id *)&v10[4];
  v12 = v10 + 6;
  os_unfair_lock_lock(v10 + 6);
  sub_246002C28(v11, a1);
  os_unfair_lock_unlock(v12);
  return v9;
}

void sub_246002B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a2 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x24954D224](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = *(_QWORD *)(v5
                   + OBJC_IVAR____TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry_lockState);
    swift_retain();

    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
    objc_msgSend(*(id *)(v7 + 16), sel_removeObject_, a3);
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
    swift_release();
  }
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v8, sel_updateTransformsWithCompletion_, 0);

}

id sub_246002C28(id *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;

  v3 = *a1;
  if (!objc_msgSend(*a1, sel_containsObject_, a2))
    return objc_msgSend(v3, sel_addObject_, a2);
  sub_246003684();
  swift_allocError();
  *(_QWORD *)v4 = 0;
  *(_BYTE *)(v4 + 8) = 2;
  return (id)swift_willThrow();
}

void sub_246002D30(id *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char **v14;
  unint64_t v15;
  void *v16;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  char v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  int64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  char v45;
  uint64_t v46;
  id v47;
  char v48;
  uint64_t v49;
  char v50;
  id v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v59;
  id v60;
  int64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  id v69;

  v5 = v4;
  v8 = objc_msgSend(*a1, sel_allObjects);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25441BE80);
  v9 = sub_246017D4C();

  v10 = v9;
  v59 = v9;
  if (v9 >> 62)
    goto LABEL_59;
  v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v11)
    goto LABEL_51;
  while (1)
  {
    v12 = 0;
    v13 = v10 & 0xC000000000000001;
    v53 = v10 & 0xFFFFFFFFFFFFFF8;
    v52 = v5;
    v14 = &selRef__didInvalidateForDisplayDisconnect;
    v5 = 0x24BE38400uLL;
    v56 = a3;
    v57 = a4;
    v54 = v10 & 0xC000000000000001;
    v55 = v11;
LABEL_4:
    if (!v13)
      break;
    v15 = v12;
    v16 = (void *)MEMORY[0x24954C81C](v12++, v10);
    if (!__OFADD__(v15, 1))
      goto LABEL_10;
LABEL_58:
    __break(1u);
LABEL_59:
    swift_bridgeObjectRetain();
    v11 = sub_24601807C();
    swift_bridgeObjectRelease();
    v10 = v59;
    if (!v11)
      goto LABEL_51;
  }
  if (v12 >= *(_QWORD *)(v53 + 16))
  {
    __break(1u);
    return;
  }
  v16 = (void *)swift_unknownObjectRetain();
  if (__OFADD__(v12++, 1))
    goto LABEL_58;
LABEL_10:
  v18 = objc_msgSend(v16, v14[227], a2, v52);
  sub_245FFC180(0, (unint64_t *)&unk_25441BE90);
  sub_2460035BC();
  v19 = sub_246017E6C();

  if ((v19 & 0xC000000000000001) != 0)
  {
    sub_246017F98();
    sub_246017E84();
    v19 = v64;
    v62 = v65;
    v20 = v66;
    v21 = v67;
    v5 = v68;
  }
  else
  {
    v21 = 0;
    v22 = -1 << *(_BYTE *)(v19 + 32);
    v62 = v19 + 56;
    v23 = ~v22;
    v24 = -v22;
    if (v24 < 64)
      v25 = ~(-1 << v24);
    else
      v25 = -1;
    v5 = v25 & *(_QWORD *)(v19 + 56);
    v20 = v23;
  }
  v61 = (unint64_t)(v20 + 64) >> 6;
  v63 = v19;
  while (v19 < 0)
  {
    if (!sub_246017FBC())
      goto LABEL_50;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v33 = v69;
    swift_unknownObjectRelease();
    v32 = v21;
    v30 = v5;
    if (!v33)
      goto LABEL_50;
LABEL_40:
    v37 = objc_msgSend(v33, sel_identity);
    sub_245FFC180(0, &qword_257539150);
    v38 = objc_msgSend(v37, sel_rootIdentity);
    v39 = sub_246017F44();

    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_246003684();
      swift_allocError();
      v50 = 0;
      *(_QWORD *)v49 = v33;
      goto LABEL_56;
    }
    v40 = *a4;
    if ((*a4 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      v26 = v37;
      v27 = sub_246017FC8();
      swift_bridgeObjectRelease();

      v19 = v63;
      if ((v27 & 1) == 0)
        goto LABEL_18;
      swift_bridgeObjectRelease();
      goto LABEL_55;
    }
    if (!*(_QWORD *)(v40 + 16))
      goto LABEL_18;
    v60 = v33;
    swift_bridgeObjectRetain();
    v41 = sub_246017F38();
    v42 = -1 << *(_BYTE *)(v40 + 32);
    v43 = v41 & ~v42;
    if (((*(_QWORD *)(v40 + 56 + ((v43 >> 3) & 0xFFFFFFFFFFFFF8)) >> v43) & 1) != 0)
    {
      sub_245FFC180(0, (unint64_t *)&unk_2575384B0);
      v44 = *(id *)(*(_QWORD *)(v40 + 48) + 8 * v43);
      v45 = sub_246017F44();

      if ((v45 & 1) == 0)
      {
        v46 = ~v42;
        do
        {
          v43 = (v43 + 1) & v46;
          if (((*(_QWORD *)(v40 + 56 + ((v43 >> 3) & 0xFFFFFFFFFFFFF8)) >> v43) & 1) == 0)
            goto LABEL_49;
          v47 = *(id *)(*(_QWORD *)(v40 + 48) + 8 * v43);
          v48 = sub_246017F44();

        }
        while ((v48 & 1) == 0);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33 = v60;
LABEL_55:
      sub_246003684();
      swift_allocError();
      *(_QWORD *)v49 = v33;
      v50 = 1;
LABEL_56:
      *(_BYTE *)(v49 + 8) = v50;
      v51 = v33;
      swift_willThrow();

      swift_unknownObjectRelease();
      sub_245FFC178();
      return;
    }
LABEL_49:
    swift_bridgeObjectRelease();
    a3 = v56;
    a4 = v57;
    v19 = v63;
    v33 = v60;
LABEL_18:
    v28 = v37;
    sub_245FFB5F4(&v69, v28);

    v29 = v33;
    sub_245FFB5D8(&v69, v29);

    v21 = v32;
    v5 = v30;
  }
  if (v5)
  {
    v30 = (v5 - 1) & v5;
    v31 = __clz(__rbit64(v5)) | (v21 << 6);
    v32 = v21;
    goto LABEL_39;
  }
  v34 = v21 + 1;
  if (__OFADD__(v21, 1))
  {
    __break(1u);
    goto LABEL_58;
  }
  if (v34 >= v61)
    goto LABEL_50;
  v35 = *(_QWORD *)(v62 + 8 * v34);
  v32 = v21 + 1;
  if (v35)
    goto LABEL_38;
  v32 = v21 + 2;
  if (v21 + 2 >= v61)
    goto LABEL_50;
  v35 = *(_QWORD *)(v62 + 8 * v32);
  if (v35)
    goto LABEL_38;
  v32 = v21 + 3;
  if (v21 + 3 >= v61)
    goto LABEL_50;
  v35 = *(_QWORD *)(v62 + 8 * v32);
  if (v35)
    goto LABEL_38;
  v32 = v21 + 4;
  if (v21 + 4 >= v61)
    goto LABEL_50;
  v35 = *(_QWORD *)(v62 + 8 * v32);
  if (v35)
  {
LABEL_38:
    v30 = (v35 - 1) & v35;
    v31 = __clz(__rbit64(v35)) + (v32 << 6);
LABEL_39:
    v33 = *(id *)(*(_QWORD *)(v19 + 48) + 8 * v31);
    if (!v33)
      goto LABEL_50;
    goto LABEL_40;
  }
  v36 = v21 + 5;
  while (v61 != v36)
  {
    v35 = *(_QWORD *)(v62 + 8 * v36++);
    if (v35)
    {
      v32 = v36 - 1;
      goto LABEL_38;
    }
  }
LABEL_50:
  sub_245FFC178();
  swift_unknownObjectRelease();
  v10 = v59;
  v13 = v54;
  v14 = &selRef__didInvalidateForDisplayDisconnect;
  v5 = 0x24BE38400uLL;
  if (v12 != v55)
    goto LABEL_4;
LABEL_51:
  swift_bridgeObjectRelease();
}

id _s13ShellSceneKit25DefaultDisplayTransformerCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24600356C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

unint64_t sub_2460035BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25441BEA0;
  if (!qword_25441BEA0)
  {
    v1 = sub_245FFC180(255, (unint64_t *)&unk_25441BE90);
    result = MEMORY[0x24954D0EC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_25441BEA0);
  }
  return result;
}

uint64_t sub_246003614()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_246003638()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_246003664(uint64_t a1)
{
  uint64_t v1;

  sub_246002B4C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
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

unint64_t sub_246003684()
{
  unint64_t result;

  result = qword_2575384A8;
  if (!qword_2575384A8)
  {
    result = MEMORY[0x24954D0EC](&unk_24601A720, &type metadata for DefaultDisplayTransformerRegistry.RegistryError);
    atomic_store(result, (unint64_t *)&qword_2575384A8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DefaultDisplayTransformerRegistry.RegistryError(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for DefaultDisplayTransformerRegistry.RegistryError(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for DefaultDisplayTransformerRegistry.RegistryError(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultDisplayTransformerRegistry.RegistryError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultDisplayTransformerRegistry.RegistryError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_246003810(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_246003828(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DefaultDisplayTransformerRegistry.RegistryError()
{
  return &type metadata for DefaultDisplayTransformerRegistry.RegistryError;
}

uint64_t sub_246003854()
{
  uint64_t v0;

  v0 = sub_246017CC8();
  __swift_allocate_value_buffer(v0, qword_2575384C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2575384C0);
  return sub_246017CBC();
}

void sub_2460038D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  os_log_t v34;
  int v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;

  v3 = v2;
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v32 - v12;
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257537BE8 != -1)
    swift_once();
  v18 = sub_246017CC8();
  __swift_project_value_buffer(v18, (uint64_t)qword_2575384C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v3, a2);
  v37 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v37(v13, a1, v6);
  v19 = sub_246017CB0();
  v20 = sub_246017EFC();
  v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    v22 = swift_slowAlloc();
    v35 = v21;
    v23 = v22;
    v36 = swift_slowAlloc();
    v39 = v36;
    *(_DWORD *)v23 = 136446466;
    v24 = (uint64_t *)&v17[*(int *)(a2 + 36)];
    v33 = v7;
    v34 = v19;
    v25 = v10;
    v27 = *v24;
    v26 = v24[1];
    swift_bridgeObjectRetain();
    v38 = sub_246013004(v27, v26, &v39);
    sub_246017F68();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a2);
    *(_WORD *)(v23 + 12) = 2082;
    v37(v25, (uint64_t)v13, v6);
    v28 = sub_246017D10();
    v38 = sub_246013004(v28, v29, &v39);
    sub_246017F68();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v6);
    v30 = v34;
    _os_log_impl(&dword_245FEA000, v34, (os_log_type_t)v35, "%{public}s present %{public}s", (uint8_t *)v23, 0x16u);
    v31 = v36;
    swift_arrayDestroy();
    MEMORY[0x24954D194](v31, -1, -1);
    MEMORY[0x24954D194](v23, -1, -1);

  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);

  }
}

uint64_t sub_246003BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v5 = *(_QWORD *)(a2 + 16);
  v3[7] = v5;
  v3[8] = *(_QWORD *)(v5 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[11] = *(_QWORD *)(a2 - 8);
  v3[12] = swift_task_alloc();
  sub_246017E00();
  v3[13] = sub_246017DF4();
  sub_246017DC4();
  return swift_task_switch();
}

uint64_t sub_246003C88()
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
  void (*v9)(uint64_t, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *log;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t type[8];
  os_log_type_t typea;
  uint64_t v34;

  swift_release();
  if (qword_257537BE8 != -1)
    swift_once();
  *(_QWORD *)type = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);
  v8 = sub_246017CC8();
  __swift_project_value_buffer(v8, (uint64_t)qword_2575384C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v6, v7);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v9(v3, *(_QWORD *)type, v5);
  v10 = sub_246017CB0();
  v11 = sub_246017EFC();
  v12 = os_log_type_enabled(v10, v11);
  v13 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 96);
  v15 = *(_QWORD *)(v0 + 80);
  if (v12)
  {
    v30 = *(_QWORD *)(v0 + 64);
    v27 = *(_QWORD *)(v0 + 72);
    v28 = *(_QWORD *)(v0 + 56);
    typea = v11;
    v16 = *(_QWORD *)(v0 + 40);
    v26 = *(_QWORD *)(v0 + 80);
    v17 = swift_slowAlloc();
    v31 = swift_slowAlloc();
    v34 = v31;
    *(_DWORD *)v17 = 136446466;
    v18 = (uint64_t *)(v14 + *(int *)(v16 + 36));
    log = v10;
    v20 = *v18;
    v19 = v18[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_246013004(v20, v19, &v34);
    sub_246017F68();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v16);
    *(_WORD *)(v17 + 12) = 2082;
    v9(v27, v26, v28);
    v21 = sub_246017D10();
    *(_QWORD *)(v0 + 24) = sub_246013004(v21, v22, &v34);
    sub_246017F68();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v26, v28);
    _os_log_impl(&dword_245FEA000, log, typea, "%{public}s update %{public}s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v31, -1, -1);
    MEMORY[0x24954D194](v17, -1, -1);

  }
  else
  {
    v23 = *(_QWORD *)(v0 + 56);
    v24 = *(_QWORD *)(v0 + 64);
    (*(void (**)(_QWORD, _QWORD))(v13 + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 40));
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v15, v23);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_246003F64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245FFA8F0;
  return sub_246003BC4(a1, a2);
}

uint64_t sub_246003FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v4 = v3;
  v8 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_246017CC8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257537BE8 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v11, (uint64_t)qword_2575384C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, a3);
  v16 = sub_246017CB0();
  v17 = sub_246017EFC();
  v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v19 = swift_slowAlloc();
    v29 = a1;
    v20 = v19;
    v32 = swift_slowAlloc();
    v35 = v32;
    *(_DWORD *)v20 = 136446722;
    v30 = a2;
    v21 = (uint64_t *)&v10[*(int *)(a3 + 36)];
    v33 = v12;
    v31 = v18;
    v22 = *v21;
    v23 = v21[1];
    swift_bridgeObjectRetain();
    v34 = sub_246013004(v22, v23, &v35);
    sub_246017F68();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a3);
    v24 = 8 * (char)v29;
    v25 = *(_QWORD *)&aActive_3[v24];
    *(_WORD *)(v20 + 12) = 2080;
    v34 = sub_246013004(v25, *(_QWORD *)&aInactivediscon_1[v24 + 16], &v35);
    sub_246017F68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2080;
    v34 = sub_246013004(*(_QWORD *)&aActive_3[8 * (char)v30], *(_QWORD *)&aInactivediscon_1[8 * (char)v30 + 16], &v35);
    sub_246017F68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245FEA000, v16, (os_log_type_t)v31, "%{public}s activation changed from %s to %s", (uint8_t *)v20, 0x20u);
    v26 = v32;
    swift_arrayDestroy();
    MEMORY[0x24954D194](v26, -1, -1);
    MEMORY[0x24954D194](v20, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v14, v11);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a3);

    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_2460042C8(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24954D0EC]("q*p\vPm");
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2460042F4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2460042FC()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_246004370(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v10[1] = v11[1];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24600442C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24600446C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2460044D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246004548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2460045A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246004610(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_24600468C + 4 * byte_24601A760[v10]))();
  }
}

void sub_246004710(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_246004804()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x24600487CLL);
}

void sub_24600480C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x246004814);
  JUMPOUT(0x24600487CLL);
}

void sub_246004858()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x24600487CLL);
}

void sub_246004860()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x24600487CLL);
}

uint64_t sub_246004868(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0)
      JUMPOUT(0x246004874);
    *(_QWORD *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x24600487CLL);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata accessor for LoggingPresenter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LoggingPresenter);
}

uint64_t sub_2460048A0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CADisplayActor()
{
  return objc_opt_self();
}

uint64_t sub_2460048D4()
{
  if (qword_257537BD0 != -1)
    swift_once();
  return sub_246017F2C();
}

uint64_t sub_246004920()
{
  type metadata accessor for CADisplayActor();
  return swift_initStaticObject();
}

uint64_t sub_24600493C()
{
  type metadata accessor for CADisplayActor();
  return sub_246017FD4();
}

void sub_246004960(uint64_t a1)
{
  sub_246004A0C(a1, &SSKDisplayPriorityInvalid, &dword_257538650);
}

uint64_t SSKDisplayPriorityInvalid.getter()
{
  return sub_2460049C0(&qword_257537BF0, &dword_257538650);
}

void sub_246004990(uint64_t a1)
{
  sub_246004A0C(a1, &SSKDisplayPriorityLowest, &dword_257538654);
}

uint64_t SSKDisplayPriorityLowest.getter()
{
  return sub_2460049C0(&qword_257537BF8, &dword_257538654);
}

uint64_t sub_2460049C0(_QWORD *a1, unsigned int *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

void sub_2460049F8(uint64_t a1)
{
  sub_246004A0C(a1, &SSKDisplayPriorityHighest, dword_257538658);
}

void sub_246004A0C(uint64_t a1, uint64_t *a2, _DWORD *a3)
{
  uint64_t v3;

  v3 = *a2;
  if (*a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v3 <= 0x7FFFFFFF)
  {
    *a3 = v3;
    return;
  }
  __break(1u);
}

uint64_t SSKDisplayPriorityHighest.getter()
{
  return sub_2460049C0(&qword_257537C00, dword_257538658);
}

BOOL static SSKDisplayPriority.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

unint64_t sub_246004A64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257537CC8;
  if (!qword_257537CC8)
  {
    type metadata accessor for DisplayPriority(255);
    result = MEMORY[0x24954D0EC](&unk_246019E14, v1);
    atomic_store(result, (unint64_t *)&qword_257537CC8);
  }
  return result;
}

BOOL sub_246004AAC(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL sub_246004AC0(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL sub_246004AD4(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL sub_246004AE8(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

id UpdateDisplayTransformsAdapter.__allocating_init(displayConfiguration:displayTransformUpdater:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayTransformUpdater] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id UpdateDisplayTransformsAdapter.init(displayConfiguration:displayTransformUpdater:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v2[OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayTransformUpdater] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id UpdateDisplayTransformsAdapter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246004D00(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v2[2] = a1;
  v2[3] = v3;
  sub_246017E00();
  v2[4] = sub_246017DF4();
  v2[5] = sub_246017DC4();
  v2[6] = v4;
  return swift_task_switch();
}

uint64_t sub_246004D70()
{
  uint64_t v0;
  uint64_t ObjectType;
  _QWORD *v2;

  ObjectType = swift_getObjectType();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_246004DD4;
  return sub_24600C754(ObjectType);
}

uint64_t sub_246004DD4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_246004E20()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t (*v6)(void);

  v1 = v0[3];
  v2 = (_QWORD *)v0[2];
  swift_release();
  v3 = *(void **)(v1 + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration);
  *v2 = v3;
  v6 = (uint64_t (*)(void))v0[1];
  v4 = v3;
  return v6();
}

void UpdateDisplayTransformsAdapter.update(displayConfiguration:)(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v3 = *(id *)(v1 + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration);
  *(_QWORD *)(v1 + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration) = a1;
  v2 = a1;

}

uint64_t sub_246004EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_245FFA8F0;
  return v9(a1, a2, a3);
}

uint64_t type metadata accessor for UpdateDisplayTransformsAdapter()
{
  return objc_opt_self();
}

uint64_t method lookup function for UpdateDisplayTransformsAdapter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UpdateDisplayTransformsAdapter.__allocating_init(displayConfiguration:displayTransformUpdater:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

id SSKDisplayProfile.init(configuration:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  id v5;
  objc_class *v6;
  char *v7;
  char *v8;
  id v9;
  id v10;
  __int128 v12;
  objc_super v13;

  v12 = *a1;
  v1 = *((_QWORD *)a1 + 2);
  v2 = *((_QWORD *)a1 + 3);
  v3 = *((_BYTE *)a1 + 32);
  v4 = *((_BYTE *)a1 + 33);
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v6 = (objc_class *)type metadata accessor for DisplayProfileConfiguration_Box();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration];
  *(_OWORD *)v8 = v12;
  *((_QWORD *)v8 + 2) = v1;
  *((_QWORD *)v8 + 3) = v2;
  v8[32] = v3;
  v8[33] = v4;
  v13.receiver = v7;
  v13.super_class = v6;
  v9 = objc_msgSendSuper2(&v13, sel_init);
  v10 = objc_msgSend(v5, sel_initWithSwiftConfiguration_delegate_, v9, 0);

  return v10;
}

uint64_t sub_246005050()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend(*(id *)(v0 + 32), sel_identifier);
  sub_246017D04();

  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  return 0x20656E6563535BLL;
}

uint64_t sub_2460050E8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (**v19)(double);
  uint64_t v20;
  id v21;

  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a1;
  *(_WORD *)(v6 + 16) = 256;
  *(_QWORD *)(v6 + 48) = a5;
  *(_QWORD *)(v6 + 56) = a6;
  v11 = objc_allocWithZone((Class)type metadata accessor for FBScenePresentableObserver());
  v12 = a1;
  v13 = a2;
  swift_retain();
  v14 = (char *)objc_msgSend(v11, sel_init);
  *(_QWORD *)(v6 + 40) = v14;
  v15 = &v14[OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler];
  v16 = *(_QWORD *)&v14[OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  swift_retain();
  sub_246005F50(v16);
  v17 = *(_QWORD *)(v6 + 40);
  v18 = swift_allocObject();
  swift_weakInit();
  v19 = (uint64_t (**)(double))(v17
                                        + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler);
  v20 = *(_QWORD *)(v17 + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler);
  *v19 = sub_246005F48;
  v19[1] = (uint64_t (*)(double))v18;
  sub_246005F50(v20);
  v21 = *(id *)(v6 + 40);
  objc_msgSend(v12, sel_addObserver_, v21);

  swift_release();
  swift_release();
  return v6;
}

uint64_t sub_246005230(double a1)
{
  uint64_t result;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD aBlock[6];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = *(id *)(result + 32);
    swift_release();
    v4 = swift_allocObject();
    *(double *)(v4 + 16) = a1;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_246005F70;
    *(_QWORD *)(v5 + 24) = v4;
    aBlock[4] = sub_246005F90;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246005E58;
    aBlock[3] = &block_descriptor_22;
    v6 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v3, sel_updateSettingsWithBlock_, v6);

    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v3 & 1) != 0)
      __break(1u);
  }
  return result;
}

id sub_24600539C(void *a1)
{
  return objc_msgSend(a1, sel_setForeground_, 0);
}

uint64_t sub_2460053AC()
{
  id *v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FBScenePresentable()
{
  return objc_opt_self();
}

uint64_t sub_246005408()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t result;
  _QWORD v5[6];

  v1 = *(void **)(v0 + 32);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_2460065A4;
  *(_QWORD *)(v2 + 24) = v0;
  v5[4] = sub_2460065EC;
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_246005E58;
  v5[3] = &block_descriptor_55;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_updateSettingsWithBlock_, v3);
  _Block_release(v3);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((*(_BYTE *)(v0 + 16) & 1) == 0)
    {
      (*(void (**)(void *))(v0 + 48))(v1);
      *(_BYTE *)(v0 + 16) = 1;
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_246005538(uint64_t result, char a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  _QWORD v6[6];

  if (!a2)
  {
LABEL_6:
    if (result == 1)
      result = sub_246005408();
    goto LABEL_9;
  }
  if (a2 != 1)
  {
    result = (uint64_t)objc_msgSend(*(id *)(v2 + 32), sel_invalidate);
    goto LABEL_9;
  }
  if (!(_BYTE)result)
  {
    v4 = *(void **)(v2 + 32);
    v6[4] = sub_24600539C;
    v6[5] = 0;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 1107296256;
    v6[2] = sub_246005E58;
    v6[3] = &block_descriptor_1;
    v5 = _Block_copy(v6);
    swift_release();
    objc_msgSend(v4, sel_updateSettingsWithBlock_, v5);
    _Block_release(v5);
    result = swift_isEscapingClosureAtFileLocation();
    if ((result & 1) != 0)
    {
      __break(1u);
      goto LABEL_6;
    }
  }
LABEL_9:
  *(_BYTE *)(v2 + 17) = a2;
  return result;
}

uint64_t sub_246005638(uint64_t a1, char a2)
{
  return sub_246005538(a1, a2);
}

uint64_t sub_246005658(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  sub_246017E00();
  v2[4] = sub_246017DF4();
  v2[5] = sub_246017DC4();
  v2[6] = v3;
  return swift_task_switch();
}

uint64_t sub_2460056C4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD *v6;

  v1 = *(void **)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v1;
  v4 = v1;

  if (*(_BYTE *)(v2 + 17))
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v6;
    *v6 = v0;
    v6[1] = sub_24600575C;
    return sub_245FF9BD8((uint64_t)sub_2460059AC, *(_QWORD *)(v0 + 24));
  }
}

uint64_t sub_24600575C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2460057BC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2460057F0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_246005824(void *a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(a1, sel_setForeground_, 1);
  objc_msgSend(a1, sel_setDisplayConfiguration_, *(_QWORD *)(a3 + 24));
  objc_msgSend(*(id *)(a3 + 24), sel_bounds);
  return objc_msgSend(a1, sel_setFrame_);
}

uint64_t sub_246005884(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245FFA8F0;
  return sub_246005658(v2);
}

id sub_2460058D4(void *a1, uint64_t a2)
{
  objc_msgSend(a1, sel_setForeground_, 1);
  objc_msgSend(a1, sel_setDisplayConfiguration_, *(_QWORD *)(a2 + 24));
  objc_msgSend(*(id *)(a2 + 24), sel_bounds);
  return objc_msgSend(a1, sel_setFrame_);
}

uint64_t sub_246005934()
{
  uint64_t v0;

  sub_246005F50(*(_QWORD *)(v0 + 40));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FBScenePresentableProvider()
{
  return objc_opt_self();
}

_UNKNOWN **sub_246005988()
{
  return &off_257538898;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

id sub_2460059AC(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_246005824(a1, a2, v2);
}

uint64_t sub_2460059B4(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  _QWORD aBlock[6];

  objc_msgSend(a1, sel_setClientIdentity_, *(_QWORD *)(a2 + 32));
  v4 = (void *)sub_246017CF8();
  objc_msgSend(a1, sel_setIdentifier_, v4);

  objc_msgSend(a1, sel_setSpecification_, *(_QWORD *)(a2 + 16));
  result = (uint64_t)objc_msgSend(a1, sel_respondsToSelector_, sel_configureParameters_);
  if ((result & 1) != 0)
  {
    MEMORY[0x24BDAC7A8](result);
    v8[2] = a2;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_24600636C;
    *(_QWORD *)(v6 + 24) = v8;
    aBlock[4] = sub_2460065EC;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246015728;
    aBlock[3] = &block_descriptor_48;
    v7 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    objc_msgSend(a1, sel_configureParameters_, v7);
    _Block_release(v7);
    swift_release();
    LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
    swift_unknownObjectRelease();
    result = swift_release();
    if ((v7 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_246005B4C(void *a1, void *a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v12[6];

  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = v2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_246006314;
  *(_QWORD *)(v6 + 24) = v5;
  v12[4] = sub_246005F90;
  v12[5] = v6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_246015728;
  v12[3] = &block_descriptor_41;
  v7 = _Block_copy(v12);
  v8 = a1;
  v9 = a2;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_configureParameters_, v7);
  _Block_release(v7);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_246006330();
    objc_msgSend(v8, sel_addExtension_, swift_getObjCClassFromMetadata());
    return swift_release();
  }
  return result;
}

id sub_246005CB8(void *a1)
{
  return objc_msgSend(a1, sel_activate_, 0);
}

uint64_t sub_246005CCC(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  _QWORD v8[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_246005F0C;
  *(_QWORD *)(v5 + 24) = v4;
  v8[4] = sub_245FFA070;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_246005E58;
  v8[3] = &block_descriptor_10;
  v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_activate_, v6);
  _Block_release(v6);
  swift_release();
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((a1 & 1) != 0)
    __break(1u);
  return result;
}

void sub_246005DFC(void *a1, id a2)
{
  id v3;

  v3 = objc_msgSend(a2, sel_handle);
  objc_msgSend(a1, sel_setClientProcessHandle_, v3);

}

void sub_246005E58(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_246005E8C(uint64_t result, uint64_t a2)
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(a2 + 40);
  if (v2)
  {
    v3 = result;
    swift_retain();
    v2(v3);
    return sub_246005F50((uint64_t)v2);
  }
  return result;
}

uint64_t sub_246005EE8()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_246005F0C(void *a1)
{
  uint64_t v1;

  sub_246005DFC(a1, *(id *)(v1 + 16));
}

uint64_t sub_246005F14()
{
  return swift_deallocObject();
}

uint64_t sub_246005F24()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_246005F48(double a1)
{
  return sub_246005230(a1);
}

uint64_t sub_246005F50(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_246005F60()
{
  return swift_deallocObject();
}

id sub_246005F70(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_setLevel_, *(double *)(v1 + 16));
}

uint64_t sub_246005F80()
{
  return swift_deallocObject();
}

uint64_t sub_246005F90(uint64_t a1)
{
  uint64_t v1;

  return sub_24600F09C(a1, *(uint64_t (**)(void))(v1 + 16));
}

void sub_246005F98(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  _QWORD v21[6];

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_2460062C8;
  *(_QWORD *)(v9 + 24) = v8;
  v21[4] = sub_2460065EC;
  v21[5] = v9;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 1107296256;
  v21[2] = sub_246005E58;
  v21[3] = &block_descriptor_32;
  v10 = _Block_copy(v21);
  v11 = a2;
  v12 = a3;
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_updateSettingsWithBlock_, v10);
  _Block_release(v10);
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((a1 & 1) == 0)
  {
    v13 = objc_msgSend(v11, sel_clientSettings);
    objc_opt_self();
    v14 = swift_dynamicCastObjCClass();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD3D8]), sel_init);
      v17 = objc_msgSend((id)objc_opt_self(), sel_diffFromSettings_toSettings_, v16, v15);

      v18 = (void *)sub_246017CF8();
      v19 = objc_msgSend(v17, sel_containsSettingNamed_, v18);

      if (!v19)
      {
        swift_release();

        goto LABEL_7;
      }
      v20 = objc_msgSend(v15, sel_displayConfigurationRequest);

      v13 = *(id *)(a4 + 32);
      *(_QWORD *)(a4 + 32) = v20;
    }
    swift_release();
LABEL_7:

    return;
  }
  __break(1u);
}

id sub_2460061E0(void *a1, id a2, void *a3)
{
  id v5;
  double v6;
  double v7;

  v5 = objc_msgSend(a2, sel_clientSettings);
  objc_msgSend(v5, sel_preferredLevel);
  v7 = v6;

  objc_msgSend(a1, sel_setLevel_, v7);
  objc_msgSend(a1, sel_setForeground_, 0);
  objc_msgSend(a1, sel_setDisplayConfiguration_, a3);
  objc_msgSend(a3, sel_bounds);
  return objc_msgSend(a1, sel_setFrame_);
}

uint64_t sub_24600629C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2460062C8(void *a1)
{
  uint64_t v1;

  return sub_2460061E0(a1, *(id *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2460062D0()
{
  return swift_deallocObject();
}

uint64_t sub_2460062E0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_246006314(void *a1)
{
  uint64_t v1;

  sub_246005F98(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_246006320()
{
  return swift_deallocObject();
}

unint64_t sub_246006330()
{
  unint64_t result;

  result = qword_2575388E0;
  if (!qword_2575388E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575388E0);
  }
  return result;
}

id sub_24600636C(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_setClientSettings_, *(_QWORD *)(*(_QWORD *)(v1 + 16) + 24));
}

uint64_t sub_246006380()
{
  return swift_deallocObject();
}

void sub_246006390(char a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!a1)
  {
    sub_246005408();
LABEL_9:
    *(_BYTE *)(v1 + 17) = a1;
    return;
  }
  if (a1 == 1)
  {
    if (qword_257537C30 != -1)
      swift_once();
    v3 = sub_246017CC8();
    __swift_project_value_buffer(v3, (uint64_t)qword_25753AAD0);
    swift_retain_n();
    v4 = sub_246017CB0();
    v5 = sub_246017EFC();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v10 = v7;
      *(_DWORD *)v6 = 136446210;
      v8 = sub_246005050();
      sub_246013004(v8, v9, &v10);
      sub_246017F68();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245FEA000, v4, v5, "%{public}s: inactive. update settings later", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954D194](v7, -1, -1);
      MEMORY[0x24954D194](v6, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    goto LABEL_9;
  }
  sub_246018070();
  __break(1u);
}

id sub_2460065A4(void *a1)
{
  uint64_t v1;

  return sub_2460058D4(a1, v1);
}

uint64_t sub_2460065AC()
{
  return swift_deallocObject();
}

id FBSScene.displayEndpoint.getter()
{
  void *v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  sub_245FFC180(0, (unint64_t *)&qword_2575388E0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_245FFC180(0, &qword_2575388E8);
  result = objc_msgSend(v0, sel_componentForExtension_ofClass_, ObjCClassFromMetadata, swift_getObjCClassFromMetadata());
  if (result)
  {
    result = (id)swift_dynamicCastObjCProtocolConditional();
    if (!result)
    {
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return result;
}

uint64_t SceneRequest.sceneIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SceneRequest.sceneIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SceneRequest.sceneIdentifier.modify())()
{
  return nullsub_1;
}

id SceneRequest.specification.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void SceneRequest.specification.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
}

uint64_t (*SceneRequest.specification.modify())()
{
  return nullsub_1;
}

void *SceneRequest.initialClientSettings.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

void SceneRequest.initialClientSettings.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
}

uint64_t (*SceneRequest.initialClientSettings.modify())()
{
  return nullsub_1;
}

id SceneRequest.clientIdentity.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

void SceneRequest.clientIdentity.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
}

uint64_t (*SceneRequest.clientIdentity.modify())()
{
  return nullsub_1;
}

uint64_t SceneRequest.init(sceneIdentifier:specification:initialClientSettings:clientIdentity:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

void SceneRequest.hash(into:)()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v2 = (void *)v0[2];
  v1 = (void *)v0[3];
  v3 = (void *)v0[4];
  swift_bridgeObjectRetain();
  sub_246017D1C();
  swift_bridgeObjectRelease();
  v4 = v2;
  sub_246017F50();

  sub_246018184();
  if (v1)
  {
    v5 = v1;
    sub_246017F50();

  }
  v6 = v3;
  sub_246017F50();

}

uint64_t SceneRequest.hashValue.getter()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v2 = (void *)v0[2];
  v1 = (void *)v0[3];
  v3 = (void *)v0[4];
  sub_24601816C();
  swift_bridgeObjectRetain();
  sub_246017D1C();
  swift_bridgeObjectRelease();
  v4 = v2;
  sub_246017F50();

  sub_246018184();
  if (v1)
  {
    v5 = v1;
    sub_246017F50();

  }
  v6 = v3;
  sub_246017F50();

  return sub_246018190();
}

uint64_t sub_246006990@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2460069A4()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v2 = (void *)v0[2];
  v1 = (void *)v0[3];
  v3 = (void *)v0[4];
  sub_24601816C();
  swift_bridgeObjectRetain();
  sub_246017D1C();
  swift_bridgeObjectRelease();
  v4 = v2;
  sub_246017F50();

  sub_246018184();
  if (v1)
  {
    v5 = v1;
    sub_246017F50();

  }
  v6 = v3;
  sub_246017F50();

  return sub_246018190();
}

uint64_t _s13ShellSceneKit0B7RequestV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;
  id v6;
  char v7;

  v2 = (void *)a1[3];
  v3 = (void *)a2[3];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_246018100() & 1) != 0)
  {
    sub_245FFC180(0, &qword_257539150);
    if ((sub_246017F44() & 1) != 0)
    {
      if (v2)
      {
        if (v3)
        {
          sub_245FFC180(0, &qword_257538958);
          v5 = v3;
          v6 = v2;
          v7 = sub_246017F44();

          if ((v7 & 1) != 0)
            return sub_246017F44() & 1;
        }
      }
      else if (!v3)
      {
        return sub_246017F44() & 1;
      }
    }
  }
  return 0;
}

unint64_t sub_246006B74()
{
  unint64_t result;

  result = qword_257538950;
  if (!qword_257538950)
  {
    result = MEMORY[0x24954D0EC](&protocol conformance descriptor for SceneRequest, &type metadata for SceneRequest);
    atomic_store(result, (unint64_t *)&qword_257538950);
  }
  return result;
}

void destroy for SceneRequest(id *a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for SceneRequest(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  v6 = (void *)a2[4];
  a1[4] = v6;
  swift_bridgeObjectRetain();
  v7 = v4;
  v8 = v5;
  v9 = v6;
  return a1;
}

_QWORD *assignWithCopy for SceneRequest(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  v7 = (void *)a1[3];
  v8 = (void *)a2[3];
  a1[3] = v8;
  v9 = v8;

  v10 = (void *)a2[4];
  v11 = (void *)a1[4];
  a1[4] = v10;
  v12 = v10;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SceneRequest(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for SceneRequest(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneRequest()
{
  return &type metadata for SceneRequest;
}

uint64_t sub_246006DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;

  v20 = a2;
  v21 = a3;
  v22 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389D0);
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  v8 = *(_QWORD *)(v7 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575389D8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v19 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v21, v3);
  v23 = v15;
  sub_246017E48();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v22, v10, v7);
  sub_2460084B4((uint64_t)v15, (uint64_t)v13);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v13, 1, v16);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v20, v13, v16);
    return sub_2460084FC((uint64_t)v15);
  }
  return result;
}

uint64_t sub_246006FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_2460084FC(a2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t sub_246007034()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389D0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (uint64_t *)((char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  v17 = *(_QWORD *)(v4 - 8);
  v18 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for BatchingContext();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v12, qword_257538960);
  v15 = __swift_project_value_buffer((uint64_t)v11, (uint64_t)qword_257538960);
  *(_QWORD *)&v14[v11[6]] = MEMORY[0x24BEE4AF8];
  v14[v11[7]] = 0;
  *v3 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE6A00], v0);
  sub_246006DDC((uint64_t)v10, (uint64_t)v6, (uint64_t)v3);
  (*(void (**)(_QWORD *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v14, v10, v7);
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v14[v11[5]], v6, v18);
  return sub_246008468((uint64_t)v14, v15);
}

uint64_t sub_246007214(uint64_t a1, int *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2[2] = sub_246017E00();
  v2[3] = sub_246017DF4();
  v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_246007290;
  return v6();
}

uint64_t sub_246007290()
{
  swift_task_dealloc();
  sub_246017DC4();
  return swift_task_switch();
}

uint64_t sub_246007300()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_246007330(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  v34 = *(_QWORD *)(v2 - 8);
  v35 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538988);
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v31 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538990);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257537C08 != -1)
    swift_once();
  v14 = (int *)type metadata accessor for BatchingContext();
  v15 = __swift_project_value_buffer((uint64_t)v14, (uint64_t)qword_257538960);
  swift_beginAccess();
  v16 = v14[7];
  if ((*(_BYTE *)(v15 + v16) & 1) == 0)
  {
    *(_BYTE *)(v15 + v16) = 1;
    v17 = sub_246017E18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 1, 1, v17);
    v18 = sub_246017DF4();
    v19 = swift_allocObject();
    v20 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v19 + 16) = v18;
    *(_QWORD *)(v19 + 24) = v20;
    sub_24600F0F8((uint64_t)v13, (uint64_t)&unk_2575389A0, v19);
    swift_release();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  swift_beginAccess();
  v21 = v14[6];
  v22 = *(_QWORD *)(v15 + v21);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v15 + v21) = v22;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v22 = sub_246007C94(0, *(_QWORD *)(v22 + 16) + 1, 1, v22);
    *(_QWORD *)(v15 + v21) = v22;
  }
  v25 = *(_QWORD *)(v22 + 16);
  v24 = *(_QWORD *)(v22 + 24);
  if (v25 >= v24 >> 1)
  {
    v22 = sub_246007C94(v24 > 1, v25 + 1, 1, v22);
    *(_QWORD *)(v15 + v21) = v22;
  }
  *(_QWORD *)(v22 + 16) = v25 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v22+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v25, v10, v7);
  swift_endAccess();
  v27 = v34;
  v26 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v4, v15 + v14[5], v35);
  v28 = v31;
  sub_246017E24();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v28, v33);
}

uint64_t type metadata accessor for BatchingContext()
{
  uint64_t result;

  result = qword_257538A40;
  if (!qword_257538A40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246007688()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538990);
  v0[5] = v1;
  v0[6] = *(_QWORD *)(v1 - 8);
  v0[7] = swift_task_alloc();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389B0);
  v0[8] = v2;
  v0[9] = *(_QWORD *)(v2 - 8);
  v0[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575389B8);
  v0[11] = swift_task_alloc();
  v0[12] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  v0[13] = v3;
  v0[14] = *(_QWORD *)(v3 - 8);
  v0[15] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C8);
  v0[16] = v4;
  v0[17] = *(_QWORD *)(v4 - 8);
  v0[18] = swift_task_alloc();
  v0[19] = sub_246017E00();
  v0[20] = sub_246017DF4();
  v0[21] = sub_246017DC4();
  v0[22] = v5;
  return swift_task_switch();
}

uint64_t sub_2460077D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (qword_257537C08 != -1)
    swift_once();
  v2 = v0[14];
  v1 = v0[15];
  v3 = v0[13];
  v4 = type metadata accessor for BatchingContext();
  v0[23] = v4;
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_257538960);
  v0[24] = v5;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  sub_246017E30();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[25] = sub_246017DF4();
  v6 = (_QWORD *)swift_task_alloc();
  v0[26] = v6;
  *v6 = v0;
  v6[1] = sub_246007904;
  return sub_246017E3C();
}

uint64_t sub_246007904()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_246007958()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t i;
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;

  if (*(_BYTE *)(v0 + 216) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 192);
    v3 = *(int *)(*(_QWORD *)(v0 + 184) + 24);
    v4 = *(_QWORD *)(v2 + v3);
    v5 = v0 + 217;
    *(_QWORD *)(v2 + v3) = MEMORY[0x24BEE4AF8];
    v6 = *(_QWORD *)(v4 + 16);
    result = swift_bridgeObjectRetain();
    i = 0;
    v27 = v4;
    if (v6)
      goto LABEL_5;
LABEL_4:
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 72) + 56))(*(_QWORD *)(v0 + 88), 1, 1, *(_QWORD *)(v0 + 64));
    for (i = v6; ; ++i)
    {
      v18 = *(_QWORD *)(v0 + 96);
      v20 = *(_QWORD *)(v0 + 64);
      v19 = *(_QWORD *)(v0 + 72);
      sub_246008420(*(_QWORD *)(v0 + 88), v18);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v18, 1, v20) == 1)
      {
        swift_bridgeObjectRelease_n();
        *(_QWORD *)(v0 + 200) = sub_246017DF4();
        v26 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 208) = v26;
        *v26 = v0;
        v26[1] = sub_246007904;
        return sub_246017E3C();
      }
      v21 = *(char **)(v0 + 96);
      v22 = *(_QWORD *)(v0 + 56);
      v24 = *(_QWORD *)(v0 + 40);
      v23 = *(_QWORD *)(v0 + 48);
      v25 = *(_QWORD *)v21;
      (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v22, &v21[*(int *)(*(_QWORD *)(v0 + 64) + 48)], v24);
      v4 = v27;
      *(_BYTE *)(v0 + 217) = v25 == *(_QWORD *)(v27 + 16) - 1;
      sub_246017DDC();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
      if (i == v6)
        goto LABEL_4;
LABEL_5:
      if (i >= *(_QWORD *)(v4 + 16))
        break;
      v8 = *(unint64_t **)(v0 + 88);
      v10 = *(_QWORD *)(v0 + 64);
      v9 = *(_QWORD *)(v0 + 72);
      v11 = v5;
      v13 = *(_QWORD *)(v0 + 40);
      v12 = *(_QWORD *)(v0 + 48);
      v14 = v4
          + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
          + *(_QWORD *)(v12 + 72) * i;
      v15 = *(_QWORD *)(v0 + 80) + *(int *)(v10 + 48);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v12 + 16))(v15, v14, v13);
      v16 = (char *)v8 + *(int *)(v10 + 48);
      *v8 = i;
      v17 = v13;
      v5 = v11;
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v16, v15, v17);
      (*(void (**)(unint64_t *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v8, 0, 1, v10);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_246007C0C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_246007C30()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_245FFA8F0;
  return sub_246007688();
}

uint64_t sub_246007C94(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575389A8);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257538990) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_246018064();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257538990) - 8);
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
    sub_246008300(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_246007EA4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257539030);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2460081F4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_246007FC8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257539000);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2460080E8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460080E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_2575389E0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2460180AC();
  __break(1u);
  return result;
}

uint64_t sub_2460081F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257538FB0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2460180AC();
  __break(1u);
  return result;
}

uint64_t sub_246008300(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257538990) - 8);
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
  result = sub_2460180AC();
  __break(1u);
  return result;
}

uint64_t sub_246008420(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246008468(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BatchingContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2460084AC(uint64_t a1)
{
  uint64_t v1;

  return sub_246006FC8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2460084B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2460084FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_24600853C(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[7];
    *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
    *((_BYTE *)a1 + v12) = *((_BYTE *)a2 + v12);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24600860C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_246008684(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_246008728(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_2460087DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  return a1;
}

uint64_t sub_24600887C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_246008928()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246008934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_2460089E4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460089F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575389C0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_257538980);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void sub_246008A9C()
{
  unint64_t v0;
  unint64_t v1;

  sub_246008B58(319, &qword_257538A50, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
  {
    sub_246008B58(319, qword_257538A58, MEMORY[0x24BEE6A40]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_246008B58(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x24BEE4AE0] + 8);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_246008BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_246008BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t HostingGroup.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static HostingGroup.default.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_25441BE60 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_25441BFE8;
  *a1 = qword_25441BFE0;
  a1[1] = v2;
  a1[2] = 0;
  return swift_bridgeObjectRetain();
}

ShellSceneKit::HostingGroup __swiftcall HostingGroup.init(_:)(Swift::String a1)
{
  Swift::String *v1;
  ShellSceneKit::HostingGroup result;

  *v1 = a1;
  v1[1]._countAndFlagsBits = 0;
  result.id = a1;
  return result;
}

uint64_t HostingGroup.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_246017D1C();
  return swift_bridgeObjectRelease();
}

uint64_t static HostingGroup.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_246018100();
}

uint64_t sub_246008CB8(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 25705;
}

uint64_t sub_246008CE8()
{
  char *v0;

  return sub_246008CB8(*v0);
}

uint64_t sub_246008CF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246009614(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246008D14()
{
  return 0;
}

void sub_246008D20(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_246008D2C()
{
  sub_246009270();
  return sub_2460181B4();
}

uint64_t sub_246008D54()
{
  sub_246009270();
  return sub_2460181C0();
}

uint64_t HostingGroup.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538A90);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246009270();
  sub_2460181A8();
  v11 = 0;
  sub_2460180DC();
  if (!v2)
  {
    v10 = 1;
    sub_2460180E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v4);
}

uint64_t HostingGroup.hashValue.getter()
{
  sub_24601816C();
  swift_bridgeObjectRetain();
  sub_246017D1C();
  swift_bridgeObjectRelease();
  return sub_246018190();
}

uint64_t HostingGroup.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538AA0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246009270();
  sub_24601819C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v16 = 0;
  v9 = sub_2460180C4();
  v11 = v10;
  v15 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_2460180D0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_246009088@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return HostingGroup.init(from:)(a1, a2);
}

uint64_t sub_24600909C(_QWORD *a1)
{
  return HostingGroup.encode(to:)(a1);
}

uint64_t sub_2460090B0()
{
  sub_24601816C();
  swift_bridgeObjectRetain();
  sub_246017D1C();
  swift_bridgeObjectRelease();
  return sub_246018190();
}

uint64_t sub_246009108()
{
  swift_bridgeObjectRetain();
  sub_246017D1C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24600914C()
{
  sub_24601816C();
  swift_bridgeObjectRetain();
  sub_246017D1C();
  swift_bridgeObjectRelease();
  return sub_246018190();
}

uint64_t sub_2460091A0(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_246018100();
}

uint64_t HostingGroup.description.getter()
{
  swift_bridgeObjectRetain();
  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  return 0x3A70756F72675BLL;
}

void sub_24600924C()
{
  qword_25441BFE0 = 0x746C7561666564;
  *(_QWORD *)algn_25441BFE8 = 0xE700000000000000;
}

unint64_t sub_246009270()
{
  unint64_t result;

  result = qword_257538A98;
  if (!qword_257538A98)
  {
    result = MEMORY[0x24954D0EC]("i*p\v i", &type metadata for HostingGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257538A98);
  }
  return result;
}

unint64_t sub_2460092B8()
{
  unint64_t result;

  result = qword_25441BE40;
  if (!qword_25441BE40)
  {
    result = MEMORY[0x24954D0EC]("q+p\v4j", &type metadata for HostingGroup);
    atomic_store(result, (unint64_t *)&qword_25441BE40);
  }
  return result;
}

_QWORD *sub_246009300(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HostingGroup(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for HostingGroup(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for HostingGroup(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HostingGroup(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HostingGroup()
{
  return &type metadata for HostingGroup;
}

uint64_t storeEnumTagSinglePayload for HostingGroup.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2460094BC + 4 * byte_24601ABC1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2460094F0 + 4 * asc_24601ABBC[v4]))();
}

uint64_t sub_2460094F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460094F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246009500);
  return result;
}

uint64_t sub_24600950C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246009514);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246009518(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246009520(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HostingGroup.CodingKeys()
{
  return &type metadata for HostingGroup.CodingKeys;
}

unint64_t sub_246009540()
{
  unint64_t result;

  result = qword_257538AA8;
  if (!qword_257538AA8)
  {
    result = MEMORY[0x24954D0EC]("a*p\vHi", &type metadata for HostingGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257538AA8);
  }
  return result;
}

unint64_t sub_246009588()
{
  unint64_t result;

  result = qword_257538AB0;
  if (!qword_257538AB0)
  {
    result = MEMORY[0x24954D0EC](&unk_24601AD10, &type metadata for HostingGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257538AB0);
  }
  return result;
}

unint64_t sub_2460095D0()
{
  unint64_t result;

  result = qword_257538AB8[0];
  if (!qword_257538AB8[0])
  {
    result = MEMORY[0x24954D0EC](&unk_24601AD38, &type metadata for HostingGroup.CodingKeys);
    atomic_store(result, qword_257538AB8);
  }
  return result;
}

uint64_t sub_246009614(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_246018100() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024601D7D0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_246018100();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2460096E0()
{
  uint64_t AssociatedTypeWitness;
  unint64_t v1;
  unint64_t v2;
  uint64_t inited;

  AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      inited = swift_initClassMetadata2();
      if (inited)
        return inited;
      else
        return 0;
    }
  }
  return AssociatedTypeWitness;
}

uint64_t sub_2460097A4()
{
  uint64_t v0;

  v0 = sub_246017CC8();
  __swift_allocate_value_buffer(v0, qword_25753AA88);
  __swift_project_value_buffer(v0, (uint64_t)qword_25753AA88);
  return sub_246017CBC();
}

uint64_t sub_246009820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96), *(_QWORD *)(*(_QWORD *)v0 + 80));
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 104);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v1, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2460098B4()
{
  sub_246009820();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HostingGroupCoordinator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HostingGroupCoordinator);
}

uint64_t sub_2460098E4(unsigned int a1, unsigned int a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t result;
  int64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  int64_t v37;
  uint64_t AssociatedConformanceWitness;
  int64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;

  v45 = a1;
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 88);
  v43 = *(_QWORD *)(*v2 + 80);
  v44 = v5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v39 - v8;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v11 = sub_246017F5C();
  v47 = *(_QWORD *)(v11 - 8);
  v48 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v39 - v15;
  v17 = *(_QWORD *)(v4 + 112);
  v46 = a2;
  *((_BYTE *)v2 + v17) = a2;
  v18 = (uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 120));
  swift_beginAccess();
  v19 = *v18;
  v20 = *(_QWORD *)(*v18 + 64);
  v40 = *v18 + 64;
  v21 = 1 << *(_BYTE *)(v19 + 32);
  v22 = -1;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  v23 = v22 & v20;
  v41 = (unint64_t)(v21 + 63) >> 6;
  v42 = v19;
  v39 = v41 - 1;
  result = swift_bridgeObjectRetain();
  v25 = 0;
  if (!v23)
    goto LABEL_6;
LABEL_4:
  v26 = __clz(__rbit64(v23));
  v23 &= v23 - 1;
  v27 = v26 | (v25 << 6);
LABEL_5:
  v28 = *(_QWORD *)(v42 + 56);
  v29 = (uint64_t *)(*(_QWORD *)(v42 + 48) + 24 * v27);
  v30 = *v29;
  v31 = v29[1];
  v32 = v29[2];
  *(_QWORD *)v14 = v30;
  *((_QWORD *)v14 + 1) = v31;
  *((_QWORD *)v14 + 2) = v32;
  (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(&v14[*(int *)(TupleTypeMetadata2 + 48)], v28 + *(_QWORD *)(v7 + 72) * v27, AssociatedTypeWitness);
  v33 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v14, 0, 1, TupleTypeMetadata2);
  swift_bridgeObjectRetain();
  while (1)
  {
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v16, v14, v48);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v16, 1, TupleTypeMetadata2) == 1)
      return swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, &v16[*(int *)(TupleTypeMetadata2 + 48)], AssociatedTypeWitness);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(AssociatedConformanceWitness + 8) + 8))(v45, v46, AssociatedTypeWitness);
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
    if (v23)
      goto LABEL_4;
LABEL_6:
    v34 = v25 + 1;
    if (__OFADD__(v25, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v34 < v41)
    {
      v35 = *(_QWORD *)(v40 + 8 * v34);
      if (v35)
        goto LABEL_9;
      v36 = v25 + 2;
      ++v25;
      if (v34 + 1 < v41)
      {
        v35 = *(_QWORD *)(v40 + 8 * v36);
        if (v35)
        {
          ++v34;
LABEL_9:
          v23 = (v35 - 1) & v35;
          v27 = __clz(__rbit64(v35)) + (v34 << 6);
          v25 = v34;
          goto LABEL_5;
        }
        v37 = v34 + 2;
        v25 = v34 + 1;
        if (v34 + 2 < v41)
          break;
      }
    }
LABEL_21:
    v33 = *(_QWORD *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v14, 1, 1, TupleTypeMetadata2);
    v23 = 0;
  }
  v35 = *(_QWORD *)(v40 + 8 * v37);
  if (v35)
  {
    v34 += 2;
    goto LABEL_9;
  }
  while (1)
  {
    v34 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v34 >= v41)
    {
      v25 = v39;
      goto LABEL_21;
    }
    v35 = *(_QWORD *)(v40 + 8 * v34);
    ++v37;
    if (v35)
      goto LABEL_9;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_246009C70(unsigned int a1, unsigned int a2)
{
  return sub_2460098E4(a1, a2);
}

uint64_t sub_246009C90(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;

  v2[5] = a1;
  v2[6] = v1;
  v3 = *v1;
  v2[7] = *(_QWORD *)(*v1 + 88);
  v2[8] = *(_QWORD *)(v3 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[9] = AssociatedTypeWitness;
  v2[10] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_getTupleTypeMetadata2();
  v5 = sub_246017F5C();
  v2[13] = v5;
  v2[14] = *(_QWORD *)(v5 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  sub_246017E00();
  v2[17] = sub_246017DF4();
  v2[18] = sub_246017DC4();
  v2[19] = v6;
  return swift_task_switch();
}

uint64_t sub_246009DAC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(_QWORD, _QWORD, uint64_t);

  v1 = (uint64_t *)(*(_QWORD *)(v0 + 48) + *(_QWORD *)(**(_QWORD **)(v0 + 48) + 120));
  swift_beginAccess();
  v2 = *v1;
  *(_QWORD *)(v0 + 160) = *v1;
  v3 = *(_BYTE *)(v2 + 32);
  *(_BYTE *)(v0 + 200) = v3;
  v4 = -1;
  v5 = -1 << v3;
  if (-(-1 << v3) < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(v2 + 64);
  v7 = (_QWORD *)swift_bridgeObjectRetain();
  if (v6)
  {
    v8 = 0;
    v9 = __clz(__rbit64(v6));
    v10 = (v6 - 1) & v6;
LABEL_5:
    v11 = *(char **)(v0 + 120);
    v12 = *(_QWORD *)(v0 + 96);
    v13 = *(_QWORD *)(v0 + 72);
    v14 = *(_QWORD *)(v0 + 80);
    v15 = (uint64_t *)(v7[6] + 24 * v9);
    v16 = *v15;
    v17 = v15[1];
    v18 = v15[2];
    *(_QWORD *)v11 = v16;
    *((_QWORD *)v11 + 1) = v17;
    *((_QWORD *)v11 + 2) = v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(&v11[*(int *)(v12 + 48)], v7[7] + *(_QWORD *)(v14 + 72) * v9, v13);
    v19 = *(_QWORD *)(v12 - 8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v11, 0, 1, v12);
    swift_bridgeObjectRetain();
    goto LABEL_12;
  }
  v20 = 63 - v5;
  if ((unint64_t)(63 - v5) <= 0x7F)
  {
    v8 = 0;
  }
  else
  {
    v21 = v7[9];
    if (v21)
    {
      v8 = 1;
LABEL_9:
      v10 = (v21 - 1) & v21;
      v9 = __clz(__rbit64(v21)) + (v8 << 6);
      goto LABEL_5;
    }
    if (v20 < 0xC0)
    {
      v8 = 1;
    }
    else
    {
      v21 = v7[10];
      if (v21)
      {
        v8 = 2;
        goto LABEL_9;
      }
      if (v20 < 0x100)
      {
        v8 = 2;
      }
      else
      {
        v21 = v7[11];
        if (v21)
        {
          v8 = 3;
          goto LABEL_9;
        }
        v32 = 0;
        v33 = v20 >> 6;
        v34 = 4;
        if (v33 > 4)
          v34 = v33;
        v35 = v34 - 4;
        while (v35 != v32)
        {
          v21 = v7[v32++ + 12];
          if (v21)
          {
            v8 = v32 + 3;
            goto LABEL_9;
          }
        }
        v8 = v33 - 1;
      }
    }
  }
  v19 = *(_QWORD *)(*(_QWORD *)(v0 + 96) - 8);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v19 + 56))(*(_QWORD *)(v0 + 120), 1, 1);
  v10 = 0;
LABEL_12:
  *(_QWORD *)(v0 + 168) = v8;
  *(_QWORD *)(v0 + 176) = v10;
  v22 = *(_QWORD *)(v0 + 128);
  v23 = *(_QWORD *)(v0 + 96);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 32))(v22, *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v22, 1, v23) == 1)
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v25 = *(_QWORD *)(v0 + 128);
    v26 = *(_QWORD *)(v0 + 88);
    v27 = *(_QWORD *)(v0 + 96);
    v28 = *(_QWORD *)(v0 + 72);
    v29 = *(_QWORD *)(v0 + 80);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v26, v25 + *(int *)(v27 + 48), v28);
    v30 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 16);
    v36 = (uint64_t (*)(_QWORD, _QWORD, uint64_t))(**(int **)(v30 + 16) + *(_QWORD *)(v30 + 16));
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v31;
    *v31 = v0;
    v31[1] = sub_24600A0C4;
    return v36(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 72), v30);
  }
}

uint64_t sub_24600A0C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24600A124()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  int64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t (*v31)(_QWORD, _QWORD, uint64_t);

  result = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  v3 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 176);
  if (v2)
  {
    v4 = (v2 - 1) & v2;
    v5 = __clz(__rbit64(v2)) | (v3 << 6);
    v6 = *(_QWORD *)(v0 + 160);
LABEL_3:
    v7 = *(char **)(v0 + 120);
    v8 = *(_QWORD *)(v0 + 96);
    v9 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 80);
    v11 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 24 * v5);
    v12 = *v11;
    v13 = v11[1];
    v14 = v11[2];
    *(_QWORD *)v7 = v12;
    *((_QWORD *)v7 + 1) = v13;
    *((_QWORD *)v7 + 2) = v14;
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(&v7[*(int *)(v8 + 48)], *(_QWORD *)(v6 + 56) + *(_QWORD *)(v10 + 72) * v5, v9);
    v15 = *(_QWORD *)(v8 - 8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v8);
    swift_bridgeObjectRetain();
    goto LABEL_19;
  }
  v16 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  v17 = (unint64_t)((1 << *(_BYTE *)(v0 + 200)) + 63) >> 6;
  if (v16 < v17)
  {
    v6 = *(_QWORD *)(v0 + 160);
    v18 = v6 + 64;
    v19 = *(_QWORD *)(v6 + 64 + 8 * v16);
    if (v19)
    {
LABEL_7:
      v4 = (v19 - 1) & v19;
      v5 = __clz(__rbit64(v19)) + (v16 << 6);
      v3 = v16;
      goto LABEL_3;
    }
    v20 = v3 + 2;
    ++v3;
    if (v16 + 1 < v17)
    {
      v19 = *(_QWORD *)(v18 + 8 * v20);
      if (v19)
      {
        ++v16;
        goto LABEL_7;
      }
      v21 = v16 + 2;
      v3 = v16 + 1;
      if (v16 + 2 < v17)
      {
        v19 = *(_QWORD *)(v18 + 8 * v21);
        if (v19)
        {
          v16 += 2;
          goto LABEL_7;
        }
        while (1)
        {
          v16 = v21 + 1;
          if (__OFADD__(v21, 1))
            break;
          if (v16 >= v17)
          {
            v3 = v17 - 1;
            goto LABEL_18;
          }
          v19 = *(_QWORD *)(v18 + 8 * v16);
          ++v21;
          if (v19)
            goto LABEL_7;
        }
LABEL_23:
        __break(1u);
        return result;
      }
    }
  }
LABEL_18:
  v15 = *(_QWORD *)(*(_QWORD *)(v0 + 96) - 8);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v15 + 56))(*(_QWORD *)(v0 + 120), 1, 1);
  v4 = 0;
LABEL_19:
  *(_QWORD *)(v0 + 168) = v3;
  *(_QWORD *)(v0 + 176) = v4;
  v22 = *(_QWORD *)(v0 + 128);
  v23 = *(_QWORD *)(v0 + 96);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 32))(v22, *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v22, 1, v23) == 1)
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v24 = *(_QWORD *)(v0 + 128);
    v25 = *(_QWORD *)(v0 + 88);
    v26 = *(_QWORD *)(v0 + 96);
    v27 = *(_QWORD *)(v0 + 72);
    v28 = *(_QWORD *)(v0 + 80);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v25, v24 + *(int *)(v26 + 48), v27);
    v29 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 16);
    v31 = (uint64_t (*)(_QWORD, _QWORD, uint64_t))(**(int **)(v29 + 16) + *(_QWORD *)(v29 + 16));
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v30;
    *v30 = v0;
    v30[1] = sub_24600A0C4;
    return v31(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 72), v29);
  }
}

uint64_t sub_24600A3FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24600A480(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245FFA8F0;
  return sub_246009C90(a1);
}

uint64_t sub_24600A4D0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_24600A5A4()
{
  uint64_t v0;

  v0 = sub_246017CC8();
  __swift_allocate_value_buffer(v0, qword_25753AAA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25753AAA0);
  return sub_246017CBC();
}

uint64_t sub_24600A618()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 112);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v1, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 144), v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24600A6D8()
{
  sub_24600A618();
  return swift_deallocClassInstance();
}

void type metadata accessor for HostingGroupController()
{
  JUMPOUT(0x24954D080);
}

uint64_t sub_24600A708(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD, uint64_t, uint64_t, uint64_t);
  char v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unsigned int v22;
  uint64_t v23;

  v22 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 88);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v19 = v6;
  v20 = v2;
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = v8;
  *(_BYTE *)(v2 + v8[15]) = v9;
  v10 = (uint64_t *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 152));
  swift_beginAccess();
  v11 = *v10;
  v12 = swift_bridgeObjectRetain();
  if (!MEMORY[0x24954C588](v12, v4))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v21[12] + 8) + 8))(v22, a2, v21[10]);
  }
  v13 = 0;
  v14 = *(_QWORD *)(v21[13] + 8);
  v15 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v14 + 8);
  while (1)
  {
    v16 = sub_246017D88();
    sub_246017D64();
    if ((v16 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, v11+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v13, v4);
      v17 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_10;
      goto LABEL_5;
    }
    result = sub_246018028();
    if (v19 != 8)
      break;
    v23 = result;
    (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 16))(v7, &v23, v4);
    swift_unknownObjectRelease();
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
LABEL_5:
    v15(v22, a2, v4, v14);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    ++v13;
    if (v17 == MEMORY[0x24954C588](v11, v4))
      goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_24600A904(uint64_t a1, uint64_t a2)
{
  return sub_24600A708(a1, a2);
}

uint64_t sub_24600A924(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2[5] = a1;
  v2[6] = v1;
  v2[7] = *v1;
  v2[8] = sub_246017E00();
  v2[9] = sub_246017DF4();
  v2[10] = sub_246017DC4();
  v2[11] = v3;
  return swift_task_switch();
}

uint64_t sub_24600A99C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[5];
  v2 = v0[6];
  v3 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 112);
  swift_beginAccess();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 24))(v3, v1, AssociatedTypeWitness);
  swift_endAccess();
  v0[12] = sub_246017DF4();
  v5 = swift_task_alloc();
  v0[13] = v5;
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[14] = v6;
  *v6 = v0;
  v6[1] = sub_24600AAB4;
  return sub_24601804C();
}

uint64_t sub_24600AAB4()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24600AB1C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24600AB50(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[19] = a3;
  v4[20] = a4;
  v4[18] = a2;
  v4[21] = *a3;
  v4[22] = sub_246017E00();
  v4[23] = sub_246017DF4();
  v4[24] = sub_246017DC4();
  v4[25] = v5;
  return swift_task_switch();
}

uint64_t sub_24600ABCC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t result;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v1 = v0[20];
  v2 = (_QWORD *)v0[21];
  v60 = v0[19];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  v3 = swift_task_alloc();
  v63 = sub_246017E18();
  v56 = *(_QWORD *)(v63 - 8);
  v55 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56);
  v55(v3, 1, 1, v63);
  v4 = v2[12];
  v5 = v2[10];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = swift_task_alloc();
  v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v52(v9, v1, AssociatedTypeWitness);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v57 = *(unsigned __int8 *)(v7 + 80);
  v58 = v8;
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = 0;
  *((_QWORD *)v11 + 3) = 0;
  v53 = v5;
  v54 = v4;
  *((_QWORD *)v11 + 4) = v5;
  v12 = v2[11];
  *((_QWORD *)v11 + 5) = v12;
  *((_QWORD *)v11 + 6) = v4;
  v51 = v2[13];
  *((_QWORD *)v11 + 7) = v51;
  *((_QWORD *)v11 + 8) = v60;
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 32);
  v50(&v11[v10], v9, AssociatedTypeWitness);
  swift_task_dealloc();
  swift_retain();
  sub_24600B738(v3, (uint64_t)&unk_257538C60, (uint64_t)v11);
  sub_2460007E4(v3);
  swift_task_dealloc();
  v13 = (uint64_t *)(v60 + *(_QWORD *)(*(_QWORD *)v60 + 152));
  swift_beginAccess();
  v14 = *v13;
  v15 = *(_QWORD *)(v12 - 8);
  v42 = *(_QWORD *)(v15 + 64);
  v16 = swift_task_alloc();
  v17 = swift_bridgeObjectRetain();
  if (MEMORY[0x24954C588](v17, v12))
  {
    v18 = 0;
    v43 = v0 + 7;
    v41 = v0 + 17;
    v44 = v58 + 7;
    v48 = v12;
    v49 = v0;
    v46 = v15;
    v47 = v14;
    v45 = v16;
    do
    {
      v19 = sub_246017D88();
      sub_246017D64();
      if ((v19 & 1) != 0)
      {
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 16))(v16, v14+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v18, v12);
        v20 = v18 + 1;
        if (__OFADD__(v18, 1))
          goto LABEL_17;
      }
      else
      {
        result = sub_246018028();
        if (v42 != 8)
        {
          __break(1u);
          return result;
        }
        *v41 = result;
        (*(void (**)(uint64_t))(v15 + 16))(v16);
        swift_unknownObjectRelease();
        v20 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_17:
          __break(1u);
          break;
        }
      }
      v61 = v20;
      v62 = v18;
      v21 = v0[20];
      v59 = v0[19];
      v22 = swift_task_alloc();
      v55(v22, 1, 1, v63);
      v23 = swift_task_alloc();
      v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
      v24(v23, v16, v12);
      v25 = swift_task_alloc();
      v52(v25, v21, AssociatedTypeWitness);
      v26 = (*(unsigned __int8 *)(v15 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      v27 = (v42 + v57 + v26) & ~v57;
      v28 = (char *)swift_allocObject();
      *((_QWORD *)v28 + 2) = 0;
      *((_QWORD *)v28 + 3) = 0;
      *((_QWORD *)v28 + 4) = v53;
      *((_QWORD *)v28 + 5) = v12;
      *((_QWORD *)v28 + 6) = v54;
      *((_QWORD *)v28 + 7) = v51;
      v24((uint64_t)&v28[v26], v23, v12);
      v50(&v28[v27], v25, AssociatedTypeWitness);
      *(_QWORD *)&v28[(v44 + v27) & 0xFFFFFFFFFFFFFFF8] = v59;
      swift_task_dealloc();
      swift_task_dealloc();
      v29 = swift_task_alloc();
      sub_24600C170(v22, v29);
      LODWORD(v25) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v29, 1, v63);
      swift_retain();
      if ((_DWORD)v25 == 1)
      {
        sub_2460007E4(v29);
      }
      else
      {
        sub_246017E0C();
        (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v29, v63);
      }
      swift_task_dealloc();
      v12 = v48;
      v0 = v49;
      v15 = v46;
      if (*((_QWORD *)v28 + 2))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v30 = sub_246017DC4();
        v32 = v31;
        swift_unknownObjectRelease();
      }
      else
      {
        v30 = 0;
        v32 = 0;
      }
      v33 = *(_QWORD *)v49[18];
      v34 = swift_allocObject();
      *(_QWORD *)(v34 + 16) = &unk_257538C78;
      *(_QWORD *)(v34 + 24) = v28;
      v35 = (_QWORD *)(v32 | v30);
      if (v32 | v30)
      {
        v35 = v43;
        *v43 = 0;
        v43[1] = 0;
        v49[9] = v30;
        v49[10] = v32;
      }
      v14 = v47;
      v16 = v45;
      v49[14] = 1;
      v49[15] = v35;
      v49[16] = v33;
      swift_task_create();
      swift_release();
      sub_2460007E4(v22);
      swift_task_dealloc();
      v18 = v62 + 1;
    }
    while (v61 != MEMORY[0x24954C588](v47, v48));
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  v0[26] = sub_246017DF4();
  if (__isPlatformVersionAtLeast(2, 18, 0, 0))
  {
    v37 = (_QWORD *)swift_task_alloc();
    v0[27] = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F90);
    *v37 = v0;
    v37[1] = sub_24600B240;
    return sub_246017DE8();
  }
  else
  {
    if (v0[26])
    {
      swift_getObjectType();
      v38 = sub_246017DC4();
      v40 = v39;
    }
    else
    {
      v38 = 0;
      v40 = 0;
    }
    v0[28] = v38;
    v0[29] = v40;
    return swift_task_switch();
  }
}

uint64_t sub_24600B240()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_24600B294()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24600B2C4()
{
  return swift_taskGroup_wait_next_throwing();
}

uint64_t sub_24600B2E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 240) = v0;
  if (!v0)
    *(_BYTE *)(v1 + 249) = *(_BYTE *)(v1 + 248);
  return swift_task_switch();
}

uint64_t sub_24600B310()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (*(_BYTE *)(v0 + 249) == 1)
  {
    swift_release();
  }
  else
  {
    if (*(_QWORD *)(v0 + 208))
    {
      swift_getObjectType();
      v1 = sub_246017DC4();
      v3 = v2;
    }
    else
    {
      v1 = 0;
      v3 = 0;
    }
    *(_QWORD *)(v0 + 224) = v1;
    *(_QWORD *)(v0 + 232) = v3;
  }
  return swift_task_switch();
}

uint64_t sub_24600B398()
{
  return swift_unexpectedError();
}

uint64_t sub_24600B3B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v5 + 32) = a4;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 96) + 16);
  v8 = *(_QWORD *)(*(_QWORD *)a4 + 80);
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v7 + 16) + *(_QWORD *)(v7 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 40) = v9;
  *v9 = v5;
  v9[1] = sub_24600B440;
  return v11(a5, v8, v7);
}

uint64_t sub_24600B440()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24600B4AC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *log;
  _QWORD *v18;
  os_log_type_t type;
  uint64_t v20;
  uint64_t v21;

  if (qword_257537C20 != -1)
    swift_once();
  v1 = *(void **)(v0 + 48);
  v2 = sub_246017CC8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25753AAA0);
  v3 = v1;
  v4 = v1;
  swift_retain();
  v5 = sub_246017CB0();
  v6 = sub_246017EF0();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 48);
  v9 = *(_QWORD *)(v0 + 32);
  if (v7)
  {
    type = v6;
    v10 = swift_slowAlloc();
    v18 = (_QWORD *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v21 = v20;
    *(_DWORD *)v10 = 136446466;
    v11 = (uint64_t *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 136));
    log = v5;
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_246013004(v12, v13, &v21);
    sub_246017F68();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2114;
    v14 = v8;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v15;
    sub_246017F68();
    *v18 = v15;

    _os_log_impl(&dword_245FEA000, log, type, "%{public}s: error updating presenter: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v20, -1, -1);
    MEMORY[0x24954D194](v10, -1, -1);

  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24600B738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];
  _QWORD v21[4];

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24600C170(a1, (uint64_t)v10);
  v11 = sub_246017E18();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_2460007E4((uint64_t)v10);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_246017DC4();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_246017E0C();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_24600B8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v6 + 32) = a6;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a6 + 104) + 16);
  v9 = *(_QWORD *)(*(_QWORD *)a6 + 88);
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v8 + 16) + *(_QWORD *)(v8 + 16));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 40) = v10;
  *v10 = v6;
  v10[1] = sub_24600B960;
  return v12(a5, v9, v8);
}

uint64_t sub_24600B960()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24600B9CC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *log;
  _QWORD *v18;
  os_log_type_t type;
  uint64_t v20;
  uint64_t v21;

  if (qword_257537C20 != -1)
    swift_once();
  v1 = *(void **)(v0 + 48);
  v2 = sub_246017CC8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25753AAA0);
  v3 = v1;
  v4 = v1;
  swift_retain();
  v5 = sub_246017CB0();
  v6 = sub_246017EF0();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 48);
  v9 = *(_QWORD *)(v0 + 32);
  if (v7)
  {
    type = v6;
    v10 = swift_slowAlloc();
    v18 = (_QWORD *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v21 = v20;
    *(_DWORD *)v10 = 136446466;
    v11 = (uint64_t *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 136));
    log = v5;
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_246013004(v12, v13, &v21);
    sub_246017F68();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2114;
    v14 = v8;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v15;
    sub_246017F68();
    *v18 = v15;

    _os_log_impl(&dword_245FEA000, log, type, "%{public}s: error updating presentable: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v20, -1, -1);
    MEMORY[0x24954D194](v10, -1, -1);

  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24600BC58(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245FFA8F0;
  return sub_24600A924(a1);
}

uint64_t sub_24600BCA8(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 104);
}

uint64_t sub_24600BCB0(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24954D0EC]("i+p\v\bh");
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24600BCDC(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_24600BCFC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24600BD1C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24600BD80;
  return v6(a1);
}

uint64_t sub_24600BD80()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24600BDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v7 = *(_QWORD **)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_245FFA8F0;
  return sub_24600AB50(a1, a2, v7, v6);
}

uint64_t sub_24600BE38()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  unint64_t v3;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_24600BED0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[8];
  v8 = (uint64_t)v1 + ((v4 + 72) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_246000888;
  return sub_24600B3B4(a1, v5, v6, v7, v8);
}

uint64_t sub_24600BF80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, AssociatedTypeWitness);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24600C060()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);

  v2 = ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 40) - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 40) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 40) - 8) + 64);
  v3 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v4 = (v2 + *(unsigned __int8 *)(v3 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v0 + v4;
  v6 = *(uint64_t **)(v0 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_246000888;
  v7[4] = v6;
  v8 = *v6;
  v9 = *(_QWORD *)(*(_QWORD *)(*v6 + 104) + 16);
  v10 = *(_QWORD *)(v8 + 88);
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v9 + 16) + *(_QWORD *)(v9 + 16));
  v11 = (_QWORD *)swift_task_alloc();
  v7[5] = v11;
  *v11 = v7;
  v11[1] = sub_24600B960;
  return v13(v5, v10, v9);
}

uint64_t sub_24600C170(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24600C1B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24600C1DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_246000888;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257538C70 + dword_257538C70))(a1, v4);
}

uint64_t sub_24600C24C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245FFA8F0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257538C70 + dword_257538C70))(a1, v4);
}

uint64_t sub_24600C2C0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_24600C33C()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96));
  return v0;
}

uint64_t sub_24600C36C()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RecursiveDisplayBlanker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RecursiveDisplayBlanker);
}

uint64_t sub_24600C3B4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t result;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 104);
  v3 = *(uint64_t *)((char *)v0 + v2);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(uint64_t *)((char *)v0 + v2) = v5;
    if (v5 == 1)
      return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v1 + 88) + 24))(*(_QWORD *)(v1 + 80));
  }
  return result;
}

uint64_t sub_24600C408()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t result;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 104);
  v3 = *(uint64_t *)((char *)v0 + v2);
  v4 = __OFSUB__(v3, 1);
  v5 = v3 - 1;
  if (v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(uint64_t *)((char *)v0 + v2) = v5;
  if (v5 < 0)
  {
LABEL_7:
    result = sub_246018070();
    __break(1u);
    return result;
  }
  if (!v5)
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v1 + 88) + 32))(*(_QWORD *)(v1 + 80));
  return result;
}

uint64_t sub_24600C4B0(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v4 = *v1;
  v2[2] = sub_246017E00();
  v2[3] = sub_246017DF4();
  v5 = *(_QWORD *)(v4 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)(v4 + 88) + 8);
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v6 + 16) + *(_QWORD *)(v6 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  v2[4] = v7;
  *v7 = v2;
  v7[1] = sub_24600C554;
  return v9(a1, v5, v6);
}

uint64_t sub_24600C554()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_246017DC4();
  return swift_task_switch();
}

uint64_t sub_24600C5DC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24600C610()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24600C644()
{
  return sub_24600C3B4();
}

uint64_t sub_24600C664()
{
  return sub_24600C408();
}

uint64_t sub_24600C684(uint64_t a1)
{
  MEMORY[0x24954D0EC](&unk_24601B034, a1);
  return sub_246015738();
}

uint64_t sub_24600C6C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245FFA8F0;
  return sub_24600C4B0(a1);
}

uint64_t sub_24600C710(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x24954D0EC](&unk_24601AFF0);
  result = MEMORY[0x24954D0EC](&unk_24601B00C, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24600C754(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = sub_246017E00();
  v2[5] = sub_246017DF4();
  v2[6] = sub_246017DC4();
  v2[7] = v3;
  return swift_task_switch();
}

uint64_t sub_24600C7C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  __int128 v4;

  v4 = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 64) = sub_246017DF4();
  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *(_OWORD *)(v1 + 16) = v4;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  *v2 = v0;
  v2[1] = sub_24600C880;
  return sub_2460180F4();
}

uint64_t sub_24600C880()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24600C8E8()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_24600C918(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257538D40);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_24600CAB4;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24600CAF4;
  aBlock[3] = &block_descriptor_2;
  v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_updateTransformsWithCompletion_, v9);
  _Block_release(v9);
}

void sub_24600CA48(uint64_t a1)
{
  uint64_t v1;

  sub_24600C918(a1, *(void **)(v1 + 24));
}

uint64_t sub_24600CA50()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257538D40);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_24600CAB4()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257538D40);
  return sub_246017DDC();
}

uint64_t sub_24600CAF4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_24600CB38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 80) = 0;
  *(_QWORD *)(v5 + 88) = 0;
  sub_246018010();
  sub_246017D28();
  sub_245FFC180(0, &qword_257538FD8);
  sub_246018058();
  sub_246017D28();
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0xE000000000000000;
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 40) = a2;
  *(_QWORD *)(v5 + 48) = a3;
  *(_QWORD *)(v5 + 56) = a4;
  *(_BYTE *)(v5 + 64) = 1;
  *(_QWORD *)(v5 + 72) = a5;
  return v5;
}

uint64_t sub_24600CC34()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_246000888;
  return sub_24600CC7C();
}

uint64_t sub_24600CC7C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[17] = v0;
  v2 = sub_246017CC8();
  v1[18] = v2;
  v1[19] = *(_QWORD *)(v2 - 8);
  v1[20] = swift_task_alloc();
  v1[21] = sub_246017E00();
  v1[22] = sub_246017DF4();
  v1[23] = sub_246017DC4();
  v1[24] = v3;
  return swift_task_switch();
}

uint64_t sub_24600CD14()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 136);
  *(_BYTE *)(v0 + 449) = *(_BYTE *)(v1 + 64);
  v2 = *(void **)(v1 + 72);
  *(_QWORD *)(v0 + 200) = v2;
  v3 = v2;
  *(_QWORD *)(v0 + 208) = sub_246017DF4();
  *(_QWORD *)(v0 + 216) = sub_246017DF4();
  *(_QWORD *)(v0 + 224) = sub_246017DC4();
  *(_QWORD *)(v0 + 232) = v4;
  return swift_task_switch();
}

uint64_t sub_24600CD94()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 240) = sub_246017DF4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v1;
  *v1 = v0;
  v1[1] = sub_24600CE30;
  return sub_2460180F4();
}

uint64_t sub_24600CE30()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_24600CE84()
{
  uint64_t v0;

  swift_release();
  swift_release();
  *(_BYTE *)(v0 + 450) = *(_BYTE *)(v0 + 448);
  return swift_task_switch();
}

uint64_t sub_24600CECC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;

  if (*(_BYTE *)(v0 + 450) != 1)
  {
    swift_release();
    if (qword_257537BD8 != -1)
      swift_once();
    __swift_project_value_buffer(*(_QWORD *)(v0 + 144), (uint64_t)qword_25753AA68);
    swift_retain_n();
    v5 = sub_246017CB0();
    v6 = sub_246017EE4();
    v7 = os_log_type_enabled(v5, v6);
    v8 = *(void **)(v0 + 200);
    v9 = *(_QWORD *)(v0 + 136);
    if (v7)
    {
      v49 = *(void **)(v0 + 200);
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v51 = v11;
      *(_DWORD *)v10 = 136446210;
      v13 = *(_QWORD *)(v9 + 16);
      v12 = *(_QWORD *)(v9 + 24);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 40) = sub_246013004(v13, v12, &v51);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_245FEA000, v5, v6, "%{public}s somebody requested an update after us. short-circuiting.", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954D194](v11, -1, -1);
      MEMORY[0x24954D194](v10, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    goto LABEL_19;
  }
  v1 = *(_QWORD *)(v0 + 136);
  result = swift_beginAccess();
  LODWORD(v3) = *(unsigned __int8 *)(v0 + 449);
  if (*(_QWORD *)(v1 + 88))
  {
    v4 = *(unsigned __int8 *)(v1 + 80);
    if ((_DWORD)v4 == (_DWORD)v3)
      goto LABEL_17;
  }
  else
  {
    if ((_DWORD)v3 == 1)
    {
LABEL_18:

      swift_release();
LABEL_19:
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v4 = 1;
  }
  result = sub_24600EA2C(*(unsigned __int8 *)(v0 + 449), (uint64_t)&unk_25171C5F8);
  v3 = *(unsigned __int8 *)(v0 + 449);
  if ((result & 1) != 0)
  {
    swift_release();
    sub_24600F69C(v4, v3);
    if (qword_257537BD8 != -1)
      swift_once();
    v14 = *(void **)(v0 + 200);
    v16 = *(_QWORD *)(v0 + 152);
    v15 = *(_QWORD *)(v0 + 160);
    v17 = *(_QWORD *)(v0 + 144);
    v18 = __swift_project_value_buffer(v17, (uint64_t)qword_25753AA68);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v18, v17);
    v19 = v14;
    swift_retain_n();
    v20 = v19;
    v21 = sub_246017CB0();
    v22 = sub_246017EFC();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = *(_QWORD *)(v0 + 136);
      v24 = swift_slowAlloc();
      v50 = swift_slowAlloc();
      v51 = v50;
      *(_DWORD *)v24 = 136446722;
      v26 = *(_QWORD *)(v23 + 16);
      v25 = *(_QWORD *)(v23 + 24);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 120) = sub_246013004(v26, v25, &v51);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release_n();
      v27 = 8 * (char)v4;
      v28 = *(_QWORD *)&aActive_4[v27];
      *(_WORD *)(v24 + 12) = 2082;
      v29 = *(void **)(v0 + 200);
      v30 = *(char *)(v0 + 449);
      *(_QWORD *)(v0 + 128) = sub_246013004(v28, *(_QWORD *)&aInactivediscon_2[v27 + 16], &v51);
      sub_246017F68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 22) = 2082;

      v31 = *(_QWORD *)&aActive_4[8 * v30];
      v32 = *(_QWORD *)&aInactivediscon_2[8 * v30 + 16];
      v33 = *(void **)(v0 + 200);
      v35 = *(_QWORD *)(v0 + 152);
      v34 = *(_QWORD *)(v0 + 160);
      v36 = *(_QWORD *)(v0 + 144);
      *(_QWORD *)(v0 + 88) = sub_246013004(v31, v32, &v51);
      sub_246017F68();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245FEA000, v21, v22, "%{public}s transitioning from %{public}s to %{public}s. short-circuiting update and telling coordinator directly", (uint8_t *)v24, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24954D194](v50, -1, -1);
      MEMORY[0x24954D194](v24, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
    }
    else
    {
      v45 = *(void **)(v0 + 200);
      v47 = *(_QWORD *)(v0 + 152);
      v46 = *(_QWORD *)(v0 + 160);
      v48 = *(_QWORD *)(v0 + 144);

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);

    }
    goto LABEL_19;
  }
LABEL_17:
  if ((_DWORD)v3)
    goto LABEL_18;
  v37 = *(_QWORD *)(*(_QWORD *)(v0 + 136) + 48);
  *(_QWORD *)(v0 + 256) = v37;
  v38 = *(_QWORD *)(v37 + 24);
  v39 = __OFADD__(v38, 1);
  v40 = v38 + 1;
  if (v39)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v37 + 24) = v40;
    if (v40 == 1)
      sub_246000E1C();
    v41 = *(_QWORD *)(v0 + 136);
    v42 = *(void **)(v41 + 72);
    *(_QWORD *)(v0 + 264) = v42;
    *(_QWORD *)(v0 + 272) = *(_QWORD *)(v41 + 32);
    v43 = v42;
    *(_QWORD *)(v0 + 280) = sub_246017DF4();
    *(_QWORD *)(v0 + 288) = sub_246017DC4();
    *(_QWORD *)(v0 + 296) = v44;
    return swift_task_switch();
  }
  return result;
}

uint64_t sub_24600D48C()
{
  uint64_t v0;
  id v1;
  id v2;
  char v3;
  uint64_t v4;

  v1 = sub_245FFC5C8(*(void **)(v0 + 264));
  *(_QWORD *)(v0 + 304) = v1;
  v2 = sub_245FFC4B8();
  sub_245FFC180(0, &qword_257538038);
  v3 = sub_246017F44();

  if ((v3 & 1) != 0)
  {

    swift_release();
  }
  else
  {
    *(_QWORD *)(v0 + 312) = sub_246017DF4();
    *(_QWORD *)(v0 + 320) = sub_246017DC4();
    *(_QWORD *)(v0 + 328) = v4;
  }
  return swift_task_switch();
}

uint64_t sub_24600D568()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(void **)(v0 + 304);
  v2 = *(void **)(v0 + 272);
  type metadata accessor for CADisplayActor();
  v3 = v2;
  v4 = v1;
  swift_initStaticObject();
  sub_245FFCC54();
  sub_246017DC4();
  return swift_task_switch();
}

uint64_t sub_24600D5EC()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 272), sel_setDisplayProperties_, *(_QWORD *)(v0 + 304));
  return swift_task_switch();
}

uint64_t sub_24600D630()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 272);

  swift_release();
  return swift_task_switch();
}

uint64_t sub_24600D678()
{
  uint64_t v0;

  swift_release();
  return swift_task_switch();
}

void sub_24600D6C4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  char v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_log_type_t type;
  uint64_t v40;
  uint64_t v41;

  v1 = *(_QWORD *)(v0 + 136);
  if (*(_BYTE *)(v1 + 64)
    || (v2 = *(void **)(v1 + 72),
        *(_QWORD *)(v0 + 336) = sub_245FFC180(0, qword_257538000),
        v3 = v2,
        v4 = sub_246017F44(),
        v3,
        (v4 & 1) == 0))
  {
    swift_release();
    if (qword_257537BD8 != -1)
      swift_once();
    v19 = *(void **)(v0 + 200);
    __swift_project_value_buffer(*(_QWORD *)(v0 + 144), (uint64_t)qword_25753AA68);
    swift_retain_n();
    v20 = v19;
    v21 = sub_246017CB0();
    v22 = sub_246017EFC();
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(void **)(v0 + 200);
    v25 = *(_QWORD *)(v0 + 136);
    if (v23)
    {
      type = v22;
      v26 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v41 = v40;
      *(_DWORD *)v26 = 136446722;
      v28 = *(_QWORD *)(v25 + 16);
      v27 = *(_QWORD *)(v25 + 24);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 56) = sub_246013004(v28, v27, &v41);
      sub_246017F68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2082;
      v29 = sub_246014170();
      *(_QWORD *)(v0 + 64) = sub_246013004(v29, v30, &v41);
      sub_246017F68();
      swift_bridgeObjectRelease();

      *(_WORD *)(v26 + 22) = 2082;
      v31 = *(id *)(v25 + 72);
      swift_release();
      v32 = sub_246014170();
      v34 = v33;

      *(_QWORD *)(v0 + 72) = sub_246013004(v32, v34, &v41);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_245FEA000, v21, type, "%{public}s early return post-display: updateContext changed from %{public}s to %{public}s", (uint8_t *)v26, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24954D194](v40, -1, -1);
      MEMORY[0x24954D194](v26, -1, -1);
    }
    else
    {
      swift_release_n();

    }
    v35 = *(_QWORD *)(v0 + 256);
    v36 = *(_QWORD *)(v35 + 24);
    v16 = __OFSUB__(v36, 1);
    v37 = v36 - 1;
    if (!v16)
    {
      *(_QWORD *)(v35 + 24) = v37;
      if ((v37 & 0x8000000000000000) == 0)
      {
        if (!v37)
          goto LABEL_11;
        goto LABEL_20;
      }
      goto LABEL_22;
    }
    __break(1u);
    goto LABEL_26;
  }
  v5 = *(_QWORD *)(v0 + 136);
  v6 = *(void **)(v5 + 88);
  if (!v6)
  {
LABEL_24:
    *(_QWORD *)(v0 + 344) = *(_QWORD *)(v5 + 40);
    *(_QWORD *)(v0 + 352) = sub_246017DF4();
    *(_QWORD *)(v0 + 360) = sub_246017DC4();
    *(_QWORD *)(v0 + 368) = v38;
    swift_task_switch();
    return;
  }
  v7 = *(id *)(v0 + 200);
  v8 = v6;
  v9 = sub_246017F44();

  if ((v9 & 1) == 0)
  {
    v5 = *(_QWORD *)(v0 + 136);
    goto LABEL_24;
  }
  swift_release();
  v10 = *(_QWORD *)(v0 + 136);
  v11 = *(void **)(v10 + 88);
  if (!v11 || *(_BYTE *)(v10 + 80))
  {
    sub_24600F69C(1, 0);
    v11 = *(void **)(v10 + 88);
    v10 = *(_QWORD *)(v0 + 136);
  }
  v12 = *(_QWORD *)(v0 + 256);
  v13 = *(void **)(v0 + 200);
  *(_QWORD *)(v10 + 80) = 0;
  *(_QWORD *)(v10 + 88) = v13;
  v14 = v13;

  v15 = *(_QWORD *)(v12 + 24);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (!v16)
  {
    *(_QWORD *)(*(_QWORD *)(v0 + 256) + 24) = v17;
    if ((v17 & 0x8000000000000000) == 0)
    {
      if (!v17)
      {
LABEL_11:
        v18 = *(void **)(v0 + 200);
        sub_246000E34();
LABEL_21:

        swift_task_dealloc();
        (*(void (**)(void))(v0 + 8))();
        return;
      }
LABEL_20:
      v18 = *(void **)(v0 + 200);
      goto LABEL_21;
    }
LABEL_22:
    sub_246018070();
    return;
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_24600DB48()
{
  uint64_t v0;
  uint64_t ObjectType;
  _QWORD *v2;

  ObjectType = swift_getObjectType();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 376) = v2;
  *v2 = v0;
  v2[1] = sub_24600DBAC;
  return sub_24600C754(ObjectType);
}

uint64_t sub_24600DBAC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24600DBF8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(v0 + 344);
  swift_release();
  v2 = *(void **)(v1 + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration);
  *(_QWORD *)(v0 + 384) = v2;
  v3 = v2;
  return swift_task_switch();
}

void sub_24600DC4C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  char v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;

  v1 = *(_QWORD *)(v0 + 136);
  if (*(_BYTE *)(v1 + 64)
    || (v2 = *(id *)(v1 + 72), v3 = sub_246017F44(), v2, (v3 & 1) == 0))
  {
    swift_release();
    if (qword_257537BD8 != -1)
      swift_once();
    v5 = *(void **)(v0 + 200);
    __swift_project_value_buffer(*(_QWORD *)(v0 + 144), (uint64_t)qword_25753AA68);
    swift_retain_n();
    v6 = v5;
    v7 = sub_246017CB0();
    v8 = sub_246017EFC();
    v9 = os_log_type_enabled(v7, v8);
    v10 = *(void **)(v0 + 384);
    v11 = *(void **)(v0 + 200);
    v12 = *(_QWORD *)(v0 + 136);
    if (v9)
    {
      v28 = *(void **)(v0 + 384);
      v13 = swift_slowAlloc();
      v27 = swift_slowAlloc();
      v29 = v27;
      *(_DWORD *)v13 = 136446722;
      v14 = *(_QWORD *)(v12 + 16);
      v15 = *(_QWORD *)(v12 + 24);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 80) = sub_246013004(v14, v15, &v29);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release();
      *(_WORD *)(v13 + 12) = 2082;
      v16 = sub_246014170();
      *(_QWORD *)(v0 + 48) = sub_246013004(v16, v17, &v29);
      sub_246017F68();
      swift_bridgeObjectRelease();

      *(_WORD *)(v13 + 22) = 2082;
      v18 = *(id *)(v12 + 72);
      swift_release();
      v19 = sub_246014170();
      v21 = v20;

      *(_QWORD *)(v0 + 96) = sub_246013004(v19, v21, &v29);
      sub_246017F68();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_245FEA000, v7, v8, "%{public}s early return post-UpdateTransforms: updateContext changed from %{public}s to %{public}s", (uint8_t *)v13, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24954D194](v27, -1, -1);
      MEMORY[0x24954D194](v13, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v22 = *(_QWORD *)(v0 + 256);
    v23 = *(_QWORD *)(v22 + 24);
    v24 = __OFSUB__(v23, 1);
    v25 = v23 - 1;
    if (v24)
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v22 + 24) = v25;
      if (v25 < 0)
      {
        sub_246018070();
      }
      else
      {
        v26 = *(void **)(v0 + 200);
        if (!v25)
          sub_246000E34();

        swift_task_dealloc();
        (*(void (**)(void))(v0 + 8))();
      }
    }
  }
  else
  {
    *(_QWORD *)(v0 + 392) = sub_246017DF4();
    *(_QWORD *)(v0 + 400) = sub_246017DC4();
    *(_QWORD *)(v0 + 408) = v4;
    swift_task_switch();
  }
}

uint64_t sub_24600E020()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 416) = v1;
  *v1 = v0;
  v1[1] = sub_24600E074;
  return sub_246001200(*(_QWORD *)(v0 + 384));
}

uint64_t sub_24600E074()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 424) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24600E0D4()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_24600E10C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t);

  v3 = (uint64_t (*)(uint64_t))((char *)&dword_257538F48 + dword_257538F48);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 432) = v1;
  *v1 = v0;
  v1[1] = sub_24600E174;
  return v3(*(_QWORD *)(v0 + 384));
}

uint64_t sub_24600E174()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 440) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24600E1D4()
{
  swift_release();
  return swift_task_switch();
}

void sub_24600E20C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v1 = *(void **)(v0 + 424);
  swift_release();
  if (qword_257537BD8 != -1)
    swift_once();
  __swift_project_value_buffer(*(_QWORD *)(v0 + 144), (uint64_t)qword_25753AA68);
  swift_retain();
  v2 = v1;
  swift_retain();
  v3 = v1;
  v4 = sub_246017CB0();
  v5 = sub_246017EF0();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 384);
  v8 = *(_QWORD *)(v0 + 136);
  if (v6)
  {
    v25 = *(void **)(v0 + 384);
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v26 = v24;
    *(_DWORD *)v9 = 136446466;
    v12 = *(_QWORD *)(v8 + 16);
    v11 = *(_QWORD *)(v8 + 24);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 104) = sub_246013004(v12, v11, &v26);
    sub_246017F68();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v9 + 12) = 2112;
    v13 = v1;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 112) = v14;
    sub_246017F68();
    *v10 = v14;

    _os_log_impl(&dword_245FEA000, v4, v5, "%{public}s failed updating blanker and coordinator: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v24, -1, -1);
    MEMORY[0x24954D194](v9, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v15 = *(_QWORD *)(v0 + 136);
  v16 = *(void **)(v15 + 88);
  if (!v16 || *(_BYTE *)(v15 + 80))
  {
    sub_24600F69C(1, 0);
    v16 = *(void **)(v15 + 88);
    v15 = *(_QWORD *)(v0 + 136);
  }
  v17 = *(_QWORD *)(v0 + 256);
  v18 = *(void **)(v0 + 200);
  *(_QWORD *)(v15 + 80) = 0;
  *(_QWORD *)(v15 + 88) = v18;
  v19 = v18;

  v20 = *(_QWORD *)(v17 + 24);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(v0 + 256) + 24) = v22;
    if (v22 < 0)
    {
      sub_246018070();
    }
    else
    {
      v23 = *(void **)(v0 + 200);
      if (!v22)
        sub_246000E34();

      swift_task_dealloc();
      (*(void (**)(void))(v0 + 8))();
    }
  }
}

void sub_24600E58C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;

  v1 = *(void **)(v0 + 384);
  swift_release();

  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(void **)(v2 + 88);
  if (!v3 || *(_BYTE *)(v2 + 80))
  {
    sub_24600F69C(1, 0);
    v3 = *(void **)(v2 + 88);
    v2 = *(_QWORD *)(v0 + 136);
  }
  v4 = *(_QWORD *)(v0 + 256);
  v5 = *(void **)(v0 + 200);
  *(_QWORD *)(v2 + 80) = 0;
  *(_QWORD *)(v2 + 88) = v5;
  v6 = v5;

  v7 = *(_QWORD *)(v4 + 24);
  v8 = __OFSUB__(v7, 1);
  v9 = v7 - 1;
  if (v8)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(v0 + 256) + 24) = v9;
    if (v9 < 0)
    {
      sub_246018070();
    }
    else
    {
      v10 = *(void **)(v0 + 200);
      if (!v9)
        sub_246000E34();

      swift_task_dealloc();
      (*(void (**)(void))(v0 + 8))();
    }
  }
}

void sub_24600E6AC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v1 = *(void **)(v0 + 440);
  swift_release();
  if (qword_257537BD8 != -1)
    swift_once();
  __swift_project_value_buffer(*(_QWORD *)(v0 + 144), (uint64_t)qword_25753AA68);
  swift_retain();
  v2 = v1;
  swift_retain();
  v3 = v1;
  v4 = sub_246017CB0();
  v5 = sub_246017EF0();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 384);
  v8 = *(_QWORD *)(v0 + 136);
  if (v6)
  {
    v25 = *(void **)(v0 + 384);
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v26 = v24;
    *(_DWORD *)v9 = 136446466;
    v12 = *(_QWORD *)(v8 + 16);
    v11 = *(_QWORD *)(v8 + 24);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 104) = sub_246013004(v12, v11, &v26);
    sub_246017F68();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v9 + 12) = 2112;
    v13 = v1;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 112) = v14;
    sub_246017F68();
    *v10 = v14;

    _os_log_impl(&dword_245FEA000, v4, v5, "%{public}s failed updating blanker and coordinator: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v24, -1, -1);
    MEMORY[0x24954D194](v9, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v15 = *(_QWORD *)(v0 + 136);
  v16 = *(void **)(v15 + 88);
  if (!v16 || *(_BYTE *)(v15 + 80))
  {
    sub_24600F69C(1, 0);
    v16 = *(void **)(v15 + 88);
    v15 = *(_QWORD *)(v0 + 136);
  }
  v17 = *(_QWORD *)(v0 + 256);
  v18 = *(void **)(v0 + 200);
  *(_QWORD *)(v15 + 80) = 0;
  *(_QWORD *)(v15 + 88) = v18;
  v19 = v18;

  v20 = *(_QWORD *)(v17 + 24);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(v0 + 256) + 24) = v22;
    if (v22 < 0)
    {
      sub_246018070();
    }
    else
    {
      v23 = *(void **)(v0 + 200);
      if (!v22)
        sub_246000E34();

      swift_task_dealloc();
      (*(void (**)(void))(v0 + 8))();
    }
  }
}

BOOL sub_24600EA2C(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = result;
  if (*(_BYTE *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 33; ; ++i)
  {
    v5 = i - 31;
    if (__OFADD__(i - 32, 1))
      break;
    v6 = *(unsigned __int8 *)(a2 + i);
    result = v6 == v3;
    if (v6 == v3 || v5 == v2)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_24600EA8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_246007FC8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[5 * v8 + 4];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(qword_2575389E0);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_2460180AC();
  __break(1u);
  return result;
}

void sub_24600EBF4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  _QWORD *v7;
  id v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;

  v16 = a1;
  v2 = v1 + 16;
  swift_beginAccess();
  v3 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 16);
  if (v3)
  {
    v4 = 0;
    for (i = 72; ; i += 48)
    {
      v6 = v16;
      swift_beginAccess();
      v7 = *(_QWORD **)v2;
      v8 = v6;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)v2 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v7 = sub_246013814(v7);
        *(_QWORD *)v2 = v7;
      }
      if (v4 >= v7[2])
        break;
      sub_245FFB5BC(&v15, v8);
      swift_endAccess();

      if (v4 >= *(_QWORD *)(*(_QWORD *)v2 + 16))
        goto LABEL_10;
      ++v4;
      sub_246002560(*(_QWORD *)v2 + i - 40, (uint64_t)v12);
      v10 = v13;
      v11 = v14;
      __swift_project_boxed_opaque_existential_1(v12, v13);
      (*(void (**)(void **, uint64_t, uint64_t))(v11 + 32))(&v16, v10, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      if (v3 == v4)
        return;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
}

uint64_t sub_24600ED3C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[16] = a1;
  v2[17] = v1;
  sub_246017E00();
  v2[18] = sub_246017DF4();
  v2[19] = sub_246017DC4();
  v2[20] = v3;
  return swift_task_switch();
}

uint64_t sub_24600EDA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 136);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 168) = v2;
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 + 176) = v3;
  if (v3)
  {
    *(_QWORD *)(v0 + 184) = 0;
    v4 = v2 + 32;
    swift_bridgeObjectRetain();
    sub_246015570(v4, v0 + 16, &qword_257538FB0);
    sub_246002560(v0 + 16, v0 + 64);
    sub_2460155B4(v0 + 16, &qword_257538FB0);
    v5 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 96);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), v5);
    v7 = *(_QWORD *)(v6 + 16);
    v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v7 + 16) + *(_QWORD *)(v7 + 16));
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v8;
    *v8 = v0;
    v8[1] = sub_24600EECC;
    return v10(v0 + 128, v5, v7);
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_24600EECC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_24600EF38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 184) + 1;
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 184) + 1;
    *(_QWORD *)(v0 + 184) = v4;
    sub_246015570(*(_QWORD *)(v0 + 168) + 48 * v4 + 32, v0 + 16, &qword_257538FB0);
    sub_246002560(v0 + 16, v0 + 64);
    sub_2460155B4(v0 + 16, &qword_257538FB0);
    v5 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 96);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), v5);
    v7 = *(_QWORD *)(v6 + 16);
    v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v7 + 16) + *(_QWORD *)(v7 + 16));
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v8;
    *v8 = v0;
    v8[1] = sub_24600EECC;
    return v9(v0 + 128, v5, v7);
  }
}

uint64_t sub_24600F05C()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24600F09C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_24600F0BC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_24600F0F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_246017E18();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_246017E0C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2460155B4(a1, &qword_2575381A8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_246017DC4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_24600F244(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
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

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257538FE8);
  v2 = (_QWORD *)sub_2460180A0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    result = sub_246013828(v5, v6, v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 24 * result);
    *v11 = v5;
    v11[1] = v6;
    v11[2] = v8;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 4;
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

unint64_t sub_24600F378(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
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

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257538EE8);
  v2 = (_QWORD *)sub_2460180A0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_246013828(v5, v6, v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 24 * result);
    *v11 = v5;
    v11[1] = v6;
    v11[2] = v8;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 4;
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

uint64_t sub_24600F4AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v9;
  void (*v10)(uint64_t *__return_ptr, id *);
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  id v18[3];
  uint64_t v19;

  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v4 + 48) + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  sub_246013828(a2, a3, a4);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    v17 = a1;
    v10 = *(void (**)(uint64_t *__return_ptr, id *))(v4 + 16);
    v11 = *(_BYTE *)(v4 + 40);
    v18[0] = *(id *)(v4 + 32);
    v12 = v18[0];
    v10(&v19, v18);
    v13 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538E08);
    swift_allocObject();
    swift_bridgeObjectRetain();
    v14 = sub_24601486C(a2, a3, a4, v12, v11, v13);
    swift_bridgeObjectRelease();

    a1 = v17;
    swift_release();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *(_QWORD *)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0x8000000000000000;
    sub_246013CD8(v14, a2, a3, a4, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v4 + 48) = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    goto LABEL_6;
  }
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
LABEL_6:
  sub_2460100F8(a1);
  return swift_release();
}

uint64_t sub_24600F69C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  int64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  char isEscapingClosureAtFileLocation;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  unint64_t v43;
  int64_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD v50[3];
  uint64_t v51;
  uint64_t v52;
  uint64_t aBlock;
  uint64_t v54;
  void (*v55)(uint64_t, void *);
  void *v56;
  void *v57;
  uint64_t v58;

  v3 = a2;
  *(_BYTE *)(v2 + 40) = a2;
  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 48);
  v40 = v5 + 64;
  v6 = 1 << *(_BYTE *)(v5 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(v5 + 64);
  v41 = (unint64_t)(v6 + 63) >> 6;
  v42 = v5;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  v11 = (uint64_t *)&unk_257538FB0;
  v46 = v3;
  while (1)
  {
    if (v8)
    {
      v12 = __clz(__rbit64(v8));
      v13 = (v8 - 1) & v8;
      v44 = v10;
      v14 = v12 | (v10 << 6);
    }
    else
    {
      v15 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_49;
      if (v15 >= v41)
        return swift_release();
      v16 = *(_QWORD *)(v40 + 8 * v15);
      v17 = v10 + 1;
      if (!v16)
      {
        v17 = v10 + 2;
        if (v10 + 2 >= v41)
          return swift_release();
        v16 = *(_QWORD *)(v40 + 8 * v17);
        if (!v16)
        {
          v17 = v10 + 3;
          if (v10 + 3 >= v41)
            return swift_release();
          v16 = *(_QWORD *)(v40 + 8 * v17);
          if (!v16)
          {
            v18 = v10 + 4;
            if (v10 + 4 >= v41)
              return swift_release();
            v16 = *(_QWORD *)(v40 + 8 * v18);
            if (!v16)
            {
              while (1)
              {
                v17 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_50;
                if (v17 >= v41)
                  return swift_release();
                v16 = *(_QWORD *)(v40 + 8 * v17);
                ++v18;
                if (v16)
                  goto LABEL_21;
              }
            }
            v17 = v10 + 4;
          }
        }
      }
LABEL_21:
      v13 = (v16 - 1) & v16;
      v44 = v17;
      v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    v19 = *(_QWORD *)(*(_QWORD *)(v42 + 56) + 8 * v14);
    v45 = v19;
    swift_retain();
    *(_BYTE *)(v19 + 24) = v3;
    swift_beginAccess();
    v20 = *(_QWORD *)(v19 + 80);
    v43 = v13;
    if (v20 >> 62)
      break;
    v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v21)
      goto LABEL_24;
LABEL_41:
    swift_bridgeObjectRelease();
    v34 = *(_QWORD *)(v45 + 72);
    swift_beginAccess();
    v35 = *(_QWORD *)(v34 + 16);
    v36 = *(_QWORD *)(v35 + 16);
    if (v36)
    {
      v37 = v35 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_246015570(v37, (uint64_t)&aBlock, v11);
        sub_246002560((uint64_t)&aBlock, (uint64_t)v50);
        sub_2460155B4((uint64_t)&aBlock, v11);
        v39 = v51;
        v38 = v52;
        __swift_project_boxed_opaque_existential_1(v50, v51);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 + 8) + 8))(a1, v3, v39);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
        v37 += 48;
        --v36;
      }
      while (v36);
      swift_release();
      result = swift_bridgeObjectRelease();
    }
    else
    {
      result = swift_release();
    }
    v8 = v43;
    v10 = v44;
  }
  swift_bridgeObjectRetain();
  result = sub_24601807C();
  v21 = result;
  if (!result)
    goto LABEL_41;
LABEL_24:
  if (v21 < 1)
    goto LABEL_48;
  v22 = 0;
  v23 = v20 & 0xC000000000000001;
  v48 = v20;
  v49 = v20 & 0xC000000000000001;
  v47 = v21;
  while (2)
  {
    if (v23)
    {
      v24 = MEMORY[0x24954C81C](v22, v20);
      v25 = v3;
      if ((_BYTE)v3)
      {
LABEL_30:
        if (v25 == 1)
        {
          if (!(_BYTE)a1)
          {
            v26 = *(void **)(v24 + 32);
            v57 = sub_24600539C;
            v58 = 0;
            aBlock = MEMORY[0x24BDAC760];
            v54 = 1107296256;
            v55 = sub_246005E58;
            v56 = &block_descriptor_84;
            v27 = _Block_copy(&aBlock);
            swift_release();
            v28 = v26;
            v23 = v49;
            objc_msgSend(v28, sel_updateSettingsWithBlock_, v27);
            _Block_release(v27);
            result = swift_isEscapingClosureAtFileLocation();
            if ((result & 1) != 0)
              goto LABEL_47;
          }
        }
        else
        {
          objc_msgSend(*(id *)(v24 + 32), sel_invalidate);
        }
        goto LABEL_27;
      }
    }
    else
    {
      v24 = *(_QWORD *)(v20 + 8 * v22 + 32);
      swift_retain();
      v25 = v3;
      if ((_BYTE)v3)
        goto LABEL_30;
    }
    if (a1 != 1)
    {
LABEL_27:
      ++v22;
      *(_BYTE *)(v24 + 17) = v3;
      swift_release();
      if (v21 == v22)
        goto LABEL_41;
      continue;
    }
    break;
  }
  v29 = v11;
  v30 = *(void **)(v24 + 32);
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = sub_2460065A4;
  *(_QWORD *)(v31 + 24) = v24;
  v57 = sub_24601572C;
  v58 = v31;
  aBlock = MEMORY[0x24BDAC760];
  v54 = 1107296256;
  v55 = sub_246005E58;
  v56 = &block_descriptor_92;
  v32 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v30, sel_updateSettingsWithBlock_, v32);
  _Block_release(v32);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    if (*(_BYTE *)(v24 + 16) != 1)
    {
      (*(void (**)(void *))(v24 + 48))(v30);
      v23 = v49;
      *(_BYTE *)(v24 + 16) = 1;
    }
    swift_release();
    v11 = v29;
    v3 = v46;
    v21 = v47;
    v20 = v48;
    goto LABEL_27;
  }
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_24600FBD4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[9] = a1;
  v2[10] = v1;
  v2[11] = sub_246017E00();
  v2[12] = sub_246017DF4();
  v2[13] = sub_246017DC4();
  v2[14] = v3;
  return swift_task_switch();
}

uint64_t sub_24600FC44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 80);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v0 + 120) = v2;
  v3 = *(_BYTE *)(v2 + 32);
  *(_BYTE *)(v0 + 200) = v3;
  v4 = -1;
  v5 = -1 << v3;
  if (-(-1 << v3) < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(v2 + 64);
  v7 = (_QWORD *)swift_bridgeObjectRetain();
  if (v6)
  {
    v8 = 0;
    v9 = __clz(__rbit64(v6));
    v10 = (v6 - 1) & v6;
LABEL_5:
    *(_QWORD *)(v0 + 128) = v8;
    *(_QWORD *)(v0 + 136) = v10;
    v11 = *(_QWORD *)(v0 + 72);
    *(_QWORD *)(v0 + 144) = *(_QWORD *)(v7[7] + 8 * v9);
    swift_retain();
    *(_QWORD *)(v0 + 64) = v11;
    *(_QWORD *)(v0 + 152) = sub_246017DF4();
    *(_QWORD *)(v0 + 160) = sub_246017DC4();
    *(_QWORD *)(v0 + 168) = v12;
    return swift_task_switch();
  }
  v14 = 63 - v5;
  if ((unint64_t)(63 - v5) > 0x7F)
  {
    v15 = v7[9];
    if (v15)
    {
      v8 = 1;
LABEL_9:
      v10 = (v15 - 1) & v15;
      v9 = __clz(__rbit64(v15)) + (v8 << 6);
      goto LABEL_5;
    }
    if (v14 >= 0xC0)
    {
      v15 = v7[10];
      if (v15)
      {
        v8 = 2;
        goto LABEL_9;
      }
      if (v14 >= 0x100)
      {
        v15 = v7[11];
        if (v15)
        {
          v8 = 3;
          goto LABEL_9;
        }
        if (v14 >= 0x140)
        {
          v15 = v7[12];
          if (v15)
          {
            v8 = 4;
            goto LABEL_9;
          }
          v16 = 0;
          v17 = v14 >> 6;
          if (v17 <= 5)
            v17 = 5;
          v18 = v17 - 5;
          while (v18 != v16)
          {
            v15 = v7[v16++ + 13];
            if (v15)
            {
              v8 = v16 + 4;
              goto LABEL_9;
            }
          }
        }
      }
    }
  }
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24600FE00()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[18];
  swift_beginAccess();
  v2 = (void *)v0[8];
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = v2;
  v4 = v2;

  v0[22] = sub_246017DF4();
  v5 = swift_task_alloc();
  v0[23] = v5;
  *(_QWORD *)(v5 + 16) = v1;
  *(_QWORD *)(v5 + 24) = v0 + 8;
  v6 = (_QWORD *)swift_task_alloc();
  v0[24] = v6;
  *v6 = v0;
  v6[1] = sub_24600FED4;
  return sub_24601804C();
}

uint64_t sub_24600FED4()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24600FF3C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_24600FF74()
{
  uint64_t v0;
  uint64_t result;
  int64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;

  result = swift_release();
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 136);
  if (v3)
  {
    v4 = (v3 - 1) & v3;
    v5 = __clz(__rbit64(v3)) | (v2 << 6);
    result = *(_QWORD *)(v0 + 120);
LABEL_3:
    *(_QWORD *)(v0 + 128) = v2;
    *(_QWORD *)(v0 + 136) = v4;
    v6 = *(_QWORD *)(v0 + 72);
    *(_QWORD *)(v0 + 144) = *(_QWORD *)(*(_QWORD *)(result + 56) + 8 * v5);
    swift_retain();
    *(_QWORD *)(v0 + 64) = v6;
    *(_QWORD *)(v0 + 152) = sub_246017DF4();
    *(_QWORD *)(v0 + 160) = sub_246017DC4();
    *(_QWORD *)(v0 + 168) = v7;
    return swift_task_switch();
  }
  v8 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v9 = (unint64_t)((1 << *(_BYTE *)(v0 + 200)) + 63) >> 6;
    result = *(_QWORD *)(v0 + 120);
    if (v8 >= v9)
      goto LABEL_18;
    v10 = result + 64;
    v11 = *(_QWORD *)(result + 64 + 8 * v8);
    ++v2;
    if (v11)
    {
LABEL_7:
      v4 = (v11 - 1) & v11;
      v5 = __clz(__rbit64(v11)) + (v2 << 6);
      goto LABEL_3;
    }
    v2 = v8 + 1;
    if (v8 + 1 >= v9)
      goto LABEL_18;
    v11 = *(_QWORD *)(v10 + 8 * v2);
    if (v11)
      goto LABEL_7;
    v2 = v8 + 2;
    if (v8 + 2 >= v9)
      goto LABEL_18;
    v11 = *(_QWORD *)(v10 + 8 * v2);
    if (v11)
      goto LABEL_7;
    v12 = v8 + 3;
    if (v12 >= v9)
    {
LABEL_18:
      swift_release();
      swift_release();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v11 = *(_QWORD *)(v10 + 8 * v12);
    if (v11)
    {
      v2 = v12;
      goto LABEL_7;
    }
    while (1)
    {
      v2 = v12 + 1;
      if (__OFADD__(v12, 1))
        break;
      if (v2 >= v9)
        goto LABEL_18;
      v11 = *(_QWORD *)(v10 + 8 * v2);
      ++v12;
      if (v11)
        goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

void sub_2460100F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  id v6;
  id v7;

  v2 = v1;
  swift_beginAccess();
  v4 = swift_retain();
  MEMORY[0x24954C528](v4);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 80) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 80) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_246017D70();
  sub_246017D94();
  sub_246017D58();
  swift_endAccess();
  swift_beginAccess();
  v5 = *(_BYTE *)(v1 + 24);
  v6 = *(id *)(v2 + 16);
  sub_246006390(v5);

  v7 = *(id *)(a1 + 32);
  sub_24600EBF4(v7);

}

uint64_t sub_2460101DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[18] = a3;
  v4[19] = a4;
  v4[17] = a2;
  v4[20] = sub_246017E00();
  v4[21] = sub_246017DF4();
  v4[22] = sub_246017DC4();
  v4[23] = v5;
  return swift_task_switch();
}

uint64_t sub_246010250()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  void (*v34)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;

  v2 = v0[18];
  v1 = (void *)v0[19];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  v3 = swift_task_alloc();
  v4 = sub_246017E18();
  v35 = *(_QWORD *)(v4 - 8);
  v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56);
  v34(v3, 1, 1, v4);
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v2;
  v5[5] = v1;
  v6 = v1;
  swift_retain();
  sub_24600B738(v3, (uint64_t)&unk_257538F70, (uint64_t)v5);
  sub_2460155B4(v3, &qword_2575381A8);
  swift_task_dealloc();
  swift_beginAccess();
  v7 = *(_QWORD *)(v2 + 80);
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_24601807C();
    v8 = result;
    if (!result)
      goto LABEL_18;
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v8)
      goto LABEL_18;
  }
  if (v8 < 1)
  {
    __break(1u);
    return result;
  }
  v10 = 0;
  v29 = v0 + 7;
  v30 = v7 & 0xC000000000000001;
  v32 = v7;
  v33 = v0;
  v31 = v8;
  do
  {
    if (v30)
    {
      v11 = MEMORY[0x24954C81C](v10, v7);
    }
    else
    {
      v11 = *(_QWORD *)(v7 + 8 * v10 + 32);
      swift_retain();
    }
    v13 = v0[18];
    v12 = (void *)v0[19];
    v14 = swift_task_alloc();
    v34(v14, 1, 1, v4);
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v11;
    v15[5] = v12;
    v15[6] = v13;
    v16 = swift_task_alloc();
    v36 = v14;
    sub_246015570(v14, v16, &qword_2575381A8);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v16, 1, v4);
    v18 = v12;
    swift_retain();
    if (v17 == 1)
    {
      sub_2460155B4(v16, &qword_2575381A8);
    }
    else
    {
      sub_246017E0C();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v16, v4);
    }
    swift_task_dealloc();
    if (v15[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v19 = sub_246017DC4();
      v21 = v20;
      swift_unknownObjectRelease();
    }
    else
    {
      v19 = 0;
      v21 = 0;
    }
    v0 = v33;
    v22 = *(_QWORD *)v33[17];
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = &unk_257538F80;
    *(_QWORD *)(v23 + 24) = v15;
    v24 = (_QWORD *)(v21 | v19);
    if (v21 | v19)
    {
      v24 = v29;
      *v29 = 0;
      v29[1] = 0;
      v33[9] = v19;
      v33[10] = v21;
    }
    ++v10;
    v33[14] = 1;
    v33[15] = v24;
    v33[16] = v22;
    swift_task_create();
    swift_release();
    sub_2460155B4(v36, &qword_2575381A8);
    swift_task_dealloc();
    v7 = v32;
  }
  while (v31 != v10);
LABEL_18:
  swift_bridgeObjectRelease();
  v0[24] = sub_246017DF4();
  if (__isPlatformVersionAtLeast(2, 18, 0, 0))
  {
    v25 = (_QWORD *)swift_task_alloc();
    v0[25] = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F90);
    *v25 = v0;
    v25[1] = sub_2460106B8;
    return sub_246017DE8();
  }
  else
  {
    if (v0[24])
    {
      swift_getObjectType();
      v26 = sub_246017DC4();
      v28 = v27;
    }
    else
    {
      v26 = 0;
      v28 = 0;
    }
    v0[26] = v26;
    v0[27] = v28;
    return swift_task_switch();
  }
}

uint64_t sub_2460106B8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_24601070C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24601073C()
{
  return swift_taskGroup_wait_next_throwing();
}

uint64_t sub_246010758()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 224) = v0;
  if (!v0)
    *(_BYTE *)(v1 + 233) = *(_BYTE *)(v1 + 232);
  return swift_task_switch();
}

uint64_t sub_246010788()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (*(_BYTE *)(v0 + 233) == 1)
  {
    swift_release();
  }
  else
  {
    if (*(_QWORD *)(v0 + 192))
    {
      swift_getObjectType();
      v1 = sub_246017DC4();
      v3 = v2;
    }
    else
    {
      v1 = 0;
      v3 = 0;
    }
    *(_QWORD *)(v0 + 208) = v1;
    *(_QWORD *)(v0 + 216) = v3;
  }
  return swift_task_switch();
}

uint64_t sub_246010810()
{
  return swift_unexpectedError();
}

uint64_t sub_24601082C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = a5;
  return swift_task_switch();
}

uint64_t sub_246010844()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t);

  v3 = (uint64_t (*)(uint64_t))((char *)&dword_257538FA8 + dword_257538FA8);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_2460108AC;
  return v3(*(_QWORD *)(v0 + 40));
}

uint64_t sub_2460108AC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_246010918()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *log;
  _QWORD *v17;
  os_log_type_t type;
  uint64_t v19;
  uint64_t v20;

  if (qword_257537C20 != -1)
    swift_once();
  v1 = *(void **)(v0 + 56);
  v2 = sub_246017CC8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25753AAA0);
  v3 = v1;
  v4 = v1;
  swift_retain();
  v5 = sub_246017CB0();
  v6 = sub_246017EF0();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 56);
  v9 = *(_QWORD *)(v0 + 32);
  if (v7)
  {
    type = v6;
    v10 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v20 = v19;
    *(_DWORD *)v10 = 136446466;
    log = v5;
    v11 = *(_QWORD *)(v9 + 56);
    v12 = *(_QWORD *)(v9 + 64);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_246013004(v11, v12, &v20);
    sub_246017F68();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2114;
    v13 = v8;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v14;
    sub_246017F68();
    *v17 = v14;

    _os_log_impl(&dword_245FEA000, log, type, "%{public}s: error updating presenter: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v19, -1, -1);
    MEMORY[0x24954D194](v10, -1, -1);

  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_246010B98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  sub_246017E00();
  v6[7] = sub_246017DF4();
  v6[8] = sub_246017DC4();
  v6[9] = v7;
  return swift_task_switch();
}

uint64_t sub_246010C08()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(void **)(v0 + 40);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v1;
  v4 = v1;

  if (*(_BYTE *)(v2 + 17))
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v6;
    *v6 = v0;
    v6[1] = sub_246010C9C;
    return sub_245FF9BD8((uint64_t)sub_2460059AC, *(_QWORD *)(v0 + 32));
  }
}

uint64_t sub_246010C9C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_246010CFC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_246010D2C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_246010D68()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  if (qword_257537C20 != -1)
    swift_once();
  v1 = *(void **)(v0 + 88);
  v2 = sub_246017CC8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25753AAA0);
  v3 = v1;
  v4 = v1;
  swift_retain();
  v5 = sub_246017CB0();
  v6 = sub_246017EF0();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 88);
  v9 = *(_QWORD *)(v0 + 48);
  if (v7)
  {
    v10 = swift_slowAlloc();
    v16 = (_QWORD *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v18 = v17;
    *(_DWORD *)v10 = 136446466;
    v12 = *(_QWORD *)(v9 + 56);
    v11 = *(_QWORD *)(v9 + 64);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_246013004(v12, v11, &v18);
    sub_246017F68();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2114;
    v13 = v8;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v14;
    sub_246017F68();
    *v16 = v14;

    _os_log_impl(&dword_245FEA000, v5, v6, "%{public}s: error updating presentable: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538F40);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v16, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24954D194](v17, -1, -1);
    MEMORY[0x24954D194](v10, -1, -1);

  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

char *SceneHostingDisplayControllerAdapter.__allocating_init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)(_BYTE *a1, void *a2, void *a3, void *a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return SceneHostingDisplayControllerAdapter.init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)(a1, a2, a3, a4);
}

char *SceneHostingDisplayControllerAdapter.init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)(_BYTE *a1, void *a2, void *a3, void *a4)
{
  _BYTE *v4;
  _QWORD *v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  char *v11;
  char v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  id *v17;
  id *v18;
  void *v19;
  id *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  id v35;
  char **v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int64_t v47;
  unint64_t v48;
  int64_t v49;
  uint64_t *v50;
  uint64_t v51;
  id v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  char *v58;
  __int128 v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  char isEscapingClosureAtFileLocation;
  id v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  void (*v71)(uint64_t *__return_ptr, __int128 *);
  char v72;
  id v73;
  uint64_t v74;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  NSObject *v84;
  os_log_type_t v85;
  uint8_t *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint8_t *v90;
  uint64_t v91;
  char **v92;
  id v93;
  void *v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  id v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v105;
  id v106;
  uint64_t v107;
  id v108;
  id v110;
  uint64_t v111;
  uint64_t v112;
  int64_t v113;
  unint64_t v114;
  int64_t v115;
  void *v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  char *v120;
  uint64_t ObjCClassFromMetadata;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v127;
  id *v128;
  objc_super v129;
  uint64_t v130;
  __int128 aBlock;
  uint64_t v132;
  id *v133;
  uint64_t (*v134)();
  id *v135;
  _OWORD v136[2];
  uint64_t v137;

  *(_QWORD *)&v4[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation] = 0;
  v4[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_activationState] = 1;
  v8 = *(_QWORD *)&a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration];
  v7 = *(_QWORD **)&a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 8];
  v10 = *(_QWORD *)&a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16];
  v9 = *(id **)&a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24];
  LOBYTE(v11) = a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 32];
  v12 = a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 33];
  v13 = &v4[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_profileConfiguration];
  *(_QWORD *)v13 = v8;
  *((_QWORD *)v13 + 1) = v7;
  *((_QWORD *)v13 + 2) = v10;
  *((_QWORD *)v13 + 3) = v9;
  v13[32] = (char)v11;
  LOBYTE(v125) = v12;
  v13[33] = v12;
  *(_QWORD *)&v4[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_display] = a2;
  swift_bridgeObjectRetain();
  v128 = v4;
  v110 = a2;
  swift_bridgeObjectRetain();
  v14 = objc_msgSend(a3, sel_CADisplay);
  if (!v14)
    goto LABEL_57;
  v15 = v14;
  *(id *)((char *)v128 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplay) = v14;
  type metadata accessor for RootWindowDisplayBlanker();
  v7 = (_QWORD *)swift_allocObject();
  v7[3] = a3;
  v9 = (id *)objc_allocWithZone((Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow());
  v16 = a3;
  v108 = v15;
  v17 = objc_msgSend(v9, sel_initWithDisplay_, v16);
  if (!v17)
    goto LABEL_56;
  v18 = v17;
  v19 = (void *)objc_opt_self();
  v20 = v18;
  v21 = objc_msgSend(v19, sel_blackColor);
  objc_msgSend(v20, sel_setBackgroundColor_, v21);

  objc_msgSend(v20, sel_setHidden_, 0);
  v8 = (uint64_t)&selRef__didInvalidateForDisplayDisconnect;
  v10 = 1;
  objc_msgSend(v20, sel_setOpaque_, 1);
  sub_2460008B0();
  objc_msgSend(v16, sel_bounds);
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, v22, v23, v24, v25);
  v27 = objc_msgSend(v19, sel_blackColor);
  objc_msgSend(v26, sel_setBackgroundColor_, v27);

  objc_msgSend(v26, sel_setOpaque_, 1);
  objc_msgSend(v26, sel_setAutoresizingMask_, 18);
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
  objc_msgSend(v28, sel_setView_, v26);
  objc_msgSend(v20, sel_setRootViewController_, v28);

  v7[4] = v20;
  *((_BYTE *)v7 + 16) = 1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257538D78);
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v7;
  *(_QWORD *)(v29 + 24) = 0;
  v107 = v29;
  v9 = v128;
  *(id *)((char *)v128 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_updateTransformsAdapter) = a4;
  v106 = a4;
  sub_246018010();
  swift_bridgeObjectRelease();
  *(_QWORD *)&aBlock = 0xD000000000000021;
  *((_QWORD *)&aBlock + 1) = 0x800000024601D9B0;
  v30 = objc_msgSend(v110, sel_description);
  sub_246017D04();

  sub_246017D28();
  swift_bridgeObjectRelease();
  v7 = objc_allocWithZone(MEMORY[0x24BE38110]);
  v31 = (void *)sub_246017CF8();
  swift_bridgeObjectRelease();
  v11 = (char *)objc_msgSend(v7, sel_initWithIdentifier_, v31);

  v32 = *(_QWORD *)v13;
  type metadata accessor for FBScenePresentableProvider();
  v33 = (_QWORD *)swift_allocObject();
  v33[5] = 0;
  v33[6] = 0;
  v33[3] = v32;
  v33[4] = 0;
  v33[2] = v11;
  v119 = OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_presentableProvider;
  *(id *)((char *)v128 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_presentableProvider) = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257538D90);
  v34 = swift_allocObject();
  v35 = v16;
  v105 = v11;
  *(_QWORD *)(v34 + 48) = sub_24600F244(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v34 + 16) = sub_24601212C;
  *(_QWORD *)(v34 + 24) = 0;
  *(_QWORD *)(v34 + 32) = v35;
  *(_BYTE *)(v34 + 40) = 1;
  v117 = OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_hostingGroupCoordinator;
  v118 = v35;
  *(id *)((char *)v128 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_hostingGroupCoordinator) = (id)v34;
  v36 = &selRef__didInvalidateForDisplayDisconnect;
  v37 = *((_QWORD *)v13 + 1);
  v38 = *(_QWORD *)(v37 + 64);
  v112 = v37 + 64;
  v39 = 1 << *(_BYTE *)(v37 + 32);
  v40 = -1;
  if (v39 < 64)
    v40 = ~(-1 << v39);
  v41 = v40 & v38;
  v113 = (unint64_t)(v39 + 63) >> 6;
  v42 = swift_bridgeObjectRetain();
  v43 = 0;
  v44 = MEMORY[0x24BDAC760];
  v111 = v42;
LABEL_7:
  while (v41)
  {
    v45 = __clz(__rbit64(v41));
    v41 &= v41 - 1;
    v46 = v45 | (v43 << 6);
LABEL_23:
    v11 = *(char **)(*(_QWORD *)(v42 + 56) + 8 * v46);
    v7 = (_QWORD *)*((_QWORD *)v11 + 2);
    if (v7)
    {
      v114 = v41;
      v115 = v43;
      v50 = (uint64_t *)(*(_QWORD *)(v42 + 48) + 24 * v46);
      v51 = v50[1];
      v123 = v50[2];
      v124 = *v50;
      sub_245FFC180(0, (unint64_t *)&qword_2575388E0);
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8 = 32;
      v120 = v11;
      v122 = v51;
      while (1)
      {
        v127 = v7;
        v36 = (char **)&v11[v8];
        v53 = *(_OWORD *)&v11[v8];
        v54 = *(_OWORD *)&v11[v8 + 16];
        v137 = *(_QWORD *)&v11[v8 + 32];
        v136[0] = v53;
        v136[1] = v54;
        v55 = *(uint64_t *)((char *)v9 + v119);
        v56 = *(void **)(v55 + 16);
        v57 = swift_allocObject();
        v58 = v36[4];
        v59 = *((_OWORD *)v36 + 1);
        *(_OWORD *)(v57 + 16) = *(_OWORD *)v36;
        *(_OWORD *)(v57 + 32) = v59;
        *(_QWORD *)(v57 + 48) = v58;
        v9 = (id *)swift_allocObject();
        v9[2] = sub_2460147AC;
        v9[3] = (id)v57;
        v134 = sub_245FFA070;
        v135 = v9;
        *(_QWORD *)&aBlock = v44;
        *((_QWORD *)&aBlock + 1) = 1107296256;
        v132 = (uint64_t)sub_24600F0BC;
        v133 = (id *)&block_descriptor_3;
        v60 = _Block_copy(&aBlock);
        sub_2460147DC((uint64_t)v136);
        sub_2460147DC((uint64_t)v136);
        swift_retain();
        swift_release();
        v61 = objc_msgSend(v56, sel_createScene_, v60);
        _Block_release(v60);
        LOBYTE(v56) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if ((v56 & 1) != 0)
        {
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          v92 = v36;
          v93 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE38458]), v36[123]);
          v94 = v118;
          objc_msgSend(v118, sel_pointScale);
          objc_msgSend(v93, sel_setPointScale_);
          goto LABEL_52;
        }
        v9 = (id *)swift_allocObject();
        v36 = (char **)v118;
        v9[2] = v61;
        v9[3] = v118;
        v9[4] = (id)v55;
        v62 = swift_allocObject();
        *(_QWORD *)(v62 + 16) = sub_246006314;
        *(_QWORD *)(v62 + 24) = v9;
        v134 = sub_24601572C;
        v135 = (id *)v62;
        *(_QWORD *)&aBlock = v44;
        *((_QWORD *)&aBlock + 1) = 1107296256;
        v132 = (uint64_t)sub_246015728;
        v133 = (id *)&block_descriptor_12;
        v63 = _Block_copy(&aBlock);
        v64 = v118;
        v61 = v61;
        swift_retain();
        swift_retain();
        swift_release();
        objc_msgSend(v61, sel_configureParameters_, v63);
        _Block_release(v63);
        isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if ((isEscapingClosureAtFileLocation & 1) != 0)
          goto LABEL_50;
        objc_msgSend(v61, sel_addExtension_, ObjCClassFromMetadata);
        swift_release();
        type metadata accessor for FBScenePresentable();
        swift_allocObject();
        v66 = v64;
        swift_retain();
        v9 = (id *)sub_2460050E8(v61, v66, (uint64_t)sub_246014864, v55, (uint64_t)sub_246005CB8, 0);
        swift_release();
        v67 = *(uint64_t *)((char *)v128 + v117);
        swift_beginAccess();
        v68 = *(_QWORD *)(v67 + 48);
        v10 = v122;
        v125 = v8;
        if (!*(_QWORD *)(v68 + 16))
          goto LABEL_33;
        swift_bridgeObjectRetain();
        v69 = sub_246013828(v124, v122, v123);
        if ((v70 & 1) == 0)
          break;
        v11 = *(char **)(*(_QWORD *)(v68 + 56) + 8 * v69);
        swift_endAccess();
        swift_retain();
        swift_bridgeObjectRelease();
LABEL_34:
        swift_beginAccess();
        v76 = swift_retain();
        MEMORY[0x24954C528](v76);
        v7 = *(_QWORD **)((*((_QWORD *)v11 + 10) & 0xFFFFFFFFFFFFFF8) + 0x10);
        if ((unint64_t)v7 >= *(_QWORD *)((*((_QWORD *)v11 + 10) & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_246017D70();
        sub_246017D94();
        sub_246017D58();
        swift_endAccess();
        swift_beginAccess();
        v77 = (void *)*((_QWORD *)v11 + 2);
        v8 = v11[24];
        if (v11[24])
        {
          if ((_DWORD)v8 != 1)
            goto LABEL_56;
          v81 = qword_257537C30;
          v116 = (void *)*((_QWORD *)v11 + 2);
          v82 = v77;
          if (v81 != -1)
            swift_once();
          v83 = sub_246017CC8();
          __swift_project_value_buffer(v83, (uint64_t)qword_25753AAD0);
          swift_retain_n();
          v84 = sub_246017CB0();
          v85 = sub_246017EFC();
          if (os_log_type_enabled(v84, v85))
          {
            v86 = (uint8_t *)swift_slowAlloc();
            v87 = swift_slowAlloc();
            *(_QWORD *)&aBlock = v87;
            *(_DWORD *)v86 = 136446210;
            v88 = sub_246005050();
            v130 = sub_246013004(v88, v89, (uint64_t *)&aBlock);
            sub_246017F68();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_245FEA000, v84, v85, "%{public}s: inactive. update settings later", v86, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24954D194](v87, -1, -1);
            v90 = v86;
            v10 = v122;
            MEMORY[0x24954D194](v90, -1, -1);

          }
          else
          {

            swift_release_n();
          }
          v44 = MEMORY[0x24BDAC760];
          v77 = v116;
        }
        else
        {
          v78 = v9[4];
          v7 = (_QWORD *)swift_allocObject();
          v7[2] = sub_2460065A4;
          v7[3] = v9;
          v134 = sub_24601572C;
          v135 = (id *)v7;
          *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
          *((_QWORD *)&aBlock + 1) = 1107296256;
          v132 = (uint64_t)sub_246005E58;
          v133 = (id *)&block_descriptor_18;
          v79 = _Block_copy(&aBlock);
          swift_retain();
          v80 = v77;
          swift_retain();
          swift_release();
          objc_msgSend(v78, sel_updateSettingsWithBlock_, v79);
          _Block_release(v79);
          LOBYTE(v79) = swift_isEscapingClosureAtFileLocation();
          swift_release();
          if ((v79 & 1) != 0)
          {
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
            while (1)
            {
LABEL_56:
              sub_246018070();
              __break(1u);
LABEL_57:
              *(_QWORD *)&aBlock = 0;
              *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
              sub_246018010();
              v136[0] = aBlock;
              sub_246017D28();
              *(_QWORD *)&aBlock = v8;
              *((_QWORD *)&aBlock + 1) = v7;
              v132 = v10;
              v133 = v9;
              LOBYTE(v134) = (_BYTE)v11;
              BYTE1(v134) = v125;
              sub_246018058();

            }
          }
          if (*((_BYTE *)v9 + 16) != 1)
          {
            ((void (*)(id))v9[6])(v78);
            *((_BYTE *)v9 + 16) = 1;
          }
          swift_release();
          v44 = MEMORY[0x24BDAC760];
        }
        *((_BYTE *)v9 + 17) = v8;

        v52 = v9[4];
        sub_24600EBF4(v52);
        swift_release();

        sub_2460149C8((uint64_t)v136);
        swift_release();
        v8 = v125 + 40;
        v7 = (_QWORD *)((char *)v127 - 1);
        v9 = v128;
        v11 = v120;
        if (v127 == (_QWORD *)1)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v36 = &selRef__didInvalidateForDisplayDisconnect;
          v42 = v111;
          v41 = v114;
          v43 = v115;
          goto LABEL_7;
        }
      }
      swift_bridgeObjectRelease();
LABEL_33:
      swift_endAccess();
      v71 = *(void (**)(uint64_t *__return_ptr, __int128 *))(v67 + 16);
      v72 = *(_BYTE *)(v67 + 40);
      *(_QWORD *)&aBlock = *(_QWORD *)(v67 + 32);
      v73 = (id)aBlock;
      v71(&v130, &aBlock);
      v74 = v130;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257538E08);
      swift_allocObject();
      swift_bridgeObjectRetain();
      v11 = (char *)sub_24601486C(v124, v122, v123, v73, v72, v74);
      swift_bridgeObjectRelease();

      swift_release();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v130 = *(_QWORD *)(v67 + 48);
      *(_QWORD *)(v67 + 48) = 0x8000000000000000;
      sub_246013CD8((uint64_t)v11, v124, v122, v123, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(v67 + 48) = v130;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      goto LABEL_34;
    }
  }
  v47 = v43 + 1;
  if (__OFADD__(v43, 1))
    goto LABEL_54;
  if (v47 >= v113)
    goto LABEL_47;
  v48 = *(_QWORD *)(v112 + 8 * v47);
  ++v43;
  if (v48)
    goto LABEL_22;
  v43 = v47 + 1;
  if (v47 + 1 >= v113)
    goto LABEL_47;
  v48 = *(_QWORD *)(v112 + 8 * v43);
  if (v48)
    goto LABEL_22;
  v43 = v47 + 2;
  if (v47 + 2 >= v113)
    goto LABEL_47;
  v48 = *(_QWORD *)(v112 + 8 * v43);
  if (v48)
  {
LABEL_22:
    v41 = (v48 - 1) & v48;
    v46 = __clz(__rbit64(v48)) + (v43 << 6);
    goto LABEL_23;
  }
  v49 = v47 + 3;
  if (v49 >= v113)
    goto LABEL_47;
  v48 = *(_QWORD *)(v112 + 8 * v49);
  if (v48)
  {
    v43 = v49;
    goto LABEL_22;
  }
  while (1)
  {
    v43 = v49 + 1;
    if (__OFADD__(v49, 1))
      goto LABEL_55;
    if (v43 >= v113)
      break;
    v48 = *(_QWORD *)(v112 + 8 * v43);
    ++v49;
    if (v48)
      goto LABEL_22;
  }
LABEL_47:
  swift_release();
  v91 = *(uint64_t *)((char *)v9 + v119);
  v61 = *(id *)(v91 + 32);
  if (!v61)
    goto LABEL_51;
  v92 = &selRef__didInvalidateForDisplayDisconnect;
  v93 = *(id *)(v91 + 32);
  v94 = v118;
LABEL_52:
  v95 = *(uint64_t *)((char *)v9 + v117);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257538E10);
  swift_allocObject();
  v96 = v108;
  v97 = v106;
  v98 = v61;
  swift_retain();
  swift_retain();
  v99 = v93;
  *(id *)((char *)v9 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater) = (id)sub_24600CB38((uint64_t)v96, (uint64_t)v97, v107, v95, (uint64_t)v99);

  v129.receiver = v9;
  v129.super_class = (Class)type metadata accessor for SceneHostingDisplayControllerAdapter();
  v100 = (char *)objc_msgSendSuper2(&v129, (SEL)v92 + 3528);
  objc_msgSend(v105, sel_setDelegate_, v100);

  swift_release();
  v101 = *(_QWORD *)&v100[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_presentableProvider];
  v102 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v103 = *(_QWORD *)(v101 + 40);
  *(_QWORD *)(v101 + 40) = sub_246014A60;
  *(_QWORD *)(v101 + 48) = v102;
  sub_246005F50(v103);
  return v100;
}

uint64_t sub_24601212C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t result;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257538FF8);
  v5 = (_QWORD *)swift_allocObject();
  v6 = v3;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_24601807C())
    sub_2460141E0(MEMORY[0x24BEE4AF8]);
  else
    v7 = MEMORY[0x24BEE4B08];
  v5[5] = v6;
  v5[6] = v7;
  v5[3] = 0;
  v5[4] = 0;
  v5[2] = sub_245FFB474;
  v8 = v6;
  v9 = sub_2460146A8(v8);
  v11 = v10;
  v13 = v12;

  v19[3] = v4;
  v19[4] = &off_257537FB0;
  v19[0] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257539000);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24601B060;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_257539008);
  *(_QWORD *)(inited + 64) = sub_24601568C();
  *(_QWORD *)(inited + 32) = v9;
  *(_QWORD *)(inited + 40) = v11;
  *(_QWORD *)(inited + 48) = v13;
  v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = xmmword_24601B060;
  sub_246002560((uint64_t)v19, v15 + 32);
  swift_retain();
  v16 = v9;
  swift_bridgeObjectRetain();
  sub_24600EA8C(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257539018);
  swift_allocObject();
  v17 = sub_24601453C(v15);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);

  swift_release();
  result = swift_bridgeObjectRelease();
  *a2 = v17;
  return result;
}

void sub_246012324(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x24954D224](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_24601237C(a1);

  }
}

void sub_24601237C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater);
  v7 = *(void **)(v6 + 72);
  sub_245FFC180(0, qword_257538000);
  v8 = v7;
  v9 = sub_246017F44();

  if ((v9 & 1) == 0)
  {
    v10 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = a1;
    v11 = a1;

    sub_246017E00();
    sub_246017DF4();
    v12 = sub_246017E18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v5, 1, 1, v12);
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = &unk_257538FC8;
    *(_QWORD *)(v13 + 24) = v6;
    swift_retain_n();
    sub_246017E54();
    swift_release();
    sub_2460155B4((uint64_t)v5, &qword_2575381A8);
    swift_release();
    swift_release();
  }
}

id SceneHostingDisplayControllerAdapter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneHostingDisplayControllerAdapter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246012698()
{
  return 1;
}

uint64_t sub_2460126A0()
{
  sub_24601816C();
  sub_246018178();
  return sub_246018190();
}

uint64_t sub_2460126E0()
{
  return sub_246018178();
}

uint64_t sub_246012704()
{
  sub_24601816C();
  sub_246018178();
  return sub_246018190();
}

void SceneHostingDisplayControllerAdapter.workspace(_:didReceiveSceneRequestWith:from:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, void *))
{
  void *v5;

  sub_246014A68();
  v5 = (void *)swift_allocError();
  a4(0, v5);

}

uint64_t SceneHostingDisplayControllerAdapter.workspace(_:didReceive:with:from:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_246014AAC(a2, a4);
}

Swift::Void __swiftcall SceneHostingDisplayControllerAdapter.gainedControl()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_activationState] = 0;
  v4 = *(_QWORD *)&v0[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater];
  if (*(_BYTE *)(v4 + 64))
  {
    *(_BYTE *)(v4 + 64) = 0;
    sub_246017E00();
    sub_246017DF4();
    v5 = sub_246017E18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v3, 1, 1, v5);
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = &unk_257538E38;
    *(_QWORD *)(v6 + 24) = v4;
    swift_retain_n();
    sub_246017E54();
    swift_release();
    sub_2460155B4((uint64_t)v3, &qword_2575381A8);
    swift_release();
    swift_release();
  }
  v10[1] = v0;
  swift_getKeyPath();
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  v7 = v0;
  v8 = sub_246017C80();
  swift_release();
  swift_release();
  v9 = *(void **)&v7[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation];
  *(_QWORD *)&v7[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation] = v8;

}

uint64_t sub_246012B1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_246017E18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_246017E00();
  v8 = a3;
  v9 = sub_246017DF4();
  v10 = (_QWORD *)swift_allocObject();
  v11 = MEMORY[0x24BEE6930];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = v8;
  sub_24600F0F8((uint64_t)v6, (uint64_t)&unk_257538EF8, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_246012BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[2] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  v4[3] = swift_task_alloc();
  v4[4] = sub_246017E00();
  v4[5] = sub_246017DF4();
  sub_246017DC4();
  return swift_task_switch();
}

uint64_t sub_246012C8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  swift_release();
  v3 = *(_QWORD *)(v2 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater);
  sub_246017DF4();
  v4 = sub_246017E18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v1, 1, 1, v4);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = &unk_257538F10;
  *(_QWORD *)(v5 + 24) = v3;
  swift_retain_n();
  sub_246017E54();
  swift_release();
  sub_2460155B4(v1, &qword_2575381A8);
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall SceneHostingDisplayControllerAdapter.lostControl()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_activationState) = 1;
  v5 = *(_QWORD *)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater);
  if (*(_BYTE *)(v5 + 64) != 1)
  {
    *(_BYTE *)(v5 + 64) = 1;
    sub_246017E00();
    sub_246017DF4();
    v6 = sub_246017E18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = &unk_257538E48;
    *(_QWORD *)(v7 + 24) = v5;
    swift_retain_n();
    sub_246017E54();
    swift_release();
    sub_2460155B4((uint64_t)v4, &qword_2575381A8);
    swift_release();
    swift_release();
  }
  v8 = OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation;
  v9 = *(void **)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation);
  if (v9)
  {
    v10 = v9;
    sub_246017C68();
    v11 = *(void **)(v1 + v8);
    *(_QWORD *)(v1 + v8) = 0;

  }
}

uint64_t sub_246012F50(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_246012F60(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_246012F94(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_246013004(v6, v7, a3);
  v8 = *a1 + 8;
  sub_246017F68();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_246013004(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2460130D4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_246015650((uint64_t)v12, *a3);
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
      sub_246015650((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2460130D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_246017F74();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24601328C(a5, a6);
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
  v8 = sub_246018040();
  if (!v8)
  {
    sub_246018064();
    __break(1u);
LABEL_17:
    result = sub_2460180AC();
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

uint64_t sub_24601328C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_246013320(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2460134F8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2460134F8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246013320(uint64_t a1, unint64_t a2)
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
      v3 = sub_246013494(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24601801C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_246018064();
      __break(1u);
LABEL_10:
      v2 = sub_246017D34();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2460180AC();
    __break(1u);
LABEL_14:
    result = sub_246018064();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_246013494(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257538FE0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2460134F8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538FE0);
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
  result = sub_2460180AC();
  __break(1u);
  return result;
}

_BYTE **sub_246013644(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_246013654(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_246013670(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_246013670(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257539030);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 48 * v8)
      memmove(v10 + 4, a4 + 4, 48 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 48 * v8 || v12 >= v13 + 48 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257538FB0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2460180AC();
  __break(1u);
  return result;
}

_QWORD *sub_246013814(_QWORD *a1)
{
  return sub_246007EA4(0, a1[2], 0, a1);
}

unint64_t sub_246013828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_24601816C();
  swift_bridgeObjectRetain();
  sub_246017D1C();
  swift_bridgeObjectRelease();
  v6 = sub_246018190();
  return sub_2460138AC(a1, a2, a3, v6);
}

unint64_t sub_2460138AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t i;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  _QWORD *v14;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  i = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v10 = *(_QWORD *)(v4 + 48);
    v11 = (_QWORD *)(v10 + 24 * i);
    if ((*v11 != a1 || v11[1] != a2) && (sub_246018100() & 1) == 0)
    {
      v13 = ~v6;
      for (i = (i + 1) & v13; ((*(_QWORD *)(v5 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v13)
      {
        v14 = (_QWORD *)(v10 + 24 * i);
        if (*v14 == a1 && v14[1] == a2)
          break;
        if ((sub_246018100() & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_2460139B4(uint64_t a1, char a2)
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
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257538FE8);
  v36 = a2;
  v6 = sub_246018094();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v35 = (_QWORD *)(v5 + 64);
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
      }
      else
      {
        v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v34)
          goto LABEL_33;
        v22 = v35[v21];
        ++v13;
        if (!v22)
        {
          v13 = v21 + 1;
          if (v21 + 1 >= v34)
            goto LABEL_33;
          v22 = v35[v13];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v34)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v36 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v35[v23];
            if (!v22)
            {
              while (1)
              {
                v13 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_40;
                if (v13 >= v34)
                  goto LABEL_33;
                v22 = v35[v13];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v13 = v23;
          }
        }
LABEL_30:
        v10 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      v28 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 24 * v20);
      v30 = *v28;
      v29 = v28[1];
      v31 = v28[2];
      v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
      if ((v36 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_24601816C();
      swift_bridgeObjectRetain();
      sub_246017D1C();
      swift_bridgeObjectRelease();
      result = sub_246018190();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 24 * v17);
      *v18 = v30;
      v18[1] = v29;
      v18[2] = v31;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_246013CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v6 = v5;
  v12 = *v5;
  v14 = sub_246013828(a2, a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_246013E54();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_release();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 24 * v14);
    *v25 = a2;
    v25[1] = a3;
    v25[2] = a4;
    *(_QWORD *)(v20[7] + 8 * v14) = a1;
    v26 = v20[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (!v27)
    {
      v20[2] = v28;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_2460139B4(v17, a5 & 1);
  v23 = sub_246013828(a2, a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_246018124();
  __break(1u);
  return result;
}

void *sub_246013E54()
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
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257538FE8);
  v2 = *v0;
  v3 = sub_246018088();
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
    v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      v9 = v24 + 1;
      if (v24 + 1 >= v13)
        goto LABEL_26;
      v25 = *(_QWORD *)(v6 + 8 * v9);
      if (!v25)
        break;
    }
LABEL_25:
    v12 = (v25 - 1) & v25;
    v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 24 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = v17[2];
    v21 = 8 * v15;
    v22 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v21);
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v23[2] = v20;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v21) = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v26 = v24 + 2;
  if (v26 >= v13)
    goto LABEL_26;
  v25 = *(_QWORD *)(v6 + 8 * v26);
  if (v25)
  {
    v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_246014014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;

  v8 = *a4;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_246000888;
  return sub_2460101DC(a1, a2, a3, v8);
}

uint64_t sub_246014084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;

  v7 = *a5;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_246000888;
  v8[4] = a4;
  v8[5] = v7;
  return swift_task_switch();
}

uint64_t sub_2460140E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v11 = *a4;
  v12 = *a5;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_246000888;
  return sub_246010B98(a1, a2, a3, v11, v12, a6);
}

uint64_t sub_246014170()
{
  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  return 91;
}

void sub_2460141E0(unint64_t a1)
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
    v5 = sub_24601807C();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257539020);
      v3 = sub_246018004();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_24601807C();
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
        v8 = MEMORY[0x24954C81C](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_246017F38();
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
      sub_245FFC180(0, &qword_257537FE0);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_246017F44();

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
          v21 = sub_246017F44();

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
    v26 = sub_246017F38();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_245FFC180(0, &qword_257537FE0);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_246017F44();

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
        v36 = sub_246017F44();

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

uint64_t sub_24601453C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v16[2];
  _BYTE v17[40];
  _OWORD v18[2];
  __int128 v19;
  uint64_t v20;

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_246013654(0, v3, 0);
    v6 = a1 + 32;
    v7 = MEMORY[0x24BEE4B08];
    do
    {
      sub_246002560(v6, (uint64_t)v17);
      sub_246002560((uint64_t)v17, (uint64_t)v16);
      v8 = v7;
      if ((v4 & 0xC000000000000000) != 0)
      {
        if (sub_24601807C())
          sub_2460141E0(v4);
        else
          v8 = v7;
      }
      *((_QWORD *)&v19 + 1) = v8;
      sub_2460156D8(v16, (uint64_t)v18);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
      v9 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246013654(0, *(_QWORD *)(v9 + 16) + 1, 1);
        v9 = v20;
      }
      v11 = *(_QWORD *)(v9 + 16);
      v10 = *(_QWORD *)(v9 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_246013654(v10 > 1, v11 + 1, 1);
        v9 = v20;
      }
      *(_QWORD *)(v9 + 16) = v11 + 1;
      v12 = (_OWORD *)(v9 + 48 * v11);
      v13 = v18[0];
      v14 = v19;
      v12[3] = v18[1];
      v12[4] = v14;
      v12[2] = v13;
      v6 += 40;
      --v3;
    }
    while (v3);
  }
  else
  {
    v9 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(v2 + 16) = v9;
  return v2;
}

id sub_2460146A8(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  sub_246018010();
  swift_bridgeObjectRelease();
  sub_245FFC180(0, (unint64_t *)&unk_25441BE90);
  v2 = v1;
  sub_246017D10();
  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  return v2;
}

uint64_t sub_246014770()
{
  id *v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2460147AC(void *a1)
{
  uint64_t v1;

  return sub_2460059B4(a1, v1 + 16);
}

uint64_t sub_2460147B4()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_2460147DC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 24);
  v5 = v3;
  swift_bridgeObjectRetain();
  v6 = v2;
  return a1;
}

uint64_t sub_246014820()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_246014854()
{
  return swift_deallocObject();
}

uint64_t sub_246014864(uint64_t a1)
{
  uint64_t v1;

  return sub_246005CC8(a1, v1);
}

uint64_t sub_24601486C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v8;
  id v9;
  id v10;

  v8 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  *(_QWORD *)(v6 + 48) = a3;
  *(_QWORD *)(v6 + 16) = a4;
  *(_QWORD *)(v6 + 72) = a6;
  *(_QWORD *)(v6 + 80) = v8;
  *(_BYTE *)(v6 + 24) = a5;
  swift_bridgeObjectRetain_n();
  v9 = a4;
  swift_retain();
  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  sub_245FFC180(0, (unint64_t *)&unk_25441BE90);
  v10 = v9;
  sub_246017D10();
  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  *(_QWORD *)(v6 + 56) = 0x204343485BLL;
  *(_QWORD *)(v6 + 64) = 0xE500000000000000;
  return v6;
}

uint64_t sub_2460149C8(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 24);

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246014A0C()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for SceneHostingDisplayControllerAdapter()
{
  return objc_opt_self();
}

uint64_t sub_246014A3C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_246014A60(void *a1)
{
  uint64_t v1;

  sub_246012324(a1, v1);
}

unint64_t sub_246014A68()
{
  unint64_t result;

  result = qword_257538E20;
  if (!qword_257538E20)
  {
    result = MEMORY[0x24954D0EC](&unk_24601B1B0, &type metadata for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError);
    atomic_store(result, (unint64_t *)&qword_257538E20);
  }
  return result;
}

uint64_t sub_246014AAC(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(v2 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_presentableProvider);
  v6 = objc_retain(*(id *)(*(_QWORD *)(v2 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_hostingGroupCoordinator)
                         + 32));
  sub_246005B4C(a1, v6);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  type metadata accessor for FBScenePresentable();
  swift_allocObject();
  swift_unknownObjectRetain();
  v8 = a1;
  swift_retain();
  v9 = sub_2460050E8(v8, v6, (uint64_t)sub_246014864, v5, (uint64_t)sub_246015624, v7);
  if (qword_25441BE60 != -1)
    swift_once();
  v10 = qword_25441BFE0;
  v11 = *(_QWORD *)algn_25441BFE8;
  swift_bridgeObjectRetain();
  sub_24600F4AC(v9, v10, v11, 0);
  swift_release();
  return swift_bridgeObjectRelease();
}

void _s13ShellSceneKit0B31HostingDisplayControllerAdapterC19displayDisconnectedyySo18FBSDisplayIdentityCF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575381A8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_activationState) = 2;
  v5 = *(_QWORD *)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater);
  if (*(_BYTE *)(v5 + 64) != 2)
  {
    *(_BYTE *)(v5 + 64) = 2;
    sub_246017E00();
    sub_246017DF4();
    v6 = sub_246017E18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = &unk_257538FB8;
    *(_QWORD *)(v7 + 24) = v5;
    swift_retain_n();
    sub_246017E54();
    swift_release();
    sub_2460155B4((uint64_t)v4, &qword_2575381A8);
    swift_release();
    swift_release();
  }
  v8 = OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation;
  v9 = *(void **)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation);
  if (v9)
  {
    v10 = v9;
    sub_246017C68();
    v11 = *(void **)(v1 + v8);
    *(_QWORD *)(v1 + v8) = 0;

  }
}

uint64_t sub_246014FE0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_246000888;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_246000888;
  return sub_24600CC7C();
}

char *keypath_get_selector_caDisplay()
{
  return sel_caDisplay;
}

id sub_246015050@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_caDisplay);
  *a2 = result;
  return result;
}

char *keypath_get_selector_preferences()
{
  return sel_preferences;
}

id sub_246015094@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_preferences);
  *a2 = result;
  return result;
}

id sub_2460150CC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferences_, *a1);
}

uint64_t sub_2460150E0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_246015104(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_246012B1C(a1, a2, *(void **)(v2 + 16));
}

uint64_t method lookup function for SceneHostingDisplayControllerAdapter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SceneHostingDisplayControllerAdapter.__allocating_init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t getEnumTagSinglePayload for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2460151B4 + 4 * byte_24601B070[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2460151D4 + 4 * byte_24601B075[v4]))();
}

_BYTE *sub_2460151B4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2460151D4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2460151DC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2460151E4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2460151EC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2460151F4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError()
{
  return &type metadata for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError;
}

unint64_t sub_246015214()
{
  unint64_t result;

  result = qword_257538EE0;
  if (!qword_257538EE0)
  {
    result = MEMORY[0x24954D0EC](&unk_24601B188, &type metadata for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError);
    atomic_store(result, (unint64_t *)&qword_257538EE0);
  }
  return result;
}

uint64_t sub_246015258()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_246015284(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_245FFA8F0;
  return sub_246012BF8(a1, v4, v5, v6);
}

uint64_t sub_2460152F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_246000888;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257538F00 + dword_257538F00))(a1, v4);
}

uint64_t sub_246015360(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(uint64_t **)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_246000888;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))((char *)&dword_257538F50 + dword_257538F50))(a1, a2, v7, v6);
}

uint64_t sub_2460153E0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_246015414(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_246000888;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))((char *)&dword_257538F68
                                                                                + dword_257538F68))(a1, v4, v5, v6, v1 + 5);
}

uint64_t sub_24601549C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2460154D8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1 + 4;
  v7 = v1 + 5;
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_246000888;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, uint64_t))((char *)&dword_257538F78
                                                                                           + dword_257538F78))(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_246015570(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2460155B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2460155F0()
{
  return swift_deallocObject();
}

uint64_t sub_246015600()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_246015624(void *a1)
{
  uint64_t v1;

  return sub_246005CCC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_24601562C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_246015650(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24601568C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257539010;
  if (!qword_257539010)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257539008);
    result = MEMORY[0x24954D0EC]("]*p\v4m", v1);
    atomic_store(result, (unint64_t *)&qword_257539010);
  }
  return result;
}

uint64_t sub_2460156D8(__int128 *a1, uint64_t a2)
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

uint64_t sub_246015730(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_246015738()
{
  sub_246018010();
  sub_246017D28();
  swift_getObjectType();
  sub_2460181CC();
  sub_246017D28();
  swift_bridgeObjectRelease();
  sub_246017D28();
  sub_246018058();
  sub_246017D28();
  return 0;
}

uint64_t sub_246015810()
{
  uint64_t v0;

  v0 = sub_246017CC8();
  __swift_allocate_value_buffer(v0, qword_25753AAB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25753AAB8);
  return sub_246017CBC();
}

uint64_t type metadata accessor for FBScenePresentableObserver()
{
  return objc_opt_self();
}

void sub_2460159A4(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void (*v10)(id);
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v20;
  void (*v21)(id);
  void *v22;
  id v23;
  uint64_t v24;
  id v25;

  v2 = objc_msgSend(a1, sel_settings);
  if (!v2)
    goto LABEL_19;
  v3 = v2;
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (!v4)
  {

LABEL_19:
    sub_246018010();
    sub_246017D28();
    v23 = objc_msgSend(a1, sel_description);
    sub_246017D04();

    sub_246017D28();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  v5 = (void *)v4;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE384B0]), sel_init);
  v7 = (void *)objc_opt_self();
  v25 = objc_msgSend(v7, sel_diffFromSettings_toSettings_, v6, v5);

  v8 = (void *)sub_246017CF8();
  v9 = objc_msgSend(v25, sel_containsSettingNamed_, v8);

  if (v9)
  {
    v10 = *(void (**)(id))(v24
                                    + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler);
    if (v10)
    {
      swift_retain();
      v10(objc_msgSend(v5, sel_preferredLevel));
      sub_246005F50((uint64_t)v10);
    }
  }
  v11 = objc_msgSend(a1, sel_settings);
  if (v11)
  {
    v12 = v11;
    objc_opt_self();
    v13 = swift_dynamicCastObjCClass();
    if (!v13)
    {
      v22 = v12;
      v16 = v3;
      v20 = v25;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD3D8]), sel_init);
    v16 = objc_msgSend(v7, sel_diffFromSettings_toSettings_, v15, v14);

    v17 = (void *)sub_246017CF8();
    v18 = objc_msgSend(v16, sel_containsSettingNamed_, v17);

    if (!v18)
    {

      v22 = v16;
      goto LABEL_15;
    }
    v19 = objc_msgSend(v14, sel_displayConfigurationRequest);
    if (v19)
    {
      v20 = v19;
      v21 = *(void (**)(id))(v24
                                      + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler);
      if (v21)
      {
        swift_retain();
        v21(v20);

        sub_246005F50((uint64_t)v21);
        v22 = v25;
LABEL_16:

        v3 = v16;
        v25 = v20;
        goto LABEL_17;
      }

      v22 = v20;
LABEL_15:
      v16 = v12;
      v20 = v3;
      goto LABEL_16;
    }
    while (1)
    {
LABEL_20:
      sub_246018070();
      __break(1u);
    }
  }
LABEL_17:

}

uint64_t DisplayProfileConfiguration.priority.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_246015D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  BOOL v7;
  char v8;
  char v9;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a2 + 8);
  if (v3)
  {
    if (v4)
    {
      v5 = *(_BYTE *)(a2 + 16);
      v6 = *(_BYTE *)(a1 + 16);
      v7 = *(_QWORD *)a1 == *(_QWORD *)a2 && v3 == v4;
      if (v7 || (v8 = sub_246018100(), v9 = 0, (v8 & 1) != 0))
        v9 = v5 ^ ((v6 & 1) == 0);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = v4 == 0;
  }
  return v9 & 1;
}

uint64_t DisplayProfileConfiguration.supportsCloning.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t DisplayProfileConfiguration.supportsCloning.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 33) = result;
  return result;
}

uint64_t (*DisplayProfileConfiguration.supportsCloning.modify())()
{
  return nullsub_1;
}

uint64_t DisplayProfileConfiguration.init(identifier:behavesAsMainDisplay:priority:sceneRequestsByGroup:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = a4;
  *(_QWORD *)(a6 + 8) = a5;
  *(_QWORD *)(a6 + 16) = result;
  *(_QWORD *)(a6 + 24) = a2;
  *(_BYTE *)(a6 + 32) = a3;
  *(_BYTE *)(a6 + 33) = 0;
  return result;
}

uint64_t DisplayProfileConfiguration.init(priority:sceneRequestsByGroup:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_WORD *)(a3 + 32) = 0;
  return result;
}

uint64_t sub_246015E24(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;

  if (result == a2)
    return 1;
  v2 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v4 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_24;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v11 >= v8)
      return 1;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        return 1;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          return 1;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            return 1;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_24:
    v14 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 24 * v10);
    v15 = *v14;
    v16 = v14[1];
    v17 = v14[2];
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_246013828(v15, v16, v17);
    LOBYTE(v17) = v19;
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v20 = swift_bridgeObjectRetain();
    v21 = sub_24601683C(v20, v18);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
      return 0;
  }
  v13 = v11 + 4;
  if (v13 >= v8)
    return 1;
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      return 1;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_246016024()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 33);
}

uint64_t sub_246016094()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24))
    v1 = *(_QWORD *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16);
  else
    v1 = 0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_246016104()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24))
    return *(_BYTE *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 32) & 1;
  else
    return 0;
}

uint64_t sub_24601613C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration);
}

void DisplayProfileConfiguration_Box.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DisplayProfileConfiguration_Box.__deallocating_deinit()
{
  return sub_2460167D0(type metadata accessor for DisplayProfileConfiguration_Box);
}

uint64_t sub_2460161E4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t inited;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v22;

  v3 = v2;
  v6 = sub_246017CA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v3 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_priority) = a1;
  sub_246017C98();
  v10 = sub_246017C8C();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = (void *)objc_opt_self();
  v14 = a2;
  v15 = objc_msgSend(v13, sel_localIdentity);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257539090);
  inited = swift_initStackObject();
  v22 = xmmword_24601B060;
  *(_OWORD *)(inited + 16) = xmmword_24601B060;
  if (qword_25441BE60 != -1)
    swift_once();
  v17 = *(_QWORD *)algn_25441BFE8;
  *(_QWORD *)(inited + 32) = qword_25441BFE0;
  *(_QWORD *)(inited + 40) = v17;
  *(_QWORD *)(inited + 48) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257539098);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = v22;
  *(_QWORD *)(v18 + 32) = v10;
  *(_QWORD *)(v18 + 40) = v12;
  *(_QWORD *)(v18 + 48) = v14;
  *(_QWORD *)(v18 + 56) = 0;
  *(_QWORD *)(v18 + 64) = v15;
  *(_QWORD *)(inited + 56) = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = v14;
  v20 = v15;
  *(_QWORD *)(v3 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_requestsByGroup) = sub_24600F378(inited);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246016408(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier);
  *v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24601647C(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay) = result;
  return result;
}

uint64_t sub_24601649C(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning) = result;
  return result;
}

id sub_2460164C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  objc_class *v15;
  char *v16;
  char *v17;
  objc_super v19;

  v1 = v0;
  v2 = sub_246017CA4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_priority);
  v7 = *(_QWORD *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_requestsByGroup);
  v8 = OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay;
  v9 = *(_BYTE *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay);
  v10 = (uint64_t *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier);
  v11 = *(_QWORD *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier + 8);
  if ((v9 & 1) == 0)
  {
    if (!v11)
    {
      swift_bridgeObjectRetain();
      v12 = 0;
      v9 = 0;
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  if (v11)
  {
LABEL_5:
    v12 = *v10;
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  sub_246017C98();
  v12 = sub_246017C8C();
  v11 = v13;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = *(_BYTE *)(v1 + v8);
LABEL_6:
  swift_bridgeObjectRetain();
LABEL_8:
  v14 = *(_BYTE *)(v1 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning);
  v15 = (objc_class *)type metadata accessor for DisplayProfileConfiguration_Box();
  v16 = (char *)objc_allocWithZone(v15);
  v17 = &v16[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration];
  *(_QWORD *)v17 = v6;
  *((_QWORD *)v17 + 1) = v7;
  *((_QWORD *)v17 + 2) = v12;
  *((_QWORD *)v17 + 3) = v11;
  v17[32] = v9;
  v17[33] = v14;
  v19.receiver = v16;
  v19.super_class = v15;
  return objc_msgSendSuper2(&v19, sel_init);
}

id LegacyDisplayProfileBuilder.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LegacyDisplayProfileBuilder.init()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  objc_super v5;

  v1 = &v0[OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SSKLegacyDisplayProfileBuilder_priority] = 0;
  v2 = OBJC_IVAR___SSKLegacyDisplayProfileBuilder_requestsByGroup;
  v3 = v0;
  *(_QWORD *)&v0[v2] = sub_24600F378(MEMORY[0x24BEE4AF8]);
  v3[OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay] = 0;
  v3[OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning] = 0;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for LegacyDisplayProfileBuilder();
  return objc_msgSendSuper2(&v5, sel_init);
}

id LegacyDisplayProfileBuilder.__deallocating_deinit()
{
  return sub_2460167D0(type metadata accessor for LegacyDisplayProfileBuilder);
}

id sub_2460167D0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_24601683C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void **v3;
  void **v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  char v20;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (void **)(a2 + 64);
    v4 = (void **)(a1 + 64);
    do
    {
      v5 = *(v4 - 2);
      v6 = *(v4 - 1);
      v7 = *v4;
      v8 = *(v3 - 1);
      v27 = *(v3 - 2);
      v9 = *v3;
      v10 = *(v4 - 4) == *(v3 - 4) && *(v4 - 3) == *(v3 - 3);
      if (!v10 && (sub_246018100() & 1) == 0)
        return 0;
      v24 = v2;
      sub_245FFC180(0, &qword_257539150);
      v11 = v8;
      v12 = v8;
      v26 = v9;
      swift_bridgeObjectRetain();
      v13 = v5;
      v14 = v6;
      v25 = v7;
      swift_bridgeObjectRetain();
      v15 = v27;
      if ((sub_246017F44() & 1) == 0)
        goto LABEL_19;
      v28 = v15;
      if (v6)
      {
        if (!v11)
        {
LABEL_19:
          v22 = v25;
          v23 = v26;
          goto LABEL_21;
        }
        sub_245FFC180(0, &qword_257538958);
        v16 = v12;
        v17 = v12;
        v18 = v14;
        v19 = sub_246017F44();

        if ((v19 & 1) == 0)
        {
          v14 = v18;
          v12 = v17;
LABEL_20:
          v22 = v25;
          v23 = v26;
          v15 = v28;
LABEL_21:

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      else
      {
        v16 = v12;
        if (v11)
          goto LABEL_20;
      }
      v20 = sub_246017F44();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
        return 0;
      v4 += 5;
      v3 += 5;
      v2 = v24 - 1;
    }
    while (v24 != 1);
  }
  return 1;
}

uint64_t _s13ShellSceneKit27DisplayProfileConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t result;
  char v11;

  if (*(_QWORD *)a1 != *(_QWORD *)a2)
    return 0;
  v3 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 33);
  v7 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v8 = *(unsigned __int8 *)(a2 + 32);
  v9 = *(unsigned __int8 *)(a2 + 33);
  if ((sub_246015E24(*(_QWORD *)(a1 + 8), *(_QWORD *)(a2 + 8)) & 1) == 0)
    return 0;
  if (!v2)
  {
    if (!v6)
      return v5 ^ v9 ^ 1u;
    return 0;
  }
  if (!v6)
    return 0;
  if (v3 == v7 && v2 == v6)
  {
    if (((v4 ^ v8) & 1) == 0)
      return v5 ^ v9 ^ 1u;
    return 0;
  }
  v11 = sub_246018100();
  result = 0;
  if ((v11 & 1) != 0 && ((v4 ^ v8) & 1) == 0)
    return v5 ^ v9 ^ 1u;
  return result;
}

uint64_t type metadata accessor for DisplayProfileConfiguration_Box()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for LegacyDisplayProfileBuilder()
{
  return objc_opt_self();
}

uint64_t destroy for DisplayProfileConfiguration()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DisplayProfileConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DisplayProfileConfiguration(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  return a1;
}

__n128 __swift_memcpy34_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DisplayProfileConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisplayProfileConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 34))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisplayProfileConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 34) = 1;
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
    *(_BYTE *)(result + 34) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DisplayProfileConfiguration()
{
  return &type metadata for DisplayProfileConfiguration;
}

uint64_t method lookup function for DisplayProfileConfiguration_Box()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisplayProfileConfiguration_Box.supportsCloning.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of DisplayProfileConfiguration_Box.derivedIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of DisplayProfileConfiguration_Box.isMainLike.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of DisplayProfileConfiguration_Box.priority.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t method lookup function for LegacyDisplayProfileBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.setPriorityLevel(_:sceneSpecification:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.derive(withIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.setMainLike(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.setCloningSupported(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.setDeactivationReasonsWhenActive(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.createDisplayProfileConfiguration()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t sub_246016EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DisplayProfileConfiguration.DerivingMethod(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for DisplayProfileConfiguration.DerivingMethod(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisplayProfileConfiguration.DerivingMethod(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DisplayProfileConfiguration.DerivingMethod(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_246017020(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_246017038(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DisplayProfileConfiguration.DerivingMethod()
{
  return &type metadata for DisplayProfileConfiguration.DerivingMethod;
}

id DisplayProfileConfiguration_Box.transformPhysicalDisplay(with:)(id a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v3 = v1 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration;
  if (*(_QWORD *)(v1 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_246017CF8();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setUniqueIdentifier_, v4);

    if (*(_QWORD *)(v3 + 24))
    {
      if ((*(_BYTE *)(v3 + 32) & 1) != 0)
        objc_msgSend(a1, sel_setUIKitMainLike);
    }
  }
  return objc_msgSend(a1, sel_setCloningSupported_, *(unsigned __int8 *)(v3 + 33));
}

BOOL DisplayProfileConfiguration_Box.derivesDisplays.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24) != 0;
}

uint64_t DisplayProfileConfiguration_Box.shouldTransformConnectingDisplays.getter()
{
  uint64_t v0;

  return (*(_QWORD *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24) != 0) | *(_BYTE *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 33) & 1u;
}

void sub_246017204(void *a1)
{
  id v2;

  v2 = (id)sub_246017CF8();
  objc_msgSend(a1, sel_setUniqueIdentifier_, v2);

}

id MirroredDisplayTransformer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MirroredDisplayTransformer.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MirroredDisplayTransformer();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for MirroredDisplayTransformer()
{
  return objc_opt_self();
}

id MirroredDisplayTransformer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MirroredDisplayTransformer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for MirroredDisplayTransformer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MirroredDisplayTransformer.transformPhysicalDisplay(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of MirroredDisplayTransformer.derivesDisplays.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of MirroredDisplayTransformer.shouldTransformConnectingDisplays.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t sub_246017428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_246017430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_246017438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_246017440()
{
  uint64_t v0;

  v0 = sub_246017CC8();
  __swift_allocate_value_buffer(v0, qword_25753AAD0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25753AAD0);
  return sub_246017CBC();
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  BOOL v6;

  if (qword_25753AA50 == -1)
  {
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_25753AA50, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  if (v6)
    return 0;
  if (dword_25753AA44 > a2)
    return 1;
  return dword_25753AA44 >= a2 && dword_25753AA48 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_25753AA58 == -1)
  {
    if (qword_25753AA60)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_25753AA58, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_25753AA60)
      return _availability_version_check();
  }
  if (qword_25753AA50 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_25753AA50, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_25753AA44 > a3)
    return 1;
  return dword_25753AA44 >= a3 && dword_25753AA48 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t (*)(void))qword_25753AA60;
  if (qword_25753AA60)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x24BDAC970])
    {
      qword_25753AA60 = (uint64_t)MEMORY[0x24BDAC970];
      v1 = MEMORY[0x24BDAC970];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x24954CBAC](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_25753AA44, &dword_25753AA48);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void SSKCADifferenceMaskCalculate_cold_1(uint64_t a1)
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

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SSKCADisplayDifferenceMask SSKCADifferenceMaskCalculate(CADisplay *__strong _Nonnull, CADisplayMode *__strong _Nonnull, NSString *__strong _Nonnull, CGSize, NSUInteger)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("SSKDisplayControllerUtilties.m");
  v7 = 1024;
  v8 = 59;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_245FEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

uint64_t sub_246017C68()
{
  return MEMORY[0x24BDCD258]();
}

uint64_t sub_246017C74()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_246017C80()
{
  return MEMORY[0x24BDCD5A8]();
}

uint64_t sub_246017C8C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_246017C98()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_246017CA4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_246017CB0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_246017CBC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_246017CC8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_246017CD4()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_246017CE0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_246017CEC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_246017CF8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_246017D04()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_246017D10()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_246017D1C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_246017D28()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_246017D34()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_246017D40()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_246017D4C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_246017D58()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_246017D64()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_246017D70()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_246017D7C()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_246017D88()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_246017D94()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_246017DA0()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_246017DAC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_246017DB8()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_246017DC4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_246017DD0()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_246017DDC()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_246017DE8()
{
  return MEMORY[0x24BEE6868]();
}

uint64_t sub_246017DF4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_246017E00()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_246017E0C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_246017E18()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_246017E24()
{
  return MEMORY[0x24BEE6A28]();
}

uint64_t sub_246017E30()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_246017E3C()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_246017E48()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_246017E54()
{
  return MEMORY[0x24BEE6AF8]();
}

uint64_t sub_246017E60()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_246017E6C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_246017E78()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_246017E84()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_246017E90()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_246017E9C()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_246017EA8()
{
  return MEMORY[0x24BDCFD30]();
}

uint64_t sub_246017EB4()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_246017EC0()
{
  return MEMORY[0x24BDCFD40]();
}

uint64_t sub_246017ECC()
{
  return MEMORY[0x24BEE1758]();
}

uint64_t sub_246017ED8()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_246017EE4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_246017EF0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_246017EFC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_246017F08()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_246017F14()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_246017F20()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_246017F2C()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_246017F38()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_246017F44()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_246017F50()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_246017F5C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_246017F68()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_246017F74()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_246017F80()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_246017F8C()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_246017F98()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_246017FA4()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_246017FB0()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_246017FBC()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_246017FC8()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_246017FD4()
{
  return MEMORY[0x24BEE6D58]();
}

uint64_t sub_246017FE0()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_246017FEC()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_246017FF8()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_246018004()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_246018010()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24601801C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_246018028()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_246018034()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_246018040()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24601804C()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_246018058()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_246018064()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_246018070()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24601807C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_246018088()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_246018094()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2460180A0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2460180AC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2460180B8()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2460180C4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2460180D0()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2460180DC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2460180E8()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2460180F4()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_246018100()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24601810C()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_246018118()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_246018124()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_246018130()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24601813C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_246018148()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_246018154()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_246018160()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_24601816C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_246018178()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_246018184()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_246018190()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24601819C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2460181A8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2460181B4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2460181C0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2460181CC()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t BKSDisplayServicesSetArrangement()
{
  return MEMORY[0x24BE0B528]();
}

uint64_t BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay()
{
  return MEMORY[0x24BE0B530]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x24BE0BBB0]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x24BE0BBB8]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x24BE0BD40]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t FBSDisplayHDRModeToCADisplayHDRMode()
{
  return MEMORY[0x24BE38268]();
}

uint64_t FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment()
{
  return MEMORY[0x24BE38290]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x24BDD0B30](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t NSStringFromBKSDisplayServicesCloneMirroringMode()
{
  return MEMORY[0x24BE0B648]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

uint64_t _NSFullMethodName()
{
  return MEMORY[0x24BDD19D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x24BDAC970]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x24BE0BEF0]();
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

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_taskGroup_wait_next_throwing()
{
  return MEMORY[0x24BEE7218]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


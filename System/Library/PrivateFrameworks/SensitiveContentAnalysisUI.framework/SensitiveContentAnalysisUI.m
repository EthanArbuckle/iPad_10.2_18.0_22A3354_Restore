void sub_245CB8BC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getSTCommunicationClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STCommunicationClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSTCommunicationClientClass_block_invoke_cold_1();
    free(v3);
  }
  getSTCommunicationClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SCUIIsRunningInMacCatalyst()
{
  return 0;
}

uint64_t SCUICurrentInterventionType()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDE96D8], "currentScanningPolicy");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "policy");

  if (v1 < 2)
    return 2;
  objc_msgSend(MEMORY[0x24BDE96D8], "currentInterventionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE63EE0]);

  return v2;
}

void sub_245CBB328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_245CBBD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  _Block_object_dispose(&a32, 8);
  objc_destroyWeak(&location);
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

void sub_245CBC52C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_245CBEAE0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249546074]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245CBEB48@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v3;
  *(_QWORD *)(result + 24) = v4;
  *a2 = result;
  return result;
}

unint64_t sub_245CBEB8C()
{
  unint64_t result;

  result = qword_2575187C8;
  if (!qword_2575187C8)
  {
    result = MEMORY[0x24954608C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2575187C8);
  }
  return result;
}

unint64_t sub_245CBEBD4()
{
  unint64_t result;

  result = qword_2575187D0;
  if (!qword_2575187D0)
  {
    result = MEMORY[0x24954608C](&unk_245CC8560, &type metadata for SCLocalizedStringKey);
    atomic_store(result, (unint64_t *)&qword_2575187D0);
  }
  return result;
}

uint64_t sub_245CBEC18()
{
  return MEMORY[0x24BEE0D80];
}

unint64_t sub_245CBEC28()
{
  unint64_t result;

  result = qword_2575187D8;
  if (!qword_2575187D8)
  {
    result = MEMORY[0x24954608C](&unk_245CC85A0, &type metadata for SCLocalizedStringKey);
    atomic_store(result, (unint64_t *)&qword_2575187D8);
  }
  return result;
}

uint64_t sub_245CBEC6C()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_245CBEC78()
{
  return MEMORY[0x24BEE0D88];
}

_QWORD *initializeBufferWithCopyOfBuffer for SCLocalizedStringKey(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for SCLocalizedStringKey()
{
  return swift_release();
}

_QWORD *assignWithCopy for SCLocalizedStringKey(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for SCLocalizedStringKey(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SCLocalizedStringKey(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 126);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for SCLocalizedStringKey(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_245CBEDEC(_QWORD *a1)
{
  return *a1 >> 62;
}

_QWORD *sub_245CBEDF8(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_245CBEE08(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for SCLocalizedStringKey()
{
  return &type metadata for SCLocalizedStringKey;
}

uint64_t sub_245CBEE30(char *a1, char *a2)
{
  return sub_245CBEE3C(*a1, *a2);
}

uint64_t sub_245CBEE3C(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000015;
  else
    v3 = 0x736150676E6F7277;
  if (v2)
    v4 = 0xED000065646F6373;
  else
    v4 = 0x8000000245CC9390;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000015;
  else
    v5 = 0x736150676E6F7277;
  if ((a2 & 1) != 0)
    v6 = 0x8000000245CC9390;
  else
    v6 = 0xED000065646F6373;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_245CC70BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_245CBEEF0()
{
  sub_245CC7110();
  sub_245CC6FA8();
  swift_bridgeObjectRelease();
  return sub_245CC7128();
}

uint64_t sub_245CBEF80()
{
  sub_245CC6FA8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245CBEFEC()
{
  sub_245CC7110();
  sub_245CC6FA8();
  swift_bridgeObjectRelease();
  return sub_245CC7128();
}

uint64_t sub_245CBF078@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_245CC70B0();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_245CBF0D4(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0x736150676E6F7277;
  if (*v1)
    v2 = 0xD000000000000015;
  v3 = 0x8000000245CC9390;
  if (!*v1)
    v3 = 0xED000065646F6373;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_245CBF134(uint64_t a1)
{
  return sub_245CBF2B0(a1, &qword_257518AF8, 0);
}

void *static SCUIScreenTimePasscodeController.wrongPasscodeError.getter()
{
  return sub_245CBF1E4(&qword_257518AF0, (void **)&qword_257518AF8);
}

uint64_t sub_245CBF17C()
{
  sub_245CC6FF0();
  sub_245CC07B4();
  qword_257518B08 = swift_allocError();
  return sub_245CC6F6C();
}

void *static SCUIScreenTimePasscodeController.cancellationError.getter()
{
  return sub_245CBF1E4(&qword_257518B00, (void **)&qword_257518B08);
}

void *sub_245CBF1E4(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  v4 = v3;
  return v3;
}

id sub_245CBF244(uint64_t a1, uint64_t a2, _QWORD *a3, void **a4)
{
  void *v5;
  id v6;
  void *v7;

  if (*a3 != -1)
    swift_once();
  v5 = *a4;
  v6 = v5;
  v7 = (void *)sub_245CC6E88();

  return v7;
}

uint64_t sub_245CBF2A0(uint64_t a1)
{
  return sub_245CBF2B0(a1, qword_257518B18, 1);
}

uint64_t sub_245CBF2B0(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t result;
  _BYTE *v6;

  sub_245CC0770();
  result = swift_allocError();
  *a2 = result;
  *v6 = a3;
  return result;
}

void *static SCUIScreenTimePasscodeController.screenTimeUnavailable.getter()
{
  return sub_245CBF1E4(&qword_257518B10, (void **)qword_257518B18);
}

uint64_t static SCUIScreenTimePasscodeController.askUserForScreenTimePasscode(from:interventionType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575187E8);
  v3[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245CBF3B8()
{
  _QWORD *v0;
  uint64_t v1;
  void *ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t (*v18)(void);
  id v19;

  v1 = v0[4];
  if ((SCAUIFeatures.isEnabled.getter() & 1) != 0 && !v1)
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v0[2] = 0;
    v3 = objc_msgSend(ObjCClassFromMetadata, sel__isScreenTimePasscodeSet_, v0 + 2);
    v4 = (void *)v0[2];
    if (!v3)
    {
      v19 = v4;
      sub_245CC6E94();

      swift_willThrow();
      swift_task_dealloc();
      v18 = (uint64_t (*)(void))v0[1];
      return v18();
    }
    v5 = v3;
    v6 = v4;
    v7 = objc_msgSend(v5, sel_BOOLValue);

    if ((v7 & 1) != 0)
    {
      v9 = v0[5];
      v8 = v0[6];
      v10 = (void *)v0[3];
      v11 = sub_245CC7020();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
      sub_245CC7008();
      v12 = v10;
      v13 = sub_245CC6FFC();
      v14 = (_QWORD *)swift_allocObject();
      v15 = MEMORY[0x24BEE6930];
      v14[2] = v13;
      v14[3] = v15;
      v14[4] = v9;
      v14[5] = v12;
      v0[7] = sub_245CBFAB0(v8, (uint64_t)&unk_2575187F8, (uint64_t)v14);
      v16 = (_QWORD *)swift_task_alloc();
      v0[8] = v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257518800);
      *v16 = v0;
      v16[1] = sub_245CBF5E8;
      return sub_245CC702C();
    }
  }
  swift_task_dealloc();
  v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_245CBF5E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_245CBF6A0()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245CBF708()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245CBF768(uint64_t a1)
{
  unsigned __int8 v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  LOBYTE(v8[0]) = 1;
  v2 = 0;
  if ((SCAUIFeatures.isEnabled.getter() & 1) != 0 && !a1)
  {
    v8[0] = 0;
    v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel__isScreenTimePasscodeSet_, v8);
    v2 = v8[0];
    if (v3)
    {
      v4 = v3;
      v5 = v8[0];
      v2 = objc_msgSend(v4, sel_BOOLValue);

    }
    else
    {
      v6 = v8[0];
      sub_245CC6E94();

      swift_willThrow();
    }
  }
  return v2 & 1;
}

uint64_t sub_245CBF85C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[15] = a4;
  v5[16] = a5;
  sub_245CC7008();
  v5[17] = sub_245CC6FFC();
  v5[18] = sub_245CC6FE4();
  v5[19] = v6;
  return swift_task_switch();
}

uint64_t sub_245CBF8C8()
{
  _QWORD *v0;
  uint64_t v1;
  void *ObjCClassFromMetadata;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[16];
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v0[2] = v0;
  v0[3] = sub_245CBF968;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_245CBFA3C;
  v4[3] = &block_descriptor;
  v4[4] = v3;
  objc_msgSend(ObjCClassFromMetadata, sel__checkScreenTimePasscodeFromViewController_completionHandler_, v1, v4);
  return swift_continuation_await();
}

uint64_t sub_245CBF968()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 160) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_245CBF9C4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245CBF9F8()
{
  uint64_t v0;

  swift_release();
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245CBFA3C(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257518800);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_245CBFAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_245CC7020();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_245CC7014();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_245CC05EC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245CC6FE4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_245CBFD0C(void *a1, uint64_t a2, void *aBlock)
{
  _QWORD *v3;
  id v6;
  _QWORD *v7;

  v3[2] = a1;
  v3[3] = _Block_copy(aBlock);
  swift_getObjCClassMetadata();
  v6 = a1;
  v7 = (_QWORD *)swift_task_alloc();
  v3[4] = v7;
  *v7 = v3;
  v7[1] = sub_245CBFD94;
  return static SCUIScreenTimePasscodeController.askUserForScreenTimePasscode(from:interventionType:)((uint64_t)v6, a2);
}

uint64_t sub_245CBFD94()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 16);
  v3 = *v1;
  swift_task_dealloc();

  v4 = *(_QWORD *)(v3 + 24);
  if (v0)
  {
    v5 = (void *)sub_245CC6E88();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 24), 0);
  }
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

id static SCUIScreenTimePasscodeController.willScreenTimePasscodeBeRequired(for:)(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  LOBYTE(v9[0]) = 1;
  v2 = 0;
  if ((SCAUIFeatures.isEnabled.getter() & 1) != 0 && !a1)
  {
    v9[0] = 0;
    v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel__isScreenTimePasscodeSet_, v9);
    if (v3)
    {
      v4 = v3;
      v5 = v9[0];
      v2 = objc_msgSend(v4, sel_BOOLValue);

    }
    else
    {
      v6 = v9[0];
      v7 = (void *)sub_245CC6E94();

      swift_willThrow();
      return 0;
    }
  }
  return v2;
}

_QWORD *sub_245CBFF80@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_245CBFF90(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_245CBFF9C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_245CBFFC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245CC0018;
  return sub_245CBF85C((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_245CC0018()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_245CC0064()
{
  unint64_t result;

  result = qword_257518808;
  if (!qword_257518808)
  {
    result = MEMORY[0x24954608C](&unk_245CC862C, &_s13PasscodeErrorON);
    atomic_store(result, (unint64_t *)&qword_257518808);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s13PasscodeErrorOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s13PasscodeErrorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245CC0194 + 4 * byte_245CC8625[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245CC01C8 + 4 * byte_245CC8620[v4]))();
}

uint64_t sub_245CC01C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245CC01D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245CC01D8);
  return result;
}

uint64_t sub_245CC01E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245CC01ECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245CC01F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245CC01F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245CC0204(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245CC0210(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *_s13PasscodeErrorOMa()
{
  return &_s13PasscodeErrorON;
}

uint64_t sub_245CC022C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_245CC0258()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245CC0850;
  return ((uint64_t (*)(void *, uint64_t, void *))((char *)&dword_257518810 + dword_257518810))(v2, v3, v4);
}

uint64_t sub_245CC02D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_245CC0850;
  return v6();
}

uint64_t sub_245CC0328()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245CC0850;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_257518820 + dword_257518820))(v2, v3, v4);
}

uint64_t sub_245CC03A0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_245CC0850;
  return v7();
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245CC0424(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_245CC0018;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_257518830 + dword_257518830))(a1, v4, v5, v6);
}

uint64_t sub_245CC04A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245CC7020();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_245CC7014();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_245CC05EC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245CC6FE4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_245CC05EC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575187E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245CC062C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245CC0690;
  return v6(a1);
}

uint64_t sub_245CC0690()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245CC06DC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245CC0700(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245CC0850;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257518840 + dword_257518840))(a1, v4);
}

unint64_t sub_245CC0770()
{
  unint64_t result;

  result = qword_257518850;
  if (!qword_257518850)
  {
    result = MEMORY[0x24954608C](&unk_245CC86CC, &_s13PasscodeErrorON);
    atomic_store(result, (unint64_t *)&qword_257518850);
  }
  return result;
}

unint64_t sub_245CC07B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257518858;
  if (!qword_257518858)
  {
    v1 = sub_245CC6FF0();
    result = MEMORY[0x24954608C](MEMORY[0x24BEE6848], v1);
    atomic_store(result, (unint64_t *)&qword_257518858);
  }
  return result;
}

void type metadata accessor for SCUIInterventionType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_257518860)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_257518860);
  }
}

const char *SCAUIFeatures.domain.getter()
{
  return "SensitiveContentAnalysisUI";
}

const char *SCAUIFeatures.feature.getter()
{
  _BYTE *v0;

  if (*v0)
    return "u13_intervention";
  else
    return "improved_reporting";
}

void sub_245CC0898()
{
  qword_257518DA8 = MEMORY[0x24BEE4B00];
}

uint64_t sub_245CC08AC()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257518888);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_257518DB8 = result;
  return result;
}

uint64_t SCAUIFeatures.isEnabled.getter()
{
  char *v0;
  char v1;
  os_unfair_lock_s *v2;
  int v3;
  char v4;
  char v6[24];
  ValueMetadata *v7;
  unint64_t v8;

  v1 = *v0;
  if (qword_257518DB0 != -1)
    swift_once();
  v2 = (os_unfair_lock_s *)qword_257518DB8;
  MEMORY[0x24BDAC7A8]();
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  sub_245CC09DC(v6);
  v3 = v6[0];
  os_unfair_lock_unlock(v2 + 4);
  swift_release();
  if (v3 == 2)
  {
    v7 = &type metadata for SCAUIFeatures;
    v8 = sub_245CC1680();
    v6[0] = v1;
    v4 = sub_245CC6EC4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  else
  {
    v4 = v3 & 1;
  }
  return v4 & 1;
}

uint64_t sub_245CC09DC@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  char v7;

  v3 = *(_BYTE *)(v1 + 16);
  if (qword_257518DA0 != -1)
    swift_once();
  swift_beginAccess();
  v4 = qword_257518DA8;
  if (*(_QWORD *)(qword_257518DA8 + 16) && (v5 = sub_245CC114C(v3), (v6 & 1) != 0))
    v7 = *(_BYTE *)(*(_QWORD *)(v4 + 56) + v5);
  else
    v7 = 2;
  *a1 = v7;
  return swift_endAccess();
}

void static SCAUIFeatures.withForcedFeatureFlags<A>(_:_:)(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v2;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  uint64_t v8;

  if (qword_257518DB0 != -1)
    swift_once();
  v4 = (os_unfair_lock_s *)qword_257518DB8;
  MEMORY[0x24BDAC7A8]();
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  sub_245CC16E4(&v8);
  if (v2)
  {
    os_unfair_lock_unlock(v4 + 4);
    __break(1u);
  }
  else
  {
    v5 = v8;
    os_unfair_lock_unlock(v4 + 4);
    v6 = swift_release();
    a2(v6);
    v7 = (os_unfair_lock_s *)(qword_257518DB8 + 16);
    swift_retain();
    os_unfair_lock_lock(v7);
    sub_245CC10C4(v5);
    os_unfair_lock_unlock(v7);
    swift_release();
    swift_bridgeObjectRelease();
  }
}

uint64_t static SCAUIFeatures.withForcedFeatureFlags<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_245CC0BDC()
{
  _QWORD *v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  uint64_t (*v8)(_QWORD);
  uint64_t v9;

  if (qword_257518DB0 != -1)
    swift_once();
  v1 = v0[3];
  v2 = (os_unfair_lock_s *)qword_257518DB8;
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v1;
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = sub_245CC1A1C;
  *(_QWORD *)(v4 + 24) = v3;
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  (*(void (**)(uint64_t *__return_ptr))(v4 + 16))(&v9);
  v5 = (int *)v0[4];
  v0[6] = v9;
  os_unfair_lock_unlock(v2 + 4);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v8 = (uint64_t (*)(_QWORD))((char *)v5 + *v5);
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = v6;
  *v6 = v0;
  v6[1] = sub_245CC0D28;
  return v8(v0[2]);
}

uint64_t sub_245CC0D28()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245CC0D8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = (os_unfair_lock_s *)qword_257518DB8;
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v2;
  v5 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = sub_245CC1EF8;
  *(_QWORD *)(v5 + 24) = v4;
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  (*(void (**)(void))(v5 + 16))();
  os_unfair_lock_unlock(v3 + 4);
  if (v1)
    return swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245CC0E7C()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = (os_unfair_lock_s *)qword_257518DB8;
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v1;
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = sub_245CC1D68;
  *(_QWORD *)(v4 + 24) = v3;
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  (*(void (**)(void))(v4 + 16))();
  os_unfair_lock_unlock(v2 + 4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

SensitiveContentAnalysisUI::SCAUIFeatures_optional __swiftcall SCAUIFeatures.init(rawValue:)(Swift::UInt rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (SensitiveContentAnalysisUI::SCAUIFeatures_optional)rawValue;
}

uint64_t SCAUIFeatures.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_245CC0F90(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_245CC0FA8()
{
  sub_245CC7110();
  sub_245CC711C();
  return sub_245CC7128();
}

uint64_t sub_245CC0FEC()
{
  return sub_245CC711C();
}

uint64_t sub_245CC1014()
{
  sub_245CC7110();
  sub_245CC711C();
  return sub_245CC7128();
}

_QWORD *sub_245CC1054@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_245CC1074(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

const char *sub_245CC1080()
{
  return "SensitiveContentAnalysisUI";
}

const char *sub_245CC1094()
{
  _BYTE *v0;

  if (*v0)
    return "u13_intervention";
  else
    return "improved_reporting";
}

uint64_t sub_245CC10C4(uint64_t a1)
{
  if (qword_257518DA0 != -1)
    swift_once();
  swift_beginAccess();
  qword_257518DA8 = a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

unint64_t sub_245CC114C(char a1)
{
  char v1;
  uint64_t v2;

  v1 = a1 & 1;
  sub_245CC7110();
  sub_245CC711C();
  v2 = sub_245CC7128();
  return sub_245CC11A8(v1, v2);
}

unint64_t sub_245CC11A8(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_245CC1264(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v19;
  int64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257518880);
  result = sub_245CC7098();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v31 = a2;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1))
          goto LABEL_38;
        if (v8 >= v13)
        {
LABEL_29:
          if ((v31 & 1) == 0)
          {
            result = swift_release();
            v3 = v2;
            goto LABEL_36;
          }
          v30 = 1 << *(_BYTE *)(v5 + 32);
          if (v30 >= 64)
            bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          else
            *v9 = -1 << v30;
          v3 = v2;
          *(_QWORD *)(v5 + 16) = 0;
          break;
        }
        v19 = v9[v8];
        if (!v19)
        {
          v20 = v8 + 1;
          if (v8 + 1 >= v13)
            goto LABEL_29;
          v19 = v9[v20];
          if (!v19)
          {
            while (1)
            {
              v8 = v20 + 1;
              if (__OFADD__(v20, 1))
                break;
              if (v8 >= v13)
                goto LABEL_29;
              v19 = v9[v8];
              ++v20;
              if (v19)
                goto LABEL_19;
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_19:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v17);
      v22 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v17);
      sub_245CC7110();
      sub_245CC711C();
      result = sub_245CC7128();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v15) = v21;
      *(_BYTE *)(*(_QWORD *)(v7 + 56) + v15) = v22;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_36:
  *v3 = v7;
  return result;
}

void *sub_245CC1510()
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
  char v16;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257518880);
  v2 = *v0;
  v3 = sub_245CC708C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    if (!v18)
      break;
LABEL_23:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v16;
  }
  v19 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

unint64_t sub_245CC1680()
{
  unint64_t result;

  result = qword_257518868;
  if (!qword_257518868)
  {
    result = MEMORY[0x24954608C](&protocol conformance descriptor for SCAUIFeatures, &type metadata for SCAUIFeatures);
    atomic_store(result, (unint64_t *)&qword_257518868);
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

uint64_t sub_245CC16E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  char v12;
  char v13;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;

  v2 = *(_QWORD *)(v1 + 16);
  if (qword_257518DA0 != -1)
LABEL_42:
    swift_once();
  swift_beginAccess();
  v30 = v2 + 64;
  v3 = 1 << *(_BYTE *)(v2 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(v2 + 64);
  v31 = (unint64_t)(v3 + 63) >> 6;
  v28 = qword_257518DA8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = 0;
  while (1)
  {
    if (v5)
    {
      v7 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v8 = v7 | (v6 << 6);
      goto LABEL_27;
    }
    v9 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_41;
    if (v9 >= v31)
    {
LABEL_38:
      result = swift_release();
      *a1 = v28;
      return result;
    }
    v10 = *(_QWORD *)(v30 + 8 * v9);
    ++v6;
    if (!v10)
    {
      v6 = v9 + 1;
      if (v9 + 1 >= v31)
        goto LABEL_38;
      v10 = *(_QWORD *)(v30 + 8 * v6);
      if (!v10)
      {
        v6 = v9 + 2;
        if (v9 + 2 >= v31)
          goto LABEL_38;
        v10 = *(_QWORD *)(v30 + 8 * v6);
        if (!v10)
        {
          v6 = v9 + 3;
          if (v9 + 3 >= v31)
            goto LABEL_38;
          v10 = *(_QWORD *)(v30 + 8 * v6);
          if (!v10)
          {
            v6 = v9 + 4;
            if (v9 + 4 >= v31)
              goto LABEL_38;
            v10 = *(_QWORD *)(v30 + 8 * v6);
            if (!v10)
              break;
          }
        }
      }
    }
LABEL_26:
    v5 = (v10 - 1) & v10;
    v8 = __clz(__rbit64(v10)) + (v6 << 6);
LABEL_27:
    v12 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v8);
    v13 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v8);
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = (_QWORD *)qword_257518DA8;
    v32 = qword_257518DA8;
    qword_257518DA8 = 0x8000000000000000;
    v17 = sub_245CC114C(v12);
    v18 = v15[2];
    v19 = (v16 & 1) == 0;
    v20 = v18 + v19;
    if (__OFADD__(v18, v19))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    v21 = v16;
    if (v15[3] >= v20)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v16 & 1) != 0)
          goto LABEL_5;
      }
      else
      {
        sub_245CC1510();
        v15 = (_QWORD *)v32;
        if ((v21 & 1) != 0)
          goto LABEL_5;
      }
    }
    else
    {
      sub_245CC1264(v20, isUniquelyReferenced_nonNull_native);
      v15 = (_QWORD *)v32;
      v22 = sub_245CC114C(v12);
      if ((v21 & 1) != (v23 & 1))
        goto LABEL_44;
      v17 = v22;
      if ((v21 & 1) != 0)
      {
LABEL_5:
        *(_BYTE *)(v15[7] + v17) = v13;
        goto LABEL_6;
      }
    }
    v15[(v17 >> 6) + 8] |= 1 << v17;
    *(_BYTE *)(v15[6] + v17) = v12;
    *(_BYTE *)(v15[7] + v17) = v13;
    v24 = v15[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_40;
    v15[2] = v26;
LABEL_6:
    qword_257518DA8 = (uint64_t)v15;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  v11 = v9 + 5;
  if (v11 >= v31)
    goto LABEL_38;
  v10 = *(_QWORD *)(v30 + 8 * v11);
  if (v10)
  {
    v6 = v11;
    goto LABEL_26;
  }
  while (1)
  {
    v6 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v6 >= v31)
      goto LABEL_38;
    v10 = *(_QWORD *)(v30 + 8 * v6);
    ++v11;
    if (v10)
      goto LABEL_26;
  }
  __break(1u);
LABEL_44:
  result = sub_245CC70D4();
  __break(1u);
  return result;
}

uint64_t sub_245CC1A1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;

  isUniquelyReferenced_nonNull_native = *(_QWORD *)(v1 + 16);
  if (qword_257518DA0 != -1)
LABEL_42:
    swift_once();
  swift_beginAccess();
  v30 = isUniquelyReferenced_nonNull_native + 64;
  v3 = 1 << *(_BYTE *)(isUniquelyReferenced_nonNull_native + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(isUniquelyReferenced_nonNull_native + 64);
  v31 = (unint64_t)(v3 + 63) >> 6;
  v28 = qword_257518DA8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = 0;
  while (1)
  {
    if (v5)
    {
      v7 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v8 = v7 | (v6 << 6);
      goto LABEL_27;
    }
    v9 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_41;
    if (v9 >= v31)
    {
LABEL_38:
      result = swift_release();
      *a1 = v28;
      return result;
    }
    v10 = *(_QWORD *)(v30 + 8 * v9);
    ++v6;
    if (!v10)
    {
      v6 = v9 + 1;
      if (v9 + 1 >= v31)
        goto LABEL_38;
      v10 = *(_QWORD *)(v30 + 8 * v6);
      if (!v10)
      {
        v6 = v9 + 2;
        if (v9 + 2 >= v31)
          goto LABEL_38;
        v10 = *(_QWORD *)(v30 + 8 * v6);
        if (!v10)
        {
          v6 = v9 + 3;
          if (v9 + 3 >= v31)
            goto LABEL_38;
          v10 = *(_QWORD *)(v30 + 8 * v6);
          if (!v10)
          {
            v6 = v9 + 4;
            if (v9 + 4 >= v31)
              goto LABEL_38;
            v10 = *(_QWORD *)(v30 + 8 * v6);
            if (!v10)
              break;
          }
        }
      }
    }
LABEL_26:
    v5 = (v10 - 1) & v10;
    v8 = __clz(__rbit64(v10)) + (v6 << 6);
LABEL_27:
    v12 = isUniquelyReferenced_nonNull_native;
    v13 = *(_BYTE *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 48) + v8);
    v14 = *(_BYTE *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + v8);
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = (_QWORD *)qword_257518DA8;
    v32 = qword_257518DA8;
    qword_257518DA8 = 0x8000000000000000;
    v17 = sub_245CC114C(v13);
    v18 = v15[2];
    v19 = (v16 & 1) == 0;
    v20 = v18 + v19;
    if (__OFADD__(v18, v19))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    v21 = v16;
    if (v15[3] >= v20)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v16 & 1) != 0)
          goto LABEL_5;
      }
      else
      {
        sub_245CC1510();
        v15 = (_QWORD *)v32;
        if ((v21 & 1) != 0)
          goto LABEL_5;
      }
    }
    else
    {
      sub_245CC1264(v20, isUniquelyReferenced_nonNull_native);
      v15 = (_QWORD *)v32;
      v22 = sub_245CC114C(v13);
      if ((v21 & 1) != (v23 & 1))
        goto LABEL_44;
      v17 = v22;
      if ((v21 & 1) != 0)
      {
LABEL_5:
        *(_BYTE *)(v15[7] + v17) = v14;
        goto LABEL_6;
      }
    }
    v15[(v17 >> 6) + 8] |= 1 << v17;
    *(_BYTE *)(v15[6] + v17) = v13;
    *(_BYTE *)(v15[7] + v17) = v14;
    v24 = v15[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_40;
    v15[2] = v26;
LABEL_6:
    qword_257518DA8 = (uint64_t)v15;
    swift_bridgeObjectRelease();
    swift_endAccess();
    isUniquelyReferenced_nonNull_native = v12;
  }
  v11 = v9 + 5;
  if (v11 >= v31)
    goto LABEL_38;
  v10 = *(_QWORD *)(v30 + 8 * v11);
  if (v10)
  {
    v6 = v11;
    goto LABEL_26;
  }
  while (1)
  {
    v6 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v6 >= v31)
      goto LABEL_38;
    v10 = *(_QWORD *)(v30 + 8 * v6);
    ++v11;
    if (v10)
      goto LABEL_26;
  }
  __break(1u);
LABEL_44:
  result = sub_245CC70D4();
  __break(1u);
  return result;
}

uint64_t sub_245CC1D68()
{
  uint64_t v0;

  return sub_245CC10C4(*(_QWORD *)(v0 + 16));
}

unint64_t sub_245CC1D94()
{
  unint64_t result;

  result = qword_257518878;
  if (!qword_257518878)
  {
    result = MEMORY[0x24954608C](&protocol conformance descriptor for SCAUIFeatures, &type metadata for SCAUIFeatures);
    atomic_store(result, (unint64_t *)&qword_257518878);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SCAUIFeatures(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245CC1E24 + 4 * byte_245CC87A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245CC1E58 + 4 * byte_245CC87A0[v4]))();
}

uint64_t sub_245CC1E58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245CC1E60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245CC1E68);
  return result;
}

uint64_t sub_245CC1E74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245CC1E7CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245CC1E80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245CC1E88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SCAUIFeatures()
{
  return &type metadata for SCAUIFeatures;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_257518890)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_257518890);
  }
}

uint64_t sub_245CC1EF8()
{
  return sub_245CC1D68();
}

void static Entitlements.current.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t Entitlements.init(testDict:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Entitlements.check(_:)(Swift::OpaquePointer a1)
{
  void **v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  sub_245CC29CC((uint64_t)a1._rawValue);
  if (v3)
  {
    sub_245CC1FBC(0, 0xE000000000000000, 0, v3, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_245CC2D40();
    swift_allocError();
    *(_OWORD *)v4 = xmmword_245CC88E0;
    *(_QWORD *)(v4 + 16) = 0x8000000000000000;
    swift_willThrow();
  }
}

{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  v3 = v2;
  v4 = *((_QWORD *)a1._rawValue + 2);
  if (v4)
  {
    v6 = *v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = (uint64_t *)((char *)a1._rawValue + 40);
    while (1)
    {
      v8 = *(v7 - 1);
      v9 = *v7;
      v10[5] = v6;
      swift_bridgeObjectRetain();
      sub_245CC2FAC(v8, v9, (uint64_t)v10);
      if (v3)
        break;
      v7 += 2;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
      swift_bridgeObjectRelease();
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
  }
}

void sub_245CC1FBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70[2];
  unint64_t v71;
  id v72;

  v6 = v5;
  v62 = a4 + 64;
  v8 = 1 << *(_BYTE *)(a4 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a4 + 64);
  v63 = (unint64_t)(v8 + 63) >> 6;
  swift_bridgeObjectRetain();
  v11 = 0;
  v64 = a3;
  while (1)
  {
    if (v10)
    {
      v67 = (v10 - 1) & v10;
      v12 = __clz(__rbit64(v10)) | (v11 << 6);
      goto LABEL_17;
    }
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      goto LABEL_70;
    }
    if (v11 >= v63)
      goto LABEL_65;
    v14 = *(_QWORD *)(v62 + 8 * v11);
    if (!v14)
      break;
LABEL_16:
    v67 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_17:
    v16 = (uint64_t *)(*(_QWORD *)(a4 + 48) + 16 * v12);
    v17 = *v16;
    v18 = v16[1];
    v19 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    v20 = v19;
    v21 = (void *)sub_245CC6F90();
    v22 = (void *)sub_245CC6F90();
    v23 = objc_msgSend(v21, sel_stringByAppendingPathComponent_, v22);

    v24 = sub_245CC6F9C();
    v26 = v25;

    v68 = v26;
    v65 = v24;
    if (!a3)
    {
      v72 = a5;
      sub_245CC2FAC(v17, v18, (uint64_t)v70);
      v32 = v6;
      if (v6)
      {
        swift_bridgeObjectRelease();
        v29 = 0;
LABEL_25:
        v72 = v32;
        v34 = v32;
        __swift_instantiateConcreteTypeFromMangledName(&qword_257518800);
        if (swift_dynamicCast())
        {
          v35 = v70[0];
          v36 = v70[1];
          v37 = v71;
          if (v71 >> 61 == 3)
          {

            objc_opt_self();
            v38 = swift_dynamicCastObjCClass();
            if (!v38
              || (v39 = v38, v69 = 2,
                             v40 = v20,
                             MEMORY[0x2495459F0](v39, &v69),
                             v40,
                             v69 == 2)
              || (v69 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              sub_245CC2D40();
              swift_allocError();
              *(_QWORD *)v56 = v35;
              *(_OWORD *)(v56 + 8) = xmmword_245CC88F0;
              swift_willThrow();
              swift_release();

              return;
            }
            sub_245CC3448(v35, v36, v37);
            v30 = (id)sub_245CC6FCC();

            goto LABEL_34;
          }

          swift_bridgeObjectRelease();
          sub_245CC3448(v35, v36, v37);
        }
        else
        {
          swift_bridgeObjectRelease();

        }
        swift_release();

        return;
      }
      sub_245CC39C8();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v29 = 0;
        v30 = v72;
        goto LABEL_33;
      }
      sub_245CC2D40();
      v32 = (void *)swift_allocError();
      *v54 = v17;
      v54[1] = v18;
      v54[2] = 0x2000000000000000;
LABEL_22:
      swift_willThrow();
      v29 = 0;
      goto LABEL_25;
    }
    if (!*(_QWORD *)(a3 + 16) || (v27 = sub_245CC3838(v17, v18), (v28 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575188A0);
      v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_245CC8510;
      *(_QWORD *)(v31 + 32) = v24;
      *(_QWORD *)(v31 + 40) = v26;
      sub_245CC2D40();
      v32 = (void *)swift_allocError();
      *(_QWORD *)v33 = v31;
      *(_OWORD *)(v33 + 8) = xmmword_245CC88F0;
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
    v29 = v6;
    v30 = *(id *)(*(_QWORD *)(a3 + 56) + 8 * v27);
LABEL_33:
    swift_bridgeObjectRelease();
LABEL_34:
    objc_opt_self();
    if (swift_dynamicCastObjCClass()
      && (v70[0] = 0, sub_245CC39C8(), v41 = v30, sub_245CC6F78(), v41, (v42 = v70[0]) != 0))
    {
      objc_opt_self();
      if (!swift_dynamicCastObjCClass()
        || (v70[0] = 0, v43 = v20, sub_245CC6F78(), v43, !v70[0]))
      {
        swift_bridgeObjectRelease();
        goto LABEL_41;
      }
      sub_245CC1FBC(v65, v26, v42, v70[0], a5);
      v6 = v29;
      if (v29)
      {
        swift_release();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
LABEL_52:
      a3 = v64;
      v10 = v67;
    }
    else
    {
LABEL_41:
      objc_opt_self();
      if (!swift_dynamicCastObjCClass())
        goto LABEL_50;
      v70[0] = 0;
      v44 = v30;
      sub_245CC6FB4();

      v45 = v70[0];
      if (!v70[0])
        goto LABEL_50;
      objc_opt_self();
      if (!swift_dynamicCastObjCClass()
        || (v70[0] = 0, v46 = v20, sub_245CC6FB4(), v46, (v47 = v70[0]) == 0))
      {
        swift_bridgeObjectRelease();
LABEL_50:
        sub_245CC39C8();
        if ((sub_245CC7044() & 1) == 0)
        {
          sub_245CC2D40();
          swift_allocError();
          *v57 = v65;
          v57[1] = v68;
          v57[2] = 0x4000000000000000;
          swift_willThrow();
          swift_release();

          return;
        }
        swift_bridgeObjectRelease();

        v6 = v29;
        goto LABEL_52;
      }
      v60 = v46;
      v48 = (void *)sub_245CC7038();
      v72 = v48;
      v49 = *(_QWORD *)(v47 + 16);
      if (v49)
      {
        v50 = (uint64_t *)(v47 + 40);
        do
        {
          v51 = *(v50 - 1);
          v52 = *v50;
          swift_bridgeObjectRetain();
          sub_245CC3A04(v70, v51, v52);
          swift_bridgeObjectRelease();
          v50 += 2;
          --v49;
        }
        while (v49);
        swift_bridgeObjectRelease();
        v53 = (uint64_t)v72;
      }
      else
      {
        v53 = (uint64_t)v48;
        swift_bridgeObjectRelease();
      }
      v55 = sub_245CC3BB0(v45, v53);
      swift_bridgeObjectRelease();
      v6 = v29;
      a3 = v64;
      if (*(_QWORD *)(v55 + 16))
      {
        swift_bridgeObjectRetain();
        v58 = sub_245CC4EE8(v55);
        swift_release();
        swift_bridgeObjectRelease_n();
        sub_245CC2D40();
        swift_allocError();
        *(_QWORD *)v59 = v58;
        *(_OWORD *)(v59 + 8) = xmmword_245CC88F0;
        swift_willThrow();
        swift_release();

        return;
      }
      swift_release();
      swift_bridgeObjectRelease();

      v10 = v67;
    }
  }
  v15 = v11 + 1;
  if (v11 + 1 >= v63)
    goto LABEL_65;
  v14 = *(_QWORD *)(v62 + 8 * v15);
  if (v14)
    goto LABEL_15;
  v15 = v11 + 2;
  if (v11 + 2 >= v63)
    goto LABEL_65;
  v14 = *(_QWORD *)(v62 + 8 * v15);
  if (v14)
    goto LABEL_15;
  v15 = v11 + 3;
  if (v11 + 3 >= v63)
  {
LABEL_65:
    swift_release();
    return;
  }
  v14 = *(_QWORD *)(v62 + 8 * v15);
  if (v14)
  {
LABEL_15:
    v11 = v15;
    goto LABEL_16;
  }
  while (1)
  {
    v11 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v11 >= v63)
      goto LABEL_65;
    v14 = *(_QWORD *)(v62 + 8 * v11);
    ++v15;
    if (v14)
      goto LABEL_16;
  }
LABEL_70:
  __break(1u);
}

void Entitlements.value<A>(for:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  char v14;
  uint64_t v15;
  void (*v16)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t *v17;
  _BYTE v18[32];
  uint64_t v19;

  v10 = sub_245CC7050();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = &v18[-v12];
  v19 = *v4;
  sub_245CC2FAC(a1, a2, (uint64_t)v18);
  if (!v5)
  {
    v14 = swift_dynamicCast();
    v15 = *(_QWORD *)(a3 - 8);
    v16 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    if ((v14 & 1) != 0)
    {
      v16(v13, 0, 1, a3);
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v15 + 32))(a4, v13, a3);
    }
    else
    {
      v16(v13, 1, 1, a3);
      (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
      sub_245CC2D40();
      swift_allocError();
      *v17 = a1;
      v17[1] = a2;
      v17[2] = 0x2000000000000000;
      swift_bridgeObjectRetain();
      swift_willThrow();
    }
  }
}

void sub_245CC29CC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  int64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33[32];
  _QWORD v34[2];
  uint64_t v35;

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575188C8);
    v2 = (_QWORD *)sub_245CC70A4();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v30 = v1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 64);
  v29 = (unint64_t)(63 - v4) >> 6;
  v6 = &v35;
  swift_bridgeObjectRetain();
  v7 = 0;
  v8 = (uint64_t *)&unk_2575188D0;
  while (1)
  {
    if (v5)
    {
      v31 = (v5 - 1) & v5;
      v14 = __clz(__rbit64(v5)) | (v7 << 6);
      v15 = v7;
    }
    else
    {
      v16 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_36;
      if (v16 >= v29)
      {
LABEL_33:
        sub_245CC510C();
        return;
      }
      v17 = *(_QWORD *)(v30 + 8 * v16);
      v15 = v7 + 1;
      if (!v17)
      {
        v15 = v7 + 2;
        if (v7 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v30 + 8 * v15);
        if (!v17)
        {
          v15 = v7 + 3;
          if (v7 + 3 >= v29)
            goto LABEL_33;
          v17 = *(_QWORD *)(v30 + 8 * v15);
          if (!v17)
          {
            v15 = v7 + 4;
            if (v7 + 4 >= v29)
              goto LABEL_33;
            v17 = *(_QWORD *)(v30 + 8 * v15);
            if (!v17)
            {
              v18 = v7 + 5;
              if (v7 + 5 >= v29)
                goto LABEL_33;
              v17 = *(_QWORD *)(v30 + 8 * v18);
              if (!v17)
              {
                while (1)
                {
                  v15 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_37;
                  if (v15 >= v29)
                    goto LABEL_33;
                  v17 = *(_QWORD *)(v30 + 8 * v15);
                  ++v18;
                  if (v17)
                    goto LABEL_26;
                }
              }
              v15 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v31 = (v17 - 1) & v17;
      v14 = __clz(__rbit64(v17)) + (v15 << 6);
    }
    v19 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v14);
    v20 = *v19;
    v21 = v19[1];
    sub_245CC38AC(*(_QWORD *)(v1 + 56) + 32 * v14, (uint64_t)v6);
    v34[0] = v20;
    v34[1] = v21;
    sub_245CC38AC((uint64_t)v6, (uint64_t)v33);
    swift_bridgeObjectRetain_n();
    sub_245CC50D0((uint64_t)v34, v8);
    sub_245CC39C8();
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();

      sub_245CC510C();
      swift_release();
      return;
    }
    v22 = sub_245CC3838(v20, v21);
    v23 = v22;
    if ((v24 & 1) != 0)
    {
      v9 = v6;
      v10 = v1;
      v11 = v8;
      v12 = (uint64_t *)(v2[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *v12 = v20;
      v12[1] = v21;
      v13 = v2[7];

      *(_QWORD *)(v13 + 8 * v23) = v32;
      v8 = v11;
      v1 = v10;
      v6 = v9;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v22;
    v25 = (uint64_t *)(v2[6] + 16 * v22);
    *v25 = v20;
    v25[1] = v21;
    *(_QWORD *)(v2[7] + 8 * v22) = v32;
    v26 = v2[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_35;
    v2[2] = v28;
LABEL_8:
    v7 = v15;
    v5 = v31;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

unint64_t sub_245CC2D40()
{
  unint64_t result;

  result = qword_257518898;
  if (!qword_257518898)
  {
    result = MEMORY[0x24954608C](&protocol conformance descriptor for Entitlements.Error, &type metadata for Entitlements.Error);
    atomic_store(result, (unint64_t *)&qword_257518898);
  }
  return result;
}

void Entitlements.check<A>(_:equals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v16[2];

  v9 = *(_QWORD *)(a4 - 8);
  v10 = MEMORY[0x24BDAC7A8]();
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = *v4;
  Entitlements.value<A>(for:)(v10, v13, v14, (uint64_t)v12);
  if (!v5)
  {
    if ((sub_245CC6F84() & 1) == 0)
    {
      sub_245CC2D40();
      swift_allocError();
      *v15 = a1;
      v15[1] = a2;
      v15[2] = 0x4000000000000000;
      swift_bridgeObjectRetain();
      swift_willThrow();
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, a4);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Entitlements.check(_:)(Swift::String a1)
{
  uint64_t v1;
  _BYTE v2[32];

  sub_245CC2FAC(a1._countAndFlagsBits, (uint64_t)a1._object, (uint64_t)v2);
  if (!v1)
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

void sub_245CC2FAC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v7;
  unint64_t v8;
  char v9;
  SecTaskRef v10;
  __SecTask *v11;
  __CFString *v12;
  CFTypeRef v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  CFErrorRef error[5];

  error[4] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  v7 = *v3;
  if (v7)
  {
    if (*(_QWORD *)(v7 + 16))
    {
      swift_bridgeObjectRetain();
      v8 = sub_245CC3838(a1, a2);
      if ((v9 & 1) != 0)
      {
        sub_245CC38AC(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&v22);
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v23 + 1))
        {
          sub_245CC389C(&v22, error);
          sub_245CC389C(error, (_OWORD *)a3);
          return;
        }
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
    }
    sub_245CC50D0((uint64_t)&v22, &qword_2575188B0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575188A0);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_245CC8510;
    *(_QWORD *)(v14 + 32) = a1;
    *(_QWORD *)(v14 + 40) = a2;
    sub_245CC2D40();
    swift_allocError();
    *(_QWORD *)v15 = v14;
    *(_OWORD *)(v15 + 8) = xmmword_245CC88F0;
    swift_bridgeObjectRetain();
    goto LABEL_13;
  }
  v10 = SecTaskCreateFromSelf(0);
  if (!v10)
  {
    sub_245CC2D40();
    swift_allocError();
    *v16 = 0;
    v16[1] = 0;
    v16[2] = 0x8000000000000000;
LABEL_13:
    swift_willThrow();
    return;
  }
  v11 = v10;
  error[0] = 0;
  v12 = (__CFString *)sub_245CC6F90();
  v13 = SecTaskCopyValueForEntitlement(v11, v12, error);

  if (v13)
  {
    *(_QWORD *)(a3 + 24) = swift_getObjectType();

    *(_QWORD *)a3 = v13;
  }
  else if (error[0]
         && (*(CFErrorRef *)&v22 = error[0],
             __swift_instantiateConcreteTypeFromMangledName(&qword_2575188A8),
             __swift_instantiateConcreteTypeFromMangledName(&qword_257518800),
             (swift_dynamicCast() & 1) != 0))
  {
    sub_245CC2D40();
    swift_allocError();
    *v17 = a1;
    v17[1] = a2;
    v17[2] = (uint64_t)v21;
    swift_bridgeObjectRetain();
    v18 = v21;
    swift_willThrow();

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575188A0);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_245CC8510;
    *(_QWORD *)(v19 + 32) = a1;
    *(_QWORD *)(v19 + 40) = a2;
    sub_245CC2D40();
    swift_allocError();
    *(_QWORD *)v20 = v19;
    *(_OWORD *)(v20 + 8) = xmmword_245CC88F0;
    swift_bridgeObjectRetain();
    swift_willThrow();

  }
}

_QWORD *assignWithCopy for Entitlements(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for Entitlements(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Entitlements(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Entitlements(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
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

ValueMetadata *type metadata accessor for Entitlements()
{
  return &type metadata for Entitlements;
}

id sub_245CC33E0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id result;

  switch(a3 >> 61)
  {
    case 0uLL:
      swift_bridgeObjectRetain();
      result = (id)a3;
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

void destroy for Entitlements.Error(uint64_t a1)
{
  sub_245CC3448(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

void sub_245CC3448(uint64_t a1, uint64_t a2, unint64_t a3)
{
  switch(a3 >> 61)
  {
    case 0uLL:
      swift_bridgeObjectRelease();

      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t *_s26SensitiveContentAnalysisUI12EntitlementsV5ErrorOwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_245CC33E0(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t *assignWithCopy for Entitlements.Error(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_245CC33E0(*a2, v4, v5);
  v6 = *a1;
  v7 = a1[1];
  v8 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_245CC3448(v6, v7, v8);
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

uint64_t *assignWithTake for Entitlements.Error(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *a1;
  v6 = a1[1];
  v5 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_245CC3448(v4, v6, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for Entitlements.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7C && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 124);
  v3 = (((*(_QWORD *)(a1 + 16) >> 57) >> 4) | (8
                                                           * ((*(_QWORD *)(a1 + 16) >> 57) & 8 | *(_QWORD *)(a1 + 16) & 7))) ^ 0x7F;
  if (v3 >= 0x7B)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for Entitlements.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7B)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 124;
    if (a3 >= 0x7C)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7C)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_245CC3644(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16) >> 61;
  if (v1 <= 3)
    return v1;
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_245CC3660(uint64_t result)
{
  *(_QWORD *)(result + 16) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_245CC3670(uint64_t result, uint64_t a2)
{
  if (a2 < 4)
  {
    *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 0xFFFFFFFFFFFFFF8 | (a2 << 61);
  }
  else
  {
    *(_QWORD *)result = (a2 - 4);
    *(_OWORD *)(result + 8) = xmmword_245CC8900;
  }
  return result;
}

ValueMetadata *type metadata accessor for Entitlements.Error()
{
  return &type metadata for Entitlements.Error;
}

_QWORD *initializeBufferWithCopyOfBuffer for Entitlements.Source(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Entitlements.Source()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for Entitlements.Source(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for Entitlements.Source(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Entitlements.Source(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Entitlements.Source(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_245CC37F0(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_245CC3808(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for Entitlements.Source()
{
  return &type metadata for Entitlements.Source;
}

unint64_t sub_245CC3838(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_245CC7110();
  sub_245CC6FA8();
  v4 = sub_245CC7128();
  return sub_245CC38E8(a1, a2, v4);
}

_OWORD *sub_245CC389C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_245CC38AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_245CC38E8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_245CC70BC() & 1) == 0)
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
      while (!v14 && (sub_245CC70BC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_245CC39C8()
{
  unint64_t result;

  result = qword_2575188B8;
  if (!qword_2575188B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575188B8);
  }
  return result;
}

uint64_t sub_245CC3A04(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_245CC7110();
  swift_bridgeObjectRetain();
  sub_245CC6FA8();
  v8 = sub_245CC7128();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_245CC70BC() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_245CC70BC() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_245CC4654(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_245CC3BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  char v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = a2;
  v27 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  v25 = a1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a2 + 56;
    v24[0] = a1 + 32;
    swift_bridgeObjectRetain();
    v5 = 0;
    while (1)
    {
      v6 = (uint64_t *)(v24[0] + 16 * v5);
      v8 = *v6;
      v7 = v6[1];
      ++v5;
      sub_245CC7110();
      swift_bridgeObjectRetain();
      sub_245CC6FA8();
      v9 = sub_245CC7128();
      v10 = -1 << *(_BYTE *)(v2 + 32);
      v11 = v9 & ~v10;
      if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
      {
        v12 = *(_QWORD *)(v2 + 48);
        v13 = (_QWORD *)(v12 + 16 * v11);
        v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (sub_245CC70BC() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v26 = v5;
LABEL_19:
          v18 = *(_BYTE *)(v2 + 32);
          v19 = (unint64_t)((1 << v18) + 63) >> 6;
          v20 = 8 * v19;
          if ((v18 & 0x3Fu) < 0xE || swift_stdlib_isStackAllocationSafe())
          {
            MEMORY[0x24BDAC7A8]();
            memcpy((char *)v24 - ((v20 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v20);
            v21 = sub_245CC4198((uint64_t)v24 - ((v20 + 15) & 0x3FFFFFFFFFFFFFF0), v19, v2, v11, &v25);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            v22 = (void *)swift_slowAlloc();
            memcpy(v22, (const void *)(v2 + 56), v20);
            v21 = sub_245CC4198((uint64_t)v22, v19, v2, v11, &v25);
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x2495460EC](v22, -1, -1);
          }
          return v21;
        }
        v15 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v15;
          if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
            break;
          v16 = (_QWORD *)(v12 + 16 * v11);
          v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (sub_245CC70BC() & 1) != 0)
          {
            v26 = v5;
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

uint64_t sub_245CC3EBC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575188C0);
  v3 = sub_245CC7068();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_245CC7110();
      sub_245CC6FA8();
      result = sub_245CC7128();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_245CC4198(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t i;
  unint64_t v26;
  _QWORD *v27;
  BOOL v28;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v30 = (unint64_t *)result;
  v31 = v6 - 1;
  v8 = *a5;
  v7 = a5[1];
  v9 = *(_QWORD *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return sub_245CC43C0(v30, a2, v31, a3);
  }
  v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9)
      goto LABEL_29;
    v11 = v8 + 16 * v7;
    v13 = *(_QWORD *)(v11 + 32);
    v12 = *(_QWORD *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_245CC7110();
    swift_bridgeObjectRetain();
    sub_245CC6FA8();
    v14 = sub_245CC7128();
    v15 = -1 << *(_BYTE *)(a3 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = 1 << v16;
    if (((1 << v16) & *(_QWORD *)(v32 + 8 * (v16 >> 6))) == 0)
      goto LABEL_4;
    v19 = *(_QWORD *)(a3 + 48);
    v20 = (_QWORD *)(v19 + 16 * v16);
    v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_245CC70BC() & 1) == 0)
    {
      v24 = ~v15;
      for (i = v16 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v19 + 16 * v26);
        v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_245CC70BC() & 1) != 0)
        {
          result = swift_bridgeObjectRelease();
          v17 = v26 >> 6;
          v18 = 1 << v26;
          goto LABEL_15;
        }
      }
LABEL_4:
      result = swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    result = swift_bridgeObjectRelease();
LABEL_15:
    v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      v23 = v31 - 1;
      if (__OFSUB__(v31, 1))
        goto LABEL_30;
      --v31;
      if (!v23)
        return MEMORY[0x24BEE4B08];
    }
LABEL_5:
    v8 = *a5;
    v7 = a5[1];
    v9 = *(_QWORD *)(*a5 + 16);
    if (v7 == v9)
      goto LABEL_2;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_245CC43C0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575188C0);
  result = sub_245CC7074();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_245CC7110();
    swift_bridgeObjectRetain();
    sub_245CC6FA8();
    result = sub_245CC7128();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_245CC4654(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_245CC3EBC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_245CC47EC();
      goto LABEL_22;
    }
    sub_245CC499C();
  }
  v11 = *v4;
  sub_245CC7110();
  sub_245CC6FA8();
  result = sub_245CC7128();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_245CC70BC(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_245CC70C8();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_245CC70BC();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_245CC47EC()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575188C0);
  v2 = *v0;
  v3 = sub_245CC705C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_245CC499C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575188C0);
  v3 = sub_245CC7068();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_245CC7110();
    swift_bridgeObjectRetain();
    sub_245CC6FA8();
    result = sub_245CC7128();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_245CC4C48(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_245CC4C64(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_245CC4C64(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575188A0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_245CC4D64(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

int64_t sub_245CC4E04(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_245CC4EE8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  int64_t v5;
  int v6;
  int v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v3 = a1;
  v23 = MEMORY[0x24BEE4AF8];
  sub_245CC4C48(0, v1, 0);
  v2 = v23;
  result = sub_245CC4D64(v3);
  v5 = result;
  v7 = v6;
  v9 = v8 & 1;
  v21 = v3;
  v22 = v3 + 56;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(v3 + 32))
  {
    if (((*(_QWORD *)(v22 + (((unint64_t)v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      goto LABEL_13;
    if (*(_DWORD *)(v3 + 36) != v7)
      goto LABEL_14;
    swift_bridgeObjectRetain();
    v10 = (void *)sub_245CC6F90();
    v11 = (void *)sub_245CC6F90();
    v12 = objc_msgSend(v10, sel_stringByAppendingPathComponent_, v11);

    v13 = sub_245CC6F9C();
    v15 = v14;
    swift_bridgeObjectRelease();

    v17 = *(_QWORD *)(v23 + 16);
    v16 = *(_QWORD *)(v23 + 24);
    if (v17 >= v16 >> 1)
      sub_245CC4C48((char *)(v16 > 1), v17 + 1, 1);
    *(_QWORD *)(v23 + 16) = v17 + 1;
    v18 = v23 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v13;
    *(_QWORD *)(v18 + 40) = v15;
    v3 = v21;
    result = sub_245CC4E04(v5, v7, v9 & 1, v21);
    v5 = result;
    v7 = v19;
    v9 = v20 & 1;
    if (!--v1)
    {
      sub_245CC50C0(result, v19, v20 & 1);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_245CC50C0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_245CC50D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245CC510C()
{
  return swift_release();
}

void type metadata accessor for CFError()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2575188D8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2575188D8);
  }
}

uint64_t sub_245CC5170@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_245CC68D0(0, &qword_2575188F8);
  result = sub_245CC7080();
  *a1 = result;
  return result;
}

uint64_t sub_245CC51C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_245CC68D0(0, &qword_2575188F0);
  result = sub_245CC7080();
  *a1 = result;
  return result;
}

uint64_t SCUIMoreHelpContextMenuSwiftUI.SCUIHelpMenuActions.init(messageSomeoneAction:blockContactAction:blockContactsAction:moreHelpAction:leaveChatAction:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  return result;
}

uint64_t SCUIMoreHelpContextMenuSwiftUI.init(options:contentView:showTitle:actions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, __int128 *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  double v20;
  __int128 v22[5];

  v14 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend((id)objc_opt_self(), sel_getCurrentInterventionType);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, a5);
  v18 = a4[1];
  v22[0] = *a4;
  v22[1] = v18;
  v19 = a4[3];
  v22[2] = a4[2];
  v22[3] = v19;
  v22[4] = a4[4];
  v20 = SCUIMoreHelpContextMenuSwiftUI.init(options:interventionType:contentView:showTitle:actions:)(a1, (uint64_t)v17, (uint64_t)v16, a3, v22, a5, a6, a7);
  return (*(uint64_t (**)(uint64_t, uint64_t, double))(v14 + 8))(a2, a5, v20);
}

double SCUIMoreHelpContextMenuSwiftUI.init(options:interventionType:contentView:showTitle:actions:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, __int128 *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  void (*v20)(char *, uint64_t);
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  int *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  double result;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  int v35;

  v35 = a4;
  v34 = a3;
  v14 = sub_245CC6EB8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245CC6EAC();
  v18 = (void *)sub_245CC6EA0();
  v19 = objc_msgSend((id)objc_opt_self(), sel_modelWithOptions_interventionType_locale_, a1, a2, v18);

  v20 = *(void (**)(char *, uint64_t))(v15 + 8);
  v21 = *a5;
  v32 = a5[1];
  v33 = v21;
  v22 = a5[2];
  v30 = a5[3];
  v31 = v22;
  v29 = a5[4];
  v20(v17, v14);
  *(_QWORD *)a8 = v19;
  v24 = (int *)type metadata accessor for SCUIMoreHelpContextMenuSwiftUI(0, a6, a7, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(&a8[v24[9]], v34, a6);
  a8[v24[10]] = v35;
  v25 = &a8[v24[11]];
  v26 = v32;
  *(_OWORD *)v25 = v33;
  *((_OWORD *)v25 + 1) = v26;
  v27 = v30;
  *((_OWORD *)v25 + 2) = v31;
  *((_OWORD *)v25 + 3) = v27;
  result = *(double *)&v29;
  *((_OWORD *)v25 + 4) = v29;
  return result;
}

uint64_t type metadata accessor for SCUIMoreHelpContextMenuSwiftUI(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SCUIMoreHelpContextMenuSwiftUI);
}

uint64_t SCUIMoreHelpContextMenuSwiftUI.body.getter@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  void (*v15)(_BYTE *, _BYTE *, uint64_t);
  void (*v16)(_BYTE *, uint64_t);
  _BYTE v18[16];
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

  v5 = *(_QWORD *)(a1 + 16);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575188E0);
  v7 = *(_QWORD *)(a1 + 24);
  v25 = v5;
  v26 = v6;
  v27 = v7;
  v28 = sub_245CC6A28(&qword_2575188E8, &qword_2575188E0, MEMORY[0x24BDF5428]);
  v8 = sub_245CC6F18();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v18[-v13];
  v22 = v5;
  v23 = v7;
  v24 = v2;
  v19 = v5;
  v20 = v7;
  v21 = v2;
  sub_245CC6F0C();
  MEMORY[0x24954608C](MEMORY[0x24BDF1A70], v8);
  v15 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 16);
  v15(v14, v12, v8);
  v16 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v15(a2, v14, v8);
  return ((uint64_t (*)(_BYTE *, uint64_t))v16)(v14, v8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249546080](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245CC5664@<X0>(id *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  int v43;
  uint64_t KeyPath;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v5 = a3;
  v42 = a5;
  v45 = a2;
  v7 = type metadata accessor for SCUIMoreHelpContextMenuSwiftUI(0, a2, a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v40 - v9;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_257518900);
  v51 = *(_QWORD *)(v41 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v49 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v50 = (char *)&v40 - v13;
  v14 = *a1;
  if (*((_BYTE *)a1 + *(int *)(v7 + 40)) == 1)
  {
    v15 = objc_msgSend(*a1, sel_title);
    v16 = v5;
    v17 = sub_245CC6F9C();
    v19 = v18;

    v52 = v17;
    v53 = v19;
    v5 = v16;
    sub_245CBEB8C();
    v20 = sub_245CC6F24();
    v47 = v21;
    v48 = v20;
    v46 = v22;
    v24 = v23 & 1;
    KeyPath = swift_getKeyPath();
    v43 = 1;
  }
  else
  {
    v47 = 0;
    v48 = 0;
    v24 = 0;
    v46 = 0;
    KeyPath = 0;
    v43 = 0;
  }
  v25 = objc_msgSend(v14, sel_actions);
  sub_245CC68D0(0, &qword_2575188F0);
  v26 = sub_245CC6FC0();

  v52 = v26;
  (*(void (**)(char *, id *, uint64_t))(v8 + 16))(v10, a1, v7);
  v27 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = v45;
  *(_QWORD *)(v28 + 24) = v5;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v28 + v27, v10, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257518908);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257518910);
  sub_245CC6A28(&qword_257518918, &qword_257518908, MEMORY[0x24BEE12D8]);
  sub_245CC6A28(&qword_257518920, &qword_257518910, MEMORY[0x24BDF43B0]);
  sub_245CC6A68();
  v29 = v50;
  sub_245CC6F60();
  v30 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  v31 = v49;
  v32 = v41;
  v30(v49, v29, v41);
  v34 = v47;
  v33 = v48;
  v35 = v42;
  *v42 = v48;
  v35[1] = v34;
  v36 = v46;
  v35[2] = v24;
  v35[3] = v36;
  v35[4] = KeyPath;
  v35[5] = 0;
  *((_BYTE *)v35 + 48) = v43;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_257518930);
  v30((char *)v35 + *(int *)(v37 + 48), v31, v32);
  sub_245CC6AC0(v33, v34, v24, v36);
  v38 = *(void (**)(char *, uint64_t))(v51 + 8);
  v38(v50, v32);
  v38(v31, v32);
  return sub_245CC6B0C(v33, v34, v24, v36);
}

uint64_t sub_245CC59F0@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_245CC5664(*(id **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1, a2);
}

uint64_t sub_245CC59FC@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v26 = a2;
  v30 = a4;
  v31 = a5;
  v29 = a3;
  v6 = type metadata accessor for SCUIMoreHelpContextMenuSwiftUI(0, a3, a4, a4);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v26 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257518938);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257518910);
  v27 = *(_QWORD *)(v12 - 8);
  v28 = v12;
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a1;
  v16 = objc_msgSend(v15, sel_title);
  v17 = sub_245CC6F9C();
  v19 = v18;

  v32 = v17;
  v33 = v19;
  if (objc_msgSend(v15, sel_destructive))
    sub_245CC6ED0();
  else
    sub_245CC6EDC();
  v20 = sub_245CC6EE8();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v11, 0, 1, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v26, v6);
  v21 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v22 = (char *)swift_allocObject();
  v23 = v30;
  *((_QWORD *)v22 + 2) = v29;
  *((_QWORD *)v22 + 3) = v23;
  *((_QWORD *)v22 + 4) = v15;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v22[v21], v9, v6);
  sub_245CBEB8C();
  v24 = v15;
  sub_245CC6F54();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v31, v14, v28);
}

uint64_t sub_245CC5C20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v15;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1 + *(int *)(type metadata accessor for SCUIMoreHelpContextMenuSwiftUI(0, v9, v10, v11) + 36);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v13(v8, v12, a2);
  v13(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t sub_245CC5CC4@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_245CC5C20(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_245CC5CD0()
{
  return MEMORY[0x24BEE0948];
}

uint64_t sub_245CC5CDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_245CC5D18()
{
  return sub_245CC6F48();
}

uint64_t sub_245CC5D34()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_245CC5D3C()
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

void **sub_245CC5DCC(void **a1, void **a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char *v8;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  char *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = *(_QWORD *)(a3 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_DWORD *)(v4 + 80) & 0x100000;
  v8 = (char *)*a2;
  *a1 = *a2;
  if (v5 > 7 || v7 != 0 || ((((v5 + 8) & ~v5) + v6) & 0xFFFFFFFFFFFFFFF8) + 88 > 0x18)
  {
    v11 = (void **)&v8[(v5 & 0xF8 ^ 0x1F8) & (v5 + 16)];
  }
  else
  {
    v11 = a1;
    v12 = ((unint64_t)a1 + v5 + 8) & ~v5;
    v13 = ((unint64_t)a2 + v5 + 8) & ~v5;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v15 = v8;
    v14(v12, v13, v3);
    *(_BYTE *)(v12 + v6) = *(_BYTE *)(v13 + v6);
    v16 = (_QWORD *)((v12 + v6) & 0xFFFFFFFFFFFFFFF8);
    v17 = (_QWORD *)((v13 + v6) & 0xFFFFFFFFFFFFFFF8);
    v18 = v17[2];
    v16[1] = v17[1];
    v16[2] = v18;
    v19 = v17[4];
    v16[3] = v17[3];
    v16[4] = v19;
    v20 = v17[6];
    v16[5] = v17[5];
    v16[6] = v20;
    v21 = v17[8];
    v16[7] = v17[7];
    v16[8] = v21;
    v22 = v17[10];
    v16[9] = v17[9];
    v16[10] = v22;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v11;
}

uint64_t sub_245CC5EF8(id *a1, uint64_t a2)
{

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))(((unint64_t)a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void **sub_245CC5F7C(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v11 = v4;
  v10(v8, v9, v5);
  v12 = *(_QWORD *)(v6 + 64);
  v13 = v8 + v12;
  v14 = v9 + v12;
  *(_BYTE *)v13 = *(_BYTE *)v14;
  v13 &= 0xFFFFFFFFFFFFFFF8;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 = *(_QWORD *)(v14 + 16);
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(v14 + 8);
  *(_QWORD *)(v13 + 16) = v15;
  v16 = *(_QWORD *)(v14 + 32);
  *(_QWORD *)(v13 + 24) = *(_QWORD *)(v14 + 24);
  *(_QWORD *)(v13 + 32) = v16;
  v17 = *(_QWORD *)(v14 + 48);
  *(_QWORD *)(v13 + 40) = *(_QWORD *)(v14 + 40);
  *(_QWORD *)(v13 + 48) = v17;
  v18 = *(_QWORD *)(v14 + 64);
  *(_QWORD *)(v13 + 56) = *(_QWORD *)(v14 + 56);
  *(_QWORD *)(v13 + 64) = v18;
  v19 = *(_QWORD *)(v14 + 80);
  *(_QWORD *)(v13 + 72) = *(_QWORD *)(v14 + 72);
  *(_QWORD *)(v13 + 80) = v19;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void **sub_245CC6054(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = ((unint64_t)a1 + v10 + 8) & ~v10;
  v12 = ((unint64_t)a2 + v10 + 8) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v11, v12);
  v13 = *(_QWORD *)(v9 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v16 = (_QWORD *)(v14 & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(v15 & 0xFFFFFFFFFFFFFFF8);
  v18 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFFF8) + 16);
  v16[1] = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFFF8) + 8);
  v16[2] = v18;
  swift_retain();
  swift_release();
  v19 = v17[4];
  v16[3] = v17[3];
  v16[4] = v19;
  swift_retain();
  swift_release();
  v20 = v17[6];
  v16[5] = v17[5];
  v16[6] = v20;
  swift_retain();
  swift_release();
  v21 = v17[8];
  v16[7] = v17[7];
  v16[8] = v21;
  swift_retain();
  swift_release();
  v22 = v17[10];
  v16[9] = v17[9];
  v16[10] = v22;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_245CC615C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 8) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 8) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  v8 = *(_QWORD *)(v4 + 64);
  v9 = v6 + v8;
  v10 = v7 + v8;
  *(_BYTE *)v9 = *(_BYTE *)v10;
  v9 &= 0xFFFFFFFFFFFFFFF8;
  v10 &= 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
  v11 = *(_OWORD *)(v10 + 72);
  v12 = *(_OWORD *)(v10 + 56);
  v13 = *(_OWORD *)(v10 + 40);
  *(_OWORD *)(v9 + 24) = *(_OWORD *)(v10 + 24);
  *(_OWORD *)(v9 + 40) = v13;
  *(_OWORD *)(v9 + 56) = v12;
  *(_OWORD *)(v9 + 72) = v11;
  return a1;
}

void **sub_245CC6200(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  v11 = *(_QWORD *)(v7 + 64);
  v12 = v9 + v11;
  v13 = v10 + v11;
  *(_BYTE *)v12 = *(_BYTE *)v13;
  v14 = v12 & 0xFFFFFFFFFFFFFFF8;
  v15 = v13 & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)((v12 & 0xFFFFFFFFFFFFFFF8) + 8) = *(_OWORD *)((v13 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  *(_OWORD *)(v14 + 24) = *(_OWORD *)(v15 + 24);
  swift_release();
  *(_OWORD *)(v14 + 40) = *(_OWORD *)(v15 + 40);
  swift_release();
  *(_OWORD *)(v14 + 56) = *(_OWORD *)(v15 + 56);
  swift_release();
  *(_OWORD *)(v14 + 72) = *(_OWORD *)(v15 + 72);
  swift_release();
  return a1;
}

uint64_t sub_245CC62DC(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  if (v6 >= a2)
  {
    if ((v5 & 0x80000000) != 0)
    {
      return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v7 + 8) & ~v7);
    }
    else
    {
      v12 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
  }
  else
  {
    if (((((((v7 + 8) & ~v7) + *(_QWORD *)(v4 + 64)) & 0xFFFFFFFFFFFFFFF8) + 88) & 0xFFFFFFF8) != 0)
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
    return ((uint64_t (*)(void))((char *)&loc_245CC6364 + 4 * byte_245CC89D0[v10]))();
  }
}

void sub_245CC63E4(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if ((((((_DWORD)v7 + 8) & ~(_DWORD)v7) + *(_DWORD *)(v5 + 64)) & 0xFFFFFFF8) == 0xFFFFFFA8)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
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
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X13 }
  }
  if ((((((_DWORD)v7 + 8) & ~(_DWORD)v7) + *(_DWORD *)(v5 + 64)) & 0xFFFFFFF8) != 0xFFFFFFA8)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((((v7 + 8) & ~v7) + *(_QWORD *)(v5 + 64)) & 0xFFFFFFFFFFFFFFF8) + 88);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_245CC64E8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x245CC6550);
}

void sub_245CC64F0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x245CC64F8);
  JUMPOUT(0x245CC6550);
}

void sub_245CC6508()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x245CC6550);
}

void sub_245CC6510()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x245CC6550);
}

void sub_245CC6518(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v3 + v4) = 0;
  if (a2)
  {
    if ((a3 & 0x80000000) == 0)
    {
      if ((a2 & 0x80000000) == 0)
        JUMPOUT(0x245CC654CLL);
      JUMPOUT(0x245CC6548);
    }
    JUMPOUT(0x245CC6524);
  }
  JUMPOUT(0x245CC6550);
}

uint64_t sub_245CC6568()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_245CC6570(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_245CC65A0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_245CC65E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v3 = *(_QWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_245CC6678(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

_OWORD *sub_245CC6738(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  return a1;
}

uint64_t sub_245CC67AC(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_245CC67F4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for SCUIMoreHelpContextMenuSwiftUI.SCUIHelpMenuActions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SCUIMoreHelpContextMenuSwiftUI.SCUIHelpMenuActions);
}

uint64_t sub_245CC6854()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575188E0);
  sub_245CC6A28(&qword_2575188E8, &qword_2575188E0, MEMORY[0x24BDF5428]);
  v0 = sub_245CC6F18();
  return MEMORY[0x24954608C](MEMORY[0x24BDF1A70], v0);
}

uint64_t sub_245CC68D0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_245CC6908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for SCUIMoreHelpContextMenuSwiftUI(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (id *)(v4 + ((v7 + 32) & ~v7));

  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((char *)v8 + *(int *)(v6 + 36), v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245CC69C0@<X0>(void **a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SCUIMoreHelpContextMenuSwiftUI(0, v6, v7, a2) - 8)
                          + 80);
  return sub_245CC59FC(a1, v3 + ((v8 + 32) & ~v8), v6, v7, a3);
}

uint64_t sub_245CC6A28(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24954608C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_245CC6A68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257518928;
  if (!qword_257518928)
  {
    v1 = sub_245CC68D0(255, &qword_2575188F0);
    result = MEMORY[0x24954608C](&protocol conformance descriptor for SCUIMoreHelpMenuAction, v1);
    atomic_store(result, (unint64_t *)&qword_257518928);
  }
  return result;
}

uint64_t sub_245CC6AC0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_245CC6AFC(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_245CC6AFC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_245CC6B0C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_245CC6B48(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_245CC6B48(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_245CC6B58@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_245CC6EF4();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_245CC6B88()
{
  return sub_245CC6F00();
}

uint64_t sub_245CC6BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for SCUIMoreHelpContextMenuSwiftUI(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (v7 + 40) & ~v7;

  v9 = (id *)(v4 + v8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((char *)v9 + *(int *)(v6 + 36), v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

id sub_245CC6C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  uint64_t v8;
  uint64_t (**v9)(void);

  v5 = type metadata accessor for SCUIMoreHelpContextMenuSwiftUI(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  result = objc_msgSend(*(id *)(v4 + 32), sel_actionID);
  v8 = v4 + ((v6 + 40) & ~v6);
  switch((unint64_t)result)
  {
    case 1uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44));
      goto LABEL_7;
    case 2uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44) + 48);
      goto LABEL_7;
    case 3uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44) + 64);
      goto LABEL_7;
    case 4uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44) + 16);
      goto LABEL_7;
    case 5uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44) + 32);
LABEL_7:
      result = (id)(*v9)();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24954602C](a1, v6, a5);
}

uint64_t sub_245CC6D80()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t __getSTCommunicationClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1(v0);
}

uint64_t sub_245CC6E88()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_245CC6E94()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_245CC6EA0()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_245CC6EAC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_245CC6EB8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_245CC6EC4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_245CC6ED0()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_245CC6EDC()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_245CC6EE8()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_245CC6EF4()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_245CC6F00()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_245CC6F0C()
{
  return MEMORY[0x24BDF1A48]();
}

uint64_t sub_245CC6F18()
{
  return MEMORY[0x24BDF1A58]();
}

uint64_t sub_245CC6F24()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_245CC6F30()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_245CC6F3C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_245CC6F48()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_245CC6F54()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_245CC6F60()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_245CC6F6C()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_245CC6F78()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_245CC6F84()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_245CC6F90()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245CC6F9C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245CC6FA8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245CC6FB4()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_245CC6FC0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_245CC6FCC()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_245CC6FD8()
{
  return MEMORY[0x24BDCFC20]();
}

uint64_t sub_245CC6FE4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245CC6FF0()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_245CC6FFC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_245CC7008()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_245CC7014()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_245CC7020()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_245CC702C()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_245CC7038()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_245CC7044()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_245CC7050()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_245CC705C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_245CC7068()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_245CC7074()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_245CC7080()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_245CC708C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_245CC7098()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_245CC70A4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245CC70B0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_245CC70BC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245CC70C8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_245CC70D4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_245CC70E0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_245CC70EC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_245CC70F8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_245CC7104()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_245CC7110()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245CC711C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_245CC7128()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

uint64_t SCIsAnalyticsEnabled()
{
  return MEMORY[0x24BDE96F0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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


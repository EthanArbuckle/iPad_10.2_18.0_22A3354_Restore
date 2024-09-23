void sub_220D5AEFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;
  void *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unable to copy PASUIMicaPlayer. Error = %@"));

    objc_end_catch();
    JUMPOUT(0x220D5AEDCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_220D5B9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220D5BBD4(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;

  v3 = *(unsigned __int8 *)(v1 + *MEMORY[0x24BE7B800]);
  if (v3 == 1)
  {
    v4 = type metadata accessor for PASUIProgressViewProxCardAdapter();
    v5 = (_QWORD *)swift_allocObject();
    v5[4] = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
    swift_allocObject();
    v5[2] = sub_220D988B4();
    swift_retain();
    if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_220D995B0())
      v6 = sub_220D69690(MEMORY[0x24BEE4AF8]);
    else
      v6 = MEMORY[0x24BEE4B08];
    v5[3] = v6;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = &off_24E6A3D70;
    *(_QWORD *)a1 = v5;
  }
  else
  {
    *(_BYTE *)a1 = 0;
  }
  *(_BYTE *)(a1 + 40) = v3 ^ 1;
}

uint64_t PASFlowStepManateeRepair.buildView()()
{
  ValueMetadata *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  ValueMetadata *v14;
  unint64_t v15;
  uint64_t v16;
  _UNKNOWN **v17;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564A8D0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - v6;
  v8 = *((_BYTE *)&v0->Kind + *MEMORY[0x24BE7B800]);
  v9 = type metadata accessor for PASUIManateeRepairHelperProvider();
  v10 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B120);
  swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_220D988B4();
  *(_BYTE *)(v10 + 24) = v8;
  v16 = v9;
  v17 = &protocol witness table for PASUIManateeRepairHelperProvider;
  v14 = v0;
  v15 = v10;
  v11 = sub_220D5BE90();
  swift_retain();
  sub_220D99178();
  sub_220D5BED4((uint64_t)&v14);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v14 = &type metadata for PASUIManateeRepairView;
  v15 = v11;
  swift_getOpaqueTypeConformance2();
  v12 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v12;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22766573C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_220D5BE90()
{
  unint64_t result;

  result = qword_25564A8E0;
  if (!qword_25564A8E0)
  {
    result = MEMORY[0x227665754](&unk_220D9A548, &type metadata for PASUIManateeRepairView);
    atomic_store(result, (unint64_t *)&qword_25564A8E0);
  }
  return result;
}

uint64_t sub_220D5BED4(uint64_t a1)
{
  uint64_t v2;

  v2 = a1 + 8;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v2);
  return a1;
}

void sub_220D5BF08(uint64_t a1@<X8>)
{
  sub_220D5BBD4(a1);
}

uint64_t sub_220D5BF28()
{
  return PASFlowStepManateeRepair.buildView()();
}

uint64_t sub_220D5BF48@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t *v22;
  _OWORD *v23;
  __int128 v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v30 = a1;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564A918);
  v2 = MEMORY[0x24BDAC7A8](v31);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v26 = (char *)&v26 - v5;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564A920);
  MEMORY[0x24BDAC7A8](v28);
  v29 = (uint64_t)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_220D98E00();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_220D9943C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564A928);
  v14 = MEMORY[0x24BDAC7A8](v27);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v26 - v17;
  v19 = *v1;
  if (*(_BYTE *)(*v1 + *MEMORY[0x24BE7B800]) == 1)
  {
    sub_220D5CC10((uint64_t)v1, (uint64_t)&v32);
    v20 = (_OWORD *)swift_allocObject();
    v21 = v33;
    v20[1] = v32;
    v20[2] = v21;
    v20[3] = v34;
    sub_220D99424();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v9[*(int *)(v7 + 20)], v13, v10);
    *(_QWORD *)v9 = &unk_25564A970;
    *((_QWORD *)v9 + 1) = v20;
    sub_220D5CD14((uint64_t)v9, (uint64_t)v16);
    sub_220D5CD70((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v22 = &qword_25564A928;
    sub_220D5CF90((uint64_t)v16, (uint64_t)v18, &qword_25564A928);
    sub_220D5CFD4((uint64_t)v18, v29, &qword_25564A928);
  }
  else
  {
    sub_220D5CC10((uint64_t)v1, (uint64_t)&v32);
    v23 = (_OWORD *)swift_allocObject();
    v24 = v33;
    v23[1] = v32;
    v23[2] = v24;
    v23[3] = v34;
    swift_retain();
    sub_220D99424();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v9[*(int *)(v7 + 20)], v13, v10);
    *(_QWORD *)v9 = &unk_25564A938;
    *((_QWORD *)v9 + 1) = v23;
    sub_220D5CD14((uint64_t)v9, (uint64_t)&v4[*(int *)(v31 + 36)]);
    *(_QWORD *)v4 = sub_220D5CC08;
    *((_QWORD *)v4 + 1) = v19;
    v4[16] = 0;
    *((_QWORD *)v4 + 3) = sub_220D5C674;
    *((_QWORD *)v4 + 4) = 0;
    *((_QWORD *)v4 + 5) = sub_220D5C6A4;
    *((_OWORD *)v4 + 3) = 0u;
    *((_OWORD *)v4 + 4) = 0u;
    v4[80] = 1;
    *((_QWORD *)v4 + 11) = MEMORY[0x24BEE4AF8];
    sub_220D5CD58();
    sub_220D5CD60((uint64_t)sub_220D5C674);
    sub_220D5CD60((uint64_t)sub_220D5C6A4);
    swift_bridgeObjectRetain();
    sub_220D5CD70((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    sub_220D5CDAC();
    sub_220D5CDB4((uint64_t)sub_220D5C674);
    sub_220D5CDB4((uint64_t)sub_220D5C6A4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = &qword_25564A918;
    v18 = v26;
    sub_220D5CF90((uint64_t)v4, (uint64_t)v26, &qword_25564A918);
    sub_220D5CFD4((uint64_t)v18, v29, &qword_25564A918);
  }
  swift_storeEnumTagMultiPayload();
  sub_220D5CE4C(&qword_25564A940, &qword_25564A928, (uint64_t (*)(void))sub_220D5CE08);
  sub_220D5CE4C((unint64_t *)&qword_25564A958, &qword_25564A918, (uint64_t (*)(void))sub_220D5CED0);
  sub_220D98F5C();
  return sub_220D5D018((uint64_t)v18, v22);
}

uint64_t sub_220D5C3D8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  sub_220D99418();
  v1[3] = sub_220D9940C();
  v1[4] = sub_220D993F4();
  v1[5] = v2;
  return swift_task_switch();
}

uint64_t sub_220D5C444()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_220D5C4B0;
  return sub_220D98B54();
}

uint64_t sub_220D5C4B0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D5C4FC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  sub_220D99418();
  v1[3] = sub_220D9940C();
  v1[4] = sub_220D993F4();
  v1[5] = v2;
  return swift_task_switch();
}

uint64_t sub_220D5C568()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_220D5C5D4;
  return sub_220D98B54();
}

uint64_t sub_220D5C5D4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D5C620()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D5C658()
{
  return sub_220D99118();
}

uint64_t sub_220D5C674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6[2];

  v6[0] = a3;
  v6[1] = a4;
  sub_220D5DB6C(v6, &v5);
  return v5;
}

uint64_t sub_220D5C6A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  _QWORD v6[2];
  _QWORD v7[2];

  v7[0] = a1;
  v7[1] = a2;
  v6[0] = a3;
  v6[1] = a4;
  sub_220D5DC10((uint64_t)v7, (uint64_t)v6, &v5);
  return v5;
}

uint64_t variable initialization expression of PASUITargetViewPresenter.delegate()
{
  return 0;
}

double variable initialization expression of PASUITargetViewPresenter.navigationController@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of PASUITargetViewPresenter.flowTimer()
{
  return 0;
}

uint64_t variable initialization expression of PASUITargetViewPresenter._messageSessionProvider()
{
  return sub_220D5C81C(&qword_25564A8E8);
}

uint64_t variable initialization expression of PASUITargetViewPresenter._authenticator()
{
  return sub_220D5C81C(&qword_25564A8F0);
}

uint64_t variable initialization expression of PASUITargetViewPresenter._deviceProvider()
{
  return sub_220D5C81C(&qword_25564A8F8);
}

uint64_t variable initialization expression of PASUITargetViewPresenter._targetAppleIDExchanger()
{
  return sub_220D5C81C(&qword_25564A900);
}

uint64_t variable initialization expression of PASUITargetViewPresenter._analyticsProvider()
{
  return sub_220D5C81C(&qword_25564A908);
}

uint64_t variable initialization expression of PASUITargetViewPresenter.$__lazy_storage_$_analytics()
{
  return 0;
}

uint64_t variable initialization expression of PASUITargetViewPresenter._featureFlagsProvider()
{
  return sub_220D5C81C(&qword_25564A910);
}

uint64_t variable initialization expression of PASUIExtensionHostProxy.connection()
{
  return 0;
}

uint64_t variable initialization expression of PASUIExtensionHostProxy.$__lazy_storage_$_operationQueue()
{
  return 0;
}

uint64_t variable initialization expression of PASUIExtensionHostProxy.$__lazy_storage_$_dispatchQueue()
{
  return 0;
}

uint64_t variable initialization expression of PASUIExtensionHostProxy.$__lazy_storage_$_infoProvider()
{
  return 0;
}

uint64_t variable initialization expression of PASUISourceViewPresenter.delegate()
{
  return 0;
}

uint64_t variable initialization expression of PASUISourceViewPresenter.cardContentView()
{
  return 0;
}

double variable initialization expression of PASUISourceViewPresenter.cardAdapter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of PASUISourceViewPresenter.flowTimer()
{
  return 0;
}

uint64_t variable initialization expression of PASUISourceViewPresenter._messageSessionProvider()
{
  return sub_220D5C81C(&qword_25564A8E8);
}

uint64_t variable initialization expression of PASUISourceViewPresenter._authenticator()
{
  return sub_220D5C81C(&qword_25564A8F0);
}

uint64_t variable initialization expression of PASUISourceViewPresenter._viewControllerProvider()
{
  return sub_220D5C81C((uint64_t *)&unk_25564B120);
}

uint64_t variable initialization expression of PASUISourceViewPresenter._analyticsProvider()
{
  return sub_220D5C81C(&qword_25564A908);
}

uint64_t variable initialization expression of PASUISourceViewPresenter.$__lazy_storage_$_analytics()
{
  return 0;
}

uint64_t variable initialization expression of PASUISignInViewModel._viewControllerProvider()
{
  return sub_220D5C81C((uint64_t *)&unk_25564B120);
}

uint64_t variable initialization expression of PASUISignInViewModel.continueSignInAction()
{
  return 0;
}

uint64_t variable initialization expression of PASUIManateeRepairHelperProvider._viewControllerProvider()
{
  return sub_220D5C81C((uint64_t *)&unk_25564B120);
}

uint64_t sub_220D5C81C(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  swift_allocObject();
  return sub_220D988B4();
}

uint64_t initializeBufferWithCopyOfBuffer for PASUIManateeRepairView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PASUIManateeRepairView(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 8;
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1(v1);
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

uint64_t initializeWithCopy for PASUIManateeRepairView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = a2 + 8;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = v4;
  v6 = **(void (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  swift_retain();
  v6(a1 + 8, v3, v5);
  return a1;
}

_QWORD *assignWithCopy for PASUIManateeRepairView(_QWORD *a1, _QWORD *a2)
{
  uint64_t *v3;

  v3 = a2 + 1;
  *a1 = *a2;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, v3);
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

uint64_t assignWithTake for PASUIManateeRepairView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIManateeRepairView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIManateeRepairView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIManateeRepairView()
{
  return &type metadata for PASUIManateeRepairView;
}

uint64_t sub_220D5CBF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D5CC08()
{
  uint64_t v0;

  return j__swift_retain(v0);
}

uint64_t sub_220D5CC10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a2 = *(_QWORD *)a1;
  v3 = a2 + 8;
  v4 = a1 + 8;
  v5 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 32) = v5;
  v6 = v5;
  v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(v3, v4, v6);
  return a2;
}

uint64_t sub_220D5CC80()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5CCCC;
  return sub_220D5C4FC(v0 + 16);
}

uint64_t sub_220D5CCCC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_220D5CD14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_220D98E00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220D5CD58()
{
  return swift_retain();
}

uint64_t sub_220D5CD60(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_220D5CD70(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_220D98E00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_220D5CDAC()
{
  return swift_release();
}

uint64_t sub_220D5CDB4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227665748](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_220D5CE08()
{
  unint64_t result;

  result = qword_25564A948;
  if (!qword_25564A948)
  {
    result = MEMORY[0x227665754](&unk_220D9C934, &type metadata for PASUIProgressView);
    atomic_store(result, (unint64_t *)&qword_25564A948);
  }
  return result;
}

uint64_t sub_220D5CE4C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = sub_220D5D7F4((unint64_t *)&qword_25564A950, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_220D5CED0()
{
  unint64_t result;

  result = qword_25564A960;
  if (!qword_25564A960)
  {
    result = MEMORY[0x227665754](&unk_220D9ABE4, &type metadata for PASUISourceBaseView);
    atomic_store(result, &qword_25564A960);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

uint64_t sub_220D5CF44()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5DA1C;
  return sub_220D5C3D8(v0 + 16);
}

uint64_t sub_220D5CF90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_220D5CFD4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_220D5D018(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_220D5D054(uint64_t a1, uint64_t a2)
{
  return sub_220D5D4B4(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_220D5D06C(uint64_t a1, uint64_t a2)
{
  return sub_220D5D4B4(a1, a2, MEMORY[0x24BEE0CD8]);
}

void sub_220D5D080(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_220D5D088@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_220D5D09C(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_220D5D0CC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_220D5D0E0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_220D5D0F4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_220D9934C();
  *a2 = 0;
  return result;
}

uint64_t sub_220D5D168(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_220D99358();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_220D5D1E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_220D99364();
  v2 = sub_220D99340();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

_QWORD *sub_220D5D228@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_220D5D238@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_220D99364();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_220D5D260()
{
  sub_220D5D7F4(&qword_25564AA20, (uint64_t (*)(uint64_t))type metadata accessor for AATermsEntry, (uint64_t)&unk_220D9AAD8);
  sub_220D5D7F4(&qword_25564AA28, (uint64_t (*)(uint64_t))type metadata accessor for AATermsEntry, (uint64_t)&unk_220D9A8D4);
  return sub_220D995D4();
}

uint64_t sub_220D5D2E4()
{
  sub_220D5D7F4(&qword_25564AA30, (uint64_t (*)(uint64_t))type metadata accessor for AKAppleIDAuthenticationAppProvidedContext, (uint64_t)&unk_220D9A7EC);
  sub_220D5D7F4(&qword_25564AA38, (uint64_t (*)(uint64_t))type metadata accessor for AKAppleIDAuthenticationAppProvidedContext, (uint64_t)&unk_220D9A794);
  return sub_220D995D4();
}

uint64_t sub_220D5D368()
{
  sub_220D5D7F4(&qword_25564AA40, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_220D9AB18);
  sub_220D5D7F4(&qword_25564AA48, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_220D9A694);
  return sub_220D995D4();
}

uint64_t sub_220D5D3EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_220D99340();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_220D5D430()
{
  sub_220D5D7F4((unint64_t *)&qword_25564AA10, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_220D9AA94);
  sub_220D5D7F4(&qword_25564AA18, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_220D9A9E8);
  return sub_220D995D4();
}

uint64_t sub_220D5D4B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_220D99364();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_220D5D4F0()
{
  sub_220D99364();
  sub_220D993A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D5D530()
{
  uint64_t v0;

  sub_220D99364();
  sub_220D99670();
  sub_220D993A0();
  v0 = sub_220D99688();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_220D5D5A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_220D99364();
  v2 = v1;
  if (v0 == sub_220D99364() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_220D99604();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_220D5D6E4(a1, &qword_25564A978);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_220D5D64C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_220D5D66C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_220D5D6E4(a1, &qword_25564A980);
}

void type metadata accessor for AATermsEntry(uint64_t a1)
{
  sub_220D5D6E4(a1, &qword_25564A988);
}

void type metadata accessor for AKAppleIDAuthenticationAppProvidedContext(uint64_t a1)
{
  sub_220D5D6E4(a1, &qword_25564A990);
}

void type metadata accessor for AIDAServiceType(uint64_t a1)
{
  sub_220D5D6E4(a1, &qword_25564A998);
}

void sub_220D5D6E4(uint64_t a1, unint64_t *a2)
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

unint64_t sub_220D5D72C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564A9A0;
  if (!qword_25564A9A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564A9A8);
    v2[0] = sub_220D5CE4C(&qword_25564A940, &qword_25564A928, (uint64_t (*)(void))sub_220D5CE08);
    v2[1] = sub_220D5CE4C((unint64_t *)&qword_25564A958, &qword_25564A918, (uint64_t (*)(void))sub_220D5CED0);
    result = MEMORY[0x227665754](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564A9A0);
  }
  return result;
}

uint64_t sub_220D5D7C8()
{
  return sub_220D5D7F4(&qword_25564A9B0, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_220D9A65C);
}

uint64_t sub_220D5D7F4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x227665754](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_220D5D834()
{
  return sub_220D5D7F4(&qword_25564A9B8, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_220D9A634);
}

uint64_t sub_220D5D860()
{
  return sub_220D5D7F4(&qword_25564A9C0, (uint64_t (*)(uint64_t))type metadata accessor for AKAppleIDAuthenticationAppProvidedContext, (uint64_t)&unk_220D9A75C);
}

uint64_t sub_220D5D88C()
{
  return sub_220D5D7F4(&qword_25564A9C8, (uint64_t (*)(uint64_t))type metadata accessor for AKAppleIDAuthenticationAppProvidedContext, (uint64_t)&unk_220D9A734);
}

uint64_t sub_220D5D8B8()
{
  return sub_220D5D7F4(&qword_25564A9D0, (uint64_t (*)(uint64_t))type metadata accessor for AKAppleIDAuthenticationAppProvidedContext, (uint64_t)&unk_220D9A7C4);
}

uint64_t sub_220D5D8E4()
{
  return sub_220D5D7F4(&qword_25564A9D8, (uint64_t (*)(uint64_t))type metadata accessor for AATermsEntry, (uint64_t)&unk_220D9A89C);
}

uint64_t sub_220D5D910()
{
  return sub_220D5D7F4(&qword_25564A9E0, (uint64_t (*)(uint64_t))type metadata accessor for AATermsEntry, (uint64_t)&unk_220D9A874);
}

uint64_t sub_220D5D93C()
{
  return sub_220D5D7F4(&qword_25564A9E8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_220D9A9AC);
}

uint64_t sub_220D5D968()
{
  return sub_220D5D7F4(&qword_25564A9F0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_220D9A980);
}

uint64_t sub_220D5D994()
{
  return sub_220D5D7F4(&qword_25564A9F8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_220D9AA1C);
}

uint64_t sub_220D5D9C0()
{
  return sub_220D5D7F4(&qword_25564AA00, (uint64_t (*)(uint64_t))type metadata accessor for AATermsEntry, (uint64_t)&unk_220D9A904);
}

uint64_t sub_220D5D9EC()
{
  return sub_220D5D7F4(&qword_25564AA08, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_220D9A6C4);
}

uint64_t sub_220D5DA28()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PASUIMonogramMaker()
{
  return objc_opt_self();
}

id sub_220D5DA5C(void *a1)
{
  id result;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;

  result = objc_msgSend(a1, sel_aa_firstName);
  if (result)
  {
    v3 = result;
    result = objc_msgSend(a1, sel_aa_lastName);
    if (result)
    {
      v4 = result;
      v5 = (void *)objc_opt_self();
      v6 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
      objc_msgSend(v6, sel_scale);
      v8 = v7;

      v9 = objc_msgSend(v5, sel_monogramWithFirstName_lastName_diameter_scale_, v3, v4, 40.0, v8);
      v10 = sub_220D98818();

      return (id)v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_220D5DB6C(uint64_t *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  if (a1[1])
  {
    sub_220D9955C();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    v3 = sub_220D99394();
    v5 = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  *a2 = v3;
  a2[1] = v5;
}

uint64_t sub_220D5DC10@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(result + 8))
    v4 = *(_QWORD *)(a2 + 8) == 0;
  else
    v4 = 1;
  if (v4)
  {
    v5 = 0;
    v7 = 0;
  }
  else
  {
    sub_220D9955C();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    sub_220D993AC();
    sub_220D993AC();
    v5 = sub_220D99394();
    v7 = v6;
    result = swift_bridgeObjectRelease();
  }
  *a3 = v5;
  a3[1] = v7;
  return result;
}

uint64_t destroy for PASUISourceBaseView(uint64_t a1)
{
  sub_220D5CDAC();
  if (*(_QWORD *)(a1 + 24))
    swift_release();
  if (*(_QWORD *)(a1 + 40))
    swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PASUISourceBaseView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_220D5CD58();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = a2[3];
  if (v7)
  {
    v8 = a2[4];
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
  }
  v9 = a2[5];
  if (v9)
  {
    v10 = a2[6];
    *(_QWORD *)(a1 + 40) = v9;
    *(_QWORD *)(a1 + 48) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  }
  v11 = (void *)a2[7];
  v12 = a2[8];
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = a2[9];
  *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
  *(_QWORD *)(a1 + 88) = a2[11];
  v13 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PASUISourceBaseView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_220D5CD58();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_220D5CDAC();
  v7 = a2[3];
  if (*(_QWORD *)(a1 + 24))
  {
    if (v7)
    {
      v8 = a2[4];
      *(_QWORD *)(a1 + 24) = v7;
      *(_QWORD *)(a1 + 32) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[4];
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
LABEL_8:
  v10 = a2[5];
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v10)
    {
      v12 = a2[6];
      *(_QWORD *)(a1 + 40) = v10;
      *(_QWORD *)(a1 + 48) = v12;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    goto LABEL_15;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_14;
  }
  v11 = a2[6];
  *(_QWORD *)(a1 + 40) = v10;
  *(_QWORD *)(a1 + 48) = v11;
  swift_retain();
  swift_release();
LABEL_15:
  v13 = *(void **)(a1 + 56);
  v14 = (void *)a2[7];
  *(_QWORD *)(a1 + 56) = v14;
  v15 = v14;

  *(_QWORD *)(a1 + 64) = a2[8];
  *(_QWORD *)(a1 + 72) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
  *(_QWORD *)(a1 + 88) = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for PASUISourceBaseView(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_220D5CDAC();
  v5 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = v5;
      *(_QWORD *)(a1 + 32) = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    v7 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v5;
    *(_QWORD *)(a1 + 32) = v7;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
LABEL_8:
  v8 = *(_QWORD *)(a2 + 40);
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 40) = v8;
      *(_QWORD *)(a1 + 48) = v10;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    goto LABEL_15;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  swift_release();
LABEL_15:
  v11 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);

  v12 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v12;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUISourceBaseView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUISourceBaseView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 88) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUISourceBaseView()
{
  return &type metadata for PASUISourceBaseView;
}

uint64_t sub_220D5E178()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D5E188@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  ValueMetadata *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _QWORD v23[2];
  int v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  ValueMetadata *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  unint64_t v40;
  uint64_t v41;
  char v42;

  v2 = v1;
  v28 = a1;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB48);
  v29 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (ValueMetadata *)v1[3];
  v5 = v1[4];
  v6 = v1[5];
  v7 = v1[6];
  v8 = v2[9];
  v9 = v2[11];
  LOBYTE(v3) = *((_BYTE *)v2 + 80);
  v35 = v4;
  v36 = v5;
  v37 = v6;
  v38 = v7;
  v26 = *(_OWORD *)(v2 + 7);
  v39 = v26;
  v40 = v8;
  v41 = v9;
  v42 = v3;
  sub_220D5CD60((uint64_t)v4);
  sub_220D5CD60(v6);
  v10 = (void *)v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = v10;
  v33 = sub_220D99394();
  v34 = v12;
  v13 = v2[1];
  *(_QWORD *)&v26 = *v2;
  v25 = v13;
  v24 = *((unsigned __int8 *)v2 + 16);
  v23[1] = sub_220D989B0();
  sub_220D5F034();
  sub_220D98D88();
  swift_getKeyPath();
  sub_220D98E48();
  swift_release();
  swift_release();
  v32 = v2;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB58);
  v23[0] = sub_220D5F0E4();
  v15 = sub_220D5F128();
  v16 = sub_220D5F16C();
  sub_220D99190();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v17 = v37;
  v18 = (void *)v39;
  sub_220D5CDB4((uint64_t)v35);
  sub_220D5CDB4(v17);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v33 = sub_220D99394();
  v34 = v19;
  sub_220D98D88();
  swift_getKeyPath();
  sub_220D98E48();
  swift_release();
  swift_release();
  v31 = v2;
  v35 = &type metadata for PASUIWelcomeControllerWrapper;
  v36 = MEMORY[0x24BEE0D00];
  v37 = v14;
  v38 = MEMORY[0x24BDF1FA8];
  *(_QWORD *)&v39 = v23[0];
  *((_QWORD *)&v39 + 1) = v15;
  v40 = v16;
  v41 = MEMORY[0x24BDF1F80];
  swift_getOpaqueTypeConformance2();
  v20 = v27;
  v21 = v30;
  sub_220D99190();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v21, v20);
}

uint64_t sub_220D5E598@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v18;
  _OWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v37 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB78);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB80);
  v35 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v36 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v34 = (char *)&v32 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v33 = (char *)&v32 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v32 - v13;
  v38 = sub_220D99394();
  v39 = v15;
  sub_220D98D40();
  v16 = sub_220D98D4C();
  v17 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v5, 0, 1, v16);
  sub_220D989B0();
  sub_220D5F034();
  sub_220D98D7C();
  sub_220D5F128();
  sub_220D99274();
  v38 = sub_220D99394();
  v39 = v18;
  sub_220D98D34();
  v17(v5, 0, 1, v16);
  v19 = (_OWORD *)swift_allocObject();
  v20 = *(_OWORD *)(a1 + 48);
  v19[3] = *(_OWORD *)(a1 + 32);
  v19[4] = v20;
  v21 = *(_OWORD *)(a1 + 80);
  v19[5] = *(_OWORD *)(a1 + 64);
  v19[6] = v21;
  v22 = *(_OWORD *)(a1 + 16);
  v19[1] = *(_OWORD *)a1;
  v19[2] = v22;
  sub_220D5F258((_QWORD *)a1);
  v23 = v33;
  sub_220D99274();
  v24 = v34;
  v25 = v35;
  v26 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  v26(v34, v14, v6);
  v27 = v36;
  v26(v36, v23, v6);
  v28 = v37;
  v26(v37, v24, v6);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB88);
  v26(&v28[*(int *)(v29 + 48)], v27, v6);
  v30 = *(void (**)(char *, uint64_t))(v25 + 8);
  v30(v23, v6);
  v30(v14, v6);
  v30(v27, v6);
  return ((uint64_t (*)(char *, uint64_t))v30)(v24, v6);
}

uint64_t sub_220D5E8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  sub_220D99418();
  v4[3] = sub_220D9940C();
  v4[4] = sub_220D993F4();
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t sub_220D5E910()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  sub_220D989B0();
  sub_220D5F034();
  v1 = sub_220D98D7C();
  *(_QWORD *)(v0 + 48) = v1;
  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v1 + 504) + *(_QWORD *)(*(_QWORD *)v1 + 504));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_220D5E9B0;
  return v4();
}

uint64_t sub_220D5E9B0()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_220D5EA04@<X0>(uint64_t a1@<X8>)
{
  return sub_220D5EFA0(a1);
}

uint64_t sub_220D5EA20@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v18;
  _OWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v37 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB78);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB80);
  v35 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v36 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v34 = (char *)&v32 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v33 = (char *)&v32 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v32 - v13;
  v38 = sub_220D99394();
  v39 = v15;
  sub_220D98D40();
  v16 = sub_220D98D4C();
  v17 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v5, 0, 1, v16);
  sub_220D989B0();
  sub_220D5F034();
  sub_220D98D7C();
  sub_220D5F128();
  sub_220D99274();
  v38 = sub_220D99394();
  v39 = v18;
  sub_220D98D34();
  v17(v5, 0, 1, v16);
  v19 = (_OWORD *)swift_allocObject();
  v20 = *(_OWORD *)(a1 + 48);
  v19[3] = *(_OWORD *)(a1 + 32);
  v19[4] = v20;
  v21 = *(_OWORD *)(a1 + 80);
  v19[5] = *(_OWORD *)(a1 + 64);
  v19[6] = v21;
  v22 = *(_OWORD *)(a1 + 16);
  v19[1] = *(_OWORD *)a1;
  v19[2] = v22;
  sub_220D5F258((_QWORD *)a1);
  v23 = v33;
  sub_220D99274();
  v24 = v34;
  v25 = v35;
  v26 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  v26(v34, v14, v6);
  v27 = v36;
  v26(v36, v23, v6);
  v28 = v37;
  v26(v37, v24, v6);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB88);
  v26(&v28[*(int *)(v29 + 48)], v27, v6);
  v30 = *(void (**)(char *, uint64_t))(v25 + 8);
  v30(v23, v6);
  v30(v14, v6);
  v30(v27, v6);
  return ((uint64_t (*)(char *, uint64_t))v30)(v24, v6);
}

uint64_t sub_220D5ED2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_220D99418();
  sub_220D5F258((_QWORD *)a1);
  v9 = sub_220D9940C();
  v10 = swift_allocObject();
  v11 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v11;
  v12 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v10 + 64) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v10 + 80) = v12;
  v13 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v10 + 96) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v10 + 112) = v13;
  v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 48) = v14;
  sub_220D5F9A8((uint64_t)v7, a3, v10);
  return swift_release();
}

uint64_t sub_220D5EE24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  sub_220D99418();
  v4[3] = sub_220D9940C();
  v4[4] = sub_220D993F4();
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t sub_220D5EE90()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  sub_220D989B0();
  sub_220D5F034();
  v1 = sub_220D98D7C();
  *(_QWORD *)(v0 + 48) = v1;
  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v1 + 528) + *(_QWORD *)(*(_QWORD *)v1 + 528));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_220D5EF30;
  return v4();
}

uint64_t sub_220D5EF30()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_220D5EF84@<X0>(uint64_t a1@<X8>)
{
  return sub_220D5EFA0(a1);
}

uint64_t sub_220D5EFA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_220D99394();
  sub_220D5F128();
  result = sub_220D990C4();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_220D5EFF4@<X0>(uint64_t a1@<X8>)
{
  return sub_220D5E188(a1);
}

unint64_t sub_220D5F034()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564AB50;
  if (!qword_25564AB50)
  {
    v1 = sub_220D989B0();
    result = MEMORY[0x227665754](MEMORY[0x24BE7B4D8], v1);
    atomic_store(result, (unint64_t *)&qword_25564AB50);
  }
  return result;
}

uint64_t sub_220D5F07C@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 384))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_220D5F0B0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 392))(*a1);
}

uint64_t sub_220D5F0DC@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_220D5E598(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_220D5F0E4()
{
  unint64_t result;

  result = qword_25564AB60;
  if (!qword_25564AB60)
  {
    result = MEMORY[0x227665754](&unk_220D9D718, &type metadata for PASUIWelcomeControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_25564AB60);
  }
  return result;
}

unint64_t sub_220D5F128()
{
  unint64_t result;

  result = qword_25564AB68;
  if (!qword_25564AB68)
  {
    result = MEMORY[0x227665754](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25564AB68);
  }
  return result;
}

unint64_t sub_220D5F16C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564AB70;
  if (!qword_25564AB70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564AB58);
    result = MEMORY[0x227665754](MEMORY[0x24BDF5428], v1);
    atomic_store(result, (unint64_t *)&qword_25564AB70);
  }
  return result;
}

uint64_t sub_220D5F1B8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 432))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_220D5F1EC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 440))(*a1);
}

uint64_t sub_220D5F218@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_220D5EA20(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_220D5F220()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t sub_220D5F230()
{
  uint64_t v0;

  return sub_220D5ED2C(v0 + 16, (uint64_t)&unk_24E6A0C28, (uint64_t)&unk_25564AB98);
}

_QWORD *sub_220D5F258(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = a1[3];
  v3 = a1[5];
  v4 = (void *)a1[7];
  sub_220D5CD58();
  sub_220D5CD60(v2);
  sub_220D5CD60(v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

uint64_t sub_220D5F2E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_220D5CCCC;
  return sub_220D5EE24(a1, v4, v5, v1 + 32);
}

uint64_t sub_220D5F350()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  sub_220D5CDAC();
  if (*(_QWORD *)(v0 + 40))
    swift_release();
  if (*(_QWORD *)(v0 + 56))
    swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_220D5F3C0()
{
  uint64_t v0;

  return sub_220D5ED2C(v0 + 16, (uint64_t)&unk_24E6A0C78, (uint64_t)&unk_25564ABA8);
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  sub_220D5CDAC();
  if (*(_QWORD *)(v0 + 56))
    swift_release();
  if (*(_QWORD *)(v0 + 72))
    swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_220D5F454(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_220D5DA1C;
  return sub_220D5E8A4(a1, v4, v5, v1 + 32);
}

uint64_t sub_220D5F4C0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564AB48);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564AB58);
  sub_220D5F0E4();
  sub_220D5F128();
  sub_220D5F16C();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t PASUIExtensionMain(_:)(uint64_t (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v16;

  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PASUIExtensionHostProxy();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  v7 = a1();
  v8 = qword_255650658;
  qword_255650658 = v7;
  qword_255650660 = v9;
  qword_255650668 = v10;
  unk_255650670 = v6;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  sub_220D5F760(v8);
  v11 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
  v12 = sub_220D98C8C();
  v13 = sub_220D99454();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_220D57000, v12, v13, "PASUIExtensionMain extension is starting", v14, 2u);
    MEMORY[0x2276657E4](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  type metadata accessor for PASUIAppExtension();
  sub_220D5F798();
  sub_220D9889C();
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_220D5F760(uint64_t result)
{
  if (result)
  {
    swift_unknownObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_220D5F798()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564ABB0;
  if (!qword_25564ABB0)
  {
    v1 = type metadata accessor for PASUIAppExtension();
    result = MEMORY[0x227665754](&unk_220D9D4C4, v1);
    atomic_store(result, (unint64_t *)&qword_25564ABB0);
  }
  return result;
}

uint64_t sub_220D5F7E0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t destroy for PASUIExtensionParameters()
{
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t _s23ProximityAppleIDSetupUI24PASUIExtensionParametersVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PASUIExtensionParameters(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for PASUIExtensionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_unknownObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIExtensionParameters(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIExtensionParameters(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIExtensionParameters()
{
  return &type metadata for PASUIExtensionParameters;
}

uint64_t sub_220D5F9A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_220D9943C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_220D99430();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_220D5D018(a1, &qword_25564B0E0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220D993F4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_220D5FAF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_220D9943C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_220D99430();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_220D5D018(a1, &qword_25564B0E0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220D993F4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AD70);
  return swift_task_create();
}

uint64_t PASUITargetViewPresenterError.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_220D5FC84 + 4 * byte_220D9ACF0[a1]))(0xD000000000000010, 0x8000000220D9DEC0);
}

uint64_t sub_220D5FC84()
{
  return 0x4179646165726C61;
}

uint64_t sub_220D5FCA8()
{
  return 0x7669746341746F6ELL;
}

uint64_t sub_220D5FCC4()
{
  return 0x636E614372657375;
}

void sub_220D5FCE8(char *a1)
{
  sub_220D7BECC(*a1);
}

void sub_220D5FCF4()
{
  char *v0;

  sub_220D7C280(*v0);
}

void sub_220D5FCFC(uint64_t a1)
{
  char *v1;

  sub_220D7C4BC(a1, *v1);
}

void sub_220D5FD04(uint64_t a1)
{
  char *v1;

  sub_220D7C788(a1, *v1);
}

uint64_t sub_220D5FD0C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s23ProximityAppleIDSetupUI29PASUITargetViewPresenterErrorO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_220D5FD38@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = PASUITargetViewPresenterError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_220D5FD60()
{
  sub_220D671FC();
  return sub_220D98C50();
}

uint64_t sub_220D5FD88()
{
  unsigned __int8 *v0;

  return *v0 + 1100;
}

uint64_t sub_220D5FD94()
{
  sub_220D671FC();
  return sub_220D98C5C();
}

uint64_t sub_220D5FDBC()
{
  sub_220D66BCC();
  return sub_220D995EC();
}

uint64_t sub_220D5FE08()
{
  sub_220D671FC();
  sub_220D67240();
  return sub_220D98C68();
}

uint64_t sub_220D5FE44()
{
  sub_220D66B44();
  return sub_220D99628();
}

uint64_t sub_220D5FE6C()
{
  sub_220D66B44();
  return sub_220D9961C();
}

uint64_t PASUITargetViewPresenter.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  return MEMORY[0x227665880](v1);
}

uint64_t PASUITargetViewPresenter.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*PASUITargetViewPresenter.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x227665880](v5);
  return sub_220D60044;
}

void sub_220D60044(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t PASUITargetViewPresenter.shouldSignInForSelf.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(ObjectType, v1) & 1;
}

uint64_t PASUITargetViewPresenter.shouldSignInForSelf.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, ObjectType, v3);
}

uint64_t (*PASUITargetViewPresenter.shouldSignInForSelf.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = swift_getObjectType();
  *(_BYTE *)(a1 + 24) = (*(uint64_t (**)(void))(v3 + 40))() & 1;
  return sub_220D60288;
}

uint64_t sub_220D60288(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 48))(*(unsigned __int8 *)(a1 + 24), *(_QWORD *)(a1 + 16));
}

uint64_t sub_220D602B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics;
  if (*(_QWORD *)(v0 + OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics);
  }
  else
  {
    v2 = sub_220D60318(v0);
    *(_QWORD *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_220D60318(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(uint64_t *__return_ptr, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t, unint64_t);
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_220D98854();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(uint64_t *__return_ptr, uint64_t))(**(_QWORD **)(a1
                                                                           + OBJC_IVAR___PASUIDependentViewPresenter__analyticsProvider)
                                                             + 128);
  v7 = swift_retain();
  v6(&v20, v7);
  swift_release();
  v8 = v22;
  v9 = v23;
  __swift_project_boxed_opaque_existential_1(&v20, v22);
  v10 = (*(uint64_t (**)(ValueMetadata *, _UNKNOWN **, uint64_t, uint64_t))(v9 + 8))(&type metadata for PASUITargetViewPresenter.AnalyticsEvent, &off_24E6A0FC0, v8, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  sub_220D98848();
  v11 = sub_220D9883C();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v14 = MEMORY[0x24BEE0D00];
  v15 = MEMORY[0x24BE7BA08];
  v22 = MEMORY[0x24BEE0D00];
  v23 = MEMORY[0x24BE7BA08];
  v20 = v11;
  v21 = v13;
  v16 = *(void (**)(uint64_t *, uint64_t, unint64_t))(*(_QWORD *)v10 + 192);
  v16(&v20, 0x6973736553534150, 0xED000079654B6E6FLL);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  v22 = v14;
  v23 = v15;
  v20 = 0x746567726174;
  v21 = 0xE600000000000000;
  v16(&v20, 0xD000000000000014, 0x8000000220D9EE40);
  v17 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  (*(void (**)(uint64_t))(*(_QWORD *)v10 + 272))(v17);
  return v10;
}

id PASUITargetViewPresenter.__allocating_init(navigationController:flowController:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_220D663CC(a1, a2, a3);
  swift_unknownObjectRelease();
  return v8;
}

id PASUITargetViewPresenter.init(navigationController:flowController:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3;

  v3 = sub_220D663CC(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

id PASUITargetViewPresenter.__allocating_init(navigationController:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return PASUITargetViewPresenter.init(navigationController:)(a1);
}

id PASUITargetViewPresenter.init(navigationController:)(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void (*v21)(char *, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t *v30;
  id v31;
  uint64_t v33;
  char *v34;
  objc_class *ObjectType;
  uint64_t v36;
  objc_super v37;
  _QWORD v38[5];

  v36 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v33 - v7;
  swift_unknownObjectWeakInit();
  v9 = (uint64_t)&v1[OBJC_IVAR___PASUIDependentViewPresenter_navigationController];
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_QWORD *)(v9 + 32) = 0;
  *(_QWORD *)&v1[OBJC_IVAR___PASUIDependentViewPresenter_flowTimer] = 0;
  v10 = OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8E8);
  swift_allocObject();
  *(_QWORD *)&v1[v10] = sub_220D988B4();
  v11 = OBJC_IVAR___PASUIDependentViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F0);
  swift_allocObject();
  *(_QWORD *)&v1[v11] = sub_220D988B4();
  v12 = OBJC_IVAR___PASUIDependentViewPresenter__deviceProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  *(_QWORD *)&v1[v12] = sub_220D988B4();
  v13 = OBJC_IVAR___PASUIDependentViewPresenter__targetAppleIDExchanger;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A900);
  swift_allocObject();
  *(_QWORD *)&v1[v13] = sub_220D988B4();
  v14 = OBJC_IVAR___PASUIDependentViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A908);
  swift_allocObject();
  *(_QWORD *)&v1[v14] = sub_220D988B4();
  *(_QWORD *)&v1[OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics] = 0;
  v15 = OBJC_IVAR___PASUIDependentViewPresenter__featureFlagsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A910);
  swift_allocObject();
  *(_QWORD *)&v1[v15] = sub_220D988B4();
  v34 = v1;
  v16 = sub_220D98C80();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v17(v8, v16, v2);
  v18 = sub_220D98C8C();
  v19 = sub_220D99484();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_220D57000, v18, v19, "PAS=== Welcome to ProximityAppleIDSetup - Target ===PAS", v20, 2u);
    MEMORY[0x2276657E4](v20, -1, -1);
  }

  v21 = *(void (**)(char *, uint64_t))(v3 + 8);
  v21(v8, v2);
  v17(v6, v16, v2);
  v22 = sub_220D98C8C();
  v23 = sub_220D99484();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_220D57000, v22, v23, "PASUITargetViewPresenter init with nav controller", v24, 2u);
    MEMORY[0x2276657E4](v24, -1, -1);
  }

  v21(v6, v2);
  sub_220D988E4();
  swift_retain();
  sub_220D988D8();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(_QWORD *)(swift_allocObject() + 16) = 0;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC10);
  v38[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC18);
  v38[0] = v25;
  swift_retain();
  sub_220D988F0();
  swift_release();
  sub_220D5D018((uint64_t)v38, &qword_25564AC20);
  swift_release();
  v26 = v36;
  sub_220D66810(v36, (uint64_t)v38);
  swift_beginAccess();
  sub_220D66854((uint64_t)v38, v9);
  swift_endAccess();
  sub_220D98AF4();
  swift_allocObject();
  v27 = sub_220D98AE8();
  v28 = MEMORY[0x24BE7B750];
  v29 = v34;
  v30 = (uint64_t *)&v34[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  *v30 = v27;
  v30[1] = v28;

  v37.receiver = v29;
  v37.super_class = ObjectType;
  v31 = objc_msgSendSuper2(&v37, sel_init);
  __swift_destroy_boxed_opaque_existential_1(v26);
  return v31;
}

id PASUITargetViewPresenter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PASUITargetViewPresenter.init()()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  uint8_t *v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t *v36;
  uint64_t v38;
  char *v39;
  char *v40;
  objc_super v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v38 - v7;
  swift_unknownObjectWeakInit();
  v9 = (uint64_t)&v0[OBJC_IVAR___PASUIDependentViewPresenter_navigationController];
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_QWORD *)(v9 + 32) = 0;
  *(_QWORD *)&v0[OBJC_IVAR___PASUIDependentViewPresenter_flowTimer] = 0;
  v10 = OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8E8);
  swift_allocObject();
  *(_QWORD *)&v0[v10] = sub_220D988B4();
  v11 = OBJC_IVAR___PASUIDependentViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F0);
  swift_allocObject();
  *(_QWORD *)&v0[v11] = sub_220D988B4();
  v12 = OBJC_IVAR___PASUIDependentViewPresenter__deviceProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  *(_QWORD *)&v0[v12] = sub_220D988B4();
  v13 = OBJC_IVAR___PASUIDependentViewPresenter__targetAppleIDExchanger;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A900);
  swift_allocObject();
  *(_QWORD *)&v0[v13] = sub_220D988B4();
  v14 = OBJC_IVAR___PASUIDependentViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A908);
  swift_allocObject();
  *(_QWORD *)&v0[v14] = sub_220D988B4();
  *(_QWORD *)&v0[OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics] = 0;
  v15 = OBJC_IVAR___PASUIDependentViewPresenter__featureFlagsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A910);
  swift_allocObject();
  *(_QWORD *)&v0[v15] = sub_220D988B4();
  v40 = v0;
  v16 = sub_220D98C80();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v17(v8, v16, v2);
  v18 = sub_220D98C8C();
  v19 = sub_220D99484();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v39 = v8;
    v21 = v2;
    v22 = v6;
    v23 = v9;
    v24 = v3;
    v25 = ObjectType;
    v26 = v20;
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_220D57000, v18, v19, "PAS=== Welcome to ProximityAppleIDSetup - Target ===PAS", v20, 2u);
    v27 = v26;
    ObjectType = v25;
    v3 = v24;
    v9 = v23;
    v6 = v22;
    v2 = v21;
    v8 = v39;
    MEMORY[0x2276657E4](v27, -1, -1);
  }

  v28 = *(void (**)(char *, uint64_t))(v3 + 8);
  v28(v8, v2);
  v17(v6, v16, v2);
  v29 = sub_220D98C8C();
  v30 = sub_220D99484();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_220D57000, v29, v30, "PASUITargetViewPresenter init", v31, 2u);
    MEMORY[0x2276657E4](v31, -1, -1);
  }

  v28(v6, v2);
  sub_220D988E4();
  swift_retain();
  sub_220D988D8();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(_QWORD *)(swift_allocObject() + 16) = 0;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC10);
  *((_QWORD *)&v43 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC18);
  *(_QWORD *)&v42 = v32;
  swift_retain();
  sub_220D988F0();
  swift_release();
  sub_220D5D018((uint64_t)&v42, &qword_25564AC20);
  swift_release();
  v44 = 0;
  v42 = 0u;
  v43 = 0u;
  swift_beginAccess();
  sub_220D66854((uint64_t)&v42, v9);
  swift_endAccess();
  sub_220D98AF4();
  swift_allocObject();
  v33 = sub_220D98AE8();
  v34 = MEMORY[0x24BE7B750];
  v35 = v40;
  v36 = (uint64_t *)&v40[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  *v36 = v33;
  v36[1] = v34;

  v41.receiver = v35;
  v41.super_class = ObjectType;
  return objc_msgSendSuper2(&v41, sel_init);
}

id PASUITargetViewPresenter.__deallocating_deinit()
{
  void *v0;
  void *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  objc_class *v15;
  uint8_t *v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v23;
  void *v24;
  objc_super v25;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_220D98C98();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v23 - v8;
  v10 = sub_220D98C80();
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v10, v3);
  v12 = sub_220D98C8C();
  v13 = sub_220D99484();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v24 = v1;
    v15 = ObjectType;
    v16 = v14;
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_220D57000, v12, v13, "PASUITargetViewPresenter deinit", v14, 2u);
    v17 = v16;
    ObjectType = v15;
    v1 = v24;
    MEMORY[0x2276657E4](v17, -1, -1);
  }

  v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  v18(v9, v3);
  sub_220D988E4();
  swift_retain();
  sub_220D988C0();
  swift_release();
  v11(v7, v10, v3);
  v19 = sub_220D98C8C();
  v20 = sub_220D99484();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_220D57000, v19, v20, "PAS=== Goodbye ===PAS", v21, 2u);
    MEMORY[0x2276657E4](v21, -1, -1);
  }

  v18(v7, v3);
  v25.receiver = v1;
  v25.super_class = ObjectType;
  return objc_msgSendSuper2(&v25, sel_dealloc);
}

uint64_t PASUITargetViewPresenter.activateAndPresentInitialStep(withTemplate:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_220D98C98();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = sub_220D99418();
  v2[20] = sub_220D9940C();
  v2[21] = sub_220D993F4();
  v2[22] = v4;
  return swift_task_switch();
}

uint64_t sub_220D61214()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD *, uint64_t, uint64_t);

  v1 = (void *)v0[14];
  v2 = *(void (**)(uint64_t))(**(_QWORD **)(v0[15]
                                                    + OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider)
                                      + 128);
  v3 = swift_retain();
  v2(v3);
  swift_release();
  v4 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v6 = sub_220D668C0();
  v7 = MEMORY[0x24BE7BA30];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  v11 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))(**(int **)(v5 + 24) + *(_QWORD *)(v5 + 24));
  v8 = v1;
  v9 = (_QWORD *)swift_task_alloc();
  v0[23] = v9;
  *v9 = v0;
  v9[1] = sub_220D612F4;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_220D612F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

uint64_t sub_220D61360()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  *(_QWORD *)(v0 + 200) = sub_220D9940C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v1;
  *v1 = v0;
  v1[1] = sub_220D613BC;
  return sub_220D61ED4();
}

uint64_t sub_220D613BC()
{
  swift_task_dealloc();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D6142C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 120);
  swift_release();
  v2 = *(_QWORD *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v2 + 88))(ObjectType, v2);
  (*(void (**)(void))(v2 + 80))();
  swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_220D614B4()
{
  uint64_t v0;
  id v1;

  swift_release();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v1);
}

uint64_t sub_220D61510()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = (void *)v0[24];
  v3 = v0[17];
  v2 = v0[18];
  v4 = v0[16];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v5 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_220D98C8C();
  v9 = sub_220D9946C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (void *)v0[24];
    v11 = v0[17];
    v23 = v0[16];
    v24 = v0[18];
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136446210;
    v25 = v13;
    v0[12] = v10;
    v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
    v15 = sub_220D99370();
    v0[13] = sub_220D6593C(v15, v16, &v25);
    sub_220D99508();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220D57000, v8, v9, "Failed to activate PASUITargetViewPresenter with message session: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v13, -1, -1);
    MEMORY[0x2276657E4](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v24, v23);
  }
  else
  {
    v17 = (void *)v0[24];
    v19 = v0[17];
    v18 = v0[18];
    v20 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  v0[25] = sub_220D9940C();
  v21 = (_QWORD *)swift_task_alloc();
  v0[26] = v21;
  *v21 = v0;
  v21[1] = sub_220D613BC;
  return sub_220D61ED4();
}

uint64_t sub_220D61880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_220D99418();
  v3[5] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D618F0()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = (void *)v0[4];
  v3 = (void *)v0[2];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = (uint64_t)_Block_copy(v2);
  v4 = v3;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_220D6196C;
  return PASUITargetViewPresenter.activateAndPresentInitialStep(withTemplate:)(v0[2]);
}

uint64_t sub_220D6196C(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 48);
  v4 = *(void **)(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t PASUITargetViewPresenter.activate(withTemplate:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_220D98C98();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  sub_220D99418();
  v2[19] = sub_220D9940C();
  v2[20] = sub_220D993F4();
  v2[21] = v4;
  return swift_task_switch();
}

uint64_t sub_220D61A80()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD *, uint64_t, uint64_t);

  v1 = (void *)v0[14];
  v2 = *(void (**)(uint64_t))(**(_QWORD **)(v0[15]
                                                    + OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider)
                                      + 128);
  v3 = swift_retain();
  v2(v3);
  swift_release();
  v4 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v6 = sub_220D668C0();
  v7 = MEMORY[0x24BE7BA30];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  v11 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))(**(int **)(v5 + 24) + *(_QWORD *)(v5 + 24));
  v8 = v1;
  v9 = (_QWORD *)swift_task_alloc();
  v0[22] = v9;
  *v9 = v0;
  v9[1] = sub_220D61B60;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_220D61B60()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

uint64_t sub_220D61BCC()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v1;
  *v1 = v0;
  v1[1] = sub_220D61C1C;
  return sub_220D61ED4();
}

uint64_t sub_220D61C1C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D61C68()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D61CA0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = (void *)v0[23];
  v3 = v0[17];
  v2 = v0[18];
  v4 = v0[16];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v5 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_220D98C8C();
  v9 = sub_220D9946C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (void *)v0[23];
    v11 = v0[17];
    v23 = v0[16];
    v24 = v0[18];
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136446210;
    v25 = v13;
    v0[12] = v10;
    v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
    v15 = sub_220D99370();
    v0[13] = sub_220D6593C(v15, v16, &v25);
    sub_220D99508();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220D57000, v8, v9, "Failed to activate PASUITargetViewPresenter with message session: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v13, -1, -1);
    MEMORY[0x2276657E4](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v24, v23);
  }
  else
  {
    v17 = (void *)v0[23];
    v19 = v0[17];
    v18 = v0[18];
    v20 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  v21 = (_QWORD *)swift_task_alloc();
  v0[24] = v21;
  *v21 = v0;
  v21[1] = sub_220D61C1C;
  return sub_220D61ED4();
}

uint64_t sub_220D61ED4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[9] = v0;
  v2 = sub_220D98C98();
  v1[10] = v2;
  v1[11] = *(_QWORD *)(v2 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_220D99418();
  v1[14] = sub_220D9940C();
  v1[15] = sub_220D993F4();
  v1[16] = v3;
  return swift_task_switch();
}

uint64_t sub_220D61F78()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = sub_220D602B4();
  *(_QWORD *)(v0 + 136) = v1;
  *(_QWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 48) = 1;
  v4 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 232) + *(_QWORD *)(*(_QWORD *)v1 + 232));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v2;
  *v2 = v0;
  v2[1] = sub_220D61FF8;
  return v4(v0 + 40);
}

uint64_t sub_220D61FF8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_220D6204C()
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
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  void (*v18)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD *v20;
  uint64_t (*v22)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 72);
  v2 = sub_220D602B4();
  *(_QWORD *)(v0 + 56) = 1;
  *(_BYTE *)(v0 + 64) = 1;
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 264))();
  swift_release();
  *(_QWORD *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowTimer) = v3;
  swift_release();
  v4 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  v5 = MEMORY[0x227665880](v4);
  swift_unknownObjectRelease();
  if (!v5)
  {
    v6 = *(_QWORD *)(v0 + 104);
    v7 = *(_QWORD *)(v0 + 80);
    v8 = *(_QWORD *)(v0 + 88);
    v9 = sub_220D98C80();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v9, v7);
    v10 = sub_220D98C8C();
    v11 = sub_220D99478();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_220D57000, v10, v11, "PASUITargetViewPresenter delegate is nil in activate", v12, 2u);
      MEMORY[0x2276657E4](v12, -1, -1);
    }
    v13 = *(_QWORD *)(v0 + 104);
    v14 = *(_QWORD *)(v0 + 80);
    v15 = *(_QWORD *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  v16 = *(_QWORD *)(*(_QWORD *)(v0 + 72) + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  v18 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v16 + 24);
  v19 = swift_unknownObjectRetain();
  v18(v19, &protocol witness table for PASUITargetViewPresenter, ObjectType, v16);
  v22 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v16 + 64) + *(_QWORD *)(v16 + 64));
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v20;
  *v20 = v0;
  v20[1] = sub_220D62220;
  return v22(ObjectType, v16);
}

uint64_t sub_220D62220()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D6226C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  swift_release();
  v4 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_220D98C8C();
  v6 = sub_220D99484();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "PASUITargetViewPresenter activated", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D62490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_220D99418();
  v3[5] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D62500()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = (void *)v0[4];
  v3 = (void *)v0[2];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = (uint64_t)_Block_copy(v2);
  v4 = v3;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_220D673C4;
  return PASUITargetViewPresenter.activate(withTemplate:)(v0[2]);
}

uint64_t PASUITargetViewPresenter.startFlow(withNavigationController:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  type metadata accessor for PASViewControllerPresentationHandler();
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  swift_unknownObjectRetain();
  v3 = swift_retain();
  sub_220D66020(v3, v1);
  return swift_release_n();
}

uint64_t PASUITargetViewPresenter.startFlow(withFlowStepsHandler:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = a1[3];
  v3 = a1[4];
  v4 = __swift_project_boxed_opaque_existential_1(a1, v2);
  return sub_220D661EC((uint64_t)v4, v1, v2, v3);
}

Swift::Void __swiftcall PASUITargetViewPresenter.startFlow(withContainerViewController:)(UIViewController *withContainerViewController)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  UIViewController *v6;
  uint64_t v7;
  uint64_t ObjectType;
  _QWORD v9[5];

  v3 = type metadata accessor for PASDefaultFlowStepsPresentationHandler();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = withContainerViewController;
  v9[3] = v3;
  v9[4] = &protocol witness table for PASDefaultFlowStepsPresentationHandler;
  v9[0] = v4;
  v5 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  v6 = withContainerViewController;
  swift_retain();
  sub_220D66854((uint64_t)v9, v5);
  swift_endAccess();
  v7 = *(_QWORD *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v7 + 88))(ObjectType, v7);
  (*(void (**)(void))(v7 + 80))();
  swift_release();
  swift_unknownObjectRelease();
}

uint64_t _s23ProximityAppleIDSetupUI24PASUITargetViewPresenterC19stepDidRequestResetyy0abC011PASFlowStep_pF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t ObjectType;
  uint64_t v23;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v23 - v7;
  v9 = sub_220D98C80();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  v11 = sub_220D98C8C();
  v12 = sub_220D99484();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_220D57000, v11, v12, "PASUITargetViewPresenter reset", v13, 2u);
    MEMORY[0x2276657E4](v13, -1, -1);
  }

  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v8, v2);
  v15 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  v16 = MEMORY[0x227665880](v15);
  swift_unknownObjectRelease();
  if (!v16)
  {
    v10(v6, v9, v2);
    v17 = sub_220D98C8C();
    v18 = sub_220D99478();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_220D57000, v17, v18, "PASUITargetViewPresenter delegate is nil in reset", v19, 2u);
      MEMORY[0x2276657E4](v19, -1, -1);
    }

    v14(v6, v2);
  }
  v20 = *(_QWORD *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v20 + 88))(ObjectType, v20);
  (*(void (**)(void))(v20 + 80))();
  return swift_unknownObjectRelease();
}

uint64_t _s23ProximityAppleIDSetupUI24PASUITargetViewPresenterC12handleCancelyyF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  _BYTE v28[56];
  _QWORD v29[6];
  char v30;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v28[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v28[-v7 - 8];
  v9 = sub_220D98C80();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  v11 = sub_220D98C8C();
  v12 = sub_220D99484();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_220D57000, v11, v12, "PASUITargetViewPresenter flowDidCancel", v13, 2u);
    MEMORY[0x2276657E4](v13, -1, -1);
  }

  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v8, v2);
  v15 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  v16 = MEMORY[0x227665880](v15);
  swift_unknownObjectRelease();
  if (!v16)
  {
    v10(v6, v9, v2);
    v17 = sub_220D98C8C();
    v18 = sub_220D99478();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_220D57000, v17, v18, "PASUITargetViewPresenter delegate is nil in reset", v19, 2u);
      MEMORY[0x2276657E4](v19, -1, -1);
    }

    v14(v6, v2);
  }
  sub_220D66C14();
  v20 = swift_allocError();
  *v21 = 3;
  v29[0] = v20;
  v30 = 1;
  v22 = MEMORY[0x227665880](v15);
  if (v22)
  {
    v23 = (void *)v22;
    sub_220D5CFD4((uint64_t)v29, (uint64_t)v28, &qword_25564ACA0);
    v24 = objc_allocWithZone((Class)sub_220D98B18());
    v25 = (void *)sub_220D98B0C();
    objc_msgSend(v23, sel_proximitySetupCompletedWithResult_, v25);
    swift_unknownObjectRelease();

  }
  return sub_220D5D018((uint64_t)v29, &qword_25564ACA0);
}

uint64_t PASUITargetViewPresenter.setTemplate(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_220D98C98();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  sub_220D99418();
  v2[19] = sub_220D9940C();
  v2[20] = sub_220D993F4();
  v2[21] = v4;
  return swift_task_switch();
}

uint64_t sub_220D62D34()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD *, uint64_t, uint64_t);

  v1 = (void *)v0[14];
  v2 = *(void (**)(uint64_t))(**(_QWORD **)(v0[15]
                                                    + OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider)
                                      + 128);
  v3 = swift_retain();
  v2(v3);
  swift_release();
  v4 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v6 = sub_220D668C0();
  v7 = MEMORY[0x24BE7BA30];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  v11 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))(**(int **)(v5 + 24) + *(_QWORD *)(v5 + 24));
  v8 = v1;
  v9 = (_QWORD *)swift_task_alloc();
  v0[22] = v9;
  *v9 = v0;
  v9[1] = sub_220D62E14;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_220D62E14()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

uint64_t sub_220D62E80()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D62EC4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(void **)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v5 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  v6 = v1;
  v7 = v1;
  v8 = sub_220D98C8C();
  v9 = sub_220D9946C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 184);
    v11 = *(_QWORD *)(v0 + 136);
    v22 = *(_QWORD *)(v0 + 128);
    v23 = *(_QWORD *)(v0 + 144);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136446210;
    v24 = v13;
    *(_QWORD *)(v0 + 96) = v10;
    v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
    v15 = sub_220D99370();
    *(_QWORD *)(v0 + 104) = sub_220D6593C(v15, v16, &v24);
    sub_220D99508();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220D57000, v8, v9, "Failed to set template message session in PASUITargetViewPresenter: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v13, -1, -1);
    MEMORY[0x2276657E4](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v23, v22);
  }
  else
  {
    v17 = *(void **)(v0 + 184);
    v19 = *(_QWORD *)(v0 + 136);
    v18 = *(_QWORD *)(v0 + 144);
    v20 = *(_QWORD *)(v0 + 128);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D63218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_220D99418();
  v3[5] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D63288()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = (void *)v0[4];
  v3 = (void *)v0[2];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = (uint64_t)_Block_copy(v2);
  v4 = v3;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_220D63304;
  return PASUITargetViewPresenter.setTemplate(_:)(v0[2]);
}

uint64_t sub_220D63304()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  uint64_t v5;

  v1 = *(void (***)(_QWORD))(*v0 + 48);
  v2 = *(void **)(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t PASUITargetViewPresenter.proximitySetupSelectedAccountType(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[27] = a1;
  v2[28] = v1;
  v3 = sub_220D98C98();
  v2[29] = v3;
  v2[30] = *(_QWORD *)(v3 - 8);
  v2[31] = swift_task_alloc();
  sub_220D99418();
  v2[32] = sub_220D9940C();
  v2[33] = sub_220D993F4();
  v2[34] = v4;
  return swift_task_switch();
}

uint64_t sub_220D6340C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v1 = *(_QWORD *)(v0 + 216);
  v2 = sub_220D602B4();
  *(_QWORD *)(v0 + 280) = v2;
  *(_QWORD *)(v0 + 200) = v1;
  *(_BYTE *)(v0 + 208) = 0;
  v5 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v2 + 232) + *(_QWORD *)(*(_QWORD *)v2 + 232));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v3;
  *v3 = v0;
  v3[1] = sub_220D6348C;
  return v5(v0 + 200);
}

uint64_t sub_220D6348C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_220D634E0()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;

  v1 = *(void (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v0 + 224)
                                                    + OBJC_IVAR___PASUIDependentViewPresenter__featureFlagsProvider)
                                      + 128);
  v2 = swift_retain();
  v1(v2);
  swift_release();
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 152);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 120), v3);
  v5 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v4 + 8))(0, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  if ((v5 & 1) != 0
    && (v6 = *(_QWORD *)(*(_QWORD *)(v0 + 224) + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8),
        ObjectType = swift_getObjectType(),
        ((*(uint64_t (**)(uint64_t, uint64_t))(v6 + 40))(ObjectType, v6) & 1) != 0))
  {
    v9 = *(_QWORD *)(v0 + 240);
    v8 = *(_QWORD *)(v0 + 248);
    v10 = *(_QWORD *)(v0 + 232);
    v11 = sub_220D98C80();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
    v12 = sub_220D98C8C();
    v13 = sub_220D99484();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_220D57000, v12, v13, "PASUITargetViewPresenter proximitySetupSelectedAccountType and signInForSelf is enabled. We'll take it from here", v14, 2u);
      MEMORY[0x2276657E4](v14, -1, -1);
    }
    v16 = *(_QWORD *)(v0 + 240);
    v15 = *(_QWORD *)(v0 + 248);
    v17 = *(_QWORD *)(v0 + 232);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    v18 = 0;
  }
  else
  {
    v18 = *(_QWORD *)(v0 + 216);
  }
  v19 = *(_QWORD *)(v0 + 224) + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  v20 = MEMORY[0x227665880](v19);
  *(_QWORD *)(v0 + 296) = v20;
  if (v20)
  {
    *(_QWORD *)(v0 + 184) = &unk_255651580;
    *(_QWORD *)(v0 + 192) = &unk_25566BF00;
    v21 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v21)
    {
      v22 = v21;
      if (objc_msgSend(v21, sel_respondsToSelector_, sel_proximitySetupSelectedAccount_completion_))
      {
        *(_QWORD *)(v0 + 56) = v0 + 209;
        *(_QWORD *)(v0 + 16) = v0;
        *(_QWORD *)(v0 + 24) = sub_220D637A8;
        v23 = swift_continuation_init();
        *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
        v24 = (_QWORD *)(v0 + 80);
        v24[1] = 0x40000000;
        v24[2] = sub_220D63838;
        v24[3] = &block_descriptor;
        v24[4] = v23;
        objc_msgSend(v22, sel_proximitySetupSelectedAccount_completion_, v18, v24);
        return swift_continuation_await();
      }
      swift_release();
      objc_msgSend(v22, sel_proximitySetupSelectedAccountType_, v18);
    }
    else
    {
      swift_release();
    }
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_220D637A8()
{
  return swift_task_switch();
}

uint64_t sub_220D637EC()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  swift_unknownObjectRelease();
  v1 = *(unsigned __int8 *)(v0 + 209);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_220D63838(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t PASUITargetViewPresenter.setupPasscodeAndBiometric()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[20] = v0;
  sub_220D99418();
  v1[21] = sub_220D9940C();
  v1[22] = sub_220D993F4();
  v1[23] = v2;
  return swift_task_switch();
}

uint64_t sub_220D638B8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = sub_220D602B4();
  *(_QWORD *)(v0 + 192) = v1;
  *(_QWORD *)(v0 + 144) = 2;
  *(_BYTE *)(v0 + 152) = 1;
  v4 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 232) + *(_QWORD *)(*(_QWORD *)v1 + 232));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v2;
  *v2 = v0;
  v2[1] = sub_220D6393C;
  return v4(v0 + 144);
}

uint64_t sub_220D6393C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_220D63990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 160) + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  v2 = MEMORY[0x227665880](v1);
  *(_QWORD *)(v0 + 208) = v2;
  if (v2)
  {
    v3 = (void *)v2;
    *(_QWORD *)(v0 + 56) = v0 + 153;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_220D63A78;
    v4 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v5 = (_QWORD *)(v0 + 80);
    v5[1] = 0x40000000;
    v5[2] = sub_220D63838;
    v5[3] = &block_descriptor_7;
    v5[4] = v4;
    objc_msgSend(v3, sel_setupPasscodeAndBiometricWithCompletion_, v5);
    return swift_continuation_await();
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_220D63A78()
{
  return swift_task_switch();
}

uint64_t sub_220D63ABC()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(unsigned __int8 *)(v0 + 153);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t PASUITargetViewPresenter.performAIDASignIn(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[19] = a1;
  v2[20] = v1;
  v3 = sub_220D98C98();
  v2[21] = v3;
  v2[22] = *(_QWORD *)(v3 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  sub_220D99418();
  v2[26] = sub_220D9940C();
  v2[27] = sub_220D993F4();
  v2[28] = v4;
  return swift_task_switch();
}

uint64_t sub_220D63BB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  NSObject *v27;
  os_log_type_t v28;
  BOOL v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  v4 = sub_220D98C80();
  *(_QWORD *)(v0 + 232) = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 240) = v5;
  v5(v1, v4, v2);
  v6 = sub_220D98C8C();
  v7 = sub_220D99460();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_220D57000, v6, v7, "PASUITargetViewPresenter performAIDASignIn", v8, 2u);
    MEMORY[0x2276657E4](v8, -1, -1);
  }
  v9 = *(_QWORD *)(v0 + 200);
  v10 = *(_QWORD *)(v0 + 168);
  v11 = *(_QWORD *)(v0 + 176);
  v12 = *(_QWORD *)(v0 + 160);

  v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  *(_QWORD *)(v0 + 248) = v13;
  v13(v9, v10);
  v14 = v12 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  v15 = MEMORY[0x227665880](v14);
  swift_unknownObjectRelease();
  if (!v15)
  {
    v5(*(_QWORD *)(v0 + 192), v4, *(_QWORD *)(v0 + 168));
    v16 = sub_220D98C8C();
    v17 = sub_220D99478();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_220D57000, v16, v17, "PASUITargetViewPresenter delegate is nil in performAIDASignIn", v18, 2u);
      MEMORY[0x2276657E4](v18, -1, -1);
    }
    v19 = *(_QWORD *)(v0 + 192);
    v20 = *(_QWORD *)(v0 + 168);

    v13(v19, v20);
  }
  v21 = MEMORY[0x227665880](v14);
  *(_QWORD *)(v0 + 256) = v21;
  if (v21)
  {
    v22 = (void *)v21;
    v23 = sub_220D98908();
    *(_QWORD *)(v0 + 264) = v23;
    *(_QWORD *)(v0 + 56) = v0 + 272;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_220D63FB4;
    v24 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v25 = (_QWORD *)(v0 + 80);
    v25[1] = 0x40000000;
    v25[2] = sub_220D63838;
    v25[3] = &block_descriptor_9;
    v25[4] = v24;
    objc_msgSend(v22, sel_setupPerformAIDASignInWith_completion_, v23, v25);
    return swift_continuation_await();
  }
  else
  {
    swift_release();
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 240))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 168));
    v27 = sub_220D98C8C();
    v28 = sub_220D99460();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    v31 = *(_QWORD *)(v0 + 184);
    v32 = *(_QWORD *)(v0 + 168);
    if (v29)
    {
      v37 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v38 = v34;
      *(_DWORD *)v33 = 136446210;
      *(_BYTE *)(v0 + 273) = 2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC78);
      v35 = sub_220D99370();
      *(_QWORD *)(v0 + 144) = sub_220D6593C(v35, v36, &v38);
      sub_220D99508();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_220D57000, v27, v28, "PASUITargetViewPresenter performAIDASignIn result: %{public}s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v34, -1, -1);
      MEMORY[0x2276657E4](v33, -1, -1);

      v37(v31, v32);
    }
    else
    {

      v30(v31, v32);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_220D63FB4()
{
  return swift_task_switch();
}

uint64_t sub_220D63FF8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;

  v1 = *(void **)(v0 + 264);
  swift_release();
  v2 = *(unsigned __int8 *)(v0 + 272);
  swift_unknownObjectRelease();

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 240))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 168));
  v3 = sub_220D98C8C();
  v4 = sub_220D99460();
  if (os_log_type_enabled(v3, v4))
  {
    v14 = *(_QWORD *)(v0 + 184);
    v15 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    v5 = *(_QWORD *)(v0 + 168);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v16 = v7;
    *(_DWORD *)v6 = 136446210;
    *(_BYTE *)(v0 + 273) = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC78);
    v8 = sub_220D99370();
    *(_QWORD *)(v0 + 144) = sub_220D6593C(v8, v9, &v16);
    sub_220D99508();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220D57000, v3, v4, "PASUITargetViewPresenter performAIDASignIn result: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v7, -1, -1);
    MEMORY[0x2276657E4](v6, -1, -1);

    v15(v14, v5);
  }
  else
  {
    v10 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    v11 = *(_QWORD *)(v0 + 184);
    v12 = *(_QWORD *)(v0 + 168);

    v10(v11, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t PASUITargetViewPresenter.present(step:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD v28[2];
  void *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_220D98C98();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  swift_unknownObjectRetain_n();
  v14 = sub_220D98C8C();
  v15 = sub_220D99484();
  if (os_log_type_enabled(v14, v15))
  {
    v31 = a2;
    v16 = swift_slowAlloc();
    v30 = v8;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v29 = v3;
    *(_DWORD *)v17 = 136446210;
    v28[1] = v17 + 4;
    v32 = a1;
    v33 = v31;
    v34 = v18;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC90);
    v19 = sub_220D99370();
    v32 = sub_220D6593C(v19, v20, &v34);
    v3 = v29;
    sub_220D99508();
    a2 = v31;
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_220D57000, v14, v15, "PASUITargetViewPresenter present step %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v18, -1, -1);
    v21 = v17;
    v8 = v30;
    MEMORY[0x2276657E4](v21, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v22 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v8, 1, 1, v22);
  sub_220D99418();
  swift_unknownObjectRetain();
  v23 = v3;
  v24 = sub_220D9940C();
  v25 = (_QWORD *)swift_allocObject();
  v26 = MEMORY[0x24BEE6930];
  v25[2] = v24;
  v25[3] = v26;
  v25[4] = v23;
  v25[5] = a1;
  v25[6] = a2;
  sub_220D5F9A8((uint64_t)v8, (uint64_t)&unk_25564AC88, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_220D64498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[16] = a5;
  v6[17] = a6;
  v6[15] = a4;
  v7 = sub_220D98C98();
  v6[18] = v7;
  v6[19] = *(_QWORD *)(v7 - 8);
  v6[20] = swift_task_alloc();
  sub_220D99418();
  v6[21] = sub_220D9940C();
  v6[22] = sub_220D993F4();
  v6[23] = v8;
  return swift_task_switch();
}

uint64_t sub_220D64530()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t ObjectType;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0[15] + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  v5 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v1 + 72) + *(_QWORD *)(v1 + 72));
  v3 = (_QWORD *)swift_task_alloc();
  v0[24] = v3;
  *v3 = v0;
  v3[1] = sub_220D645BC;
  return v5(v0[16], v0[17], ObjectType, v1);
}

uint64_t sub_220D645BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D6461C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 120);
  swift_release();
  v2 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  if (*(_QWORD *)(v2 + 24))
  {
    v4 = *(_QWORD *)(v0 + 128);
    v3 = *(_QWORD *)(v0 + 136);
    sub_220D66810(v2, v0 + 16);
    v5 = *(_QWORD *)(v0 + 40);
    v6 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8))(v4, v3, v5, v6);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D646DC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = *(void **)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 152);
  swift_release();
  v5 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  swift_unknownObjectRetain();
  v6 = v1;
  swift_unknownObjectRetain();
  v7 = v1;
  v8 = sub_220D98C8C();
  v9 = sub_220D9946C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 200);
    v24 = *(_QWORD *)(v0 + 152);
    v25 = *(_QWORD *)(v0 + 144);
    v26 = *(_QWORD *)(v0 + 160);
    v23 = *(_OWORD *)(v0 + 128);
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v27 = v12;
    *(_DWORD *)v11 = 136446466;
    *(_OWORD *)(v0 + 80) = v23;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC90);
    v13 = sub_220D99370();
    *(_QWORD *)(v0 + 96) = sub_220D6593C(v13, v14, &v27);
    sub_220D99508();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2082;
    *(_QWORD *)(v0 + 104) = v10;
    v15 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
    v16 = sub_220D99370();
    *(_QWORD *)(v0 + 112) = sub_220D6593C(v16, v17, &v27);
    sub_220D99508();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220D57000, v8, v9, "PASUITargetViewPresenter did not present step %{public}s.\n%{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v12, -1, -1);
    MEMORY[0x2276657E4](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    v18 = *(void **)(v0 + 200);
    v20 = *(_QWORD *)(v0 + 152);
    v19 = *(_QWORD *)(v0 + 160);
    v21 = *(_QWORD *)(v0 + 144);

    swift_unknownObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PASUITargetViewPresenter.flowDidComplete(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[30] = a1;
  v2[31] = v1;
  v3 = sub_220D98830();
  v2[32] = v3;
  v2[33] = *(_QWORD *)(v3 - 8);
  v2[34] = swift_task_alloc();
  v4 = sub_220D98C98();
  v2[35] = v4;
  v2[36] = *(_QWORD *)(v4 - 8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  sub_220D99418();
  v2[39] = sub_220D9940C();
  v2[40] = sub_220D993F4();
  v2[41] = v5;
  return swift_task_switch();
}

uint64_t sub_220D64A5C()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD *v29;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v1 = v0;
  v2 = v0 + 30;
  v3 = v0[30];
  v4 = (uint64_t)(v0 + 2);
  v5 = (uint64_t)(v0 + 9);
  v6 = v0[38];
  v8 = v0[35];
  v7 = v0[36];
  v9 = sub_220D98C80();
  v2[12] = v9;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v2[13] = v10;
  v10(v6, v9, v8);
  sub_220D5CFD4(v3, v4, &qword_25564ACA0);
  v11 = sub_220D98C8C();
  v12 = sub_220D99484();
  if (os_log_type_enabled(v11, v12))
  {
    v41 = v1[36];
    v42 = v1[35];
    v43 = v1[38];
    v44 = v5;
    v13 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v1[28] = 1752392040;
    v45 = v40;
    *(_DWORD *)v13 = 141558274;
    sub_220D99508();
    *(_WORD *)(v13 + 12) = 2080;
    sub_220D5CFD4(v4, (uint64_t)(v1 + 16), &qword_25564ACA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564ACA0);
    v14 = sub_220D99370();
    v1[29] = sub_220D6593C(v14, v15, &v45);
    sub_220D99508();
    swift_bridgeObjectRelease();
    sub_220D5D018(v4, &qword_25564ACA0);
    _os_log_impl(&dword_220D57000, v11, v12, "PASUITargetViewPresenter flowDidComplete with %{mask.hash}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v40, -1, -1);
    v16 = v13;
    v5 = v44;
    MEMORY[0x2276657E4](v16, -1, -1);

    v17 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
    v17(v43, v42);
  }
  else
  {
    v18 = v1[38];
    v19 = v1[35];
    v20 = v1[36];
    sub_220D5D018(v4, &qword_25564ACA0);

    v17 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v17(v18, v19);
  }
  v1[44] = v17;
  v21 = v1[31];
  sub_220D5CFD4(v1[30], v5, &qword_25564ACA0);
  v22 = objc_allocWithZone((Class)sub_220D98B18());
  v23 = sub_220D98B0C();
  v1[45] = v23;
  v24 = *(_QWORD *)(v21 + OBJC_IVAR___PASUIDependentViewPresenter_flowTimer);
  v1[46] = v24;
  if (v24)
  {
    v25 = (void *)v23;
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v25;
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = &unk_25564ACB0;
    *(_QWORD *)(v27 + 24) = v26;
    v1[26] = &unk_25564ACC0;
    v1[27] = v27;
    swift_retain();
    v28 = v25;
    sub_220D98824();
    v29 = (_QWORD *)swift_task_alloc();
    v1[47] = v29;
    *v29 = v1;
    v29[1] = sub_220D64ED4;
    return sub_220D98C74();
  }
  else
  {
    swift_release();
    v31 = v1[31] + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
    swift_beginAccess();
    v32 = MEMORY[0x227665880](v31);
    swift_unknownObjectRelease();
    if (!v32)
    {
      ((void (*)(_QWORD, _QWORD, _QWORD))v1[43])(v1[37], v1[42], v1[35]);
      v33 = sub_220D98C8C();
      v34 = sub_220D99478();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_220D57000, v33, v34, "PASUITargetViewPresenter delegate is nil in flowDidComplete", v35, 2u);
        MEMORY[0x2276657E4](v35, -1, -1);
      }
      v36 = (void (*)(uint64_t, uint64_t))v1[44];
      v37 = v1[37];
      v38 = v1[35];

      v36(v37, v38);
    }
    v39 = (void *)MEMORY[0x227665880](v31);
    if (v39)
    {
      objc_msgSend(v39, sel_proximitySetupCompletedWithResult_, v1[45]);
      swift_unknownObjectRelease();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return ((uint64_t (*)(void))v1[1])();
  }
}

uint64_t sub_220D64ED4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v3 = *(_QWORD *)(*v0 + 264);
  v2 = *(_QWORD *)(*v0 + 272);
  v4 = *(_QWORD *)(*v0 + 256);
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_220D5CDB4(*(_QWORD *)(v1 + 208));
  return swift_task_switch();
}

uint64_t sub_220D64F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  void *v9;

  swift_release();
  v1 = *(_QWORD *)(v0 + 248) + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  v2 = MEMORY[0x227665880](v1);
  swift_unknownObjectRelease();
  if (!v2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 280));
    v3 = sub_220D98C8C();
    v4 = sub_220D99478();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_220D57000, v3, v4, "PASUITargetViewPresenter delegate is nil in flowDidComplete", v5, 2u);
      MEMORY[0x2276657E4](v5, -1, -1);
    }
    v6 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
    v7 = *(_QWORD *)(v0 + 296);
    v8 = *(_QWORD *)(v0 + 280);

    v6(v7, v8);
  }
  v9 = (void *)MEMORY[0x227665880](v1);
  if (v9)
  {
    objc_msgSend(v9, sel_proximitySetupCompletedWithResult_, *(_QWORD *)(v0 + 360));
    swift_unknownObjectRelease();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D650BC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 296) = a1;
  return swift_task_switch();
}

uint64_t sub_220D650D4()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AD58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220D9AFB0;
  *(_QWORD *)(inited + 32) = 0xD00000000000001ALL;
  *(_QWORD *)(inited + 40) = 0x8000000220D9ECB0;
  v2 = sub_220D98B00();
  if (v2 >= 3)
  {
    *(_QWORD *)(v0 + 280) = v2;
    return sub_220D99610();
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 296);
    sub_220D993AC();
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x24BEE0D00];
    v5 = MEMORY[0x24BE7BA08];
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 80) = v5;
    *(_QWORD *)(inited + 48) = 0;
    *(_QWORD *)(inited + 56) = 0xE000000000000000;
    sub_220D72410(inited);
    sub_220D5CFD4(v3 + *MEMORY[0x24BE7B778], v0 + 104, &qword_25564ACA0);
    if ((*(_BYTE *)(v0 + 152) & 1) != 0)
    {
      v6 = *(void **)(v0 + 104);
      swift_getErrorValue();
      v7 = sub_220D99634();
      v9 = v8;
      *(_QWORD *)(v0 + 224) = v4;
      *(_QWORD *)(v0 + 232) = v5;

      *(_QWORD *)(v0 + 200) = v7;
      *(_QWORD *)(v0 + 208) = v9;
    }
    else
    {
      sub_220D5D018(v0 + 104, &qword_25564ACA0);
      *(_OWORD *)(v0 + 200) = 0u;
      *(_OWORD *)(v0 + 216) = 0u;
      *(_QWORD *)(v0 + 232) = 0;
    }
    *(_QWORD *)(v0 + 264) = 0xD00000000000001ALL;
    *(_QWORD *)(v0 + 272) = 0x8000000220D9EE20;
    *(_QWORD *)(v0 + 184) = v4;
    *(_QWORD *)(v0 + 192) = v5;
    *(_QWORD *)(v0 + 160) = 0;
    *(_QWORD *)(v0 + 168) = 0xE000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564ADE8);
    v11 = sub_220D9931C();
    swift_bridgeObjectRelease();
    sub_220D5D018(v0 + 160, &qword_25564ADF0);
    sub_220D5D018(v0 + 200, &qword_25564ADF0);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
  }
}

uint64_t sub_220D65324(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_220D6537C;
  return v5();
}

uint64_t sub_220D6537C(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v5;

  v3 = *(_QWORD **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();
  *v3 = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t PASUITargetViewPresenter.stepDidRequestCancel(_:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  sub_220D99418();
  *(_QWORD *)(v1 + 24) = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D65440()
{
  uint64_t v0;

  swift_release();
  _s23ProximityAppleIDSetupUI24PASUITargetViewPresenterC12handleCancelyyF_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D6547C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D654C8;
  return PASUITargetViewPresenter.performAIDASignIn(with:)(a1);
}

uint64_t sub_220D654C8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_220D65518(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D673B8;
  return PASUITargetViewPresenter.proximitySetupSelectedAccountType(_:)(a1);
}

uint64_t sub_220D65564()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_220D673B8;
  return PASUITargetViewPresenter.setupPasscodeAndBiometric()();
}

uint64_t sub_220D655A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D5CCCC;
  return PASUITargetViewPresenter.flowDidComplete(with:)(a1);
}

uint64_t sub_220D655F8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  sub_220D99418();
  *(_QWORD *)(v1 + 24) = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D65664()
{
  uint64_t v0;

  swift_release();
  _s23ProximityAppleIDSetupUI24PASUITargetViewPresenterC19stepDidRequestResetyy0abC011PASFlowStep_pF_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D65698()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  sub_220D99418();
  *(_QWORD *)(v1 + 24) = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

unint64_t sub_220D65708(uint64_t a1, char a2)
{
  unint64_t v2;
  unint64_t v3;

  v2 = 0xD000000000000024;
  v3 = 0xD000000000000033;
  if (a1 == 1)
    v3 = 0xD000000000000024;
  if (a1)
    v2 = v3;
  if ((a2 & 1) != 0)
    return v2;
  else
    return 0xD00000000000002ALL;
}

uint64_t sub_220D65780(unint64_t a1, char a2)
{
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if ((a2 & 1) != 0)
    return sub_220D72410(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AD58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220D9AFB0;
  *(_QWORD *)(inited + 32) = 0xD00000000000001ALL;
  *(_QWORD *)(inited + 40) = 0x8000000220D9ECB0;
  if (a1 >= 3)
  {
    result = sub_220D99610();
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)&aDependenperson[8 * a1];
    v5 = *(_QWORD *)&aT[8 * a1];
    v6 = MEMORY[0x24BE7BA08];
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 80) = v6;
    *(_QWORD *)(inited + 48) = v4;
    *(_QWORD *)(inited + 56) = v5;
    return sub_220D72410(inited);
  }
  return result;
}

unint64_t sub_220D65860()
{
  uint64_t v0;

  return sub_220D65708(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

uint64_t sub_220D6586C()
{
  uint64_t v0;

  return sub_220D65780(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

uint64_t sub_220D65878(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_220D658AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_220D658CC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_220D6593C(v6, v7, a3);
  v8 = *a1 + 8;
  sub_220D99508();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_220D6593C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_220D65A0C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_220D67330((uint64_t)v12, *a3);
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
      sub_220D67330((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_220D65A0C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_220D99514();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_220D65BC4(a5, a6);
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
  v8 = sub_220D9958C();
  if (!v8)
  {
    sub_220D99598();
    __break(1u);
LABEL_17:
    result = sub_220D995C8();
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

uint64_t sub_220D65BC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_220D65C58(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_220D65E30(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_220D65E30(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_220D65C58(uint64_t a1, unint64_t a2)
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
      v3 = sub_220D65DCC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_220D99568();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_220D99598();
      __break(1u);
LABEL_10:
      v2 = sub_220D993B8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_220D995C8();
    __break(1u);
LABEL_14:
    result = sub_220D99598();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_220D65DCC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AE00);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_220D65E30(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AE00);
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
  result = sub_220D995C8();
  __break(1u);
  return result;
}

_BYTE **sub_220D65F7C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_220D65F8C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_220D995C8();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_220D66020(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  _BYTE v8[40];
  _QWORD v9[5];

  v9[3] = type metadata accessor for PASViewControllerPresentationHandler();
  v9[4] = &off_24E6A1548;
  v9[0] = a1;
  sub_220D66810((uint64_t)v9, (uint64_t)v8);
  v4 = a2 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  swift_retain();
  sub_220D66854((uint64_t)v8, v4);
  swift_endAccess();
  v5 = *(_QWORD *)(a2 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 88))(ObjectType, v5);
  (*(void (**)(void))(v5 + 80))();
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

uint64_t sub_220D660FC(uint64_t a1, uint64_t a2)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  _BYTE v9[40];
  uint64_t v10[5];

  v10[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_25564ADE0);
  v10[4] = (uint64_t)&protocol witness table for <A> Binding<A>;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  sub_220D5CFD4(a1, (uint64_t)boxed_opaque_existential_1, &qword_25564ADE0);
  sub_220D66810((uint64_t)v10, (uint64_t)v9);
  v5 = a2 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  sub_220D66854((uint64_t)v9, v5);
  swift_endAccess();
  v6 = *(_QWORD *)(a2 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v6 + 88))(ObjectType, v6);
  (*(void (**)(void))(v6 + 80))();
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t sub_220D661EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  _BYTE v12[40];
  uint64_t v13[5];

  v13[3] = a3;
  v13[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  sub_220D66810((uint64_t)v13, (uint64_t)v12);
  v8 = a2 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  sub_220D66854((uint64_t)v12, v8);
  swift_endAccess();
  v9 = *(_QWORD *)(a2 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v9 + 88))(ObjectType, v9);
  (*(void (**)(void))(v9 + 80))();
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_220D662CC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_220D66334;
  return v5(v2 + 32);
}

uint64_t sub_220D66334()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t _s23ProximityAppleIDSetupUI29PASUITargetViewPresenterErrorO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_220D995E0();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

id sub_220D663CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void (*v24)(char *, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  id v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  objc_class *ObjectType;
  uint64_t v40;
  objc_super v41;
  _QWORD v42[4];

  v37 = a3;
  v38 = a2;
  v40 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v35 - v9;
  swift_unknownObjectWeakInit();
  v11 = (uint64_t)&v3[OBJC_IVAR___PASUIDependentViewPresenter_navigationController];
  *(_OWORD *)v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  *(_QWORD *)(v11 + 32) = 0;
  *(_QWORD *)&v3[OBJC_IVAR___PASUIDependentViewPresenter_flowTimer] = 0;
  v12 = OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8E8);
  swift_allocObject();
  *(_QWORD *)&v3[v12] = sub_220D988B4();
  v13 = OBJC_IVAR___PASUIDependentViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F0);
  swift_allocObject();
  *(_QWORD *)&v3[v13] = sub_220D988B4();
  v14 = OBJC_IVAR___PASUIDependentViewPresenter__deviceProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  *(_QWORD *)&v3[v14] = sub_220D988B4();
  v15 = OBJC_IVAR___PASUIDependentViewPresenter__targetAppleIDExchanger;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A900);
  swift_allocObject();
  *(_QWORD *)&v3[v15] = sub_220D988B4();
  v16 = OBJC_IVAR___PASUIDependentViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A908);
  swift_allocObject();
  *(_QWORD *)&v3[v16] = sub_220D988B4();
  *(_QWORD *)&v3[OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics] = 0;
  v17 = OBJC_IVAR___PASUIDependentViewPresenter__featureFlagsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A910);
  swift_allocObject();
  *(_QWORD *)&v3[v17] = sub_220D988B4();
  v36 = v3;
  v18 = sub_220D98C80();
  v19 = v5;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v20(v10, v18, v4);
  v21 = sub_220D98C8C();
  v22 = sub_220D99484();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_220D57000, v21, v22, "PAS=== Welcome to ProximityAppleIDSetup - Target ===PAS", v23, 2u);
    MEMORY[0x2276657E4](v23, -1, -1);
  }

  v24 = *(void (**)(char *, uint64_t))(v19 + 8);
  v24(v10, v4);
  v20(v8, v18, v4);
  v25 = sub_220D98C8C();
  v26 = sub_220D99484();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_220D57000, v25, v26, "PASUITargetViewPresenter init with nav and flow controller", v27, 2u);
    MEMORY[0x2276657E4](v27, -1, -1);
  }

  v24(v8, v4);
  sub_220D988E4();
  swift_retain();
  sub_220D988D8();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(_QWORD *)(swift_allocObject() + 16) = 0;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC10);
  v42[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC18);
  v42[0] = v28;
  swift_retain();
  sub_220D988F0();
  swift_release();
  sub_220D5D018((uint64_t)v42, &qword_25564AC20);
  swift_release();
  swift_beginAccess();
  v29 = v40;
  sub_220D67370(v40, v11);
  swift_endAccess();
  v31 = v36;
  v30 = v37;
  v32 = &v36[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  *(_QWORD *)v32 = v38;
  *((_QWORD *)v32 + 1) = v30;
  swift_unknownObjectRetain();

  v41.receiver = v31;
  v41.super_class = ObjectType;
  v33 = objc_msgSendSuper2(&v41, sel_init);
  sub_220D5D018(v29, &qword_25564AC28);
  return v33;
}

uint64_t sub_220D66810(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_220D66854(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_220D668C0()
{
  unint64_t result;

  result = qword_25564AC38;
  if (!qword_25564AC38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_25564AC38);
  }
  return result;
}

uint64_t sub_220D668FC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_220D66930(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_220D5DA1C;
  return sub_220D64498(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_220D669B0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_220D669D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D654C8;
  v3[37] = v2;
  return swift_task_switch();
}

uint64_t sub_220D66A34()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D66A58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_220D5CCCC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25564ACB8 + dword_25564ACB8))(a1, v4);
}

unint64_t sub_220D66ACC()
{
  unint64_t result;

  result = qword_25564ACD0;
  if (!qword_25564ACD0)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUITargetViewPresenterError, &type metadata for PASUITargetViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564ACD0);
  }
  return result;
}

unint64_t sub_220D66B10(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_220D66B44();
  a1[2] = sub_220D66B88();
  result = sub_220D66BCC();
  a1[3] = result;
  return result;
}

unint64_t sub_220D66B44()
{
  unint64_t result;

  result = qword_25564ACD8;
  if (!qword_25564ACD8)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUITargetViewPresenterError, &type metadata for PASUITargetViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564ACD8);
  }
  return result;
}

unint64_t sub_220D66B88()
{
  unint64_t result;

  result = qword_25564ACE0;
  if (!qword_25564ACE0)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUITargetViewPresenterError, &type metadata for PASUITargetViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564ACE0);
  }
  return result;
}

unint64_t sub_220D66BCC()
{
  unint64_t result;

  result = qword_25564ACE8;
  if (!qword_25564ACE8)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUITargetViewPresenterError, &type metadata for PASUITargetViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564ACE8);
  }
  return result;
}

unint64_t sub_220D66C14()
{
  unint64_t result;

  result = qword_25564ACF0;
  if (!qword_25564ACF0)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUITargetViewPresenterError, &type metadata for PASUITargetViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564ACF0);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PASUITargetViewPresenterError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUITargetViewPresenterError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_220D66D40 + 4 * byte_220D9ACF9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_220D66D74 + 4 * byte_220D9ACF4[v4]))();
}

uint64_t sub_220D66D74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_220D66D7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x220D66D84);
  return result;
}

uint64_t sub_220D66D90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x220D66D98);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_220D66D9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_220D66DA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_220D66DB0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_220D66DBC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PASUITargetViewPresenterError()
{
  return &type metadata for PASUITargetViewPresenterError;
}

uint64_t type metadata accessor for PASUITargetViewPresenter()
{
  return objc_opt_self();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PASUITargetViewPresenter.AnalyticsEvent(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PASUITargetViewPresenter.AnalyticsEvent(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_220D66E58(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_220D66E74(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUITargetViewPresenter.AnalyticsEvent()
{
  return &type metadata for PASUITargetViewPresenter.AnalyticsEvent;
}

uint64_t sub_220D66EA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25564AD60 + dword_25564AD60))(a1, v4);
}

uint64_t sub_220D66F18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25564AD78 + dword_25564AD78))(v2, v3, v4);
}

uint64_t sub_220D66F88()
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
  v5[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_25564C4E0 + dword_25564C4E0))(v2, v3, v4);
}

uint64_t sub_220D67004(uint64_t a1)
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
  v7[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_25564C4E8 + dword_25564C4E8))(a1, v4, v5, v6);
}

uint64_t sub_220D6708C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25564AD90 + dword_25564AD90))(v2, v3, v4);
}

uint64_t objectdestroy_26Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_220D67138()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25564ADB0 + dword_25564ADB0))(v2, v3, v4);
}

uint64_t objectdestroy_30Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D671D8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_220D671FC()
{
  unint64_t result;

  result = qword_25564ADD0;
  if (!qword_25564ADD0)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUITargetViewPresenterError, &type metadata for PASUITargetViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564ADD0);
  }
  return result;
}

unint64_t sub_220D67240()
{
  unint64_t result;

  result = qword_25564ADD8;
  if (!qword_25564ADD8)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUITargetViewPresenterError, &type metadata for PASUITargetViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564ADD8);
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

uint64_t sub_220D672C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25564CB10 + dword_25564CB10))(a1, v4);
}

uint64_t sub_220D67330(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_220D67370(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_220D673C8(void *a1, void *a2)
{
  void *v2;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  objc_msgSend(v2, sel_addChildViewController_, a1);
  v5 = objc_msgSend(a1, sel_view);
  if (!v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(a2, sel_addSubview_, v5);

  objc_msgSend(a1, sel_didMoveToParentViewController_, v2);
  v7 = objc_msgSend(a1, sel_view);
  if (!v7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v8 = v7;
  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_25564D460);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_220D9AFC0;
  v10 = objc_msgSend(a1, sel_view);
  if (!v10)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, sel_topAnchor);

  v13 = objc_msgSend(a2, sel_safeAreaLayoutGuide);
  v14 = objc_msgSend(v13, sel_topAnchor);

  v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);
  *(_QWORD *)(v9 + 32) = v15;
  v16 = objc_msgSend(a1, sel_view);
  if (!v16)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v17 = v16;
  v18 = objc_msgSend(v16, sel_bottomAnchor);

  v19 = objc_msgSend(a2, sel_safeAreaLayoutGuide);
  v20 = objc_msgSend(v19, sel_bottomAnchor);

  v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(_QWORD *)(v9 + 40) = v21;
  v22 = objc_msgSend(a1, sel_view);
  if (!v22)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v23 = v22;
  v24 = objc_msgSend(v22, sel_leadingAnchor);

  v25 = objc_msgSend(a2, sel_safeAreaLayoutGuide);
  v26 = objc_msgSend(v25, sel_leadingAnchor);

  v27 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v26);
  *(_QWORD *)(v9 + 48) = v27;
  v28 = objc_msgSend(a1, sel_view);
  if (v28)
  {
    v29 = v28;
    v30 = (void *)objc_opt_self();
    v31 = objc_msgSend(v29, sel_trailingAnchor);

    v32 = objc_msgSend(a2, sel_safeAreaLayoutGuide);
    v33 = objc_msgSend(v32, sel_trailingAnchor);

    v34 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v33);
    *(_QWORD *)(v9 + 56) = v34;
    sub_220D993E8();
    sub_220D67784();
    v35 = (id)sub_220D993C4();
    swift_bridgeObjectRelease();
    objc_msgSend(v30, sel_activateConstraints_, v35);

    return;
  }
LABEL_13:
  __break(1u);
}

unint64_t sub_220D67784()
{
  unint64_t result;

  result = qword_25564AE08;
  if (!qword_25564AE08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25564AE08);
  }
  return result;
}

uint64_t sub_220D677C0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);

  v2[5] = a1;
  v2[6] = a2;
  result = swift_bridgeObjectRelease();
  if (v2[2])
  {
    v4 = v2[3];
    ObjectType = swift_getObjectType();
    v7 = v2[5];
    v6 = v2[6];
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v8(v7, v6, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_220D67858(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);

  v2[7] = a1;
  v2[8] = a2;
  result = swift_bridgeObjectRelease();
  if (v2[2])
  {
    v4 = v2[3];
    ObjectType = swift_getObjectType();
    v7 = v2[7];
    v6 = v2[8];
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 40);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v8(v7, v6, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_220D678F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(id *__return_ptr, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t ObjectType;
  void (*v26)(id *__return_ptr, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;

  v5 = v4;
  v46 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AEE0);
  v42 = *(_QWORD *)(v14 - 8);
  v43 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AEE8);
  v44 = *(_QWORD *)(v17 - 8);
  v45 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  v48 = a1;
  v49 = a2;
  v47 = a4;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_220D995B0())
    v20 = sub_220D69690(MEMORY[0x24BEE4AF8]);
  else
    v20 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v5 + 32) = v20;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  v21 = sub_220D988B4();
  *(_QWORD *)(v5 + 72) = v21;
  v22 = *(void (**)(id *__return_ptr, uint64_t))(*(_QWORD *)v21 + 128);
  v23 = swift_retain();
  v22(&v50, v23);
  swift_release();
  v24 = v51;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v24 + 56))(ObjectType, v24);
  swift_unknownObjectRelease();
  v26 = *(void (**)(id *__return_ptr, uint64_t))(**(_QWORD **)(v5 + 72) + 128);
  v27 = swift_retain();
  v26(&v50, v27);
  swift_release();
  v28 = v51;
  v29 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v28 + 40))(v29, v28);
  swift_unknownObjectRelease();
  sub_220D6839C(&qword_25564AEF0, &qword_25564AED8, MEMORY[0x24BDB9EE8]);
  sub_220D98CA4();
  sub_220D68258();
  v50 = (id)sub_220D994B4();
  v30 = sub_220D9949C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v11, 1, 1, v30);
  sub_220D6839C(&qword_25564AEF8, &qword_25564AEE0, MEMORY[0x24BDB9450]);
  sub_220D68294();
  v31 = v43;
  sub_220D98D10();
  sub_220D5D018((uint64_t)v11, &qword_25564AED0);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v31);
  v32 = swift_allocObject();
  swift_weakInit();
  v33 = (_QWORD *)swift_allocObject();
  v35 = v48;
  v34 = v49;
  v33[2] = v48;
  v33[3] = v34;
  v37 = v46;
  v36 = v47;
  v33[4] = v32;
  v33[5] = v37;
  v33[6] = v36;
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = sub_220D68344;
  *(_QWORD *)(v38 + 24) = v33;
  sub_220D5CD60(v35);
  sub_220D5CD60(v37);
  sub_220D6839C(&qword_25564AF08, &qword_25564AEE8, MEMORY[0x24BDB9A08]);
  v39 = v45;
  sub_220D98D1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v39);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  sub_220D5CDB4(v37);
  sub_220D5CDB4(v35);
  swift_release();
  return v5;
}

uint64_t sub_220D67D70(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD *__return_ptr, uint64_t, uint64_t);
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
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t ObjectType;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  _QWORD v59[3];
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[3];
  uint64_t v63;
  uint64_t v64;

  v7 = result;
  if (a3)
  {
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      v9 = (_QWORD *)result;
      v57 = v7;
      sub_220D683DC(v7, (uint64_t)v62);
      v10 = v63;
      if (v63)
      {
        v11 = v64;
        __swift_project_boxed_opaque_existential_1(v62, v63);
        v12 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v11 + 8);
        swift_retain();
        v12(v59, v10, v11);
        v13 = v60;
        v14 = v61;
        __swift_project_boxed_opaque_existential_1(v59, v60);
        v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
        v16 = v15;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
      }
      else
      {
        swift_retain();
        sub_220D5D018((uint64_t)v62, (uint64_t *)&unk_25564AF10);
        v16 = 0;
      }
      sub_220D683DC(a2, (uint64_t)v62);
      v17 = v63;
      if (v63)
      {
        v18 = v64;
        __swift_project_boxed_opaque_existential_1(v62, v63);
        (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v18 + 8))(v59, v17, v18);
        v19 = v60;
        v20 = v61;
        __swift_project_boxed_opaque_existential_1(v59, v60);
        v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
        v17 = v22;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
      }
      else
      {
        sub_220D5D018((uint64_t)v62, (uint64_t *)&unk_25564AF10);
        v21 = 0;
      }
      v23 = a3(v10, v16, v21, v17);
      v25 = v24;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v25)
        v26 = v23;
      else
        v26 = 0;
      v27 = 0xE000000000000000;
      if (v25)
        v27 = v25;
      v9[5] = v26;
      v9[6] = v27;
      swift_bridgeObjectRelease();
      if (v9[2])
      {
        v28 = v9[3];
        ObjectType = swift_getObjectType();
        v30 = v9[5];
        v31 = v9[6];
        v32 = a2;
        v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 16);
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        v33(v30, v31, ObjectType, v28);
        a2 = v32;
        swift_unknownObjectRelease();
      }
      sub_220D5CDB4((uint64_t)a3);
      result = swift_release();
      v7 = v57;
    }
  }
  if (a6)
  {
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      v34 = (_QWORD *)result;
      v35 = a2;
      sub_220D683DC(v7, (uint64_t)v62);
      v36 = v63;
      if (v63)
      {
        v37 = v64;
        __swift_project_boxed_opaque_existential_1(v62, v63);
        v38 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v37 + 8);
        swift_retain();
        v38(v59, v36, v37);
        v39 = v60;
        v40 = v61;
        __swift_project_boxed_opaque_existential_1(v59, v60);
        v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8))(v39, v40);
        v42 = v41;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
      }
      else
      {
        swift_retain();
        sub_220D5D018((uint64_t)v62, (uint64_t *)&unk_25564AF10);
        v42 = 0;
      }
      sub_220D683DC(v35, (uint64_t)v62);
      v43 = v63;
      if (v63)
      {
        v44 = v64;
        __swift_project_boxed_opaque_existential_1(v62, v63);
        (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v44 + 8))(v59, v43, v44);
        v45 = v60;
        v46 = v61;
        __swift_project_boxed_opaque_existential_1(v59, v60);
        v47 = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 8))(v45, v46);
        v43 = v48;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
      }
      else
      {
        sub_220D5D018((uint64_t)v62, (uint64_t *)&unk_25564AF10);
        v47 = 0;
      }
      v49 = a6(v36, v42, v47, v43);
      v51 = v50;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v34[7] = v49;
      v34[8] = v51;
      swift_bridgeObjectRelease();
      if (v34[2])
      {
        v52 = v34[3];
        v53 = swift_getObjectType();
        v54 = v34[7];
        v55 = v34[8];
        v56 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 40);
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        v56(v54, v55, v53, v52);
        swift_unknownObjectRelease();
      }
      sub_220D5CDB4((uint64_t)a6);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_220D681EC()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PASUIDeviceStringController()
{
  return objc_opt_self();
}

unint64_t sub_220D68258()
{
  unint64_t result;

  result = qword_25564C900;
  if (!qword_25564C900)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25564C900);
  }
  return result;
}

unint64_t sub_220D68294()
{
  unint64_t result;
  unint64_t v1;

  result = qword_25564AF00;
  if (!qword_25564AF00)
  {
    v1 = sub_220D68258();
    result = MEMORY[0x227665754](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_25564AF00);
  }
  return result;
}

uint64_t sub_220D682DC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D68300()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 40))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D68344(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_220D67D70(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 40));
}

uint64_t sub_220D68354()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D68378(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(a1, a1 + 40);
}

uint64_t sub_220D6839C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x227665754](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_220D683DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564AF10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220D68424(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);

  v2[2] = a1;
  v2[3] = a2;
  swift_unknownObjectRetain();
  result = swift_unknownObjectRelease();
  if (v2[2])
  {
    v4 = v2[3];
    ObjectType = swift_getObjectType();
    v6 = v2[5];
    v7 = v2[6];
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v8(v6, v7, ObjectType, v4);
    result = swift_unknownObjectRelease();
    if (v2[2])
    {
      v9 = v2[3];
      v10 = swift_getObjectType();
      v12 = v2[7];
      v11 = v2[8];
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 40);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      v13(v12, v11, v10, v9);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

id sub_220D68518(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedDevice] = 0;
  v4 = &v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedTermsRemoteUI];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo;
  v8 = v1;
  *(_QWORD *)&v1[v7] = sub_220D722D0(MEMORY[0x24BEE4AF8]);
  v8[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_didAccept] = 0;
  v9 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler__viewControllerProvider;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B120);
  swift_allocObject();
  *(_QWORD *)&v8[v9] = sub_220D988B4();
  *(_QWORD *)&v8[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_authResults] = a1;

  v11.receiver = v8;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_220D68610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[16] = a7;
  v8[17] = v7;
  v8[14] = a5;
  v8[15] = a6;
  v8[12] = a3;
  v8[13] = a4;
  v8[10] = a1;
  v8[11] = a2;
  return swift_task_switch();
}

uint64_t sub_220D68634()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t inited;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v20;
  id v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = (void *)v0[12];
  v20 = v0[11];
  v2 = (void *)v0[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AFF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220D9B070;
  v4 = (void *)*MEMORY[0x24BE048D8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BE048D8];
  v5 = (void *)*MEMORY[0x24BE048C0];
  v6 = (void *)*MEMORY[0x24BE048D0];
  *(_QWORD *)(inited + 40) = *MEMORY[0x24BE048C0];
  *(_QWORD *)(inited + 48) = v6;
  v7 = (void *)*MEMORY[0x24BE048C8];
  *(_QWORD *)(inited + 56) = *MEMORY[0x24BE048C8];
  swift_bridgeObjectRetain();
  v21 = v2;
  v8 = v1;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  sub_220D69924(inited);
  swift_setDeallocating();
  type metadata accessor for AATermsEntry(0);
  swift_arrayDestroy();
  v13 = objc_allocWithZone(MEMORY[0x24BE04D58]);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B0C0);
  v14 = (void *)sub_220D992F8();
  swift_bridgeObjectRelease();
  sub_220D5D7F4(&qword_25564AA20, (uint64_t (*)(uint64_t))type metadata accessor for AATermsEntry, (uint64_t)&unk_220D9AAD8);
  v15 = (void *)sub_220D99448();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v13, sel_initWithAuthResults_proxiedDevice_anisetteDataProvider_appProvidedContext_termsEntries_, v14, v21, v20, v8, v15);
  v0[18] = v16;

  swift_unknownObjectRelease();
  v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_25564B0D0
                                                                                              + dword_25564B0D0);
  v17 = v16;
  v18 = (_QWORD *)swift_task_alloc();
  v0[19] = v18;
  *v18 = v0;
  v18[1] = sub_220D68880;
  return v22(v0[10], (uint64_t)v17, v0[13], v0[14], v0[15], v0[16], v0[17]);
}

uint64_t sub_220D68880()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 144);
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_220D688D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D68908(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t result;
  uint64_t v14;

  v2 = v1;
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo;
  if (*(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo)
                 + 16))
  {
    v9 = sub_220D98C80();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
    v10 = sub_220D98C8C();
    v11 = sub_220D9946C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_220D57000, v10, v11, "PASUIProxiedTermsHandler setAcceptedTermsInfo is not empty", v12, 2u);
      MEMORY[0x2276657E4](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *(_QWORD *)(v2 + v8) = a1;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_didAccept) == 1)
    return sub_220D68A60();
  return result;
}

uint64_t sub_220D68A60()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  const char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v2);
  v42 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v41 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v39 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v39 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v39 - v13;
  v15 = sub_220D98C80();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v14, v15, v4);
  v17 = sub_220D98C8C();
  v18 = sub_220D99460();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_220D57000, v17, v18, "PASUIProxiedTermsHandler handleAccept", v19, 2u);
    MEMORY[0x2276657E4](v19, -1, -1);
  }

  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v14, v4);
  v21 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_didAccept;
  if (v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_didAccept] == 1)
  {
    v16(v12, v15, v4);
    v22 = sub_220D98C8C();
    v23 = sub_220D9946C();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_220D57000, v22, v23, "PASUIProxiedTermsHandler handleAccept entered multiple times", v24, 2u);
      MEMORY[0x2276657E4](v24, -1, -1);
    }

    v20(v12, v4);
  }
  v1[v21] = 1;
  if (*(_QWORD *)(*(_QWORD *)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo]
                 + 16))
  {
    v25 = *(_QWORD *)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction];
    if (v25)
    {
      v26 = *(_QWORD *)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction + 8];
      v27 = sub_220D9943C();
      v28 = (uint64_t)v42;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v42, 1, 1, v27);
      sub_220D99418();
      sub_220D5CD60(v25);
      sub_220D5CD60(v25);
      v29 = v1;
      v30 = sub_220D9940C();
      v31 = (_QWORD *)swift_allocObject();
      v32 = MEMORY[0x24BEE6930];
      v31[2] = v30;
      v31[3] = v32;
      v31[4] = v25;
      v31[5] = v26;
      v31[6] = v29;
      sub_220D5F9A8(v28, (uint64_t)&unk_25564B0F0, (uint64_t)v31);
      sub_220D5CDB4(v25);
      return swift_release();
    }
    v34 = v40;
    v16(v40, v15, v4);
    v35 = sub_220D98C8C();
    v36 = sub_220D9946C();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      v38 = "PASUIProxiedTermsHandler handleAccept acceptAction is nil";
      goto LABEL_14;
    }
  }
  else
  {
    v34 = v41;
    v16(v41, v15, v4);
    v35 = sub_220D98C8C();
    v36 = sub_220D9946C();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      v38 = "PASUIProxiedTermsHandler handleAccept acceptedTermsInfo isEmpty";
LABEL_14:
      _os_log_impl(&dword_220D57000, v35, v36, v38, v37, 2u);
      MEMORY[0x2276657E4](v37, -1, -1);
    }
  }

  return ((uint64_t (*)(char *, uint64_t))v20)(v34, v4);
}

uint64_t sub_220D68E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_220D99418();
  v6[5] = sub_220D9940C();
  v6[6] = sub_220D993F4();
  v6[7] = v7;
  return swift_task_switch();
}

uint64_t sub_220D68EF4()
{
  _QWORD *v0;
  int *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v1 = (int *)v0[2];
  v2 = *(_QWORD *)(v0[4] + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo);
  v0[8] = v2;
  v5 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  swift_bridgeObjectRetain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[9] = v3;
  *v3 = v0;
  v3[1] = sub_220D68F78;
  return v5(v2);
}

uint64_t sub_220D68F78()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_220D68FCC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D68FFC()
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
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  char *v18;
  uint64_t v19;
  char *v20;
  uint8_t *v21;
  uint8_t *v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_220D98C98();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v35 - v10;
  v12 = sub_220D98C80();
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v13(v11, v12, v5);
  v14 = sub_220D98C8C();
  v15 = sub_220D99460();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v36 = v12;
    v17 = v13;
    v18 = v9;
    v19 = v1;
    v20 = v4;
    v21 = v16;
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_220D57000, v14, v15, "PASUIProxiedTermsHandler handleDecline", v16, 2u);
    v22 = v21;
    v4 = v20;
    v1 = v19;
    v9 = v18;
    v13 = v17;
    v12 = v36;
    MEMORY[0x2276657E4](v22, -1, -1);
  }

  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v11, v5);
  v24 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction;
  v25 = *(_QWORD *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction);
  if (v25)
  {
    v26 = *(_QWORD *)(v24 + 8);
    v27 = sub_220D9943C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v4, 1, 1, v27);
    sub_220D99418();
    swift_retain_n();
    v28 = sub_220D9940C();
    v29 = (_QWORD *)swift_allocObject();
    v30 = MEMORY[0x24BEE6930];
    v29[2] = v28;
    v29[3] = v30;
    v29[4] = v25;
    v29[5] = v26;
    sub_220D5F9A8((uint64_t)v4, (uint64_t)&unk_25564B100, (uint64_t)v29);
    sub_220D5CDB4(v25);
    return swift_release();
  }
  else
  {
    v13(v9, v12, v5);
    v32 = sub_220D98C8C();
    v33 = sub_220D9946C();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_220D57000, v32, v33, "PASUIProxiedTermsHandler handleDecline declineAction is nil", v34, 2u);
      MEMORY[0x2276657E4](v34, -1, -1);
    }

    return ((uint64_t (*)(char *, uint64_t))v23)(v9, v5);
  }
}

uint64_t sub_220D692C8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v4[2] = sub_220D99418();
  v4[3] = sub_220D9940C();
  v8 = (uint64_t (*)(void))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  v4[4] = v6;
  *v6 = v4;
  v6[1] = sub_220D69344;
  return v8();
}

uint64_t sub_220D69344()
{
  swift_task_dealloc();
  sub_220D993F4();
  return swift_task_switch();
}

id sub_220D693E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PASUIProxiedTermsHandler()
{
  return objc_opt_self();
}

uint64_t sub_220D694C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_getObjectType();
  result = sub_220D98CC8();
  *a1 = result;
  return result;
}

uint64_t sub_220D69500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v16;
  _QWORD *v17;

  v16 = *v7;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v17;
  *v17 = v8;
  v17[1] = sub_220D5CCCC;
  v17[16] = a7;
  v17[17] = v16;
  v17[14] = a5;
  v17[15] = a6;
  v17[12] = a3;
  v17[13] = a4;
  v17[10] = a1;
  v17[11] = a2;
  return swift_task_switch();
}

uint64_t sub_220D69684()
{
  return MEMORY[0x24BDB9D70];
}

unint64_t sub_220D69690(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t (*v8)(uint64_t);
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v1 = result;
  v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_220D995B0();
    result = swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564B108);
      result = sub_220D99550();
      v3 = result;
      v19 = v1;
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_220D995B0();
      result = swift_bridgeObjectRelease();
      if (!v4)
        return v3;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  v19 = v1;
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return v3;
LABEL_9:
  v6 = 0;
  v7 = v3 + 56;
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDB9B60];
  v18 = v4;
  while ((v19 & 0xC000000000000001) != 0)
  {
    result = MEMORY[0x227665148](v6, v19);
    v9 = __OFADD__(v6++, 1);
    if (v9)
      goto LABEL_26;
LABEL_18:
    v20 = result;
    sub_220D98CBC();
    sub_220D5D7F4(&qword_25564B110, v8, MEMORY[0x24BDB9B70]);
    result = sub_220D99328();
    v10 = -1 << *(_BYTE *)(v3 + 32);
    v11 = result & ~v10;
    v12 = v11 >> 6;
    v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
    v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      v15 = ~v10;
      sub_220D5D7F4(&qword_25564B118, v8, MEMORY[0x24BDB9B78]);
      do
      {
        result = sub_220D99334();
        if ((result & 1) != 0)
        {
          result = swift_release();
          v4 = v18;
          goto LABEL_11;
        }
        v11 = (v11 + 1) & v15;
        v12 = v11 >> 6;
        v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
        v14 = 1 << v11;
      }
      while ((v13 & (1 << v11)) != 0);
      v4 = v18;
    }
    *(_QWORD *)(v7 + 8 * v12) = v14 | v13;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v20;
    v16 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v16, 1);
    v17 = v16 + 1;
    if (v9)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v17;
LABEL_11:
    v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDB9B60];
    if (v6 == v4)
      return v3;
  }
  if (v6 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_28;
  result = swift_retain();
  v9 = __OFADD__(v6++, 1);
  if (!v9)
    goto LABEL_18;
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_220D69924(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0D8);
    v3 = sub_220D99550();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_220D99364();
      sub_220D99670();
      v7 = v6;
      sub_220D993A0();
      v8 = sub_220D99688();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_220D99364();
        v17 = v16;
        if (v15 == sub_220D99364() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_220D99604();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_220D99364();
          v24 = v23;
          if (v22 == sub_220D99364() && v24 == v25)
            goto LABEL_3;
          v27 = sub_220D99604();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_220D69B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[12] = a6;
  v7[13] = a7;
  v7[10] = a4;
  v7[11] = a5;
  v7[8] = a2;
  v7[9] = a3;
  v7[7] = a1;
  v8 = sub_220D98C98();
  v7[14] = v8;
  v7[15] = *(_QWORD *)(v8 - 8);
  v7[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_220D69BBC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;

  v2 = v0[15];
  v1 = v0[16];
  v3 = v0[14];
  v4 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_220D98C8C();
  v6 = sub_220D99484();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "PASUIProxiedTermsHandler loadProxiedTerms", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }
  v9 = v0[15];
  v8 = v0[16];
  v10 = v0[13];
  v11 = v0[14];
  v12 = v0[10];
  v24 = v0[11];
  v25 = v0[12];
  v13 = (void *)v0[8];
  v14 = v0[9];
  v15 = (void *)v0[7];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
  objc_msgSend(v13, sel_setDelegate_, v10);
  v16 = *(void **)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedDevice);
  *(_QWORD *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedDevice) = v15;

  v17 = (_QWORD *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction);
  v18 = *(_QWORD *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction);
  *v17 = v14;
  v17[1] = v12;
  v19 = v15;
  sub_220D5CDB4(v18);
  v20 = (_QWORD *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction);
  v21 = *(_QWORD *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction);
  *v20 = v24;
  v20[1] = v25;
  swift_retain();
  sub_220D5CDB4(v21);
  v22 = (_QWORD *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedTermsRemoteUI);
  *v22 = v13;
  v22[1] = &off_24E6A1348;
  swift_retain();
  swift_unknownObjectRelease();
  sub_220D99418();
  swift_unknownObjectRetain();
  v0[17] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D69DA8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(void **)(v0 + 64);
  swift_release();
  v3 = *(void (**)(uint64_t))(**(_QWORD **)(v1
                                                    + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler__viewControllerProvider)
                                      + 128);
  v4 = swift_retain();
  v3(v4);
  swift_release();
  v5 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v5);
  v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  objc_msgSend(v2, sel_presentFromViewController_modal_, v7, 1);

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D69E74()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_220D69EA8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_220D5DA1C;
  return sub_220D68E84(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_220D69F28()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D69F54(uint64_t a1)
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
  v7[1] = sub_220D5DA1C;
  return sub_220D692C8(a1, v4, v5, v6);
}

uint64_t PASFlowStepPasscodeBiometricsRequest.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  ValueMetadata *v15;
  unint64_t v16;
  uint64_t v17;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B130);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - v5;
  sub_220D5D7F4(&qword_25564B138, MEMORY[0x24BE7B9A8], MEMORY[0x24BE7B4D8]);
  swift_retain();
  v7 = sub_220D98E30();
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  v10 = sub_220D988B4();
  v15 = (ValueMetadata *)v7;
  v16 = v9;
  v17 = v10;
  v11 = sub_220D6A15C();
  sub_220D99178();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v15 = &type metadata for PASUIPasscodeBiometricsRequestView;
  v16 = v11;
  swift_getOpaqueTypeConformance2();
  v12 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

unint64_t sub_220D6A15C()
{
  unint64_t result;

  result = qword_25564B140;
  if (!qword_25564B140)
  {
    result = MEMORY[0x227665754](&unk_220D9B1E4, &type metadata for PASUIPasscodeBiometricsRequestView);
    atomic_store(result, &qword_25564B140);
  }
  return result;
}

void sub_220D6A1A0(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[40] = 1;
}

uint64_t sub_220D6A1B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  ValueMetadata *v15;
  unint64_t v16;
  uint64_t v17;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B130);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - v5;
  sub_220D5D7F4(&qword_25564B138, MEMORY[0x24BE7B9A8], MEMORY[0x24BE7B4D8]);
  swift_retain();
  v7 = sub_220D98E30();
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  v10 = sub_220D988B4();
  v15 = (ValueMetadata *)v7;
  v16 = v9;
  v17 = v10;
  v11 = sub_220D6A15C();
  sub_220D99178();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v15 = &type metadata for PASUIPasscodeBiometricsRequestView;
  v16 = v11;
  swift_getOpaqueTypeConformance2();
  v12 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

uint64_t destroy for PASUIPasscodeBiometricsRequestView()
{
  swift_release();
  return swift_release();
}

_QWORD *_s23ProximityAppleIDSetupUI34PASUIPasscodeBiometricsRequestViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PASUIPasscodeBiometricsRequestView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PASUIPasscodeBiometricsRequestView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIPasscodeBiometricsRequestView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PASUIPasscodeBiometricsRequestView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PASUIPasscodeBiometricsRequestView()
{
  return &type metadata for PASUIPasscodeBiometricsRequestView;
}

uint64_t sub_220D6A4EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D6A4FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = sub_220D98E00();
  MEMORY[0x24BDAC7A8](v25);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_220D9943C();
  v11 = *(_QWORD *)(v10 - 8);
  v23 = v10;
  v24 = v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = a3;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a1;
  v15[3] = a2;
  v15[4] = a3;
  swift_retain_n();
  v16 = swift_retain_n();
  v17 = sub_220D6A81C(v16);
  v19 = v18;
  swift_retain_n();
  sub_220D99424();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v9[*(int *)(v25 + 20)], v13, v10);
  *(_QWORD *)v9 = &unk_25564B150;
  *((_QWORD *)v9 + 1) = a2;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564A918);
  sub_220D5CD14((uint64_t)v9, a4 + *(int *)(v20 + 36));
  *(_QWORD *)a4 = sub_220D5CC08;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = sub_220D6A7D0;
  *(_QWORD *)(a4 + 32) = v14;
  *(_QWORD *)(a4 + 40) = sub_220D6A808;
  *(_QWORD *)(a4 + 48) = v15;
  *(_QWORD *)(a4 + 56) = 0;
  *(_QWORD *)(a4 + 64) = v17;
  *(_QWORD *)(a4 + 72) = v19;
  *(_BYTE *)(a4 + 80) = 1;
  *(_QWORD *)(a4 + 88) = MEMORY[0x24BEE4AF8];
  sub_220D5CD58();
  sub_220D5CD60((uint64_t)sub_220D6A7D0);
  sub_220D5CD60((uint64_t)sub_220D6A808);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_220D5CD70((uint64_t)v9);
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v23);
  sub_220D5CDAC();
  sub_220D5CDB4((uint64_t)sub_220D6A7D0);
  sub_220D5CDB4((uint64_t)sub_220D6A808);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D6A758()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_220D99418();
  v0[3] = sub_220D9940C();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_220D69344;
  return sub_220D98C2C();
}

uint64_t sub_220D6A7C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_220D6A4FC(*v1, v1[1], v1[2], a1);
}

uint64_t sub_220D6A7D0()
{
  uint64_t v0;

  return sub_220D6AA24(*(_QWORD *)(v0 + 32));
}

uint64_t objectdestroyTm_1()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D6A808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_220D6ACC8(a3, a4, v4[2], v4[3], v4[4]);
}

uint64_t sub_220D6A81C(uint64_t a1)
{
  void (*v1)(uint64_t *__return_ptr);
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;

  v1 = *(void (**)(uint64_t *__return_ptr))(*(_QWORD *)a1 + 128);
  v1(&v17);
  v2 = v18;
  ObjectType = swift_getObjectType();
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v2 + 8))(v21, ObjectType, v2);
  swift_unknownObjectRelease();
  v4 = v22;
  if (v22)
  {
    v5 = v23;
    __swift_project_boxed_opaque_existential_1(v21, v22);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
    v8 = v7;
    v9 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    if (v8)
      return v6;
  }
  else
  {
    v9 = sub_220D6A9E4((uint64_t)v21);
  }
  ((void (*)(uint64_t *__return_ptr, uint64_t))v1)(&v17, v9);
  v10 = v18;
  v11 = swift_getObjectType();
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v10 + 8))(v21, v11, v10);
  swift_unknownObjectRelease();
  v12 = v22;
  if (v22)
  {
    v13 = v23;
    __swift_project_boxed_opaque_existential_1(v21, v22);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v13 + 8))(&v17, v12, v13);
    v14 = v19;
    v15 = v20;
    __swift_project_boxed_opaque_existential_1(&v17, v19);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_220D6A9E4((uint64_t)v21);
    swift_bridgeObjectRelease();
    return 0;
  }
  return v6;
}

uint64_t sub_220D6A99C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_220D5CCCC;
  return sub_220D6A758();
}

uint64_t sub_220D6A9E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564AF10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_220D6AA24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD v21[2];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;

  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(__int128 *__return_ptr, uint64_t))(*(_QWORD *)a1 + 128))(&v22, v4);
  v7 = *((_QWORD *)&v22 + 1);
  ObjectType = swift_getObjectType();
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v7 + 8))(&v22, ObjectType, v7);
  swift_unknownObjectRelease();
  if (v23)
  {
    sub_220D6AFB0(&v22, (uint64_t)v25);
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    sub_220D9955C();
    swift_bridgeObjectRelease();
    v21[0] = 0x45444F4353534150;
    v21[1] = 0xE90000000000005FLL;
    v9 = v26;
    v10 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
    sub_220D993AC();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    v11 = v26;
    v12 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v12 + 8))(&v22, v11, v12);
    v13 = v23;
    v14 = v24;
    __swift_project_boxed_opaque_existential_1(&v22, v23);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
    sub_220D993AC();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    v15 = sub_220D99394();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  }
  else
  {
    sub_220D6A9E4((uint64_t)&v22);
    v16 = sub_220D98C80();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v16, v2);
    v17 = sub_220D98C8C();
    v18 = sub_220D9946C();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_220D57000, v17, v18, "PASUIPasscodeBiometricsRequestView title targetDevice is nil", v19, 2u);
      MEMORY[0x2276657E4](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return sub_220D99394();
  }
  return v15;
}

uint64_t sub_220D6ACC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v5)(_QWORD *__return_ptr, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(void (**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)a5 + 128);
  v6 = swift_bridgeObjectRetain();
  v5(v17, v6);
  v7 = v17[1];
  ObjectType = swift_getObjectType();
  (*(void (**)(unint64_t *__return_ptr, uint64_t, uint64_t))(v7 + 8))(&v18, ObjectType, v7);
  swift_unknownObjectRelease();
  v9 = v20;
  if (v20)
  {
    v10 = v21;
    __swift_project_boxed_opaque_existential_1(&v18, v20);
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
  }
  else
  {
    sub_220D6A9E4((uint64_t)&v18);
  }
  swift_retain();
  v11 = sub_220D98C38();
  v13 = v12;
  swift_release();
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_220D9955C();
  swift_bridgeObjectRelease();
  if (v13)
  {
    v18 = 0xD00000000000001BLL;
    v19 = 0x8000000220D9F290;
    sub_220D993AC();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    sub_220D993AC();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564B158);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_220D9AFB0;
    *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v14 + 64) = sub_220D6AF6C();
    *(_QWORD *)(v14 + 32) = v11;
    *(_QWORD *)(v14 + 40) = v13;
    v15 = sub_220D9937C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = 0xD00000000000001ELL;
    v19 = 0x8000000220D9F270;
    sub_220D993AC();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    sub_220D993AC();
    swift_bridgeObjectRelease();
    v15 = sub_220D99394();
  }
  swift_bridgeObjectRelease();
  return v15;
}

unint64_t sub_220D6AF6C()
{
  unint64_t result;

  result = qword_25564C6C0;
  if (!qword_25564C6C0)
  {
    result = MEMORY[0x227665754](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25564C6C0);
  }
  return result;
}

uint64_t sub_220D6AFB0(__int128 *a1, uint64_t a2)
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

unint64_t sub_220D6AFCC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564A958;
  if (!qword_25564A958)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564A918);
    v2[0] = sub_220D5CED0();
    v2[1] = sub_220D5D7F4((unint64_t *)&qword_25564A950, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564A958);
  }
  return result;
}

uint64_t sub_220D6B050(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  __int128 v9[2];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v11 = a1;
  v12 = a2;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B160);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_220D6AFB0(v9, (uint64_t)v13);
    v4 = v14;
    v5 = v15;
    __swift_project_boxed_opaque_existential_1(v13, v14);
    *(_QWORD *)&v9[0] = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25564B170));
    v7 = (void *)sub_220D98F44();
    objc_msgSend(*(id *)(v3 + 16), sel_pushViewController_animated_, v7, 0);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    v10 = 0;
    memset(v9, 0, sizeof(v9));
    return sub_220D6B27C((uint64_t)v9);
  }
}

uint64_t sub_220D6B14C()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_220D6B170(uint64_t a1, uint64_t a2)
{
  return sub_220D6B050(a1, a2);
}

uint64_t PASDefaultFlowStepsPresentationHandler.present(step:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  __int128 v7[2];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v9 = a1;
  v10 = a2;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B160);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_220D6AFB0(v7, (uint64_t)v11);
    v2 = v12;
    v3 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    *(_QWORD *)&v7[0] = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
    v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25564B170));
    v5 = (_QWORD *)sub_220D98F44();
    _s23ProximityAppleIDSetupUI38PASDefaultFlowStepsPresentationHandlerC18pushViewController_8animatedySo06UIViewL0C_SbtF_0(v5);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    v8 = 0;
    memset(v7, 0, sizeof(v7));
    return sub_220D6B27C((uint64_t)v7);
  }
}

uint64_t sub_220D6B27C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B168);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t PASDefaultFlowStepsPresentationHandler.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PASDefaultFlowStepsPresentationHandler.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_220D6B300(uint64_t a1, uint64_t a2)
{
  return PASDefaultFlowStepsPresentationHandler.present(step:)(a1, a2);
}

void _s23ProximityAppleIDSetupUI38PASDefaultFlowStepsPresentationHandlerC18pushViewController_8animatedySo06UIViewL0C_SbtF_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint8_t *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  id v23;
  _QWORD *v24;
  uint8_t *v25;
  _QWORD *v26;
  void *v27;
  uint8_t *v28;
  void *v29;

  v3 = sub_220D98C98();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)(v1 + 16);
  v8 = (uint8_t *)objc_msgSend(v7, sel_view);
  if (!v8)
  {
    v18 = sub_220D98C80();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v18, v3);
    swift_retain_n();
    v19 = sub_220D98C8C();
    v20 = sub_220D9946C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v26 = (_QWORD *)swift_slowAlloc();
      v28 = v21;
      v29 = v7;
      *(_DWORD *)v21 = 138543362;
      v22 = v7;
      v23 = v7;
      sub_220D99508();
      v24 = v26;
      *v26 = v22;
      swift_release_n();
      v25 = v28;
      _os_log_impl(&dword_220D57000, v19, v20, "PASUITargetViewPresenter addHostingController failed - no view on %{public}@", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v24, -1, -1);
      MEMORY[0x2276657E4](v25, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return;
  }
  v28 = v8;
  v9 = objc_msgSend(v7, sel_childViewControllers);
  sub_220D6B694();
  v10 = sub_220D993D0();

  v26 = a1;
  v27 = v7;
  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
      goto LABEL_4;
LABEL_11:
    swift_bridgeObjectRelease_n();
    sub_220D673C8(v26, v28);

    return;
  }
LABEL_17:
  swift_bridgeObjectRetain();
  v11 = sub_220D995B0();
  if (!v11)
    goto LABEL_11;
LABEL_4:
  v12 = 4;
  while (1)
  {
    if ((v10 & 0xC000000000000001) != 0)
      v13 = (id)MEMORY[0x227665148](v12 - 4, v10);
    else
      v13 = *(id *)(v10 + 8 * v12);
    v14 = v13;
    v15 = v12 - 3;
    if (__OFADD__(v12 - 4, 1))
    {
      __break(1u);
      goto LABEL_17;
    }
    v16 = objc_msgSend(v13, sel_view, v26, v27);
    if (!v16)
      break;
    v17 = v16;
    objc_msgSend(v16, sel_removeFromSuperview);

    objc_msgSend(v14, sel_removeFromParentViewController);
    ++v12;
    if (v15 == v11)
      goto LABEL_11;
  }
  __break(1u);
}

uint64_t type metadata accessor for PASViewControllerPresentationHandler()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PASDefaultFlowStepsPresentationHandler()
{
  return objc_opt_self();
}

unint64_t sub_220D6B694()
{
  unint64_t result;

  result = qword_25564B2D8;
  if (!qword_25564B2D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25564B2D8);
  }
  return result;
}

uint64_t sub_220D6B6D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_220D6B788();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id sub_220D6B6FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v10[2];

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 56);
  v8 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_OWORD *)v10 = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v10;
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v8;
  *(_BYTE *)(a1 + 64) = v6;
  sub_220D5CD60(v2);
  sub_220D5CD60(v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v10[0];
}

uint64_t sub_220D6B788()
{
  uint64_t v0;

  sub_220D9955C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_220D993AC();
  swift_bridgeObjectRelease();
  v0 = sub_220D99394();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_220D6B854()
{
  uint64_t v0;

  sub_220D9955C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_220D993AC();
  swift_bridgeObjectRelease();
  sub_220D993AC();
  swift_bridgeObjectRetain();
  sub_220D993AC();
  swift_bridgeObjectRelease();
  v0 = sub_220D99394();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t destroy for PASUITargetBaseView(uint64_t a1)
{
  if (*(_QWORD *)a1)
    swift_release();
  if (*(_QWORD *)(a1 + 16))
    swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PASUITargetBaseView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (*(_QWORD *)a2)
  {
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = *(_QWORD *)(a2 + 16);
  if (v5)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = *(void **)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  v10 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v9;
  v11 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PASUITargetBaseView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *a2;
  if (*(_QWORD *)a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v7)
    {
      v9 = a2[3];
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v9;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_15;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[3];
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  swift_retain();
  swift_release();
LABEL_15:
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = (void *)a2[5];
  *(_QWORD *)(a1 + 40) = v11;
  v12 = v11;

  *(_QWORD *)(a1 + 48) = a2[6];
  *(_QWORD *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PASUITargetBaseView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = *a2;
  if (*(_QWORD *)a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v7)
    {
      v9 = a2[3];
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v9;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_15;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[3];
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  swift_release();
LABEL_15:
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  v10 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = a2[5];

  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUITargetBaseView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUITargetBaseView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 64) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUITargetBaseView()
{
  return &type metadata for PASUITargetBaseView;
}

uint64_t sub_220D6BD4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t PASFlowStepCheckInternet.buildView()()
{
  sub_220D6BDC4();
  swift_retain();
  sub_220D98E30();
  sub_220D6BE0C();
  return sub_220D99280();
}

unint64_t sub_220D6BDC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564B2E0;
  if (!qword_25564B2E0)
  {
    v1 = sub_220D98B48();
    result = MEMORY[0x227665754](MEMORY[0x24BE7B4D8], v1);
    atomic_store(result, (unint64_t *)&qword_25564B2E0);
  }
  return result;
}

unint64_t sub_220D6BE0C()
{
  unint64_t result;

  result = qword_25564B2E8;
  if (!qword_25564B2E8)
  {
    result = MEMORY[0x227665754](&unk_220D9B448, &type metadata for PASUICheckInternetView);
    atomic_store(result, (unint64_t *)&qword_25564B2E8);
  }
  return result;
}

uint64_t sub_220D6BE50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v2 = type metadata accessor for PASUICheckInternetViewProxCardAdapter();
  swift_allocObject();
  v3 = swift_retain();
  v4 = sub_220D6D2E8(v3);
  result = swift_release();
  *(_QWORD *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = &off_24E6A3D70;
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_220D6BEBC()
{
  sub_220D6BDC4();
  swift_retain();
  sub_220D98E30();
  sub_220D6BE0C();
  return sub_220D99280();
}

uint64_t sub_220D6BF24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_220D99418();
  swift_retain();
  v7 = sub_220D9940C();
  v8 = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = a2;
  sub_220D5F9A8((uint64_t)v5, (uint64_t)&unk_25564B4A0, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_220D6C000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[9] = a4;
  sub_220D99418();
  v4[10] = sub_220D9940C();
  v4[11] = sub_220D993F4();
  v4[12] = v5;
  return swift_task_switch();
}

uint64_t sub_220D6C06C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t inited;
  _QWORD *v3;

  v1 = type metadata accessor for PASUIMonogramMaker();
  inited = swift_initStackObject();
  v0[13] = inited;
  v0[5] = v1;
  v0[6] = &off_24E6A0B40;
  v0[2] = inited;
  v3 = (_QWORD *)swift_task_alloc();
  v0[14] = v3;
  *v3 = v0;
  v3[1] = sub_220D6C0EC;
  return sub_220D98B24();
}

uint64_t sub_220D6C0EC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1 + 16);
  return swift_task_switch();
}

uint64_t sub_220D6C144()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_220D6C174(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD aBlock[6];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B460);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D8AAAC(a1);
  objc_msgSend(*(id *)(v1 + 40), sel_setEnabled_, 0);
  sub_220D98B3C();
  v7 = swift_allocObject();
  swift_weakInit();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = a1;
  sub_220D6839C(&qword_25564B468, &qword_25564B460, MEMORY[0x24BDB9EE8]);
  swift_unknownObjectRetain();
  sub_220D98D1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  swift_release();
  v9 = swift_allocObject();
  swift_weakInit();
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  *(_QWORD *)(v11 + 24) = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_220D6D1BC;
  *(_QWORD *)(v12 + 24) = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  v13 = (void *)sub_220D99340();
  aBlock[4] = sub_220D6D1E8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_220D76398;
  aBlock[3] = &block_descriptor_0;
  v14 = _Block_copy(aBlock);
  v15 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v13, 0, v14);

  _Block_release(v14);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_msgSend(a1, sel_setDismissButtonAction_, v15);

}

uint64_t sub_220D6C45C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v10 = result;
    if ((v8 & 1) == 0)
    {
      v11 = sub_220D9943C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
      sub_220D99418();
      swift_unknownObjectRetain();
      swift_retain();
      v12 = sub_220D9940C();
      v13 = (_QWORD *)swift_allocObject();
      v14 = MEMORY[0x24BEE6930];
      v13[2] = v12;
      v13[3] = v14;
      v13[4] = a3;
      v13[5] = v10;
      sub_220D5F9A8((uint64_t)v7, (uint64_t)&unk_25564B490, (uint64_t)v13);
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_220D6C58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  sub_220D99418();
  v5[4] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D6C5F8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void **)(v0 + 16);
  swift_release();
  sub_220D99394();
  v3 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setTitle_, v3);

  sub_220D99394();
  v4 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setSubtitle_, v4);

  v5 = *(void **)(v1 + 40);
  objc_msgSend(v5, sel_setEnabled_, 1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D6C708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result;
    swift_beginAccess();
    v6 = (void *)MEMORY[0x227665880](a3 + 16);
    if (v6)
    {
      v7 = objc_msgSend(v6, sel_viewController);
      v8 = *(_QWORD *)(v5 + 32);
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = sub_220D5F220;
      *(_QWORD *)(v9 + 24) = v8;
      swift_retain_n();
      sub_220D8B658(v7, (uint64_t)&unk_25564B478, v8, (uint64_t)&unk_25564B480, v9);
      swift_release();
      swift_unknownObjectRelease();

      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_220D6C824(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)a1 + 528) + *(_QWORD *)(*(_QWORD *)a1 + 528));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5DA1C;
  return v4();
}

void sub_220D6C880()
{
  uint64_t v0;

  swift_release();

}

uint64_t sub_220D6C89C()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PASUICheckInternetViewProxCardAdapter()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for PASUICheckInternetView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for PASUICheckInternetView()
{
  return swift_release();
}

_QWORD *assignWithCopy for PASUICheckInternetView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for PASUICheckInternetView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUICheckInternetView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PASUICheckInternetView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PASUICheckInternetView()
{
  return &type metadata for PASUICheckInternetView;
}

uint64_t sub_220D6CA30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D6CA40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v40 = a1;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B400);
  MEMORY[0x24BDAC7A8](v38);
  v39 = (uint64_t)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B408);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_220D98E60();
  v33 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B410);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B418);
  v10 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B420);
  MEMORY[0x24BDAC7A8](v34);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B428);
  v15 = MEMORY[0x24BDAC7A8](v37);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v32 - v18;
  swift_retain();
  v20 = sub_220D98B30();
  swift_release();
  if ((v20 & 1) != 0)
  {
    swift_storeEnumTagMultiPayload();
    sub_220D6CFF0();
    sub_220D5CE08();
    return sub_220D98F5C();
  }
  else
  {
    sub_220D99208();
    sub_220D98F20();
    v22 = sub_220D98F2C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 0, 1, v22);
    v23 = sub_220D99220();
    swift_release();
    sub_220D5D018((uint64_t)v9, &qword_25564B410);
    v41 = v23;
    sub_220D98E54();
    sub_220D9910C();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v35);
    swift_release();
    v24 = sub_220D99064();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v4, 1, 1, v24);
    v25 = sub_220D99070();
    sub_220D5D018((uint64_t)v4, &qword_25564B408);
    KeyPath = swift_getKeyPath();
    v27 = v36;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v12, v36);
    v28 = (uint64_t *)&v14[*(int *)(v34 + 36)];
    *v28 = KeyPath;
    v28[1] = v25;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v27);
    v29 = sub_220D991C0();
    v30 = swift_getKeyPath();
    sub_220D5CFD4((uint64_t)v14, (uint64_t)v17, &qword_25564B420);
    v31 = (uint64_t *)&v17[*(int *)(v37 + 36)];
    *v31 = v30;
    v31[1] = v29;
    sub_220D5D018((uint64_t)v14, &qword_25564B420);
    sub_220D6CFA8((uint64_t)v17, (uint64_t)v19);
    sub_220D5CFD4((uint64_t)v19, v39, &qword_25564B428);
    swift_storeEnumTagMultiPayload();
    sub_220D6CFF0();
    sub_220D5CE08();
    sub_220D98F5C();
    return sub_220D5D018((uint64_t)v19, &qword_25564B428);
  }
}

uint64_t sub_220D6CEB0@<X0>(uint64_t a1@<X8>)
{
  return sub_220D6CA40(a1);
}

uint64_t sub_220D6CEB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_220D98EC0();
  *a1 = result;
  return result;
}

uint64_t sub_220D6CEE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_220D98EC0();
  *a1 = result;
  return result;
}

uint64_t sub_220D6CF08()
{
  swift_retain();
  return sub_220D98ECC();
}

uint64_t sub_220D6CF30()
{
  swift_retain();
  return sub_220D98ECC();
}

uint64_t sub_220D6CF58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_220D98EA8();
  *a1 = result;
  return result;
}

uint64_t sub_220D6CF80()
{
  swift_retain();
  return sub_220D98EB4();
}

uint64_t sub_220D6CFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_220D6CFF0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564B430;
  if (!qword_25564B430)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564B428);
    v2[0] = sub_220D6D074();
    v2[1] = sub_220D6839C(&qword_25564B450, &qword_25564B458, MEMORY[0x24BDF1028]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564B430);
  }
  return result;
}

unint64_t sub_220D6D074()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_25564B438;
  if (!qword_25564B438)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564B420);
    v2[2] = MEMORY[0x24BDF4108];
    v2[3] = MEMORY[0x24BDF40E8];
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_220D6839C(&qword_25564B440, &qword_25564B448, MEMORY[0x24BDF1028]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564B438);
  }
  return result;
}

uint64_t sub_220D6D11C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D6D140()
{
  return objectdestroy_6Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

uint64_t sub_220D6D14C(char *a1)
{
  uint64_t v1;

  return sub_220D6C45C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_220D6D154()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D6D178()
{
  return objectdestroy_6Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_6Tm_0(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release();
  a1(*(_QWORD *)(v1 + 24));
  return swift_deallocObject();
}

uint64_t sub_220D6D1BC(uint64_t a1)
{
  uint64_t v1;

  return sub_220D6C708(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_220D6D1C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D6D1E8(uint64_t a1)
{
  uint64_t v1;

  return sub_220D7709C(a1, *(uint64_t (**)(void))(v1 + 16));
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

uint64_t sub_220D6D208()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5DA1C;
  v5 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 528) + *(_QWORD *)(*(_QWORD *)v0 + 528));
  v3 = (_QWORD *)swift_task_alloc();
  v2[2] = v3;
  *v3 = v2;
  v3[1] = sub_220D5DA1C;
  return v5();
}

uint64_t sub_220D6D284()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  _QWORD *v3;

  v2 = *(void (**)(void))(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D5DA1C;
  return ((uint64_t (*)(void (*)(void)))((char *)&dword_25564D6D8 + dword_25564D6D8))(v2);
}

_QWORD *sub_220D6D2E8(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[6];

  v2 = v1;
  v2[4] = a1;
  swift_retain();
  swift_retain();
  sub_220D99394();
  swift_retain();
  v4 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v9[4] = sub_220D6D514;
  v9[5] = a1;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_220D76398;
  v9[3] = &block_descriptor_30;
  v5 = _Block_copy(v9);
  v6 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v4, 1, v5);

  _Block_release(v5);
  swift_release();
  v2[5] = v6;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  v2[2] = sub_220D988B4();
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_220D995B0())
    v7 = sub_220D69690(MEMORY[0x24BEE4AF8]);
  else
    v7 = MEMORY[0x24BEE4B08];
  v2[3] = v7;
  return v2;
}

uint64_t sub_220D6D468()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D6D49C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_220D5DA1C;
  return sub_220D6C58C(a1, v4, v5, v7, v6);
}

uint64_t sub_220D6D514(uint64_t a1)
{
  uint64_t v1;

  return sub_220D6BF24(a1, v1);
}

uint64_t sub_220D6D51C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D6D548(uint64_t a1)
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
  v7[1] = sub_220D5CCCC;
  return sub_220D6C000(a1, v4, v5, v6);
}

unint64_t sub_220D6D5B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564B4A8;
  if (!qword_25564B4A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_25564B4B0);
    v2[0] = sub_220D6CFF0();
    v2[1] = sub_220D5CE08();
    result = MEMORY[0x227665754](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564B4A8);
  }
  return result;
}

uint64_t type metadata accessor for PASUINonUIExtensionConfiguration()
{
  return objc_opt_self();
}

uint64_t sub_220D6D654(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  uint64_t v14;

  v2 = v1;
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_220D98C8C();
  v10 = sub_220D99454();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_220D57000, v9, v10, "PASUINonUIExtensionConfiguration accept extension is accepting a new non-UI connection", v11, 2u);
    MEMORY[0x2276657E4](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = (void *)sub_220D98C20();
  objc_msgSend(a1, sel_setExportedInterface_, v12);

  objc_msgSend(a1, sel_setExportedObject_, *(_QWORD *)(v2 + 16));
  objc_msgSend(a1, sel_activate);
  return 1;
}

uint64_t sub_220D6D7A4(void *a1)
{
  sub_220D6D654(a1);
  return 1;
}

void sub_220D6D8B8(uint64_t a1, void *a2, void *a3)
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

void sub_220D6DA2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_220D987F4();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_220D6DA84(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B0C0);
    v4 = sub_220D99304();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_220D6DC30(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = a1;
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B0C0);
    v5 = (void *)sub_220D992F8();
  }
  if (a2)
    v6 = sub_220D987F4();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

void sub_220D6DDF0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_220D6DF3C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_220D987F4();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

uint64_t type metadata accessor for InfoProviderDecoratorBase()
{
  return objc_opt_self();
}

void sub_220D6E0A0(uint64_t a1, id a2, void (*a3)(_QWORD, id), uint64_t a4, id a5, uint64_t a6, uint64_t a7)
{
  id v10;
  void *v14;
  void *v15;
  _QWORD v16[6];

  if (a2)
  {
    v10 = a2;
    a3(0, a2);

  }
  else
  {
    objc_msgSend(a5, sel_setAnisetteDataProvider_, a1);
    v14 = *(void **)(a6 + 16);
    v16[4] = a3;
    v16[5] = a4;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = sub_220D6DA84;
    v16[3] = &block_descriptor_10;
    v15 = _Block_copy(v16);
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_authenticateWithAccount_with_completion_, a7, a5, v15);
    _Block_release(v15);
  }
}

uint64_t sub_220D6E1AC(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for AuthenticateProxyObjectFetchingDecorator()
{
  return objc_opt_self();
}

uint64_t sub_220D6E2B8(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  _QWORD aBlock[6];

  v6 = (void *)sub_220D98C44();
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v6);

  objc_msgSend(a1, sel_activate);
  aBlock[4] = a2;
  aBlock[5] = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_220D76398;
  aBlock[3] = &block_descriptor_13;
  v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v8 = objc_msgSend(a1, sel_remoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);
  sub_220D99520();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B718);
  swift_dynamicCast();
  return v10;
}

uint64_t sub_220D6E3D8(void *a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  id v17;
  void *v19;
  _QWORD *v20;
  void *v21;
  _QWORD v22[6];

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a4;
  v9 = (void *)objc_opt_self();
  _Block_copy(a4);
  v10 = objc_msgSend(v9, sel_currentConnection);
  if (v10)
  {
    v11 = v10;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_220D6E620;
    *(_QWORD *)(v12 + 24) = v8;
    swift_retain();
    v13 = (void *)sub_220D6E2B8(v11, (uint64_t)sub_220D6E690, v12);
    swift_release();
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = sub_220D6E620;
    v14[3] = v8;
    v14[4] = a2;
    v14[5] = a3;
    v14[6] = a1;
    v22[4] = sub_220D6E6F4;
    v22[5] = v14;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 1107296256;
    v22[2] = sub_220D6E1AC;
    v22[3] = &block_descriptor_1;
    v15 = _Block_copy(v22);
    swift_retain();
    v16 = a2;
    swift_retain();
    v17 = a1;
    swift_release();
    objc_msgSend(v13, sel_fetchExtrasWithCompletion_, v15);
    _Block_release(v15);
    swift_release();

    return swift_unknownObjectRelease();
  }
  else
  {
    sub_220D6E628();
    v19 = (void *)swift_allocError();
    *v20 = 0xD00000000000004CLL;
    v20[1] = 0x8000000220D9F620;
    v21 = (void *)sub_220D987F4();
    ((void (**)(_QWORD, _QWORD, void *))a4)[2](a4, 0, v21);

    return swift_release();
  }
}

uint64_t sub_220D6E5FC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_220D6E620(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_220D6DC30(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_220D6E628()
{
  unint64_t result;

  result = qword_25564B708;
  if (!qword_25564B708)
  {
    result = MEMORY[0x227665754](MEMORY[0x24BE7BA28], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25564B708);
  }
  return result;
}

uint64_t sub_220D6E66C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D6E690(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 16))(0, a1);
}

uint64_t sub_220D6E6B8()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_220D6E6F4(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_220D6E0A0(a1, a2, *(void (**)(_QWORD, id))(v2 + 16), *(_QWORD *)(v2 + 24), *(id *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
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

void sub_220D6E71C(uint64_t a1)
{
  uint64_t v1;

  sub_220D87FC8(a1, *(_QWORD *)(v1 + 16));
}

void sub_220D6E724(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_220D6DF3C(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_220D6E72C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_220D6DA2C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_220D6E7A8@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;
  __int128 v8[2];
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v10 = *a1;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B160);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_220D6AFB0(v8, (uint64_t)&v11);
    v3 = v13;
    v4 = v14;
    __swift_project_boxed_opaque_existential_1(&v11, v13);
    *(_QWORD *)&v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
    BYTE8(v10) = 0;
    sub_220D98F5C();
    v5 = *(_QWORD *)&v8[0];
    v6 = BYTE8(v8[0]);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  }
  else
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    sub_220D5D018((uint64_t)v8, &qword_25564B168);
    *(_QWORD *)&v8[0] = 0;
    BYTE8(v8[0]) = 1;
    result = sub_220D98F5C();
    v5 = v11;
    v6 = v12;
  }
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v6;
  return result;
}

uint64_t sub_220D6E900()
{
  return sub_220D98DC4();
}

uint64_t sub_220D6E918()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B738);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B740);
  sub_220D6F248();
  sub_220D6EEC8();
  sub_220D6F294();
  return sub_220D99160();
}

uint64_t View.targetDeviceSetupPresenter(with:presenterDelegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564ADE0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D6EA98(a1, (uint64_t)v9);
  swift_unknownObjectRetain();
  v10 = sub_220D6EDA0((uint64_t)v9);
  v12 = v11;
  swift_unknownObjectRelease();
  v14[0] = v10;
  v14[1] = v12;
  MEMORY[0x227664D7C](v14, a3, &type metadata for PASTargetDeviceSetupPresenterModifier, a4);

  return swift_release();
}

uint64_t sub_220D6EA98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564ADE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Binding<A>.present(step:)()
{
  uint64_t v0;

  v0 = sub_220D98E24();
  MEMORY[0x24BDAC7A8](v0);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564ADE0);
  MEMORY[0x227664E54]();
  sub_220D6EEC8();
  sub_220D98E18();
  swift_unknownObjectRelease();
  return sub_220D99298();
}

uint64_t sub_220D6EBAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24BDAC7A8](a1);
  swift_unknownObjectRetain();
  MEMORY[0x227664E54](a3);
  sub_220D6EEC8();
  sub_220D98E18();
  swift_unknownObjectRelease();
  return sub_220D99298();
}

uint64_t sub_220D6EC60()
{
  sub_220D99670();
  swift_getObjectType();
  sub_220D99574();
  sub_220D9967C();
  return sub_220D99688();
}

uint64_t sub_220D6ECB4()
{
  swift_getObjectType();
  sub_220D99574();
  return sub_220D9967C();
}

uint64_t sub_220D6ECF8()
{
  sub_220D99670();
  swift_getObjectType();
  sub_220D99574();
  sub_220D9967C();
  return sub_220D99688();
}

BOOL sub_220D6ED48()
{
  uint64_t v0;

  swift_getObjectType();
  v0 = sub_220D99574();
  swift_getObjectType();
  return v0 == sub_220D99574();
}

id sub_220D6EDA0(uint64_t a1)
{
  id v2;
  id v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PASUITargetViewPresenter()), sel_init);
  sub_220D99238();
  swift_retain();
  v2 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B758);
  sub_220D99244();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  sub_220D99244();
  sub_220D660FC(a1, (uint64_t)v5);

  swift_release();
  sub_220D5D018(a1, &qword_25564ADE0);
  return v2;
}

unint64_t sub_220D6EEC8()
{
  unint64_t result;

  result = qword_25564B720;
  if (!qword_25564B720)
  {
    result = MEMORY[0x227665754](&unk_220D9B700, &type metadata for PASFlowStepNavigationPathItem);
    atomic_store(result, (unint64_t *)&qword_25564B720);
  }
  return result;
}

uint64_t sub_220D6EF0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_220D98E6C();
  v4[0] = v1;
  v4[1] = sub_220D6EF60();
  return MEMORY[0x227665754](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_220D6EF60()
{
  unint64_t result;

  result = qword_25564B728;
  if (!qword_25564B728)
  {
    result = MEMORY[0x227665754](&unk_220D9B6B0, &type metadata for PASTargetDeviceSetupPresenterModifier);
    atomic_store(result, (unint64_t *)&qword_25564B728);
  }
  return result;
}

_OWORD *initializeBufferWithCopyOfBuffer for PASFlowStepNavigationPathItem(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for PASFlowStepNavigationPathItem()
{
  return swift_unknownObjectRelease();
}

_QWORD *assignWithCopy for PASFlowStepNavigationPathItem(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v3;
  return a1;
}

_OWORD *assignWithTake for PASFlowStepNavigationPathItem(_OWORD *a1, _OWORD *a2)
{
  swift_unknownObjectRelease();
  *a1 = *a2;
  return a1;
}

ValueMetadata *type metadata accessor for PASFlowStepNavigationPathItem()
{
  return &type metadata for PASFlowStepNavigationPathItem;
}

_QWORD *initializeBufferWithCopyOfBuffer for PASTargetDeviceSetupPresenterModifier(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for PASTargetDeviceSetupPresenterModifier(id *a1)
{

  return swift_release();
}

uint64_t assignWithCopy for PASTargetDeviceSetupPresenterModifier(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

id *assignWithTake for PASTargetDeviceSetupPresenterModifier(id *a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AAUISignInViewControllerWrapper(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AAUISignInViewControllerWrapper(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PASTargetDeviceSetupPresenterModifier()
{
  return &type metadata for PASTargetDeviceSetupPresenterModifier;
}

uint64_t sub_220D6F1F0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_220D6F204()
{
  unint64_t result;

  result = qword_25564B730;
  if (!qword_25564B730)
  {
    result = MEMORY[0x227665754](&unk_220D9B688, &type metadata for PASFlowStepNavigationPathItem);
    atomic_store(result, (unint64_t *)&qword_25564B730);
  }
  return result;
}

unint64_t sub_220D6F248()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564B748;
  if (!qword_25564B748)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564B738);
    result = MEMORY[0x227665754](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_25564B748);
  }
  return result;
}

unint64_t sub_220D6F294()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564B750;
  if (!qword_25564B750)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564B740);
    v2[0] = MEMORY[0x24BDF4760];
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x227665754](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564B750);
  }
  return result;
}

uint64_t sub_220D6F2F8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564B738);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564B740);
  sub_220D6F248();
  sub_220D6EEC8();
  sub_220D6F294();
  return swift_getOpaqueTypeConformance2();
}

uint64_t PASFlowStepProxiedTerms.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  ValueMetadata *v17;
  unint64_t v18;
  id (*v19)();
  uint64_t v20;
  char v21;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B760);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v16 - v5;
  sub_220D5D7F4(&qword_25564B768, MEMORY[0x24BE7B6D0], MEMORY[0x24BE7B4D8]);
  swift_retain_n();
  v7 = sub_220D98E30();
  v9 = v8;
  objc_allocWithZone((Class)type metadata accessor for PASUIProxiedTermsHandler());
  v10 = swift_bridgeObjectRetain();
  v11 = sub_220D68518(v10);
  swift_release();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v17 = (ValueMetadata *)v7;
  v18 = v9;
  v19 = sub_220D6F5A0;
  v20 = v12;
  v21 = 0;
  v13 = sub_220D6F5A8();
  sub_220D99178();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v17 = &type metadata for PASUIProxiedTermsView;
  v18 = v13;
  swift_getOpaqueTypeConformance2();
  v14 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v14;
}

uint64_t sub_220D6F55C()
{
  return PASFlowStepProxiedTerms.buildView()();
}

uint64_t sub_220D6F57C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_220D6F5A0()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

unint64_t sub_220D6F5A8()
{
  unint64_t result;

  result = qword_25564B770;
  if (!qword_25564B770)
  {
    result = MEMORY[0x227665754](&unk_220D9B798, &type metadata for PASUIProxiedTermsView);
    atomic_store(result, &qword_25564B770);
  }
  return result;
}

id sub_220D6F5EC(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)
    return a2;
  else
    return (id)swift_retain();
}

void destroy for PASUIProxiedTermsView(uint64_t a1)
{
  swift_release();
  sub_220D6F628(*(_QWORD *)(a1 + 16), *(void **)(a1 + 24), *(_BYTE *)(a1 + 32));
}

void sub_220D6F628(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_release();
}

uint64_t initializeWithCopy for PASUIProxiedTermsView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  swift_retain();
  sub_220D6F5EC(v4, v5, v6);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for PASUIProxiedTermsView(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_retain();
  swift_release();
  v4 = v2[2];
  v5 = (void *)v2[3];
  LOBYTE(v2) = *((_BYTE *)v2 + 32);
  sub_220D6F5EC(v4, v5, (char)v2);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(void **)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = (_BYTE)v2;
  sub_220D6F628(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PASUIProxiedTermsView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  v5 = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(void **)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = v5;
  sub_220D6F628(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIProxiedTermsView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIProxiedTermsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIProxiedTermsView()
{
  return &type metadata for PASUIProxiedTermsView;
}

uint64_t sub_220D6F804()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D6F814@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v16;
  char v17;
  __int128 v18;

  v3 = sub_220D98E00();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D9943C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v1[1];
  v18 = *v1;
  v11 = *((_QWORD *)&v18 + 1);
  v16 = v10;
  v17 = *((_BYTE *)v1 + 32);
  v12 = swift_allocObject();
  v13 = v1[1];
  *(_OWORD *)(v12 + 16) = *v1;
  *(_OWORD *)(v12 + 32) = v13;
  *(_BYTE *)(v12 + 48) = *((_BYTE *)v1 + 32);
  swift_retain();
  sub_220D6FC58((uint64_t)&v18);
  sub_220D6FC80((uint64_t)&v16);
  sub_220D99424();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(&v5[*(int *)(v3 + 20)], v9, v6);
  *(_QWORD *)v5 = &unk_25564B780;
  *((_QWORD *)v5 + 1) = v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564A918);
  sub_220D5CD14((uint64_t)v5, a1 + *(int *)(v14 + 36));
  *(_QWORD *)a1 = sub_220D5CC08;
  *(_QWORD *)(a1 + 8) = v11;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = sub_220D5C674;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = sub_220D5C6A4;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_BYTE *)(a1 + 80) = 1;
  *(_QWORD *)(a1 + 88) = MEMORY[0x24BEE4AF8];
  sub_220D5CD58();
  sub_220D5CD60((uint64_t)sub_220D5C674);
  sub_220D5CD60((uint64_t)sub_220D5C6A4);
  swift_bridgeObjectRetain();
  sub_220D5CD70((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_220D5CDAC();
  sub_220D5CDB4((uint64_t)sub_220D5C674);
  sub_220D5CDB4((uint64_t)sub_220D5C6A4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D6FA2C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[9] = a1;
  sub_220D99418();
  v1[10] = sub_220D9940C();
  v1[11] = sub_220D993F4();
  v1[12] = v2;
  return swift_task_switch();
}

uint64_t sub_220D6FA98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *(_OWORD *)(v0 + 56) = *(_OWORD *)*(_QWORD *)(v0 + 72);
  v1 = type metadata accessor for PASUIProxiedTermsHandler();
  sub_220D5D7F4(&qword_25564B788, (uint64_t (*)(uint64_t))type metadata accessor for PASUIProxiedTermsHandler, (uint64_t)&unk_220D9B12C);
  swift_retain();
  v2 = sub_220D98D7C();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = &off_24E6A1370;
  *(_QWORD *)(v0 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v3;
  *v3 = v0;
  v3[1] = sub_220D6FB6C;
  return sub_220D98A7C();
}

uint64_t sub_220D6FB6C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  sub_220D6FCB0(v1 + 56);
  __swift_destroy_boxed_opaque_existential_1(v1 + 16);
  return swift_task_switch();
}

uint64_t sub_220D6FBDC()
{
  uint64_t v0;

  swift_release();
  sub_220D6F628(*(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(_BYTE *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_220D6FC0C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5CCCC;
  return sub_220D6FA2C(v0 + 16);
}

uint64_t sub_220D6FC58(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_220D6FC80(uint64_t a1)
{
  sub_220D6F5EC(*(_QWORD *)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

uint64_t sub_220D6FCB0(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t PASFlowStepPersonalSignIn.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  ValueMetadata *v14;
  unint64_t v15;
  id v16;
  objc_class *v17;
  _UNKNOWN **v18;
  uint64_t v19;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B790);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - v5;
  v7 = (objc_class *)type metadata accessor for PASUIAppleIDAuthContextProvider();
  v8 = objc_allocWithZone(v7);
  swift_retain();
  v9 = objc_msgSend(v8, sel_init);
  v17 = v7;
  v18 = &off_24E6A2FC0;
  v16 = v9;
  sub_220D6FE74();
  v14 = (ValueMetadata *)sub_220D98E30();
  v15 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B7A0);
  swift_allocObject();
  v19 = sub_220D988B4();
  v11 = sub_220D6FEBC();
  sub_220D99178();
  sub_220D6FF00((uint64_t)&v14);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v14 = &type metadata for PASUIPersonalSignInView;
  v15 = v11;
  swift_getOpaqueTypeConformance2();
  v12 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

unint64_t sub_220D6FE74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564B798;
  if (!qword_25564B798)
  {
    v1 = sub_220D98B84();
    result = MEMORY[0x227665754](MEMORY[0x24BE7B4D8], v1);
    atomic_store(result, (unint64_t *)&qword_25564B798);
  }
  return result;
}

unint64_t sub_220D6FEBC()
{
  unint64_t result;

  result = qword_25564B7A8;
  if (!qword_25564B7A8)
  {
    result = MEMORY[0x227665754](&unk_220D9B838, &type metadata for PASUIPersonalSignInView);
    atomic_store(result, &qword_25564B7A8);
  }
  return result;
}

uint64_t sub_220D6FF00(uint64_t a1)
{
  destroy for PASUIPersonalSignInView(a1);
  return a1;
}

uint64_t sub_220D6FF2C()
{
  return PASFlowStepPersonalSignIn.buildView()();
}

uint64_t destroy for PASUIPersonalSignInView(uint64_t a1)
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return swift_release();
}

uint64_t initializeWithCopy for PASUIPersonalSignInView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2 + 16;
  v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  v7 = v6;
  v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_retain();
  v8(a1 + 16, v5, v7);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PASUIPersonalSignInView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PASUIPersonalSignInView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIPersonalSignInView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIPersonalSignInView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIPersonalSignInView()
{
  return &type metadata for PASUIPersonalSignInView;
}

uint64_t sub_220D70174()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D70184@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  _QWORD v8[7];
  _OWORD v9[4];
  _BYTE v10[40];

  sub_220D66810(v1 + 16, (uint64_t)v10);
  sub_220D70400(v1, (uint64_t)v9);
  v3 = (_OWORD *)swift_allocObject();
  v4 = v9[1];
  v3[1] = v9[0];
  v3[2] = v4;
  v5 = v9[3];
  v3[3] = v9[2];
  v3[4] = v5;
  sub_220D66810((uint64_t)v10, (uint64_t)v8);
  v8[5] = &unk_25564B7B8;
  v8[6] = v3;
  sub_220D704BC((uint64_t)v8, a1 + 72);
  *(_QWORD *)a1 = sub_220D6FCDC;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = sub_220D6FCE0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  v6 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v6;
  sub_220D5CD60((uint64_t)sub_220D6FCDC);
  sub_220D5CD60((uint64_t)sub_220D6FCE0);
  swift_bridgeObjectRetain();
  sub_220D704F8((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  sub_220D5CDB4((uint64_t)sub_220D6FCDC);
  sub_220D5CDB4((uint64_t)sub_220D6FCE0);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D702A4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  sub_220D99418();
  v2[4] = sub_220D9940C();
  v2[5] = sub_220D993F4();
  v2[6] = v3;
  return swift_task_switch();
}

uint64_t sub_220D70310()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[7] = *(_QWORD *)(v0[3] + 8);
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_220D70378;
  return sub_220D98B78();
}

uint64_t sub_220D70378()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_220D703CC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D70400(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for PASUIPersonalSignInView(a2, a1);
  return a2;
}

uint64_t sub_220D70434()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D70468(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_220D5CCCC;
  return sub_220D702A4(a1, v1 + 16);
}

uint64_t sub_220D704BC(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AppleIDAuthContextViewModifier(a2, a1);
  return a2;
}

uint64_t sub_220D704F8(uint64_t a1)
{
  destroy for AppleIDAuthContextViewModifier(a1);
  return a1;
}

unint64_t sub_220D70530()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564B7C0;
  if (!qword_25564B7C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564B7C8);
    v2[0] = sub_220D7059C();
    v2[1] = sub_220D705E0();
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564B7C0);
  }
  return result;
}

unint64_t sub_220D7059C()
{
  unint64_t result;

  result = qword_25564B7D0;
  if (!qword_25564B7D0)
  {
    result = MEMORY[0x227665754](&unk_220D9B354, &type metadata for PASUITargetBaseView);
    atomic_store(result, (unint64_t *)&qword_25564B7D0);
  }
  return result;
}

unint64_t sub_220D705E0()
{
  unint64_t result;

  result = qword_25564B7D8;
  if (!qword_25564B7D8)
  {
    result = MEMORY[0x227665754](&unk_220D9C520, &type metadata for AppleIDAuthContextViewModifier);
    atomic_store(result, (unint64_t *)&qword_25564B7D8);
  }
  return result;
}

uint64_t type metadata accessor for PASBundleForSharedAssets()
{
  return objc_opt_self();
}

uint64_t sub_220D70648()
{
  return swift_initClassMetadata2();
}

uint64_t sub_220D70688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_220D706A0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeakBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakBox);
}

uint64_t sub_220D706D0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_220D70710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(void *)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(void *);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];

  v40 = a6;
  v33 = a4;
  v34 = a3;
  v42 = a7;
  v41 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v31 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = v10;
  v13 = type metadata accessor for NavigationControllerReader.ReaderRepresentable(255, v10, v12, v11);
  v14 = sub_220D98E6C();
  v36 = v14;
  v32 = MEMORY[0x227665754](&unk_220D9BAD8, v13);
  v52[0] = v32;
  v52[1] = MEMORY[0x24BDECC38];
  v37 = MEMORY[0x227665754](MEMORY[0x24BDED308], v14, v52);
  v38 = sub_220D98F50();
  v15 = sub_220D98E6C();
  v39 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v30 - v19;
  v48 = a1;
  v49 = a2;
  __swift_instantiateConcreteTypeFromMangledName(qword_25564BA10);
  sub_220D99244();
  v21 = (void *)MEMORY[0x227665880](v44 + 16);
  swift_release();
  v22 = v31;
  v34(v21);

  v44 = a1;
  v45 = a2;
  sub_220D9925C();
  v44 = v48;
  v45 = v49;
  v46 = v50;
  sub_220D9919C();
  swift_release();
  swift_release();
  swift_release();
  v44 = v48;
  v45 = v49;
  v46 = v50;
  v47 = v51;
  sub_220D992BC();
  v23 = v35;
  v24 = v40;
  sub_220D990E8();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v22, v23);
  v25 = MEMORY[0x227665754](MEMORY[0x24BDEF370], v38);
  v43[0] = v24;
  v43[1] = v25;
  MEMORY[0x227665754](MEMORY[0x24BDED308], v15, v43);
  v26 = v39;
  v27 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  v27(v20, v18, v15);
  v28 = *(void (**)(char *, uint64_t))(v26 + 8);
  v28(v18, v15);
  v27(v42, v20, v15);
  return ((uint64_t (*)(char *, uint64_t))v28)(v20, v15);
}

uint64_t sub_220D70A24@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_220D70710(*(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(void (**)(void *))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
}

id sub_220D70A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;
  uint64_t v8;

  v7 = objc_allocWithZone(v3);
  return sub_220D70A80(a1, a2, a3, v8);
}

id sub_220D70A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  objc_class *v7;
  objc_super v9;

  v5 = *MEMORY[0x24BEE4EA0] & *v4;
  v6 = (_QWORD *)((char *)v4 + qword_25564B8F8);
  *v6 = a1;
  v6[1] = a2;
  v6[2] = a3;
  v7 = (objc_class *)type metadata accessor for NavigationControllerReader.Reader(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), a4);
  v9.receiver = v4;
  v9.super_class = v7;
  return objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, 0, 0);
}

void sub_220D70AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = (objc_class *)type metadata accessor for NavigationControllerReader.Reader(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v9.receiver = v4;
  v9.super_class = v5;
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  v6 = objc_msgSend(v4, sel_view);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v7, sel_setBackgroundColor_, v8);

  }
  else
  {
    __break(1u);
  }
}

void sub_220D70BA0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v4 = a1;
  sub_220D70AE8((uint64_t)v4, v1, v2, v3);

}

void sub_220D70BD4()
{
  sub_220D712E8();
}

uint64_t sub_220D70C00(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = v1;
  return a1;
}

uint64_t sub_220D70C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  id v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for NavigationControllerReader.Reader(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v9.receiver = v4;
  v9.super_class = v6;
  objc_msgSendSuper2(&v9, sel_didMoveToParentViewController_, a1);
  swift_retain();
  swift_retain();
  swift_retain();
  v7 = objc_msgSend(v4, sel_navigationController);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B980);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();

  __swift_instantiateConcreteTypeFromMangledName(qword_25564B988);
  sub_220D99298();
  swift_release();
  swift_release();
  return swift_release();
}

void sub_220D70D34(void *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v8 = a1;
  sub_220D70C18((uint64_t)a3, (uint64_t)v8, v6, v7);

}

id sub_220D70D8C(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v7;
  id result;
  void *v9;
  id v10;
  objc_super v11;

  v7 = (objc_class *)type metadata accessor for NavigationControllerReader.Reader(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v11.receiver = v4;
  v11.super_class = v7;
  objc_msgSendSuper2(&v11, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a1, a2 & 1);
  swift_retain();
  swift_retain();
  swift_retain();
  result = objc_msgSend(v4, sel_view);
  if (result)
  {
    v9 = result;
    v10 = sub_220D70FDC(result);

    __swift_instantiateConcreteTypeFromMangledName(&qword_25564B980);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();

    __swift_instantiateConcreteTypeFromMangledName(qword_25564B988);
    sub_220D99298();
    swift_release();
    swift_release();
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_220D70EC8(void *a1, uint64_t a2, void *a3, char a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v7 = a3;
  v9 = a1;
  sub_220D70D8C((uint64_t)a3, a4, (uint64_t)v9, v8);

}

id sub_220D70F28(void *a1)
{
  id v2;
  void *v3;
  id result;
  void *v5;
  uint64_t v6;

  v2 = objc_msgSend(a1, sel_nextResponder);
  if (v2)
  {
    v3 = v2;
    objc_opt_self();
    result = (id)swift_dynamicCastObjCClass();
    if (result)
      return result;

  }
  result = objc_msgSend(a1, sel_nextResponder);
  if (result)
  {
    v5 = result;
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
    {
      v6 = sub_220D70F28();

      return (id)v6;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

id sub_220D70FDC(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;

  v1 = a1;
  while (1)
  {
    v2 = v1;
    v3 = sub_220D70F28(v2);
    if (v3)
      break;

LABEL_3:
    v1 = objc_msgSend(v2, sel_superview);

    if (!v1)
      return v1;
  }
  v4 = v3;
  v1 = objc_msgSend(v3, sel_navigationController);

  if (!v1)
    goto LABEL_3;

  return v1;
}

void sub_220D71090(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  sub_220D71340();
}

id sub_220D710CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for NavigationControllerReader.Reader(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_220D71118()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for NavigationControllerReader.Reader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NavigationControllerReader.Reader);
}

uint64_t sub_220D71160()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(qword_25564B988);
  sub_220D992A4();
  return v1;
}

id sub_220D711A8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_220D71800(*v2, v2[1], v2[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_220D711C8()
{
  return sub_220D98FBC();
}

uint64_t sub_220D71200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x227665754](&unk_220D9BA60, a3);
  return sub_220D98FF8();
}

uint64_t sub_220D7125C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x227665754](&unk_220D9BA60, a3);
  return sub_220D98FC8();
}

void sub_220D712B8(uint64_t a1)
{
  MEMORY[0x227665754](&unk_220D9BA60, a1);
  sub_220D98FEC();
  __break(1u);
}

void sub_220D712E8()
{
  sub_220D995A4();
  __break(1u);
}

void sub_220D71340()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2276656E8](a1, v6, a5);
}

uint64_t sub_220D71398()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_220D713A0()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_220D713D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_220D7142C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
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

_OWORD *sub_220D714AC(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_220D714F8(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_220D71540(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for NavigationControllerReader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NavigationControllerReader);
}

uint64_t sub_220D7158C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for NavigationControllerReader.ReaderRepresentable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NavigationControllerReader.ReaderRepresentable);
}

uint64_t sub_220D715D0()
{
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *sub_220D71600(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_220D7164C(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_220D716C0(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t sub_220D7170C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v4 = a1[1];
  v5 = type metadata accessor for NavigationControllerReader.ReaderRepresentable(255, *a1, v4, a4);
  v6 = sub_220D98E6C();
  v12[0] = MEMORY[0x227665754](&unk_220D9BAD8, v5);
  v12[1] = MEMORY[0x24BDECC38];
  v7 = MEMORY[0x24BDED308];
  MEMORY[0x227665754](MEMORY[0x24BDED308], v6, v12);
  v8 = sub_220D98F50();
  v9 = sub_220D98E6C();
  v11[0] = v4;
  v11[1] = MEMORY[0x227665754](MEMORY[0x24BDEF370], v8);
  return MEMORY[0x227665754](v7, v9, v11);
}

void sub_220D717E4()
{
  JUMPOUT(0x227665754);
}

uint64_t sub_220D717F4()
{
  return MEMORY[0x24BDF5560];
}

id sub_220D71800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (objc_class *)type metadata accessor for NavigationControllerReader.Reader(0, a4, a5, a4);
  v6 = sub_220D71160();
  return sub_220D70A80(v6, v7, v8, (uint64_t)objc_allocWithZone(v5));
}

uint64_t sub_220D7189C()
{
  ValueMetadata *v0;
  ValueMetadata *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  ValueMetadata *v17;
  unint64_t v18;
  objc_class *v19;
  _UNKNOWN **v20;
  uint64_t v21;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564BA98);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - v7;
  v9 = (objc_class *)type metadata accessor for PASUIAppleIDAuthContextProvider();
  v10 = objc_allocWithZone(v9);
  swift_retain();
  v11 = objc_msgSend(v10, sel_init);
  v19 = v9;
  v20 = &off_24E6A2FC0;
  v18 = (unint64_t)v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B120);
  swift_allocObject();
  v12 = sub_220D988B4();
  v17 = v1;
  v21 = v12;
  v13 = sub_220D71A38();
  sub_220D99178();
  sub_220D71A7C((uint64_t)&v17);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v17 = &type metadata for PASUISourceAuthView;
  v18 = v13;
  swift_getOpaqueTypeConformance2();
  v14 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return v14;
}

uint64_t sub_220D71A18()
{
  return sub_220D7189C();
}

unint64_t sub_220D71A38()
{
  unint64_t result;

  result = qword_25564BAA0;
  if (!qword_25564BAA0)
  {
    result = MEMORY[0x227665754](&unk_220D9BB84, &type metadata for PASUISourceAuthView);
    atomic_store(result, &qword_25564BAA0);
  }
  return result;
}

uint64_t sub_220D71A7C(uint64_t a1)
{
  destroy for PASUISourceAuthView(a1);
  return a1;
}

uint64_t destroy for PASUISourceAuthView(uint64_t a1)
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  return swift_release();
}

uint64_t initializeWithCopy for PASUISourceAuthView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = a2 + 8;
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v5;
  v6 = v5;
  v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 8, v4, v6);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PASUISourceAuthView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PASUISourceAuthView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUISourceAuthView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUISourceAuthView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUISourceAuthView()
{
  return &type metadata for PASUISourceAuthView;
}

uint64_t sub_220D71CD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D71CE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v2 = v1;
  v4 = sub_220D98E00();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_220D9943C();
  v8 = *(_QWORD *)(v7 - 8);
  v18 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  sub_220D72154((uint64_t)v2, (uint64_t)&v19);
  v12 = swift_allocObject();
  v13 = v20;
  *(_OWORD *)(v12 + 16) = v19;
  *(_OWORD *)(v12 + 32) = v13;
  *(_OWORD *)(v12 + 48) = v21;
  *(_QWORD *)(v12 + 64) = v22;
  sub_220D72154((uint64_t)v2, (uint64_t)&v19);
  v14 = swift_allocObject();
  v15 = v20;
  *(_OWORD *)(v14 + 16) = v19;
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = v21;
  *(_QWORD *)(v14 + 64) = v22;
  swift_retain();
  sub_220D99424();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v6[*(int *)(v4 + 20)], v10, v7);
  *(_QWORD *)v6 = &unk_25564BAB0;
  *((_QWORD *)v6 + 1) = v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564A918);
  sub_220D5CD14((uint64_t)v6, a1 + *(int *)(v16 + 36));
  *(_QWORD *)a1 = sub_220D5CC08;
  *(_QWORD *)(a1 + 8) = v11;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = sub_220D7218C;
  *(_QWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = sub_220D5C6A4;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_BYTE *)(a1 + 80) = 1;
  *(_QWORD *)(a1 + 88) = MEMORY[0x24BEE4AF8];
  sub_220D5CD58();
  sub_220D5CD60((uint64_t)sub_220D7218C);
  sub_220D5CD60((uint64_t)sub_220D5C6A4);
  swift_bridgeObjectRetain();
  sub_220D5CD70((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  sub_220D5CDAC();
  sub_220D5CDB4((uint64_t)sub_220D7218C);
  sub_220D5CDB4((uint64_t)sub_220D5C6A4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D71F38(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  sub_220D99418();
  v1[3] = sub_220D9940C();
  v1[4] = sub_220D993F4();
  v1[5] = v2;
  return swift_task_switch();
}

uint64_t sub_220D71FA4()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(id (*)(), uint64_t);

  v1 = (uint64_t *)v0[2];
  v2 = *v1;
  v3 = swift_task_alloc();
  v0[6] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  v6 = (uint64_t (*)(id (*)(), uint64_t))(**(int **)(*(_QWORD *)v2 + 688) + *(_QWORD *)(*(_QWORD *)v2 + 688));
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  *v4 = v0;
  v4[1] = sub_220D72030;
  return v6(sub_220D72280, v3);
}

uint64_t sub_220D72030()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

id sub_220D72084(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v2 = __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 32));
  (*(void (**)(_QWORD *__return_ptr))(**(_QWORD **)(a1 + 48) + 128))(v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
  v6 = *v2;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0AE28]), sel_init);
  objc_msgSend(v7, sel_setPresentingViewController_, v5);
  objc_msgSend(v7, sel_setDelegate_, v6);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

uint64_t sub_220D72154(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for PASUISourceAuthView(a2, a1);
  return a2;
}

uint64_t sub_220D7218C()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(void))(**(_QWORD **)(v0 + 16) + 672))();
  v1 = sub_220D99388();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D72234()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5CCCC;
  return sub_220D71F38(v0 + 16);
}

id sub_220D72280()
{
  uint64_t v0;

  return sub_220D72084(*(_QWORD *)(v0 + 16));
}

unint64_t sub_220D72288()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564A950;
  if (!qword_25564A950)
  {
    v1 = sub_220D98E00();
    result = MEMORY[0x227665754](MEMORY[0x24BDEC4C8], v1);
    atomic_store(result, (unint64_t *)&qword_25564A950);
  }
  return result;
}

unint64_t sub_220D722D0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C6D0);
  v2 = sub_220D995BC();
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
    sub_220D5CFD4(v6, (uint64_t)v15, &qword_25564BB48);
    result = sub_220D73234((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_220D73EF4(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_220D72410(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564BB20);
  v2 = sub_220D995BC();
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
    sub_220D5CFD4(v6, (uint64_t)&v15, &qword_25564BB28);
    v7 = v15;
    v8 = v16;
    result = sub_220D73264(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_220D6AFB0(&v17, v3[7] + 40 * result);
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 56;
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

unint64_t sub_220D72550(uint64_t a1)
{
  return sub_220D72564(a1, &qword_25564BB30, &qword_25564BB38);
}

unint64_t sub_220D72564(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v6 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_220D995BC();
  v6 = (_QWORD *)v5;
  v7 = *(_QWORD *)(a1 + 16);
  if (!v7)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v6;
  }
  v8 = v5 + 64;
  v9 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_220D5CFD4(v9, (uint64_t)&v16, a3);
    v10 = v16;
    result = sub_220D732C8(v16);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v6[6] + 8 * result) = v10;
    result = (unint64_t)sub_220D73EF4(&v17, (_OWORD *)(v6[7] + 32 * result));
    v13 = v6[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v6[2] = v15;
    v9 += 40;
    if (!--v7)
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

unint64_t sub_220D72688(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564BB10);
  v2 = sub_220D995BC();
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
    sub_220D5CFD4(v6, (uint64_t)&v15, &qword_25564BB18);
    v7 = v15;
    v8 = v16;
    result = sub_220D73264(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_220D73EF4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t PASFlowStepAIDASignIn.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  objc_class *v9;
  _BYTE *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  _OWORD v18[3];
  objc_super v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564BAB8);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v18 - v5;
  v7 = (void *)objc_opt_self();
  swift_retain();
  v8 = objc_msgSend(v7, sel_defaultCenter);
  v9 = (objc_class *)type metadata accessor for PASUICDPEnrollmentObserver();
  v10 = objc_allocWithZone(v9);
  *(_QWORD *)&v10[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_observers] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v10[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_delegate + 8] = 0;
  v11 = swift_unknownObjectWeakInit();
  v10[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_lastStatus] = 4;
  *(_QWORD *)(v11 + 8) = MEMORY[0x24BE7B558];
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v10[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_notificationCenter] = v8;
  v19.receiver = v10;
  v19.super_class = v9;
  swift_retain();
  v12 = v8;
  v13 = objc_msgSendSuper2(&v19, sel_init);
  sub_220D94608();

  swift_release();
  sub_220D7366C(v13, (uint64_t *)v20);
  v14 = (void *)v21;
  v22 = v20[0];
  v18[0] = v20[0];
  v18[1] = v20[1];
  v18[2] = v21;
  v15 = sub_220D73794();
  sub_220D99178();
  sub_220D6FCB0((uint64_t)&v22);
  swift_release();

  swift_unknownObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  *(_QWORD *)&v18[0] = &type metadata for PASUIAIDASignInView;
  *((_QWORD *)&v18[0] + 1) = v15;
  swift_getOpaqueTypeConformance2();
  v16 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v16;
}

uint64_t sub_220D72A04()
{
  return PASFlowStepAIDASignIn.buildView()();
}

uint64_t sub_220D72A24@<X0>(_QWORD *a1@<X8>)
{
  __int128 *v1;
  void *v3;
  _OWORD *v4;
  __int128 v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v10 = *v1;
  v3 = (void *)*((_QWORD *)v1 + 4);
  v4 = (_OWORD *)swift_allocObject();
  v5 = v1[1];
  v4[1] = *v1;
  v4[2] = v5;
  v4[3] = v1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B980);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  sub_220D6FC58((uint64_t)&v10);
  swift_unknownObjectRetain();
  v6 = v3;
  swift_retain();
  result = sub_220D99238();
  *a1 = v8;
  a1[1] = v9;
  a1[2] = sub_220D73A28;
  a1[3] = v4;
  return result;
}

uint64_t sub_220D72B10@<X0>(void *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  int v21;
  _OWORD *v22;
  __int128 v23;
  void *v24;
  id v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  id v45;
  id v46;
  char *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  id v58;
  id v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67[40];
  __int128 v68;

  v6 = sub_220D98E00();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_220D9943C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564BAC8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  if (!a1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 56))(a3, 1, 1);
  v61 = (uint64_t)&v57 - v18;
  v64 = v19;
  v65 = a3;
  v66 = v17;
  v68 = *a2;
  v20 = (_QWORD *)(*((_QWORD *)&v68 + 1) + *MEMORY[0x24BE7B550]);
  sub_220D66810((uint64_t)v20, (uint64_t)v67);
  v59 = a1;
  sub_220D6FC58((uint64_t)&v68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564BAD0);
  sub_220D9892C();
  v21 = swift_dynamicCast();
  v62 = v10;
  v63 = v9;
  v60 = v8;
  v57 = v12;
  if ((v21 & 1) != 0)
  {
    swift_release();
    sub_220D6FCB0((uint64_t)&v68);
    v22 = (_OWORD *)swift_allocObject();
    v23 = a2[1];
    v22[1] = *a2;
    v22[2] = v23;
    v22[3] = a2[2];
    v24 = (void *)*((_QWORD *)a2 + 4);
    sub_220D6FC58((uint64_t)&v68);
    swift_unknownObjectRetain();
    v25 = v24;
    swift_retain();
    v26 = sub_220D73C44;
  }
  else
  {
    sub_220D6FCB0((uint64_t)&v68);
    v26 = 0;
    v22 = 0;
  }
  v28 = v20[3];
  v29 = v20[4];
  __swift_project_boxed_opaque_existential_1(v20, v28);
  v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 80))(v28, v29);
  if (v31 >> 60 != 15)
  {
    v35 = v30;
    v36 = v31;
    v37 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    v38 = v6;
    v39 = v26;
    v40 = (void *)sub_220D9880C();
    v58 = objc_msgSend(v37, sel_initWithData_, v40);
    sub_220D73BAC(v35, v36);

    v26 = v39;
    v32 = v38;
    if (!v21)
      goto LABEL_8;
LABEL_10:
    v33 = swift_allocObject();
    *(_QWORD *)(v33 + 16) = v26;
    *(_QWORD *)(v33 + 24) = v22;
    v34 = sub_220D73B74;
    goto LABEL_11;
  }
  v58 = 0;
  v32 = v6;
  if (v21)
    goto LABEL_10;
LABEL_8:
  v33 = 0;
  v34 = sub_220D6B6D0;
LABEL_11:
  v41 = swift_allocObject();
  *(_QWORD *)(v41 + 16) = v34;
  *(_QWORD *)(v41 + 24) = v33;
  v42 = (void *)*((_QWORD *)a2 + 4);
  v43 = swift_allocObject();
  v44 = a2[1];
  *(_OWORD *)(v43 + 16) = *a2;
  *(_OWORD *)(v43 + 32) = v44;
  *(_OWORD *)(v43 + 48) = a2[2];
  v45 = v59;
  *(_QWORD *)(v43 + 64) = v59;
  v59 = v45;
  sub_220D6FC58((uint64_t)&v68);
  swift_unknownObjectRetain();
  v46 = v42;
  swift_retain();
  v47 = v57;
  sub_220D99424();
  v48 = v60;
  v49 = v62;
  v50 = v63;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))((char *)v60 + *(int *)(v32 + 20), v47, v63);
  *v48 = &unk_25564BAE0;
  v48[1] = v43;
  sub_220D5CD14((uint64_t)v48, (uint64_t)&v16[*(int *)(v66 + 36)]);
  *(_QWORD *)v16 = sub_220D73A54;
  *((_QWORD *)v16 + 1) = v41;
  *((_QWORD *)v16 + 2) = sub_220D6FCE0;
  *((_QWORD *)v16 + 3) = 0;
  v16[32] = 1;
  v51 = v58;
  *((_QWORD *)v16 + 5) = v58;
  *((_QWORD *)v16 + 6) = 0;
  v52 = MEMORY[0x24BEE4AF8];
  *((_QWORD *)v16 + 7) = 0;
  *((_QWORD *)v16 + 8) = v52;
  sub_220D5CD60((uint64_t)sub_220D73A54);
  sub_220D5CD60((uint64_t)sub_220D6FCE0);
  v53 = v51;
  swift_bridgeObjectRetain();
  sub_220D5CD70((uint64_t)v48);

  (*(void (**)(char *, uint64_t))(v49 + 8))(v47, v50);
  sub_220D5CDB4((uint64_t)sub_220D73A54);
  sub_220D5CDB4((uint64_t)sub_220D6FCE0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v54 = v61;
  sub_220D73B2C((uint64_t)v16, v61);
  v55 = v54;
  v56 = v65;
  sub_220D73B2C(v55, v65);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v64 + 56))(v56, 0, 1, v66);
}

uint64_t sub_220D72FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (_QWORD *)(*(_QWORD *)(a5 + 8) + *MEMORY[0x24BE7B550]);
  v6 = v5[3];
  v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7);
  v8 = sub_220D99388();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_220D7306C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[4] = a1;
  v2[5] = a2;
  sub_220D99418();
  v2[6] = sub_220D9940C();
  v2[7] = sub_220D993F4();
  v2[8] = v3;
  return swift_task_switch();
}

uint64_t sub_220D730D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(void **)(v2 + 32);
  objc_msgSend(v3, sel_setForceInlinePresentation_, 0);
  objc_msgSend(v3, sel_setPresentingViewController_, v1);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v2;
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  swift_retain();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v5;
  *v5 = v0;
  v5[1] = sub_220D73198;
  return sub_220D9895C();
}

uint64_t sub_220D73198()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  sub_220D6FCB0(v1 + 16);
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D73200()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_220D73234(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_220D99538();
  return sub_220D73354(a1, v2);
}

unint64_t sub_220D73264(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_220D99670();
  sub_220D993A0();
  v4 = sub_220D99688();
  return sub_220D73418(a1, a2, v4);
}

unint64_t sub_220D732C8(uint64_t a1)
{
  uint64_t v2;

  sub_220D99364();
  sub_220D99670();
  sub_220D993A0();
  v2 = sub_220D99688();
  swift_bridgeObjectRelease();
  return sub_220D734F8(a1, v2);
}

unint64_t sub_220D73354(uint64_t a1, uint64_t a2)
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
      sub_220D73F04(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x22766510C](v9, a1);
      sub_220D73F40((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_220D73418(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_220D99604() & 1) == 0)
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
      while (!v14 && (sub_220D99604() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_220D734F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_220D99364();
    v8 = v7;
    if (v6 == sub_220D99364() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_220D99604();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_220D99364();
          v15 = v14;
          if (v13 == sub_220D99364() && v15 == v16)
            break;
          v18 = sub_220D99604();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

id sub_220D7366C@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id result;
  void *v10;
  id v11;
  id v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B7A0);
  swift_allocObject();
  v4 = sub_220D988B4();
  sub_220D98968();
  sub_220D5D7F4(&qword_25564BB40, (uint64_t (*)(uint64_t))MEMORY[0x24BE7B560], MEMORY[0x24BE7B4D8]);
  swift_retain();
  v5 = sub_220D98E30();
  v7 = v6;
  v8 = objc_allocWithZone(MEMORY[0x24BE1AA18]);
  swift_unknownObjectRetain();
  result = objc_msgSend(v8, sel_initWithPresentingViewController_, 0);
  if (result)
  {
    v10 = result;
    v11 = a1;
    v12 = v10;
    objc_msgSend(v12, sel_setDelegate_, v11);

    result = (id)swift_release();
    *a2 = v5;
    a2[1] = v7;
    a2[2] = (uint64_t)v11;
    a2[3] = (uint64_t)&off_24E6A4708;
    a2[4] = (uint64_t)v12;
    a2[5] = v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_220D73794()
{
  unint64_t result;

  result = qword_25564BAC0;
  if (!qword_25564BAC0)
  {
    result = MEMORY[0x227665754](&unk_220D9BC34, &type metadata for PASUIAIDASignInView);
    atomic_store(result, (unint64_t *)&qword_25564BAC0);
  }
  return result;
}

uint64_t destroy for PASUIAIDASignInView(uint64_t a1)
{
  swift_release();
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for PASUIAIDASignInView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v5 = *(void **)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v4;
  swift_retain();
  swift_unknownObjectRetain();
  v6 = v5;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PASUIAIDASignInView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v4 = a2[3];
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[3] = v4;
  v5 = (void *)a2[4];
  v6 = (void *)a1[4];
  a1[4] = v5;
  v7 = v5;

  a1[5] = a2[5];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PASUIAIDASignInView(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIAIDASignInView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PASUIAIDASignInView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PASUIAIDASignInView()
{
  return &type metadata for PASUIAIDASignInView;
}

uint64_t sub_220D73A14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D73A28@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_220D72B10(a1, (_OWORD *)(v2 + 16), a2);
}

uint64_t sub_220D73A30()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D73A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v5)(uint64_t *__return_ptr, _QWORD *, _QWORD *);
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[2];

  v5 = *(void (**)(uint64_t *__return_ptr, _QWORD *, _QWORD *))(v4 + 16);
  v9[0] = a1;
  v9[1] = a2;
  v8[0] = a3;
  v8[1] = a4;
  v5(&v7, v9, v8);
  return v7;
}

uint64_t sub_220D73A94()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D73AD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0 + 16;
  v3 = *(_QWORD *)(v0 + 64);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_220D5CCCC;
  return sub_220D7306C(v2, v3);
}

uint64_t sub_220D73B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564BAC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_220D73B74@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v6;

  result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(*a1, a1[1], *a2, a2[1]);
  *a3 = result;
  a3[1] = v6;
  return result;
}

uint64_t sub_220D73BAC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_220D73BC0(a1, a2);
  return a1;
}

uint64_t sub_220D73BC0(uint64_t a1, unint64_t a2)
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

uint64_t objectdestroyTm_3()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D73C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_220D72FD8(a1, a2, a3, a4, v4 + 16);
}

id sub_220D73C4C(uint64_t a1)
{
  uint64_t v1;

  return sub_220D73C58(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(*(_QWORD *)(v1 + 16) + 32));
}

id sub_220D73C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t inited;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE04D88]), sel_initWithPresentingViewController_, a2);
  objc_msgSend(v6, sel_setBackgroundDataclassEnablement_, 1);
  objc_msgSend(v6, sel_setCdpContext_, a1);
  objc_msgSend(v6, sel_setFindMyActivationAction_, 0);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE083B0]), sel_init);
  objc_msgSend(v7, sel_setIgnoreAccountConversion_, 1);
  v8 = (void *)sub_220D99340();
  objc_msgSend(v7, sel_setDebugReason_, v8);

  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE060D0]), sel_init);
  objc_msgSend(v9, sel_setCdpUiProvider_, a3);
  objc_msgSend(v9, sel_setViewController_, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564BAE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220D9BBE0;
  v11 = (void *)*MEMORY[0x24BE06080];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BE06080];
  v12 = sub_220D73EBC(0, &qword_25564BAF0);
  *(_QWORD *)(inited + 40) = v6;
  v13 = (void *)*MEMORY[0x24BE060A0];
  *(_QWORD *)(inited + 64) = v12;
  *(_QWORD *)(inited + 72) = v13;
  *(_QWORD *)(inited + 104) = sub_220D73EBC(0, &qword_25564BAF8);
  *(_QWORD *)(inited + 80) = v7;
  v14 = v11;
  v15 = v6;
  v16 = v13;
  v17 = v7;
  sub_220D72564(inited, &qword_25564BB00, &qword_25564BB08);
  type metadata accessor for AIDAServiceType(0);
  sub_220D5D7F4(&qword_25564AA40, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_220D9AB18);
  v18 = (void *)sub_220D992F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setSignInContexts_, v18);

  return v9;
}

uint64_t sub_220D73EBC(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_220D73EF4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_220D73F04(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_220D73F40(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_220D73F78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564BB50;
  if (!qword_25564BB50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564BB58);
    result = MEMORY[0x227665754](&unk_220D9B9D0, v1);
    atomic_store(result, (unint64_t *)&qword_25564BB50);
  }
  return result;
}

id PASUITargetViewPresenter.__allocating_init(parentViewController:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithParentViewController_, a1);

  return v3;
}

id PASUITargetViewPresenter.init(parentViewController:)(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  id v11;
  id v12;
  id v13;
  _BYTE v15[40];
  _QWORD v16[5];

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = v2;
  v6 = objc_msgSend(a1, sel_navigationController);
  if (v6)
  {
    v7 = v6;
    v8 = type metadata accessor for PASViewControllerPresentationHandler();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v10 = &off_24E6A1548;
  }
  else
  {
    v8 = type metadata accessor for PASDefaultFlowStepsPresentationHandler();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = a1;
    v11 = a1;
    v10 = &protocol witness table for PASDefaultFlowStepsPresentationHandler;
  }

  v16[3] = v8;
  v16[4] = v10;
  v16[0] = v9;
  sub_220D66810((uint64_t)v16, (uint64_t)v15);
  v12 = objc_allocWithZone(ObjectType);
  v13 = PASUITargetViewPresenter.init(navigationController:)((uint64_t)v15);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

uint64_t PASFlowStepExtensionProvidedPicker.buildView()()
{
  sub_220D741AC();
  swift_retain();
  sub_220D98E30();
  sub_220D741F4();
  return sub_220D99280();
}

unint64_t sub_220D741AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564BB60;
  if (!qword_25564BB60)
  {
    v1 = sub_220D98C14();
    result = MEMORY[0x227665754](MEMORY[0x24BE7B4D8], v1);
    atomic_store(result, (unint64_t *)&qword_25564BB60);
  }
  return result;
}

unint64_t sub_220D741F4()
{
  unint64_t result;

  result = qword_25564BB68;
  if (!qword_25564BB68)
  {
    result = MEMORY[0x227665754](&unk_220D9BD70, &_s27ExtensionProvidedPickerViewVN);
    atomic_store(result, (unint64_t *)&qword_25564BB68);
  }
  return result;
}

uint64_t sub_220D74238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  ValueMetadata *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v21 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564BCC8);
  v20 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v19 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - v8;
  v34 = a2;
  swift_retain();
  v32 = sub_220D99394();
  v33 = v10;
  sub_220D98C14();
  sub_220D741AC();
  sub_220D98E3C();
  swift_getKeyPath();
  sub_220D98E48();
  swift_release();
  swift_release();
  v22 = a1;
  v23 = a2;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB58);
  v12 = sub_220D74EF4();
  v13 = sub_220D5F128();
  v17 = sub_220D5F16C();
  sub_220D99190();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v14 = v20;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v19, v9, v5);
  v24 = &_s30ExtensionViewControllerWrapperVN;
  v25 = MEMORY[0x24BEE0D00];
  v26 = v11;
  v27 = MEMORY[0x24BDF1FA8];
  v28 = v12;
  v29 = v13;
  v30 = v17;
  v31 = MEMORY[0x24BDF1F80];
  swift_getOpaqueTypeConformance2();
  v15 = sub_220D99280();
  result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v9, v5);
  *v21 = v15;
  return result;
}

uint64_t sub_220D744B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;

  v35 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB78);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB80);
  v33 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v34 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v32 = (char *)&v32 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v32 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  v36 = sub_220D99394();
  v37 = v18;
  sub_220D98D40();
  v19 = sub_220D98D4C();
  v20 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v20(v7, 0, 1, v19);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a1;
  *(_QWORD *)(v21 + 24) = a2;
  sub_220D5F128();
  swift_retain();
  sub_220D99274();
  v36 = sub_220D99394();
  v37 = v22;
  sub_220D98D34();
  v20(v7, 0, 1, v19);
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = a1;
  *(_QWORD *)(v23 + 24) = a2;
  swift_retain();
  sub_220D99274();
  v24 = v32;
  v25 = v33;
  v26 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
  v26(v32, v17, v8);
  v27 = v34;
  v26(v34, v15, v8);
  v28 = v35;
  v26(v35, v24, v8);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AB88);
  v26(&v28[*(int *)(v29 + 48)], v27, v8);
  v30 = *(void (**)(char *, uint64_t))(v25 + 8);
  v30(v15, v8);
  v30(v17, v8);
  v30(v27, v8);
  return ((uint64_t (*)(char *, uint64_t))v30)(v24, v8);
}

uint64_t sub_220D7479C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a5;
  sub_220D99418();
  *(_QWORD *)(v5 + 24) = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D74808()
{
  uint64_t v0;

  swift_release();
  swift_retain();
  sub_220D9898C();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D7484C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_220D99418();
  swift_retain();
  v11 = sub_220D9940C();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = a1;
  v12[5] = a2;
  sub_220D5F9A8((uint64_t)v9, a4, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_220D74934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[2] = a5;
  sub_220D99418();
  v5[3] = sub_220D9940C();
  v5[4] = sub_220D993F4();
  v5[5] = v6;
  return swift_task_switch();
}

uint64_t sub_220D749A0()
{
  uint64_t v0;
  _QWORD *v1;

  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_220D749F8;
  return sub_220D98974();
}

uint64_t sub_220D749F8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_220D74A50@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_220D99394();
  sub_220D5F128();
  result = sub_220D990C4();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_220D74ABC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return sub_220D74238(*v1, v1[1], a1);
}

char *sub_220D74AC4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v0 = sub_220D988A8();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D98938();
  swift_retain();
  swift_dynamicCast();
  if (qword_25564A8B8 != -1)
    swift_once();
  v3 = static PASUIConstants.extensionDefaultSceneID;
  v4 = unk_255650650;
  swift_bridgeObjectRetain();
  v5 = (char *)sub_220D899F0((uint64_t)v2, v3, v4);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564BD00);
  sub_220D99028();
  *(_QWORD *)&v5[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate + 8] = &off_24E6A25D0;
  swift_unknownObjectWeakAssign();
  swift_release();
  return v5;
}

uint64_t sub_220D74C18()
{
  swift_release();
  return swift_deallocClassInstance();
}

char *sub_220D74C3C()
{
  return sub_220D74AC4();
}

uint64_t sub_220D74C44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  _s30ExtensionViewControllerWrapperV11CoordinatorCMa();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  *a1 = v4;
  return swift_retain();
}

uint64_t sub_220D74C84()
{
  sub_220D756A0();
  return sub_220D98FF8();
}

uint64_t sub_220D74CD4()
{
  sub_220D756A0();
  return sub_220D98FC8();
}

void sub_220D74D24()
{
  sub_220D756A0();
  sub_220D98FEC();
  __break(1u);
}

void sub_220D74D48(uint64_t a1@<X8>)
{
  _QWORD *v1;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(*v1 + *MEMORY[0x24BE7B960] + 8) + *MEMORY[0x24BE7B508]);
  if (v3 == 1)
  {
    *(_BYTE *)a1 = 1;
  }
  else
  {
    v4 = _s20EmptyProxCardAdapterCMa();
    v5 = swift_allocObject();
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = &off_24E6A25C0;
    *(_QWORD *)a1 = v5;
  }
  *(_BYTE *)(a1 + 40) = v3;
}

uint64_t sub_220D74DD4()
{
  sub_220D741AC();
  swift_retain();
  sub_220D98E30();
  sub_220D741F4();
  return sub_220D99280();
}

uint64_t _s30ExtensionViewControllerWrapperV11CoordinatorCMa()
{
  return objc_opt_self();
}

uint64_t _s20EmptyProxCardAdapterCMa()
{
  return objc_opt_self();
}

ValueMetadata *_s27ExtensionProvidedPickerViewVMa()
{
  return &_s27ExtensionProvidedPickerViewVN;
}

uint64_t sub_220D74E8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D74E9C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_220D98998();
  *a1 = result & 1;
  return result;
}

uint64_t sub_220D74EC8()
{
  return sub_220D989A4();
}

uint64_t sub_220D74EEC@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_220D744B8(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_220D74EF4()
{
  unint64_t result;

  result = qword_25564BCD0;
  if (!qword_25564BCD0)
  {
    result = MEMORY[0x227665754](&unk_220D9BE68, &_s30ExtensionViewControllerWrapperVN);
    atomic_store(result, &qword_25564BCD0);
  }
  return result;
}

uint64_t sub_220D74F38()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D74F5C()
{
  uint64_t v0;

  return sub_220D7484C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)&unk_24E6A2678, (uint64_t)&unk_25564BCF0);
}

uint64_t sub_220D74F84()
{
  uint64_t v0;

  return sub_220D7484C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)&unk_24E6A2650, (uint64_t)&unk_25564BCE0);
}

uint64_t sub_220D74FB0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_220D5CCCC;
  return sub_220D74934(a1, v4, v5, v7, v6);
}

uint64_t sub_220D7502C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_220D5DA1C;
  return sub_220D7479C(a1, v4, v5, v7, v6);
}

uint64_t sub_220D750A4(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  id v23;
  uint64_t v25;
  int v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = v2;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = sub_220D98C98();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = a1;
  v12 = a2;
  v13 = v11;
  v14 = v12;
  v15 = sub_220D98C8C();
  v16 = sub_220D99454();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    v26 = v16;
    v28 = v7;
    v29 = v6;
    v30 = v3;
    v17 = swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v17 = 141558530;
    v31 = 1752392040;
    sub_220D99508();
    *(_WORD *)(v17 + 12) = 2112;
    v18 = (uint64_t *)((char *)v13 + *MEMORY[0x24BE7B838]);
    v19 = v18[1];
    if (v19)
    {
      v20 = *v18;
      sub_220D6E628();
      swift_allocError();
      *v21 = v20;
      v21[1] = v19;
      swift_bridgeObjectRetain();
      v19 = _swift_stdlib_bridgeErrorToNSError();
      v31 = v19;
    }
    else
    {
      v31 = 0;
    }
    sub_220D99508();
    v22 = v27;
    *v27 = v19;

    *(_WORD *)(v17 + 22) = 2114;
    v31 = (uint64_t)v14;
    v23 = v14;
    sub_220D99508();
    v22[1] = v14;

    _os_log_impl(&dword_220D57000, v15, (os_log_type_t)v26, "ExtensionViewControllerWrapper.Coordinator hostViewController didPick account: %{mask.hash}@, context: %{public}@", (uint8_t *)v17, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v22, -1, -1);
    MEMORY[0x2276657E4](v17, -1, -1);
    v6 = v29;
    v7 = v28;
  }
  else
  {

    v15 = v13;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return sub_220D98BFC();
}

uint64_t sub_220D7538C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = v1;
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_220D98C8C();
  v12 = sub_220D9946C();
  if (os_log_type_enabled(v11, v12))
  {
    v22 = v2;
    v13 = swift_slowAlloc();
    v21 = v4;
    v14 = (uint8_t *)v13;
    v15 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v14 = 138543362;
    v16 = a1;
    v17 = _swift_stdlib_bridgeErrorToNSError();
    v23 = v17;
    sub_220D99508();
    *v15 = v17;

    _os_log_impl(&dword_220D57000, v11, v12, "ExtensionViewControllerWrapper.Coordinator hostViewController didFailWith %{public}@", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v15, -1, -1);
    v18 = v14;
    v4 = v21;
    MEMORY[0x2276657E4](v18, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_220D98C08();
}

uint64_t sub_220D75574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_220D98C98();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_220D98C8C();
  v6 = sub_220D99454();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "ExtensionViewControllerWrapper.Coordinator hostViewControllerWantsToPromptForFlowCancel", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_220D98980();
}

ValueMetadata *_s30ExtensionViewControllerWrapperVMa()
{
  return &_s30ExtensionViewControllerWrapperVN;
}

uint64_t sub_220D75690()
{
  return MEMORY[0x24BDF4760];
}

unint64_t sub_220D756A0()
{
  unint64_t result;

  result = qword_25564BCF8;
  if (!qword_25564BCF8)
  {
    result = MEMORY[0x227665754](&unk_220D9BDF0, &_s30ExtensionViewControllerWrapperVN);
    atomic_store(result, (unint64_t *)&qword_25564BCF8);
  }
  return result;
}

unint64_t sub_220D756E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  unint64_t result;

  v3 = type metadata accessor for PASUIProgressViewProxCardAdapter();
  v4 = (_QWORD *)swift_allocObject();
  v4[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  v4[2] = sub_220D988B4();
  swift_retain();
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_220D995B0())
    result = sub_220D69690(MEMORY[0x24BEE4AF8]);
  else
    result = MEMORY[0x24BEE4B08];
  v4[3] = result;
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = &off_24E6A3D70;
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t PASFlowStepSendSelectedAccount.buildView()()
{
  sub_220D5CE08();
  return sub_220D99280();
}

unint64_t sub_220D757D4@<X0>(uint64_t a1@<X8>)
{
  return sub_220D756E8(a1);
}

uint64_t sub_220D757F4()
{
  sub_220D5CE08();
  return sub_220D99280();
}

uint64_t PASFlowStepLocalAuth.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  ValueMetadata *v14;
  unint64_t v15;
  id v16;
  objc_class *v17;
  _UNKNOWN **v18;
  uint64_t v19;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564BD08);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - v5;
  v7 = (objc_class *)type metadata accessor for PASUIAppleIDAuthContextProvider();
  v8 = objc_allocWithZone(v7);
  swift_retain();
  v9 = objc_msgSend(v8, sel_init);
  v17 = v7;
  v18 = &off_24E6A2FC0;
  v16 = v9;
  sub_220D759A4();
  v14 = (ValueMetadata *)sub_220D98E30();
  v15 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B7A0);
  swift_allocObject();
  v19 = sub_220D988B4();
  v11 = sub_220D759EC();
  sub_220D99178();
  sub_220D75A30((uint64_t)&v14);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v14 = &type metadata for PASUILocalAuthView;
  v15 = v11;
  swift_getOpaqueTypeConformance2();
  v12 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

unint64_t sub_220D759A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564BD10;
  if (!qword_25564BD10)
  {
    v1 = sub_220D98950();
    result = MEMORY[0x227665754](MEMORY[0x24BE7B4D8], v1);
    atomic_store(result, (unint64_t *)&qword_25564BD10);
  }
  return result;
}

unint64_t sub_220D759EC()
{
  unint64_t result;

  result = qword_25564BD18;
  if (!qword_25564BD18)
  {
    result = MEMORY[0x227665754](&unk_220D9BF24, &type metadata for PASUILocalAuthView);
    atomic_store(result, &qword_25564BD18);
  }
  return result;
}

uint64_t sub_220D75A30(uint64_t a1)
{
  destroy for PASUIPersonalSignInView(a1);
  return a1;
}

uint64_t sub_220D75A5C()
{
  return PASFlowStepLocalAuth.buildView()();
}

ValueMetadata *type metadata accessor for PASUILocalAuthView()
{
  return &type metadata for PASUILocalAuthView;
}

uint64_t sub_220D75A8C()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_220D75A9C@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double result;
  __int128 v21;
  _QWORD v22[7];
  _OWORD v23[4];
  _BYTE v24[40];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[4];

  v2 = v1;
  sub_220D75E2C(v1, (uint64_t)&v25);
  v4 = (_OWORD *)swift_allocObject();
  v5 = v26;
  v4[1] = v25;
  v4[2] = v5;
  v6 = v28;
  v4[3] = v27;
  v4[4] = v6;
  v7 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + *MEMORY[0x24BE7B528]);
  v8 = *(_QWORD *)(v7 + 32);
  if (v8 >> 60 == 15)
  {
    v9 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v7 + 24);
    v11 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    sub_220D75EF8(v10, v8);
    v12 = (void *)sub_220D9880C();
    v9 = objc_msgSend(v11, sel_initWithData_, v12);
    sub_220D73BAC(v10, v8);

  }
  sub_220D66810(v2 + 16, (uint64_t)v24);
  sub_220D75E2C(v2, (uint64_t)v23);
  v13 = (_OWORD *)swift_allocObject();
  v14 = v23[1];
  v13[1] = v23[0];
  v13[2] = v14;
  v15 = v23[3];
  v13[3] = v23[2];
  v13[4] = v15;
  sub_220D66810((uint64_t)v24, (uint64_t)v22);
  v22[5] = &unk_25564BD28;
  v22[6] = v13;
  sub_220D704BC((uint64_t)v22, (uint64_t)v29 + 8);
  *(_QWORD *)&v25 = sub_220D75E64;
  *((_QWORD *)&v25 + 1) = v4;
  *(_QWORD *)&v26 = sub_220D6FCE0;
  *((_QWORD *)&v26 + 1) = 0;
  LOBYTE(v27) = 1;
  *((_QWORD *)&v27 + 1) = v9;
  v28 = 0uLL;
  *(_QWORD *)&v29[0] = MEMORY[0x24BEE4AF8];
  sub_220D5CD60((uint64_t)sub_220D75E64);
  sub_220D5CD60((uint64_t)sub_220D6FCE0);
  v16 = v9;
  swift_bridgeObjectRetain();
  sub_220D704F8((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  sub_220D5CDB4((uint64_t)sub_220D75E64);
  sub_220D5CDB4((uint64_t)sub_220D6FCE0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v17 = v29[1];
  a1[4] = v29[0];
  a1[5] = v17;
  v18 = v29[3];
  a1[6] = v29[2];
  a1[7] = v18;
  v19 = v26;
  *a1 = v25;
  a1[1] = v19;
  result = *(double *)&v27;
  v21 = v28;
  a1[2] = v27;
  a1[3] = v21;
  return result;
}

uint64_t sub_220D75CC0()
{
  uint64_t v0;

  swift_retain();
  sub_220D98920();
  swift_release();
  v0 = sub_220D99388();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_220D75D54(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  sub_220D99418();
  v2[4] = sub_220D9940C();
  v2[5] = sub_220D993F4();
  v2[6] = v3;
  return swift_task_switch();
}

uint64_t sub_220D75DC0()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[7] = *(_QWORD *)(v0[3] + 8);
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_220D70378;
  return sub_220D98944();
}

uint64_t sub_220D75E2C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for PASUIPersonalSignInView(a2, a1);
  return a2;
}

uint64_t sub_220D75E64()
{
  return sub_220D75CC0();
}

uint64_t objectdestroyTm_4()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D75EA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_220D5CCCC;
  return sub_220D75D54(a1, v1 + 16);
}

uint64_t sub_220D75EF8(uint64_t a1, unint64_t a2)
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

uint64_t sub_220D75F40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_220D9943C();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_220D762C4((uint64_t)v4);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_220D99430();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_220D993F4();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_25564BDE0;
  *(_QWORD *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_220D7610C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_220D76124()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v3 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)(v0 + 16) + 24) + *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_220D7617C;
  return v3();
}

uint64_t sub_220D7617C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_220D761EC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PASUIButtonActionHandler()
{
  return objc_opt_self();
}

uint64_t sub_220D76238()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D76264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D5CCCC;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_220D762C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_220D76304()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D76328(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_220D5CCCC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25564CB10 + dword_25564CB10))(a1, v4);
}

void sub_220D76398(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_220D763E8()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v2, sel_setInterruptionHandler_, 0);
    objc_msgSend(v2, sel_setInvalidationHandler_, 0);
    objc_msgSend(v2, sel_invalidate);

    v1 = *(void **)(v0 + 16);
  }

  swift_unknownObjectRelease();
  sub_220D671D8(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PASUIExtensionProxy()
{
  return objc_opt_self();
}

uint64_t sub_220D7648C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[6];

  v2 = v1;
  v4 = swift_allocObject();
  swift_weakInit();
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_25565E9E8);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v8);

  objc_msgSend(a1, sel_setExportedObject_, *(_QWORD *)(v2 + 24));
  v9 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_255660708);
  objc_msgSend(a1, sel_setExportedInterface_, v9);

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_220D77404;
  *(_QWORD *)(v10 + 24) = v6;
  v14[4] = sub_220D7740C;
  v14[5] = v10;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_220D79A30;
  v14[3] = &block_descriptor_2;
  v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v11);
  _Block_release(v11);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_220D77404;
  *(_QWORD *)(v12 + 24) = v6;
  swift_retain();
  sub_220D76D80((uint64_t (*)())sub_220D77450, v12);
  swift_release();
  return swift_release();
}

uint64_t sub_220D76698(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v6 = sub_220D992D4();
  v18 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_220D992EC();
  v9 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D73EBC(0, (unint64_t *)&qword_25564C900);
  v12 = (void *)sub_220D994B4();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = a1;
  aBlock[4] = sub_220D774AC;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_220D79A30;
  aBlock[3] = &block_descriptor_27;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  v15 = a1;
  swift_release();
  sub_220D992E0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_220D774B8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C910);
  sub_220D77500();
  sub_220D9952C();
  MEMORY[0x227665088](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v17);
}

void sub_220D76898(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  char v12;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v6 = Strong;
    swift_beginAccess();
    v7 = MEMORY[0x227665880](a2 + 16);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = *(void **)(v6 + 16);
      if (v9)
      {
        sub_220D73EBC(0, &qword_25564BF08);
        v10 = v8;
        v11 = v9;
        v12 = sub_220D994FC();

        if ((v12 & 1) != 0 && (sub_220D76F20(), MEMORY[0x227665880](v6 + 32)))
        {
          if (objc_msgSend((id)objc_opt_self(), sel_isMainThread))
          {
            sub_220D88410(a3, 0, 1);
            swift_release();

            swift_unknownObjectRelease();
          }
          else
          {
            __break(1u);
          }
        }
        else
        {
          swift_release();

        }
      }
      else
      {
        swift_release();

      }
    }
    else
    {
      swift_release();
    }
  }
}

void sub_220D769F8(void (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;

  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D9946C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUIExtensionProxy configure.interruptionHandler host's XPC connection to extension scene interrupted", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_220D99364();
  v10 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v11 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_initWithDomain_code_userInfo_, v11, 4097, 0);

  v13 = v12;
  a1();

}

void sub_220D76B7C(void *a1, void (*a2)(void *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint8_t *v17;
  _QWORD *v18;
  void (*v19)(void *);
  uint64_t v20;

  v19 = a2;
  v3 = sub_220D98C98();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v7 = a1;
    v8 = sub_220D98C80();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
    v9 = a1;
    v10 = a1;
    v11 = sub_220D98C8C();
    v12 = sub_220D9946C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v18 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v13 = 138543362;
      v17 = v13 + 4;
      v14 = a1;
      v15 = _swift_stdlib_bridgeErrorToNSError();
      v20 = v15;
      sub_220D99508();
      v16 = v18;
      *v18 = v15;

      _os_log_impl(&dword_220D57000, v11, v12, "PASUIExtensionProxy configure.hello.completion hello message from host to extension scene failed: %{public}@", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v16, -1, -1);
      MEMORY[0x2276657E4](v13, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v19(a1);

  }
}

uint64_t sub_220D76D80(uint64_t (*a1)(), uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  uint64_t aBlock;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  uint64_t (*v17)();
  uint64_t v18;

  v3 = v2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v17 = sub_220D77458;
  v18 = v6;
  v7 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v14 = 1107296256;
  v15 = sub_220D76398;
  v16 = &block_descriptor_18;
  v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  v9 = objc_msgSend(v3, sel_remoteObjectProxyWithErrorHandler_, v8);
  _Block_release(v8);
  sub_220D99520();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564BEF0);
  swift_dynamicCast();
  swift_release();
  v17 = a1;
  v18 = a2;
  aBlock = v7;
  v14 = 1107296256;
  v15 = sub_220D87F74;
  v16 = &block_descriptor_21;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_helloWithCompletion_, v10);
  _Block_release(v10);
  return swift_unknownObjectRelease();
}

void sub_220D76F20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  uint64_t v13;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    v6 = *(void **)(v1 + 16);
    if (v6)
    {
      v7 = v6;
      v8 = sub_220D98C80();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
      v9 = sub_220D98C8C();
      v10 = sub_220D99454();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_220D57000, v9, v10, "PASUIExtensionProxy tearDownConnection invalidating host's XPC connection to extension scene", v11, 2u);
        MEMORY[0x2276657E4](v11, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v12 = *(void **)(v1 + 16);
      *(_QWORD *)(v1 + 16) = 0;

      objc_msgSend(v7, sel_setInterruptionHandler_, 0);
      objc_msgSend(v7, sel_setInvalidationHandler_, 0);
      objc_msgSend(v7, sel_invalidate);

    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_220D7709C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_220D770BC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = sub_220D98C98();
  MEMORY[0x24BDAC7A8](v2);
  v3 = (void *)objc_opt_self();
  if (objc_msgSend(v3, sel_isMainThread))
  {
    v4 = sub_220D88DE8();
    if (objc_msgSend(v3, sel_isMainThread))
    {
      sub_220D76F20();
      sub_220D7648C(v4);
      v5 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v4;
      v6 = v4;

      objc_msgSend(v6, sel_activate);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  __break(1u);
}

uint64_t sub_220D77390()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D773B4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D773D8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D77404(void *a1)
{
  uint64_t v1;

  return sub_220D76698(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_220D7740C()
{
  uint64_t v0;

  sub_220D769F8(*(void (**)(void))(v0 + 16));
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

uint64_t sub_220D7742C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_220D77450(void *a1)
{
  uint64_t v1;

  sub_220D76B7C(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_220D77458()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_220D77478()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_220D774AC()
{
  uint64_t v0;

  sub_220D76898(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

unint64_t sub_220D774B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564BEF8;
  if (!qword_25564BEF8)
  {
    v1 = sub_220D992D4();
    result = MEMORY[0x227665754](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_25564BEF8);
  }
  return result;
}

unint64_t sub_220D77500()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564BF00;
  if (!qword_25564BF00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_25564C910);
    result = MEMORY[0x227665754](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25564BF00);
  }
  return result;
}

void sub_220D7767C()
{
  char *v0;
  id v1;
  double v2;
  double v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v1 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v1, sel_scale);
  v3 = v2;

  v4 = objc_allocWithZone((Class)PASUIMicaPlayer);
  v5 = (void *)sub_220D99340();
  v6 = objc_msgSend(v4, sel_initWithFileName_retinaScale_, v5, v3);

  v7 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer;
  v8 = *(void **)&v0[OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer];
  *(_QWORD *)&v0[OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer] = v6;

  v9 = *(void **)&v0[v7];
  if (!v9)
  {
    __break(1u);
    goto LABEL_7;
  }
  v10 = v9;
  v11 = objc_msgSend(v0, sel_layer);
  sub_220D99364();
  v12 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_addToLayer_onTop_gravity_, v11, 1, v12);

  v13 = *(void **)&v0[v7];
  if (!v13)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  objc_msgSend(v13, sel_pause);
  v14 = *(void **)&v0[v7];
  if (!v14)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v15 = objc_msgSend(v14, sel_rootLayer);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend((id)objc_opt_self(), sel_systemBlueColor);
    v18 = objc_msgSend(v17, sel_CGColor);

    objc_msgSend(v16, sel_mp_setFillOfAllShapeLayersToColor_, v18);
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_220D77874()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for PASUIMicaView();
  objc_msgSendSuper2(&v5, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer];
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v0, sel_layer);
    sub_220D99364();
    v4 = (void *)sub_220D99340();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_moveAndResizeWithinParentLayer_usingGravity_animate_, v3, v4, 0);

  }
  else
  {
    __break(1u);
  }
}

id sub_220D7796C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUIMicaView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PASUIMicaView()
{
  return objc_opt_self();
}

uint64_t sub_220D779CC(id *a1)
{

  swift_release();
  return swift_release();
}

uint64_t sub_220D779FC(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_220D77A58(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_220D77AC8(uint64_t a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release();
  return a1;
}

uint64_t type metadata accessor for PASPresentationControllerView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PASPresentationControllerView);
}

uint64_t sub_220D77B20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D77B54@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void (*a3)(void *)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
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
  char *v19;
  uint64_t v20;
  char *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(void *);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[3];

  v37 = a4;
  v38 = a3;
  v43 = a7;
  v9 = *(_QWORD *)(a5 - 8);
  v41 = a6;
  v42 = v9;
  MEMORY[0x24BDAC7A8](a1);
  v32 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = v11;
  v14 = type metadata accessor for PASPresentationControllerView.ViewControllerRepresentable(255, v11, v13, v12);
  v15 = sub_220D98E6C();
  v35 = v15;
  v34 = MEMORY[0x227665754](&unk_220D9C260, v14);
  v49[0] = v34;
  v49[1] = MEMORY[0x24BDECC38];
  v36 = MEMORY[0x227665754](MEMORY[0x24BDED308], v15, v49);
  v39 = sub_220D98F50();
  v16 = sub_220D98E6C();
  v40 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v31 - v20;
  v47 = a1;
  v48 = a2;
  __swift_instantiateConcreteTypeFromMangledName(qword_25564BFC0);
  sub_220D99244();
  v22 = v45;
  v23 = v32;
  v38(v45);

  v47 = a1;
  v48 = a2;
  sub_220D99244();
  v24 = v45;
  sub_220D9919C();

  v25 = v47;
  v45 = v47;
  v46 = v48;
  sub_220D992BC();
  v26 = v33;
  v27 = v41;
  sub_220D990E8();

  (*(void (**)(char *, uint64_t))(v42 + 8))(v23, v26);
  v28 = MEMORY[0x227665754](MEMORY[0x24BDEF370], v39);
  v44[0] = v27;
  v44[1] = v28;
  MEMORY[0x227665754](MEMORY[0x24BDED308], v16, v44);
  sub_220D71894((uint64_t)v19, v16, (uint64_t)v21);
  v29 = *(void (**)(char *, uint64_t))(v40 + 8);
  v29(v19, v16);
  sub_220D70688((uint64_t)v21, v16, v43);
  return ((uint64_t (*)(char *, uint64_t))v29)(v21, v16);
}

uint64_t sub_220D77E00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_220D77B54(*(void **)v2, *(_QWORD *)(v2 + 8), *(void (**)(void *))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
}

uint64_t type metadata accessor for PASPresentationControllerView.ViewControllerRepresentable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PASPresentationControllerView.ViewControllerRepresentable);
}

uint64_t sub_220D77E20(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v4 = a1[1];
  v5 = type metadata accessor for PASPresentationControllerView.ViewControllerRepresentable(255, *a1, v4, a4);
  v6 = sub_220D98E6C();
  v12[0] = MEMORY[0x227665754](&unk_220D9C260, v5);
  v12[1] = MEMORY[0x24BDECC38];
  v7 = MEMORY[0x24BDED308];
  MEMORY[0x227665754](MEMORY[0x24BDED308], v6, v12);
  v8 = sub_220D98F50();
  v9 = sub_220D98E6C();
  v11[0] = v4;
  v11[1] = MEMORY[0x227665754](MEMORY[0x24BDEF370], v8);
  return MEMORY[0x227665754](v7, v9, v11);
}

void sub_220D77EF8()
{
  JUMPOUT(0x227665754);
}

id sub_220D77F08(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return (id)nullsub_1(*v2, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_220D77F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x227665754](&unk_220D9C1E8, a3);
  return sub_220D98FF8();
}

uint64_t sub_220D77F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x227665754](&unk_220D9C1E8, a3);
  return sub_220D98FC8();
}

void sub_220D77FE0(uint64_t a1)
{
  MEMORY[0x227665754](&unk_220D9C1E8, a1);
  sub_220D98FEC();
  __break(1u);
}

uint64_t PASFlowStepSendAuthResults.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C048);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v11 - v6;
  v11[0] = v0;
  v8 = sub_220D78120();
  sub_220D99178();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUISendAuthResultsView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  v9 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

unint64_t sub_220D78120()
{
  unint64_t result;

  result = qword_25564C050;
  if (!qword_25564C050)
  {
    result = MEMORY[0x227665754](&unk_220D9C30C, &type metadata for PASUISendAuthResultsView);
    atomic_store(result, &qword_25564C050);
  }
  return result;
}

uint64_t sub_220D78164()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C048);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v11 - v6;
  v11[0] = *v0;
  v8 = sub_220D78120();
  sub_220D99178();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUISendAuthResultsView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  v9 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

ValueMetadata *type metadata accessor for PASUISendAuthResultsView()
{
  return &type metadata for PASUISendAuthResultsView;
}

uint64_t sub_220D78288()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D78298@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = sub_220D98E00();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_220D9943C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain_n();
  sub_220D99424();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v6[*(int *)(v4 + 20)], v10, v7);
  *(_QWORD *)v6 = &unk_25564C060;
  *((_QWORD *)v6 + 1) = a1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564A918);
  sub_220D5CD14((uint64_t)v6, a2 + *(int *)(v11 + 36));
  *(_QWORD *)a2 = sub_220D5CC08;
  *(_QWORD *)(a2 + 8) = a1;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = sub_220D5C674;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = sub_220D5C6A4;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_BYTE *)(a2 + 80) = 1;
  *(_QWORD *)(a2 + 88) = MEMORY[0x24BEE4AF8];
  sub_220D5CD58();
  sub_220D5CD60((uint64_t)sub_220D5C674);
  sub_220D5CD60((uint64_t)sub_220D5C6A4);
  swift_bridgeObjectRetain();
  sub_220D5CD70((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_220D5CDAC();
  sub_220D5CDB4((uint64_t)sub_220D5C674);
  sub_220D5CDB4((uint64_t)sub_220D5C6A4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D78464()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_220D99418();
  v0[3] = sub_220D9940C();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_220D69344;
  return sub_220D98BE4();
}

uint64_t sub_220D784CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_220D78298(*v1, a1);
}

uint64_t sub_220D784D4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_220D5CCCC;
  return sub_220D78464();
}

id sub_220D78520()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = *(void **)(v0 + 24);
  if (v1)
  {
    v2 = *(id *)(v0 + 24);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1710]), sel_init);
    objc_msgSend(v3, sel_setSuspended_, 1);
    v4 = sub_220D785BC();
    objc_msgSend(v3, sel_setUnderlyingQueue_, v4);

    v5 = *(void **)(v0 + 24);
    *(_QWORD *)(v0 + 24) = v3;
    v2 = v3;

    v1 = 0;
  }
  v6 = v1;
  return v2;
}

id sub_220D785BC()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 32);
  if (v1)
  {
    v2 = *(id *)(v0 + 32);
  }
  else
  {
    v3 = (void *)sub_220D78614();
    v4 = *(void **)(v0 + 32);
    *(_QWORD *)(v0 + 32) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

uint64_t sub_220D78614()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_220D994A8();
  v8 = *(_QWORD *)(v0 - 8);
  v9 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_220D99490();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v3);
  v5 = sub_220D992EC();
  MEMORY[0x24BDAC7A8](v5);
  sub_220D73EBC(0, (unint64_t *)&qword_25564C900);
  v7 = sub_220D99694();
  sub_220D994B4();
  sub_220D992E0();
  v10 = MEMORY[0x24BEE4AF8];
  sub_220D5D7F4(&qword_25564C248, v4, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564C250);
  sub_220D7A254(&qword_25564C258, &qword_25564C250);
  sub_220D9952C();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v2, *MEMORY[0x24BEE5750], v9);
  return sub_220D994CC();
}

uint64_t sub_220D787F0()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 40))
  {
    v1 = *(_QWORD *)(v0 + 40);
  }
  else
  {
    type metadata accessor for PASUIExtensionHostProxy.InfoProvider();
    v1 = swift_allocObject();
    *(_QWORD *)(v0 + 40) = v1;
    swift_retain();
  }
  swift_unknownObjectRetain();
  return v1;
}

uint64_t PASUIExtensionHostProxy.deinit()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v2, sel_setInterruptionHandler_, 0);
    objc_msgSend(v2, sel_setInvalidationHandler_, 0);
    objc_msgSend(v2, sel_invalidate);

    v1 = *(void **)(v0 + 16);
  }

  swift_unknownObjectRelease();
  return v0;
}

uint64_t PASUIExtensionHostProxy.__deallocating_deinit()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v2, sel_setInterruptionHandler_, 0);
    objc_msgSend(v2, sel_setInvalidationHandler_, 0);
    objc_msgSend(v2, sel_invalidate);

    v1 = *(void **)(v0 + 16);
  }

  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

void sub_220D78950(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  char *v16;
  uint8_t *v17;
  uint8_t *v18;
  void (*v19)(char *, uint64_t);
  void *v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);

  v2 = v1;
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - v9;
  if (objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    v11 = sub_220D98C80();
    v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, v11, v4);
    v13 = sub_220D98C8C();
    v14 = sub_220D99454();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v27 = v12;
      v16 = v8;
      v17 = v15;
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_220D57000, v13, v14, "PASUIExtensionHostProxy connectToHost extension is accepting new connection from the host", v15, 2u);
      v18 = v17;
      v8 = v16;
      v12 = v27;
      MEMORY[0x2276657E4](v18, -1, -1);
    }

    v19 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19(v10, v4);
    sub_220D791C4();
    sub_220D78B94(a1);
    v20 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = a1;
    v21 = a1;

    objc_msgSend(v21, sel_activate);
    v12(v8, v11, v4);
    v22 = sub_220D98C8C();
    v23 = sub_220D99454();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_220D57000, v22, v23, "PASUIExtensionHostProxy connectToHost resuming queue for sending messages back to extension host", v24, 2u);
      MEMORY[0x2276657E4](v24, -1, -1);
    }

    v19(v8, v4);
    v25 = sub_220D78520();
    objc_msgSend(v25, sel_setSuspended_, 0);

  }
  else
  {
    __break(1u);
  }
}

void sub_220D78B94(void *a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_interfaceWithProtocol_, &unk_25565E9E8);
  objc_msgSend(a1, sel_setExportedInterface_, v3);

  objc_msgSend(a1, sel_setExportedObject_, sub_220D787F0());
  swift_unknownObjectRelease();
  v4 = objc_msgSend(v2, sel_interfaceWithProtocol_, &unk_255660708);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v4);

  v5 = swift_allocObject();
  swift_weakInit();
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  *(_QWORD *)(v7 + 24) = v6;
  v9[4] = sub_220D7A214;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_220D79A30;
  v9[3] = &block_descriptor_18_0;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v8);
  _Block_release(v8);
}

uint64_t sub_220D78D38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v3 = sub_220D992D4();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v19 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_220D992EC();
  v7 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2 + 16;
  sub_220D73EBC(0, (unint64_t *)&qword_25564C900);
  v11 = (void *)sub_220D994B4();
  v12 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v13 = swift_allocObject();
  swift_beginAccess();
  v14 = (void *)MEMORY[0x227665880](v10);
  swift_unknownObjectWeakInit();

  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v12;
  *(_QWORD *)(v15 + 24) = v13;
  aBlock[4] = sub_220D7A24C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_220D79A30;
  aBlock[3] = &block_descriptor_26;
  v16 = _Block_copy(aBlock);
  swift_release();
  sub_220D992E0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_220D5D7F4((unint64_t *)&qword_25564BEF8, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C910);
  sub_220D7A254((unint64_t *)&qword_25564BF00, (uint64_t *)&unk_25564C910);
  sub_220D9952C();
  MEMORY[0x227665088](0, v9, v6, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v18);
}

void sub_220D78FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _BYTE v19[24];

  v3 = sub_220D98C98();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v8 = Strong;
    swift_beginAccess();
    v9 = MEMORY[0x227665880](a2 + 16);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = *(void **)(v8 + 16);
      if (v11)
      {
        sub_220D73EBC(0, &qword_25564BF08);
        v12 = v10;
        v13 = v11;
        v14 = sub_220D994FC();

        if ((v14 & 1) != 0)
        {
          v15 = sub_220D98C80();
          (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
          v16 = sub_220D98C8C();
          v17 = sub_220D9946C();
          if (os_log_type_enabled(v16, v17))
          {
            v18 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v18 = 0;
            _os_log_impl(&dword_220D57000, v16, v17, "PASUIExtensionHostProxy configure.interruptionHandler connection from extension to host interrupted. Invalidating it.", v18, 2u);
            MEMORY[0x2276657E4](v18, -1, -1);
          }

          (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
          sub_220D791C4();
        }
        swift_release();

      }
      else
      {
        swift_release();

      }
    }
    else
    {
      swift_release();
    }
  }
}

void sub_220D791C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint8_t *v18;
  uint8_t *v19;
  void (*v20)(char *, uint64_t);
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  id v27;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v26 - v7;
  if (objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    v9 = *(void **)(v1 + 16);
    if (v9)
    {
      v10 = v9;
      v11 = sub_220D98C80();
      v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      v12(v8, v11, v2);
      v13 = sub_220D98C8C();
      v14 = sub_220D9946C();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        v27 = v10;
        v16 = v11;
        v17 = v12;
        v18 = v15;
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_220D57000, v13, v14, "PASUIExtensionHostProxy tearDownConnection extension received another host connection. Invalidating the first connection.", v15, 2u);
        v19 = v18;
        v12 = v17;
        v11 = v16;
        v10 = v27;
        MEMORY[0x2276657E4](v19, -1, -1);
      }

      v20 = *(void (**)(char *, uint64_t))(v3 + 8);
      v20(v8, v2);
      v21 = *(void **)(v1 + 16);
      *(_QWORD *)(v1 + 16) = 0;

      objc_msgSend(v10, sel_setInterruptionHandler_, 0);
      objc_msgSend(v10, sel_setInvalidationHandler_, 0);
      objc_msgSend(v10, sel_invalidate);
      v12(v6, v11, v2);
      v22 = sub_220D98C8C();
      v23 = sub_220D99454();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_220D57000, v22, v23, "PASUIExtensionHostProxy tearDownConnection suspending queue for sending messages back to extension host", v24, 2u);
        MEMORY[0x2276657E4](v24, -1, -1);
      }

      v20(v6, v2);
      v25 = sub_220D78520();
      objc_msgSend(v25, sel_setSuspended_, 1);

    }
  }
  else
  {
    __break(1u);
  }
}

void PASUIExtensionHostProxy.didPick(account:context:)(void *a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[6];

  v4 = sub_220D78520();
  v5 = swift_allocObject();
  swift_weakInit();
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v5;
  v6[3] = a1;
  v6[4] = a2;
  v10[4] = sub_220D79860;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_220D79A30;
  v10[3] = &block_descriptor_3;
  v7 = _Block_copy(v10);
  v8 = a1;
  v9 = a2;
  swift_release();
  objc_msgSend(v4, sel_addOperationWithBlock_, v7);
  _Block_release(v7);

}

uint64_t sub_220D79528()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_220D7954C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v9 = *(void **)(Strong + 16);
    if (v9)
    {
      v25 = v9;
      v10 = sub_220D98C80();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
      v11 = a2;
      v12 = sub_220D98C8C();
      v13 = sub_220D99454();
      if (os_log_type_enabled(v12, (os_log_type_t)v13))
      {
        v23 = v13;
        v14 = swift_slowAlloc();
        v24 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v14 = 141558274;
        v27 = 1752392040;
        sub_220D99508();
        *(_WORD *)(v14 + 12) = 2112;
        v15 = (uint64_t *)((char *)v11 + *MEMORY[0x24BE7B830]);
        v16 = v15[1];
        if (v16)
        {
          v21 = *v15;
          v22 = v14 + 14;
          sub_220D6E628();
          swift_allocError();
          *v17 = v21;
          v17[1] = v16;
          swift_bridgeObjectRetain();
          v16 = _swift_stdlib_bridgeErrorToNSError();
          v27 = v16;
        }
        else
        {
          v27 = 0;
        }
        sub_220D99508();
        v18 = v24;
        *v24 = v16;

        _os_log_impl(&dword_220D57000, v12, (os_log_type_t)v23, "PASUIExtensionHostProxy didPick informing host about picked account %{mask.hash}@", (uint8_t *)v14, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
        swift_arrayDestroy();
        MEMORY[0x2276657E4](v18, -1, -1);
        MEMORY[0x2276657E4](v14, -1, -1);
      }
      else
      {

        v12 = v11;
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v19 = v25;
      sub_220D79878((uint64_t)v11, v26, (uint64_t (*)(uint64_t))sub_220D7986C, 0);
      swift_release();

    }
    else
    {
      swift_release();
    }
  }
}

uint64_t sub_220D7982C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_220D79860()
{
  uint64_t v0;

  sub_220D7954C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_220D7986C(void *a1)
{
  return sub_220D79CD4(a1, "PASUIExtensionHostProxy didPick failed to inform host of picked account: %{public}@");
}

uint64_t sub_220D79878(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  uint64_t aBlock;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v22;

  v5 = v4;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = a4;
  v21 = sub_220D7A2F4;
  v22 = v10;
  v11 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v18 = 1107296256;
  v19 = sub_220D76398;
  v20 = &block_descriptor_42;
  v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  v13 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v12);
  _Block_release(v12);
  sub_220D99520();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564C260);
  swift_dynamicCast();
  swift_release();
  v21 = a3;
  v22 = a4;
  aBlock = v11;
  v18 = 1107296256;
  v19 = sub_220D87F74;
  v20 = &block_descriptor_45_0;
  v14 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v16, sel_extensionDidFinishWith_context_completion_, a1, a2, v14);
  _Block_release(v14);
  return swift_unknownObjectRelease();
}

uint64_t sub_220D79A30(uint64_t a1)
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

Swift::Void __swiftcall PASUIExtensionHostProxy.promptForFlowCancel()()
{
  id v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[6];

  v0 = sub_220D78520();
  v1 = swift_allocObject();
  swift_weakInit();
  v3[4] = sub_220D79CA0;
  v3[5] = v1;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 1107296256;
  v3[2] = sub_220D79A30;
  v3[3] = &block_descriptor_7_0;
  v2 = _Block_copy(v3);
  swift_release();
  objc_msgSend(v0, sel_addOperationWithBlock_, v2);
  _Block_release(v2);

}

void sub_220D79B34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t Strong;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;

  v0 = sub_220D98C98();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v5 = *(void **)(Strong + 16);
    if (v5)
    {
      v6 = v5;
      v7 = sub_220D98C80();
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v7, v0);
      v8 = sub_220D98C8C();
      v9 = sub_220D99454();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_220D57000, v8, v9, "PASUIExtensionHostProxy promptForFlowCancel", v10, 2u);
        MEMORY[0x2276657E4](v10, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      sub_220D79EC8((uint64_t (*)(uint64_t))sub_220D79CC8, 0);
      swift_release();

    }
    else
    {
      swift_release();
    }
  }
}

void sub_220D79CA0()
{
  sub_220D79B34();
}

uint64_t type metadata accessor for PASUIExtensionHostProxy()
{
  return objc_opt_self();
}

uint64_t sub_220D79CC8(void *a1)
{
  return sub_220D79CD4(a1, "PASUIExtensionHostProxy promptForFlowCancel failed: %{public}@");
}

uint64_t sub_220D79CD4(void *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  const char *v21;
  uint64_t v22;

  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v9 = a1;
    v10 = sub_220D98C80();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v10, v4);
    v11 = a1;
    v12 = a1;
    v13 = sub_220D98C8C();
    v14 = sub_220D9946C();
    if (os_log_type_enabled(v13, v14))
    {
      v21 = a2;
      v15 = (uint8_t *)swift_slowAlloc();
      v20 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v15 = 138543362;
      v16 = a1;
      v17 = _swift_stdlib_bridgeErrorToNSError();
      v22 = v17;
      sub_220D99508();
      v18 = v20;
      *v20 = v17;

      _os_log_impl(&dword_220D57000, v13, v14, v21, v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v18, -1, -1);
      MEMORY[0x2276657E4](v15, -1, -1);

    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t sub_220D79EC8(uint64_t (*a1)(uint64_t a1), uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  uint64_t aBlock;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;

  v3 = v2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v17 = sub_220D6D1E8;
  v18 = v6;
  v7 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v14 = 1107296256;
  v15 = sub_220D76398;
  v16 = &block_descriptor_32_0;
  v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  v9 = objc_msgSend(v3, sel_remoteObjectProxyWithErrorHandler_, v8);
  _Block_release(v8);
  sub_220D99520();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564C260);
  swift_dynamicCast();
  swift_release();
  v17 = a1;
  v18 = a2;
  aBlock = v7;
  v14 = 1107296256;
  v15 = sub_220D87F74;
  v16 = &block_descriptor_35;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_promptForFlowCancelWithCompletion_, v10);
  _Block_release(v10);
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for PASUIExtensionHostProxy.InfoProvider()
{
  return objc_opt_self();
}

uint64_t sub_220D7A0D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;

  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99454();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUIExtensionHostProxy hello received hello from host", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 16))(a1, 0);
}

uint64_t sub_220D7A1EC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D7A214()
{
  uint64_t v0;

  return sub_220D78D38(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t objectdestroy_14Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_220D7A24C()
{
  uint64_t v0;

  sub_220D78FE4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_220D7A254(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x227665754](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_220D7A294()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t PASFlowStepSendSignInResults.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  ValueMetadata *v15;
  unint64_t v16;
  uint64_t v17;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C268);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - v5;
  sub_220D7A470();
  swift_retain();
  v7 = sub_220D98E30();
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B7A0);
  swift_allocObject();
  v10 = sub_220D988B4();
  v15 = (ValueMetadata *)v7;
  v16 = v9;
  v17 = v10;
  v11 = sub_220D7A4B8();
  sub_220D99178();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v15 = &type metadata for PASUISendSignInResultsView;
  v16 = v11;
  swift_getOpaqueTypeConformance2();
  v12 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

unint64_t sub_220D7A470()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564C270;
  if (!qword_25564C270)
  {
    v1 = sub_220D98BF0();
    result = MEMORY[0x227665754](MEMORY[0x24BE7B4D8], v1);
    atomic_store(result, (unint64_t *)&qword_25564C270);
  }
  return result;
}

unint64_t sub_220D7A4B8()
{
  unint64_t result;

  result = qword_25564C278;
  if (!qword_25564C278)
  {
    result = MEMORY[0x227665754](&unk_220D9C42C, &type metadata for PASUISendSignInResultsView);
    atomic_store(result, (unint64_t *)&qword_25564C278);
  }
  return result;
}

uint64_t sub_220D7A4FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  ValueMetadata *v15;
  unint64_t v16;
  uint64_t v17;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C268);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - v5;
  sub_220D7A470();
  swift_retain();
  v7 = sub_220D98E30();
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B7A0);
  swift_allocObject();
  v10 = sub_220D988B4();
  v15 = (ValueMetadata *)v7;
  v16 = v9;
  v17 = v10;
  v11 = sub_220D7A4B8();
  sub_220D99178();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v15 = &type metadata for PASUISendSignInResultsView;
  v16 = v11;
  swift_getOpaqueTypeConformance2();
  v12 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

ValueMetadata *type metadata accessor for PASUISendSignInResultsView()
{
  return &type metadata for PASUISendSignInResultsView;
}

uint64_t sub_220D7A688()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_220D7A698(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;

  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  v9 = (_QWORD *)(a2 + *MEMORY[0x24BE7B908]);
  v10 = v9[3];
  v11 = v9[4];
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 80);
  swift_retain();
  swift_retain();
  v13 = v12(v10, v11);
  if (v14 >> 60 == 15)
  {
    v15 = 0;
  }
  else
  {
    v16 = v13;
    v17 = v14;
    v18 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    v19 = (void *)sub_220D9880C();
    v15 = objc_msgSend(v18, sel_initWithData_, v19);
    sub_220D73BAC(v16, v17);

  }
  *(_QWORD *)a4 = sub_220D7A898;
  *(_QWORD *)(a4 + 8) = v8;
  *(_QWORD *)(a4 + 16) = sub_220D6FCE0;
  *(_QWORD *)(a4 + 24) = 0;
  *(_BYTE *)(a4 + 32) = 1;
  *(_QWORD *)(a4 + 40) = v15;
  *(_QWORD *)(a4 + 48) = 0;
  v20 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a4 + 56) = 0;
  *(_QWORD *)(a4 + 64) = v20;
}

uint64_t sub_220D7A7D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = (_QWORD *)(a6 + *MEMORY[0x24BE7B908]);
  v7 = v6[3];
  v8 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v7, v8);
  v9 = sub_220D99388();
  swift_bridgeObjectRelease();
  return v9;
}

void sub_220D7A860(uint64_t a1@<X8>)
{
  uint64_t *v1;

  sub_220D7A698(*v1, v1[1], v1[2], a1);
}

uint64_t sub_220D7A86C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D7A898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_220D7A7D0(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_220D7A8A8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  id v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _OWORD v20[3];
  uint64_t v21;

  v8 = sub_220D9943C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D704BC(a3, (uint64_t)v20);
  v12 = swift_allocObject();
  v13 = v20[1];
  *(_OWORD *)(v12 + 16) = v20[0];
  *(_OWORD *)(v12 + 32) = v13;
  *(_OWORD *)(v12 + 48) = v20[2];
  *(_QWORD *)(v12 + 64) = v21;
  *(_QWORD *)(v12 + 72) = a1;
  v14 = a1;
  sub_220D99424();
  v15 = (char *)(a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25564C360) + 36));
  v16 = sub_220D98E00();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(&v15[*(int *)(v16 + 20)], v11, v8);
  *(_QWORD *)v15 = &unk_25564C358;
  *((_QWORD *)v15 + 1) = v12;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C340);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(a4, a2, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_220D7A9E8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  sub_220D99418();
  v2[4] = sub_220D9940C();
  v2[5] = sub_220D993F4();
  v2[6] = v3;
  return swift_task_switch();
}

uint64_t sub_220D7AA54()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t (*v8)(id);

  v1 = (_QWORD *)v0[2];
  v2 = v0[3];
  v3 = (int *)v1[5];
  v4 = *__swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0AE28]), sel_init);
  v0[7] = v5;
  objc_msgSend(v5, sel_setPresentingViewController_, v2);
  objc_msgSend(v5, sel_setDelegate_, v4);
  v8 = (uint64_t (*)(id))((char *)v3 + *v3);
  v6 = (_QWORD *)swift_task_alloc();
  v0[8] = v6;
  *v6 = v0;
  v6[1] = sub_220D7AB10;
  return v8(v5);
}

uint64_t sub_220D7AB10()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 56);
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_220D7AB60@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  uint64_t result;
  uint64_t v13;
  _QWORD v14[3];
  _OWORD v15[3];
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C340);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  sub_220D704BC(v2, (uint64_t)v15);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + v8, (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  v10 = v9 + ((v7 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  v11 = v15[1];
  *(_OWORD *)v10 = v15[0];
  *(_OWORD *)(v10 + 16) = v11;
  *(_OWORD *)(v10 + 32) = v15[2];
  *(_QWORD *)(v10 + 48) = v16;
  v14[0] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
  sub_220D6B694();
  result = sub_220D99238();
  v13 = v14[2];
  *a2 = v14[1];
  a2[1] = v13;
  a2[2] = sub_220D7BD90;
  a2[3] = v9;
  return result;
}

uint64_t type metadata accessor for PASUIAppleIDAuthContextProvider()
{
  return objc_opt_self();
}

uint64_t sub_220D7B03C(int a1, void *aBlock)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (__cdecl *v5)();

  *(_QWORD *)(v2 + 16) = _Block_copy(aBlock);
  v5 = (uint64_t (__cdecl *)())((char *)&dword_25564C338 + dword_25564C338);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_220D7B0A0;
  return v5();
}

uint64_t sub_220D7B0A0(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();
  if (v4)
  {
    v6 = *(void (***)(_QWORD, _QWORD))(v3 + 16);
    ((void (**)(_QWORD, void *))v6)[2](v6, a1);

    _Block_release(v6);
  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_220D7B11C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_220D7B150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_220D5DA1C;
  return ((uint64_t (*)(int, void *))((char *)&dword_25564C318 + dword_25564C318))(v2, v3);
}

uint64_t sub_220D7B1C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUIAppleIDAuthContextProvider contextDidPresentLoginAlertController", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  result = MEMORY[0x227665880](v10);
  if (result)
  {
    v12 = *(_QWORD *)(v10 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_220D7B300()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUIAppleIDAuthContextProvider contextWillDismissLoginAlertController", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  result = MEMORY[0x227665880](v10);
  if (result)
  {
    v12 = *(_QWORD *)(v10 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_220D7B43C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUIAppleIDAuthContextProvider contextDidDismissLoginAlertController", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  result = MEMORY[0x227665880](v10);
  if (result)
  {
    v12 = *(_QWORD *)(v10 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 24))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_220D7B578()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUIAppleIDAuthContextProvider contextWillBeginPresentingSecondaryUI", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  result = MEMORY[0x227665880](v10);
  if (result)
  {
    v12 = *(_QWORD *)(v10 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 32))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_220D7B6B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUIAppleIDAuthContextProvider contextDidEndPresentingSecondaryUI", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  result = MEMORY[0x227665880](v10);
  if (result)
  {
    v12 = *(_QWORD *)(v10 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 40))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_220D7B7F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_220D98C98();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_220D98C8C();
  v6 = sub_220D99484();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "PASUIAppleIDAuthContextProvider remoteUIStyle", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

uint64_t sub_220D7B8EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUIAppleIDAuthContextProvider willPresentModalNavigationController", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  result = MEMORY[0x227665880](v10);
  if (result)
  {
    v12 = *(_QWORD *)(v10 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 48))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_220D7BA28()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_220D98C98();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_220D7BA84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_220D98C8C();
  v6 = sub_220D99484();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "PASUIAppleIDAuthContextProvider signAdditionalHeaders", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }
  v9 = *(_QWORD *)(v0 + 24);
  v8 = *(_QWORD *)(v0 + 32);
  v10 = *(_QWORD *)(v0 + 16);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t destroy for AppleIDAuthContextViewModifier(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_release();
}

uint64_t initializeWithCopy for AppleIDAuthContextViewModifier(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for AppleIDAuthContextViewModifier(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AppleIDAuthContextViewModifier(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleIDAuthContextViewModifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleIDAuthContextViewModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleIDAuthContextViewModifier()
{
  return &type metadata for AppleIDAuthContextViewModifier;
}

uint64_t sub_220D7BCFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D7BD0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C340);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + v4);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D7BD90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C340) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_220D7A8A8(a1, v2 + v6, v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8), a2);
}

uint64_t sub_220D7BDF4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_220D7BE28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0 + 16;
  v3 = *(_QWORD *)(v0 + 72);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_220D5CCCC;
  return sub_220D7A9E8(v2, v3);
}

unint64_t sub_220D7BE80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564C368;
  if (!qword_25564C368)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_25564C370);
    result = MEMORY[0x227665754](&unk_220D9C158, v1);
    atomic_store(result, (unint64_t *)&qword_25564C368);
  }
  return result;
}

void sub_220D7BECC(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_220D7BF18(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_220D7BF98 + 4 * byte_220D9C574[a2]))(0x4179646165726C61);
}

uint64_t sub_220D7BF98(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x4179646165726C61 && v1 == 0xED00006576697463)
    v2 = 1;
  else
    v2 = sub_220D99604();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_220D7C058(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_220D7C0A4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_220D7C124 + 4 * byte_220D9C57C[a2]))(0x4179646165726C61);
}

uint64_t sub_220D7C124(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x4179646165726C61 && v1 == 0xED00006576697463)
    v2 = 1;
  else
    v2 = sub_220D99604();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_220D7C1E4(char a1, char a2)
{
  unint64_t v2;
  unint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x8000000220D9DF50;
  else
    v2 = 0x8000000220D9DF20;
  if ((a2 & 1) != 0)
    v3 = 0x8000000220D9DF50;
  else
    v3 = 0x8000000220D9DF20;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_220D99604();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

void sub_220D7C280(char a1)
{
  sub_220D99670();
  __asm { BR              X10 }
}

uint64_t sub_220D7C2D4()
{
  sub_220D993A0();
  swift_bridgeObjectRelease();
  return sub_220D99688();
}

void sub_220D7C360(char a1)
{
  sub_220D99670();
  __asm { BR              X10 }
}

uint64_t sub_220D7C3B4()
{
  sub_220D993A0();
  swift_bridgeObjectRelease();
  return sub_220D99688();
}

uint64_t sub_220D7C440()
{
  sub_220D99670();
  sub_220D993A0();
  swift_bridgeObjectRelease();
  return sub_220D99688();
}

void sub_220D7C4BC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_220D7C500()
{
  sub_220D993A0();
  return swift_bridgeObjectRelease();
}

void sub_220D7C578(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_220D7C5BC()
{
  sub_220D993A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D7C634()
{
  sub_220D99670();
  sub_220D993A0();
  swift_bridgeObjectRelease();
  return sub_220D99688();
}

void sub_220D7C6AC(uint64_t a1, char a2)
{
  sub_220D99670();
  __asm { BR              X10 }
}

uint64_t sub_220D7C6FC()
{
  sub_220D993A0();
  swift_bridgeObjectRelease();
  return sub_220D99688();
}

void sub_220D7C788(uint64_t a1, char a2)
{
  sub_220D99670();
  __asm { BR              X10 }
}

uint64_t sub_220D7C7D8()
{
  sub_220D993A0();
  swift_bridgeObjectRelease();
  return sub_220D99688();
}

uint64_t PASUISourceViewPresenterError.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_220D7C8A0 + 4 * byte_220D9C598[a1]))(0xD000000000000016, 0x8000000220D9DF00);
}

uint64_t sub_220D7C8A0()
{
  return 0x4179646165726C61;
}

uint64_t sub_220D7C8C4()
{
  return 0x636E614372657375;
}

uint64_t sub_220D7C8E8()
{
  return 0x7669746341746F6ELL;
}

void sub_220D7C904(char *a1)
{
  sub_220D7C058(*a1);
}

void sub_220D7C910()
{
  char *v0;

  sub_220D7C360(*v0);
}

void sub_220D7C918(uint64_t a1)
{
  char *v1;

  sub_220D7C578(a1, *v1);
}

void sub_220D7C920(uint64_t a1)
{
  char *v1;

  sub_220D7C6AC(a1, *v1);
}

uint64_t sub_220D7C928@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s23ProximityAppleIDSetupUI29PASUISourceViewPresenterErrorO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_220D7C954@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = PASUISourceViewPresenterError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_220D7C97C()
{
  sub_220D83638();
  return sub_220D98C50();
}

uint64_t sub_220D7C9A4()
{
  unsigned __int8 *v0;

  return *v0 + 1200;
}

uint64_t sub_220D7C9B0()
{
  sub_220D83638();
  return sub_220D98C5C();
}

uint64_t sub_220D7C9D8()
{
  sub_220D8316C();
  return sub_220D995EC();
}

uint64_t sub_220D7CA18()
{
  sub_220D83638();
  sub_220D8367C();
  return sub_220D98C68();
}

uint64_t sub_220D7CA54()
{
  sub_220D830E4();
  return sub_220D99628();
}

uint64_t sub_220D7CA7C()
{
  sub_220D830E4();
  return sub_220D9961C();
}

uint64_t PASUISourceViewPresenter.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  return MEMORY[0x227665880](v1);
}

uint64_t PASUISourceViewPresenter.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*PASUISourceViewPresenter.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x227665880](v5);
  return sub_220D60044;
}

uint64_t sub_220D7CC4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics;
  if (*(_QWORD *)(v0 + OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics);
  }
  else
  {
    v2 = sub_220D7CCB0(v0);
    *(_QWORD *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_220D7CCB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(uint64_t *__return_ptr, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t, unint64_t);
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_220D98854();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(uint64_t *__return_ptr, uint64_t))(**(_QWORD **)(a1
                                                                           + OBJC_IVAR___PASUIGuardianViewPresenter__analyticsProvider)
                                                             + 128);
  v7 = swift_retain();
  v6(&v20, v7);
  swift_release();
  v8 = v22;
  v9 = v23;
  __swift_project_boxed_opaque_existential_1(&v20, v22);
  v10 = (*(uint64_t (**)(ValueMetadata *, _UNKNOWN **, uint64_t, uint64_t))(v9 + 8))(&type metadata for PASUISourceViewPresenter.AnalyticsEvent, &off_24E6A33A0, v8, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  sub_220D98848();
  v11 = sub_220D9883C();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v14 = MEMORY[0x24BEE0D00];
  v15 = MEMORY[0x24BE7BA08];
  v22 = MEMORY[0x24BEE0D00];
  v23 = MEMORY[0x24BE7BA08];
  v20 = v11;
  v21 = v13;
  v16 = *(void (**)(uint64_t *, uint64_t, unint64_t))(*(_QWORD *)v10 + 192);
  v16(&v20, 0x6973736553534150, 0xED000079654B6E6FLL);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  v22 = v14;
  v23 = v15;
  v20 = 0x656372756F73;
  v21 = 0xE600000000000000;
  v16(&v20, 0xD000000000000014, 0x8000000220D9EE40);
  v17 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  (*(void (**)(uint64_t))(*(_QWORD *)v10 + 272))(v17);
  return v10;
}

id PASUISourceViewPresenter.__allocating_init(sharingViewController:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_220D82650(a1);

  return v4;
}

id PASUISourceViewPresenter.init(sharingViewController:)(void *a1)
{
  id v2;

  v2 = sub_220D82650(a1);

  return v2;
}

id PASUISourceViewPresenter.__allocating_init(parentViewController:flowController:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_220D82A54(a1, a2, a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v8;
}

id PASUISourceViewPresenter.init(parentViewController:flowController:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3;

  v3 = sub_220D82A54(a1, a2, a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v3;
}

id PASUISourceViewPresenter.__deallocating_deinit()
{
  void *v0;
  void *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  objc_class *v15;
  uint8_t *v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v23;
  void *v24;
  objc_super v25;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_220D98C98();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v23 - v8;
  v10 = sub_220D98C80();
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v10, v3);
  v12 = sub_220D98C8C();
  v13 = sub_220D99484();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v24 = v1;
    v15 = ObjectType;
    v16 = v14;
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_220D57000, v12, v13, "PASUISourceViewPresenter deinit", v14, 2u);
    v17 = v16;
    ObjectType = v15;
    v1 = v24;
    MEMORY[0x2276657E4](v17, -1, -1);
  }

  v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  v18(v9, v3);
  sub_220D988E4();
  swift_retain();
  sub_220D988C0();
  swift_release();
  v11(v7, v10, v3);
  v19 = sub_220D98C8C();
  v20 = sub_220D99484();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_220D57000, v19, v20, "PAS=== Goodbye ===PAS", v21, 2u);
    MEMORY[0x2276657E4](v21, -1, -1);
  }

  v18(v7, v3);
  v25.receiver = v1;
  v25.super_class = ObjectType;
  return objc_msgSendSuper2(&v25, sel_dealloc);
}

uint64_t PASUISourceViewPresenter.activate(withTemplate:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_220D98C98();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  sub_220D99418();
  v2[19] = sub_220D9940C();
  v2[20] = sub_220D993F4();
  v2[21] = v4;
  return swift_task_switch();
}

uint64_t sub_220D7D324()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD *, uint64_t, uint64_t);

  v1 = (void *)v0[14];
  v2 = *(void (**)(uint64_t))(**(_QWORD **)(v0[15]
                                                    + OBJC_IVAR___PASUIGuardianViewPresenter__messageSessionProvider)
                                      + 128);
  v3 = swift_retain();
  v2(v3);
  swift_release();
  v4 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v6 = sub_220D73EBC(0, &qword_25564AC38);
  v7 = MEMORY[0x24BE7BA30];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  v11 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))(**(int **)(v5 + 24) + *(_QWORD *)(v5 + 24));
  v8 = v1;
  v9 = (_QWORD *)swift_task_alloc();
  v0[22] = v9;
  *v9 = v0;
  v9[1] = sub_220D7D414;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_220D7D414()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

uint64_t sub_220D7D480()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v1;
  *v1 = v0;
  v1[1] = sub_220D7D4D0;
  return sub_220D7D798();
}

uint64_t sub_220D7D4D0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D7D528()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 200));
}

uint64_t sub_220D7D564()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = (void *)v0[23];
  v3 = v0[17];
  v2 = v0[18];
  v4 = v0[16];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v5 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_220D98C8C();
  v9 = sub_220D9946C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (void *)v0[23];
    v11 = v0[17];
    v23 = v0[16];
    v24 = v0[18];
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136446210;
    v25 = v13;
    v0[12] = v10;
    v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
    v15 = sub_220D99370();
    v0[13] = sub_220D6593C(v15, v16, &v25);
    sub_220D99508();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220D57000, v8, v9, "Failed to activate PASUISourceViewPresenter with message session: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v13, -1, -1);
    MEMORY[0x2276657E4](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v24, v23);
  }
  else
  {
    v17 = (void *)v0[23];
    v19 = v0[17];
    v18 = v0[18];
    v20 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  v21 = (_QWORD *)swift_task_alloc();
  v0[24] = v21;
  *v21 = v0;
  v21[1] = sub_220D7D4D0;
  return sub_220D7D798();
}

uint64_t sub_220D7D798()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[10] = v0;
  v2 = sub_220D98C98();
  v1[11] = v2;
  v1[12] = *(_QWORD *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  sub_220D99418();
  v1[15] = sub_220D9940C();
  v1[16] = sub_220D993F4();
  v1[17] = v3;
  return swift_task_switch();
}

uint64_t sub_220D7D83C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = sub_220D7CC4C();
  *(_BYTE *)(v0 + 200) = 0;
  *(_QWORD *)(v0 + 144) = v1;
  v4 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 232) + *(_QWORD *)(*(_QWORD *)v1 + 232));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v2;
  *v2 = v0;
  v2[1] = sub_220D7D8B4;
  return v4(v0 + 200);
}

uint64_t sub_220D7D8B4()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_220D7D908()
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
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  void (*v20)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v21;
  id v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t (*v29)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 80);
  v2 = sub_220D7CC4C();
  *(_BYTE *)(v0 + 201) = 1;
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 264))();
  swift_release();
  *(_QWORD *)(v1 + OBJC_IVAR___PASUIGuardianViewPresenter_flowTimer) = v3;
  swift_release();
  v4 = v1 + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  v5 = MEMORY[0x227665880](v4);
  swift_unknownObjectRelease();
  if (!v5)
  {
    v6 = *(_QWORD *)(v0 + 112);
    v7 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 96);
    v9 = sub_220D98C80();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v9, v7);
    v10 = sub_220D98C8C();
    v11 = sub_220D99478();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_220D57000, v10, v11, "PASUISourceViewPresenter delegate is nil in activate", v12, 2u);
      MEMORY[0x2276657E4](v12, -1, -1);
    }
    v13 = *(_QWORD *)(v0 + 112);
    v14 = *(_QWORD *)(v0 + 88);
    v15 = *(_QWORD *)(v0 + 96);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  v16 = *(_QWORD *)(v0 + 80);
  v17 = v16 + OBJC_IVAR___PASUIGuardianViewPresenter_flowController;
  *(_QWORD *)(v0 + 160) = *(_QWORD *)(v16 + OBJC_IVAR___PASUIGuardianViewPresenter_flowController);
  v18 = *(_QWORD *)(v17 + 8);
  *(_QWORD *)(v0 + 168) = v18;
  ObjectType = swift_getObjectType();
  *(_QWORD *)(v0 + 176) = ObjectType;
  v20 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v18 + 24);
  v21 = swift_unknownObjectRetain();
  v20(v21, &protocol witness table for PASUISourceViewPresenter, ObjectType, v18);
  v22 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v16
                                                              + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController), sel_viewController));
  *(_QWORD *)(v0 + 184) = v22;
  v23 = *(void (**)(uint64_t))(**(_QWORD **)(v16
                                                     + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                       + 128);
  v24 = swift_retain();
  v23(v24);
  swift_release();
  v25 = *(_QWORD *)(v0 + 40);
  v26 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v25);
  (*(void (**)(id, uint64_t, uint64_t))(v26 + 24))(v22, v25, v26);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v29 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v18 + 40) + *(_QWORD *)(v18 + 40));
  v27 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v27;
  *v27 = v0;
  v27[1] = sub_220D7DB84;
  return v29(ObjectType, v18);
}

uint64_t sub_220D7DB84()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D7DBD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(v0 + 168);
  v1 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 88);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 64))(v1, v2);
  (*(void (**)(void))(v2 + 56))();
  swift_unknownObjectRelease();
  v6 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUISourceViewPresenter activated", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }
  v10 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 96);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 184));
}

uint64_t sub_220D7DE38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_220D99418();
  v3[5] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D7DEA8()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = (void *)v0[4];
  v3 = (void *)v0[2];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = (uint64_t)_Block_copy(v2);
  v4 = v3;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_220D6196C;
  return PASUISourceViewPresenter.activate(withTemplate:)(v0[2]);
}

uint64_t sub_220D7DF24()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[5] = v0;
  v2 = sub_220D98C98();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  sub_220D99418();
  v1[10] = sub_220D9940C();
  v1[11] = sub_220D993F4();
  v1[12] = v3;
  return swift_task_switch();
}

uint64_t sub_220D7DFC8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v1 = v0[9];
  v2 = v0[6];
  v3 = v0[7];
  v4 = sub_220D98C80();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  v6 = sub_220D98C8C();
  v7 = sub_220D99484();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_220D57000, v6, v7, "PASUISourceViewPresenter flowDidReset", v8, 2u);
    MEMORY[0x2276657E4](v8, -1, -1);
  }
  v9 = v0[9];
  v10 = v0[6];
  v11 = v0[7];
  v12 = v0[5];

  v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v13(v9, v10);
  v14 = v12 + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  v15 = MEMORY[0x227665880](v14);
  swift_unknownObjectRelease();
  if (!v15)
  {
    v5(v0[8], v4, v0[6]);
    v16 = sub_220D98C8C();
    v17 = sub_220D99478();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_220D57000, v16, v17, "PASUISourceViewPresenter delegate is nil in flowDidReset", v18, 2u);
      MEMORY[0x2276657E4](v18, -1, -1);
    }
    v19 = v0[8];
    v20 = v0[6];

    v13(v19, v20);
  }
  v21 = (_QWORD *)swift_task_alloc();
  v0[13] = v21;
  *v21 = v0;
  v21[1] = sub_220D7E1A0;
  return sub_220D7E288();
}

uint64_t sub_220D7E1A0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D7E1EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  v2 = *(_QWORD *)(v1 + OBJC_IVAR___PASUIGuardianViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v2 + 64))(ObjectType, v2);
  (*(void (**)(void))(v2 + 56))();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D7E288()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[7] = v0;
  v2 = sub_220D98C98();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = sub_220D99418();
  v1[13] = sub_220D9940C();
  v1[14] = sub_220D993F4();
  v1[15] = v3;
  return swift_task_switch();
}

uint64_t sub_220D7E330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  void *v20;
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  id v24;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = sub_220D98C80();
  *(_QWORD *)(v0 + 128) = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 136) = v5;
  v5(v1, v4, v2);
  v6 = sub_220D98C8C();
  v7 = sub_220D99460();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_220D57000, v6, v7, "PASUISourceViewPresenter dismissPresentedViewController if exists", v8, 2u);
    MEMORY[0x2276657E4](v8, -1, -1);
  }
  v9 = *(_QWORD *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_QWORD *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 56);

  v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  *(_QWORD *)(v0 + 144) = v13;
  v13(v9, v10);
  v14 = *(void **)(v12 + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController);
  *(_QWORD *)(v0 + 152) = v14;
  v15 = objc_msgSend(v14, sel_viewController);
  v16 = objc_msgSend(v15, sel_presentedViewController);
  *(_QWORD *)(v0 + 160) = v16;

  if (v16)
  {
    *(_QWORD *)(v0 + 168) = sub_220D9940C();
    v17 = swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v17;
    *(_QWORD *)(v17 + 16) = v16;
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v18;
    *v18 = v0;
    v18[1] = sub_220D7E5AC;
    return sub_220D995F8();
  }
  else
  {
    swift_release();
    v20 = *(void **)(v0 + 152);
    v21 = *(void (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v0 + 56)
                                                       + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                         + 128);
    v22 = swift_retain();
    v21(v22);
    swift_release();
    v23 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    v24 = objc_msgSend(v20, sel_viewController);
    (*(void (**)(void))(v23 + 24))();

    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_220D7E5AC()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D7E614()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  id v15;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 64);
  swift_release();
  v2(v3, v1, v4);
  v5 = sub_220D98C8C();
  v6 = sub_220D99460();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "PASUISourceViewPresenter dismissed presentedViewController for card", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  v9 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 64);

  v8(v9, v10);
  v11 = *(void **)(v0 + 152);
  v12 = *(void (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v0 + 56)
                                                     + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                       + 128);
  v13 = swift_retain();
  v12(v13);
  swift_release();
  v14 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v15 = objc_msgSend(v11, sel_viewController);
  (*(void (**)(void))(v14 + 24))();

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _s23ProximityAppleIDSetupUI24PASUISourceViewPresenterC12handleCancelyyF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  _BYTE v28[56];
  _QWORD v29[6];
  char v30;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v28[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v28[-v7 - 8];
  v9 = sub_220D98C80();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  v11 = sub_220D98C8C();
  v12 = sub_220D99484();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_220D57000, v11, v12, "PASUISourceViewPresenter flowDidCancel", v13, 2u);
    MEMORY[0x2276657E4](v13, -1, -1);
  }

  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v8, v2);
  v15 = v1 + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  v16 = MEMORY[0x227665880](v15);
  swift_unknownObjectRelease();
  if (!v16)
  {
    v10(v6, v9, v2);
    v17 = sub_220D98C8C();
    v18 = sub_220D99478();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_220D57000, v17, v18, "PASUISourceViewPresenter delegate is nil in flowDidCancel", v19, 2u);
      MEMORY[0x2276657E4](v19, -1, -1);
    }

    v14(v6, v2);
  }
  sub_220D66C14();
  v20 = swift_allocError();
  *v21 = 3;
  v29[0] = v20;
  v30 = 1;
  v22 = MEMORY[0x227665880](v15);
  if (v22)
  {
    v23 = (void *)v22;
    sub_220D82ECC((uint64_t)v29, (uint64_t)v28);
    v24 = objc_allocWithZone((Class)sub_220D98ADC());
    v25 = (void *)sub_220D98AD0();
    objc_msgSend(v23, sel_proximitySetupCompletedWithResult_, v25);
    swift_unknownObjectRelease();

  }
  return sub_220D5D018((uint64_t)v29, &qword_25564C3C0);
}

uint64_t PASUISourceViewPresenter.setTemplate(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_220D98C98();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  sub_220D99418();
  v2[19] = sub_220D9940C();
  v2[20] = sub_220D993F4();
  v2[21] = v4;
  return swift_task_switch();
}

uint64_t sub_220D7EABC()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD *, uint64_t, uint64_t);

  v1 = (void *)v0[14];
  v2 = *(void (**)(uint64_t))(**(_QWORD **)(v0[15]
                                                    + OBJC_IVAR___PASUIGuardianViewPresenter__messageSessionProvider)
                                      + 128);
  v3 = swift_retain();
  v2(v3);
  swift_release();
  v4 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v6 = sub_220D73EBC(0, &qword_25564AC38);
  v7 = MEMORY[0x24BE7BA30];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  v11 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))(**(int **)(v5 + 24) + *(_QWORD *)(v5 + 24));
  v8 = v1;
  v9 = (_QWORD *)swift_task_alloc();
  v0[22] = v9;
  *v9 = v0;
  v9[1] = sub_220D7EBAC;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_220D7EBAC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

uint64_t sub_220D7EC18()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(void **)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v5 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  v6 = v1;
  v7 = v1;
  v8 = sub_220D98C8C();
  v9 = sub_220D9946C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 184);
    v11 = *(_QWORD *)(v0 + 136);
    v22 = *(_QWORD *)(v0 + 128);
    v23 = *(_QWORD *)(v0 + 144);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136446210;
    v24 = v13;
    *(_QWORD *)(v0 + 96) = v10;
    v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
    v15 = sub_220D99370();
    *(_QWORD *)(v0 + 104) = sub_220D6593C(v15, v16, &v24);
    sub_220D99508();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220D57000, v8, v9, "Failed to set PASUISourceViewPresenter message session: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v13, -1, -1);
    MEMORY[0x2276657E4](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v23, v22);
  }
  else
  {
    v17 = *(void **)(v0 + 184);
    v19 = *(_QWORD *)(v0 + 136);
    v18 = *(_QWORD *)(v0 + 144);
    v20 = *(_QWORD *)(v0 + 128);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D7EF6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_220D99418();
  v3[5] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D7EFDC()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = (void *)v0[4];
  v3 = (void *)v0[2];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = (uint64_t)_Block_copy(v2);
  v4 = v3;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_220D63304;
  return PASUISourceViewPresenter.setTemplate(_:)(v0[2]);
}

void sub_220D7F058()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;

  v1 = sub_220D9901C();
  MEMORY[0x24BDAC7A8](v1);
  v43 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController);
  v3 = objc_msgSend(v2, sel_mainView);
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    swift_unknownObjectRetain();
    v6 = objc_msgSend(v5, sel_subviews);
    sub_220D73EBC(0, &qword_25564C580);
    v7 = sub_220D993D0();

    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = sub_220D995B0();
      if (v8)
        goto LABEL_4;
    }
    else
    {
      v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_4:
        if (v8 < 1)
        {
          __break(1u);
LABEL_19:
          __break(1u);
          return;
        }
        for (i = 0; i != v8; ++i)
        {
          if ((v7 & 0xC000000000000001) != 0)
            v10 = (id)MEMORY[0x227665148](i, v7);
          else
            v10 = *(id *)(v7 + 8 * i + 32);
          v11 = v10;
          objc_msgSend(v10, sel_removeFromSuperview);

        }
      }
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  v12 = OBJC_IVAR___PASUIGuardianViewPresenter_cardContentView;
  v13 = *(void **)(v0 + OBJC_IVAR___PASUIGuardianViewPresenter_cardContentView);
  if (v13)
    objc_msgSend(v13, sel_removeFromSuperview);
  v14 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25564B170));
  swift_retain();
  v15 = (void *)sub_220D98F44();
  sub_220D99010();
  sub_220D98F38();
  v16 = objc_msgSend(v15, sel_view);
  if (!v16)
    goto LABEL_19;
  v17 = v16;
  objc_msgSend(v2, sel_addChildViewController_, v15);
  objc_msgSend(v3, sel_addSubview_, v17);
  objc_opt_self();
  v18 = swift_dynamicCastObjCClass();
  if (v18)
    objc_msgSend(v15, sel_didMoveToParentViewController_, v18);
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v42 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564D460);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_220D9C8F0;
  v20 = objc_msgSend(v17, sel_topAnchor);
  v21 = objc_msgSend(v3, sel_mainContentGuide);
  v22 = objc_msgSend(v21, sel_topAnchor);

  v23 = objc_msgSend(v20, sel_constraintGreaterThanOrEqualToAnchor_, v22);
  *(_QWORD *)(v19 + 32) = v23;
  v24 = objc_msgSend(v17, sel_bottomAnchor);
  v25 = objc_msgSend(v3, sel_mainContentGuide);
  v26 = objc_msgSend(v25, sel_bottomAnchor);

  v27 = objc_msgSend(v24, sel_constraintLessThanOrEqualToAnchor_, v26);
  *(_QWORD *)(v19 + 40) = v27;
  v28 = objc_msgSend(v17, sel_leadingAnchor);
  v29 = objc_msgSend(v3, sel_mainContentGuide);
  v30 = objc_msgSend(v29, sel_leadingAnchor);

  v31 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v30);
  *(_QWORD *)(v19 + 48) = v31;
  v32 = objc_msgSend(v17, sel_trailingAnchor);
  v33 = objc_msgSend(v3, sel_mainContentGuide);
  v34 = objc_msgSend(v33, sel_trailingAnchor);

  v35 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v34);
  *(_QWORD *)(v19 + 56) = v35;
  v36 = objc_msgSend(v17, sel_centerYAnchor);
  v37 = objc_msgSend(v3, sel_mainContentGuide);
  v38 = objc_msgSend(v37, sel_centerYAnchor);

  v39 = objc_msgSend(v36, sel_constraintEqualToAnchor_, v38);
  *(_QWORD *)(v19 + 64) = v39;
  sub_220D993E8();
  sub_220D73EBC(0, (unint64_t *)&qword_25564AE08);
  v40 = (void *)sub_220D993C4();
  swift_bridgeObjectRelease();
  objc_msgSend(v42, sel_activateConstraints_, v40);

  swift_unknownObjectRelease();
  v41 = *(void **)(v43 + v12);
  *(_QWORD *)(v43 + v12) = v17;

}

id PASUISourceViewPresenter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PASUISourceViewPresenter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t PASUISourceViewPresenter.present(step:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD v28[2];
  void *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_220D98C98();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  swift_unknownObjectRetain_n();
  v14 = sub_220D98C8C();
  v15 = sub_220D99484();
  if (os_log_type_enabled(v14, v15))
  {
    v31 = a2;
    v16 = swift_slowAlloc();
    v30 = v8;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v29 = v3;
    *(_DWORD *)v17 = 136446210;
    v28[1] = v17 + 4;
    v32 = a1;
    v33 = v31;
    v34 = v18;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC90);
    v19 = sub_220D99370();
    v32 = sub_220D6593C(v19, v20, &v34);
    v3 = v29;
    sub_220D99508();
    a2 = v31;
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_220D57000, v14, v15, "PASUISourceViewPresenter present step %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v18, -1, -1);
    v21 = v17;
    v8 = v30;
    MEMORY[0x2276657E4](v21, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v22 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v8, 1, 1, v22);
  sub_220D99418();
  swift_unknownObjectRetain();
  v23 = v3;
  v24 = sub_220D9940C();
  v25 = (_QWORD *)swift_allocObject();
  v26 = MEMORY[0x24BEE6930];
  v25[2] = v24;
  v25[3] = v26;
  v25[4] = v23;
  v25[5] = a1;
  v25[6] = a2;
  sub_220D5F9A8((uint64_t)v8, (uint64_t)&unk_25564C3B0, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_220D7F94C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[62] = a5;
  v6[63] = a6;
  v6[61] = a4;
  v7 = sub_220D98C98();
  v6[64] = v7;
  v6[65] = *(_QWORD *)(v7 - 8);
  v6[66] = swift_task_alloc();
  v6[67] = swift_task_alloc();
  v6[68] = swift_task_alloc();
  sub_220D99418();
  v6[69] = sub_220D9940C();
  v6[70] = sub_220D993F4();
  v6[71] = v8;
  return swift_task_switch();
}

uint64_t sub_220D7FA04()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t ObjectType;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0[61] + OBJC_IVAR___PASUIGuardianViewPresenter_flowController + 8);
  ObjectType = swift_getObjectType();
  v5 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v1 + 48) + *(_QWORD *)(v1 + 48));
  v3 = (_QWORD *)swift_task_alloc();
  v0[72] = v3;
  *v3 = v0;
  v3[1] = sub_220D7FA90;
  return v5(v0[62], v0[63], ObjectType, v1);
}

uint64_t sub_220D7FA90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 584) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D7FAF4()
{
  uint64_t v0;
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint8_t *v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t v44;

  *(_OWORD *)(v0 + 424) = *(_OWORD *)(v0 + 496);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564C558);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v1 = (__int128 *)(v0 + 16);
    v2 = *(_QWORD *)(v0 + 544);
    v3 = *(_QWORD *)(v0 + 520);
    sub_220D6AFB0((__int128 *)(v0 + 264), v0 + 184);
    v4 = sub_220D98C80();
    v5 = *(void (**)(uint64_t))(v3 + 16);
    v41 = v4;
    v5(v2);
    sub_220D66810(v0 + 184, v0 + 304);
    v6 = sub_220D98C8C();
    v7 = sub_220D99460();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(_QWORD *)(v0 + 544);
    v10 = *(_QWORD *)(v0 + 512);
    v43 = (void (*)(uint64_t, uint64_t, uint64_t))v5;
    if (v8)
    {
      v40 = *(_QWORD *)(v0 + 520);
      v11 = (uint8_t *)swift_slowAlloc();
      v39 = v10;
      v12 = swift_slowAlloc();
      v44 = v12;
      *(_DWORD *)v11 = 136446210;
      sub_220D66810(v0 + 304, v0 + 64);
      v13 = sub_220D99370();
      *(_QWORD *)(v0 + 480) = sub_220D6593C(v13, v14, &v44);
      sub_220D99508();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 304);
      _os_log_impl(&dword_220D57000, v6, v7, "PASUISourceViewPresenter has viewBuilder: %{public}s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v12, -1, -1);
      v15 = v11;
      v1 = (__int128 *)(v0 + 16);
      MEMORY[0x2276657E4](v15, -1, -1);

      v16 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
      v16(v9, v39);
    }
    else
    {
      v18 = *(_QWORD *)(v0 + 520);
      __swift_destroy_boxed_opaque_existential_1(v0 + 304);

      v16 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
      v16(v9, v10);
    }
    v19 = *(_QWORD *)(v0 + 208);
    v20 = *(_QWORD *)(v0 + 216);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 184), v19);
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v19, v20);
    if (*(_BYTE *)(v0 + 56) == 1)
    {
      v21 = *(_BYTE *)(v0 + 16);
      v23 = *(_QWORD *)(v0 + 208);
      v22 = *(_QWORD *)(v0 + 216);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 184), v23);
      *(_QWORD *)(v0 + 464) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v22 + 8) + 8))(v23);
      v24 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25564B170));
      v25 = sub_220D98F44();
      *(_QWORD *)(v0 + 592) = v25;
      v26 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 600) = v26;
      *v26 = v0;
      v26[1] = sub_220D80038;
      return sub_220D806B0(v25, v21);
    }
    else
    {
      v27 = *(_QWORD *)(v0 + 536);
      v28 = *(_QWORD *)(v0 + 512);
      sub_220D6AFB0(v1, v0 + 344);
      v43(v27, v41, v28);
      sub_220D66810(v0 + 344, v0 + 144);
      v29 = sub_220D98C8C();
      v30 = sub_220D99460();
      v31 = os_log_type_enabled(v29, v30);
      v32 = *(_QWORD *)(v0 + 536);
      v33 = *(_QWORD *)(v0 + 512);
      if (v31)
      {
        v34 = (uint8_t *)swift_slowAlloc();
        v42 = v16;
        v35 = swift_slowAlloc();
        v44 = v35;
        *(_DWORD *)v34 = 136446210;
        sub_220D66810(v0 + 144, v0 + 104);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25564C570);
        v36 = sub_220D99370();
        *(_QWORD *)(v0 + 456) = sub_220D6593C(v36, v37, &v44);
        sub_220D99508();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 144);
        _os_log_impl(&dword_220D57000, v29, v30, "PASUISourceViewPresenter viewBuilder presents card %{public}s", v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276657E4](v35, -1, -1);
        MEMORY[0x2276657E4](v34, -1, -1);

        v42(v32, v33);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1(v0 + 144);

        v16(v32, v33);
      }
      v38 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 608) = v38;
      *v38 = v0;
      v38[1] = sub_220D800EC;
      return sub_220D7E288();
    }
  }
  else
  {
    *(_OWORD *)(v0 + 264) = 0u;
    *(_OWORD *)(v0 + 280) = 0u;
    *(_QWORD *)(v0 + 296) = 0;
    swift_release();
    sub_220D5D018(v0 + 264, &qword_25564C560);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_220D80038()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 592);
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_220D80090()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D800EC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_220D8013C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 488);
  swift_release();
  v3 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 216);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 184), v3);
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 8))(v3);
  sub_220D7F058();
  swift_release();
  v4 = *(void **)(v1 + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController);
  objc_msgSend(v4, sel_setTitle_, 0);
  objc_msgSend(v4, sel_setSubtitle_, 0);
  objc_msgSend(v4, sel_setAttributedSubtitle_, 0);
  objc_msgSend(v4, sel_setDismissalType_, 1);
  objc_msgSend(v4, sel_setActivityStatusWithText_, 0);
  v5 = objc_msgSend(v4, sel_actions);
  sub_220D73EBC(0, &qword_25564C568);
  v6 = sub_220D993D0();

  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
      goto LABEL_3;
LABEL_10:
    v11 = *(_QWORD *)(v0 + 488);
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v0 + 368);
    v13 = *(_QWORD *)(v0 + 376);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 344), v12);
    (*(void (**)(void *, uint64_t, uint64_t))(v13 + 8))(v4, v12, v13);
    sub_220D66810(v0 + 344, v0 + 224);
    v14 = v11 + OBJC_IVAR___PASUIGuardianViewPresenter_cardAdapter;
    swift_beginAccess();
    sub_220D8389C(v0 + 224, v14);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1(v0 + 344);
    __swift_destroy_boxed_opaque_existential_1(v0 + 184);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  swift_bridgeObjectRetain();
  v7 = sub_220D995B0();
  swift_bridgeObjectRelease();
  if (!v7)
    goto LABEL_10;
LABEL_3:
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x227665148](i, v6);
      else
        v9 = *(id *)(v6 + 8 * i + 32);
      v10 = v9;
      objc_msgSend(v4, sel_removeAction_, v9);

    }
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_220D803D0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = *(void **)(v0 + 584);
  v2 = *(_QWORD *)(v0 + 528);
  v3 = *(_QWORD *)(v0 + 520);
  v4 = *(_QWORD *)(v0 + 512);
  swift_release();
  v5 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_unknownObjectRetain();
  v6 = v1;
  swift_unknownObjectRetain();
  v7 = v1;
  v8 = sub_220D98C8C();
  v9 = sub_220D99484();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 584);
    v24 = *(_QWORD *)(v0 + 520);
    v25 = *(_QWORD *)(v0 + 512);
    v26 = *(_QWORD *)(v0 + 528);
    v23 = *(_OWORD *)(v0 + 496);
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v27 = v12;
    *(_DWORD *)v11 = 136446466;
    *(_OWORD *)(v0 + 408) = v23;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC90);
    v13 = sub_220D99370();
    *(_QWORD *)(v0 + 472) = sub_220D6593C(v13, v14, &v27);
    sub_220D99508();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2082;
    *(_QWORD *)(v0 + 448) = v10;
    v15 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
    v16 = sub_220D99370();
    *(_QWORD *)(v0 + 440) = sub_220D6593C(v16, v17, &v27);
    sub_220D99508();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220D57000, v8, v9, "PASUISourceViewPresenter did not present %{public}s.\n%{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v12, -1, -1);
    MEMORY[0x2276657E4](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    v18 = *(void **)(v0 + 584);
    v19 = *(_QWORD *)(v0 + 528);
    v20 = *(_QWORD *)(v0 + 520);
    v21 = *(_QWORD *)(v0 + 512);

    swift_unknownObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D806B0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 + 168) = a2;
  *(_QWORD *)(v3 + 56) = a1;
  *(_QWORD *)(v3 + 64) = v2;
  v4 = sub_220D98C98();
  *(_QWORD *)(v3 + 72) = v4;
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 88) = swift_task_alloc();
  *(_QWORD *)(v3 + 96) = swift_task_alloc();
  *(_QWORD *)(v3 + 104) = swift_task_alloc();
  *(_QWORD *)(v3 + 112) = swift_task_alloc();
  sub_220D99418();
  *(_QWORD *)(v3 + 120) = sub_220D9940C();
  *(_QWORD *)(v3 + 128) = sub_220D993F4();
  *(_QWORD *)(v3 + 136) = v5;
  return swift_task_switch();
}

uint64_t sub_220D80770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t (*v13)();
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  if (*(_BYTE *)(v0 + 168) != 1)
  {
    v14 = *(void **)(*(_QWORD *)(v0 + 64) + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController);
    *(_QWORD *)(v0 + 152) = v14;
    v15 = objc_msgSend(v14, sel_viewController);
    v16 = objc_msgSend(v15, sel_presentedViewController);

    if (v16)
    {
      objc_opt_self();
      v17 = swift_dynamicCastObjCClass();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = *(_QWORD *)(v0 + 104);
        v20 = *(_QWORD *)(v0 + 72);
        v21 = *(_QWORD *)(v0 + 80);
        swift_release();
        v22 = sub_220D98C80();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v22, v20);
        v23 = sub_220D98C8C();
        v24 = sub_220D99460();
        if (os_log_type_enabled(v23, v24))
        {
          v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_220D57000, v23, v24, "PASUISourceViewPresenter reusing modal nav controller", v25, 2u);
          MEMORY[0x2276657E4](v25, -1, -1);
        }
        v26 = *(_QWORD *)(v0 + 104);
        v27 = *(_QWORD *)(v0 + 72);
        v28 = *(_QWORD *)(v0 + 80);
        v29 = *(_QWORD *)(v0 + 56);

        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
        objc_msgSend(v18, sel_pushViewController_animated_, v29, 0);
LABEL_16:

        v44 = *(_QWORD *)(v0 + 56);
        v45 = *(void (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v0 + 64)
                                                           + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                             + 128);
        v46 = swift_retain();
        v45(v46);
        swift_release();
        v47 = *(_QWORD *)(v0 + 40);
        v48 = *(_QWORD *)(v0 + 48);
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v47);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 24))(v44, v47, v48);
        __swift_destroy_boxed_opaque_existential_1(v0 + 16);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        return (*(uint64_t (**)(void))(v0 + 8))();
      }

    }
    v30 = objc_msgSend(v14, sel_viewController);
    v16 = objc_msgSend(v30, sel_presentedViewController);

    if (v16)
    {
      v31 = objc_msgSend(v16, sel_navigationController);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)(v0 + 96);
        v34 = *(_QWORD *)(v0 + 72);
        v35 = *(_QWORD *)(v0 + 80);
        swift_release();
        v36 = sub_220D98C80();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v33, v36, v34);
        v37 = sub_220D98C8C();
        v38 = sub_220D99484();
        if (os_log_type_enabled(v37, v38))
        {
          v39 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_220D57000, v37, v38, "PASUISourceViewPresenter is already presenting a view controller, but should be presenting a nav controller.", v39, 2u);
          MEMORY[0x2276657E4](v39, -1, -1);
        }
        v40 = *(_QWORD *)(v0 + 96);
        v41 = *(_QWORD *)(v0 + 72);
        v42 = *(_QWORD *)(v0 + 80);
        v43 = *(_QWORD *)(v0 + 56);

        (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v40, v41);
        objc_msgSend(v32, sel_pushViewController_animated_, v43, 0);

        goto LABEL_16;
      }

    }
    v51 = *(_QWORD *)(v0 + 80);
    v50 = *(_QWORD *)(v0 + 88);
    v52 = *(_QWORD *)(v0 + 72);
    v53 = sub_220D98C80();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v50, v53, v52);
    v54 = sub_220D98C8C();
    v55 = sub_220D99460();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_220D57000, v54, v55, "PASUISourceViewPresenter presenting modal nav controller", v56, 2u);
      MEMORY[0x2276657E4](v56, -1, -1);
    }
    v58 = *(_QWORD *)(v0 + 80);
    v57 = *(_QWORD *)(v0 + 88);
    v59 = *(_QWORD *)(v0 + 72);

    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v12;
    v13 = sub_220D80DE4;
    goto LABEL_21;
  }
  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = sub_220D98C8C();
  v6 = sub_220D99460();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "PASUISourceViewPresenter is presenting a modal view controller without a nav controller", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }
  v8 = *(_QWORD *)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 72);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(void **)(v0 + 56);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  objc_msgSend(v11, sel_setModalInPresentation_, 1);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v12;
  v13 = sub_220D80C78;
LABEL_21:
  *v12 = v0;
  v12[1] = v13;
  return sub_220D7E288();
}

uint64_t sub_220D80C78()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D80CC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  swift_release();
  v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                             + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController), sel_viewController));
  objc_msgSend(v3, sel_presentViewController_animated_completion_, v1, 1, 0);

  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(void (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v0 + 64)
                                                    + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                      + 128);
  v6 = swift_retain();
  v5(v6);
  swift_release();
  v7 = *(_QWORD *)(v0 + 40);
  v8 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v4, v7, v8);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D80DE4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D80E30()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(void **)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 56);
  swift_release();
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7A0]), sel_initWithRootViewController_, v2);
  objc_msgSend(v3, sel_setModalInPresentation_, 1);
  v4 = objc_msgSend(v1, sel_viewController);
  objc_msgSend(v4, sel_presentViewController_animated_completion_, v3, 1, 0);

  v5 = *(_QWORD *)(v0 + 56);
  v6 = *(void (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v0 + 64)
                                                    + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                      + 128);
  v7 = swift_retain();
  v6(v7);
  swift_release();
  v8 = *(_QWORD *)(v0 + 40);
  v9 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v5, v8, v9);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D80F80(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C540);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_220D99418();
  v12 = a2;
  v13 = sub_220D9940C();
  v14 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v15 = (char *)swift_allocObject();
  v16 = MEMORY[0x24BEE6930];
  *((_QWORD *)v15 + 2) = v13;
  *((_QWORD *)v15 + 3) = v16;
  *((_QWORD *)v15 + 4) = v12;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v15[v14], v7, v4);
  sub_220D5F9A8((uint64_t)v10, (uint64_t)&unk_25564C550, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_220D810E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[8] = a4;
  v5[9] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C540);
  v5[10] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[11] = v7;
  v5[12] = *(_QWORD *)(v7 + 64);
  v5[13] = swift_task_alloc();
  sub_220D99418();
  v5[14] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D81184()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  v1 = v0[13];
  v2 = v0[11];
  v4 = v0[9];
  v3 = v0[10];
  v5 = (void *)v0[8];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  v0[6] = sub_220D83844;
  v0[7] = v7;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_220D79A30;
  v0[5] = &block_descriptor_4;
  v8 = _Block_copy(v0 + 2);
  swift_release();
  objc_msgSend(v5, sel_dismissViewControllerAnimated_completion_, 1, v8);
  _Block_release(v8);
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t PASUISourceViewPresenter.flowDidComplete(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[26] = a1;
  v2[27] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  v2[28] = swift_task_alloc();
  v3 = sub_220D98830();
  v2[29] = v3;
  v2[30] = *(_QWORD *)(v3 - 8);
  v2[31] = swift_task_alloc();
  v4 = sub_220D98C98();
  v2[32] = v4;
  v2[33] = *(_QWORD *)(v4 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = sub_220D99418();
  v2[36] = sub_220D9940C();
  v2[37] = sub_220D993F4();
  v2[38] = v5;
  return swift_task_switch();
}

uint64_t sub_220D8137C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD *v24;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = v0 + 72;
  v3 = *(_QWORD *)(v0 + 264);
  v4 = *(_QWORD *)(v0 + 272);
  v5 = *(_QWORD *)(v0 + 256);
  v6 = sub_220D98C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v6, v5);
  sub_220D82ECC(v1, v0 + 16);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v35 = *(_QWORD *)(v0 + 264);
    v36 = *(_QWORD *)(v0 + 256);
    v37 = *(_QWORD *)(v0 + 272);
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v38 = v10;
    *(_DWORD *)v9 = 136446210;
    sub_220D82ECC(v0 + 16, v0 + 128);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564C3C0);
    v11 = sub_220D99370();
    *(_QWORD *)(v0 + 200) = sub_220D6593C(v11, v12, &v38);
    v2 = v0 + 72;
    sub_220D99508();
    swift_bridgeObjectRelease();
    sub_220D5D018(v0 + 16, &qword_25564C3C0);
    _os_log_impl(&dword_220D57000, v7, v8, "PASUISourceViewPresenter flowDidComplete with result %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v10, -1, -1);
    MEMORY[0x2276657E4](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v36);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 264);
    v13 = *(_QWORD *)(v0 + 272);
    v15 = *(_QWORD *)(v0 + 256);
    sub_220D5D018(v0 + 16, &qword_25564C3C0);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  v16 = *(_QWORD *)(v0 + 216);
  sub_220D82ECC(*(_QWORD *)(v0 + 208), v2);
  v17 = objc_allocWithZone((Class)sub_220D98ADC());
  v18 = sub_220D98AD0();
  *(_QWORD *)(v0 + 312) = v18;
  v19 = *(_QWORD *)(v16 + OBJC_IVAR___PASUIGuardianViewPresenter_flowTimer);
  *(_QWORD *)(v0 + 320) = v19;
  if (v19)
  {
    v20 = (void *)v18;
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v20;
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = &unk_25564C3D8;
    *(_QWORD *)(v22 + 24) = v21;
    *(_QWORD *)(v0 + 184) = &unk_25564ACC0;
    *(_QWORD *)(v0 + 192) = v22;
    swift_retain();
    v23 = v20;
    sub_220D98824();
    v24 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v24;
    *v24 = v0;
    v24[1] = sub_220D8171C;
    return sub_220D98C74();
  }
  else
  {
    swift_release();
    v26 = *(void **)(v0 + 312);
    v28 = *(void **)(v0 + 216);
    v27 = *(_QWORD *)(v0 + 224);
    v29 = sub_220D9943C();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v27, 1, 1, v29);
    v30 = v26;
    v31 = v28;
    v32 = sub_220D9940C();
    v33 = (_QWORD *)swift_allocObject();
    v34 = MEMORY[0x24BEE6930];
    v33[2] = v32;
    v33[3] = v34;
    v33[4] = v31;
    v33[5] = v30;
    sub_220D5F9A8(v27, (uint64_t)&unk_25564C3E8, (uint64_t)v33);
    swift_release();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_220D8171C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v3 = *(_QWORD *)(*v0 + 240);
  v2 = *(_QWORD *)(*v0 + 248);
  v4 = *(_QWORD *)(*v0 + 232);
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_220D5CDB4(*(_QWORD *)(v1 + 184));
  return swift_task_switch();
}

uint64_t sub_220D817A0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  swift_release();
  v1 = *(void **)(v0 + 312);
  v3 = *(void **)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 224);
  v4 = sub_220D9943C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 1, 1, v4);
  v5 = v1;
  v6 = v3;
  v7 = sub_220D9940C();
  v8 = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = v6;
  v8[5] = v5;
  sub_220D5F9A8(v2, (uint64_t)&unk_25564C3E8, (uint64_t)v8);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D81884(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 296) = a1;
  return swift_task_switch();
}

uint64_t sub_220D8189C()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25564AD58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220D9AFB0;
  *(_QWORD *)(inited + 32) = 0xD00000000000001ALL;
  *(_QWORD *)(inited + 40) = 0x8000000220D9ECB0;
  v2 = sub_220D98AC4();
  if (v2 >= 3)
  {
    *(_QWORD *)(v0 + 280) = v2;
    return sub_220D99610();
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 296);
    sub_220D993AC();
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x24BEE0D00];
    v5 = MEMORY[0x24BE7BA08];
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 80) = v5;
    *(_QWORD *)(inited + 48) = 0;
    *(_QWORD *)(inited + 56) = 0xE000000000000000;
    sub_220D72410(inited);
    sub_220D82ECC(v3 + *MEMORY[0x24BE7B738], v0 + 104);
    if ((*(_BYTE *)(v0 + 152) & 1) != 0)
    {
      v6 = *(void **)(v0 + 104);
      swift_getErrorValue();
      v7 = sub_220D99634();
      v9 = v8;
      *(_QWORD *)(v0 + 224) = v4;
      *(_QWORD *)(v0 + 232) = v5;

      *(_QWORD *)(v0 + 200) = v7;
      *(_QWORD *)(v0 + 208) = v9;
    }
    else
    {
      sub_220D5D018(v0 + 104, &qword_25564C3C0);
      *(_OWORD *)(v0 + 200) = 0u;
      *(_OWORD *)(v0 + 216) = 0u;
      *(_QWORD *)(v0 + 232) = 0;
    }
    *(_QWORD *)(v0 + 264) = 0xD00000000000001ALL;
    *(_QWORD *)(v0 + 272) = 0x8000000220D9EE20;
    *(_QWORD *)(v0 + 184) = v4;
    *(_QWORD *)(v0 + 192) = v5;
    *(_QWORD *)(v0 + 160) = 0;
    *(_QWORD *)(v0 + 168) = 0xE000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564ADE8);
    v11 = sub_220D9931C();
    swift_bridgeObjectRelease();
    sub_220D5D018(v0 + 160, &qword_25564ADF0);
    sub_220D5D018(v0 + 200, &qword_25564ADF0);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
  }
}

uint64_t sub_220D81AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[5] = a4;
  v5[6] = a5;
  v6 = sub_220D98C98();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  sub_220D99418();
  v5[10] = sub_220D9940C();
  v5[11] = sub_220D993F4();
  v5[12] = v7;
  return swift_task_switch();
}

uint64_t sub_220D81B78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;

  v1 = v0[5] + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  v2 = MEMORY[0x227665880](v1);
  swift_unknownObjectRelease();
  if (!v2)
  {
    v4 = v0[8];
    v3 = v0[9];
    v5 = v0[7];
    v6 = sub_220D98C80();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
    v7 = sub_220D98C8C();
    v8 = sub_220D99478();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_220D57000, v7, v8, "PASUISourceViewPresenter delegate is nil", v9, 2u);
      MEMORY[0x2276657E4](v9, -1, -1);
    }
    v11 = v0[8];
    v10 = v0[9];
    v12 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  v13 = (void *)MEMORY[0x227665880](v1);
  if (v13)
  {
    objc_msgSend(v13, sel_proximitySetupCompletedWithResult_, v0[6]);
    swift_unknownObjectRelease();
  }
  v14 = (_QWORD *)swift_task_alloc();
  v0[13] = v14;
  *v14 = v0;
  v14[1] = sub_220D81CD4;
  return sub_220D7E288();
}

uint64_t sub_220D81CD4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D81D20()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PASUISourceViewPresenter.stepDidRequestCancel(_:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  sub_220D99418();
  *(_QWORD *)(v1 + 24) = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D81DC4()
{
  uint64_t v0;

  swift_release();
  _s23ProximityAppleIDSetupUI24PASUISourceViewPresenterC12handleCancelyyF_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PASUISourceViewPresenter.stepDidRequestReset(_:)()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_220D99418();
  v0[3] = sub_220D9940C();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_220D81E60;
  return sub_220D7DF24();
}

uint64_t sub_220D81E60()
{
  swift_task_dealloc();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t PASUISourceViewPresenter.handleReset()()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_220D99418();
  v0[3] = sub_220D9940C();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_220D81E60;
  return sub_220D7DF24();
}

uint64_t sub_220D81F34(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D5DA1C;
  return PASUISourceViewPresenter.flowDidComplete(with:)(a1);
}

uint64_t sub_220D81F84()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_220D99418();
  v0[3] = sub_220D9940C();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_220D81E60;
  return sub_220D7DF24();
}

uint64_t sub_220D81FE8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  sub_220D99418();
  *(_QWORD *)(v1 + 24) = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D82054()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_220D99418();
  v0[3] = sub_220D9940C();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_220D69344;
  return sub_220D7DF24();
}

uint64_t sub_220D820BC(char *a1, char *a2)
{
  return sub_220D7C1E4(*a1, *a2);
}

uint64_t sub_220D820C8()
{
  return sub_220D7C440();
}

uint64_t sub_220D820D0()
{
  sub_220D993A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D82128()
{
  return sub_220D7C634();
}

uint64_t sub_220D82130@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_220D995E0();
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

void sub_220D8218C(_QWORD *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;

  v2 = 0x8000000220D9DF20;
  if (*v1)
    v2 = 0x8000000220D9DF50;
  *a1 = 0xD000000000000021;
  a1[1] = v2;
}

uint64_t sub_220D821C8()
{
  sub_220D83494();
  return sub_220D98B6C();
}

id PRXCardContentViewController.viewController.getter()
{
  void *v0;

  return v0;
}

id sub_220D82210(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = objc_msgSend(v1, sel_contentView);

  return v2;
}

id PRXCardContentViewController.mainView.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_contentView);
}

Swift::Void __swiftcall PRXCardContentViewController.setActivityStatus(text:)(Swift::String_optional text)
{
  void *v1;
  id v2;

  if (text.value._object)
  {
    v2 = (id)sub_220D99340();
    objc_msgSend(v1, sel_showActivityIndicatorWithStatus_, v2);

  }
  else
  {
    objc_msgSend(v1, sel_hideActivityIndicator);
  }
}

void sub_220D822C8(id a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;

  if (a3)
  {
    sub_220D99364();
    v4 = a1;
    v5 = (id)sub_220D99340();
    objc_msgSend(v4, sel_showActivityIndicatorWithStatus_, v5);

    swift_bridgeObjectRelease();
  }
  else
  {
    objc_msgSend(a1, sel_hideActivityIndicator);
  }
}

uint64_t sub_220D82364(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_220D5DA1C;
  return v6();
}

uint64_t sub_220D823B8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_220D5DA1C;
  return v7();
}

uint64_t sub_220D8240C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_220D9943C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_220D99430();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_220D5D018(a1, &qword_25564B0E0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220D993F4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_220D82558(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_220D825BC;
  return v6(a1);
}

uint64_t sub_220D825BC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _s23ProximityAppleIDSetupUI29PASUISourceViewPresenterErrorO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_220D995E0();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

id sub_220D82650(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  objc_class *v25;
  uint8_t *v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  char *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[4];

  v40 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_220D98C98();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v39 - v8;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR___PASUIGuardianViewPresenter_cardContentView] = 0;
  v10 = &v1[OBJC_IVAR___PASUIGuardianViewPresenter_cardAdapter];
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((_QWORD *)v10 + 4) = 0;
  *(_QWORD *)&v1[OBJC_IVAR___PASUIGuardianViewPresenter_flowTimer] = 0;
  v11 = OBJC_IVAR___PASUIGuardianViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8E8);
  swift_allocObject();
  *(_QWORD *)&v1[v11] = sub_220D988B4();
  v12 = OBJC_IVAR___PASUIGuardianViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F0);
  swift_allocObject();
  *(_QWORD *)&v1[v12] = sub_220D988B4();
  v13 = OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B120);
  swift_allocObject();
  *(_QWORD *)&v1[v13] = sub_220D988B4();
  v14 = OBJC_IVAR___PASUIGuardianViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A908);
  swift_allocObject();
  *(_QWORD *)&v1[v14] = sub_220D988B4();
  *(_QWORD *)&v1[OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics] = 0;
  v15 = v1;
  v16 = sub_220D98C80();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v17(v9, v16, v3);
  v18 = sub_220D98C8C();
  v19 = sub_220D99484();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v39 = v9;
    v21 = v3;
    v22 = v15;
    v23 = v7;
    v24 = v4;
    v25 = ObjectType;
    v26 = v20;
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_220D57000, v18, v19, "PAS=== Welcome to ProximityAppleIDSetup - Source ===PAS", v20, 2u);
    v27 = v26;
    ObjectType = v25;
    v4 = v24;
    v7 = v23;
    v15 = v22;
    v3 = v21;
    v9 = v39;
    MEMORY[0x2276657E4](v27, -1, -1);
  }

  v28 = *(void (**)(char *, uint64_t))(v4 + 8);
  v28(v9, v3);
  v17(v7, v16, v3);
  v29 = sub_220D98C8C();
  v30 = sub_220D99484();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_220D57000, v29, v30, "PASUISourceViewPresenter initWithSharingViewController", v31, 2u);
    MEMORY[0x2276657E4](v31, -1, -1);
  }

  v28(v7, v3);
  sub_220D988E4();
  swift_retain();
  sub_220D988CC();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(_QWORD *)(swift_allocObject() + 16) = 0;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC10);
  v42[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC18);
  v42[0] = v32;
  swift_retain();
  sub_220D988F0();
  swift_release();
  sub_220D5D018((uint64_t)v42, &qword_25564AC20);
  swift_release();
  v33 = v40;
  *(_QWORD *)&v15[OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController] = v40;
  sub_220D98AB8();
  swift_allocObject();
  v34 = v33;
  v35 = sub_220D98AAC();
  v36 = MEMORY[0x24BE7B710];
  v37 = (uint64_t *)&v15[OBJC_IVAR___PASUIGuardianViewPresenter_flowController];
  *v37 = v35;
  v37[1] = v36;

  v41.receiver = v15;
  v41.super_class = ObjectType;
  return objc_msgSendSuper2(&v41, sel_init);
}

id sub_220D82A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void (*v22)(char *, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_class *ObjectType;
  objc_super v35;
  _QWORD v36[4];

  v31 = a3;
  v32 = a1;
  v33 = a2;
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v31 - v9;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR___PASUIGuardianViewPresenter_cardContentView] = 0;
  v11 = &v3[OBJC_IVAR___PASUIGuardianViewPresenter_cardAdapter];
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((_QWORD *)v11 + 4) = 0;
  *(_QWORD *)&v3[OBJC_IVAR___PASUIGuardianViewPresenter_flowTimer] = 0;
  v12 = OBJC_IVAR___PASUIGuardianViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8E8);
  swift_allocObject();
  *(_QWORD *)&v3[v12] = sub_220D988B4();
  v13 = OBJC_IVAR___PASUIGuardianViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F0);
  swift_allocObject();
  *(_QWORD *)&v3[v13] = sub_220D988B4();
  v14 = OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B120);
  swift_allocObject();
  *(_QWORD *)&v3[v14] = sub_220D988B4();
  v15 = OBJC_IVAR___PASUIGuardianViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A908);
  swift_allocObject();
  *(_QWORD *)&v3[v15] = sub_220D988B4();
  *(_QWORD *)&v3[OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics] = 0;
  v16 = v3;
  v17 = sub_220D98C80();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v18(v10, v17, v4);
  v19 = sub_220D98C8C();
  v20 = sub_220D99484();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_220D57000, v19, v20, "PAS=== Welcome to ProximityAppleIDSetup - Source ===PAS", v21, 2u);
    MEMORY[0x2276657E4](v21, -1, -1);
  }

  v22 = *(void (**)(char *, uint64_t))(v5 + 8);
  v22(v10, v4);
  v18(v8, v17, v4);
  v23 = sub_220D98C8C();
  v24 = sub_220D99484();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_220D57000, v23, v24, "PASUISourceViewPresenter parentVC and flow controller", v25, 2u);
    MEMORY[0x2276657E4](v25, -1, -1);
  }

  v22(v8, v4);
  sub_220D988E4();
  swift_retain();
  sub_220D988CC();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(_QWORD *)(swift_allocObject() + 16) = 0;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC10);
  v36[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC18);
  v36[0] = v26;
  swift_retain();
  sub_220D988F0();
  swift_release();
  sub_220D5D018((uint64_t)v36, &qword_25564AC20);
  swift_release();
  v27 = v33;
  *(_QWORD *)&v16[OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController] = v32;
  v28 = &v16[OBJC_IVAR___PASUIGuardianViewPresenter_flowController];
  v29 = v31;
  *(_QWORD *)v28 = v27;
  *((_QWORD *)v28 + 1) = v29;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();

  v35.receiver = v16;
  v35.super_class = ObjectType;
  return objc_msgSendSuper2(&v35, sel_init);
}

uint64_t sub_220D82E18()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_220D82E4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_220D5DA1C;
  return sub_220D7F94C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_220D82ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C3C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220D82F14()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_220D82F38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D654C8;
  v3[37] = v2;
  return swift_task_switch();
}

uint64_t sub_220D82F98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D82FBC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_220D82FF0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_220D5DA1C;
  return sub_220D81AE4(a1, v4, v5, v7, v6);
}

unint64_t sub_220D8306C()
{
  unint64_t result;

  result = qword_25564C410;
  if (!qword_25564C410)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUISourceViewPresenterError, &type metadata for PASUISourceViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564C410);
  }
  return result;
}

unint64_t sub_220D830B0(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_220D830E4();
  a1[2] = sub_220D83128();
  result = sub_220D8316C();
  a1[3] = result;
  return result;
}

unint64_t sub_220D830E4()
{
  unint64_t result;

  result = qword_25564C418;
  if (!qword_25564C418)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUISourceViewPresenterError, &type metadata for PASUISourceViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564C418);
  }
  return result;
}

unint64_t sub_220D83128()
{
  unint64_t result;

  result = qword_25564C420;
  if (!qword_25564C420)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUISourceViewPresenterError, &type metadata for PASUISourceViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564C420);
  }
  return result;
}

unint64_t sub_220D8316C()
{
  unint64_t result;

  result = qword_25564C428;
  if (!qword_25564C428)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUISourceViewPresenterError, &type metadata for PASUISourceViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564C428);
  }
  return result;
}

unint64_t sub_220D831B4()
{
  unint64_t result;

  result = qword_25564C430;
  if (!qword_25564C430)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUISourceViewPresenterError, &type metadata for PASUISourceViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564C430);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PASUISourceViewPresenterError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_220D83244 + 4 * byte_220D9C5A1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_220D83278 + 4 * byte_220D9C59C[v4]))();
}

uint64_t sub_220D83278(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_220D83280(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x220D83288);
  return result;
}

uint64_t sub_220D83294(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x220D8329CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_220D832A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_220D832A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PASUISourceViewPresenterError()
{
  return &type metadata for PASUISourceViewPresenterError;
}

uint64_t type metadata accessor for PASUISourceViewPresenter()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for PASUISourceViewPresenter.AnalyticsEvent(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PASUISourceViewPresenter.AnalyticsEvent(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_220D833C0 + 4 * byte_220D9C5AB[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_220D833F4 + 4 * byte_220D9C5A6[v4]))();
}

uint64_t sub_220D833F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_220D833FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x220D83404);
  return result;
}

uint64_t sub_220D83410(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x220D83418);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_220D8341C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_220D83424(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_220D83430(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PASUISourceViewPresenter.AnalyticsEvent()
{
  return &type metadata for PASUISourceViewPresenter.AnalyticsEvent;
}

unint64_t sub_220D83450()
{
  unint64_t result;

  result = qword_25564C4C0;
  if (!qword_25564C4C0)
  {
    result = MEMORY[0x227665754](&unk_220D9C888, &type metadata for PASUISourceViewPresenter.AnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_25564C4C0);
  }
  return result;
}

unint64_t sub_220D83494()
{
  unint64_t result;

  result = qword_25564C4C8;
  if (!qword_25564C4C8)
  {
    result = MEMORY[0x227665754](&unk_220D9C810, &type metadata for PASUISourceViewPresenter.AnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_25564C4C8);
  }
  return result;
}

uint64_t sub_220D834DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25564C4D0 + dword_25564C4D0))(v2, v3, v4);
}

uint64_t sub_220D83550(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25564C4F0 + dword_25564C4F0))(a1, v4);
}

uint64_t sub_220D835C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_220D5DA1C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25564C500 + dword_25564C500))(v2, v3, v4);
}

unint64_t sub_220D83638()
{
  unint64_t result;

  result = qword_25564C528;
  if (!qword_25564C528)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUISourceViewPresenterError, &type metadata for PASUISourceViewPresenterError);
    atomic_store(result, (unint64_t *)&qword_25564C528);
  }
  return result;
}

unint64_t sub_220D8367C()
{
  unint64_t result;

  result = qword_25564C530;
  if (!qword_25564C530)
  {
    result = MEMORY[0x227665754](&protocol conformance descriptor for PASUISourceViewPresenterError, &type metadata for PASUISourceViewPresenterError);
    atomic_store(result, &qword_25564C530);
  }
  return result;
}

uint64_t sub_220D836C0(uint64_t a1)
{
  uint64_t v1;

  return sub_220D80F80(a1, *(void **)(v1 + 16));
}

uint64_t sub_220D836C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C540);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_220D83748(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25564C540) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_220D5CCCC;
  return sub_220D810E8(a1, v5, v6, v7, v8);
}

uint64_t sub_220D837E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C540);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_220D83844()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564C540);
  return sub_220D99400();
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

uint64_t sub_220D8389C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for PASUIProgressView()
{
  return &type metadata for PASUIProgressView;
}

uint64_t sub_220D838F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D83908@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v22 = sub_220D98D70();
  v2 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C588);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C590);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C598);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a1 = sub_220D98F14();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v15 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25564C5A0) + 44);
  sub_220D98DA0();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v11, v8, v5);
  *(_WORD *)&v11[*(int *)(v9 + 36)] = 257;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v22;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDEB488], v22);
  KeyPath = swift_getKeyPath();
  v18 = (uint64_t *)&v14[*(int *)(v12 + 36)];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C5A8);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v18 + *(int *)(v19 + 28), v4, v16);
  *v18 = KeyPath;
  sub_220D83C50((uint64_t)v11, (uint64_t)v14);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v16);
  sub_220D83C98((uint64_t)v11);
  return sub_220D83CD8((uint64_t)v14, v15);
}

uint64_t sub_220D83B40@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_220D99394();
  sub_220D5F128();
  result = sub_220D990C4();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_220D83BB0()
{
  return sub_220D98E90();
}

uint64_t sub_220D83BD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_220D98D70();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x227664A64](v4);
}

uint64_t sub_220D83C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220D83C98(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C590);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_220D83CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C598);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_220D83D24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564C5B0;
  if (!qword_25564C5B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564C5B8);
    result = MEMORY[0x227665754](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_25564C5B0);
  }
  return result;
}

uint64_t PASFlowStepProxiedAuth.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v23[5];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C5C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v23[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v23[-1] - v6;
  v8 = (objc_class *)type metadata accessor for PASUIAppleIDAuthContextProvider();
  v9 = objc_allocWithZone(v8);
  swift_retain();
  v10 = objc_msgSend(v9, sel_init);
  v23[3] = v8;
  v23[4] = &off_24E6A2FC0;
  v23[0] = v10;
  v11 = (char *)objc_allocWithZone((Class)type metadata accessor for PASUISignInViewModel());
  v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, (uint64_t)v8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (_QWORD *)((char *)&v23[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v15 + 16))(v14);
  v16 = *v14;
  v17 = v10;
  v18 = sub_220D8575C(v0, v16, v11);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);

  v23[0] = v18;
  v19 = sub_220D85920();
  sub_220D99178();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v23[0] = &type metadata for PASUISignInView;
  v23[1] = v19;
  swift_getOpaqueTypeConformance2();
  v20 = sub_220D99280();

  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v20;
}

uint64_t type metadata accessor for PASUISignInViewModel()
{
  return objc_opt_self();
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

uint64_t sub_220D83FA0()
{
  return PASFlowStepProxiedAuth.buildView()();
}

id sub_220D83FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t inited;
  void **v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v0 = sub_220D989E0();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    sub_220D989C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564B158);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_220D9AFB0;
    *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v4 + 64) = sub_220D6AF6C();
    *(_QWORD *)(v4 + 32) = v2;
    *(_QWORD *)(v4 + 40) = v3;
    sub_220D9937C();
    swift_bridgeObjectRelease();
  }
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), sel_init);
  objc_msgSend(v5, sel_setMinimumLineHeight_, 41.0);
  objc_msgSend(v5, sel_setAlignment_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564C6B0);
  inited = swift_initStackObject();
  v7 = (void **)MEMORY[0x24BEBB360];
  *(_OWORD *)(inited + 16) = xmmword_220D9BBE0;
  v8 = *v7;
  *(_QWORD *)(inited + 32) = *v7;
  v9 = (void *)objc_opt_self();
  v10 = *MEMORY[0x24BEBB5E8];
  v11 = v8;
  v12 = objc_msgSend(v9, sel_systemFontOfSize_weight_, 34.0, v10);
  v13 = sub_220D73EBC(0, &qword_25564C6B8);
  *(_QWORD *)(inited + 40) = v12;
  v14 = (void *)*MEMORY[0x24BEBB3A8];
  *(_QWORD *)(inited + 64) = v13;
  *(_QWORD *)(inited + 72) = v14;
  *(_QWORD *)(inited + 104) = sub_220D73EBC(0, &qword_25564C6C8);
  *(_QWORD *)(inited + 80) = v5;
  v15 = v14;
  v16 = v5;
  sub_220D72550(inited);
  v17 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v18 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_220D863A4();
  v19 = (void *)sub_220D992F8();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v17, sel_initWithString_attributes_, v18, v19);

  return v20;
}

id sub_220D842E8()
{
  uint64_t inited;
  void **v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
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
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  id v33;
  id v34;
  id v36;
  void *v37;
  id v38;

  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564C6B0);
  inited = swift_initStackObject();
  v1 = (void **)MEMORY[0x24BEBB360];
  *(_OWORD *)(inited + 16) = xmmword_220D9AFB0;
  v2 = *v1;
  *(_QWORD *)(inited + 32) = *v1;
  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v4 = v2;
  v38 = v3;
  v5 = objc_msgSend(v3, sel_systemFontOfSize_, 17.0);
  v6 = sub_220D73EBC(0, &qword_25564C6B8);
  *(_QWORD *)(inited + 64) = v6;
  *(_QWORD *)(inited + 40) = v5;
  sub_220D72550(inited);
  v7 = sub_220D989E0();
  if (!v8)
  {
    sub_220D9955C();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    sub_220D99394();
    swift_bridgeObjectRelease();
    v23 = objc_allocWithZone(MEMORY[0x24BDD1688]);
    v24 = (void *)sub_220D99340();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_220D863A4();
    v25 = (void *)sub_220D992F8();
    swift_bridgeObjectRelease();
    v26 = objc_msgSend(v23, sel_initWithString_attributes_, v24, v25);

LABEL_11:
    return v26;
  }
  v9 = v7;
  v10 = v8;
  v37 = v4;
  if ((sub_220D989C8() & 1) != 0)
  {
    v11 = sub_220D989D4();
    if (v12)
    {
      v13 = v11;
      v14 = v12;
      sub_220D9955C();
      swift_bridgeObjectRelease();
      sub_220D993AC();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564B158);
      v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_220D9BBE0;
      v16 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
      v17 = sub_220D6AF6C();
      *(_QWORD *)(v15 + 32) = v9;
      *(_QWORD *)(v15 + 40) = v10;
      *(_QWORD *)(v15 + 96) = v16;
      *(_QWORD *)(v15 + 104) = v17;
      *(_QWORD *)(v15 + 64) = v17;
      *(_QWORD *)(v15 + 72) = v13;
      *(_QWORD *)(v15 + 80) = v14;
      swift_bridgeObjectRetain();
      sub_220D9937C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v18 = (void *)sub_220D99340();
      v19 = (void *)sub_220D99340();
      swift_bridgeObjectRelease();
      v36 = objc_msgSend(v18, sel_rangeOfString_, v19);
      v21 = v20;

      v22 = 0;
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
    sub_220D9955C();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    sub_220D99394();
  }
  else
  {
    sub_220D9955C();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564B158);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_220D9AFB0;
    *(_QWORD *)(v27 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v27 + 64) = sub_220D6AF6C();
    *(_QWORD *)(v27 + 32) = v9;
    *(_QWORD *)(v27 + 40) = v10;
    sub_220D9937C();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v36 = 0;
  v21 = 0;
  v22 = 1;
LABEL_9:
  v28 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  v29 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_220D863A4();
  v30 = (void *)sub_220D992F8();
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v28, sel_initWithString_attributes_, v29, v30);

  if ((v22 & 1) == 0)
  {
    v31 = swift_initStackObject();
    *(_OWORD *)(v31 + 16) = xmmword_220D9AFB0;
    *(_QWORD *)(v31 + 32) = v37;
    v32 = *MEMORY[0x24BEBB5E8];
    v33 = v37;
    v34 = objc_msgSend(v38, sel_systemFontOfSize_weight_, 17.0, v32);
    *(_QWORD *)(v31 + 64) = v6;
    *(_QWORD *)(v31 + 40) = v34;
    sub_220D72550(v31);
    v25 = (void *)sub_220D992F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v26, sel_addAttributes_range_, v25, v36, v21);
    goto LABEL_11;
  }
  return v26;
}

id PASUISignInViewModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PASUISignInViewModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PASUISignInViewModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUISignInViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220D84A28@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  ValueMetadata *v11;
  id v12;
  unint64_t v13;
  ValueMetadata *v14;
  _QWORD v16[2];
  ValueMetadata *v17;
  unint64_t v18;

  v16[1] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C680);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C688);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_allocWithZone(MEMORY[0x24BE04D98]);
  v11 = a1;
  v12 = objc_msgSend(v10, sel_initWithNibName_bundle_, 0, 0);
  v17 = v11;
  v18 = (unint64_t)v12;
  v13 = sub_220D862A8();
  sub_220D99178();

  *(_QWORD *)v5 = sub_220D98ED8();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564C698);
  *(_QWORD *)(swift_allocObject() + 16) = v11;
  v14 = v11;
  sub_220D99268();
  v17 = &type metadata for AAUISignInViewControllerWrapper;
  v18 = v13;
  swift_getOpaqueTypeConformance2();
  sub_220D86318();
  sub_220D99148();
  sub_220D86364((uint64_t)v5);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_220D84C20(uint64_t result)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(result
                                      + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction);
  if (v1)
  {
    v2 = swift_retain();
    v1(v2);
    return sub_220D5CDB4((uint64_t)v1);
  }
  return result;
}

uint64_t sub_220D84C70@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_220D99394();
  sub_220D5F128();
  result = sub_220D990C4();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_220D84CDC@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_220D84A28(*v1, a1);
}

void sub_220D84CE4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (void *)MEMORY[0x227665880](v1);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_nextButtonTapped);

  }
}

void *sub_220D84D3C(uint64_t a1)
{
  uint64_t v1;

  return sub_220D85A8C(a1, *(_QWORD *)v1, *(void **)(v1 + 8));
}

uint64_t sub_220D84D58()
{
  sub_220D86580();
  return sub_220D98FF8();
}

uint64_t sub_220D84DA8()
{
  sub_220D86580();
  return sub_220D98FC8();
}

void sub_220D84DF8()
{
  sub_220D86580();
  sub_220D98FEC();
  __break(1u);
}

uint64_t PASUISignInViewModel.signInViewController(_:didCompleteWithAuthenticationResults:)(uint64_t a1, uint64_t a2)
{
  return sub_220D85E20(a2);
}

uint64_t sub_220D84E2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C6D0);
    v2 = sub_220D995BC();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_220D67330(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_220D73EF4(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_220D73EF4(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_220D73EF4(v36, v37);
    sub_220D73EF4(v37, &v33);
    result = sub_220D99538();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_220D73EF4(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_220D863EC();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

id PASUISignInViewModel.authenticationContext()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t *v11;
  void (*v12)(_QWORD *__return_ptr, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v27 - v5 + 24;
  v7 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v8 = sub_220D98C8C();
  v9 = sub_220D99460();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_220D57000, v8, v9, "PASUISignInViewModel authenticationContext", v10, 2u);
    MEMORY[0x2276657E4](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v11 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_contextProvider), *(_QWORD *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_contextProvider + 24));
  v12 = *(void (**)(_QWORD *__return_ptr, uint64_t))(**(_QWORD **)(v1
                                                                           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel__viewControllerProvider)
                                                             + 128);
  v13 = swift_retain();
  v12(v27, v13);
  swift_release();
  v14 = v28;
  v15 = v29;
  __swift_project_boxed_opaque_existential_1(v27, v28);
  v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
  v17 = *v11;
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0AE28]), sel_init);
  objc_msgSend(v18, sel_setPresentingViewController_, v16);
  objc_msgSend(v18, sel_setDelegate_, v17);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  v19 = v18;
  v20 = sub_220D83FF0();
  v21 = objc_msgSend(v20, sel_string);

  if (!v21)
  {
    sub_220D99364();
    v21 = (id)sub_220D99340();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v19, sel_setTitle_, v21);

  v22 = v19;
  v23 = sub_220D842E8();
  v24 = objc_msgSend(v23, sel_string);

  if (!v24)
  {
    sub_220D99364();
    v24 = (id)sub_220D99340();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v22, sel_setReason_, v24);

  sub_220D989EC();
  objc_msgSend(v22, sel_setAuthenticationType_, 2);
  return v22;
}

id sub_220D8575C(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  objc_class *v17;
  id v18;
  uint64_t v20;
  objc_super v21;
  _QWORD v22[5];

  v6 = sub_220D98C98();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[3] = type metadata accessor for PASUIAppleIDAuthContextProvider();
  v22[4] = &off_24E6A2FC0;
  v22[0] = a2;
  v10 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel__viewControllerProvider;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B120);
  swift_allocObject();
  *(_QWORD *)&a3[v10] = sub_220D988B4();
  v11 = &a3[OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v12 = a3;
  v13 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
  v14 = sub_220D98C8C();
  v15 = sub_220D99460();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_220D57000, v14, v15, "PASUISignInViewModel init", v16, 2u);
    MEMORY[0x2276657E4](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(_QWORD *)&v12[OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_step] = a1;
  sub_220D66810((uint64_t)v22, (uint64_t)&v12[OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_contextProvider]);
  swift_retain();

  v17 = (objc_class *)type metadata accessor for PASUISignInViewModel();
  v21.receiver = v12;
  v21.super_class = v17;
  v18 = objc_msgSendSuper2(&v21, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return v18;
}

unint64_t sub_220D85920()
{
  unint64_t result;

  result = qword_25564C5C8;
  if (!qword_25564C5C8)
  {
    result = MEMORY[0x227665754](&unk_220D9CA28, &type metadata for PASUISignInView);
    atomic_store(result, (unint64_t *)&qword_25564C5C8);
  }
  return result;
}

id sub_220D85964()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v0 = objc_msgSend((id)objc_opt_self(), sel_tintColor);
  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_configurationWithHierarchicalColor_, v0);

  v3 = objc_msgSend(v1, sel_configurationWithPointSize_, 72.0);
  v4 = objc_msgSend(v2, sel_configurationByApplyingConfiguration_, v3);
  v5 = (void *)sub_220D99340();
  v6 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v5, v4);

  return v6;
}

void *sub_220D85A8C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void (**v19)();
  uint64_t v20;
  uint64_t v22;

  v5 = sub_220D98C98();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = sub_220D98C8C();
  v11 = sub_220D99484();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_220D57000, v10, v11, "PASUISignInView makeUIViewController", v12, 2u);
    MEMORY[0x2276657E4](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  objc_msgSend(a3, sel_setAllowsAccountCreation_, 0);
  objc_msgSend(a3, sel_setShowServiceIcons_, 0);
  objc_msgSend(a3, sel_setCanEditUsername_, 0);
  sub_220D989D4();
  if (v13)
  {
    v14 = (void *)sub_220D99340();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(a3, sel_setUsername_, v14);

  objc_msgSend(a3, sel_setDelegate_, a2);
  v15 = (void *)sub_220D993C4();
  objc_msgSend(a3, sel_setPrivacyLinkIdentifiers_, v15);

  v16 = sub_220D85964();
  objc_msgSend(a3, sel_setHeaderImage_, v16);

  objc_msgSend(a3, sel_setFooterText_, 0);
  objc_msgSend(a3, sel_setTableViewStyle_, 2);
  v17 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  objc_msgSend(a3, sel_setCellBackgroundColor_, v17);

  v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v19 = (void (**)())(a2 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction);
  v20 = *(_QWORD *)(a2 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction);
  *v19 = sub_220D865E8;
  v19[1] = (void (*)())v18;
  sub_220D5CDB4(v20);
  return a3;
}

uint64_t _s23ProximityAppleIDSetupUI20PASUISignInViewModelC04signfG19ControllerDidCancelyySo08AAUISignfgJ0CF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_220D98C98();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_220D98C8C();
  v6 = sub_220D99484();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "PASUISignInViewModel signInViewControllerDidCancel", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_220D85E20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = v1;
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_bridgeObjectRetain_n();
  v9 = sub_220D98C8C();
  v10 = sub_220D99484();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v21 = v2;
    v12 = v11;
    v13 = swift_slowAlloc();
    v20 = v13;
    *(_DWORD *)v12 = 141558274;
    v22 = 1752392040;
    v23 = v13;
    sub_220D99508();
    *(_WORD *)(v12 + 12) = 2080;
    v19[0] = v12 + 14;
    swift_bridgeObjectRetain();
    v19[1] = MEMORY[0x24BEE4AD8] + 8;
    v14 = sub_220D99310();
    v16 = v15;
    swift_bridgeObjectRelease();
    v22 = sub_220D6593C(v14, v16, &v23);
    sub_220D99508();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220D57000, v9, v10, "PASUISignInViewModel signInViewController didCompleteWithAuthenticationResults\n%{mask.hash}s", (uint8_t *)v12, 0x16u);
    v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v17, -1, -1);
    MEMORY[0x2276657E4](v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_220D84E2C(a1);
  sub_220D98914();
  sub_220D989BC();
  return swift_bridgeObjectRelease();
}

uint64_t _s23ProximityAppleIDSetupUI20PASUISignInViewModelC27willAuthenticateWithContextyySo023AKAppleIDAuthenticationL0CF_0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = a1;
  v8 = sub_220D98C8C();
  v9 = sub_220D99460();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v21 = v2;
    v11 = v10;
    v12 = swift_slowAlloc();
    v20 = v12;
    *(_DWORD *)v11 = 141558274;
    v22 = 1752392040;
    v23 = v12;
    sub_220D99508();
    *(_WORD *)(v11 + 12) = 2080;
    v19[1] = v11 + 14;
    v13 = objc_msgSend(v7, sel_debugDescription);
    v14 = sub_220D99364();
    v16 = v15;

    v22 = sub_220D6593C(v14, v16, &v23);
    sub_220D99508();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220D57000, v8, v9, "PASUISignInViewModel willAuthenticateWithContext\n%{mask.hash}s", (uint8_t *)v11, 0x16u);
    v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v17, -1, -1);
    MEMORY[0x2276657E4](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v21);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

ValueMetadata *type metadata accessor for PASUISignInView()
{
  return &type metadata for PASUISignInView;
}

uint64_t sub_220D86298()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_220D862A8()
{
  unint64_t result;

  result = qword_25564C690;
  if (!qword_25564C690)
  {
    result = MEMORY[0x227665754](&unk_220D9CB18, &type metadata for AAUISignInViewControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_25564C690);
  }
  return result;
}

uint64_t sub_220D862EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_220D86310()
{
  uint64_t v0;

  return sub_220D84C20(*(_QWORD *)(v0 + 16));
}

unint64_t sub_220D86318()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564C6A0;
  if (!qword_25564C6A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564C680);
    result = MEMORY[0x227665754](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_25564C6A0);
  }
  return result;
}

uint64_t sub_220D86364(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C680);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_220D863A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25564AA10;
  if (!qword_25564AA10)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x227665754](&unk_220D9AA94, v1);
    atomic_store(result, (unint64_t *)&qword_25564AA10);
  }
  return result;
}

uint64_t sub_220D863EC()
{
  return swift_release();
}

_QWORD *initializeBufferWithCopyOfBuffer for AAUISignInViewControllerWrapper(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for AAUISignInViewControllerWrapper(id *a1)
{

}

uint64_t assignWithCopy for AAUISignInViewControllerWrapper(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

uint64_t assignWithTake for AAUISignInViewControllerWrapper(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for AAUISignInViewControllerWrapper()
{
  return &type metadata for AAUISignInViewControllerWrapper;
}

uint64_t sub_220D864EC()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564C688);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564C680);
  sub_220D862A8();
  swift_getOpaqueTypeConformance2();
  sub_220D86318();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_220D86580()
{
  unint64_t result;

  result = qword_25564C6E0;
  if (!qword_25564C6E0)
  {
    result = MEMORY[0x227665754](&unk_220D9CAA0, &type metadata for AAUISignInViewControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_25564C6E0);
  }
  return result;
}

uint64_t sub_220D865C4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_220D865E8()
{
  uint64_t v0;

  sub_220D84CE4(v0);
}

uint64_t PASFlowStepTargetStart.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C6F0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v11 - v6;
  v11[0] = v0;
  v8 = sub_220D86704();
  sub_220D99178();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUITargetStartView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  v9 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

unint64_t sub_220D86704()
{
  unint64_t result;

  result = qword_25564C6F8;
  if (!qword_25564C6F8)
  {
    result = MEMORY[0x227665754](&unk_220D9CBB8, &type metadata for PASUITargetStartView);
    atomic_store(result, (unint64_t *)&qword_25564C6F8);
  }
  return result;
}

uint64_t sub_220D86748()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C6F0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v11 - v6;
  v11[0] = *v0;
  v8 = sub_220D86704();
  sub_220D99178();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUITargetStartView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  v9 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

ValueMetadata *type metadata accessor for PASUITargetStartView()
{
  return &type metadata for PASUITargetStartView;
}

uint64_t sub_220D8686C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D8687C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    return sub_220D6B788();
  return result;
}

uint64_t sub_220D86894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = 0;
  if (a2)
  {
    if (a4)
      return sub_220D6B854();
  }
  return result;
}

void sub_220D868D0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = sub_220D8687C;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = sub_220D86894;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v1;
}

uint64_t PASFlowStepRepairFamily.buildView()()
{
  ValueMetadata *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  ValueMetadata *v12;
  unint64_t v13;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C730);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v12 - v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B120);
  swift_allocObject();
  v8 = sub_220D988B4();
  v12 = v0;
  v13 = v8;
  v9 = sub_220D86A48();
  sub_220D99178();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v12 = &type metadata for PASUIRepairFamilyView;
  v13 = v9;
  swift_getOpaqueTypeConformance2();
  v10 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v10;
}

unint64_t sub_220D86A48()
{
  unint64_t result;

  result = qword_25564C738;
  if (!qword_25564C738)
  {
    result = MEMORY[0x227665754](&unk_220D9CC78, &type metadata for PASUIRepairFamilyView);
    atomic_store(result, &qword_25564C738);
  }
  return result;
}

uint64_t sub_220D86A8C()
{
  ValueMetadata **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  ValueMetadata *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  ValueMetadata *v13;
  unint64_t v14;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C730);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - v6;
  v8 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564B120);
  swift_allocObject();
  v9 = sub_220D988B4();
  v13 = v8;
  v14 = v9;
  v10 = sub_220D86A48();
  sub_220D99178();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v13 = &type metadata for PASUIRepairFamilyView;
  v14 = v10;
  swift_getOpaqueTypeConformance2();
  v11 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v11;
}

uint64_t destroy for PASUIRepairFamilyView()
{
  swift_release();
  return swift_release();
}

_QWORD *_s23ProximityAppleIDSetupUI21PASUIRepairFamilyViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PASUIRepairFamilyView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for PASUIRepairFamilyView(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PASUIRepairFamilyView()
{
  return &type metadata for PASUIRepairFamilyView;
}

uint64_t sub_220D86CD4()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_220D86CE4()
{
  qword_25564C700 = 0x64497265626D656DLL;
  *(_QWORD *)algn_25564C708 = 0xE800000000000000;
}

void sub_220D86D08()
{
  qword_25564C710 = 0x44495344746C61;
  *(_QWORD *)algn_25564C718 = 0xE700000000000000;
}

void sub_220D86D2C()
{
  qword_25564C720 = 0x6574736575716572;
  *(_QWORD *)algn_25564C728 = 0xE900000000000072;
}

uint64_t sub_220D86D54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v6 = sub_220D98E00();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_220D9943C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  swift_retain_n();
  swift_retain();
  sub_220D99424();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(&v8[*(int *)(v6 + 20)], v12, v9);
  *(_QWORD *)v8 = &unk_25564C748;
  *((_QWORD *)v8 + 1) = v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564A918);
  sub_220D5CD14((uint64_t)v8, a3 + *(int *)(v14 + 36));
  *(_QWORD *)a3 = sub_220D5CC08;
  *(_QWORD *)(a3 + 8) = a1;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = sub_220D5C674;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 40) = sub_220D5C6A4;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_BYTE *)(a3 + 80) = 1;
  *(_QWORD *)(a3 + 88) = MEMORY[0x24BEE4AF8];
  sub_220D5CD58();
  sub_220D5CD60((uint64_t)sub_220D5C674);
  sub_220D5CD60((uint64_t)sub_220D5C6A4);
  swift_bridgeObjectRetain();
  sub_220D5CD70((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_220D5CDAC();
  sub_220D5CDB4((uint64_t)sub_220D5C674);
  sub_220D5CDB4((uint64_t)sub_220D5C6A4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D86F48(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v5;

  v2[2] = sub_220D99418();
  v2[3] = sub_220D9940C();
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_220D69344;
  return sub_220D86FBC(a1, a2);
}

uint64_t sub_220D86FBC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[53] = a1;
  v2[54] = a2;
  v3 = sub_220D98C98();
  v2[55] = v3;
  v2[56] = *(_QWORD *)(v3 - 8);
  v2[57] = swift_task_alloc();
  v2[58] = swift_task_alloc();
  v2[59] = swift_task_alloc();
  v2[60] = swift_task_alloc();
  sub_220D99418();
  v2[61] = sub_220D9940C();
  v2[62] = sub_220D993F4();
  v2[63] = v4;
  return swift_task_switch();
}

uint64_t sub_220D87078()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t inited;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v43;
  _QWORD *v44;
  id v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  BOOL v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint8_t *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  void (*v59)(uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;

  v1 = v0[60];
  v2 = v0[55];
  v3 = v0[56];
  v4 = sub_220D98C80();
  v0[64] = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[65] = v5;
  v5(v1, v4, v2);
  v6 = sub_220D98C8C();
  v7 = sub_220D99484();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_220D57000, v6, v7, "PASUIRepairFamilyView repairFamilyForServicesSetup", v8, 2u);
    MEMORY[0x2276657E4](v8, -1, -1);
  }
  v9 = v0[60];
  v10 = v0[55];
  v11 = v0[56];

  v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[66] = v12;
  v12(v9, v10);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE30BB8]), sel_initWithEventType_, *MEMORY[0x24BE30BA8]);
  v0[67] = v13;
  v14 = sub_220D98A94();
  v0[68] = v14;
  if (!v14)
    goto LABEL_13;
  v15 = (void *)v14;
  v16 = sub_220D98AA0();
  if (!v17)
  {

LABEL_13:
    sub_220D87E1C();
    v43 = (void *)swift_allocError();
    *v44 = 1;
    swift_willThrow();

    ((void (*)(_QWORD, _QWORD, _QWORD))v0[65])(v0[57], v0[64], v0[55]);
    v45 = v43;
    v46 = v43;
    v47 = sub_220D98C8C();
    v48 = sub_220D9946C();
    v49 = os_log_type_enabled(v47, v48);
    v50 = (void (*)(uint64_t, uint64_t))v0[66];
    v51 = v0[57];
    v52 = v0[55];
    if (v49)
    {
      v60 = v0[57];
      v59 = (void (*)(uint64_t, uint64_t))v0[66];
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = swift_slowAlloc();
      v61 = v54;
      *(_DWORD *)v53 = 136446210;
      v0[50] = v43;
      v55 = v43;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
      v56 = sub_220D99370();
      v0[49] = sub_220D6593C(v56, v57, &v61);
      sub_220D99508();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_220D57000, v47, v48, "PASUIRepairFamilyView repairFamilyForServicesSetup failed: %{public}s", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v54, -1, -1);
      MEMORY[0x2276657E4](v53, -1, -1);

      v59(v60, v52);
    }
    else
    {

      v50(v51, v52);
    }
    v58 = (_QWORD *)swift_task_alloc();
    v0[70] = v58;
    *v58 = v0;
    v58[1] = sub_220D87BEC;
    return sub_220D98A88();
  }
  v18 = v16;
  v19 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564C760);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220D9CC10;
  if (qword_25564A8A0 != -1)
    swift_once();
  v21 = *(_QWORD *)algn_25564C708;
  *(_QWORD *)(inited + 32) = qword_25564C700;
  *(_QWORD *)(inited + 40) = v21;
  *(_QWORD *)(inited + 72) = sub_220D87E60();
  *(_QWORD *)(inited + 48) = v15;
  v22 = qword_25564A8A8;
  swift_bridgeObjectRetain();
  v23 = v15;
  if (v22 != -1)
    swift_once();
  v24 = *(_QWORD *)algn_25564C718;
  v25 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 80) = qword_25564C710;
  *(_QWORD *)(inited + 88) = v24;
  *(_QWORD *)(inited + 120) = v25;
  *(_QWORD *)(inited + 96) = v18;
  *(_QWORD *)(inited + 104) = v19;
  v26 = qword_25564A8B0;
  swift_bridgeObjectRetain();
  if (v26 != -1)
    swift_once();
  v28 = v0[53];
  v27 = v0[54];
  v29 = *(_QWORD *)algn_25564C728;
  *(_QWORD *)(inited + 128) = qword_25564C720;
  *(_QWORD *)(inited + 136) = v29;
  swift_bridgeObjectRetain();
  v30 = *(void **)sub_220D988FC();
  type metadata accessor for AKAppleIDAuthenticationAppProvidedContext(0);
  *(_QWORD *)(inited + 168) = v31;
  *(_QWORD *)(inited + 144) = v30;
  v32 = v30;
  sub_220D72688(inited);
  v33 = (void *)sub_220D992F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setAdditionalParameters_, v33);

  (*(void (**)(void))(*(_QWORD *)v27 + 128))();
  v35 = v0[46];
  v34 = v0[47];
  __swift_project_boxed_opaque_existential_1(v0 + 43, v35);
  v36 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 16))(v35, v34);
  v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE30BC0]), sel_initWithPresenter_, v36);
  v0[69] = v37;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 43));
  objc_msgSend(v37, sel_setPresentationType_, 1);
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v28;
  *(_QWORD *)(v38 + 24) = v27;
  v0[36] = sub_220D87EA0;
  v0[37] = v38;
  v39 = MEMORY[0x24BDAC760];
  v0[32] = MEMORY[0x24BDAC760];
  v0[33] = 1107296256;
  v0[34] = sub_220D79A30;
  v0[35] = &block_descriptor_5;
  v40 = _Block_copy(v0 + 32);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v37, sel_setPresentationHandler_, v40);
  _Block_release(v40);
  v0[7] = v0 + 48;
  v0[2] = v0;
  v0[3] = sub_220D876F0;
  v41 = swift_continuation_init();
  v0[38] = v39;
  v0[39] = 0x40000000;
  v0[40] = sub_220D87D90;
  v0[41] = &block_descriptor_7_1;
  v0[42] = v41;
  objc_msgSend(v37, sel_performWithContext_completion_, v13, v0 + 38);
  return swift_continuation_await();
}

uint64_t sub_220D876F0()
{
  return swift_task_switch();
}

uint64_t sub_220D87734()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void *v16;
  void *v17;
  void *v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD *v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  BOOL v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  void (*v40)(uint64_t, uint64_t);
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;

  v1 = *(void **)(v0 + 384);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 520))(*(_QWORD *)(v0 + 472), *(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 440));
  v2 = v1;
  v3 = sub_220D98C8C();
  v4 = sub_220D99484();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v41 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 141558274;
    *(_QWORD *)(v0 + 408) = 1752392040;
    sub_220D99508();
    *(_WORD *)(v5 + 12) = 2112;
    *(_QWORD *)(v0 + 416) = v2;
    v6 = v2;
    sub_220D99508();
    *v41 = v2;

    _os_log_impl(&dword_220D57000, v3, v4, "PASUIRepairFamilyView repairFamilyForServicesSetup got response %{mask.hash}@", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v41, -1, -1);
    MEMORY[0x2276657E4](v5, -1, -1);
  }
  else
  {

    v3 = v2;
  }
  v7 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
  v8 = *(_QWORD *)(v0 + 472);
  v9 = *(_QWORD *)(v0 + 440);

  v7(v8, v9);
  if ((-[NSObject loadSuccess](v2, sel_loadSuccess) & 1) != 0)
  {
    v10 = *(void **)(v0 + 552);
    v11 = *(void **)(v0 + 544);
    v12 = *(void **)(v0 + 536);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 520))(*(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 440));
    v13 = sub_220D98C8C();
    v14 = sub_220D9946C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_220D57000, v13, v14, "PASUIRepairFamilyView repairFamilyForServicesSetup response: load fail", v15, 2u);
      MEMORY[0x2276657E4](v15, -1, -1);
    }
    v16 = *(void **)(v0 + 552);
    v17 = *(void **)(v0 + 544);
    v18 = *(void **)(v0 + 536);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    v20 = *(_QWORD *)(v0 + 464);
    v21 = *(_QWORD *)(v0 + 440);

    v19(v20, v21);
    v22 = -[NSObject error](v2, sel_error);
    sub_220D87E1C();
    v23 = (void *)swift_allocError();
    *v24 = v22;
    swift_willThrow();

    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 520))(*(_QWORD *)(v0 + 456), *(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 440));
    v25 = v23;
    v26 = v23;
    v27 = sub_220D98C8C();
    v28 = sub_220D9946C();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    v31 = *(_QWORD *)(v0 + 456);
    v32 = *(_QWORD *)(v0 + 440);
    if (v29)
    {
      v42 = *(_QWORD *)(v0 + 456);
      v40 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v43 = v34;
      *(_DWORD *)v33 = 136446210;
      *(_QWORD *)(v0 + 400) = v23;
      v35 = v23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
      v36 = sub_220D99370();
      *(_QWORD *)(v0 + 392) = sub_220D6593C(v36, v37, &v43);
      sub_220D99508();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_220D57000, v27, v28, "PASUIRepairFamilyView repairFamilyForServicesSetup failed: %{public}s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v34, -1, -1);
      MEMORY[0x2276657E4](v33, -1, -1);

      v40(v42, v32);
    }
    else
    {

      v30(v31, v32);
    }
  }
  v38 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 560) = v38;
  *v38 = v0;
  v38[1] = sub_220D87BEC;
  return sub_220D98A88();
}

uint64_t sub_220D87BEC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_220D87C38()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D87C98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_220D98C98();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_220D98C8C();
  v6 = sub_220D99484();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_220D57000, v5, v6, "PASUIRepairFamilyView familyCirclePresentationHandler", v7, 2u);
    MEMORY[0x2276657E4](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_220D87D90(uint64_t a1, void *a2)
{
  id v2;

  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  v2 = a2;
  return swift_continuation_resume();
}

uint64_t sub_220D87DC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_220D86D54(*v1, v1[1], a1);
}

uint64_t sub_220D87DCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_220D5CCCC;
  return sub_220D86F48(v2, v3);
}

unint64_t sub_220D87E1C()
{
  unint64_t result;

  result = qword_25564C758;
  if (!qword_25564C758)
  {
    result = MEMORY[0x227665754](MEMORY[0x24BE7B900], MEMORY[0x24BE7B8F8]);
    atomic_store(result, (unint64_t *)&qword_25564C758);
  }
  return result;
}

unint64_t sub_220D87E60()
{
  unint64_t result;

  result = qword_25564C768;
  if (!qword_25564C768)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25564C768);
  }
  return result;
}

uint64_t sub_220D87EA0()
{
  return sub_220D87C98();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

void sub_220D87EC0(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_220D99508();
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

void sub_220D87F74(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_220D87FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_220D987F4();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

id sub_220D88154()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController);
  }
  else
  {
    v4 = sub_220D881B4(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_220D881B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v13;

  v2 = sub_220D98884();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_220D988A8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564C938);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7BB0]), sel_init);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_identity, v3);
  swift_bridgeObjectRetain();
  sub_220D98890();
  sub_220D994D8();
  v11 = sub_220D994E4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  sub_220D994F0();
  objc_msgSend(v10, sel_setDelegate_, a1);
  return v10;
}

_QWORD *sub_220D88348()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy;
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy))
  {
    v2 = *(_QWORD **)(v0
                    + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy);
  }
  else
  {
    type metadata accessor for WeakHostWrapper();
    v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    type metadata accessor for PASUIExtensionProxy();
    v2 = (_QWORD *)swift_allocObject();
    v2[2] = 0;
    v2[5] = 0;
    swift_unknownObjectWeakInit();
    v2[3] = v3;
    v2[5] = &off_24E6A3A70;
    swift_unknownObjectWeakAssign();
    *(_QWORD *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

void sub_220D88410(void *a1, void *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  id v36;
  id v37;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  char v45;
  uint64_t v46;

  v4 = v3;
  v8 = sub_220D98C98();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v38 - v13;
  v15 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_finished;
  v16 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_finished);
  v17 = sub_220D98C80();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  if (v16 == 1)
  {
    v18(v14, v17, v8);
    v19 = a3 & 1;
    sub_220D8A1BC(a1, a2, a3 & 1);
    sub_220D8A1BC(a1, a2, a3 & 1);
    v20 = sub_220D98C8C();
    v21 = sub_220D9946C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v46 = v23;
      *(_DWORD *)v22 = 141558274;
      v43 = 1752392040;
      sub_220D99508();
      *(_WORD *)(v22 + 12) = 2080;
      v42 = v9;
      v43 = (uint64_t)a1;
      v44 = a2;
      v45 = v19;
      sub_220D8A1BC(a1, a2, v19);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564C930);
      v24 = sub_220D99370();
      v40 = v8;
      v43 = sub_220D6593C(v24, v25, &v46);
      sub_220D99508();
      swift_bridgeObjectRelease();
      sub_220D8A1E8(a1, a2, v19);
      sub_220D8A1E8(a1, a2, v19);
      _os_log_impl(&dword_220D57000, v20, v21, "PASUIHostViewController finish with result is discarding result %{mask.hash}s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v23, -1, -1);
      MEMORY[0x2276657E4](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v42 + 8))(v14, v40);
    }
    else
    {
      sub_220D8A1E8(a1, a2, v19);
      sub_220D8A1E8(a1, a2, v19);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
  }
  else
  {
    v42 = v9;
    v18(v12, v17, v8);
    v41 = a3;
    v26 = a3 & 1;
    sub_220D8A1BC(a1, a2, v26);
    sub_220D8A1BC(a1, a2, v26);
    v27 = sub_220D98C8C();
    v28 = sub_220D99454();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v40 = v8;
      v30 = v29;
      v39 = swift_slowAlloc();
      v46 = v39;
      *(_DWORD *)v30 = 141558274;
      v43 = 1752392040;
      sub_220D99508();
      *(_WORD *)(v30 + 12) = 2080;
      v38[1] = v30 + 14;
      v43 = (uint64_t)a1;
      v44 = a2;
      v45 = v26;
      sub_220D8A1BC(a1, a2, v26);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564C930);
      v31 = sub_220D99370();
      v43 = sub_220D6593C(v31, v32, &v46);
      sub_220D99508();
      swift_bridgeObjectRelease();
      sub_220D8A1E8(a1, a2, v26);
      sub_220D8A1E8(a1, a2, v26);
      _os_log_impl(&dword_220D57000, v27, v28, "PASUIHostViewController finish with result: %{mask.hash}s", (uint8_t *)v30, 0x16u);
      v33 = v39;
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v33, -1, -1);
      MEMORY[0x2276657E4](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v42 + 8))(v12, v40);
    }
    else
    {
      sub_220D8A1E8(a1, a2, v26);
      sub_220D8A1E8(a1, a2, v26);

      (*(void (**)(char *, uint64_t))(v42 + 8))(v12, v8);
    }
    v34 = v41;
    *(_BYTE *)(v4 + v15) = 1;
    v35 = MEMORY[0x227665880](v4 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate);
    if ((v34 & 1) != 0)
    {
      if (v35)
      {
        sub_220D8A1BC(a1, a2, 1);
        sub_220D7538C(a1);
        swift_unknownObjectRelease();
        sub_220D8A1E8(a1, a2, 1);
      }
    }
    else if (v35)
    {
      v36 = a1;
      v37 = a2;
      sub_220D750A4(v36, v37);

      swift_unknownObjectRelease();
    }
  }
}

id sub_220D8896C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUIExtensionHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220D88A24()
{
  return type metadata accessor for PASUIExtensionHostViewController();
}

uint64_t type metadata accessor for PASUIExtensionHostViewController()
{
  uint64_t result;

  result = qword_25564C7C0;
  if (!qword_25564C7C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_220D88A68()
{
  uint64_t result;
  unint64_t v1;

  result = sub_220D988A8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

id sub_220D88AFC(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  char **v9;
  id result;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD *v19;
  uint8_t *v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;

  v2 = v1;
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)objc_opt_self();
  v9 = &selRef_BOOLValue;
  result = objc_msgSend(v8, sel_isMainThread);
  if ((_DWORD)result)
  {
    v11 = sub_220D98C80();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
    v12 = a1;
    v13 = sub_220D98C8C();
    v14 = sub_220D99454();
    if (os_log_type_enabled(v13, v14))
    {
      v27 = v2;
      v15 = swift_slowAlloc();
      v25 = v8;
      v16 = (uint8_t *)v15;
      v24 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v16 = 138543362;
      v28 = v12;
      v17 = v12;
      v26 = v4;
      v18 = v17;
      v9 = &selRef_BOOLValue;
      v2 = v27;
      sub_220D99508();
      v19 = v24;
      *v24 = v12;

      v4 = v26;
      _os_log_impl(&dword_220D57000, v13, v14, "PASUIExtensionHostViewController hostViewControllerDidActivate: %{public}@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v19, -1, -1);
      v20 = v16;
      v8 = v25;
      MEMORY[0x2276657E4](v20, -1, -1);
    }
    else
    {

      v13 = v12;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    result = objc_msgSend(v8, v9[212]);
    if ((_DWORD)result)
    {
      v21 = v2;
      v22 = sub_220D88348();
      sub_220D770BC((uint64_t)v22);

      return (id)swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_220D88DE8()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = sub_220D88154();
  v5[0] = 0;
  v1 = objc_msgSend(v0, sel_makeXPCConnectionWithError_, v5);

  if (v1)
  {
    v2 = v5[0];
  }
  else
  {
    v3 = v5[0];
    sub_220D98800();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_220D88EA8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v9 = sub_220D992D4();
  v25 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_220D992EC();
  v23 = *(_QWORD *)(v12 - 8);
  v24 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D68258();
  v15 = (void *)sub_220D994B4();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = v4;
  aBlock[4] = sub_220D8A1AC;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_220D79A30;
  aBlock[3] = &block_descriptor_28;
  v17 = _Block_copy(aBlock);
  v18 = a1;
  v19 = a2;
  swift_retain();
  v20 = v4;
  swift_release();
  sub_220D992E0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_220D774B8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C910);
  sub_220D77500();
  sub_220D9952C();
  MEMORY[0x227665088](0, v14, v11, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v24);
}

void sub_220D890A0(void *a1, void *a2, void (*a3)(_QWORD), uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  id v16;
  char *v17;
  id v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[2];
  int v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = sub_220D98C98();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_220D98C80();
  v34 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  v15 = a1;
  v16 = a2;
  v17 = (char *)v15;
  v18 = v16;
  v19 = sub_220D98C8C();
  v20 = sub_220D99454();
  if (os_log_type_enabled(v19, (os_log_type_t)v20))
  {
    v29 = v20;
    v30 = v10;
    v31 = a4;
    v32 = a3;
    v33 = a5;
    v21 = swift_slowAlloc();
    v22 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v21 = 141558530;
    v35 = 1752392040;
    sub_220D99508();
    *(_WORD *)(v21 + 12) = 2112;
    v23 = &v17[*MEMORY[0x24BE7B830]];
    v24 = *((_QWORD *)v23 + 1);
    if (v24)
    {
      v25 = *(_QWORD *)v23;
      v28[1] = v21 + 14;
      sub_220D6E628();
      swift_allocError();
      *v26 = v25;
      v26[1] = v24;
      swift_bridgeObjectRetain();
      v24 = _swift_stdlib_bridgeErrorToNSError();
      v35 = v24;
    }
    else
    {
      v35 = 0;
    }
    sub_220D99508();
    *v22 = v24;

    *(_WORD *)(v21 + 22) = 2114;
    v35 = (uint64_t)v18;
    v27 = v18;
    sub_220D99508();
    v22[1] = v18;

    _os_log_impl(&dword_220D57000, v19, (os_log_type_t)v29, "PASUIExtensionHostViewController extensionDidFinish with account: %{mask.hash}@, context: %{public}@", (uint8_t *)v21, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v22, -1, -1);
    MEMORY[0x2276657E4](v21, -1, -1);

    a3 = v32;
    v10 = v30;
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v10);
  a3(0);
  sub_220D88410(v17, v18, 0);
}

uint64_t sub_220D8944C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v5 = sub_220D992D4();
  v18 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_220D992EC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D68258();
  v12 = (void *)sub_220D994B4();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_220D8A164;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_220D79A30;
  aBlock[3] = &block_descriptor_18_1;
  v14 = _Block_copy(aBlock);
  v15 = v2;
  swift_retain();
  swift_release();
  sub_220D992E0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_220D774B8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C910);
  sub_220D77500();
  sub_220D9952C();
  MEMORY[0x227665088](0, v11, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_220D89630(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;

  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_220D98C8C();
  v10 = sub_220D99454();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_220D57000, v9, v10, "PASUIExtensionHostViewController promptForFlowCancel", v11, 2u);
    MEMORY[0x2276657E4](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (MEMORY[0x227665880](a1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate))
  {
    sub_220D75574();
    swift_unknownObjectRelease();
  }
  return a2(0);
}

uint64_t sub_220D897E0()
{
  return 1;
}

uint64_t sub_220D897E8()
{
  sub_220D99670();
  sub_220D9967C();
  return sub_220D99688();
}

uint64_t sub_220D89828()
{
  return sub_220D9967C();
}

uint64_t sub_220D8984C()
{
  sub_220D99670();
  sub_220D9967C();
  return sub_220D99688();
}

uint64_t sub_220D89964()
{
  uint64_t v0;

  sub_220D671D8(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeakHostWrapper()
{
  return objc_opt_self();
}

uint64_t sub_220D899A8(uint64_t (*a1)(void))
{
  uint64_t result;

  result = a1();
  if (result)
    return _swift_stdlib_bridgeErrorToNSError();
  return result;
}

uint64_t sub_220D899D0(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

id sub_220D899F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v6;
  _BYTE *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  objc_super v14;

  v6 = (objc_class *)type metadata accessor for PASUIExtensionHostViewController();
  v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_finished] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy] = 0;
  v8 = &v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_identity];
  v9 = sub_220D988A8();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  v11 = &v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_sceneID];
  *v11 = a2;
  v11[1] = a3;
  v14.receiver = v7;
  v14.super_class = v6;
  v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, 0, 0);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v12;
}

void sub_220D89AF8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint8_t *v26;
  id v27;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;

  v2 = v1;
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v28 - v9;
  if (objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    if (a1)
    {
      v11 = a1;
      v12 = sub_220D98C80();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v12, v4);
      v13 = a1;
      v14 = a1;
      v15 = sub_220D98C8C();
      v16 = sub_220D9946C();
      if (os_log_type_enabled(v15, v16))
      {
        v28[1] = v2;
        v17 = swift_slowAlloc();
        v29 = v4;
        v18 = (uint8_t *)v17;
        v19 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v18 = 138543362;
        v20 = a1;
        v21 = _swift_stdlib_bridgeErrorToNSError();
        v30 = v21;
        sub_220D99508();
        *v19 = v21;

        _os_log_impl(&dword_220D57000, v15, v16, "PASUIExtensionHostViewController hostViewControllerWillDeactivate error: %{public}@", v18, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
        swift_arrayDestroy();
        MEMORY[0x2276657E4](v19, -1, -1);
        v22 = v18;
        v4 = v29;
        MEMORY[0x2276657E4](v22, -1, -1);
      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      v27 = a1;
      sub_220D88410(a1, 0, 1);

    }
    else
    {
      v23 = sub_220D98C80();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v23, v4);
      v24 = sub_220D98C8C();
      v25 = sub_220D99454();
      if (os_log_type_enabled(v24, (os_log_type_t)v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_220D57000, v24, (os_log_type_t)v25, "PASUIExtensionHostViewController hostViewControllerWillDeactivate", v26, 2u);
        MEMORY[0x2276657E4](v26, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_220D89DE4(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[6];

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a4;
  v9 = MEMORY[0x227665880](a3 + 16);
  if (v9)
  {
    v10 = (void *)v9;
    v15[4] = sub_220D6E74C;
    v15[5] = v8;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 1107296256;
    v15[2] = sub_220D87F74;
    v15[3] = &block_descriptor_8;
    v11 = _Block_copy(v15);
    _Block_copy(a4);
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_extensionDidFinishWith_context_completion_, a1, a2, v11);
    _Block_release(v11);
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_220D8A0DC();
    v13 = (void *)swift_allocError();
    _Block_copy(a4);
    v14 = (void *)sub_220D987F4();
    ((void (**)(_QWORD, void *))a4)[2](a4, v14);

    return swift_release();
  }
}

uint64_t sub_220D89F5C(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  v5 = MEMORY[0x227665880](a1 + 16);
  if (v5)
  {
    v6 = (void *)v5;
    v11[4] = sub_220D6E71C;
    v11[5] = v4;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_220D87F74;
    v11[3] = &block_descriptor_6;
    v7 = _Block_copy(v11);
    _Block_copy(a2);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_promptForFlowCancelWithCompletion_, v7);
    _Block_release(v7);
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_220D8A0DC();
    v9 = (void *)swift_allocError();
    _Block_copy(a2);
    v10 = (void *)sub_220D987F4();
    ((void (**)(_QWORD, void *))a2)[2](a2, v10);

    return swift_release();
  }
}

uint64_t sub_220D8A0B8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

unint64_t sub_220D8A0DC()
{
  unint64_t result;

  result = qword_25564C8F8;
  if (!qword_25564C8F8)
  {
    result = MEMORY[0x227665754](&unk_220D9CE70, &type metadata for WeakHostWrapper.WeakHostWrapperError);
    atomic_store(result, (unint64_t *)&qword_25564C8F8);
  }
  return result;
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_220D8A138()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D8A164()
{
  uint64_t v0;

  return sub_220D89630(*(_QWORD *)(v0 + 16), *(uint64_t (**)(_QWORD))(v0 + 24));
}

uint64_t sub_220D8A170()
{
  id *v0;

  swift_release();
  return swift_deallocObject();
}

void sub_220D8A1AC()
{
  uint64_t v0;

  sub_220D890A0(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void (**)(_QWORD))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

id sub_220D8A1BC(void *a1, void *a2, char a3)
{
  id v4;

  if ((a3 & 1) != 0)
    return a1;
  v4 = a1;
  return a2;
}

void sub_220D8A1E8(void *a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)
  {

  }
  else
  {

  }
}

uint64_t getEnumTagSinglePayload for WeakHostWrapper.WeakHostWrapperError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WeakHostWrapper.WeakHostWrapperError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_220D8A2A8 + 4 * byte_220D9CCD0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_220D8A2C8 + 4 * byte_220D9CCD5[v4]))();
}

_BYTE *sub_220D8A2A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_220D8A2C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_220D8A2D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_220D8A2D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_220D8A2E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_220D8A2E8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_220D8A2F4()
{
  return 0;
}

ValueMetadata *type metadata accessor for WeakHostWrapper.WeakHostWrapperError()
{
  return &type metadata for WeakHostWrapper.WeakHostWrapperError;
}

unint64_t sub_220D8A310()
{
  unint64_t result;

  result = qword_25564C940;
  if (!qword_25564C940)
  {
    result = MEMORY[0x227665754](&unk_220D9CE48, &type metadata for WeakHostWrapper.WeakHostWrapperError);
    atomic_store(result, (unint64_t *)&qword_25564C940);
  }
  return result;
}

uint64_t *PASUIConstants.extensionDefaultSceneID.unsafeMutableAddressor()
{
  if (qword_25564A8B8 != -1)
    swift_once();
  return &static PASUIConstants.extensionDefaultSceneID;
}

void sub_220D8A3B8()
{
  static PASUIConstants.extensionDefaultSceneID = 0x746C7561666564;
  unk_255650650 = 0xE700000000000000;
}

uint64_t static PASUIConstants.extensionDefaultSceneID.getter()
{
  uint64_t v0;

  if (qword_25564A8B8 != -1)
    swift_once();
  v0 = static PASUIConstants.extensionDefaultSceneID;
  swift_bridgeObjectRetain();
  return v0;
}

ValueMetadata *type metadata accessor for PASUIConstants()
{
  return &type metadata for PASUIConstants;
}

id sub_220D8A448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  void (*v20)(_QWORD *__return_ptr, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  void (*v31)(_QWORD *__return_ptr, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint8_t *v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;

  v5 = v4;
  v8 = sub_220D98C98();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1AA20]), sel_initWithCDPContext_, a3);
  v13 = (void *)sub_220D99340();
  objc_msgSend(v12, sel_setFeatureName_, v13);

  if (*(_BYTE *)(v4 + 24))
    v14 = 3;
  else
    v14 = 0;
  objc_msgSend(v12, sel_setDeviceToDeviceEncryptionUpgradeUIStyle_, v14);
  objc_msgSend(v12, sel_setDeviceToDeviceEncryptionUpgradeType_, 0);
  v15 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v15, v8);
  swift_retain_n();
  v16 = sub_220D98C8C();
  v17 = sub_220D99460();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v39 = v19;
    v41 = v8;
    *(_DWORD *)v18 = 136446210;
    v43 = v19;
    v37 = v18 + 4;
    v38 = v18;
    v20 = *(void (**)(_QWORD *__return_ptr, uint64_t))(**(_QWORD **)(v5 + 16) + 128);
    v21 = swift_retain();
    v20(v44, v21);
    swift_release();
    v42 = a4;
    v40 = v9;
    v22 = v45;
    v23 = v46;
    __swift_project_boxed_opaque_existential_1(v44, v45);
    v24 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 16))(v22, v23);
    v25 = objc_msgSend(v24, sel_description);
    v26 = sub_220D99364();
    v28 = v27;

    a4 = v42;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    v44[0] = sub_220D6593C(v26, v28, &v43);
    sub_220D99508();
    swift_release_n();
    swift_bridgeObjectRelease();
    v29 = v38;
    _os_log_impl(&dword_220D57000, v16, v17, "Passing view controller from PASUIManateeRepairHelperProvider: %{public}s", v38, 0xCu);
    v30 = v39;
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v30, -1, -1);
    MEMORY[0x2276657E4](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v41);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v31 = *(void (**)(_QWORD *__return_ptr, uint64_t))(**(_QWORD **)(v5 + 16) + 128);
  v32 = swift_retain();
  v31(v44, v32);
  swift_release();
  v33 = v45;
  v34 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  v35 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 16))(v33, v34);
  objc_msgSend(v12, sel_setPresentingViewController_, v35);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  objc_msgSend(v12, sel_setSecurityUpgradeContext_, a4);
  return v12;
}

void PASUIManateeRepairHelperProvider.helper(withFeatureName:cdpContext:securityUpgradeContext:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  id v6;
  id v7;

  v6 = sub_220D8A448(a1, a2, a3, a4);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1AA28]), sel_initWithContext_, v6);
  a5[3] = sub_220D8A82C();
  a5[4] = &protocol witness table for CDPUIDeviceToDeviceEncryptionHelper;

  *a5 = v7;
}

unint64_t sub_220D8A82C()
{
  unint64_t result;

  result = qword_25564C950;
  if (!qword_25564C950)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25564C950);
  }
  return result;
}

uint64_t PASUIManateeRepairHelperProvider.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t PASUIManateeRepairHelperProvider.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

void sub_220D8A8A8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  id v6;
  id v7;

  v6 = sub_220D8A448(a1, a2, a3, a4);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1AA28]), sel_initWithContext_, v6);
  a5[3] = sub_220D8A82C();
  a5[4] = &protocol witness table for CDPUIDeviceToDeviceEncryptionHelper;

  *a5 = v7;
}

uint64_t sub_220D8A914()
{
  void **v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *v0;
  v1[7] = v1 + 15;
  v1[2] = v1;
  v1[3] = sub_220D8A9A8;
  v3 = swift_continuation_init();
  v1[10] = MEMORY[0x24BDAC760];
  v4 = v1 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_220D8AA2C;
  v4[3] = &block_descriptor_7;
  v4[4] = v3;
  objc_msgSend(v2, sel_performDeviceToDeviceEncryptionStateRepairWithCompletion_, v4);
  return swift_continuation_await();
}

uint64_t sub_220D8A9A8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v1 = *v0;
  if (*(_QWORD *)(v1 + 48))
  {
    swift_willThrow();
    v2 = *(uint64_t (**)(uint64_t))(v1 + 8);
    v3 = 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(v1 + 120);
    v2 = *(uint64_t (**)(uint64_t))(v1 + 8);
  }
  return v2(v3);
}

uint64_t type metadata accessor for PASUIManateeRepairHelperProvider()
{
  return objc_opt_self();
}

uint64_t sub_220D8AA2C(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564AC48);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

void sub_220D8AAAC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void (*v18)(id *__return_ptr, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t ObjectType;
  void (*v22)(id *__return_ptr, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AEE0);
  v38 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AEE8);
  v11 = *(_QWORD *)(v10 - 8);
  v39 = v10;
  v40 = v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CB30);
  v15 = *(_QWORD *)(v14 - 8);
  v41 = v14;
  v42 = v15;
  MEMORY[0x24BDAC7A8](v14);
  v37 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D99394();
  v17 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setTitle_, v17);

  v18 = *(void (**)(id *__return_ptr, uint64_t))(**(_QWORD **)(v1 + 16) + 128);
  v19 = swift_retain();
  v18(&v43, v19);
  swift_release();
  v20 = v44;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v20 + 40))(ObjectType, v20);
  swift_unknownObjectRelease();
  v22 = *(void (**)(id *__return_ptr, uint64_t))(**(_QWORD **)(v1 + 16) + 128);
  v23 = swift_retain();
  v22(&v43, v23);
  swift_release();
  v24 = v44;
  v25 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v24 + 56))(v25, v24);
  swift_unknownObjectRelease();
  sub_220D6839C(&qword_25564AEF0, &qword_25564AED8, MEMORY[0x24BDB9EE8]);
  sub_220D98CA4();
  sub_220D73EBC(0, (unint64_t *)&qword_25564C900);
  v43 = (id)sub_220D994B4();
  v26 = sub_220D9949C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v5, 1, 1, v26);
  sub_220D6839C(&qword_25564AEF8, &qword_25564AEE0, MEMORY[0x24BDB9450]);
  sub_220D68294();
  v27 = v36;
  sub_220D98D10();
  sub_220D5D018((uint64_t)v5, &qword_25564AED0);

  (*(void (**)(char *, uint64_t))(v38 + 8))(v9, v27);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564CB38);
  sub_220D6839C(&qword_25564AF08, &qword_25564AEE8, MEMORY[0x24BDB9A08]);
  v28 = v37;
  v29 = v39;
  sub_220D98D04();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v29);
  swift_getKeyPath();
  v43 = a1;
  sub_220D6839C(&qword_25564CB40, &qword_25564CB30, MEMORY[0x24BDB96C0]);
  v30 = v41;
  sub_220D98D28();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v28, v30);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  swift_release();
  sub_220D99394();
  v31 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  sub_220D99394();
  v32 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  sub_220D99394();
  v33 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  sub_220D99394();
  v34 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v35 = objc_msgSend(a1, sel_dismissalConfirmationActionWithTitle_message_confirmButtonTitle_cancelButtonTitle_, v31, v32, v33, v34);

  objc_msgSend(a1, sel_setDismissButtonAction_, v35);
}

uint64_t sub_220D8B040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = 0;
  if (a4 && a2)
  {
    sub_220D9955C();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    sub_220D993AC();
    sub_220D993AC();
    v4 = sub_220D99394();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_220D8B124@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
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
  uint64_t result;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[40];
  _BYTE v27[40];
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  v6 = a1 + 40;
  sub_220D683DC(a1, (uint64_t)v26);
  sub_220D683DC(v6, (uint64_t)v27);
  sub_220D8BE88((uint64_t)v26, (uint64_t)v28);
  v7 = v29;
  if (v29)
  {
    v8 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v8 + 8))(v23, v7, v8);
    v9 = v24;
    v10 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    v7 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    sub_220D5D018((uint64_t)v27, (uint64_t *)&unk_25564AF10);
  }
  else
  {
    sub_220D5D018((uint64_t)v27, (uint64_t *)&unk_25564AF10);
    sub_220D5D018((uint64_t)v28, (uint64_t *)&unk_25564AF10);
    v11 = 0;
  }
  sub_220D683DC(a1, (uint64_t)v26);
  sub_220D683DC(v6, (uint64_t)v27);
  sub_220D8BE88((uint64_t)v27, (uint64_t)v28);
  v13 = v29;
  if (v29)
  {
    v14 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v14 + 8))(v23, v13, v14);
    v15 = v24;
    v16 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
    v13 = v18;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    sub_220D5D018((uint64_t)v26, (uint64_t *)&unk_25564AF10);
  }
  else
  {
    sub_220D5D018((uint64_t)v26, (uint64_t *)&unk_25564AF10);
    sub_220D5D018((uint64_t)v28, (uint64_t *)&unk_25564AF10);
    v17 = 0;
  }
  v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a2 + 152))(v11, v7, v17, v13);
  v21 = v20;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a3 = v19;
  a3[1] = v21;
  return result;
}

void sub_220D8B344(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_subtitle);
  if (v3)
  {
    v4 = v3;
    v5 = sub_220D99364();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_220D8B3A8(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_220D99340();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setSubtitle_);

}

uint64_t sub_220D8B404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[4];

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_220D9943C();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a2;
  v14[5] = a3;
  LODWORD(a2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  swift_retain();
  if ((_DWORD)a2 == 1)
  {
    sub_220D5D018((uint64_t)v11, &qword_25564B0E0);
    v15 = 0;
    v16 = 0;
  }
  else
  {
    sub_220D99430();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
    if (v14[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v15 = sub_220D993F4();
      v16 = v17;
      swift_unknownObjectRelease();
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
  }
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a6;
  *(_QWORD *)(v18 + 24) = v14;
  if (v16 | v15)
  {
    v20[0] = 0;
    v20[1] = 0;
    v20[2] = v15;
    v20[3] = v16;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_220D8B5E4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PASUIProxCardAdapterBase()
{
  return objc_opt_self();
}

uint64_t sub_220D8B630()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 136))();
}

void sub_220D8B658(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t aBlock;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;

  sub_220D99394();
  sub_220D99394();
  v8 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v8, v9, 1);

  sub_220D99394();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a4;
  *(_QWORD *)(v11 + 24) = a5;
  swift_retain();
  v12 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v27 = sub_220D8B988;
  v28 = v11;
  v13 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v24 = 1107296256;
  v25 = sub_220D76398;
  v26 = &block_descriptor_8;
  v14 = _Block_copy(&aBlock);
  swift_release();
  v15 = (void *)objc_opt_self();
  v16 = objc_msgSend(v15, sel_actionWithTitle_style_handler_, v12, 1, v14);
  _Block_release(v14);

  objc_msgSend(v10, sel_addAction_, v16);
  sub_220D99394();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  swift_retain();
  v18 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v27 = sub_220D8B9D8;
  v28 = v17;
  aBlock = v13;
  v24 = 1107296256;
  v25 = sub_220D76398;
  v26 = &block_descriptor_6;
  v19 = _Block_copy(&aBlock);
  swift_release();
  v20 = objc_msgSend(v15, sel_actionWithTitle_style_handler_, v18, 2, v19);
  _Block_release(v19);

  objc_msgSend(v10, sel_addAction_, v20);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v10, 1, 0);

}

uint64_t sub_220D8B964()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D8B988(uint64_t a1)
{
  uint64_t v1;

  return sub_220D8B404(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&unk_24E6A3E80, (uint64_t)&unk_24E6A3EA8, (uint64_t)&unk_25564CB20);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_220D8B9D8(uint64_t a1)
{
  uint64_t v1;

  return sub_220D8B404(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&unk_24E6A3E30, (uint64_t)&unk_24E6A3E58, (uint64_t)&unk_25564CB08);
}

uint64_t sub_220D8BA14()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2 = *(int **)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D5CCCC;
  v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_220D5DA1C;
  return v6();
}

uint64_t sub_220D8BA94()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2 = *(int **)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_220D5DA1C;
  v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_220D5DA1C;
  return v6();
}

void sub_220D8BB10(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, a2);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v5, sel_setContentMode_, 1);
  if (a3)
    v6 = a3;
  else
    v6 = objc_msgSend((id)objc_opt_self(), sel_systemBlueColor);
  v7 = a3;
  objc_msgSend(v5, sel_setTintColor_, v6);

  objc_msgSend(objc_msgSend(a1, sel_mainView), sel_addSubview_, v5);
  swift_unknownObjectRelease();
  v8 = objc_msgSend(objc_msgSend(a1, sel_mainView), sel_mainContentGuide);
  swift_unknownObjectRelease();
  v9 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564D460);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_220D9AFC0;
  v11 = objc_msgSend(v5, sel_topAnchor);
  v12 = objc_msgSend(v8, sel_topAnchor);
  v13 = objc_msgSend(v11, sel_constraintGreaterThanOrEqualToAnchor_, v12);

  *(_QWORD *)(v10 + 32) = v13;
  v14 = objc_msgSend(v5, sel_bottomAnchor);
  v15 = objc_msgSend(v8, sel_bottomAnchor);
  v16 = objc_msgSend(v14, sel_constraintLessThanOrEqualToAnchor_, v15);

  *(_QWORD *)(v10 + 40) = v16;
  v17 = objc_msgSend(v5, sel_centerXAnchor);
  v18 = objc_msgSend(v8, sel_centerXAnchor);
  v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v18);

  *(_QWORD *)(v10 + 48) = v19;
  v20 = objc_msgSend(v5, sel_centerYAnchor);
  v21 = objc_msgSend(v8, sel_centerYAnchor);
  v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

  *(_QWORD *)(v10 + 56) = v22;
  sub_220D993E8();
  sub_220D73EBC(0, (unint64_t *)&qword_25564AE08);
  v23 = (id)sub_220D993C4();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_activateConstraints_, v23);

}

uint64_t sub_220D8BE6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_220D8B124(a1, v2, a2);
}

char *keypath_get_selector_subtitle()
{
  return sel_subtitle;
}

uint64_t sub_220D8BE88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564AF10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_220D8BEE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v2 = type metadata accessor for PASUIFamilyPickerProxCardAdapter();
  swift_allocObject();
  v3 = swift_retain();
  v4 = sub_220D90210(v3);
  result = swift_release();
  *(_QWORD *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = &off_24E6A3D70;
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_220D8BF50()
{
  sub_220D5D7F4(&qword_25564CE70, MEMORY[0x24BE7B6A8], MEMORY[0x24BE7B4D8]);
  swift_retain();
  sub_220D98E30();
  type metadata accessor for CGSize(0);
  sub_220D99238();
  sub_220D907D4();
  return sub_220D99280();
}

void sub_220D8C004(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint8_t *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint8_t *v29;
  void (*v30)(id *__return_ptr, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t ObjectType;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[3];
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id aBlock;
  uint64_t v75;
  void (*v76)(uint64_t, void *);
  void *v77;
  uint64_t (*v78)(uint64_t);
  uint64_t v79;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B460);
  v71 = *(_QWORD *)(v4 - 8);
  v72 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v70 = (char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CDF8);
  v68 = *(_QWORD *)(v6 - 8);
  v69 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v67 = (char *)v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED0);
  MEMORY[0x24BDAC7A8](v8);
  v63 = (char *)v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CE00);
  MEMORY[0x24BDAC7A8](v10);
  v59 = (char *)v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED8);
  MEMORY[0x24BDAC7A8](v58);
  v57 = (char *)v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CE08);
  v61 = *(_QWORD *)(v13 - 8);
  v62 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v60 = (char *)v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CE10);
  v65 = *(_QWORD *)(v15 - 8);
  v66 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v64 = (char *)v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_220D98C98();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v21, v17);
  swift_unknownObjectRetain_n();
  v22 = sub_220D98C8C();
  v23 = sub_220D99460();
  if (os_log_type_enabled(v22, v23))
  {
    v55[2] = v10;
    v24 = swift_slowAlloc();
    v56 = v2;
    v25 = (uint8_t *)v24;
    v26 = (void *)swift_slowAlloc();
    v73 = (uint64_t)a1;
    aBlock = v26;
    *(_DWORD *)v25 = 136446210;
    v55[1] = v25 + 4;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564CE38);
    v27 = sub_220D99370();
    v73 = sub_220D6593C(v27, v28, (uint64_t *)&aBlock);
    sub_220D99508();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220D57000, v22, v23, "PASUIFamilyPickerProxCardAdapter attach to presenter: %{public}s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v26, -1, -1);
    v29 = v25;
    v2 = v56;
    MEMORY[0x2276657E4](v29, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  sub_220D8AAAC(a1);
  v30 = *(void (**)(id *__return_ptr, uint64_t))(**(_QWORD **)(v2 + 16) + 128);
  v31 = swift_retain();
  v30(&aBlock, v31);
  swift_release();
  v32 = v75;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v32 + 40))(ObjectType, v32);
  swift_unknownObjectRelease();
  sub_220D98A34();
  v34 = MEMORY[0x24BDB9EE8];
  sub_220D6839C(&qword_25564AEF0, &qword_25564AED8, MEMORY[0x24BDB9EE8]);
  sub_220D6839C(&qword_25564CE18, &qword_25564CE00, v34);
  v35 = v60;
  sub_220D98CA4();
  sub_220D68258();
  aBlock = (id)sub_220D994B4();
  v36 = sub_220D9949C();
  v37 = (uint64_t)v63;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v63, 1, 1, v36);
  sub_220D6839C(&qword_25564CE20, &qword_25564CE08, MEMORY[0x24BDB9450]);
  sub_220D5D7F4((unint64_t *)&qword_25564AF00, (uint64_t (*)(uint64_t))sub_220D68258, MEMORY[0x24BEE5670]);
  v38 = v64;
  v39 = v62;
  sub_220D98D10();
  sub_220D5D018(v37, &qword_25564AED0);

  (*(void (**)(char *, uint64_t))(v61 + 8))(v35, v39);
  v40 = swift_allocObject();
  swift_weakInit();
  v41 = swift_allocObject();
  *(_QWORD *)(v41 + 16) = v40;
  *(_QWORD *)(v41 + 24) = a1;
  v42 = swift_allocObject();
  *(_QWORD *)(v42 + 16) = sub_220D900E4;
  *(_QWORD *)(v42 + 24) = v41;
  sub_220D6839C(&qword_25564CE28, &qword_25564CE10, MEMORY[0x24BDB9A08]);
  swift_unknownObjectRetain();
  v43 = v66;
  sub_220D98D1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v43);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  swift_release();
  v44 = v67;
  sub_220D98A4C();
  swift_allocObject();
  swift_weakInit();
  sub_220D6839C(&qword_25564CE30, &qword_25564CDF8, v34);
  v45 = v69;
  sub_220D98D1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v44, v45);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  swift_release();
  v46 = v70;
  sub_220D98A28();
  swift_allocObject();
  swift_weakInit();
  sub_220D6839C(&qword_25564B468, &qword_25564B460, v34);
  v47 = v72;
  sub_220D98D1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v46, v47);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  swift_release();
  v48 = swift_allocObject();
  swift_weakInit();
  v49 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v50 = swift_allocObject();
  *(_QWORD *)(v50 + 16) = v48;
  *(_QWORD *)(v50 + 24) = v49;
  v51 = swift_allocObject();
  *(_QWORD *)(v51 + 16) = sub_220D90150;
  *(_QWORD *)(v51 + 24) = v50;
  swift_retain();
  swift_retain();
  swift_retain();
  v52 = (void *)sub_220D99340();
  v78 = sub_220D6D1E8;
  v79 = v51;
  aBlock = (id)MEMORY[0x24BDAC760];
  v75 = 1107296256;
  v76 = sub_220D76398;
  v77 = &block_descriptor_9;
  v53 = _Block_copy(&aBlock);
  v54 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v52, 0, v53);

  _Block_release(v53);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_msgSend(a1, sel_setDismissButtonAction_, v54);

}

void sub_220D8C954(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t Strong;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  os_log_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  os_log_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  int v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  uint64_t v68;
  id v69;
  uint64_t v70[5];
  uint64_t v71;
  uint64_t aBlock;
  uint64_t v73;
  void (*v74)(uint64_t, void *);
  void *v75;
  uint64_t (*v76)(uint64_t);
  uint64_t v77;

  v7 = sub_220D98C98();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v60 - v12;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    return;
  v15 = Strong;
  v16 = a2 >> 62;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v59 = sub_220D995B0();
    swift_bridgeObjectRelease();
    if (v59)
      goto LABEL_4;
LABEL_24:
    swift_release();
    return;
  }
  if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_24;
LABEL_4:
  v17 = sub_220D98C80();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v66 = v17;
  v67 = v18;
  ((void (*)(char *))v18)(v13);
  sub_220D5CFD4(a1, (uint64_t)&aBlock, (uint64_t *)&unk_25564AF10);
  swift_bridgeObjectRetain_n();
  v19 = sub_220D98C8C();
  v20 = sub_220D99460();
  v65 = v20;
  v21 = os_log_type_enabled(v19, v20);
  v68 = a1;
  v69 = a4;
  if (v21)
  {
    v22 = swift_slowAlloc();
    v63 = a2 >> 62;
    v23 = v22;
    v62 = swift_slowAlloc();
    v71 = v62;
    *(_DWORD *)v23 = 136446466;
    v64 = v11;
    v61 = v19;
    sub_220D5CFD4((uint64_t)&aBlock, (uint64_t)v70, (uint64_t *)&unk_25564AF10);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564AF10);
    v24 = sub_220D99370();
    v70[0] = sub_220D6593C(v24, v25, &v71);
    sub_220D99508();
    swift_bridgeObjectRelease();
    sub_220D5D018((uint64_t)&aBlock, (uint64_t *)&unk_25564AF10);
    *(_WORD *)(v23 + 12) = 2082;
    v26 = sub_220D98BD8();
    v27 = swift_bridgeObjectRetain();
    v28 = MEMORY[0x227664FA4](v27, v26);
    v30 = v29;
    swift_bridgeObjectRelease();
    v31 = v28;
    v11 = v64;
    v70[0] = sub_220D6593C(v31, v30, &v71);
    sub_220D99508();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v32 = v61;
    _os_log_impl(&dword_220D57000, v61, (os_log_type_t)v65, "PASUIFamilyPickerProxCardAdapter publishers updating.\ndevice:%{public}s\nmembers:%{public}s", (uint8_t *)v23, 0x16u);
    v33 = v62;
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v33, -1, -1);
    v34 = v23;
    v16 = v63;
    MEMORY[0x2276657E4](v34, -1, -1);

  }
  else
  {
    sub_220D5D018((uint64_t)&aBlock, (uint64_t *)&unk_25564AF10);

    swift_bridgeObjectRelease_n();
  }
  v35 = *(void (**)(char *, uint64_t))(v8 + 8);
  v35(v13, v7);
  if (v16)
  {
    swift_bridgeObjectRetain();
    v36 = sub_220D995B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v36 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v67(v11, v66, v7);
  swift_bridgeObjectRetain();
  v37 = v11;
  v38 = sub_220D98C8C();
  v39 = sub_220D99484();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v40 = 134349056;
    aBlock = v36;
    sub_220D99508();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220D57000, v38, v39, "The member count is :%{public}ld", v40, 0xCu);
    MEMORY[0x2276657E4](v40, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v41 = v68;
  v35(v37, v7);
  sub_220D902AC(v41, v36 == 1);
  v42 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v43 = v69;
  objc_msgSend(v69, sel_setTitle_, v42);

  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    MEMORY[0x227665148](0, a2);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    swift_retain();
  }
  v44 = sub_220D98BA8();
  v46 = v45;
  swift_release();
  sub_220D90428(v41, v36 == 1, v44, v46);
  swift_bridgeObjectRelease();
  v47 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  objc_msgSend(v43, sel_setSubtitle_, v47);

  sub_220D99394();
  swift_retain();
  v48 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v76 = sub_220D90678;
  v77 = v15;
  aBlock = MEMORY[0x24BDAC760];
  v73 = 1107296256;
  v74 = sub_220D76398;
  v75 = &block_descriptor_29;
  v49 = _Block_copy(&aBlock);
  v50 = (void *)objc_opt_self();
  v51 = objc_msgSend(v50, sel_actionWithTitle_style_handler_, v48, 0, v49);

  _Block_release(v49);
  swift_release();
  swift_retain();
  v52 = sub_220D98A40();
  swift_release();
  if (v52)
    swift_release();
  objc_msgSend(v51, sel_setEnabled_, v52 != 0);
  if (*(_QWORD *)(v15 + 40))
    objc_msgSend(v43, sel_removeAction_);

  v53 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v51;
  v54 = v51;

  sub_220D99394();
  swift_retain();
  v55 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v76 = sub_220D906A0;
  v77 = v15;
  aBlock = MEMORY[0x24BDAC760];
  v73 = 1107296256;
  v74 = sub_220D76398;
  v75 = &block_descriptor_32_1;
  v56 = _Block_copy(&aBlock);
  v57 = objc_msgSend(v50, sel_actionWithTitle_style_handler_, v55, 1, v56);

  _Block_release(v56);
  swift_release();
  objc_msgSend(v57, sel_setEnabled_, sub_220D98A10() & 1);
  if (*(_QWORD *)(v15 + 48))
    objc_msgSend(v43, sel_removeAction_);

  v58 = *(void **)(v15 + 48);
  *(_QWORD *)(v15 + 48) = v57;
  swift_release();

}

uint64_t sub_220D8D178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[5] = a1;
  v4[6] = a4;
  sub_220D99418();
  v4[7] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D8D1E4()
{
  uint64_t v0;
  uint64_t Strong;

  swift_release();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    swift_retain();
    swift_release();
    sub_220D98A70();
    swift_release();
  }
  **(_BYTE **)(v0 + 40) = Strong == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D8D270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = swift_allocObject();
  swift_weakInit();
  sub_220D99418();
  swift_retain();
  v10 = sub_220D9940C();
  v11 = (_QWORD *)swift_allocObject();
  v12 = MEMORY[0x24BEE6930];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v9;
  swift_release();
  sub_220D5FAF4((uint64_t)v7, a4, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_220D8D384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[5] = a1;
  v4[6] = a4;
  sub_220D99418();
  v4[7] = sub_220D9940C();
  v4[8] = sub_220D993F4();
  v4[9] = v5;
  return swift_task_switch();
}

uint64_t sub_220D8D3F0()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 80) = Strong;
  if (Strong)
  {
    *(_QWORD *)(v0 + 88) = *(_QWORD *)(Strong + 32);
    swift_retain();
    swift_release();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v2;
    *v2 = v0;
    v2[1] = sub_220D8D4B4;
    return sub_220D98A58();
  }
  else
  {
    swift_release();
    **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 80) == 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_220D8D4B4()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_220D8D508()
{
  uint64_t v0;

  swift_release();
  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 80) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_220D8D54C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *a1;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v3 = *(void **)(Strong + 40);
    v4 = v3;
    swift_release();
    if (v3)
    {
      if (v1 && (sub_220D98B9C(), v5))
      {
        swift_bridgeObjectRelease();
        v6 = 1;
      }
      else
      {
        v6 = 0;
      }
      objc_msgSend(v4, sel_setEnabled_, v6);

    }
  }
}

void sub_220D8D5EC(unsigned __int8 *a1)
{
  uint64_t v1;
  uint64_t Strong;
  id v3;

  v1 = *a1;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v3 = *(id *)(Strong + 48);
    swift_release();
    objc_msgSend(v3, sel_setEnabled_, v1);

  }
}

uint64_t sub_220D8D66C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result;
    swift_beginAccess();
    v6 = (void *)MEMORY[0x227665880](a3 + 16);
    if (v6)
    {
      v7 = objc_msgSend(v6, sel_viewController);
      v8 = *(_QWORD *)(v5 + 32);
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = sub_220D5F220;
      *(_QWORD *)(v9 + 24) = v8;
      swift_retain_n();
      sub_220D8B658(v7, (uint64_t)&unk_25564CE48, v8, (uint64_t)&unk_25564B480, v9);
      swift_release();
      swift_unknownObjectRelease();

      swift_release();
    }
    return swift_release();
  }
  return result;
}

void sub_220D8D788()
{
  uint64_t v0;

  swift_release();

}

uint64_t sub_220D8D7AC()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PASUIFamilyPickerProxCardAdapter()
{
  return objc_opt_self();
}

uint64_t sub_220D8D810@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  __int128 v45;

  v2 = v1;
  v32 = sub_220D98E00();
  MEMORY[0x24BDAC7A8](v32);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D9943C();
  v7 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  v35 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D8DA54((__int128 *)v2, (uint64_t)&v36);
  v10 = *(_OWORD *)(v2 + 16);
  v45 = *(_OWORD *)v2;
  v12 = *((_QWORD *)&v36 + 1);
  v11 = v36;
  v14 = v37;
  v13 = v38;
  v15 = v39;
  v28 = v40;
  v29 = v41;
  v30 = v42;
  v31 = v43;
  v33 = v44;
  v36 = v10;
  v37 = *(_QWORD *)(v2 + 32);
  v16 = swift_allocObject();
  v17 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v16 + 32) = v17;
  *(_QWORD *)(v16 + 48) = *(_QWORD *)(v2 + 32);
  sub_220D6FC58((uint64_t)&v45);
  sub_220D90A58((uint64_t)&v36);
  v27 = v9;
  sub_220D99424();
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(&v5[*(int *)(v32 + 20)], v9, v34);
  *(_QWORD *)v5 = &unk_25564CE88;
  *((_QWORD *)v5 + 1) = v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CE90);
  sub_220D5CD14((uint64_t)v5, a1 + *(int *)(v18 + 36));
  v19 = v11;
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + 8) = v12;
  *(_QWORD *)(a1 + 16) = v14;
  *(_QWORD *)(a1 + 24) = v13;
  v20 = v28;
  v21 = v29;
  *(_QWORD *)(a1 + 32) = v15;
  *(_QWORD *)(a1 + 40) = v20;
  v22 = v30;
  *(_QWORD *)(a1 + 48) = v21;
  *(_QWORD *)(a1 + 56) = v22;
  LOBYTE(v2) = v31;
  *(_BYTE *)(a1 + 64) = v31;
  v23 = v33;
  *(_BYTE *)(a1 + 65) = v33;
  v24 = v22;
  sub_220D90A80(v19, v12, v14, v13, v15, v20, v21, v22, v2, v23);
  sub_220D5CD70((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v27, v34);
  return sub_220D90AAC(v19, v12, v14, v13, v15, v20, v21, v24, v2, v33);
}

uint64_t sub_220D8DA54@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  char v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;

  v21 = *a1;
  swift_retain();
  v4 = sub_220D98A1C();
  sub_220D6FCB0((uint64_t)&v21);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_220D995B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v5 != 1)
  {
LABEL_13:
    swift_retain();
    v9 = sub_220D98A1C();
    sub_220D6FCB0((uint64_t)&v21);
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      v10 = sub_220D995B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v10 < 2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564CE98);
      sub_220D90AD8();
      sub_220D5CE08();
      result = sub_220D98F5C();
    }
    else
    {
      v19 = a1[1];
      v20 = *((_QWORD *)a1 + 4);
      v11 = swift_allocObject();
      v12 = a1[1];
      *(_OWORD *)(v11 + 16) = *a1;
      *(_OWORD *)(v11 + 32) = v12;
      *(_QWORD *)(v11 + 48) = *((_QWORD *)a1 + 4);
      v13 = a1[1];
      *(_QWORD *)&v14 = *((_QWORD *)a1 + 4);
      sub_220D6FC58((uint64_t)&v21);
      sub_220D90A58((uint64_t)&v19);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564CED0);
      sub_220D99244();
      sub_220D992BC();
      sub_220D98DD0();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564CEB8);
      sub_220D90AFC();
      sub_220D90B40();
      sub_220D98F5C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25564CE98);
      sub_220D90AD8();
      sub_220D5CE08();
      sub_220D98F5C();
      result = swift_release();
    }
    goto LABEL_18;
  }
  swift_retain();
  v6 = sub_220D98A1C();
  result = sub_220D6FCB0((uint64_t)&v21);
  if (!(v6 >> 62))
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_6;
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  v8 = sub_220D995B0();
  result = swift_bridgeObjectRelease();
  if (!v8)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_6:
  if ((v6 & 0xC000000000000001) != 0)
  {
    MEMORY[0x227665148](0, v6);
    goto LABEL_9;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_9:
    swift_bridgeObjectRelease();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564CEB8);
    sub_220D90AFC();
    sub_220D90B40();
    sub_220D98F5C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564CE98);
    sub_220D90AD8();
    sub_220D5CE08();
    sub_220D98F5C();
    result = swift_release();
LABEL_18:
    *(_OWORD *)a2 = v13;
    *(_OWORD *)(a2 + 16) = v14;
    *(_OWORD *)(a2 + 32) = v15;
    *(_OWORD *)(a2 + 48) = v16;
    *(_BYTE *)(a2 + 64) = v17;
    *(_BYTE *)(a2 + 65) = v18;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_220D8DEB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  double v18;
  double v19;
  double v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  unint64_t v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v39 = a1;
  v46 = a3;
  v4 = sub_220D98F80();
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v35 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CED8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CEE0);
  v40 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CEE8);
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v37 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CEF0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CEF8);
  MEMORY[0x24BDAC7A8](v36);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D99034();
  v47 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564CF00);
  sub_220D90BD8();
  sub_220D98D64();
  v50 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)&v51 = *(_QWORD *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564CED0);
  sub_220D99244();
  v18 = v49;
  sub_220D98DDC();
  v20 = v19;
  sub_220D992BC();
  sub_220D98DD0();
  v38 = v13;
  v21 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v39 = v12;
  v22 = v12;
  v23 = v35;
  v21(v8, v15, v22);
  v24 = &v8[*(int *)(v6 + 36)];
  v25 = v51;
  *(_OWORD *)v24 = v50;
  *((_OWORD *)v24 + 1) = v25;
  *((_OWORD *)v24 + 2) = v52;
  v26 = sub_220D90CF8();
  sub_220D99124();
  sub_220D5D018((uint64_t)v8, &qword_25564CED8);
  sub_220D98F74();
  v27 = sub_220D9904C();
  v28 = sub_220D99034();
  sub_220D99040();
  sub_220D99040();
  if (sub_220D99040() != v27)
    sub_220D99040();
  sub_220D99040();
  if (sub_220D99040() != v28)
    sub_220D99040();
  v48 = v6;
  v49 = *(double *)&v26;
  swift_getOpaqueTypeConformance2();
  v29 = v37;
  v30 = v42;
  sub_220D99130();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v23, v45);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v30);
  v31 = v41;
  v32 = v43;
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v17, v29, v43);
  v33 = (double *)&v17[*(int *)(v36 + 36)];
  *v33 = v20 * 0.5;
  v33[1] = v18 * 0.5;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v32);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v39);
  return sub_220D5CF90((uint64_t)v17, v46, &qword_25564CEF8);
}

uint64_t sub_220D8E328@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t (*v16)@<X0>(uint64_t *@<X8>);
  uint64_t (*v17)@<X0>(uint64_t *@<X8>);
  uint64_t (**v18)@<X0>(uint64_t *@<X8>);
  uint64_t v19;
  uint64_t v20;
  uint64_t (**v21)(double *);
  uint64_t v23[4];
  __int128 v24;
  uint64_t v25;
  __int128 v26;

  v23[0] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CF18);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CF28);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_220D98ED8();
  *((_QWORD *)v8 + 1) = 0x402C000000000000;
  v8[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564CF60);
  v26 = *a1;
  swift_retain();
  v9 = sub_220D98A1C();
  sub_220D6FCB0((uint64_t)&v26);
  v23[3] = v9;
  v24 = a1[1];
  v25 = *((_QWORD *)a1 + 4);
  v10 = swift_allocObject();
  v11 = a1[1];
  *(_OWORD *)(v10 + 16) = *a1;
  *(_OWORD *)(v10 + 32) = v11;
  *(_QWORD *)(v10 + 48) = *((_QWORD *)a1 + 4);
  sub_220D6FC58((uint64_t)&v26);
  sub_220D90A58((uint64_t)&v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564CF68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564CF70);
  sub_220D6839C(&qword_25564CF78, &qword_25564CF68, MEMORY[0x24BEE12D8]);
  v12 = sub_220D90D88();
  v23[1] = (uint64_t)&type metadata for PASUIFamilyMemberView;
  v23[2] = v12;
  swift_getOpaqueTypeConformance2();
  sub_220D5D7F4(&qword_25564CF88, (uint64_t (*)(uint64_t))MEMORY[0x24BE7B8A0], MEMORY[0x24BE7B8B0]);
  sub_220D992B0();
  v13 = swift_allocObject();
  v14 = a1[1];
  *(_OWORD *)(v13 + 16) = *a1;
  *(_OWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 48) = *((_QWORD *)a1 + 4);
  sub_220D6FC58((uint64_t)&v26);
  sub_220D90A58((uint64_t)&v24);
  v15 = sub_220D992BC();
  v17 = v16;
  sub_220D5CFD4((uint64_t)v8, (uint64_t)v5, &qword_25564CF28);
  v18 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v5[*(int *)(v3 + 36)];
  *v18 = sub_220D96934;
  v18[1] = 0;
  v18[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v15;
  v18[3] = v17;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = sub_220D90DFC;
  *(_QWORD *)(v19 + 24) = v13;
  v20 = v23[0];
  sub_220D5CFD4((uint64_t)v5, v23[0], &qword_25564CF18);
  v21 = (uint64_t (**)(double *))(v20
                                          + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25564CF00)
                                                   + 36));
  *v21 = sub_220D90E4C;
  v21[1] = (uint64_t (*)(double *))v19;
  sub_220D5D018((uint64_t)v5, &qword_25564CF18);
  return sub_220D5D018((uint64_t)v8, &qword_25564CF28);
}

uint64_t sub_220D8E620(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;

  v3 = *a1;
  v9 = *a2;
  type metadata accessor for PASUIFamilyMemberViewModel();
  swift_allocObject();
  swift_retain();
  sub_220D6FC58((uint64_t)&v9);
  sub_220D8EB5C(v3);
  sub_220D5D7F4(&qword_25564CF90, (uint64_t (*)(uint64_t))type metadata accessor for PASUIFamilyMemberViewModel, (uint64_t)&unk_220D9D12C);
  swift_retain();
  sub_220D98E30();
  v7 = a2[1];
  v8 = *((_QWORD *)a2 + 4);
  v4 = swift_allocObject();
  v5 = a2[1];
  *(_OWORD *)(v4 + 16) = *a2;
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 48) = *((_QWORD *)a2 + 4);
  *(_QWORD *)(v4 + 56) = v3;
  swift_retain();
  sub_220D6FC58((uint64_t)&v9);
  sub_220D90A58((uint64_t)&v7);
  sub_220D90D88();
  sub_220D99100();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_220D8E788(__int128 *a1)
{
  __int128 v2;

  v2 = *a1;
  swift_retain();
  sub_220D98A64();
  return sub_220D6FCB0((uint64_t)&v2);
}

uint64_t sub_220D8E7D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[9] = a1;
  sub_220D99418();
  v1[10] = sub_220D9940C();
  v1[11] = sub_220D993F4();
  v1[12] = v2;
  return swift_task_switch();
}

uint64_t sub_220D8E83C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *(_OWORD *)(v0 + 56) = *(_OWORD *)*(_QWORD *)(v0 + 72);
  v1 = type metadata accessor for PASUIMonogramMaker();
  v2 = swift_allocObject();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = &off_24E6A0B40;
  *(_QWORD *)(v0 + 16) = v2;
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v3;
  *v3 = v0;
  v3[1] = sub_220D6FB6C;
  return sub_220D98A04();
}

uint64_t sub_220D8E8D8@<X0>(uint64_t a1@<X8>)
{
  return sub_220D8D810(a1);
}

double sub_220D8E910@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  double result;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;

  v2 = sub_220D99214();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98BCC();
  if (v7 >> 60 == 15)
    goto LABEL_5;
  v8 = v6;
  v9 = v7;
  v10 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  v11 = (void *)sub_220D9880C();
  v12 = objc_msgSend(v10, sel_initWithData_, v11);

  if (!v12)
  {
    sub_220D73BAC(v8, v9);
LABEL_5:
    sub_220D99208();
    goto LABEL_6;
  }
  sub_220D991FC();
  sub_220D73BAC(v8, v9);
LABEL_6:
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v13 = sub_220D9922C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_220D992BC();
  sub_220D98DD0();
  v14 = v19;
  v15 = v20;
  v16 = v21;
  v17 = v22;
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v15;
  *(_QWORD *)(a1 + 24) = v16;
  *(_BYTE *)(a1 + 32) = v17;
  result = *(double *)&v23;
  *(_OWORD *)(a1 + 40) = v23;
  *(_WORD *)(a1 + 56) = 256;
  return result;
}

double sub_220D8EAE0@<D0>(uint64_t a1@<X8>)
{
  return sub_220D8E910(a1);
}

uint64_t sub_220D8EAEC()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_220D98CE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_220D8EB5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  unint64_t v13;
  _BYTE v15[32];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CDF8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CDF0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)(v2 + 24) = 0x4056000000000000;
  v12 = v2
      + OBJC_IVAR____TtC23ProximityAppleIDSetupUIP33_D640019A9A6E13F9BEA4F540051EE91226PASUIFamilyMemberViewModel__isSelected;
  v15[8] = 0;
  sub_220D98CD4();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 32))(v12, v11, v8);
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_220D995B0())
    v13 = sub_220D69690(MEMORY[0x24BEE4AF8]);
  else
    v13 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v2
            + OBJC_IVAR____TtC23ProximityAppleIDSetupUIP33_D640019A9A6E13F9BEA4F540051EE91226PASUIFamilyMemberViewModel_cancellables) = v13;
  *(_QWORD *)(v2 + 16) = a1;
  swift_retain();
  sub_220D98A4C();
  sub_220D6839C(&qword_25564CE30, &qword_25564CDF8, MEMORY[0x24BDB9EE8]);
  swift_retain();
  sub_220D98D1C();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_220D8ED64(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  v8 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_220D99418();
  swift_retain();
  swift_retain();
  v9 = sub_220D9940C();
  v10 = (_QWORD *)swift_allocObject();
  v11 = MEMORY[0x24BEE6930];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = v7;
  v10[5] = a2;
  sub_220D5F9A8((uint64_t)v6, (uint64_t)&unk_25564CFA0, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_220D8EE50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  sub_220D99418();
  v5[5] = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D8EEC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 24);
  swift_release();
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  sub_220D992C8();
  sub_220D98E0C();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D8EF50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t result;
  char v11;

  if (a1)
  {
    v1 = sub_220D98B9C();
    v3 = v2;
    v4 = sub_220D98B9C();
    v6 = v5;
    if (v3)
    {
      if (v5)
      {
        if (v1 == v4 && v3 == v5)
        {
          swift_bridgeObjectRelease();
          v8 = 1;
        }
        else
        {
          v8 = sub_220D99604();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        v8 = 0;
      }
      goto LABEL_15;
    }
  }
  else
  {
    sub_220D98B9C();
    v6 = v9;
  }
  if (!v6)
  {
    v8 = 1;
    goto LABEL_16;
  }
  v8 = 0;
LABEL_15:
  swift_bridgeObjectRelease();
LABEL_16:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_220D98CE0();
  swift_release();
  result = swift_release();
  if ((v8 & 1) != v11)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_220D98CEC();
  }
  return result;
}

uint64_t sub_220D8F0BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0
     + OBJC_IVAR____TtC23ProximityAppleIDSetupUIP33_D640019A9A6E13F9BEA4F540051EE91226PASUIFamilyMemberViewModel__isSelected;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CDF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_220D8F128()
{
  return type metadata accessor for PASUIFamilyMemberViewModel();
}

uint64_t type metadata accessor for PASUIFamilyMemberViewModel()
{
  uint64_t result;

  result = qword_25564CCE8;
  if (!qword_25564CCE8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_220D8F16C()
{
  unint64_t v0;

  sub_220D8F200();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_220D8F200()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25564CCF8[0])
  {
    v0 = sub_220D98CF8();
    if (!v1)
      atomic_store(v0, qword_25564CCF8);
  }
}

uint64_t sub_220D8F254@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PASUIFamilyMemberViewModel();
  result = sub_220D98CC8();
  *a1 = result;
  return result;
}

uint64_t sub_220D8F290@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, double a3@<D1>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[40];
  _BYTE v31[296];
  _BYTE v32[312];
  _BYTE v33[328];

  v29 = a2;
  v5 = sub_220D98F08();
  v27 = *(_QWORD *)(v5 - 8);
  v28 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_220D98F98();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CFD0);
  v25 = *(_QWORD *)(v12 - 8);
  v26 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CFD8);
  MEMORY[0x24BDAC7A8](v15);
  v24 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_220D98F14();
  sub_220D8F58C(a1, (uint64_t)v31, a3);
  v32[304] = 1;
  memcpy(&v32[7], v31, 0x128uLL);
  v30[0] = v17;
  v30[1] = 0;
  LOBYTE(v30[2]) = 1;
  memcpy((char *)&v30[2] + 1, v32, 0x12FuLL);
  sub_220D98F8C();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564CFE0);
  v19 = sub_220D6839C(&qword_25564CFE8, &qword_25564CFE0, MEMORY[0x24BDF4700]);
  sub_220D99154();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  memcpy(v33, v30, 0x140uLL);
  sub_220D91348((uint64_t)v33);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_220D98CE0();
  swift_release();
  swift_release();
  swift_release();
  if (LOBYTE(v30[0]) == 1)
    sub_220D98EF0();
  else
    sub_220D98EFC();
  v30[0] = v18;
  v30[1] = v19;
  swift_getOpaqueTypeConformance2();
  v20 = (uint64_t)v24;
  v21 = v26;
  sub_220D9916C();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v28);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v21);
  return sub_220D5CF90(v20, v29, &qword_25564CFD8);
}

uint64_t sub_220D8F58C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, double a3@<D1>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t, uint64_t);
  void (*v74)(char *, uint64_t, uint64_t);
  unint64_t v75;
  uint64_t v76;
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  _BYTE v102[7];
  char v103;
  _BYTE v104[7];
  char v105;
  _BYTE v106[7];
  char v107;
  _BYTE v108[7];
  char v109;
  _BYTE v110[7];
  char v111;
  _BYTE v112[7];
  char v113;
  _BYTE v114[7];
  char v115;
  _BYTE v116[7];
  char v117;
  _BYTE v118[7];
  char v119;
  uint64_t v120;
  unsigned __int8 v121;
  uint64_t v122;
  unsigned __int8 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  unsigned __int8 v129;
  uint64_t v130;
  uint64_t v131;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B408);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_220D99094();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = sub_220D992BC();
  v95 = v13;
  type metadata accessor for PASUIFamilyMemberViewModel();
  sub_220D5D7F4(&qword_25564CF90, (uint64_t (*)(uint64_t))type metadata accessor for PASUIFamilyMemberViewModel, (uint64_t)&unk_220D9D12C);
  swift_retain();
  v94 = sub_220D98E30();
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 16);
  v17 = *(_QWORD *)(a1 + 24);
  swift_retain();
  swift_retain();
  v97 = v15;
  swift_release();
  v93 = sub_220D99058();
  sub_220D98D58();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  sub_220D992BC();
  sub_220D98DD0();
  v92 = v120;
  v88 = v121;
  v91 = v122;
  v87 = v123;
  v90 = v124;
  v89 = v125;
  swift_retain();
  v26 = sub_220D98BC0();
  v98 = v16;
  v76 = a1;
  if (v27)
  {
    v28 = v26;
    v29 = v27;
    swift_release();
  }
  else
  {
    v28 = sub_220D98BB4();
    v29 = v30;
    swift_release();
    if (!v29)
    {
      v28 = 0;
      v29 = 0xE000000000000000;
    }
  }
  v126 = v28;
  v127 = v29;
  v75 = sub_220D5F128();
  v31 = sub_220D990C4();
  v33 = v32;
  v35 = v34 & 1;
  v36 = *MEMORY[0x24BDF1878];
  v74 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v74(v12, v36, v9);
  v72 = sub_220D99064();
  v73 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56);
  v73(v8, 1, 1, v72);
  sub_220D9907C();
  sub_220D5D018((uint64_t)v8, &qword_25564B408);
  v71 = *(void (**)(char *, uint64_t))(v10 + 8);
  v71(v12, v9);
  v86 = sub_220D990AC();
  v85 = v37;
  v39 = v38;
  v84 = v40;
  swift_release();
  v83 = v39 & 1;
  sub_220D913E8(v31, v33, v35);
  swift_bridgeObjectRelease();
  sub_220D992BC();
  sub_220D98DD0();
  v82 = v126;
  v78 = v127;
  v81 = v128;
  v77 = v129;
  v80 = v130;
  v79 = v131;
  swift_retain();
  v41 = sub_220D98B90();
  v43 = v42;
  swift_release();
  v100 = v41;
  v101 = v43;
  v44 = sub_220D990C4();
  v46 = v45;
  v48 = v47 & 1;
  v74(v12, *MEMORY[0x24BDF18E8], v9);
  v73(v8, 1, 1, v72);
  sub_220D9907C();
  sub_220D5D018((uint64_t)v8, &qword_25564B408);
  v71(v12, v9);
  v49 = sub_220D990AC();
  v51 = v50;
  v53 = v52;
  swift_release();
  v54 = v53 & 1;
  sub_220D913E8(v44, v46, v48);
  swift_bridgeObjectRelease();
  sub_220D991E4();
  v55 = sub_220D990A0();
  v57 = v56;
  v59 = v58;
  v61 = v60;
  swift_release();
  LOBYTE(v44) = v59 & 1;
  sub_220D913E8(v49, v51, v54);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a2 + 284) = *(_DWORD *)&v102[3];
  *(_DWORD *)(a2 + 281) = *(_DWORD *)v102;
  v115 = v88;
  v113 = v87;
  v117 = 1;
  v109 = 1;
  v107 = v78;
  v105 = v77;
  *(_DWORD *)(a2 + 57) = v100;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)((char *)&v100 + 3);
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v118;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v118[3];
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v116;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v116[3];
  *(_DWORD *)(a2 + 129) = *(_DWORD *)v114;
  *(_DWORD *)(a2 + 132) = *(_DWORD *)&v114[3];
  *(_DWORD *)(a2 + 145) = *(_DWORD *)v112;
  *(_DWORD *)(a2 + 148) = *(_DWORD *)&v112[3];
  *(_DWORD *)(a2 + 188) = *(_DWORD *)&v110[3];
  *(_DWORD *)(a2 + 185) = *(_DWORD *)v110;
  *(_DWORD *)(a2 + 212) = *(_DWORD *)&v108[3];
  *(_DWORD *)(a2 + 209) = *(_DWORD *)v108;
  *(_DWORD *)(a2 + 228) = *(_DWORD *)&v106[3];
  *(_DWORD *)(a2 + 225) = *(_DWORD *)v106;
  *(_DWORD *)(a2 + 241) = *(_DWORD *)v104;
  *(_DWORD *)(a2 + 244) = *(_DWORD *)&v104[3];
  v62 = v95;
  *(_QWORD *)a2 = v96;
  *(_QWORD *)(a2 + 8) = v62;
  *(_BYTE *)(a2 + 56) = v93;
  *(_BYTE *)(a2 + 112) = v117;
  *(_QWORD *)(a2 + 120) = v92;
  *(_BYTE *)(a2 + 128) = v115;
  *(_QWORD *)(a2 + 136) = v91;
  *(_BYTE *)(a2 + 144) = v113;
  v63 = v83;
  v111 = v83;
  v64 = v89;
  *(_QWORD *)(a2 + 152) = v90;
  *(_QWORD *)(a2 + 160) = v64;
  *(_BYTE *)(a2 + 184) = v111;
  *(_BYTE *)(a2 + 208) = v109;
  *(_QWORD *)(a2 + 216) = v82;
  *(_BYTE *)(a2 + 224) = v107;
  *(_QWORD *)(a2 + 232) = v81;
  *(_BYTE *)(a2 + 240) = v105;
  v103 = v59 & 1;
  v65 = v79;
  *(_QWORD *)(a2 + 248) = v80;
  *(_QWORD *)(a2 + 256) = v65;
  *(_BYTE *)(a2 + 280) = v103;
  v66 = v97;
  *(_QWORD *)(a2 + 16) = v94;
  *(_QWORD *)(a2 + 24) = v66;
  *(double *)(a2 + 32) = a3;
  *(_QWORD *)(a2 + 40) = v98;
  *(_QWORD *)(a2 + 48) = v17;
  *(_QWORD *)(a2 + 64) = v19;
  *(_QWORD *)(a2 + 72) = v21;
  *(_QWORD *)(a2 + 80) = v23;
  *(_QWORD *)(a2 + 88) = v25;
  *(_BYTE *)(a2 + 96) = 0;
  *(_QWORD *)(a2 + 104) = 0;
  v67 = v86;
  v68 = v85;
  *(_QWORD *)(a2 + 168) = v86;
  *(_QWORD *)(a2 + 176) = v68;
  *(_QWORD *)(a2 + 192) = v84;
  *(_QWORD *)(a2 + 200) = 0;
  *(_QWORD *)(a2 + 264) = v55;
  *(_QWORD *)(a2 + 272) = v57;
  *(_QWORD *)(a2 + 288) = v61;
  v69 = v63;
  v99 = v63;
  v119 = 0;
  swift_retain();
  swift_retain();
  sub_220D913F8(v67, v68, v69);
  swift_bridgeObjectRetain();
  sub_220D913F8(v55, v57, v44);
  swift_bridgeObjectRetain();
  sub_220D913E8(v55, v57, v44);
  swift_bridgeObjectRelease();
  sub_220D913E8(v67, v68, v99);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

double sub_220D8FE30@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  __int128 v17;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_220D98CE0();
  swift_release();
  swift_release();
  swift_release();
  if (v13 == 1)
    v2 = sub_220D991CC();
  else
    v2 = sub_220D991D8();
  v3 = v2;
  sub_220D98D94();
  v4 = sub_220D992BC();
  v6 = v5;
  sub_220D992BC();
  sub_220D98DD0();
  *(_QWORD *)a1 = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v11;
  *(_QWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = v3;
  *(_WORD *)(a1 + 48) = 256;
  *(_QWORD *)(a1 + 56) = v4;
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_BYTE *)(a1 + 96) = v16;
  result = *(double *)&v17;
  *(_OWORD *)(a1 + 104) = v17;
  return result;
}

double sub_220D8FFA8@<D0>(uint64_t a1@<X8>)
{
  return sub_220D8FE30(a1);
}

uint64_t sub_220D8FFB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_220D8F290(*(_QWORD *)(v1 + 8), a1, *(double *)(v1 + 24));
}

uint64_t sub_220D8FFC0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_220D98CE0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_220D90040()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_220D98CEC();
}

uint64_t sub_220D900B4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D900D8()
{
  return objectdestroy_6Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

void sub_220D900E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_220D8C954(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_220D900EC(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(a1, *(_QWORD *)(a1 + 40));
}

void sub_220D90110(uint64_t *a1)
{
  sub_220D8D54C(a1);
}

void sub_220D90118(unsigned __int8 *a1)
{
  sub_220D8D5EC(a1);
}

uint64_t sub_220D90120()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D90144()
{
  return objectdestroy_6Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_220D90150(uint64_t a1)
{
  uint64_t v1;

  return sub_220D8D66C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_220D90158()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_220D90194()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5DA1C;
  v5 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 528) + *(_QWORD *)(*(_QWORD *)v0 + 528));
  v3 = (_QWORD *)swift_task_alloc();
  v2[2] = v3;
  *v3 = v2;
  v3[1] = sub_220D5DA1C;
  return v5();
}

_QWORD *sub_220D90210(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;

  v1[5] = 0;
  v1[6] = 0;
  v1[4] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  v1[2] = sub_220D988B4();
  swift_retain();
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_220D995B0())
    v2 = sub_220D69690(MEMORY[0x24BEE4AF8]);
  else
    v2 = MEMORY[0x24BEE4B08];
  v1[3] = v2;
  return v1;
}

uint64_t sub_220D902AC(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_220D5CFD4(a1, (uint64_t)&v14, (uint64_t *)&unk_25564AF10);
  v3 = v16;
  if (!v16)
  {
    sub_220D5D018((uint64_t)&v14, (uint64_t *)&unk_25564AF10);
    if ((a2 & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_220D9955C();
    swift_bridgeObjectRelease();
    v7 = 0xD000000000000019;
    v8 = "FAMILY_PICKER_VIEW_TITLE_";
    goto LABEL_6;
  }
  v4 = v17;
  __swift_project_boxed_opaque_existential_1(&v14, v16);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v4 + 8))(v11, v3, v4);
  v5 = v12;
  v6 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  if ((a2 & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v14 = 0;
  v15 = 0xE000000000000000;
  sub_220D9955C();
  swift_bridgeObjectRelease();
  v7 = 0xD000000000000021;
  v8 = "FAMILY_PICKER_VIEW_TITLE_JUST_ME_";
LABEL_6:
  v14 = v7;
  v15 = (unint64_t)(v8 - 32) | 0x8000000000000000;
  sub_220D993AC();
  swift_bridgeObjectRelease();
  v9 = sub_220D99394();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_220D90428(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  sub_220D5CFD4(a1, (uint64_t)&v17, (uint64_t *)&unk_25564AF10);
  v7 = v19;
  if (v19)
  {
    v8 = v20;
    __swift_project_boxed_opaque_existential_1(&v17, v19);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v8 + 8))(v14, v7, v8);
    v9 = v15;
    v10 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
  }
  else
  {
    sub_220D5D018((uint64_t)&v17, (uint64_t *)&unk_25564AF10);
  }
  if ((a2 & 1) == 0)
  {
    v17 = 0;
    v18 = 0xE000000000000000;
    sub_220D9955C();
    swift_bridgeObjectRelease();
    v17 = 0xD00000000000001CLL;
    v18 = 0x8000000220DA0560;
LABEL_9:
    sub_220D993AC();
    swift_bridgeObjectRelease();
    v12 = sub_220D99394();
    goto LABEL_10;
  }
  if (!a4)
  {
    v17 = 0;
    v18 = 0xE000000000000000;
    sub_220D9955C();
    swift_bridgeObjectRelease();
    v17 = 0xD00000000000002ALL;
    v18 = 0x8000000220DA0580;
    goto LABEL_9;
  }
  v17 = 0;
  v18 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_220D9955C();
  swift_bridgeObjectRelease();
  v17 = 0xD000000000000024;
  v18 = 0x8000000220DA05B0;
  sub_220D993AC();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564B158);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_220D9AFB0;
  *(_QWORD *)(v11 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v11 + 64) = sub_220D6AF6C();
  *(_QWORD *)(v11 + 32) = a3;
  *(_QWORD *)(v11 + 40) = a4;
  v12 = sub_220D9937C();
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_220D90678(uint64_t a1)
{
  uint64_t v1;

  return sub_220D8D270(a1, v1, (uint64_t)&unk_24E6A40B0, (uint64_t)&unk_25564CE68);
}

uint64_t sub_220D906A0(uint64_t a1)
{
  uint64_t v1;

  return sub_220D8D270(a1, v1, (uint64_t)&unk_24E6A4088, (uint64_t)&unk_25564CE58);
}

uint64_t sub_220D906CC(uint64_t a1)
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
  v7[1] = sub_220D5DA1C;
  return sub_220D8D384(a1, v4, v5, v6);
}

uint64_t objectdestroy_35Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D90768(uint64_t a1)
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
  v7[1] = sub_220D5DA1C;
  return sub_220D8D178(a1, v4, v5, v6);
}

unint64_t sub_220D907D4()
{
  unint64_t result;

  result = qword_25564CE78;
  if (!qword_25564CE78)
  {
    result = MEMORY[0x227665754](&unk_220D9D1C8, &type metadata for PASUIFamilyPickerView);
    atomic_store(result, &qword_25564CE78);
  }
  return result;
}

uint64_t destroy for PASUIFamilyPickerView()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PASUIFamilyPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PASUIFamilyPickerView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for PASUIFamilyPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIFamilyPickerView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PASUIFamilyPickerView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PASUIFamilyPickerView()
{
  return &type metadata for PASUIFamilyPickerView;
}

uint64_t sub_220D909F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D90A0C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5CCCC;
  return sub_220D8E7D0(v0 + 16);
}

uint64_t sub_220D90A58(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_220D90A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10)
{
  uint64_t result;

  if ((a10 & 1) == 0)
    return sub_220D90A9C();
  return result;
}

uint64_t sub_220D90A9C()
{
  return swift_retain();
}

uint64_t sub_220D90AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10)
{
  uint64_t result;

  if ((a10 & 1) == 0)
    return sub_220D90AC8();
  return result;
}

uint64_t sub_220D90AC8()
{
  return swift_release();
}

uint64_t sub_220D90AD8()
{
  return sub_220D912B8(&qword_25564CEA0, &qword_25564CE98, (uint64_t (*)(void))sub_220D90AFC, (uint64_t (*)(void))sub_220D90B40);
}

unint64_t sub_220D90AFC()
{
  unint64_t result;

  result = qword_25564CEA8;
  if (!qword_25564CEA8)
  {
    result = MEMORY[0x227665754](&unk_220D9D2A8, &type metadata for PASUIMemberImageView);
    atomic_store(result, (unint64_t *)&qword_25564CEA8);
  }
  return result;
}

unint64_t sub_220D90B40()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564CEB0;
  if (!qword_25564CEB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564CEB8);
    v2[0] = sub_220D6839C(&qword_25564CEC0, &qword_25564CEC8, MEMORY[0x24BDEC6F8]);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564CEB0);
  }
  return result;
}

uint64_t sub_220D90BC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_220D8DEB4(a1, v2 + 16, a2);
}

uint64_t sub_220D90BD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_220D8E328(*(__int128 **)(v1 + 16), a1);
}

unint64_t sub_220D90BD8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564CF08;
  if (!qword_25564CF08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564CF00);
    v2[0] = sub_220D90C5C();
    v2[1] = sub_220D6839C(&qword_25564CF40, &qword_25564CF48, MEMORY[0x24BDF09B0]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564CF08);
  }
  return result;
}

unint64_t sub_220D90C5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564CF10;
  if (!qword_25564CF10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564CF18);
    v2[0] = sub_220D6839C(&qword_25564CF20, &qword_25564CF28, MEMORY[0x24BDF4498]);
    v2[1] = sub_220D6839C(&qword_25564CF30, &qword_25564CF38, MEMORY[0x24BDEF370]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564CF10);
  }
  return result;
}

unint64_t sub_220D90CF8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564CF50;
  if (!qword_25564CF50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564CED8);
    v2[0] = sub_220D6839C(&qword_25564CF58, &qword_25564CEF0, MEMORY[0x24BDEB238]);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564CF50);
  }
  return result;
}

uint64_t sub_220D90D80(uint64_t *a1)
{
  uint64_t v1;

  return sub_220D8E620(a1, (__int128 *)(v1 + 16));
}

unint64_t sub_220D90D88()
{
  unint64_t result;

  result = qword_25564CF80;
  if (!qword_25564CF80)
  {
    result = MEMORY[0x227665754](&unk_220D9D258, &type metadata for PASUIFamilyMemberView);
    atomic_store(result, (unint64_t *)&qword_25564CF80);
  }
  return result;
}

uint64_t objectdestroy_45Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D90DFC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564CED0);
  return sub_220D99250();
}

uint64_t sub_220D90E4C(double *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_220D90E70()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D90EA4()
{
  uint64_t v0;

  return sub_220D8E788((__int128 *)(v0 + 16));
}

uint64_t sub_220D90EB0(uint64_t *a1)
{
  uint64_t v1;

  return sub_220D8ED64(a1, v1);
}

uint64_t sub_220D90EB8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D90EEC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_220D5DA1C;
  return sub_220D8EE50(a1, v4, v5, v7, v6);
}

uint64_t sub_220D90F64()
{
  uint64_t v0;

  return sub_220D8EF50(*(_QWORD *)(v0 + 16));
}

uint64_t initializeWithCopy for PASUIFamilyMemberView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PASUIFamilyMemberView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for PASUIFamilyMemberView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIFamilyMemberView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIFamilyMemberView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIFamilyMemberView()
{
  return &type metadata for PASUIFamilyMemberView;
}

_QWORD *initializeBufferWithCopyOfBuffer for PASUIMemberImageView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for PASUIMemberImageView()
{
  return swift_release();
}

_QWORD *assignWithCopy for PASUIMemberImageView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

_QWORD *assignWithTake for PASUIMemberImageView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for PASUIMemberImageView()
{
  return &type metadata for PASUIMemberImageView;
}

unint64_t sub_220D911B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564CFA8;
  if (!qword_25564CFA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564CE90);
    v2[0] = sub_220D91234();
    v2[1] = sub_220D5D7F4((unint64_t *)&qword_25564A950, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564CFA8);
  }
  return result;
}

unint64_t sub_220D91234()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25564CFB0;
  if (!qword_25564CFB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564CFB8);
    v2 = sub_220D912B8(&qword_25564CFC0, &qword_25564CFC8, sub_220D90AD8, (uint64_t (*)(void))sub_220D5CE08);
    result = MEMORY[0x227665754](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25564CFB0);
  }
  return result;
}

uint64_t sub_220D912B8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x227665754](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_220D91328()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D91338()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D91348(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 192);
  v3 = *(_QWORD *)(a1 + 200);
  v4 = *(_BYTE *)(a1 + 208);
  v5 = *(_QWORD *)(a1 + 288);
  v6 = *(_QWORD *)(a1 + 296);
  v7 = *(_BYTE *)(a1 + 304);
  swift_release();
  swift_release();
  sub_220D913E8(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_220D913E8(v5, v6, v7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_220D913E8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_220D913F8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

_QWORD *sub_220D9140C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PASUIFamilyMemberView.SelectionView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for PASUIFamilyMemberView.SelectionView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for PASUIFamilyMemberView.SelectionView()
{
  return &type metadata for PASUIFamilyMemberView.SelectionView;
}

unint64_t sub_220D914E4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564CFF0;
  if (!qword_25564CFF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564CFF8);
    v2[0] = sub_220D91568();
    v2[1] = sub_220D6839C(&qword_25564D010, &qword_25564D018, MEMORY[0x24BDEB950]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564CFF0);
  }
  return result;
}

unint64_t sub_220D91568()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564D000;
  if (!qword_25564D000)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D008);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564D000);
  }
  return result;
}

unint64_t sub_220D915D0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_25564D020;
  if (!qword_25564D020)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564CFD8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564CFE0);
    v2[3] = sub_220D6839C(&qword_25564CFE8, &qword_25564CFE0, MEMORY[0x24BDF4700]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_220D5D7F4(&qword_25564D028, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564D020);
  }
  return result;
}

uint64_t sub_220D9169C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_220D916B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564D030;
  if (!qword_25564D030)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D038);
    v2[0] = sub_220D6839C(&qword_25564D040, &qword_25564D048, MEMORY[0x24BDED500]);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564D030);
  }
  return result;
}

void sub_220D9175C(void *a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(id *__return_ptr, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  void (*v20)(id *__return_ptr, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id aBlock;
  uint64_t v41;
  void (*v42)(uint64_t, void *);
  void *v43;
  uint64_t (*v44)(uint64_t);
  uint64_t v45;

  v2 = v1;
  v37 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AEE0);
  v36 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AEE8);
  v13 = *(_QWORD *)(v12 - 8);
  v38 = v12;
  v39 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D8AAAC(a1);
  v16 = *(void (**)(id *__return_ptr, uint64_t))(**(_QWORD **)(v2 + 16) + 128);
  v17 = swift_retain();
  v16(&aBlock, v17);
  swift_release();
  v18 = v41;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v18 + 40))(ObjectType, v18);
  swift_unknownObjectRelease();
  v20 = *(void (**)(id *__return_ptr, uint64_t))(**(_QWORD **)(v2 + 16) + 128);
  v21 = swift_retain();
  v20(&aBlock, v21);
  swift_release();
  v22 = v41;
  v23 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v22 + 56))(v23, v22);
  swift_unknownObjectRelease();
  sub_220D6839C(&qword_25564AEF0, &qword_25564AED8, MEMORY[0x24BDB9EE8]);
  sub_220D98CA4();
  sub_220D68258();
  aBlock = (id)sub_220D994B4();
  v24 = sub_220D9949C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v6, 1, 1, v24);
  sub_220D6839C(&qword_25564AEF8, &qword_25564AEE0, MEMORY[0x24BDB9450]);
  sub_220D68294();
  sub_220D98D10();
  sub_220D5D018((uint64_t)v6, &qword_25564AED0);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
  v25 = swift_allocObject();
  swift_weakInit();
  v26 = swift_allocObject();
  v27 = v37;
  *(_QWORD *)(v26 + 16) = v25;
  *(_QWORD *)(v26 + 24) = v27;
  sub_220D6839C(&qword_25564AF08, &qword_25564AEE8, MEMORY[0x24BDB9A08]);
  swift_unknownObjectRetain();
  v28 = v38;
  sub_220D98D1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v15, v28);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  swift_release();
  v29 = swift_allocObject();
  swift_weakInit();
  v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = v29;
  *(_QWORD *)(v31 + 24) = v30;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_220D923D8;
  *(_QWORD *)(v32 + 24) = v31;
  swift_retain();
  swift_retain();
  swift_retain();
  v33 = (void *)sub_220D99340();
  v44 = sub_220D6D1E8;
  v45 = v32;
  aBlock = (id)MEMORY[0x24BDAC760];
  v41 = 1107296256;
  v42 = sub_220D76398;
  v43 = &block_descriptor_10;
  v34 = _Block_copy(&aBlock);
  v35 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v33, 0, v34);

  _Block_release(v34);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_msgSend(v27, sel_setDismissButtonAction_, v35);

}

void sub_220D91C80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[40];
  _BYTE v27[40];
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_220D683DC(a1, (uint64_t)v26);
    sub_220D683DC(a1 + 40, (uint64_t)v27);
    sub_220D8BE88((uint64_t)v26, (uint64_t)v28);
    v5 = v29;
    if (v29)
    {
      v6 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v6 + 8))(v23, v5, v6);
      v7 = v24;
      v8 = v25;
      __swift_project_boxed_opaque_existential_1(v23, v24);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      sub_220D5D018((uint64_t)v27, (uint64_t *)&unk_25564AF10);
    }
    else
    {
      sub_220D5D018((uint64_t)v27, (uint64_t *)&unk_25564AF10);
      sub_220D5D018((uint64_t)v28, (uint64_t *)&unk_25564AF10);
    }
    sub_220D683DC(a1, (uint64_t)v26);
    sub_220D683DC(a1 + 40, (uint64_t)v27);
    sub_220D8BE88((uint64_t)v27, (uint64_t)v28);
    v9 = v29;
    if (v29)
    {
      v10 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v10 + 8))(v23, v9, v10);
      v11 = v24;
      v12 = v25;
      __swift_project_boxed_opaque_existential_1(v23, v24);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      sub_220D5D018((uint64_t)v26, (uint64_t *)&unk_25564AF10);
    }
    else
    {
      sub_220D5D018((uint64_t)v26, (uint64_t *)&unk_25564AF10);
      sub_220D5D018((uint64_t)v28, (uint64_t *)&unk_25564AF10);
    }
    sub_220D92498();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v13 = (void *)sub_220D99340();
    swift_bridgeObjectRelease();
    objc_msgSend(a3, sel_setTitle_, v13);

    sub_220D683DC(a1, (uint64_t)v26);
    sub_220D683DC(a1 + 40, (uint64_t)v27);
    sub_220D8BE88((uint64_t)v26, (uint64_t)v28);
    v14 = v29;
    if (v29)
    {
      v15 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v15 + 8))(v23, v14, v15);
      v16 = v24;
      v17 = v25;
      __swift_project_boxed_opaque_existential_1(v23, v24);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      sub_220D5D018((uint64_t)v27, (uint64_t *)&unk_25564AF10);
    }
    else
    {
      sub_220D5D018((uint64_t)v27, (uint64_t *)&unk_25564AF10);
      sub_220D5D018((uint64_t)v28, (uint64_t *)&unk_25564AF10);
    }
    sub_220D683DC(a1, (uint64_t)v26);
    sub_220D683DC(a1 + 40, (uint64_t)v27);
    sub_220D8BE88((uint64_t)v27, (uint64_t)v28);
    v18 = v29;
    if (v29)
    {
      v19 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v19 + 8))(v23, v18, v19);
      v20 = v24;
      v21 = v25;
      __swift_project_boxed_opaque_existential_1(v23, v24);
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      sub_220D5D018((uint64_t)v26, (uint64_t *)&unk_25564AF10);
    }
    else
    {
      sub_220D5D018((uint64_t)v26, (uint64_t *)&unk_25564AF10);
      sub_220D5D018((uint64_t)v28, (uint64_t *)&unk_25564AF10);
    }
    sub_220D92264();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = (void *)sub_220D99340();
    swift_bridgeObjectRelease();
    objc_msgSend(a3, sel_setSubtitle_, v22);
    swift_release();

  }
}

uint64_t sub_220D920E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result;
    swift_beginAccess();
    v6 = (void *)MEMORY[0x227665880](a3 + 16);
    if (v6)
    {
      v7 = objc_msgSend(v6, sel_viewController);
      v8 = *(_QWORD *)(v5 + 32);
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = sub_220D5F220;
      *(_QWORD *)(v9 + 24) = v8;
      swift_retain_n();
      sub_220D8B658(v7, (uint64_t)&unk_25564D170, v8, (uint64_t)&unk_25564B480, v9);
      swift_release();
      swift_unknownObjectRelease();

      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_220D92208()
{
  return swift_release();
}

uint64_t sub_220D92210()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PASUIProgressViewProxCardAdapter()
{
  return objc_opt_self();
}

uint64_t sub_220D92264()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_220D9955C();
  swift_bridgeObjectRelease();
  sub_220D993AC();
  swift_bridgeObjectRelease();
  sub_220D993AC();
  sub_220D993AC();
  swift_bridgeObjectRelease();
  v0 = sub_220D99394();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_220D92370()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D92394()
{
  return objectdestroy_6Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

void sub_220D923A0(uint64_t a1)
{
  uint64_t v1;

  sub_220D91C80(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_220D923A8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D923CC()
{
  return objectdestroy_6Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_220D923D8(uint64_t a1)
{
  uint64_t v1;

  return sub_220D920E8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_220D923E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t sub_220D9241C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5CCCC;
  v5 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 528) + *(_QWORD *)(*(_QWORD *)v0 + 528));
  v3 = (_QWORD *)swift_task_alloc();
  v2[2] = v3;
  *v3 = v2;
  v3[1] = sub_220D5DA1C;
  return v5();
}

uint64_t sub_220D92498()
{
  uint64_t v0;

  sub_220D9955C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_220D993AC();
  swift_bridgeObjectRelease();
  v0 = sub_220D99394();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PASFlowStepTargetError.buildView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D178);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v11 - v6;
  v11[0] = v0;
  v8 = sub_220D92678();
  sub_220D99178();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUITargetErrorView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  v9 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

unint64_t sub_220D92678()
{
  unint64_t result;

  result = qword_25564D180;
  if (!qword_25564D180)
  {
    result = MEMORY[0x227665754](&unk_220D9D408, &type metadata for PASUITargetErrorView);
    atomic_store(result, (unint64_t *)&qword_25564D180);
  }
  return result;
}

uint64_t sub_220D926BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D178);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v11 - v6;
  v11[0] = *v0;
  v8 = sub_220D92678();
  sub_220D99178();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUITargetErrorView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  v9 = sub_220D99280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

ValueMetadata *type metadata accessor for PASUITargetErrorView()
{
  return &type metadata for PASUITargetErrorView;
}

uint64_t sub_220D927E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220D927F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t (*v17)();
  uint64_t v18;
  uint64_t (*v19)();
  unint64_t v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v16 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D188);
  v15 = *(_QWORD *)(v1 - 8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v14 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - v4;
  v17 = sub_220D929AC;
  v18 = 0;
  v19 = sub_220D929C8;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = MEMORY[0x24BEE4AF8];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D190);
  v7 = sub_220D7059C();
  v8 = sub_220D93184();
  sub_220D991A8();
  v9 = (uint64_t)v19;
  v10 = v22;
  sub_220D5CDB4((uint64_t)v17);
  sub_220D5CDB4(v9);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v11 = v15;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v14, v5, v1);
  v17 = (uint64_t (*)())&type metadata for PASUITargetBaseView;
  v18 = v6;
  v19 = (uint64_t (*)())v7;
  v20 = v8;
  swift_getOpaqueTypeConformance2();
  v12 = sub_220D99280();
  result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v5, v1);
  *v16 = v12;
  return result;
}

uint64_t sub_220D929AC()
{
  return sub_220D99394();
}

uint64_t sub_220D929C8()
{
  uint64_t v0;

  sub_220D9955C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_220D993AC();
  swift_bridgeObjectRelease();
  v0 = sub_220D99394();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_220D92A94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v24 = a1;
  v1 = sub_220D98E84();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D1A0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D1B8);
  v10 = *(_QWORD *)(v9 - 8);
  v22 = v9;
  v23 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564D1C0);
  sub_220D93294();
  sub_220D99268();
  sub_220D98E78();
  v13 = sub_220D6839C(&qword_25564D1A8, &qword_25564D1A0, MEMORY[0x24BDF43B0]);
  v14 = sub_220D5D7F4(&qword_25564D1B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED868], MEMORY[0x24BDED858]);
  sub_220D990F4();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_220D98EE4();
  v15 = sub_220D990B8();
  v17 = v16;
  v25 = v5;
  v26 = v1;
  LOBYTE(v1) = v18 & 1;
  v27 = v13;
  v28 = v14;
  swift_getOpaqueTypeConformance2();
  v19 = v22;
  sub_220D9913C();
  sub_220D913E8(v15, v17, v1);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v12, v19);
}

uint64_t sub_220D92D18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_220D99418();
  swift_retain();
  v6 = sub_220D9940C();
  v7 = (_QWORD *)swift_allocObject();
  v8 = MEMORY[0x24BEE6930];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = a1;
  sub_220D5F9A8((uint64_t)v4, (uint64_t)&unk_25564D240, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_220D92DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v4[2] = sub_220D99418();
  v4[3] = sub_220D9940C();
  v8 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)a4 + 352) + *(_QWORD *)(*(_QWORD *)a4 + 352));
  v6 = (_QWORD *)swift_task_alloc();
  v4[4] = v6;
  *v6 = v4;
  v6[1] = sub_220D69344;
  return v8();
}

uint64_t sub_220D92E70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v32 = a1;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D230);
  v1 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D1F8);
  MEMORY[0x24BDAC7A8](v28);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D1E8);
  MEMORY[0x24BDAC7A8](v29);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D1D8);
  MEMORY[0x24BDAC7A8](v31);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_220D99208();
  v11 = sub_220D99088();
  KeyPath = swift_getKeyPath();
  v33 = v10;
  v34 = KeyPath;
  v35 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564D200);
  sub_220D934B4();
  sub_220D99184();
  swift_release();
  swift_release();
  swift_release();
  LODWORD(v10) = sub_220D98F68();
  v13 = v30;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v5, v3, v30);
  *(_DWORD *)&v5[*(int *)(v28 + 36)] = v10;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v13);
  LOBYTE(v10) = sub_220D99058();
  sub_220D98D58();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  sub_220D5CFD4((uint64_t)v5, (uint64_t)v7, &qword_25564D1F8);
  v22 = &v7[*(int *)(v29 + 36)];
  *v22 = v10;
  *((_QWORD *)v22 + 1) = v15;
  *((_QWORD *)v22 + 2) = v17;
  *((_QWORD *)v22 + 3) = v19;
  *((_QWORD *)v22 + 4) = v21;
  v22[40] = 0;
  sub_220D5D018((uint64_t)v5, &qword_25564D1F8);
  v23 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  v24 = MEMORY[0x227664DB8](v23);
  LOBYTE(v13) = sub_220D99058();
  sub_220D5CFD4((uint64_t)v7, (uint64_t)v9, &qword_25564D1E8);
  v25 = &v9[*(int *)(v31 + 36)];
  *(_QWORD *)v25 = v24;
  v25[8] = v13;
  sub_220D5D018((uint64_t)v7, &qword_25564D1E8);
  v26 = v32;
  sub_220D5CFD4((uint64_t)v9, v32, &qword_25564D1D8);
  *(_WORD *)(v26 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25564D1C0) + 36)) = 256;
  return sub_220D5D018((uint64_t)v9, &qword_25564D1D8);
}

uint64_t sub_220D93174@<X0>(uint64_t *a1@<X8>)
{
  return sub_220D927F0(a1);
}

uint64_t sub_220D9317C@<X0>(uint64_t a1@<X8>)
{
  return sub_220D92A94(a1);
}

unint64_t sub_220D93184()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_25564D198;
  if (!qword_25564D198)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D190);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D1A0);
    v3 = sub_220D98E84();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_220D6839C(&qword_25564D1A8, &qword_25564D1A0, MEMORY[0x24BDF43B0]);
    v5[5] = sub_220D5D7F4(&qword_25564D1B0, v4, MEMORY[0x24BDED858]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = sub_220D5D7F4(&qword_25564D028, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25564D198);
  }
  return result;
}

uint64_t sub_220D9328C()
{
  uint64_t v0;

  return sub_220D92D18(v0);
}

unint64_t sub_220D93294()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564D1C8;
  if (!qword_25564D1C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D1C0);
    v2[0] = sub_220D93318();
    v2[1] = sub_220D6839C(&qword_25564D010, &qword_25564D018, MEMORY[0x24BDEB950]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564D1C8);
  }
  return result;
}

unint64_t sub_220D93318()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564D1D0;
  if (!qword_25564D1D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D1D8);
    v2[0] = sub_220D9339C();
    v2[1] = sub_220D6839C(&qword_25564D220, &qword_25564D228, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564D1D0);
  }
  return result;
}

unint64_t sub_220D9339C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25564D1E0;
  if (!qword_25564D1E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D1E8);
    v2[0] = sub_220D93408();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564D1E0);
  }
  return result;
}

unint64_t sub_220D93408()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_25564D1F0;
  if (!qword_25564D1F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D1F8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D200);
    v2[3] = sub_220D934B4();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_220D6839C(&qword_25564D210, &qword_25564D218, MEMORY[0x24BDF0710]);
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25564D1F0);
  }
  return result;
}

unint64_t sub_220D934B4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25564D208;
  if (!qword_25564D208)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25564D200);
    v2 = sub_220D6839C(&qword_25564B440, &qword_25564B448, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x227665754](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25564D208);
  }
  return result;
}

uint64_t sub_220D93540()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D9356C(uint64_t a1)
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
  v7[1] = sub_220D5CCCC;
  return sub_220D92DF4(a1, v4, v5, v6);
}

uint64_t sub_220D935D8()
{
  return MEMORY[0x24BDF4760];
}

void sub_220D935E4(uint64_t *a1@<X8>)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  if (qword_255650658)
  {
    v2 = (uint64_t (*)(uint64_t))qword_255650660;
    swift_unknownObjectRetain();
    swift_retain();
    v3 = swift_unknownObjectRelease();
    v4 = v2(v3);
    swift_release();
    *a1 = v4;
  }
  else
  {
    __break(1u);
  }
}

BOOL sub_220D93654(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  _QWORD aBlock[6];

  v2 = sub_220D992D4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D992EC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    sub_220D68258();
    v11 = sub_220D994B4();
    v18 = v3;
    v12 = (void *)v11;
    v13 = swift_allocObject();
    swift_weakInit();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v13;
    *(_QWORD *)(v14 + 24) = a1;
    aBlock[4] = sub_220D93C10;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_220D79A30;
    aBlock[3] = &block_descriptor_11;
    v15 = _Block_copy(aBlock);
    v16 = a1;
    swift_release();
    sub_220D992E0();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_220D5D7F4((unint64_t *)&qword_25564BEF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C910);
    sub_220D77500();
    sub_220D9952C();
    MEMORY[0x227665088](0, v9, v5, v15);
    _Block_release(v15);
    swift_release();

    (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return Strong != 0;
}

uint64_t sub_220D9389C(uint64_t a1, void *a2)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_255650658)
    {
      swift_unknownObjectRetain();
      swift_retain();
      swift_retain();
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
      sub_220D78950(a2);
      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_220D93958()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = qword_255650658;
  if (qword_255650658)
  {
    swift_retain();
    swift_unknownObjectRetain();
    type metadata accessor for PASUINonUIExtensionConfiguration();
    v1 = swift_allocObject();
    type metadata accessor for AuthenticateProxyObjectFetchingDecorator();
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v0;
    *(_QWORD *)(v1 + 16) = v2;
    sub_220D9886C();
    sub_220D5D7F4(&qword_25564D300, (uint64_t (*)(uint64_t))type metadata accessor for PASUINonUIExtensionConfiguration, (uint64_t)&unk_220D9B5CC);
    sub_220D98878();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_220D93A40()
{
  if (qword_25564A8B8 != -1)
    swift_once();
  swift_allocObject();
  swift_weakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_220D98860();
}

uint64_t type metadata accessor for PASUIAppExtension()
{
  return objc_opt_self();
}

uint64_t sub_220D93B2C()
{
  return sub_220D5D7F4(&qword_25564D2F8, MEMORY[0x24BDC7A70], MEMORY[0x24BDC7A68]);
}

void sub_220D93B58()
{
  sub_220D93958();
}

uint64_t sub_220D93B78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PASUIAppExtension();
  result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_220D93BA8()
{
  return sub_220D93A40();
}

void sub_220D93BB0(uint64_t *a1@<X8>)
{
  sub_220D935E4(a1);
}

uint64_t sub_220D93BB8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

BOOL sub_220D93BDC(void *a1)
{
  return sub_220D93654(a1);
}

uint64_t sub_220D93BE4()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_220D93C10()
{
  uint64_t v0;

  return sub_220D9389C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

id sub_220D93C30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v13;

  v1 = sub_220D98C98();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)(v0 + 16);
  if (v5)
  {
    v6 = *(id *)(v0 + 16);
  }
  else
  {
    v7 = sub_220D98C80();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
    v8 = sub_220D98C8C();
    v9 = sub_220D99478();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_220D57000, v8, v9, "PASUIViewControllerProvider has no viewController", v10, 2u);
      MEMORY[0x2276657E4](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
    v5 = 0;
  }
  v11 = v5;
  return v6;
}

id sub_220D93D64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void (*v16)(char *, uint64_t);
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t *v21;
  id v22;
  id v23;
  uint64_t v25;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v25 - v7;
  v9 = *(void **)(v1 + 16);
  if (!v9 || (v10 = objc_msgSend(v9, sel_navigationController)) == 0)
  {
    v11 = sub_220D98C80();
    v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v12(v8, v11, v2);
    v13 = sub_220D98C8C();
    v14 = sub_220D99478();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_220D57000, v13, v14, "PASUIViewControllerProvider has no navigationController", v15, 2u);
      MEMORY[0x2276657E4](v15, -1, -1);
    }

    v16 = *(void (**)(char *, uint64_t))(v3 + 8);
    v16(v8, v2);
    v17 = *(void **)(v1 + 16);
    if (v17)
    {
      v18 = v17;
    }
    else
    {
      v12(v6, v11, v2);
      v19 = sub_220D98C8C();
      v20 = sub_220D99478();
      if (os_log_type_enabled(v19, (os_log_type_t)v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_220D57000, v19, (os_log_type_t)v20, "PASUIViewControllerProvider has no viewController", v21, 2u);
        MEMORY[0x2276657E4](v21, -1, -1);
      }

      v16(v6, v2);
      v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
      v17 = 0;
    }
    v22 = objc_allocWithZone(MEMORY[0x24BEBD7A0]);
    v23 = v17;
    v10 = objc_msgSend(v22, sel_initWithRootViewController_, v18);

  }
  return v10;
}

id sub_220D93FA4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint8_t *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;

  v2 = v1;
  v4 = sub_220D98C98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v20 = a1;
  v9 = sub_220D98C8C();
  v10 = sub_220D99484();
  if (os_log_type_enabled(v9, v10))
  {
    v19 = v2;
    v11 = swift_slowAlloc();
    v18 = v4;
    v12 = (uint8_t *)v11;
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138543362;
    v21 = v20;
    v14 = v20;
    sub_220D99508();
    *v13 = v20;

    v2 = v19;
    _os_log_impl(&dword_220D57000, v9, v10, "PASUIViewControllerProvider setViewController %{public}@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25564C920);
    swift_arrayDestroy();
    MEMORY[0x2276657E4](v13, -1, -1);
    v15 = v12;
    v4 = v18;
    MEMORY[0x2276657E4](v15, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v16 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = v20;

  return v20;
}

uint64_t sub_220D94190()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PASUIViewControllerProvider()
{
  return objc_opt_self();
}

id sub_220D941D4()
{
  return sub_220D93C30();
}

id sub_220D941F4()
{
  return sub_220D93D64();
}

id sub_220D94214(void *a1)
{
  return sub_220D93FA4(a1);
}

id sub_220D94234()
{
  void *v0;
  objc_super v2;

  sub_220D94AC8();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUICDPEnrollmentObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220D942F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v3 = sub_220D98C98();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_lastStatus);
  if (v7 == 4 || v7 <= a1)
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_lastStatus) = a1;
    v17 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_delegate;
    result = MEMORY[0x227665880](v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_delegate);
    if (result)
    {
      v18 = *(_QWORD *)(v17 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 8))(a1, ObjectType, v18);
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    v22 = 0;
    v23 = 0xE000000000000000;
    sub_220D9955C();
    swift_bridgeObjectRelease();
    v22 = 544175136;
    v23 = 0xE400000000000000;
    LOBYTE(v21) = a1;
    sub_220D99370();
    sub_220D993AC();
    swift_bridgeObjectRelease();
    sub_220D993AC();
    LOBYTE(v21) = v7;
    sub_220D99370();
    sub_220D993AC();
    swift_bridgeObjectRelease();
    v22 = 0xD000000000000030;
    v23 = 0x8000000220DA0810;
    sub_220D993AC();
    swift_bridgeObjectRelease();
    v9 = v22;
    v8 = v23;
    v10 = sub_220D98C80();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v10, v3);
    swift_bridgeObjectRetain();
    v11 = sub_220D98C8C();
    v12 = sub_220D9946C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v20 = v3;
      v15 = v14;
      v22 = v14;
      *(_DWORD *)v13 = 136446210;
      swift_bridgeObjectRetain();
      v21 = sub_220D6593C(v9, v8, &v22);
      sub_220D99508();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_220D57000, v11, v12, "%{public}s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276657E4](v15, -1, -1);
      MEMORY[0x2276657E4](v13, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v20);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
  }
  return result;
}

uint64_t sub_220D94608()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  char *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char *v34;
  id v35;
  id v36;
  uint64_t aBlock;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  void *v41;
  uint64_t (*v42)();
  uint64_t v43;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUICDPEnrollmentObserver registerObservers", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564D460);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_220D9AFC0;
  v11 = *(void **)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_notificationCenter];
  v12 = (void *)*MEMORY[0x24BE1AA08];
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v1;
  v42 = sub_220D9511C;
  v43 = v13;
  v14 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v39 = 1107296256;
  v40 = sub_220D94A24;
  v41 = &block_descriptor_12;
  v15 = _Block_copy(&aBlock);
  v16 = v12;
  v17 = v1;
  swift_release();
  v18 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v16, 0, 0, v15);
  _Block_release(v15);

  *(_QWORD *)(v10 + 32) = v18;
  v19 = (void *)*MEMORY[0x24BE1AA00];
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v17;
  v42 = sub_220D95158;
  v43 = v20;
  aBlock = v14;
  v39 = 1107296256;
  v40 = sub_220D94A24;
  v41 = &block_descriptor_6_0;
  v21 = _Block_copy(&aBlock);
  v22 = v17;
  v23 = v19;
  swift_release();
  v24 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v23, 0, 0, v21);
  _Block_release(v21);

  *(_QWORD *)(v10 + 40) = v24;
  v25 = (void *)*MEMORY[0x24BE1A9F0];
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v22;
  v42 = sub_220D9517C;
  v43 = v26;
  aBlock = v14;
  v39 = 1107296256;
  v40 = sub_220D94A24;
  v41 = &block_descriptor_12;
  v27 = _Block_copy(&aBlock);
  v28 = v22;
  v29 = v25;
  swift_release();
  v30 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v29, 0, 0, v27);
  _Block_release(v27);

  *(_QWORD *)(v10 + 48) = v30;
  v31 = (void *)*MEMORY[0x24BE1A9F8];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v28;
  v42 = sub_220D951A0;
  v43 = v32;
  aBlock = v14;
  v39 = 1107296256;
  v40 = sub_220D94A24;
  v41 = &block_descriptor_18_2;
  v33 = _Block_copy(&aBlock);
  v34 = v28;
  v35 = v31;
  swift_release();
  v36 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v35, 0, 0, v33);
  _Block_release(v33);

  *(_QWORD *)(v10 + 56) = v36;
  aBlock = v10;
  sub_220D993E8();
  *(_QWORD *)&v34[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_observers] = aBlock;
  return swift_bridgeObjectRelease();
}

uint64_t sub_220D94A24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_220D987C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_220D987B8();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_220D94AC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUICDPEnrollmentObserver deregisterObservers", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_observers);
  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v11)
      goto LABEL_5;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_220D995B0();
  v11 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_5:
  if (v11 >= 1)
  {
    v13 = 0;
    v14 = *(void **)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_notificationCenter);
    do
    {
      if ((v10 & 0xC000000000000001) != 0)
      {
        v15 = MEMORY[0x227665148](v13, v10);
      }
      else
      {
        v15 = *(_QWORD *)(v10 + 8 * v13 + 32);
        swift_unknownObjectRetain();
      }
      ++v13;
      objc_msgSend(v14, sel_removeObserver_, v15);
      swift_unknownObjectRelease();
    }
    while (v11 != v13);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PASUICDPEnrollmentObserver()
{
  return objc_opt_self();
}

uint64_t sub_220D94EC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;

  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "PASUICDPEnrollmentObserver uiController(_:prepareAlertContext:)", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t))(a1 + 16))(a1);
}

uint64_t sub_220D94FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v12;

  v3 = sub_220D98C98();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = sub_220D98C8C();
  v9 = sub_220D99484();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_220D57000, v8, v9, "PASUICDPEnrollmentObserver uiController(_:preparePresentationContext:)", v10, 2u);
    MEMORY[0x2276657E4](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_220D942F4(0);
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_220D950F8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_220D9511C()
{
  return sub_220D942F4(0);
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t sub_220D95158()
{
  return sub_220D942F4(1);
}

uint64_t sub_220D9517C()
{
  return sub_220D942F4(2);
}

uint64_t sub_220D951A0()
{
  return sub_220D942F4(3);
}

uint64_t sub_220D951E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  unint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564D4A0);
  sub_220D99028();
  swift_bridgeObjectRetain();
  swift_release();
  sub_220D99028();
  v2 = *(_QWORD *)(v26 + 64);
  swift_bridgeObjectRetain();
  swift_release();
  v3 = *(void **)(v0 + 32);
  if (v3)
  {
    v4 = *(id *)(v0 + 32);
  }
  else
  {
    v4 = *(id *)(v0 + 48);
    if (v4)
    {
      v5 = (void *)objc_opt_self();
      swift_bridgeObjectRetain();
      v6 = objc_msgSend(v5, sel_tintColor);
      v7 = (void *)objc_opt_self();
      v8 = objc_msgSend(v7, sel_configurationWithHierarchicalColor_, v6);

      v9 = objc_msgSend(v7, sel_configurationWithPointSize_, 100.0);
      v10 = objc_msgSend(v8, sel_configurationByApplyingConfiguration_, v9);
      v11 = (void *)sub_220D99340();
      swift_bridgeObjectRelease();
      v4 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v11, v10);

      v1 = v0;
    }
  }
  v12 = v3;
  v13 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  if (v2)
  {
    v14 = (void *)sub_220D99340();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PASUIWelcomeController()), sel_initWithTitle_detailText_icon_, v13, v14, v4);

  sub_220D99028();
  v16 = v15;
  sub_220D68424((uint64_t)v15, (uint64_t)&off_24E6A4850);
  swift_release();

  v17 = *(_QWORD *)(v1 + 56);
  v26 = v17;
  if (!(v17 >> 62))
  {
    v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v18)
      goto LABEL_10;
LABEL_16:
    sub_220D968A4((uint64_t)&v26);
    return (uint64_t)v16;
  }
  swift_bridgeObjectRetain();
  result = sub_220D995B0();
  v18 = result;
  if (!result)
    goto LABEL_16;
LABEL_10:
  if (v18 >= 1)
  {
    v20 = v17 + 32;
    do
    {
      v21 = *(void **)(*(_QWORD *)v20 + 16);
      objc_opt_self();
      v22 = swift_dynamicCastObjCClass();
      if (v22)
      {
        v23 = v22;
        swift_retain();
        v24 = v21;
        v25 = objc_msgSend(v16, sel_buttonTray);
        objc_msgSend(v25, sel_addButton_, v23);

        swift_release();
      }
      v20 += 8;
      --v18;
    }
    while (v18);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

id sub_220D95560(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  char **v3;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView);
  v3 = &selRef_startAnimating;
  if (!*(_BYTE *)(v1 + 64))
    v3 = &selRef_stopAnimating;
  return objc_msgSend(v2, *v3);
}

uint64_t sub_220D95590@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  type metadata accessor for PASUIDeviceStringController();
  swift_allocObject();
  sub_220D5CD60(v3);
  sub_220D5CD60(v6);
  result = sub_220D678F0(v3, v4, v6, v5);
  *a1 = result;
  return result;
}

uint64_t sub_220D95610()
{
  sub_220D96860();
  return sub_220D98FF8();
}

uint64_t sub_220D95660()
{
  sub_220D96860();
  return sub_220D98FC8();
}

void sub_220D956B0()
{
  sub_220D96860();
  sub_220D98FEC();
  __break(1u);
}

void sub_220D956D4()
{
  qword_255650678 = 0x4077500000000000;
}

id sub_220D956E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  id v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v8 = objc_allocWithZone(MEMORY[0x24BEBD398]);
  v9 = v5;
  v10 = objc_msgSend(v8, sel_initWithActivityIndicatorStyle_, 100);
  *(_QWORD *)&v9[OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView] = v10;

  v11 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v12 = (void *)sub_220D99340();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for PASUIWelcomeController();
  v13 = objc_msgSendSuper2(&v15, sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, 2);

  return v13;
}

void sub_220D95948()
{
  char *v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;

  v1 = *(void **)&v0[OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView];
  objc_msgSend(v1, sel_removeFromSuperview);
  v2 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v2, sel_addSubview_, v1);

  if (objc_msgSend(v0, sel_isContentCenterAligned))
    v3 = 100;
  else
    v3 = 101;
  objc_msgSend(v1, sel_setActivityIndicatorViewStyle_, v3);
  v4 = objc_msgSend(v0, sel_view);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_centerYAnchor);

    v7 = objc_msgSend(v1, sel_centerYAnchor);
    v27 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

    LODWORD(v8) = 1132068864;
    objc_msgSend(v27, sel_setPriority_, v8);
    v9 = objc_msgSend(v0, sel_isContentCenterAligned);
    v10 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564D460);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_220D9AFC0;
    v12 = objc_msgSend(v0, sel_contentView);
    v13 = v12;
    if (v9)
    {
      v14 = objc_msgSend(v12, sel_centerXAnchor);

      v15 = objc_msgSend(v1, sel_centerXAnchor);
    }
    else
    {
      v14 = objc_msgSend(v12, sel_leadingAnchor);

      v15 = objc_msgSend(v1, sel_leadingAnchor);
    }
    v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

    *(_QWORD *)(v11 + 32) = v16;
    *(_QWORD *)(v11 + 40) = v27;
    v17 = v27;
    v18 = objc_msgSend(v1, sel_topAnchor);
    v19 = objc_msgSend(v0, sel_contentView);
    v20 = objc_msgSend(v19, sel_topAnchor);

    v21 = objc_msgSend(v18, sel_constraintGreaterThanOrEqualToAnchor_, v20);
    *(_QWORD *)(v11 + 48) = v21;
    v22 = objc_msgSend(v0, sel_contentView);
    v23 = objc_msgSend(v22, sel_bottomAnchor);

    v24 = objc_msgSend(v1, sel_bottomAnchor);
    v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

    *(_QWORD *)(v11 + 56) = v25;
    sub_220D993E8();
    sub_220D67784();
    v26 = (void *)sub_220D993C4();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_activateConstraints_, v26);

  }
  else
  {
    __break(1u);
  }
}

void sub_220D95DE0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  _QWORD v39[2];

  v1 = v0;
  v2 = sub_220D98C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D98C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_220D98C8C();
  v8 = sub_220D99484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_220D57000, v7, v8, "Adding header animation view", v9, 2u);
    MEMORY[0x2276657E4](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  type metadata accessor for PASUIMicaView();
  v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v10, sel_addSubview_, v11);
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v12 = objc_msgSend(v1, sel_headerView);
  v13 = objc_msgSend(v12, sel_animationView);

  if (v13)
  {
    objc_msgSend(v13, sel_addSubview_, v10);
    v14 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25564D460);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_220D9D620;
    v16 = objc_msgSend(v10, sel_centerXAnchor);
    v17 = objc_msgSend(v13, sel_centerXAnchor);
    v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

    *(_QWORD *)(v15 + 32) = v18;
    v19 = objc_msgSend(v10, sel_centerYAnchor);
    v20 = objc_msgSend(v13, sel_centerYAnchor);
    v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

    *(_QWORD *)(v15 + 40) = v21;
    v22 = objc_msgSend(v10, sel_heightAnchor);
    if (qword_25564A8C0 != -1)
      swift_once();
    v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, *(double *)&qword_255650678);

    *(_QWORD *)(v15 + 48) = v23;
    v24 = objc_msgSend(v10, sel_widthAnchor);
    v25 = objc_msgSend(v24, sel_constraintEqualToConstant_, *(double *)&qword_255650678);

    *(_QWORD *)(v15 + 56) = v25;
    v26 = objc_msgSend(v11, sel_topAnchor);
    v27 = objc_msgSend(v10, sel_topAnchor);
    v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v27);

    *(_QWORD *)(v15 + 64) = v28;
    v29 = objc_msgSend(v11, sel_bottomAnchor);
    v30 = objc_msgSend(v10, sel_bottomAnchor);
    v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

    *(_QWORD *)(v15 + 72) = v31;
    v32 = objc_msgSend(v11, sel_leadingAnchor);
    v33 = objc_msgSend(v10, sel_leadingAnchor);
    v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);

    *(_QWORD *)(v15 + 80) = v34;
    v35 = objc_msgSend(v11, sel_trailingAnchor);
    v36 = objc_msgSend(v10, sel_trailingAnchor);
    v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

    *(_QWORD *)(v15 + 88) = v37;
    v39[1] = v15;
    sub_220D993E8();
    sub_220D67784();
    v38 = (void *)sub_220D993C4();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_activateConstraints_, v38);

  }
}

id sub_220D9637C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUIWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PASUIWelcomeController()
{
  return objc_opt_self();
}

void sub_220D963DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_220D963F4(a1, a2, a3, a4, (SEL *)&selRef_setTitle_);
}

void sub_220D963E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_220D963F4(a1, a2, a3, a4, (SEL *)&selRef_setDetailText_);
}

void sub_220D963F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v5;
  id v7;
  id v8;

  v7 = objc_msgSend(v5, sel_headerView);
  v8 = (id)sub_220D99340();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, *a5, v8);

}

uint64_t destroy for PASUIWelcomeControllerWrapper(uint64_t a1)
{
  if (*(_QWORD *)a1)
    swift_release();
  if (*(_QWORD *)(a1 + 16))
    swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PASUIWelcomeControllerWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (*(_QWORD *)a2)
  {
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = *(_QWORD *)(a2 + 16);
  if (v5)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  v7 = *(void **)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v10 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PASUIWelcomeControllerWrapper(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *a2;
  if (*(_QWORD *)a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v7)
    {
      v9 = a2[3];
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v9;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_15;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[3];
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  swift_retain();
  swift_release();
LABEL_15:
  v10 = *(void **)(a1 + 32);
  v11 = (void *)a2[4];
  *(_QWORD *)(a1 + 32) = v11;
  v12 = v11;

  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PASUIWelcomeControllerWrapper(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = *a2;
  if (*(_QWORD *)a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v7)
    {
      v9 = a2[3];
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v9;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_15;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[3];
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  swift_release();
LABEL_15:
  v10 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = a2[4];

  *(_QWORD *)(a1 + 40) = a2[5];
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIWelcomeControllerWrapper(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIWelcomeControllerWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 56) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIWelcomeControllerWrapper()
{
  return &type metadata for PASUIWelcomeControllerWrapper;
}

unint64_t sub_220D96860()
{
  unint64_t result;

  result = qword_25564D498;
  if (!qword_25564D498)
  {
    result = MEMORY[0x227665754](&unk_220D9D6A0, &type metadata for PASUIWelcomeControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_25564D498);
  }
  return result;
}

uint64_t sub_220D968A4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void sub_220D968CC()
{
  xmmword_255650680 = 0uLL;
}

double sub_220D968DC@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_25564A8C8 != -1)
    swift_once();
  result = *(double *)&xmmword_255650680;
  *a1 = xmmword_255650680;
  return result;
}

uint64_t sub_220D96934@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_220D991D8();
  result = sub_220D98DDC();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

unint64_t sub_220D96980@<X0>(uint64_t a1@<X8>)
{
  uint64_t started;
  uint64_t v3;
  unint64_t result;

  started = type metadata accessor for PASUISourceStartViewProxCardAdapter();
  v3 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_220D988B4();
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_220D995B0())
    result = sub_220D69690(MEMORY[0x24BEE4AF8]);
  else
    result = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v3 + 24) = result;
  *(_QWORD *)(a1 + 24) = started;
  *(_QWORD *)(a1 + 32) = &off_24E6A3D70;
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t PASFlowStepSourceStart.buildView()()
{
  sub_220D96A50();
  return sub_220D99280();
}

unint64_t sub_220D96A50()
{
  unint64_t result;

  result = qword_25564D4A8;
  if (!qword_25564D4A8)
  {
    result = MEMORY[0x227665754](&unk_220D9D878, &type metadata for PASUISourceStartView);
    atomic_store(result, (unint64_t *)&qword_25564D4A8);
  }
  return result;
}

unint64_t sub_220D96A94@<X0>(uint64_t a1@<X8>)
{
  return sub_220D96980(a1);
}

uint64_t sub_220D96AA8()
{
  sub_220D96A50();
  return sub_220D99280();
}

uint64_t type metadata accessor for PASUISourceStartViewProxCardAdapter()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for PASUISourceStartView()
{
  return &type metadata for PASUISourceStartView;
}

uint64_t sub_220D96AF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t PASFlowStepSignInResult.buildView()()
{
  sub_220D5CE08();
  return sub_220D99280();
}

uint64_t sub_220D96B2C(void (*a1)(void))
{
  uint64_t v1;

  a1();
  return sub_220D97AD4(*(uint64_t (**)(void))(v1 + 8));
}

unint64_t sub_220D96B60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  unint64_t result;

  v3 = type metadata accessor for PASUIAllSetProxCardAdapter();
  v4 = (_QWORD *)swift_allocObject();
  v4[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  v4[2] = sub_220D988B4();
  swift_retain();
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_220D995B0())
    result = sub_220D69690(MEMORY[0x24BEE4AF8]);
  else
    result = MEMORY[0x24BEE4B08];
  v4[3] = result;
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = &off_24E6A3D70;
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t PASFlowStepAllSet.buildView()()
{
  return sub_220D99280();
}

unint64_t sub_220D96C3C@<X0>(uint64_t a1@<X8>)
{
  return sub_220D96B60(a1);
}

uint64_t sub_220D96C5C()
{
  return sub_220D99280();
}

void sub_220D96C70(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  void (*v14)(id *__return_ptr, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id aBlock;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  uint64_t (*v35)(uint64_t);
  uint64_t v36;

  v2 = v1;
  v29 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D6B8);
  v30 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D8AAAC(a1);
  v14 = *(void (**)(id *__return_ptr, uint64_t))(**(_QWORD **)(v2 + 16) + 128);
  v15 = swift_retain();
  v14(&aBlock, v15);
  swift_release();
  v16 = v32;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v16 + 40))(ObjectType, v16);
  swift_unknownObjectRelease();
  sub_220D68258();
  aBlock = (id)sub_220D994B4();
  v18 = sub_220D9949C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 1, 1, v18);
  sub_220D6839C(&qword_25564AEF0, &qword_25564AED8, MEMORY[0x24BDB9EE8]);
  sub_220D68294();
  sub_220D98D10();
  sub_220D5D018((uint64_t)v6, &qword_25564AED0);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v19 = swift_allocObject();
  swift_weakInit();
  v20 = swift_allocObject();
  v21 = v29;
  *(_QWORD *)(v20 + 16) = v19;
  *(_QWORD *)(v20 + 24) = v21;
  sub_220D6839C(&qword_25564D6C0, &qword_25564D6B8, MEMORY[0x24BDB9A08]);
  swift_unknownObjectRetain();
  sub_220D98D1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v11);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  swift_release();
  v22 = swift_allocObject();
  swift_weakInit();
  v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v22;
  *(_QWORD *)(v24 + 24) = v23;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = sub_220D97A14;
  *(_QWORD *)(v25 + 24) = v24;
  swift_retain();
  swift_retain();
  swift_retain();
  v26 = (void *)sub_220D99340();
  v35 = sub_220D6D1E8;
  v36 = v25;
  aBlock = (id)MEMORY[0x24BDAC760];
  v32 = 1107296256;
  v33 = sub_220D76398;
  v34 = &block_descriptor_13;
  v27 = _Block_copy(&aBlock);
  v28 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v26, 0, v27);

  _Block_release(v27);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_msgSend(v21, sel_setDismissButtonAction_, v28);

}

void sub_220D970B0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t Strong;
  uint64_t v6;
  void *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void (*v33)(_QWORD *__return_ptr);
  id v34;
  void *v35;
  uint64_t (*v36)(uint64_t);
  char *v37;
  char *v38;
  uint64_t v39;
  char v40;
  id v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  _QWORD aBlock[3];
  void *v46;
  uint64_t (*v47)(uint64_t);
  uint64_t v48;
  _BYTE v49[40];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    return;
  v6 = Strong;
  (*(void (**)(_QWORD *__return_ptr))(**(_QWORD **)(Strong + 32) + 640))(aBlock);
  v7 = v46;
  if (v46)
  {
    v8 = v47;
    __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
    v9 = (*((uint64_t (**)(void *, uint64_t (*)(uint64_t)))v8 + 6))(v7, v8);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = *(_QWORD *)(v9 + *MEMORY[0x24BE7B7B0] + 8);
      swift_bridgeObjectRetain();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
      sub_220D683DC(a1, (uint64_t)v49);
      if (v11)
        goto LABEL_13;
      goto LABEL_9;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  }
  else
  {
    sub_220D5D018((uint64_t)aBlock, &qword_25564D6E0);
  }
  sub_220D683DC(a1, (uint64_t)v49);
LABEL_9:
  sub_220D683DC((uint64_t)v49, (uint64_t)aBlock);
  v12 = v46;
  if (v46)
  {
    v13 = v47;
    __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
    (*((void (**)(_QWORD *__return_ptr, void *, uint64_t (*)(uint64_t)))v13 + 1))(v42, v12, v13);
    v14 = v43;
    v15 = v44;
    __swift_project_boxed_opaque_existential_1(v42, v43);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  }
  else
  {
    sub_220D5D018((uint64_t)aBlock, (uint64_t *)&unk_25564AF10);
  }
  sub_220D97ADC();
  swift_bridgeObjectRelease();
LABEL_13:
  sub_220D5D018((uint64_t)v49, (uint64_t *)&unk_25564AF10);
  v16 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setTitle_, v16);

  (*(void (**)(_QWORD *__return_ptr))(**(_QWORD **)(v6 + 32) + 640))(aBlock);
  v17 = v46;
  if (v46)
  {
    v18 = v47;
    __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
    v19 = (*((uint64_t (**)(void *, uint64_t (*)(uint64_t)))v18 + 6))(v17, v18);
    if (v19)
    {
      v20 = (void *)v19;
      v21 = *(_QWORD *)(v19 + *MEMORY[0x24BE7B7B8] + 8);
      swift_bridgeObjectRetain();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
      if (v21)
      {
        v17 = (void *)sub_220D99340();
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
    }
    v17 = 0;
  }
  else
  {
    sub_220D5D018((uint64_t)aBlock, &qword_25564D6E0);
  }
LABEL_20:
  objc_msgSend(a3, sel_setSubtitle_, v17);

  sub_220D99394();
  swift_retain();
  v22 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
  v47 = sub_220D97BA8;
  v48 = v6;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_220D76398;
  v46 = &block_descriptor_22;
  v23 = _Block_copy(aBlock);
  v24 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v22, 0, v23);

  _Block_release(v23);
  swift_release();

  (*(void (**)(_QWORD *__return_ptr))(**(_QWORD **)(v6 + 32) + 640))(aBlock);
  v25 = v46;
  if (!v46)
  {
    sub_220D5D018((uint64_t)aBlock, &qword_25564D6E0);
    goto LABEL_26;
  }
  v26 = v47;
  __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
  v27 = (*((uint64_t (**)(void *, uint64_t (*)(uint64_t)))v26 + 6))(v25, v26);
  if (!v27)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
    goto LABEL_26;
  }
  v28 = (void *)v27;
  v29 = *(_QWORD *)(v27 + *MEMORY[0x24BE7B7A8] + 8);
  swift_bridgeObjectRetain();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  if (!v29)
  {
LABEL_26:
    v30 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_, 72.0);
    v31 = (void *)sub_220D99340();
    goto LABEL_27;
  }
  v30 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_, 3, 80.0);
  v31 = (void *)sub_220D99340();
  swift_bridgeObjectRelease();
LABEL_27:
  v32 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v31, v30);

  if (v32)
  {
    v33 = *(void (**)(_QWORD *__return_ptr))(**(_QWORD **)(v6 + 32) + 640);
    v34 = v32;
    v33(aBlock);
    v35 = v46;
    if (v46)
    {
      v36 = v47;
      __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
      v37 = (char *)(*((uint64_t (**)(void *, uint64_t (*)(uint64_t)))v36 + 6))(v35, v36);
      if (v37
        && (v38 = &v37[*MEMORY[0x24BE7B7A0]], v39 = *(_QWORD *)v38, v40 = v38[8], v37, (v40 & 1) == 0))
      {
        if (v39 != 1)
        {
          v42[0] = v39;
          sub_220D99610();
          __break(1u);
          return;
        }
        v41 = objc_msgSend((id)objc_opt_self(), sel_systemGreenColor);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
        v41 = 0;
      }
    }
    else
    {
      sub_220D5D018((uint64_t)aBlock, &qword_25564D6E0);
      v41 = 0;
    }
    sub_220D8BB10(a3, (uint64_t)v34, v41);
    swift_release();

    v24 = v41;
  }
  else
  {
    swift_release();
  }

}

uint64_t sub_220D976E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_220D99418();
  swift_retain();
  v7 = sub_220D9940C();
  v8 = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = a2;
  sub_220D5F9A8((uint64_t)v5, (uint64_t)&unk_25564D6F0, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_220D977C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_220D99418();
  *(_QWORD *)(v4 + 24) = sub_220D9940C();
  sub_220D993F4();
  return swift_task_switch();
}

uint64_t sub_220D97830()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_release();
  (*(void (**)(uint64_t))(**(_QWORD **)(v1 + 32) + 656))(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220D97870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result;
    swift_beginAccess();
    v6 = (void *)MEMORY[0x227665880](a3 + 16);
    if (v6)
    {
      v7 = objc_msgSend(v6, sel_viewController);
      v8 = *(_QWORD *)(v5 + 32);
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = sub_220D5F220;
      *(_QWORD *)(v9 + 24) = v8;
      swift_retain_n();
      sub_220D8B658(v7, (uint64_t)&unk_25564D6D0, v8, (uint64_t)&unk_25564B480, v9);
      swift_release();
      swift_unknownObjectRelease();

      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for PASUIAllSetProxCardAdapter()
{
  return objc_opt_self();
}

uint64_t sub_220D979AC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D979D0()
{
  return objectdestroy_6Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

void sub_220D979DC(uint64_t a1)
{
  uint64_t v1;

  sub_220D970B0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_220D979E4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D97A08()
{
  return objectdestroy_6Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_220D97A14(uint64_t a1)
{
  uint64_t v1;

  return sub_220D97870(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_220D97A1C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_220D97A58()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_220D5DA1C;
  v5 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 528) + *(_QWORD *)(*(_QWORD *)v0 + 528));
  v3 = (_QWORD *)swift_task_alloc();
  v2[2] = v3;
  *v3 = v2;
  v3[1] = sub_220D5DA1C;
  return v5();
}

uint64_t sub_220D97AD4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_220D97ADC()
{
  uint64_t v0;

  sub_220D9955C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_220D993AC();
  swift_bridgeObjectRelease();
  v0 = sub_220D99394();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_220D97BA8(uint64_t a1)
{
  uint64_t v1;

  return sub_220D976E8(a1, v1);
}

uint64_t sub_220D97BB0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D97BDC(uint64_t a1)
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
  v7[1] = sub_220D5CCCC;
  return sub_220D977C4(a1, v4, v5, v6);
}

unint64_t sub_220D97C54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  unint64_t result;

  v3 = type metadata accessor for PASUISourceErrorProxCardAdapter();
  v4 = (_QWORD *)swift_allocObject();
  v4[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25564A8F8);
  swift_allocObject();
  v4[2] = sub_220D988B4();
  swift_retain();
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_220D995B0())
    result = sub_220D69690(MEMORY[0x24BEE4AF8]);
  else
    result = MEMORY[0x24BEE4B08];
  v4[3] = result;
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = &off_24E6A3D70;
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t PASFlowStepSourceError.buildView()()
{
  return sub_220D99280();
}

unint64_t sub_220D97D30@<X0>(uint64_t a1@<X8>)
{
  return sub_220D97C54(a1);
}

void sub_220D97D50(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  void (*v14)(id *__return_ptr, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id aBlock;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  uint64_t (*v33)(uint64_t);
  uint64_t v34;

  v2 = v1;
  v27 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564AED8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564D6B8);
  v28 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D8AAAC(a1);
  v14 = *(void (**)(id *__return_ptr, uint64_t))(**(_QWORD **)(v2 + 16) + 128);
  v15 = swift_retain();
  v14(&aBlock, v15);
  swift_release();
  v16 = v30;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v16 + 40))(ObjectType, v16);
  swift_unknownObjectRelease();
  sub_220D68258();
  aBlock = (id)sub_220D994B4();
  v18 = sub_220D9949C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 1, 1, v18);
  sub_220D6839C(&qword_25564AEF0, &qword_25564AED8, MEMORY[0x24BDB9EE8]);
  sub_220D68294();
  sub_220D98D10();
  sub_220D5D018((uint64_t)v6, &qword_25564AED0);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v19 = swift_allocObject();
  swift_weakInit();
  v20 = swift_allocObject();
  v21 = v27;
  *(_QWORD *)(v20 + 16) = v19;
  *(_QWORD *)(v20 + 24) = v21;
  sub_220D6839C(&qword_25564D6C0, &qword_25564D6B8, MEMORY[0x24BDB9A08]);
  swift_unknownObjectRetain();
  sub_220D98D1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v11);
  swift_beginAccess();
  sub_220D98CB0();
  swift_endAccess();
  swift_release();
  v22 = swift_allocObject();
  swift_weakInit();
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_220D985E0;
  *(_QWORD *)(v23 + 24) = v22;
  swift_retain_n();
  v24 = (void *)sub_220D99340();
  v33 = sub_220D6D1E8;
  v34 = v23;
  aBlock = (id)MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_220D76398;
  v32 = &block_descriptor_14;
  v25 = _Block_copy(&aBlock);
  v26 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v24, 0, v25);

  _Block_release(v25);
  swift_release_n();
  swift_release();
  objc_msgSend(v21, sel_setDismissButtonAction_, v26);

}

void sub_220D98138(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_220D683DC(a1, (uint64_t)v18);
    v5 = v19;
    if (v19)
    {
      v6 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v6 + 8))(v15, v5, v6);
      v7 = v16;
      v8 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
    else
    {
      sub_220D5D018((uint64_t)v18, (uint64_t *)&unk_25564AF10);
    }
    sub_220D986BC();
    swift_bridgeObjectRelease();
    v9 = (void *)sub_220D99340();
    swift_bridgeObjectRelease();
    objc_msgSend(a3, sel_setTitle_, v9);

    sub_220D683DC(a1, (uint64_t)v18);
    v10 = v19;
    if (v19)
    {
      v11 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v11 + 8))(v15, v10, v11);
      v12 = v16;
      v13 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
    else
    {
      sub_220D5D018((uint64_t)v18, (uint64_t *)&unk_25564AF10);
    }
    sub_220D986BC();
    swift_bridgeObjectRelease();
    v14 = (void *)sub_220D99340();
    swift_bridgeObjectRelease();
    objc_msgSend(a3, sel_setSubtitle_, v14);
    swift_release();

  }
}

uint64_t sub_220D9839C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = result;
    v5 = sub_220D9943C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
    sub_220D99418();
    swift_retain();
    v6 = sub_220D9940C();
    v7 = (_QWORD *)swift_allocObject();
    v8 = MEMORY[0x24BEE6930];
    v7[2] = v6;
    v7[3] = v8;
    v7[4] = v4;
    sub_220D5F9A8((uint64_t)v2, (uint64_t)&unk_25564D818, (uint64_t)v7);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_220D984AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  sub_220D99418();
  v4[3] = sub_220D9940C();
  v4[4] = sub_220D993F4();
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t sub_220D98518()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_220D5C5D4;
  return sub_220D989F8();
}

uint64_t type metadata accessor for PASUISourceErrorProxCardAdapter()
{
  return objc_opt_self();
}

uint64_t sub_220D98588()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_220D985AC()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_220D985D8(uint64_t a1)
{
  uint64_t v1;

  sub_220D98138(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_220D985E0()
{
  return sub_220D9839C();
}

uint64_t sub_220D985E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_220D98624()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_220D98650(uint64_t a1)
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
  v7[1] = sub_220D5CCCC;
  return sub_220D984AC(a1, v4, v5, v6);
}

uint64_t sub_220D986BC()
{
  uint64_t v0;

  sub_220D9955C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_220D993AC();
  swift_bridgeObjectRelease();
  v0 = sub_220D99394();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PASUITargetViewPresenterError.code.getter(unsigned __int8 a1)
{
  return a1 + 1100;
}

uint64_t PASUISourceViewPresenterError.code.getter(unsigned __int8 a1)
{
  return a1 + 1200;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_220D987B8()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_220D987C4()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_220D987D0()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_220D987DC()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_220D987E8()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_220D987F4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_220D98800()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_220D9880C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_220D98818()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_220D98824()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_220D98830()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_220D9883C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_220D98848()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_220D98854()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_220D98860()
{
  return MEMORY[0x24BDC7A48]();
}

uint64_t sub_220D9886C()
{
  return MEMORY[0x24BDC7A58]();
}

uint64_t sub_220D98878()
{
  return MEMORY[0x24BDC7A80]();
}

uint64_t sub_220D98884()
{
  return MEMORY[0x24BDC7AD0]();
}

uint64_t sub_220D98890()
{
  return MEMORY[0x24BDC7AD8]();
}

uint64_t sub_220D9889C()
{
  return MEMORY[0x24BDC7AE0]();
}

uint64_t sub_220D988A8()
{
  return MEMORY[0x24BDC7920]();
}

uint64_t sub_220D988B4()
{
  return MEMORY[0x24BE7B460]();
}

uint64_t sub_220D988C0()
{
  return MEMORY[0x24BE7B478]();
}

uint64_t sub_220D988CC()
{
  return MEMORY[0x24BE7B480]();
}

uint64_t sub_220D988D8()
{
  return MEMORY[0x24BE7B488]();
}

uint64_t sub_220D988E4()
{
  return MEMORY[0x24BE7B490]();
}

uint64_t sub_220D988F0()
{
  return MEMORY[0x24BE7B498]();
}

uint64_t sub_220D988FC()
{
  return MEMORY[0x24BE7B4A8]();
}

uint64_t sub_220D98908()
{
  return MEMORY[0x24BE7B4B0]();
}

uint64_t sub_220D98914()
{
  return MEMORY[0x24BE7B4B8]();
}

uint64_t sub_220D98920()
{
  return MEMORY[0x24BE7B4C8]();
}

uint64_t sub_220D9892C()
{
  return MEMORY[0x24BE7B4D0]();
}

uint64_t sub_220D98938()
{
  return MEMORY[0x24BE7B500]();
}

uint64_t sub_220D98944()
{
  return MEMORY[0x24BE7B518]();
}

uint64_t sub_220D98950()
{
  return MEMORY[0x24BE7B530]();
}

uint64_t sub_220D9895C()
{
  return MEMORY[0x24BE7B540]();
}

uint64_t sub_220D98968()
{
  return MEMORY[0x24BE7B560]();
}

uint64_t sub_220D98974()
{
  return MEMORY[0x24BE7B570]();
}

uint64_t sub_220D98980()
{
  return MEMORY[0x24BE7B580]();
}

uint64_t sub_220D9898C()
{
  return MEMORY[0x24BE7B590]();
}

uint64_t sub_220D98998()
{
  return MEMORY[0x24BE7B598]();
}

uint64_t sub_220D989A4()
{
  return MEMORY[0x24BE7B5A8]();
}

uint64_t sub_220D989B0()
{
  return MEMORY[0x24BE7B5B0]();
}

uint64_t sub_220D989BC()
{
  return MEMORY[0x24BE7B5D8]();
}

uint64_t sub_220D989C8()
{
  return MEMORY[0x24BE7B5E0]();
}

uint64_t sub_220D989D4()
{
  return MEMORY[0x24BE7B5E8]();
}

uint64_t sub_220D989E0()
{
  return MEMORY[0x24BE7B5F8]();
}

uint64_t sub_220D989EC()
{
  return MEMORY[0x24BE7B600]();
}

uint64_t sub_220D989F8()
{
  return MEMORY[0x24BE7B610]();
}

uint64_t sub_220D98A04()
{
  return MEMORY[0x24BE7B648]();
}

uint64_t sub_220D98A10()
{
  return MEMORY[0x24BE7B658]();
}

uint64_t sub_220D98A1C()
{
  return MEMORY[0x24BE7B660]();
}

uint64_t sub_220D98A28()
{
  return MEMORY[0x24BE7B668]();
}

uint64_t sub_220D98A34()
{
  return MEMORY[0x24BE7B670]();
}

uint64_t sub_220D98A40()
{
  return MEMORY[0x24BE7B678]();
}

uint64_t sub_220D98A4C()
{
  return MEMORY[0x24BE7B680]();
}

uint64_t sub_220D98A58()
{
  return MEMORY[0x24BE7B688]();
}

uint64_t sub_220D98A64()
{
  return MEMORY[0x24BE7B698]();
}

uint64_t sub_220D98A70()
{
  return MEMORY[0x24BE7B6A0]();
}

uint64_t sub_220D98A7C()
{
  return MEMORY[0x24BE7B6B8]();
}

uint64_t sub_220D98A88()
{
  return MEMORY[0x24BE7B6E0]();
}

uint64_t sub_220D98A94()
{
  return MEMORY[0x24BE7B6F0]();
}

uint64_t sub_220D98AA0()
{
  return MEMORY[0x24BE7B6F8]();
}

uint64_t sub_220D98AAC()
{
  return MEMORY[0x24BE7B718]();
}

uint64_t sub_220D98AB8()
{
  return MEMORY[0x24BE7B720]();
}

uint64_t sub_220D98AC4()
{
  return MEMORY[0x24BE7B728]();
}

uint64_t sub_220D98AD0()
{
  return MEMORY[0x24BE7B730]();
}

uint64_t sub_220D98ADC()
{
  return MEMORY[0x24BE7B740]();
}

uint64_t sub_220D98AE8()
{
  return MEMORY[0x24BE7B758]();
}

uint64_t sub_220D98AF4()
{
  return MEMORY[0x24BE7B760]();
}

uint64_t sub_220D98B00()
{
  return MEMORY[0x24BE7B768]();
}

uint64_t sub_220D98B0C()
{
  return MEMORY[0x24BE7B770]();
}

uint64_t sub_220D98B18()
{
  return MEMORY[0x24BE7B780]();
}

uint64_t sub_220D98B24()
{
  return MEMORY[0x24BE7B7C0]();
}

uint64_t sub_220D98B30()
{
  return MEMORY[0x24BE7B7D0]();
}

uint64_t sub_220D98B3C()
{
  return MEMORY[0x24BE7B7D8]();
}

uint64_t sub_220D98B48()
{
  return MEMORY[0x24BE7B7E0]();
}

uint64_t sub_220D98B54()
{
  return MEMORY[0x24BE7B7F0]();
}

uint64_t sub_220D98B60()
{
  return MEMORY[0x24BE7B818]();
}

uint64_t sub_220D98B6C()
{
  return MEMORY[0x24BE7B820]();
}

uint64_t sub_220D98B78()
{
  return MEMORY[0x24BE7B848]();
}

uint64_t sub_220D98B84()
{
  return MEMORY[0x24BE7B858]();
}

uint64_t sub_220D98B90()
{
  return MEMORY[0x24BE7B870]();
}

uint64_t sub_220D98B9C()
{
  return MEMORY[0x24BE7B878]();
}

uint64_t sub_220D98BA8()
{
  return MEMORY[0x24BE7B880]();
}

uint64_t sub_220D98BB4()
{
  return MEMORY[0x24BE7B888]();
}

uint64_t sub_220D98BC0()
{
  return MEMORY[0x24BE7B890]();
}

uint64_t sub_220D98BCC()
{
  return MEMORY[0x24BE7B898]();
}

uint64_t sub_220D98BD8()
{
  return MEMORY[0x24BE7B8A0]();
}

uint64_t sub_220D98BE4()
{
  return MEMORY[0x24BE7B8B8]();
}

uint64_t sub_220D98BF0()
{
  return MEMORY[0x24BE7B910]();
}

uint64_t sub_220D98BFC()
{
  return MEMORY[0x24BE7B968]();
}

uint64_t sub_220D98C08()
{
  return MEMORY[0x24BE7B970]();
}

uint64_t sub_220D98C14()
{
  return MEMORY[0x24BE7B978]();
}

uint64_t sub_220D98C20()
{
  return MEMORY[0x24BE7B988]();
}

uint64_t sub_220D98C2C()
{
  return MEMORY[0x24BE7B990]();
}

uint64_t sub_220D98C38()
{
  return MEMORY[0x24BE7B9A0]();
}

uint64_t sub_220D98C44()
{
  return MEMORY[0x24BE7B9C0]();
}

uint64_t sub_220D98C50()
{
  return MEMORY[0x24BE7B9C8]();
}

uint64_t sub_220D98C5C()
{
  return MEMORY[0x24BE7B9D0]();
}

uint64_t sub_220D98C68()
{
  return MEMORY[0x24BE7B9D8]();
}

uint64_t sub_220D98C74()
{
  return MEMORY[0x24BE7B9E0]();
}

uint64_t sub_220D98C80()
{
  return MEMORY[0x24BE7B9F8]();
}

uint64_t sub_220D98C8C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_220D98C98()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_220D98CA4()
{
  return MEMORY[0x24BDB9448]();
}

uint64_t sub_220D98CB0()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_220D98CBC()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_220D98CC8()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_220D98CD4()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_220D98CE0()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_220D98CEC()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_220D98CF8()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_220D98D04()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_220D98D10()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_220D98D1C()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_220D98D28()
{
  return MEMORY[0x24BDBA118]();
}

uint64_t sub_220D98D34()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_220D98D40()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_220D98D4C()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_220D98D58()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_220D98D64()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_220D98D70()
{
  return MEMORY[0x24BDEB4A0]();
}

uint64_t sub_220D98D7C()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_220D98D88()
{
  return MEMORY[0x24BDEB798]();
}

uint64_t sub_220D98D94()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_220D98DA0()
{
  return MEMORY[0x24BDEBBB8]();
}

uint64_t sub_220D98DAC()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_220D98DB8()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_220D98DC4()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_220D98DD0()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_220D98DDC()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_220D98DE8()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_220D98DF4()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_220D98E00()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_220D98E0C()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_220D98E18()
{
  return MEMORY[0x24BDEC938]();
}

uint64_t sub_220D98E24()
{
  return MEMORY[0x24BDEC958]();
}

uint64_t sub_220D98E30()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_220D98E3C()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_220D98E48()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_220D98E54()
{
  return MEMORY[0x24BDECB58]();
}

uint64_t sub_220D98E60()
{
  return MEMORY[0x24BDECB68]();
}

uint64_t sub_220D98E6C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_220D98E78()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_220D98E84()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_220D98E90()
{
  return MEMORY[0x24BDEDF08]();
}

uint64_t sub_220D98E9C()
{
  return MEMORY[0x24BDEDF10]();
}

uint64_t sub_220D98EA8()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_220D98EB4()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_220D98EC0()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_220D98ECC()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_220D98ED8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_220D98EE4()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_220D98EF0()
{
  return MEMORY[0x24BDEECF8]();
}

uint64_t sub_220D98EFC()
{
  return MEMORY[0x24BDEED60]();
}

uint64_t sub_220D98F08()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_220D98F14()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_220D98F20()
{
  return MEMORY[0x24BDEF0D0]();
}

uint64_t sub_220D98F2C()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_220D98F38()
{
  return MEMORY[0x24BDEF188]();
}

uint64_t sub_220D98F44()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_220D98F50()
{
  return MEMORY[0x24BDEF358]();
}

uint64_t sub_220D98F5C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_220D98F68()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_220D98F74()
{
  return MEMORY[0x24BDF08B0]();
}

uint64_t sub_220D98F80()
{
  return MEMORY[0x24BDF08D0]();
}

uint64_t sub_220D98F8C()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_220D98F98()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_220D98FA4()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_220D98FB0()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_220D98FBC()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_220D98FC8()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_220D98FD4()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_220D98FE0()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_220D98FEC()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_220D98FF8()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_220D99004()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_220D99010()
{
  return MEMORY[0x24BDF11E0]();
}

uint64_t sub_220D9901C()
{
  return MEMORY[0x24BDF1200]();
}

uint64_t sub_220D99028()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_220D99034()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_220D99040()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_220D9904C()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_220D99058()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_220D99064()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_220D99070()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_220D9907C()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_220D99088()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_220D99094()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_220D990A0()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_220D990AC()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_220D990B8()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_220D990C4()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_220D990D0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_220D990DC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_220D990E8()
{
  return MEMORY[0x24BDF2100]();
}

uint64_t sub_220D990F4()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_220D99100()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_220D9910C()
{
  return MEMORY[0x24BDF2678]();
}

uint64_t sub_220D99118()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_220D99124()
{
  return MEMORY[0x24BDF2738]();
}

uint64_t sub_220D99130()
{
  return MEMORY[0x24BDF29F0]();
}

uint64_t sub_220D9913C()
{
  return MEMORY[0x24BDF2B40]();
}

uint64_t sub_220D99148()
{
  return MEMORY[0x24BDF2C68]();
}

uint64_t sub_220D99154()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_220D99160()
{
  return MEMORY[0x24BDF3060]();
}

uint64_t sub_220D9916C()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_220D99178()
{
  return MEMORY[0x24BDF3380]();
}

uint64_t sub_220D99184()
{
  return MEMORY[0x24BDF3470]();
}

uint64_t sub_220D99190()
{
  return MEMORY[0x24BDF35B0]();
}

uint64_t sub_220D9919C()
{
  return MEMORY[0x24BDF37A8]();
}

uint64_t sub_220D991A8()
{
  return MEMORY[0x24BDF3868]();
}

uint64_t sub_220D991B4()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_220D991C0()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_220D991CC()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_220D991D8()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_220D991E4()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_220D991F0()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_220D991FC()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_220D99208()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_220D99214()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_220D99220()
{
  return MEMORY[0x24BDF4050]();
}

uint64_t sub_220D9922C()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_220D99238()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_220D99244()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_220D99250()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_220D9925C()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_220D99268()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_220D99274()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_220D99280()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_220D9928C()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_220D99298()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_220D992A4()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_220D992B0()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_220D992BC()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_220D992C8()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_220D992D4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_220D992E0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_220D992EC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_220D992F8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_220D99304()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_220D99310()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_220D9931C()
{
  return MEMORY[0x24BE7BA00]();
}

uint64_t sub_220D99328()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_220D99334()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_220D99340()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_220D9934C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_220D99358()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_220D99364()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_220D99370()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_220D9937C()
{
  return MEMORY[0x24BE7BA10]();
}

uint64_t sub_220D99388()
{
  return MEMORY[0x24BE7BA18]();
}

uint64_t sub_220D99394()
{
  return MEMORY[0x24BE7BA20]();
}

uint64_t sub_220D993A0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_220D993AC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_220D993B8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_220D993C4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_220D993D0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_220D993DC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_220D993E8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_220D993F4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_220D99400()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_220D9940C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_220D99418()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_220D99424()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_220D99430()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_220D9943C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_220D99448()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_220D99454()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_220D99460()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_220D9946C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_220D99478()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_220D99484()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_220D99490()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_220D9949C()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_220D994A8()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_220D994B4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_220D994C0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_220D994CC()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_220D994D8()
{
  return MEMORY[0x24BDC7B18]();
}

uint64_t sub_220D994E4()
{
  return MEMORY[0x24BDC7B30]();
}

uint64_t sub_220D994F0()
{
  return MEMORY[0x24BDC7B48]();
}

uint64_t sub_220D994FC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_220D99508()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_220D99514()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_220D99520()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_220D9952C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_220D99538()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_220D99544()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_220D99550()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_220D9955C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_220D99568()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_220D99574()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_220D99580()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_220D9958C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_220D99598()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_220D995A4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_220D995B0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_220D995BC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_220D995C8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_220D995D4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_220D995E0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_220D995EC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_220D995F8()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_220D99604()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_220D99610()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_220D9961C()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_220D99628()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_220D99634()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_220D99640()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_220D9964C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_220D99658()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_220D99664()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_220D99670()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_220D9967C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_220D99688()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_220D99694()
{
  return MEMORY[0x24BEE4A98]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

